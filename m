From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 10 Sep 2018 23:22:54 -0700
Subject: [PATCH v2 3/5] irqchip: RISC-V Local Interrupt Controller Driver
In-Reply-To: <CAAhSdy2uAqOQohmx_HDgR1MbtWeOdc0MTFxToMK2Ak9-za1evg@mail.gmail.com>
References: <20180910134915.GB30774@infradead.org>
 <CAAhSdy1be_ibiowifBdgBZjbHuFU=CR4rZXQDwQghVYkex5bMg@mail.gmail.com>
 <alpine.DEB.2.21.1809101805110.1419@nanos.tec.linutronix.de>
 <20180910161143.GA1053@infradead.org>
 <CAAhSdy0kgsy0QFDQGYeVy6vxu8v7UwRGbdJC9Hhz+36TNYjyGA@mail.gmail.com>
 <20180910163936.GA18699@infradead.org>
 <CAAhSdy3AN4YTaAJCR50WMB8CgaoZNeT9uOZt2GH2O6i8Y6z6ew@mail.gmail.com>
 <alpine.DEB.2.21.1809102133240.1419@nanos.tec.linutronix.de>
 <20180910221902.GB7368@infradead.org>
 <CAAhSdy2uAqOQohmx_HDgR1MbtWeOdc0MTFxToMK2Ak9-za1evg@mail.gmail.com>
Message-ID: <20180911062254.GA23395@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Sep 11, 2018 at 09:27:45AM +0530, Anup Patel wrote:
> The list of currently defined RISC-V local interrupts will definitely grow
> based on my experience from ARM/ARM64 world.
> 
> Like Thomas mentioned, we will definitely end-up having separate
> irqchip and irq_domain for RISC-V local interrupts for flexibility. Better
> do it now with separate RISC-V INTC driver.

I disagree.  Just because arm made a mess of their irq handling there
is no need to repeat mistakes by paving their way.  IFF we end up
with a convoluted mess like arm in the end we'll need an irqchip,
and as your series has shown that is fairly easily doable.  But I'd
rather spend my effort on it not becoming a mess in the first place
rather than helping the mess.
