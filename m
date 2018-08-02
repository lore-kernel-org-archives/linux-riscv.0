From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 02 Aug 2018 14:53:59 -0700 (PDT)
Subject: [RFC PATCH 2/2] riscv: Introduce per cpu based local timer
 interrupt
In-Reply-To: <56682a4c-c83f-c10b-0979-330f92cb3ccf@arm.com>
Message-ID: <mhng-4779d9ad-4638-40e3-9e7b-58a29717b2d8@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, 02 Jul 2018 01:31:44 PDT (-0700), marc.zyngier at arm.com wrote:
> On 29/06/18 19:01, Atish Patra wrote:
>> Currently, ther timer interrupt handleri(riscv_timer_interrupt())
>> is invoked directly from the arch handler. This
>> approach creates interwinding of driver and architecture
>> code which is not ideal.
>>
>> Register timer interrupt as a per cpu based irq behind
>> generic Linux IRQ infrastructure. As the local timer node
>> is directly connected to individual harts, HLIC acts as
>> the parent irq domain.
>>
>> This patch requires necessary bbl changes that adds timer
>> node in device tree which can be found here.
>>
>> https://github.com/riscv/riscv-pk/pull/112
>>
>> Before the patch
>> ---------------------------------------------------
>>      CPU1 CPU2 CPU3 CPU4
>>  21: 12    8    6    5  riscv,plic0,c000000  53  eth0
>>  37: 0     0    0    0  riscv,plic0,c000000  32  xilinx-pcie
>>  43: 0     0    0    0  riscv,plic0,c000000   4  10010000.serial
>>  44: 0     0    0    0  riscv,plic0,c000000   5  10011000.serial
>>  45: 0     0    0    0  riscv,plic0,c000000  51  10040000.spi
>>  46: 0     0    0    0  riscv,plic0,c000000  52  10041000.spi
>>  47: 25    1    26   50  riscv,plic0,c000000   6  10050000.spi
>>
>> After the patch
>> ---------------------------------------------------
>>       CPU1 CPU2 CPU3 CPU4
>>   5:  271   0    0    0    riscv,cpu_intc,1   5  local_timer
>>   6:  0     307  0    0    riscv,cpu_intc,2   5  local_timer
>>   7:  0     0    303  0    riscv,cpu_intc,3   5  local_timer
>>   8:  0     0    0    223  riscv,cpu_intc,4   5  local_timer
>>  47:  337   489  389  35   riscv,plic0,c000000   4  10010000.serial
>>  48:  0     0    0    0    riscv,plic0,c000000   5  10011000.serial
>>  49:  0     0    0    0    riscv,plic0,c000000  51  10040000.spi
>>  50:  0     0    0    0    riscv,plic0,c000000  52  10041000.spi
>>  51:  2     14   47   39   riscv,plic0,c000000   6  10050000.spi
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> ---
>>  arch/riscv/include/asm/irq.h      |  2 --
>>  arch/riscv/kernel/time.c          | 21 --------------
>>  drivers/clocksource/riscv_timer.c | 61 ++++++++++++++++++++++++++++++++++++---
>>  drivers/irqchip/irq-riscv-intc.c  | 11 ++++---
>>  4 files changed, 64 insertions(+), 31 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
>> index 4dee9d4..2d692d0 100644
>> --- a/arch/riscv/include/asm/irq.h
>> +++ b/arch/riscv/include/asm/irq.h
>> @@ -21,8 +21,6 @@
>>  #define INTERRUPT_CAUSE_TIMER       5
>>  #define INTERRUPT_CAUSE_EXTERNAL    9
>>
>> -void riscv_timer_interrupt(void);
>> -
>>  #include <asm-generic/irq.h>
>>
>>  #endif /* _ASM_RISCV_IRQ_H */
>> diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
>> index 94e220e..fbdfec5 100644
>> --- a/arch/riscv/kernel/time.c
>> +++ b/arch/riscv/kernel/time.c
>> @@ -24,27 +24,6 @@
>>
>>  unsigned long riscv_timebase;
>>
>> -DECLARE_PER_CPU(struct clock_event_device, riscv_clock_event);
>> -
>> -void riscv_timer_interrupt(void)
>> -{
>> -#ifdef CONFIG_RISCV_TIMER
>> -	/*
>> -	 * FIXME: This needs to be cleaned up along with the rest of the IRQ
>> -	 * handling cleanup.  See irq.c for more details.
>> -	 */
>> -	struct clock_event_device *evdev = this_cpu_ptr(&riscv_clock_event);
>> -
>> -	/*
>> -	 * There are no direct SBI calls to clear pending timer interrupt bit.
>> -	 * Disable timer interrupt to ignore pending interrupt until next
>> -	 * interrupt.
>> -	 */
>> -	csr_clear(sie, SIE_STIE);
>> -	evdev->event_handler(evdev);
>> -#endif
>> -}
>> -
>>  static long __init timebase_frequency(void)
>>  {
>>  	struct device_node *cpu;
>> diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/riscv_timer.c
>> index f4147db..a968a69 100644
>> --- a/drivers/clocksource/riscv_timer.c
>> +++ b/drivers/clocksource/riscv_timer.c
>> @@ -15,9 +15,12 @@
>>  #include <linux/clocksource.h>
>>  #include <linux/clockchips.h>
>>  #include <linux/delay.h>
>> +#include <linux/interrupt.h>
>>  #include <linux/timer_riscv.h>
>>  #include <linux/sched_clock.h>
>>  #include <linux/cpu.h>
>> +#include <linux/of.h>
>> +#include <linux/of_irq.h>
>>  #include <asm/sbi.h>
>>
>>  #define MINDELTA 100
>> @@ -73,6 +76,23 @@ DEFINE_PER_CPU(struct clocksource, riscv_clocksource) = {
>>  	.read = rdtime,
>>  };
>>
>> +static irqreturn_t riscv_timer_interrupt(int irq, void *dev_id)
>> +{
>> +	struct clock_event_device *evdev = dev_id;
>> +#ifdef CONFIG_RISCV_TIMER
>
> Why the #ifdef? It is always selected at the architecture level.
>
>> +
>> +	/*
>> +	 * There are no direct SBI calls to clear pending timer interrupt bit.
>> +	 * Disable timer interrupt to ignore pending interrupt until next
>> +	 * interrupt.
>> +	 */
>> +	csr_clear(sie, SIE_STIE);
>> +	evdev->event_handler(evdev);
>> +#endif
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +
>>  static int hart_of_timer(struct device_node *dev)
>>  {
>>  	u32 hart;
>> @@ -100,14 +120,17 @@ static int timer_riscv_starting_cpu(unsigned int cpu)
>>  	clockevents_config_and_register(ce, riscv_timebase, MINDELTA, MAXDELTA);
>>  	/* Enable timer interrupt for this cpu */
>>  	csr_set(sie, SIE_STIE);
>> +	enable_percpu_irq(ce->irq, IRQ_TYPE_NONE);
>>
>>  	return 0;
>>  }
>>
>>  static int timer_riscv_dying_cpu(unsigned int cpu)
>>  {
>> +	struct clock_event_device *ce = per_cpu_ptr(&riscv_clock_event, cpu);
>>  	/* Disable timer interrupt for this cpu */
>>  	csr_clear(sie, SIE_STIE);
>> +	disable_percpu_irq(ce->irq);
>>
>>  	return 0;
>>  }
>> @@ -115,9 +138,36 @@ static int timer_riscv_dying_cpu(unsigned int cpu)
>>  static int __init timer_riscv_init_dt(struct device_node *n)
>>  {
>>  	int err = 0;
>> -	int cpu_id = hart_of_timer(n);
>> -	struct clocksource *cs = per_cpu_ptr(&riscv_clocksource, cpu_id);
>> +	int cpu_id, timer_int;
>> +	struct device_node *parent;
>> +	struct clocksource *cs;
>> +	struct clock_event_device *ce;
>> +
>> +	timer_int = irq_of_parse_and_map(n, 0);
>> +	if (!timer_int) {
>> +		pr_err("Unable to find local timer irq\n");
>> +		return -EINVAL;
>> +	}
>>
>> +	parent = of_get_parent(n);
>> +	if (!parent) {
>> +		pr_err("Parent of timer node doesn't exist\n");
>> +		return -EINVAL;
>> +	}
>> +	cpu_id = hart_of_timer(parent);
>> +
>> +	cs = per_cpu_ptr(&riscv_clocksource, cpu_id);
>> +	ce = per_cpu_ptr(&riscv_clock_event, cpu_id);
>> +	ce->irq = timer_int;
>> +
>> +	err = request_percpu_irq(ce->irq, riscv_timer_interrupt,
>> +				 "local_timer", &riscv_clock_event);
>> +	if (err) {
>> +		pr_err("local timer can't register for interrupt [%d] [%d]\n",
>> +			timer_int, err);
>> +		free_percpu_irq(ce->irq, ce);
>> +		return err;
>> +	}
>>  	if (cpu_id == smp_processor_id()) {
>>  		clocksource_register_hz(cs, riscv_timebase);
>>  		sched_clock_register(timer_riscv_sched_read, 64, riscv_timebase);
>> @@ -125,11 +175,14 @@ static int __init timer_riscv_init_dt(struct device_node *n)
>>  		err = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
>>  			 "clockevents/riscv/timer:starting",
>>  			 timer_riscv_starting_cpu, timer_riscv_dying_cpu);
>> -		if (err)
>> +		if (err) {
>>  			pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
>>  			       err, cpu_id);
>> +			free_percpu_irq(ce->irq, ce);
>> +			return err;
>> +		}
>>  	}
>>  	return err;
>>  }
>>
>> -TIMER_OF_DECLARE(riscv_timer, "riscv", timer_riscv_init_dt);
>> +TIMER_OF_DECLARE(riscv_timer, "riscv,local-timer", timer_riscv_init_dt);
>> diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
>> index fec897d..fda174f 100644
>> --- a/drivers/irqchip/irq-riscv-intc.c
>> +++ b/drivers/irqchip/irq-riscv-intc.c
>> @@ -75,9 +75,6 @@ void riscv_intc_irq(struct pt_regs *regs)
>>  	 * device interrupts use the generic IRQ mechanisms.
>>  	 */
>>  	switch (cause) {
>> -	case INTERRUPT_CAUSE_TIMER:
>> -		riscv_timer_interrupt();
>> -		break;
>>  	case INTERRUPT_CAUSE_SOFTWARE:
>>  		riscv_software_interrupt();
>>  		break;
>> @@ -96,7 +93,13 @@ static int riscv_irqdomain_map(struct irq_domain *d, unsigned int irq,
>>  {
>>  	struct riscv_irq_data *data = d->host_data;
>>
>> -	irq_set_chip_and_handler(irq, &data->chip, handle_simple_irq);
>> +	if (hwirq == INTERRUPT_CAUSE_TIMER) {
>> +		irq_set_percpu_devid(irq);
>
> If you're making the interrupt a percpu_devid, why are you using it as a
> per-cpu interrupt, and not a percpu_devid? That's just wrong.
>
> Making it a percpu_devid looks like the right thing to do (all the timer
> interrupts share the same hwirq). Please fix the timer code accordingly.

Christoph has a cleaned up version of this patch set that simplifies a lot of 
these issues.

Thanks for the feedback!

>
>> +		irq_set_chip_and_handler(irq, &data->chip,
>> +					 handle_percpu_devid_irq);
>> +		irq_set_status_flags(irq, IRQ_NOAUTOEN);
>> +	} else
>> +		irq_set_chip_and_handler(irq, &data->chip, handle_simple_irq);
>>  	irq_set_chip_data(irq, data);
>>  	irq_set_noprobe(irq);
>>  	irq_set_affinity(irq, cpumask_of(data->hart));
>>
>
> Thanks,
>
> 	M.
