From: atish.patra@wdc.com (Atish Patra)
Date: Thu, 5 Jul 2018 10:15:05 -0700
Subject: [RFC PATCH 2/2] riscv: Introduce per cpu based local timer
 interrupt
In-Reply-To: <20180705154235.GA31766@infradead.org>
References: <1530295283-191270-1-git-send-email-atish.patra@wdc.com>
 <1530295283-191270-3-git-send-email-atish.patra@wdc.com>
 <56682a4c-c83f-c10b-0979-330f92cb3ccf@arm.com>
 <028fb362-0f4e-25b5-b707-7cc3653cbc05@wdc.com>
 <5c65bc1b-a64c-e93c-84e6-5a576617f64f@arm.com>
 <aeb8586e-8732-8d86-8750-b66807cbd601@wdc.com>
 <3ed55348-214c-e50b-f6b0-b425aa3e4706@arm.com>
 <20180705154235.GA31766@infradead.org>
Message-ID: <f4e95cdd-e52c-a43b-b837-cda627bb8f5c@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 7/5/18 8:42 AM, hch at infradead.org wrote:
> On Thu, Jul 05, 2018 at 08:48:23AM +0100, Marc Zyngier wrote:
>>>> It looks like the issue might well be with the way the interrupt
>>>> controller handles those (I suspect it uses a domain per CPU for the
>>>> local interrupts, so the whole concept breaks down badly).
>>>>
>>>
>>> We have different interrupt number(Linux IRQ number) because of per cpu
>>> based interrupt controller called as Hart Level Interrupt Controller
>>> (HLIC). Some more details are on this patch.
>>>
>>> https://lkml.org/lkml/2018/6/22/914
>>>
>>> Thus, each HLIC registers it's own irq domain. Each timer interrupt in
>>> DT defines that CPU's HLIC as it's interrupt parent. Here is an example
>>> of DT.
> 
> Btw, for the next iteration of the serie I really think it needs to be
> against mainline and include the heary level irqchip driver.  Basing
> against an unknown unknown in some riscv tree makes reviews confusing,
> and we also really need to get riscv irqs and timers upstream ASAP, so
> we need to drive these together.
> 

Agreed. I will resubmit the v2 either with palmer's base patch set or 
after the base IRQ patches are accepted mainline (whatever makes things 
move faster).

>> This is not how percpu_devid interrupts are supposed to be used. The
>> expected use case is that you have a single domain, and that the same
>> Linux irq spans all the CPUs. On ARM, we declare a *single* timer that
>> is connected to a *single* interrupt controller, and the distribution is
>> completely implicit. That's what percpu_devid interrupts are for.
>>
>> Here, you have discrete timers, discrete irqchip, and thus individual
>> domains. You might as well keep everything as non-percpu interrupts with
>> a fixed affinity, assuming each HLIC is reachable from any CPU (which
>> cannot universally work on ARM).
> 
> The hart level interrupt controller is based around RISC-V control
> registers, which per defintion are CPU local.  So you can't touch them
> at all from other cores and any access of the remote 'irqchip' needs
> and IPI.
> 
> I'm not an irqchip expert, but sometimes I really wonder if the irqchip
> framework really is the right abstraction for this.
> 

I will let palmer to comment on the rationale behind abstracting control 
registers as an irqchip i.e. HLIC.


Regards,
Atish
