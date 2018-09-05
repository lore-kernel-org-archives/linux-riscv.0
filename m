From: anup@brainfault.org (Anup Patel)
Date: Wed, 5 Sep 2018 11:39:01 +0530
Subject: [RFC PATCH 4/5] irqchip: RISC-V Local Interrupt Controller Driver
In-Reply-To: <20180904185755.GD25119@infradead.org>
References: <20180904124514.6290-1-anup@brainfault.org>
 <20180904124514.6290-5-anup@brainfault.org>
 <20180904185755.GD25119@infradead.org>
Message-ID: <CAAhSdy3-mM-zyYOvQBR+JsRTZGZWUF=4Y=0jTKhVMAYPxOfJ6Q@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Sep 5, 2018 at 12:27 AM, Christoph Hellwig <hch@infradead.org> wrote:
> On Tue, Sep 04, 2018 at 06:15:13PM +0530, Anup Patel wrote:
>> Few advantages of this new driver over previous one are:
>> 1. It registers all local interrupts as per-CPU interrupts
>
> Please explain why this is an advantage.

Previously submitted driver, registered separate irq_domain for
each CPU and local IRQs were registered as regular IRQs to IRQ
subsystem.
(Refer, https://www.spinics.net/lists/devicetree/msg241230.html)

The previously submitted driver had following sort-comings:
1. Required separate interrupt-controller DT node for each CPU
2. Wasted lot of IRQ numbers because each CPU will has its
own IRQ domain
3. irq_enable()/irq_disable() had to explicitly use smp_call_function_single()
to disable given IRQ on all CPUs

Instead of above, the new driver (this patch) registers only single
irq_domain common for each CPU and local IRQs are registered
as per-CPU IRQs to IRQ subsystem. Due to this we only need one
DT node for local interrupt controller and if multiple DT nodes are
present then we ignore them using atomic counter. We use same
IRQ number for local interrupts for all CPUs. Further, irq_enable()/
irq_disable() of per-CPU interrupts is handled internally by Linux
IRQ subsystem.

>
>> 2. We can develop drivers for devices with per-CPU local interrupts
>> without changing arch code or this driver
>
> Please explain why this is a good thing and not just a workaround for
> the fact that some moron decided they need non-standard interrupts
> and should only be done as a last resort.

Let me give you few examples of per-CPU interrupts from ARM world:

1. CPU PMU IRQs: Lot of ARM SoCs have PMU IRQ of a CPU mapped
as PPI (i.e. Per-CPU IRQ). This means PMU events on ARM generate
per-CPU IRQs

2. GICv2/GICv3 maintenance IRQs: The virtualization extensions in
GICv2/GICv3 help hypervisor inject virtual IRQs. The list registers using
which virtual IRQs are injected is limited resource and GICv2/GICv3
provides per-CPU maintenance IRQ to manage list registers. It is quite
possible that RISC-V SOC vendors will come-up with PLIC++ which
has virtualization extension requiring per-CPU IRQs.

3, MSI to local IRQs; The GICv3 has separate module called ITS which
implements a HW MSI controller. The GICv3 ITS translates MSI writes
from PCI devices to per-CPU interrupts called LPIs. It is quite possible
that RISC-V SOC vendors will come-up with PLIC++ which allows
mapping MSI writes to local per-CPU IRQ.

Apart from above, it is possible to have a CPU interconnect which
report bus errors of a CPU as per-CPU IRQs.

If you still think above examples are moronic then I cannot help
improve your understanding of per-CPU IRQs.

>
>> 3. It allows local interrupt controller DT node under each CPU DT node
>> as well as single system-wide DT node for local interrupt controller.
>
> Please explain why this is can't happen right now.

Currently, we don't have any local interrupt controller driver so
DT nodes for local interrupt controller are ignored.

The advantage point3 (above) is in-comparison to previously
submitted driver for RISC-V local interrupt controller.
(Refer, https://www.spinics.net/lists/devicetree/msg241230.html)

>
> Downsides are that it is a heck lot more code and introduces indirect
> calls in the interrupt fast path.

Without this patch IRQ handling flow is:
RISC-V entry.S --> do_IRQ() --> plic_handle_irq()

With this patch IRQ handling flow is:
RISC-V entry.S --> do_IRQ() --> riscv_intc_irq() --> plic_handle_irq()

I have an optimisation lined-up where RISC-V entry.S can
directly call handle_arch_irq (just like Linux ARM64). With
this optimisation IRQ handling flow will be:
RISC-V entry.S --> riscv_intc_irq() --> plic_handle_irq()

As you can see it is not "lot more code". In return, we get
to use per-CPU IRQs via Linux IRQ subsystem.

>
> So for now a clear NAK.
>

Again, you NAKed it too early without letting me provide
explanation.

Regards,
Anup
