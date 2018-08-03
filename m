From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 02 Aug 2018 17:14:39 -0700 (PDT)
Subject: [RFC PATCH 2/2] riscv: Introduce per cpu based local timer
 interrupt
In-Reply-To: <f75795ac-9f13-83b1-b67d-248155e94bb6@arm.com>
Message-ID: <mhng-ad94c766-4d9f-4ad7-a5e0-15c39480c3ba@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, 05 Jul 2018 08:58:59 PDT (-0700), marc.zyngier at arm.com wrote:
> On 05/07/18 16:42, hch at infradead.org wrote:
>> On Thu, Jul 05, 2018 at 08:48:23AM +0100, Marc Zyngier wrote:
>>> Here, you have discrete timers, discrete irqchip, and thus individual
>>> domains. You might as well keep everything as non-percpu interrupts with
>>> a fixed affinity, assuming each HLIC is reachable from any CPU (which
>>> cannot universally work on ARM).
>>
>> The hart level interrupt controller is based around RISC-V control
>> registers, which per defintion are CPU local.  So you can't touch them
>> at all from other cores and any access of the remote 'irqchip' needs
>> and IPI.
>
> Then this is no different from what we have on ARM with GICv1/v2, where
> private interrupts are strictly private, and cannot be accessed from
> another CPU.
>
>> I'm not an irqchip expert, but sometimes I really wonder if the irqchip
>> framework really is the right abstraction for this.
> Well, it served us pretty well so far. Seems like RISC-V has decided to
> describe the HW in a subtly (and maybe pointlessly?) different way,
> rather than reusing the existing abstraction. It is not necessarily bad,
> but it just makes things more difficult.

I think a lot of this boils down to me not really knowing what I'm doing :).  
The device tree descriptions we provide are generated along with the hardware, 
so they tend to match the structure of the hardware.  In this case there's an 
interrupt widget inside each core, and the generation of that RTL triggers the 
generation of this device tree.  There's then a platform-level interrupt 
controller (which looks a lot more like the GIC) that triggers the generation 
of a global interrupt controller device tree node.  We do end up with a bunch 
of messiness this way, so I'm fine changing it -- we're essentially defining 
the RISC-V device tree standard here, and I consider that all up for change 
until we start writing down a platform specification to formalize it.

While I still haven't given it a proper look, I believe Christoph has a 
solution that meshes a bit better with how these things are generally done that 
was just sent out for review.

Thanks for the feedback, and sorry I'm so slow!
