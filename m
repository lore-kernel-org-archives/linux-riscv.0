From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 10 Sep 2018 06:29:24 -0700
Subject: [PATCH v2 3/5] irqchip: RISC-V Local Interrupt Controller Driver
In-Reply-To: <alpine.DEB.2.21.1809081241310.1402@nanos.tec.linutronix.de>
References: <20180906123651.28500-1-anup@brainfault.org>
 <20180906123651.28500-4-anup@brainfault.org>
 <20180906140628.GA10580@infradead.org>
 <alpine.DEB.2.21.1809081241310.1402@nanos.tec.linutronix.de>
Message-ID: <20180910132924.GA6987@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sat, Sep 08, 2018 at 12:46:35PM +0200, Thomas Gleixner wrote:
> On Thu, 6 Sep 2018, Christoph Hellwig wrote:
> 
> > Just as before:  NAK to entirely pointless abstractions.  Please stop
> > beating the dead horse.
> 
> I disagree. These interrupts very well fit into the percpu interupt
> mechanics and that allows them to be handled by all the generic mechanisms
> as any other interrupt.

Just a few weeks ago you said the contrary:

http://lists.infradead.org/pipermail/linux-riscv/2018-August/000943.html
