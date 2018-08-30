From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 30 Aug 2018 07:42:33 -0700
Subject: [PATCH 7/8] RISC-V: Comment on the TLB flush in smp_callin()
In-Reply-To: <20180827184243.25344-8-palmer@sifive.com>
References: <20180827184243.25344-1-palmer@sifive.com>
 <20180827184243.25344-8-palmer@sifive.com>
Message-ID: <20180830144233.GC27233@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

>  	notify_cpu_starting(smp_processor_id());
>  	set_cpu_online(smp_processor_id(), 1);
> +	/* Remote TLB flushes are ignored while the CPU is offline, so emit a local
> +	 * TLB flush right now just in case. */

Please use the normal kernel comment style and break the line after 80
characters.
