From: shorne@gmail.com (Stafford Horne)
Date: Sat, 27 Jan 2018 12:13:18 +0900
Subject: [PATCH v2 3/4] openrisc: Use the new MULTI_IRQ_HANDLER
In-Reply-To: <20180125074619.GC14162@infradead.org>
References: <20180125030756.21787-1-palmer@sifive.com>
 <20180125030756.21787-4-palmer@sifive.com>
 <20180125074619.GC14162@infradead.org>
Message-ID: <20180127031318.GA30895@lianli.shorne-pla.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Jan 24, 2018 at 11:46:19PM -0800, Christoph Hellwig wrote:
> On Wed, Jan 24, 2018 at 07:07:55PM -0800, Palmer Dabbelt wrote:
> > It appears that openrisc copied arm64's MULTI_IRQ_HANDLER code (which
> > came from arm).  I wanted to make this generic so I could use it in the
> > RISC-V port.  This patch converts the openrisc code to use the generic
> > version.
> 
> Note that openriscv overrides previous handle_arch_irq assignments.
> We'll need to know from the openrisc folks if that was intentional.
> 
> Otherwise this looks fine to me.

This looks fine to me too.  We only assign the handle_arch_irq one time.  I
think not protecting against overrides was an oversight in the original
implementation.

Acked-by: Stafford Horne <shorne@gmail.com>

-Stafford
