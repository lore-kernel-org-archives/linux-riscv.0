From: hch@infradead.org (Christoph Hellwig)
Date: Wed, 5 Sep 2018 11:57:24 -0700
Subject: [RFC PATCH 3/5] RISC-V: Select useful GENERIC_IRQ kconfig options
In-Reply-To: <CAAhSdy3qUkDmV5deoy9x3sqdv8xTq37od6SzgF0hmN1JPThGgw@mail.gmail.com>
References: <20180904124514.6290-1-anup@brainfault.org>
 <20180904124514.6290-4-anup@brainfault.org>
 <20180904185629.GC25119@infradead.org>
 <CAAhSdy3qUkDmV5deoy9x3sqdv8xTq37od6SzgF0hmN1JPThGgw@mail.gmail.com>
Message-ID: <20180905185724.GB15741@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Sep 05, 2018 at 10:22:27AM +0530, Anup Patel wrote:
> I am sure we will see both Level and Edge triggered interrupts
> in RISC-V system. The MMIO device interrupts will be mostly
> Level triggered and PCI MSIs will be mapped as Edge triggered
> by MSI controller.
> 
> We should definitely select GENERIC_IRQ_SHOW_LEVEL
> so that nature of IRQ interrupt line is evident in /proc/interrupts.

Please settle the argument with Thomas and Marc on what the default
for this option should be - in the end it just shows another line
in procfs, and I see no reason for RISC-V to ever deviated from the
global Linux default here, whatever that default is.

> >> HANDLE_DOMAIN_IRQ
> >
> > We aren't using handle_domain_irq anywhere in RISC-V, no need to
> > build this.
> 
> The new RISC-V local interrupt controller driver introduced by
> this patchset uses handle_domain_irq().

So select it in the patch that needs it, not anywhere else.
