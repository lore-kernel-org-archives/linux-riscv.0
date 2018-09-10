From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 10 Sep 2018 09:13:28 -0700
Subject: [PATCH v2 3/5] irqchip: RISC-V Local Interrupt Controller Driver
In-Reply-To: <CAAhSdy1be_ibiowifBdgBZjbHuFU=CR4rZXQDwQghVYkex5bMg@mail.gmail.com>
References: <20180906123651.28500-4-anup@brainfault.org>
 <20180906140628.GA10580@infradead.org>
 <alpine.DEB.2.21.1809081241310.1402@nanos.tec.linutronix.de>
 <20180910132924.GA6987@infradead.org>
 <alpine.DEB.2.21.1809101533330.1292@nanos.tec.linutronix.de>
 <alpine.DEB.2.21.1809101536410.1292@nanos.tec.linutronix.de>
 <20180910133902.GB21593@infradead.org>
 <alpine.DEB.2.21.1809101544560.1292@nanos.tec.linutronix.de>
 <20180910134915.GB30774@infradead.org>
 <CAAhSdy1be_ibiowifBdgBZjbHuFU=CR4rZXQDwQghVYkex5bMg@mail.gmail.com>
Message-ID: <20180910161328.GA13171@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Sep 10, 2018 at 07:59:15PM +0530, Anup Patel wrote:
> > Yes.  external is chained and IPI is still handled explicitly.
> 
> On riscv64, there are 64 local interrupts (i.e. per-CPU interrupts).

There aren't.  There are 9 right now, which are your three below:

> Three of these local interrupts have clearly defined use:
> 1. Software interrupt (inter-processor interrupt)
> 2. External interrupt (interrupt from PLIC)
> 3. Timer interrupt (interrupt from per-CPU timer)

multiplied by 3 for machine, supervisor, user.

> Other local interrupts are available for future use.

The others aren't even defined as other interrupts, but just reserved
fields.  And only one bit per privilege level would even fit into the
encoding scheme used right now.
