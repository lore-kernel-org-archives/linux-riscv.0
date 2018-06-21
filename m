From: hch@infradead.org (Christoph Hellwig)
Date: Wed, 20 Jun 2018 23:30:14 -0700
Subject: an initial RISC-V Linux 4.18 tree
In-Reply-To: <mhng-5d12a1e7-6a25-4918-b086-41adda73d00b@palmer-si-x1c4>
References: <20180619171444.GA10395@infradead.org>
 <mhng-5d12a1e7-6a25-4918-b086-41adda73d00b@palmer-si-x1c4>
Message-ID: <20180621063014.GA19319@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Jun 20, 2018 at 10:59:59AM -0700, Palmer Dabbelt wrote:
> Thanks.  Unfortunately I think some of these aren't actually ready to go,
> which is why they've been blocked for a bit:
> 
> * d0789843f663 (irqchip: RISC-V Local Interrupt Controller Driver): This
> still  calls riscv_*_interrupt(), which we need to refactor to live behind a
> more  generic interface.

I don't really think that is a problem.  Especially in the irq path
I'd rather avoid indirections than spuriously adding them.

> * 8f9146865931 ("irqchip: New RISC-V PLIC Driver"): Aside from the memory
> map  questions you mentioned, there's also some question as to what IRQ
> handling  flow we should use and how to properly register interrupts for
> harts that are  not yet alive.

Is this an urgen problem?

> * 5b6b2ec0ed9c ("clocksource: new RISC-V SBI timer driver"): This still uses
> riscv_timebase, which isn't a sane interface.

It's not really too bad.  Yes, based on some of your work it should be
per-hart, but that is something that can be easily fixed up.

> * 3aa32277ef89 ("base: fix order of OF initialization"): IIRC this was
> supposed  to be solved in some other way, but I've managed to forget exactly
> what the  comments were.
> 
> It's possible I'm too worried about decoupling the drivers from the arch
> code.  If that's the case then I don't mind submitting these patches now, as
> at least we'll be able to have everything in master.

These aren't really drivers, but they are arch code, so I really don't
think they should be decoupled for decouplings sake.

So if you have an update for the PLIC memory map I'd really like to
start submitting them so that we have an actually working RISC-V port
upstream.

Btw, the early console code doesn't seem to have any further
dependencies, any chance you could just send that on to Linus at the
next opportunity?

> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
---end quoted text---
