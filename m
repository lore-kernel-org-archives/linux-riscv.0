From: hch@infradead.org (Christoph Hellwig)
Date: Tue, 14 Aug 2018 06:39:23 -0700
Subject: [PATCH v3 1/2] RISC-V: Define sys_riscv_flush_icache when SMP=n
In-Reply-To: <20180809221952.24260-2-palmer@sifive.com>
References: <20180809221952.24260-1-palmer@sifive.com>
 <20180809221952.24260-2-palmer@sifive.com>
Message-ID: <20180814133922.GC28080@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

>  SYSCALL_DEFINE3(riscv_flush_icache, uintptr_t, start, uintptr_t, end,
>  	uintptr_t, flags)
>  {
> +#ifdef CONFIG_SMP
>  	struct mm_struct *mm = current->mm;
>  	bool local = (flags & SYS_RISCV_FLUSH_ICACHE_LOCAL) != 0;
> +#endif
>  
>  	/* Check the reserved flags. */
>  	if (unlikely(flags & ~SYS_RISCV_FLUSH_ICACHE_ALL))
>  		return -EINVAL;
>  
> +	/*
> +	 * Without CONFIG_SMP flush_icache_mm is a just a flush_icache_all(),
> +	 * which generates unused variable warnings all over this function.
> +	 */
> +#ifdef CONFIG_SMP
>  	flush_icache_mm(mm, local);
> +#else
> +	flush_icache_all();
> +#endif

Eeek.

Something like an unconditional:

	flush_icache_mm(current->mm, flags & SYS_RISCV_FLUSH_ICACHE_LOCAL);

should solve those issues.

Also in the longer run we should turn the !SMP flush_icache_mm stub
into an inline function to solve this problem for all potential
callers.  Excepte that flush_icache_mm happens to be a RISC-V specific
API without any other callers.  So for now I think the above is what
I'd do, but this area has a lot of room for cleanup.
