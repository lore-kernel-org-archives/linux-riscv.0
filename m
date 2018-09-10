From: anup@brainfault.org (Anup Patel)
Date: Mon, 10 Sep 2018 19:59:15 +0530
Subject: [PATCH v2 3/5] irqchip: RISC-V Local Interrupt Controller Driver
In-Reply-To: <20180910134915.GB30774@infradead.org>
References: <20180906123651.28500-1-anup@brainfault.org>
 <20180906123651.28500-4-anup@brainfault.org>
 <20180906140628.GA10580@infradead.org>
 <alpine.DEB.2.21.1809081241310.1402@nanos.tec.linutronix.de>
 <20180910132924.GA6987@infradead.org>
 <alpine.DEB.2.21.1809101533330.1292@nanos.tec.linutronix.de>
 <alpine.DEB.2.21.1809101536410.1292@nanos.tec.linutronix.de>
 <20180910133902.GB21593@infradead.org>
 <alpine.DEB.2.21.1809101544560.1292@nanos.tec.linutronix.de>
 <20180910134915.GB30774@infradead.org>
Message-ID: <CAAhSdy1be_ibiowifBdgBZjbHuFU=CR4rZXQDwQghVYkex5bMg@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Sep 10, 2018 at 7:19 PM, Christoph Hellwig <hch@infradead.org> wrote:
> On Mon, Sep 10, 2018 at 03:45:42PM +0200, Thomas Gleixner wrote:
>> > He has an irqchip that is called from the RISC-V exception handler
>> > when the interrupt flag is set in scause and then dispatches to one
>> > of:  IPI, timer, actual irqchip.
>>
>> So the per cpu timer is the only per cpu interrupt and that thing is used
>> unconditionally, right?
>
> Yes.  external is chained and IPI is still handled explicitly.

On riscv64, there are 64 local interrupts (i.e. per-CPU interrupts).

Three of these local interrupts have clearly defined use:
1. Software interrupt (inter-processor interrupt)
2. External interrupt (interrupt from PLIC)
3. Timer interrupt (interrupt from per-CPU timer)

Other local interrupts are available for future use.

Taking inspiration from ARM world, I had give quite a few
examples how these RISC-V local interrupts can be used
for other purposes:
1. per-CPU interrupt for per-HART performance monitoring unit
2. interrupt controller virtualizaton extension can use per-CPU
interrupts for managing resources (just like ARM GICv2/v3 virt
extensions)
3. bus errors can be reported as per-CPU interrupts

Considering above, it is better to have a distinct irqchip and
irq_domain for all local interrupts (just like this patch).

Regards,
Anup
