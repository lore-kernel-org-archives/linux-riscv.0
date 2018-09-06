From: anup@brainfault.org (Anup Patel)
Date: Thu, 6 Sep 2018 17:23:07 +0530
Subject: [RFC PATCH 4/5] irqchip: RISC-V Local Interrupt Controller Driver
In-Reply-To: <20180905185838.GC15741@infradead.org>
References: <20180904124514.6290-1-anup@brainfault.org>
 <20180904124514.6290-5-anup@brainfault.org>
 <20180904185755.GD25119@infradead.org>
 <CAAhSdy3-mM-zyYOvQBR+JsRTZGZWUF=4Y=0jTKhVMAYPxOfJ6Q@mail.gmail.com>
 <20180905185838.GC15741@infradead.org>
Message-ID: <CAAhSdy2B3RTYKTsm+HrJfsC3dP3vZyT0VYi80h3pDVUxDCONwA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Sep 6, 2018 at 12:28 AM, Christoph Hellwig <hch@infradead.org> wrote:
> On Wed, Sep 05, 2018 at 11:39:01AM +0530, Anup Patel wrote:
>> Previously submitted driver, registered separate irq_domain for
>> each CPU and local IRQs were registered as regular IRQs to IRQ
>> subsystem.
>> (Refer, https://www.spinics.net/lists/devicetree/msg241230.html)
>
> And we reject that driver approach for good reason and are now
> doing the architectualy low-level irq handling in common code
> without any need whatsover to duplicate information in the
> privileged spec in DT.

In other words, the whole idea of separate RISCV local interrupt
controller driver was dropped due duplicate information in privilege
spec DT ??

Anyway, I think we should certainly have RISCV local interrupt
controller driver to manage local IRQs using Linux IRQ
subsystem. This gives us future flexibility in having more
per-CPU IRQ without changing any arch/riscv code.

Based on ARM examples which I had provided, it is very
likely that we will see more per-CPU IRQs in future. Some of
these will be device IRQs and some will be CPU specific
per-CPU IRQs (such as bus error interrupts).

Regards,
Anup
