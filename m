From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 10 Sep 2018 06:49:15 -0700
Subject: [PATCH v2 3/5] irqchip: RISC-V Local Interrupt Controller Driver
In-Reply-To: <alpine.DEB.2.21.1809101544560.1292@nanos.tec.linutronix.de>
References: <20180906123651.28500-1-anup@brainfault.org>
 <20180906123651.28500-4-anup@brainfault.org>
 <20180906140628.GA10580@infradead.org>
 <alpine.DEB.2.21.1809081241310.1402@nanos.tec.linutronix.de>
 <20180910132924.GA6987@infradead.org>
 <alpine.DEB.2.21.1809101533330.1292@nanos.tec.linutronix.de>
 <alpine.DEB.2.21.1809101536410.1292@nanos.tec.linutronix.de>
 <20180910133902.GB21593@infradead.org>
 <alpine.DEB.2.21.1809101544560.1292@nanos.tec.linutronix.de>
Message-ID: <20180910134915.GB30774@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Sep 10, 2018 at 03:45:42PM +0200, Thomas Gleixner wrote:
> > He has an irqchip that is called from the RISC-V exception handler
> > when the interrupt flag is set in scause and then dispatches to one
> > of:  IPI, timer, actual irqchip.
> 
> So the per cpu timer is the only per cpu interrupt and that thing is used
> unconditionally, right?

Yes.  external is chained and IPI is still handled explicitly.
