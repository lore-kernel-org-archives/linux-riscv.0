From: anup@brainfault.org (Anup Patel)
Date: Mon, 12 Nov 2018 09:57:02 +0530
Subject: [PATCH 1/4] irqchip: sifive-plic: Pre-compute context hart base
 and enable base
In-Reply-To: <20181109084256.GA6508@infradead.org>
References: <20181022114517.22748-1-anup@brainfault.org>
 <20181022114517.22748-2-anup@brainfault.org>
 <20181109084256.GA6508@infradead.org>
Message-ID: <CAAhSdy1dYGShvtUEdDARw_8viC5P5MdMLBQOhe56nu6TMNgGaA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, Nov 9, 2018 at 2:12 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, Oct 22, 2018 at 05:15:14PM +0530, Anup Patel wrote:
> > This patch does following optimizations:
> > 1. Pre-compute hart base for each context handler
> > 2. Pre-compute enable base for each context handler
>
> Why?

This is micro-optimizations. We don't need to re-compute
hart base and hart enable base everytime.

>
> > 3. Have enable lock for each context handler instead
> > of global plic_toggle_lock
>
> Why?  Also even if you want this it should be a separate patch.

Well, the PLIC register space it a bit strange.

Most PLIC context specific registers are in one place
except context IRQ enable registers which are part of
global registers.

To handle this, we had a global plic_toggle_lock which
was taken whenever PLIC driver touched context IRQ
enable registers. Instead of this, we can have per-context
IRQ enable lock for more granular locking.

Later when we implement IRQ set_affinity, we touch
IRQ enable registers of each context whenever IRQ
affinity changes. This fine grained IRQ enable locking
helps when IRQ load-balancer is changing affinity of
different IRQs parallely on separate cores. Again this
is a micro-optimization.

>
> >  #define PRIORITY_BASE                        0
> > -#define     PRIORITY_PER_ID          4
> > +#define PRIORITY_PER_ID                      4
>
> Also please drop the random whitespace changes.

Instead of dropping I will make it separate patch because
we are replacing "\t" between #define and define_name
with a space.

Regards,
Anup
