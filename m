From: tglx@linutronix.de (Thomas Gleixner)
Date: Mon, 10 Sep 2018 21:37:59 +0200 (CEST)
Subject: [PATCH v2 3/5] irqchip: RISC-V Local Interrupt Controller Driver
In-Reply-To: <CAAhSdy3AN4YTaAJCR50WMB8CgaoZNeT9uOZt2GH2O6i8Y6z6ew@mail.gmail.com>
References: <20180910132924.GA6987@infradead.org>
 <alpine.DEB.2.21.1809101533330.1292@nanos.tec.linutronix.de>
 <alpine.DEB.2.21.1809101536410.1292@nanos.tec.linutronix.de>
 <20180910133902.GB21593@infradead.org>
 <alpine.DEB.2.21.1809101544560.1292@nanos.tec.linutronix.de>
 <20180910134915.GB30774@infradead.org>
 <CAAhSdy1be_ibiowifBdgBZjbHuFU=CR4rZXQDwQghVYkex5bMg@mail.gmail.com>
 <alpine.DEB.2.21.1809101805110.1419@nanos.tec.linutronix.de>
 <20180910161143.GA1053@infradead.org>
 <CAAhSdy0kgsy0QFDQGYeVy6vxu8v7UwRGbdJC9Hhz+36TNYjyGA@mail.gmail.com>
 <20180910163936.GA18699@infradead.org>
 <CAAhSdy3AN4YTaAJCR50WMB8CgaoZNeT9uOZt2GH2O6i8Y6z6ew@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1809102133240.1419@nanos.tec.linutronix.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, 10 Sep 2018, Anup Patel wrote:
> On Mon, Sep 10, 2018 at 10:09 PM, Christoph Hellwig <hch@infradead.org> wrote:
> > On Mon, Sep 10, 2018 at 10:05:42PM +0530, Anup Patel wrote:
> >> I am quite sure RISC-V spec does not restrict the use of other
> >> local interrupts. Different CPU implementations can have their
> >> own local interrupts.
> >
> > Please take a look at sections 3.1.14 and 4.1.1 of the RISC-V privileged
> > spec 1.10.
> 
> RISC-V priv spec 1.10 defines the 9 bits in MIE and MIP registers and
> other bits are reserved.
> 
> The unused bits in MIP are WIRI (reserved write ignored and read ignored)
> and unused bits in MIE are WPRI (reserved write preserve values and
> read ignored).
> 
> The RISC-V priv spec 1.10 does not tell that unused reserved bits in
> MIE/MIP cannot be used for:
> 1. CPU implementation specific local interrupts
> 2. Per-CPU device interrupts.
> 
> The RISC-V priv spec 1.10 tries to only describe MIE/MIP bits which
> are mandatory on any RISC-V 1.10 compliant CPU but it possible to
> used other reserved bits for implementation specific local interrupts.

Processor local interrupts really should be architected and there are
really not that many of them.

But well, RISC-V decided obvsiouly not to learn from mistakes made by
others.

That said, if your cpu local interrupts are not architectural and cannot be
made software configured architectural, then you will end up sooner than
later with the need for an irqdomain in order to handle the implementer
specific crap.

Thanks,

	tglx
