From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 10 Sep 2018 15:19:02 -0700
Subject: [PATCH v2 3/5] irqchip: RISC-V Local Interrupt Controller Driver
In-Reply-To: <alpine.DEB.2.21.1809102133240.1419@nanos.tec.linutronix.de>
References: <20180910133902.GB21593@infradead.org>
 <alpine.DEB.2.21.1809101544560.1292@nanos.tec.linutronix.de>
 <20180910134915.GB30774@infradead.org>
 <CAAhSdy1be_ibiowifBdgBZjbHuFU=CR4rZXQDwQghVYkex5bMg@mail.gmail.com>
 <alpine.DEB.2.21.1809101805110.1419@nanos.tec.linutronix.de>
 <20180910161143.GA1053@infradead.org>
 <CAAhSdy0kgsy0QFDQGYeVy6vxu8v7UwRGbdJC9Hhz+36TNYjyGA@mail.gmail.com>
 <20180910163936.GA18699@infradead.org>
 <CAAhSdy3AN4YTaAJCR50WMB8CgaoZNeT9uOZt2GH2O6i8Y6z6ew@mail.gmail.com>
 <alpine.DEB.2.21.1809102133240.1419@nanos.tec.linutronix.de>
Message-ID: <20180910221902.GB7368@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Sep 10, 2018 at 09:37:59PM +0200, Thomas Gleixner wrote:
> Processor local interrupts really should be architected and there are
> really not that many of them.

And that is what they are.

> But well, RISC-V decided obvsiouly not to learn from mistakes made by
> others.

I don't think that is the case.  I think Atup misreads what reserved
means - if you look at section 2.3 of the RISC-V privileged spec
it clearly states that reserved fields are for future use and not
for vendor specific use.
