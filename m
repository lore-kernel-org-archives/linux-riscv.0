From: tglx@linutronix.de (Thomas Gleixner)
Date: Sat, 8 Sep 2018 12:46:35 +0200 (CEST)
Subject: [PATCH v2 3/5] irqchip: RISC-V Local Interrupt Controller Driver
In-Reply-To: <20180906140628.GA10580@infradead.org>
References: <20180906123651.28500-1-anup@brainfault.org>
 <20180906123651.28500-4-anup@brainfault.org>
 <20180906140628.GA10580@infradead.org>
Message-ID: <alpine.DEB.2.21.1809081241310.1402@nanos.tec.linutronix.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, 6 Sep 2018, Christoph Hellwig wrote:

> Just as before:  NAK to entirely pointless abstractions.  Please stop
> beating the dead horse.

I disagree. These interrupts very well fit into the percpu interupt
mechanics and that allows them to be handled by all the generic mechanisms
as any other interrupt.

The extra short cuts have their own set of problems and we really should
avoid them where ever we can. I cursed the direct vector mess x86 has more
than once in the past, but never had cycles to clean it up.

Thanks,

	tglx
