From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 17 Sep 2018 07:14:36 -0700
Subject: [PATCH v2 3/5] irqchip: RISC-V Local Interrupt Controller Driver
In-Reply-To: <CAAhSdy2PSLjrtmSbkJ4w-v-zWm2hjii3XL6HE5Pe7u3wz4BmZA@mail.gmail.com>
References: <alpine.DEB.2.21.1809101533330.1292@nanos.tec.linutronix.de>
 <alpine.DEB.2.21.1809101536410.1292@nanos.tec.linutronix.de>
 <20180910133902.GB21593@infradead.org>
 <alpine.DEB.2.21.1809101544560.1292@nanos.tec.linutronix.de>
 <20180910134915.GB30774@infradead.org>
 <CAAhSdy1be_ibiowifBdgBZjbHuFU=CR4rZXQDwQghVYkex5bMg@mail.gmail.com>
 <20180910161328.GA13171@infradead.org>
 <CAAhSdy2Y-XTZ12i5aV+SzraMZP1YQBhAArpER-YssPcBJNOPOA@mail.gmail.com>
 <20180910163543.GA13052@infradead.org>
 <CAAhSdy2PSLjrtmSbkJ4w-v-zWm2hjii3XL6HE5Pe7u3wz4BmZA@mail.gmail.com>
Message-ID: <20180917141436.GB2821@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Sep 10, 2018 at 10:08:58PM +0530, Anup Patel wrote:
> > They could in theory IFF someone actually get the use case through
> > the riscv privileged spec working group.
> 
> Their is no point in having each and every possible local interrupts
> defined by RISC-V spec because some of these will be CPU
> implementation specific in which case these local interrupts will
> be described in platform specific DT passed to Linux.

Again, to legally have implementation specific local interrupt types
you'll first need to convice the spec to change the status for those
fields from reserved to implementation specific.
