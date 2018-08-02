From: tglx@linutronix.de (Thomas Gleixner)
Date: Thu, 2 Aug 2018 11:44:50 +0200 (CEST)
Subject: [PATCH 3/6] irqchip: RISC-V Local Interrupt Controller Driver
In-Reply-To: <20180802094300.GA14127@lst.de>
References: <20180725093649.32332-1-hch@lst.de>
 <20180725093649.32332-4-hch@lst.de>
 <c3ccb953-cd75-4a37-636a-ca643602053a@arm.com>
 <20180725112457.GA24502@lst.de>
 <alpine.DEB.2.21.1808012049170.1835@nanos.tec.linutronix.de>
 <20180802073452.GA11693@lst.de>
 <alpine.DEB.2.21.1808021038260.2037@nanos.tec.linutronix.de>
 <20180802094300.GA14127@lst.de>
Message-ID: <alpine.DEB.2.21.1808021142350.2037@nanos.tec.linutronix.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, 2 Aug 2018, Christoph Hellwig wrote:
> On Thu, Aug 02, 2018 at 11:35:43AM +0200, Thomas Gleixner wrote:
> > So that's the low level per cpu interrupt/exception distribution mechanism,
> > i.e. a distinct per cpu 'vector' space with fixed functionality. It does
> > not make sense to actually handle that as an irq chip. It has absolutely no
> > relevance. The software interrupts are enabled when the CPU is started and
> > the external ones as well as they are gated by the PLIC.
> > 
> > The only thing which might need to access the enable register is the local
> > timer interrupt. That really does not require an extra irq chip as the
> > enable/disable is really just at cpu up/down time and the magic happens on
> > the local CPU so no smp functional call hackery is required.
> > 
> > The PLIC is the beast which wants a proper irqdomain/irqchip
> > implementation.
> 
> And that is exactly what I've done in the repost.

Ok.

> I need to polish the DT binding a little more and will repost later today.

Lemme go through that reposted series quickly.

Thanks,

	tglx
