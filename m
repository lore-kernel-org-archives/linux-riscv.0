From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 30 Aug 2018 07:37:38 -0700
Subject: [PATCH 1/8] RISC-V: Provide a cleaner raw_smp_processor_id()
In-Reply-To: <20180827184243.25344-2-palmer@sifive.com>
References: <20180827184243.25344-1-palmer@sifive.com>
 <20180827184243.25344-2-palmer@sifive.com>
Message-ID: <20180830143738.GC11544@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Aug 27, 2018 at 11:42:36AM -0700, Palmer Dabbelt wrote:
> +/* Obtains the hart ID of the currently executing task.  This relies on
> + * THREAD_INFO_IN_TASK, but we define that unconditionally. */

Kernel comment style would be:

/*
 * Obtains the hart ID of the currently executing task.  This relies on
 * THREAD_INFO_IN_TASK, but we define that unconditionally.
 */

> +#ifdef CONFIG_THREAD_INFO_IN_TASK

THREAD_INFO_IN_TASK is always defined for riscv, so no need for this
ifdef.

> +#define get_ti()                ((struct thread_info *)get_current())
> +#define raw_smp_processor_id()  (get_ti()->cpu)

Please don't cast structs around.  This should be something like

#define raw_smp_processor_id() \
	(container_of(get_current(), struct task_struct, thread_info)->cpu)
