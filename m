From: marc.zyngier@arm.com (Marc Zyngier)
Date: Thu, 5 Jul 2018 08:48:23 +0100
Subject: [RFC PATCH 2/2] riscv: Introduce per cpu based local timer
 interrupt
In-Reply-To: <aeb8586e-8732-8d86-8750-b66807cbd601@wdc.com>
References: <1530295283-191270-1-git-send-email-atish.patra@wdc.com>
 <1530295283-191270-3-git-send-email-atish.patra@wdc.com>
 <56682a4c-c83f-c10b-0979-330f92cb3ccf@arm.com>
 <028fb362-0f4e-25b5-b707-7cc3653cbc05@wdc.com>
 <5c65bc1b-a64c-e93c-84e6-5a576617f64f@arm.com>
 <aeb8586e-8732-8d86-8750-b66807cbd601@wdc.com>
Message-ID: <3ed55348-214c-e50b-f6b0-b425aa3e4706@arm.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 05/07/18 02:55, Atish Patra wrote:
> On 7/4/18 1:25 AM, Marc Zyngier wrote:
>> On 03/07/18 19:28, Atish Patra wrote:
>>> On 7/2/18 1:32 AM, Marc Zyngier wrote:
>>>> On 29/06/18 19:01, Atish Patra wrote:
>>>>> Currently, ther timer interrupt handleri(riscv_timer_interrupt())
>>>>> is invoked directly from the arch handler. This
>>>>> approach creates interwinding of driver and architecture
>>>>> code which is not ideal.
>>>>>
>>>>> Register timer interrupt as a per cpu based irq behind
>>>>> generic Linux IRQ infrastructure. As the local timer node
>>>>> is directly connected to individual harts, HLIC acts as
>>>>> the parent irq domain.
>>>>>
>>>>> This patch requires necessary bbl changes that adds timer
>>>>> node in device tree which can be found here.
>>>>>
>>>>> https://github.com/riscv/riscv-pk/pull/112
>>>>>
>>>>> Before the patch
>>>>> ---------------------------------------------------
>>>>>        CPU1 CPU2 CPU3 CPU4
>>>>>    21: 12    8    6    5  riscv,plic0,c000000  53  eth0
>>>>>    37: 0     0    0    0  riscv,plic0,c000000  32  xilinx-pcie
>>>>>    43: 0     0    0    0  riscv,plic0,c000000   4  10010000.serial
>>>>>    44: 0     0    0    0  riscv,plic0,c000000   5  10011000.serial
>>>>>    45: 0     0    0    0  riscv,plic0,c000000  51  10040000.spi
>>>>>    46: 0     0    0    0  riscv,plic0,c000000  52  10041000.spi
>>>>>    47: 25    1    26   50  riscv,plic0,c000000   6  10050000.spi
>>>>>
>>>>> After the patch
>>>>> ---------------------------------------------------
>>>>>         CPU1 CPU2 CPU3 CPU4
>>>>>     5:  271   0    0    0    riscv,cpu_intc,1   5  local_timer
>>>>>     6:  0     307  0    0    riscv,cpu_intc,2   5  local_timer
>>>>>     7:  0     0    303  0    riscv,cpu_intc,3   5  local_timer
>>>>>     8:  0     0    0    223  riscv,cpu_intc,4   5  local_timer
>>>>>    47:  337   489  389  35   riscv,plic0,c000000   4  10010000.serial
>>>>>    48:  0     0    0    0    riscv,plic0,c000000   5  10011000.serial
>>>>>    49:  0     0    0    0    riscv,plic0,c000000  51  10040000.spi
>>>>>    50:  0     0    0    0    riscv,plic0,c000000  52  10041000.spi
>>>>>    51:  2     14   47   39   riscv,plic0,c000000   6  10050000.spi
>>>>>
>>>>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>>>>> ---
>>>>>    arch/riscv/include/asm/irq.h      |  2 --
>>>>>    arch/riscv/kernel/time.c          | 21 --------------
>>>>>    drivers/clocksource/riscv_timer.c | 61 ++++++++++++++++++++++++++++++++++++---
>>>>>    drivers/irqchip/irq-riscv-intc.c  | 11 ++++---
>>>>>    4 files changed, 64 insertions(+), 31 deletions(-)
>>>>>
>>>>> diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
>>>>> index 4dee9d4..2d692d0 100644
>>>>> --- a/arch/riscv/include/asm/irq.h
>>>>> +++ b/arch/riscv/include/asm/irq.h
>>>>> @@ -21,8 +21,6 @@
>>>>>    #define INTERRUPT_CAUSE_TIMER       5
>>>>>    #define INTERRUPT_CAUSE_EXTERNAL    9
>>>>>    
>>>>> -void riscv_timer_interrupt(void);
>>>>> -
>>>>>    #include <asm-generic/irq.h>
>>>>>    
>>>>>    #endif /* _ASM_RISCV_IRQ_H */
>>>>> diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
>>>>> index 94e220e..fbdfec5 100644
>>>>> --- a/arch/riscv/kernel/time.c
>>>>> +++ b/arch/riscv/kernel/time.c
>>>>> @@ -24,27 +24,6 @@
>>>>>    
>>>>>    unsigned long riscv_timebase;
>>>>>    
>>>>> -DECLARE_PER_CPU(struct clock_event_device, riscv_clock_event);
>>>>> -
>>>>> -void riscv_timer_interrupt(void)
>>>>> -{
>>>>> -#ifdef CONFIG_RISCV_TIMER
>>>>> -	/*
>>>>> -	 * FIXME: This needs to be cleaned up along with the rest of the IRQ
>>>>> -	 * handling cleanup.  See irq.c for more details.
>>>>> -	 */
>>>>> -	struct clock_event_device *evdev = this_cpu_ptr(&riscv_clock_event);
>>>>> -
>>>>> -	/*
>>>>> -	 * There are no direct SBI calls to clear pending timer interrupt bit.
>>>>> -	 * Disable timer interrupt to ignore pending interrupt until next
>>>>> -	 * interrupt.
>>>>> -	 */
>>>>> -	csr_clear(sie, SIE_STIE);
>>>>> -	evdev->event_handler(evdev);
>>>>> -#endif
>>>>> -}
>>>>> -
>>>>>    static long __init timebase_frequency(void)
>>>>>    {
>>>>>    	struct device_node *cpu;
>>>>> diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/riscv_timer.c
>>>>> index f4147db..a968a69 100644
>>>>> --- a/drivers/clocksource/riscv_timer.c
>>>>> +++ b/drivers/clocksource/riscv_timer.c
>>>>> @@ -15,9 +15,12 @@
>>>>>    #include <linux/clocksource.h>
>>>>>    #include <linux/clockchips.h>
>>>>>    #include <linux/delay.h>
>>>>> +#include <linux/interrupt.h>
>>>>>    #include <linux/timer_riscv.h>
>>>>>    #include <linux/sched_clock.h>
>>>>>    #include <linux/cpu.h>
>>>>> +#include <linux/of.h>
>>>>> +#include <linux/of_irq.h>
>>>>>    #include <asm/sbi.h>
>>>>>    
>>>>>    #define MINDELTA 100
>>>>> @@ -73,6 +76,23 @@ DEFINE_PER_CPU(struct clocksource, riscv_clocksource) = {
>>>>>    	.read = rdtime,
>>>>>    };
>>>>>    
>>>>> +static irqreturn_t riscv_timer_interrupt(int irq, void *dev_id)
>>>>> +{
>>>>> +	struct clock_event_device *evdev = dev_id;
>>>>> +#ifdef CONFIG_RISCV_TIMER
>>>>
>>>> Why the #ifdef? It is always selected at the architecture level.
>>>>
>>>
>>> Correct. It was present in the existing code.
>>> I will remove it.
>>>
>>>
>>>>> +
>>>>> +	/*
>>>>> +	 * There are no direct SBI calls to clear pending timer interrupt bit.
>>>>> +	 * Disable timer interrupt to ignore pending interrupt until next
>>>>> +	 * interrupt.
>>>>> +	 */
>>>>> +	csr_clear(sie, SIE_STIE);
>>>>> +	evdev->event_handler(evdev);
>>>>> +#endif
>>>>> +	return IRQ_HANDLED;
>>>>> +}
>>>>> +
>>>>> +
>>>>>    static int hart_of_timer(struct device_node *dev)
>>>>>    {
>>>>>    	u32 hart;
>>>>> @@ -100,14 +120,17 @@ static int timer_riscv_starting_cpu(unsigned int cpu)
>>>>>    	clockevents_config_and_register(ce, riscv_timebase, MINDELTA, MAXDELTA);
>>>>>    	/* Enable timer interrupt for this cpu */
>>>>>    	csr_set(sie, SIE_STIE);
>>>>> +	enable_percpu_irq(ce->irq, IRQ_TYPE_NONE);
>>>>>    
>>>>>    	return 0;
>>>>>    }
>>>>>    
>>>>>    static int timer_riscv_dying_cpu(unsigned int cpu)
>>>>>    {
>>>>> +	struct clock_event_device *ce = per_cpu_ptr(&riscv_clock_event, cpu);
>>>>>    	/* Disable timer interrupt for this cpu */
>>>>>    	csr_clear(sie, SIE_STIE);
>>>>> +	disable_percpu_irq(ce->irq);
>>>>>    
>>>>>    	return 0;
>>>>>    }
>>>>> @@ -115,9 +138,36 @@ static int timer_riscv_dying_cpu(unsigned int cpu)
>>>>>    static int __init timer_riscv_init_dt(struct device_node *n)
>>>>>    {
>>>>>    	int err = 0;
>>>>> -	int cpu_id = hart_of_timer(n);
>>>>> -	struct clocksource *cs = per_cpu_ptr(&riscv_clocksource, cpu_id);
>>>>> +	int cpu_id, timer_int;
>>>>> +	struct device_node *parent;
>>>>> +	struct clocksource *cs;
>>>>> +	struct clock_event_device *ce;
>>>>> +
>>>>> +	timer_int = irq_of_parse_and_map(n, 0);
>>>>> +	if (!timer_int) {
>>>>> +		pr_err("Unable to find local timer irq\n");
>>>>> +		return -EINVAL;
>>>>> +	}
>>>>>    
>>>>> +	parent = of_get_parent(n);
>>>>> +	if (!parent) {
>>>>> +		pr_err("Parent of timer node doesn't exist\n");
>>>>> +		return -EINVAL;
>>>>> +	}
>>>>> +	cpu_id = hart_of_timer(parent);
>>>>> +
>>>>> +	cs = per_cpu_ptr(&riscv_clocksource, cpu_id);
>>>>> +	ce = per_cpu_ptr(&riscv_clock_event, cpu_id);
>>>>> +	ce->irq = timer_int;
>>>>> +
>>>>> +	err = request_percpu_irq(ce->irq, riscv_timer_interrupt,
>>>>> +				 "local_timer", &riscv_clock_event);
>>>>> +	if (err) {
>>>>> +		pr_err("local timer can't register for interrupt [%d] [%d]\n",
>>>>> +			timer_int, err);
>>>>> +		free_percpu_irq(ce->irq, ce);
>>>>> +		return err;
>>>>> +	}
>>>>>    	if (cpu_id == smp_processor_id()) {
>>>>>    		clocksource_register_hz(cs, riscv_timebase);
>>>>>    		sched_clock_register(timer_riscv_sched_read, 64, riscv_timebase);
>>>>> @@ -125,11 +175,14 @@ static int __init timer_riscv_init_dt(struct device_node *n)
>>>>>    		err = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
>>>>>    			 "clockevents/riscv/timer:starting",
>>>>>    			 timer_riscv_starting_cpu, timer_riscv_dying_cpu);
>>>>> -		if (err)
>>>>> +		if (err) {
>>>>>    			pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
>>>>>    			       err, cpu_id);
>>>>> +			free_percpu_irq(ce->irq, ce);
>>>>> +			return err;
>>>>> +		}
>>>>>    	}
>>>>>    	return err;
>>>>>    }
>>>>>    
>>>>> -TIMER_OF_DECLARE(riscv_timer, "riscv", timer_riscv_init_dt);
>>>>> +TIMER_OF_DECLARE(riscv_timer, "riscv,local-timer", timer_riscv_init_dt);
>>>>> diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
>>>>> index fec897d..fda174f 100644
>>>>> --- a/drivers/irqchip/irq-riscv-intc.c
>>>>> +++ b/drivers/irqchip/irq-riscv-intc.c
>>>>> @@ -75,9 +75,6 @@ void riscv_intc_irq(struct pt_regs *regs)
>>>>>    	 * device interrupts use the generic IRQ mechanisms.
>>>>>    	 */
>>>>>    	switch (cause) {
>>>>> -	case INTERRUPT_CAUSE_TIMER:
>>>>> -		riscv_timer_interrupt();
>>>>> -		break;
>>>>>    	case INTERRUPT_CAUSE_SOFTWARE:
>>>>>    		riscv_software_interrupt();
>>>>>    		break;
>>>>> @@ -96,7 +93,13 @@ static int riscv_irqdomain_map(struct irq_domain *d, unsigned int irq,
>>>>>    {
>>>>>    	struct riscv_irq_data *data = d->host_data;
>>>>>    
>>>>> -	irq_set_chip_and_handler(irq, &data->chip, handle_simple_irq);
>>>>> +	if (hwirq == INTERRUPT_CAUSE_TIMER) {
>>>>> +		irq_set_percpu_devid(irq);
>>>>
>>>> If you're making the interrupt a percpu_devid, why are you using it as a
>>>> per-cpu interrupt, and not a percpu_devid? That's just wrong.
>>>>
>>>
>>> I am not quite sure if I understand your point clearly. I tried to
>>> follow PPI interrupt code in ARM.
>>>
>>>> Making it a percpu_devid looks like the right thing to do (all the timer
>>>> interrupts share the same hwirq). Please fix the timer code accordingly.
>>>>
>>>
>>> I looked at the timer code in arm. Both global & arch timer uses per cpu
>>> interrupts by parsing DT using irq_of_parse_and_map().
>>>
>>> I might have missed something here. Can you please explain a bit more or
>>> point to me some existing code?
>>
>> There is clearly something wrong with the way interrupts are numbered:
>>
>>>>>         CPU1 CPU2 CPU3 CPU4
>>>>>     5:  271   0    0    0    riscv,cpu_intc,1   5  local_timer
>>>>>     6:  0     307  0    0    riscv,cpu_intc,2   5  local_timer
>>>>>     7:  0     0    303  0    riscv,cpu_intc,3   5  local_timer
>>>>>     8:  0     0    0    223  riscv,cpu_intc,4   5  local_timer
>>
>> On arm/arm64, we end-up with:
>>
>>   19:       4151       3859     GICv2  30 Level     arch_timer
>>
>> --> A single interrupt number common across all CPUs.
>>
>> It looks like the issue might well be with the way the interrupt
>> controller handles those (I suspect it uses a domain per CPU for the
>> local interrupts, so the whole concept breaks down badly).
>>
> 
> We have different interrupt number(Linux IRQ number) because of per cpu 
> based interrupt controller called as Hart Level Interrupt Controller 
> (HLIC). Some more details are on this patch.
> 
> https://lkml.org/lkml/2018/6/22/914
> 
> Thus, each HLIC registers it's own irq domain. Each timer interrupt in 
> DT defines that CPU's HLIC as it's interrupt parent. Here is an example 
> of DT.
> 
> 
> +	L3: cpus {
> +    		#address-cells = <1>;
> +    		..
> +		..
> +		L9: cpu at 0 {
> +      		..
> +		..
> +      			L10: interrupt-controller {
> +				..
> +				..
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +			}
> +		      	timer {
> +        		     interrupts = <5>;
> +        		     interrupt-parent = <&L10>;
> +        		     compatible = "riscv,local-timer";
> +      		       	}
> +		}
> 
> Is this design not acceptable or breaks something?

This is not how percpu_devid interrupts are supposed to be used. The
expected use case is that you have a single domain, and that the same
Linux irq spans all the CPUs. On ARM, we declare a *single* timer that
is connected to a *single* interrupt controller, and the distribution is
completely implicit. That's what percpu_devid interrupts are for.

Here, you have discrete timers, discrete irqchip, and thus individual
domains. You might as well keep everything as non-percpu interrupts with
a fixed affinity, assuming each HLIC is reachable from any CPU (which
cannot universally work on ARM).

Or you change the way you describe HLICs and timers, but that's a much
more ambitious endeavour, and the gain isn't obvious.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
