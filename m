From: tglx@linutronix.de (Thomas Gleixner)
Date: Mon, 10 Sep 2018 15:45:42 +0200 (CEST)
Subject: [PATCH v2 3/5] irqchip: RISC-V Local Interrupt Controller Driver
In-Reply-To: <20180910133902.GB21593@infradead.org>
References: <20180906123651.28500-1-anup@brainfault.org>
 <20180906123651.28500-4-anup@brainfault.org>
 <20180906140628.GA10580@infradead.org>
 <alpine.DEB.2.21.1809081241310.1402@nanos.tec.linutronix.de>
 <20180910132924.GA6987@infradead.org>
 <alpine.DEB.2.21.1809101533330.1292@nanos.tec.linutronix.de>
 <alpine.DEB.2.21.1809101536410.1292@nanos.tec.linutronix.de>
 <20180910133902.GB21593@infradead.org>
Message-ID: <alpine.DEB.2.21.1809101544560.1292@nanos.tec.linutronix.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, 10 Sep 2018, Christoph Hellwig wrote:
> On Mon, Sep 10, 2018 at 03:37:31PM +0200, Thomas Gleixner wrote:
> > > > Just a few weeks ago you said the contrary:
> > > > 
> > > > http://lists.infradead.org/pipermail/linux-riscv/2018-August/000943.html
> > > 
> > > Sigh. Yes. Now that you remind me. 
> > 
> > Just for clarification. I had the impression that Anup was trying to wire
> > up more than just the timer interrupt, but that doesn't seem to be the
> > case.
> 
> He has an irqchip that is called from the RISC-V exception handler
> when the interrupt flag is set in scause and then dispatches to one
> of:  IPI, timer, actual irqchip.

So the per cpu timer is the only per cpu interrupt and that thing is used
unconditionally, right?

Thanks,

	tglx
