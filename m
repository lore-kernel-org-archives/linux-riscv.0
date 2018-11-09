From: hch@infradead.org (Christoph Hellwig)
Date: Fri, 9 Nov 2018 00:42:56 -0800
Subject: [PATCH 1/4] irqchip: sifive-plic: Pre-compute context hart base
 and enable base
In-Reply-To: <20181022114517.22748-2-anup@brainfault.org>
References: <20181022114517.22748-1-anup@brainfault.org>
 <20181022114517.22748-2-anup@brainfault.org>
Message-ID: <20181109084256.GA6508@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Oct 22, 2018 at 05:15:14PM +0530, Anup Patel wrote:
> This patch does following optimizations:
> 1. Pre-compute hart base for each context handler
> 2. Pre-compute enable base for each context handler

Why?

> 3. Have enable lock for each context handler instead
> of global plic_toggle_lock

Why?  Also even if you want this it should be a separate patch.

>  #define PRIORITY_BASE			0
> -#define     PRIORITY_PER_ID		4
> +#define PRIORITY_PER_ID			4

Also please drop the random whitespace changes.
