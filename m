From: hch@infradead.org (Christoph Hellwig)
Date: Tue, 4 Sep 2018 11:56:29 -0700
Subject: [RFC PATCH 3/5] RISC-V: Select useful GENERIC_IRQ kconfig options
In-Reply-To: <20180904124514.6290-4-anup@brainfault.org>
References: <20180904124514.6290-1-anup@brainfault.org>
 <20180904124514.6290-4-anup@brainfault.org>
Message-ID: <20180904185629.GC25119@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Sep 04, 2018 at 06:15:12PM +0530, Anup Patel wrote:
> This patch selects following GENERIC_IRQ kconfig options:
> GENERIC_IRQ_MULTI_HANDLER

This is already selected by arch/riscv/Kconfig.

> GENERIC_IRQ_PROBE

This is something only used by ISA drivers.  Why would we want that
on RISC-V?

> GENERIC_IRQ_SHOW_LEVEL

We don't really have any special level triggerd irq handling in
RISC-V.  That being said this is trivial and I don't see why it
even is a Kconfig option.  Please have a discussion with Thomas
and Marc on why we have this option instead of a default.

> HANDLE_DOMAIN_IRQ

We aren't using handle_domain_irq anywhere in RISC-V, no need to
build this.
