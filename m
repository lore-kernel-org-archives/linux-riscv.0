From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 25 Jan 2018 08:04:38 -0800 (PST)
Subject: [patches] Re: [PATCH v2 4/4] RISC-V: Move to the new generic IRQ
 handler
In-Reply-To: <20180125083153.GI13019@lianli.shorne-pla.net>
Message-ID: <mhng-c34a6b65-4341-4971-aacb-1f61c6b7f046@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, 25 Jan 2018 00:31:53 PST (-0800), shorne at gmail.com wrote:
> On Wed, Jan 24, 2018 at 07:07:56PM -0800, Palmer Dabbelt wrote:
>> The old mechanism for handling IRQs on RISC-V was pretty ugly: the arch
>> code looked at the Kconfig entry for our first-level irqchip driver and
>> called into it directly.
>>
>> This patch uses the new 0generic IRQ handling infastructure, which
>> essentially just deletes a bunch of code.  This does add an additional
>> load to the interrupt latency, but there's a lot of tuning left to be
>> done there on RISC-V so I think it's OK for now.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>> ---
>>  arch/riscv/Kconfig            |  1 +
>>  arch/riscv/include/asm/Kbuild |  1 +
>>  arch/riscv/kernel/entry.S     |  5 +++--
>>  arch/riscv/kernel/irq.c       | 13 -------------
>>  4 files changed, 5 insertions(+), 15 deletions(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 2c6adf12713a..e67f42178059 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -35,6 +35,7 @@ config RISCV
>>  	select THREAD_INFO_IN_TASK
>>  	select RISCV_IRQ_INTC
>>  	select RISCV_TIMER
>> +	select MULTI_IRQ_HANDLER
>>
>>  config MMU
>>  	def_bool y
>> diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
>> index 970460a0b492..e0d0fbe43ca2 100644
>> --- a/arch/riscv/include/asm/Kbuild
>> +++ b/arch/riscv/include/asm/Kbuild
>> @@ -16,6 +16,7 @@ generic-y += ftrace.h
>>  generic-y += futex.h
>>  generic-y += hardirq.h
>>  generic-y += hash.h
>> +generic-y += handle_irq.h
>>  generic-y += hw_irq.h
>>  generic-y += ioctl.h
>>  generic-y += ioctls.h
>> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>> index 7404ec222406..a79869151aea 100644
>> --- a/arch/riscv/kernel/entry.S
>> +++ b/arch/riscv/kernel/entry.S
>> @@ -166,8 +166,9 @@ ENTRY(handle_exception)
>>  	/* Handle interrupts */
>>  	slli a0, s4, 1
>>  	srli a0, a0, 1
>
> Hi Palmer,
>
> Do we need these shifts into a0?  I guess these were used when this was an arg
> to  do_IRQ, but no longer needed since you put pt_regs into a0 in the next
> instruction.

Thanks!

> Other than that it looks good, and thanks for looking at OpenRISC too.
>
> Acked-by: Stafford Horne <shorne@gmail.com>
>
>
>> -	move a1, sp /* pt_regs */
>> -	tail do_IRQ
>> +	move a0, sp /* pt_regs */
>> +	REG_L a1, handle_arch_irq
>> +	jr a1
>>  1:
>>  	/* Handle syscalls */
>>  	li t0, EXC_SYSCALL
>> diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
>> index 328718e8026e..b74cbfbce2d0 100644
>> --- a/arch/riscv/kernel/irq.c
>> +++ b/arch/riscv/kernel/irq.c
>> @@ -24,16 +24,3 @@ void __init init_IRQ(void)
>>  {
>>  	irqchip_init();
>>  }
>> -
>> -asmlinkage void __irq_entry do_IRQ(unsigned int cause, struct pt_regs *regs)
>> -{
>> -#ifdef CONFIG_RISCV_INTC
>> -	/*
>> -	 * FIXME: We don't want a direct call to riscv_intc_irq here.  The plan
>> -	 * is to put an IRQ domain here and let the interrupt controller
>> -	 * register with that, but I poked around the arm64 code a bit and
>> -	 * there might be a better way to do it (ie, something fully generic).
>> -	 */
>> -	riscv_intc_irq(cause, regs);
>> -#endif
>> -}
>> --
>> 2.13.6
>>
