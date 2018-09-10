From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 10 Sep 2018 06:35:49 -0700
Subject: [RFC PATCH 4/5] irqchip: RISC-V Local Interrupt Controller Driver
In-Reply-To: <CAAhSdy2B3RTYKTsm+HrJfsC3dP3vZyT0VYi80h3pDVUxDCONwA@mail.gmail.com>
References: <20180904124514.6290-1-anup@brainfault.org>
 <20180904124514.6290-5-anup@brainfault.org>
 <20180904185755.GD25119@infradead.org>
 <CAAhSdy3-mM-zyYOvQBR+JsRTZGZWUF=4Y=0jTKhVMAYPxOfJ6Q@mail.gmail.com>
 <20180905185838.GC15741@infradead.org>
 <CAAhSdy2B3RTYKTsm+HrJfsC3dP3vZyT0VYi80h3pDVUxDCONwA@mail.gmail.com>
Message-ID: <20180910133549.GA15730@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Sep 06, 2018 at 05:23:07PM +0530, Anup Patel wrote:
> > And we reject that driver approach for good reason and are now
> > doing the architectualy low-level irq handling in common code
> > without any need whatsover to duplicate information in the
> > privileged spec in DT.
> 
> In other words, the whole idea of separate RISCV local interrupt
> controller driver was dropped due duplicate information in privilege
> spec DT ??

No.  We came to the conflusion that a few registers on a cpu
that allow enabling/disabling local vs external vs timer intterupts
aren't worth writing an irqchip (or DT entries) for.
