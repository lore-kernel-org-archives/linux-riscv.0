From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 30 Aug 2018 07:41:55 -0700
Subject: [PATCH 6/8] RISC-V: Use mmgrab()
In-Reply-To: <20180827184243.25344-7-palmer@sifive.com>
References: <20180827184243.25344-1-palmer@sifive.com>
 <20180827184243.25344-7-palmer@sifive.com>
Message-ID: <20180830144155.GB27233@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

> +#include <linux/sched/mm.h>
>  #include <asm/irq.h>
>  #include <asm/mmu_context.h>
>  #include <asm/tlbflush.h>
> @@ -79,8 +80,8 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
>  	 * the spinning harts that they can continue the boot process.
>  	 */
>  	smp_mb();
> -	__cpu_up_stack_pointer[cpu] = task_stack_page(tidle) + THREAD_SIZE;
> -	__cpu_up_task_pointer[cpu] = tidle;
> +	WRITE_ONCE(__cpu_up_stack_pointer[cpu], task_stack_page(tidle) + THREAD_SIZE);
> +	WRITE_ONCE(__cpu_up_task_pointer[cpu], tidle);

This looks unrelated.

> @@ -100,7 +101,7 @@ asmlinkage void __init smp_callin(void)
>  	struct mm_struct *mm = &init_mm;
>  
>  	/* All kernel threads share the same mm context.  */
> -	atomic_inc(&mm->mm_count);
> +	mmgrab(mm);
>  	current->active_mm = mm;

This part looks fine to me:

Reviewed-by: Christoph Hellwig <hch@lst.de>
