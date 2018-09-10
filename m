From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 10 Sep 2018 15:16:46 -0700
Subject: [PATCH v2 3/5] irqchip: RISC-V Local Interrupt Controller Driver
In-Reply-To: <CAAhSdy3AN4YTaAJCR50WMB8CgaoZNeT9uOZt2GH2O6i8Y6z6ew@mail.gmail.com>
References: <alpine.DEB.2.21.1809101536410.1292@nanos.tec.linutronix.de>
 <20180910133902.GB21593@infradead.org>
 <alpine.DEB.2.21.1809101544560.1292@nanos.tec.linutronix.de>
 <20180910134915.GB30774@infradead.org>
 <CAAhSdy1be_ibiowifBdgBZjbHuFU=CR4rZXQDwQghVYkex5bMg@mail.gmail.com>
 <alpine.DEB.2.21.1809101805110.1419@nanos.tec.linutronix.de>
 <20180910161143.GA1053@infradead.org>
 <CAAhSdy0kgsy0QFDQGYeVy6vxu8v7UwRGbdJC9Hhz+36TNYjyGA@mail.gmail.com>
 <20180910163936.GA18699@infradead.org>
 <CAAhSdy3AN4YTaAJCR50WMB8CgaoZNeT9uOZt2GH2O6i8Y6z6ew@mail.gmail.com>
Message-ID: <20180910221646.GA7368@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Sep 10, 2018 at 10:41:22PM +0530, Anup Patel wrote:
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

Reserved means reserved for future versions of the spec, not for vendor
specific bad ideas.
