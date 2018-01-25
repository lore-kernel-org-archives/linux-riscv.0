From: hch@infradead.org (Christoph Hellwig)
Date: Wed, 24 Jan 2018 23:46:19 -0800
Subject: [PATCH v2 3/4] openrisc: Use the new MULTI_IRQ_HANDLER
In-Reply-To: <20180125030756.21787-4-palmer@sifive.com>
References: <20180125030756.21787-1-palmer@sifive.com>
 <20180125030756.21787-4-palmer@sifive.com>
Message-ID: <20180125074619.GC14162@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Jan 24, 2018 at 07:07:55PM -0800, Palmer Dabbelt wrote:
> It appears that openrisc copied arm64's MULTI_IRQ_HANDLER code (which
> came from arm).  I wanted to make this generic so I could use it in the
> RISC-V port.  This patch converts the openrisc code to use the generic
> version.

Note that openriscv overrides previous handle_arch_irq assignments.
We'll need to know from the openrisc folks if that was intentional.

Otherwise this looks fine to me.
