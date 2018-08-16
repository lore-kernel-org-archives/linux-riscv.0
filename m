From: anup@brainfault.org (Anup Patel)
Date: Thu, 16 Aug 2018 11:15:27 +0530
Subject: [RFC PATCH 2/5] RISC-V: Use Linux logical cpu number instead of
 hartid
In-Reply-To: <adf9579e-62e1-e778-10f0-5e55c5b48406@wdc.com>
References: <1534377377-70108-1-git-send-email-atish.patra@wdc.com>
 <1534377377-70108-3-git-send-email-atish.patra@wdc.com>
 <CAAhSdy0O7qid67J2pvyc3sFHsOPA-PFpiSKrHBB1tRDb678bAQ@mail.gmail.com>
 <adf9579e-62e1-e778-10f0-5e55c5b48406@wdc.com>
Message-ID: <CAAhSdy2WXSeg7eWM0Jj7bN6KN6KC+WHqetZTSx4ATrfEcRk6Bg@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Aug 16, 2018 at 10:53 AM, Atish Patra <atish.patra@wdc.com> wrote:
> On 8/15/18 9:24 PM, Anup Patel wrote:
>>
>> On Thu, Aug 16, 2018 at 5:26 AM, Atish Patra <atish.patra@wdc.com> wrote:
>>>
>>> Setup the cpu_logical_map during boot. Moreover, every SBI call
>>> and PLIC context are based on the physical hartid. Use the logical
>>> cpu to hartid mapping to pass correct hartid to respective functions.
>>>
>>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>>> ---
>>>   arch/riscv/include/asm/tlbflush.h | 17 +++++++++++++----
>>>   arch/riscv/kernel/cpu.c           |  4 +++-
>>>   arch/riscv/kernel/setup.c         | 10 ++++++++++
>>>   arch/riscv/kernel/smp.c           | 24 +++++++++++++++---------
>>>   arch/riscv/kernel/smpboot.c       | 30 ++++++++++++++++++------------
>>>   drivers/clocksource/riscv_timer.c | 12 ++++++++----
>>>   drivers/irqchip/irq-sifive-plic.c | 11 +++++++----
>>>   7 files changed, 74 insertions(+), 34 deletions(-)
>>>
>>> diff --git a/arch/riscv/include/asm/tlbflush.h
>>> b/arch/riscv/include/asm/tlbflush.h
>>> index 85c2d8ba..ecfd9b0e 100644
>>> --- a/arch/riscv/include/asm/tlbflush.h
>>> +++ b/arch/riscv/include/asm/tlbflush.h
>>> @@ -16,6 +16,7 @@
>>>   #define _ASM_RISCV_TLBFLUSH_H
>>>
>>>   #include <linux/mm_types.h>
>>> +#include <asm/smp.h>
>>>
>>>   /*
>>>    * Flush entire local TLB.  'sfence.vma' implicitly fences with the
>>> instruction
>>> @@ -49,13 +50,21 @@ static inline void flush_tlb_range(struct
>>> vm_area_struct *vma,
>>>
>>>   #include <asm/sbi.h>
>>>
>>> -#define flush_tlb_all() sbi_remote_sfence_vma(NULL, 0, -1)
>>> +static inline void remote_sfence_vma(struct cpumask *cmask, unsigned
>>> long start,
>>> +                                    unsigned long size)
>>> +{
>>> +       struct cpumask hmask;
>>> +
>>> +       cpuid_to_hartid_mask(cmask, &hmask);
>>> +       sbi_remote_sfence_vma(hmask.bits, start, size);
>>> +}
>>> +
>>> +#define flush_tlb_all() remote_sfence_vma(NULL, 0, -1)
>>>   #define flush_tlb_page(vma, addr) flush_tlb_range(vma, addr, 0)
>>>   #define flush_tlb_range(vma, start, end) \
>>> -       sbi_remote_sfence_vma(mm_cpumask((vma)->vm_mm)->bits, \
>>> -                             start, (end) - (start))
>>> +       remote_sfence_vma(mm_cpumask((vma)->vm_mm), start, (end) -
>>> (start))
>>>   #define flush_tlb_mm(mm) \
>>> -       sbi_remote_sfence_vma(mm_cpumask(mm)->bits, 0, -1)
>>> +       remote_sfence_vma(mm_cpumask(mm), 0, -1)
>>>
>>>   #endif /* CONFIG_SMP */
>>>
>>> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
>>> index ca6c81e5..f8a18ace 100644
>>> --- a/arch/riscv/kernel/cpu.c
>>> +++ b/arch/riscv/kernel/cpu.c
>>> @@ -14,6 +14,7 @@
>>>   #include <linux/init.h>
>>>   #include <linux/seq_file.h>
>>>   #include <linux/of.h>
>>> +#include <asm/smp.h>
>>>
>>>   /* Return -1 if not a valid hart */
>>>   int riscv_of_processor_hart(struct device_node *node)
>>> @@ -79,7 +80,8 @@ static void c_stop(struct seq_file *m, void *v)
>>>   static int c_show(struct seq_file *m, void *v)
>>>   {
>>>          unsigned long hart_id = (unsigned long)v - 1;
>>> -       struct device_node *node = of_get_cpu_node(hart_id, NULL);
>>> +       struct device_node *node =
>>> of_get_cpu_node(cpu_logical_map(hart_id),
>>> +                                                  NULL);
>>
>>
>> The hart_id is misleading name here. It should be cpu_id. Please replace
>> all instances of hart_id with cpu_id and where hard ID is to be displayed
>> use cpu_logical_map(cpu_id).
>>
> Correct. Thanks for catching it. I will fix it in v2.
>
>
>>>          const char *compat, *isa, *mmu;
>>>
>>>          seq_printf(m, "hart\t: %lu\n", hart_id);
>>> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
>>> index e21ed481..97b586f8 100644
>>> --- a/arch/riscv/kernel/setup.c
>>> +++ b/arch/riscv/kernel/setup.c
>>> @@ -84,6 +84,16 @@ atomic_t hart_lottery;
>>>
>>>   u64 __cpu_logical_map[NR_CPUS];
>>>
>>> +void __init smp_setup_processor_id(void)
>>> +{
>>> +       int cpu = smp_processor_id();
>>> +
>>> +       cpu_logical_map(0) = cpu;
>>
>>
>> I think this should be:
>> cpu_logical_map(cpu) = hart_id;
>>
>> Here hart_id for boot CPU will be value of a0 register passed at
>> boot-time.
>>
> I will change the variable name to hart_id. The assembly code in head.S have
> already stored hart id in thread info structure. So smp_processor_id() and
> hart id would be the same.
>
>

I guess this means that for boot CPU, cpuid == hartid

This is very confusing because other places I see CPU0 is the boot CPU.

I think assembly code in head.S should store 0 in thread info for boot CPU.

Regards,
Anup
