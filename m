From: atish.patra@wdc.com (Atish Patra)
Date: Fri, 6 Jul 2018 11:00:06 -0700
Subject: [RFC PATCH 2/2] riscv: Introduce per cpu based local timer
 interrupt
In-Reply-To: <alpine.DEB.2.21.1807061127100.1664@nanos.tec.linutronix.de>
References: <1530295283-191270-1-git-send-email-atish.patra@wdc.com>
 <1530295283-191270-3-git-send-email-atish.patra@wdc.com>
 <56682a4c-c83f-c10b-0979-330f92cb3ccf@arm.com>
 <028fb362-0f4e-25b5-b707-7cc3653cbc05@wdc.com>
 <5c65bc1b-a64c-e93c-84e6-5a576617f64f@arm.com>
 <aeb8586e-8732-8d86-8750-b66807cbd601@wdc.com>
 <3ed55348-214c-e50b-f6b0-b425aa3e4706@arm.com>
 <20180705154235.GA31766@infradead.org>
 <f75795ac-9f13-83b1-b67d-248155e94bb6@arm.com>
 <20180705222211.GA24936@infradead.org>
 <alpine.DEB.2.21.1807061127100.1664@nanos.tec.linutronix.de>
Message-ID: <e5a647bd-7597-a9b0-70b9-759b9b03d479@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 7/6/18 2:42 AM, Thomas Gleixner wrote:
> On Thu, 5 Jul 2018, hch at infradead.org wrote:
>> On Thu, Jul 05, 2018 at 04:58:59PM +0100, Marc Zyngier wrote:
>>> Then this is no different from what we have on ARM with GICv1/v2, where
>>> private interrupts are strictly private, and cannot be accessed from
>>> another CPU.
>>
>> Ok.
>>
>>>> I'm not an irqchip expert, but sometimes I really wonder if the irqchip
>>>> framework really is the right abstraction for this.
>>> Well, it served us pretty well so far. Seems like RISC-V has decided to
>>> describe the HW in a subtly (and maybe pointlessly?) different way,
>>> rather than reusing the existing abstraction. It is not necessarily bad,
>>> but it just makes things more difficult.
>>
>> As said I'm no expert by any means.  The use for the plic controller
>> looks fine to me, but writing a driver around a few instructions to
>> manage a tiny amount of per-core interrupt state just looks like
>> overkill to me.
> 
> I don't think it's overkill. If you use the percpu interrupt infrastructure
> correctly then you have advantages:
> 
>   - The same hardware and Linux irq number is used on all CPUs, which makes a
>     lot of sense as the interrupts are strictly CPU local.
> 
>     That avoids having nr_percpu_irqs * nr_cpus interrupt numbers for those
>     local ones. You just have nr_percpu_irqs and be done with it.
> 
>     Just look at /proc/interrupts:
>     
>        CPU0    CPU1    CPU2    CPU3
>     1:  20      20      20      20   timer
> 
>     instead of:
> 
>        CPU0    CPU1    CPU2    CPU3
>     1:  20       0       0       0   timer
>     2:   0      21       0       0   timer
>     3:   0       0      22       0   timer
>     4:   0       0       0      23   timer
> 
>     While that's purely cosmetic, it also avoids to keep track on which
>     Linux irq number is on which CPU internally.
> 
>   - That also avoids having nr_cpus * nr_percpu_irqs device tree entries which
>     all describe exactly the same register set....
> 
> Vs. the current patch:
> 
I also think using percpu interrupts is definitely beneficial in the 
long run. Especially if we have local interrupts are connected apart 
from software and timer in future. It will avoid interrupt stats bloating.

Thanks all for reviewing the patch and the explanation.

Regards,
Atish
> Either it uses request_irq_percpu() and the underlying infrastructure
> correctly or not at all. If riscv people want to have the waste in both irq
> space and DT, it's their problem, but then they shall stick to the regular
> interrupt mechanisms and not abuse the percpu stuff.
> 
> Thanks,
> 
> 	tglx
> 
> 
