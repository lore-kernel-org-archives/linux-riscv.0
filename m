From: anup@brainfault.org (Anup Patel)
Date: Thu, 16 Aug 2018 10:32:28 +0530
Subject: [RFC PATCH 3/5] RISC-V: Add cpu_operatios structure
In-Reply-To: <1534377377-70108-4-git-send-email-atish.patra@wdc.com>
References: <1534377377-70108-1-git-send-email-atish.patra@wdc.com>
 <1534377377-70108-4-git-send-email-atish.patra@wdc.com>
Message-ID: <CAAhSdy2TeNfjdzWPHtCwrorBu8c9v-u9Ro-eGMbzSwzapfwdjw@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Aug 16, 2018 at 5:26 AM, Atish Patra <atish.patra@wdc.com> wrote:
> Defining cpu_operations now helps adding cpu hotplug
> support in proper manner. Moreover, it provides flexibility
> in supporting other cpu enable/boot methods can be
> supported in future. This patch has been largely inspired from
> ARM64. However, a default boot method is defined for RISC-V unlike
> ARM64.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/include/asm/smp.h | 10 ++++++++++
>  arch/riscv/kernel/smp.c      |  8 ++++++++
>  arch/riscv/kernel/smpboot.c  | 34 ++++++++++++++++++++++++++++------
>  3 files changed, 46 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
> index 0763337b..2bb6e6c2 100644
> --- a/arch/riscv/include/asm/smp.h
> +++ b/arch/riscv/include/asm/smp.h
> @@ -28,6 +28,15 @@
>  extern u64 __cpu_logical_map[NR_CPUS];
>  #define cpu_logical_map(cpu)    __cpu_logical_map[cpu]
>
> +struct cpu_operations {
> +       const char      *name;
> +       int             (*cpu_init)(unsigned int);
> +       int             (*cpu_prepare)(unsigned int);
> +       int             (*cpu_boot)(unsigned int, struct task_struct *);
> +};
> +extern struct cpu_operations cpu_ops;
> +void smp_set_cpu_ops(const struct cpu_operations *cpu_ops);
> +
>  #ifdef CONFIG_SMP
>
>  /* SMP initialization hook for setup_arch */
> @@ -57,5 +66,6 @@ static inline void cpuid_to_hartid_mask(const struct cpumask *in,
>         cpumask_set_cpu(cpu_logical_map(0), out);
>  }
>
> +
>  #endif /* CONFIG_SMP */
>  #endif /* _ASM_RISCV_SMP_H */
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index 4ab70480..5de58ced 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -58,6 +58,14 @@ void cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out)
>         for_each_cpu(cpu, in)
>                 cpumask_set_cpu(cpu_logical_map(cpu), out);
>  }
> +struct cpu_operations cpu_ops __ro_after_init;
> +
> +void smp_set_cpu_ops(const struct cpu_operations *ops)
> +{
> +       if (ops)
> +               cpu_ops = *ops;
> +}
> +

Move both cpu_ops and smp_set_cpu_ops() to smpboot.c. This way
you will not require to make cpu_ops as global.

Further, I think cpu_ops should be a pointer and initial value should
be &default_ops.

Something like this:
struct cpu_operations *cpu_ops __ro_after_init = &default_ops;

>  /* Unsupported */
>  int setup_profiling_timer(unsigned int multiplier)
>  {
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 6ab2bb1b..045a1a45 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -30,6 +30,7 @@
>  #include <linux/irq.h>
>  #include <linux/of.h>
>  #include <linux/sched/task_stack.h>
> +#include <linux/smp.h>
>  #include <asm/irq.h>
>  #include <asm/mmu_context.h>
>  #include <asm/tlbflush.h>
> @@ -38,6 +39,7 @@
>
>  void *__cpu_up_stack_pointer[NR_CPUS];
>  void *__cpu_up_task_pointer[NR_CPUS];
> +struct cpu_operations default_ops;
>
>  void __init smp_prepare_boot_cpu(void)
>  {
> @@ -53,6 +55,7 @@ void __init setup_smp(void)
>         int hart, found_boot_cpu = 0;
>         int cpuid = 1;
>
> +       smp_set_cpu_ops(&default_ops);
>         while ((dn = of_find_node_by_type(dn, "cpu"))) {
>                 hart = riscv_of_processor_hart(dn);
>
> @@ -73,10 +76,8 @@ void __init setup_smp(void)
>         BUG_ON(!found_boot_cpu);
>  }
>
> -int __cpu_up(unsigned int cpu, struct task_struct *tidle)
> +int default_cpu_boot(unsigned int hartid, struct task_struct *tidle)
>  {
> -       int hartid = cpu_logical_map(cpu);
> -       tidle->thread_info.cpu = cpu;
>         /*
>          * On RISC-V systems, all harts boot on their own accord.  Our _start
>          * selects the first hart to boot the kernel and causes the remainder
> @@ -84,13 +85,28 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
>          * setup by that main hart.  Writing __cpu_up_stack_pointer signals to
>          * the spinning harts that they can continue the boot process.
>          */
> -       smp_mb();
> +
>         __cpu_up_stack_pointer[hartid] = task_stack_page(tidle) + THREAD_SIZE;
>         __cpu_up_task_pointer[hartid] = tidle;
> +       return 0;
> +}
> +
> +int __cpu_up(unsigned int cpu, struct task_struct *tidle)
> +{
> +       int err = -1;
> +       int hartid = cpu_logical_map(cpu);
>
> -       while (!cpu_online(cpu))
> -               cpu_relax();
> +       tidle->thread_info.cpu = cpu;
> +       smp_mb();
>
> +       if (cpu_ops.cpu_boot)
> +               err = cpu_ops.cpu_boot(hartid, tidle);
> +       if (!err) {
> +               while (!cpu_online(cpu))
> +                       cpu_relax();
> +       } else {
> +               pr_err("CPU %d [hartid %d]failed to boot\n", cpu, hartid);
> +       }
>         return 0;
>  }
>
> @@ -117,3 +133,9 @@ asmlinkage void __init smp_callin(void)
>         preempt_disable();
>         cpu_startup_entry(CPUHP_AP_ONLINE_IDLE);
>  }
> +
> +
> +struct cpu_operations default_ops = {
> +       .name           = "default",
> +       .cpu_boot       = default_cpu_boot,
> +};

I think having dedicated source file for default_ops makes more sense
so that we have a clear/simple reference implementation of cpu_operations.

Eventually, we might have one source file for each type of SMP enable
method.

Try to keep smpboot.c generic and independent of any cpu_operations.
What say?

Regards,
Anup
