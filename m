From: hch@infradead.org (Christoph Hellwig)
Date: Fri, 9 Nov 2018 00:43:38 -0800
Subject: [PATCH 2/4] irqchip: sifive-plic: More flexible plic_irq_toggle()
In-Reply-To: <20181022114517.22748-3-anup@brainfault.org>
References: <20181022114517.22748-1-anup@brainfault.org>
 <20181022114517.22748-3-anup@brainfault.org>
Message-ID: <20181109084338.GB6508@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

> -
>  struct plic_handler {
>  	bool			present;
> -	int			ctxid;
>  	void __iomem		*hart_base;
>  	raw_spinlock_t		enable_lock;
>  	void __iomem		*enable_base;
>  };
> -static DEFINE_PER_CPU(struct plic_handler, plic_handlers);

This does not match the changelog at all.
