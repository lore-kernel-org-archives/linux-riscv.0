From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 01 Oct 2018 09:42:41 -0700 (PDT)
Subject: [PATCH v3] RISC-V: Show IPI stats
In-Reply-To: <20180929062605.12888-1-anup@brainfault.org>
Message-ID: <mhng-db76292c-f906-4cc7-abe6-de6dac888c78@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, 28 Sep 2018 23:26:05 PDT (-0700), anup at brainfault.org wrote:
> This patch provides arch_show_interrupts() implementation to
> show IPI stats via /proc/interrupts.
>
> Now the contents of /proc/interrupts" will look like below:
>            CPU0       CPU1       CPU2       CPU3
>   8:         17          7          6         14  SiFive PLIC   8  virtio0
>  10:         10         10          9         11  SiFive PLIC  10  ttyS0
> IPI0:       170        673        251         79  Rescheduling interrupts
> IPI1:         1         12         27          1  Function call interrupts
>
> Signed-off-by: Anup Patel <anup@brainfault.org>
>
> Changes since v2:
>  - Remove use of IPI_CALL_WAKEUP because it's being removed
>
> Changes since v1:
>  - Add stub inline show_ipi_stats() function for !CONFIG_SMP
>  - Make ipi_names[] dynamically sized at compile time
>  - Minor beautification of ipi_names[] using tabs

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

This is going in through Atish's patch set.

>
> ---
>  arch/riscv/include/asm/smp.h |  9 +++++++++
>  arch/riscv/kernel/irq.c      |  8 ++++++++
>  arch/riscv/kernel/smp.c      | 39 +++++++++++++++++++++++++++++-------
>  3 files changed, 49 insertions(+), 7 deletions(-)
>
> diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
> index fce312ce3516..5278ae8f1346 100644
> --- a/arch/riscv/include/asm/smp.h
> +++ b/arch/riscv/include/asm/smp.h
> @@ -25,8 +25,13 @@
>  extern unsigned long __cpuid_to_hardid_map[NR_CPUS];
>  #define cpuid_to_hardid_map(cpu)    __cpuid_to_hardid_map[cpu]
>
> +struct seq_file;
> +
>  #ifdef CONFIG_SMP
>
> +/* print IPI stats */
> +void show_ipi_stats(struct seq_file *p, int prec);
> +
>  /* SMP initialization hook for setup_arch */
>  void __init setup_smp(void);
>
> @@ -47,6 +52,10 @@ void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out);
>
>  #else
>
> +static inline void show_ipi_stats(struct seq_file *p, int prec)
> +{
> +}
> +
>  static inline int riscv_hartid_to_cpuid(int hartid)
>  {
>  	return 0;
> diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
> index ca4593317e45..48e6b7db83a1 100644
> --- a/arch/riscv/kernel/irq.c
> +++ b/arch/riscv/kernel/irq.c
> @@ -8,6 +8,8 @@
>  #include <linux/interrupt.h>
>  #include <linux/irqchip.h>
>  #include <linux/irqdomain.h>
> +#include <linux/seq_file.h>
> +#include <asm/smp.h>
>
>  /*
>   * Possible interrupt causes:
> @@ -24,6 +26,12 @@
>   */
>  #define INTERRUPT_CAUSE_FLAG	(1UL << (__riscv_xlen - 1))
>
> +int arch_show_interrupts(struct seq_file *p, int prec)
> +{
> +	show_ipi_stats(p, prec);
> +	return 0;
> +}
> +
>  asmlinkage void __irq_entry do_IRQ(struct pt_regs *regs)
>  {
>  	struct pt_regs *old_regs = set_irq_regs(regs);
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index 89d95866f562..686fa7a427ff 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -22,22 +22,24 @@
>  #include <linux/interrupt.h>
>  #include <linux/smp.h>
>  #include <linux/sched.h>
> +#include <linux/seq_file.h>
>
>  #include <asm/sbi.h>
>  #include <asm/tlbflush.h>
>  #include <asm/cacheflush.h>
>
> -/* A collection of single bit ipi messages.  */
> -static struct {
> -	unsigned long bits ____cacheline_aligned;
> -} ipi_data[NR_CPUS] __cacheline_aligned;
> -
>  enum ipi_message_type {
>  	IPI_RESCHEDULE,
>  	IPI_CALL_FUNC,
>  	IPI_MAX
>  };
>
> +/* A collection of single bit ipi messages.  */
> +static struct {
> +	unsigned long stats[IPI_MAX] ____cacheline_aligned;
> +	unsigned long bits ____cacheline_aligned;
> +} ipi_data[NR_CPUS] __cacheline_aligned;
> +
>  int riscv_hartid_to_cpuid(int hartid)
>  {
>  	int i = -1;
> @@ -67,6 +69,7 @@ int setup_profiling_timer(unsigned int multiplier)
>  void riscv_software_interrupt(void)
>  {
>  	unsigned long *pending_ipis = &ipi_data[smp_processor_id()].bits;
> +	unsigned long *stats = ipi_data[smp_processor_id()].stats;
>
>  	/* Clear pending IPI */
>  	csr_clear(sip, SIE_SSIE);
> @@ -81,11 +84,15 @@ void riscv_software_interrupt(void)
>  		if (ops == 0)
>  			return;
>
> -		if (ops & (1 << IPI_RESCHEDULE))
> +		if (ops & (1 << IPI_RESCHEDULE)) {
> +			stats[IPI_RESCHEDULE]++;
>  			scheduler_ipi();
> +		}
>
> -		if (ops & (1 << IPI_CALL_FUNC))
> +		if (ops & (1 << IPI_CALL_FUNC)) {
> +			stats[IPI_CALL_FUNC]++;
>  			generic_smp_call_function_interrupt();
> +		}
>
>  		BUG_ON((ops >> IPI_MAX) != 0);
>
> @@ -111,6 +118,24 @@ send_ipi_message(const struct cpumask *to_whom, enum ipi_message_type operation)
>  	sbi_send_ipi(cpumask_bits(&hartid_mask));
>  }
>
> +static const char *ipi_names[] = {
> +	[IPI_RESCHEDULE]	= "Rescheduling interrupts",
> +	[IPI_CALL_FUNC]		= "Function call interrupts",
> +};
> +
> +void show_ipi_stats(struct seq_file *p, int prec)
> +{
> +	unsigned int cpu, i;
> +
> +	for (i = 0; i < IPI_MAX; i++) {
> +		seq_printf(p, "%*s%u:%s", prec - 1, "IPI", i,
> +			   prec >= 4 ? " " : "");
> +		for_each_online_cpu(cpu)
> +			seq_printf(p, "%10lu ", ipi_data[cpu].stats[i]);
> +		seq_printf(p, " %s\n", ipi_names[i]);
> +	}
> +}
> +
>  void arch_send_call_function_ipi_mask(struct cpumask *mask)
>  {
>  	send_ipi_message(mask, IPI_CALL_FUNC);
