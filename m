From: anup@brainfault.org (Anup Patel)
Date: Mon, 12 Nov 2018 18:03:09 +0530
Subject: [PATCH 2/4] irqchip: sifive-plic: More flexible plic_irq_toggle()
In-Reply-To: <20181109084338.GB6508@infradead.org>
References: <20181022114517.22748-1-anup@brainfault.org>
 <20181022114517.22748-3-anup@brainfault.org>
 <20181109084338.GB6508@infradead.org>
Message-ID: <CAAhSdy20zU=GeaePQfYW_FKH-wmsYgvK3-6ouc3S8QpwWH-Z+w@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, Nov 9, 2018 at 2:13 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> > -
> >  struct plic_handler {
> >       bool                    present;
> > -     int                     ctxid;
> >       void __iomem            *hart_base;
> >       raw_spinlock_t          enable_lock;
> >       void __iomem            *enable_base;
> >  };
> > -static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
>
> This does not match the changelog at all.

My bad. I should have put this change into separate patch.

I will refactor this patch.

Regards,
Anup
