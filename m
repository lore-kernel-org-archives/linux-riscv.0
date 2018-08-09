From: linux@roeck-us.net (Guenter Roeck)
Date: Thu, 9 Aug 2018 14:20:53 -0700
Subject: [PATCH v2 1/2] RISC-V: Define sys_riscv_flush_icache when SMP=n
In-Reply-To: <20180809202524.1702-2-palmer@sifive.com>
References: <20180809202524.1702-1-palmer@sifive.com>
 <20180809202524.1702-2-palmer@sifive.com>
Message-ID: <20180809212053.GA13675@roeck-us.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Aug 09, 2018 at 01:25:23PM -0700, Palmer Dabbelt wrote:
> This would be necessary to make non-SMP builds work, but there is
> another error in the implementation of our syscall linkage that actually
> just causes sys_riscv_flush_icache to never build.  I've build tested
> this on allnoconfig and allnoconfig+SMP=y, as well as defconfig like
> normal.
> 
> CC: Christoph Hellwig <hch@infradead.org>
> CC: Guenter Roeck <linux@roeck-us.net>
> In-Reply-To: <20180809055830.GA17533@infradead.org>
> In-Reply-To: <20180809132612.GA31058@roeck-us.net>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>

[Compile-]Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/riscv/include/asm/vdso.h |  2 --
>  arch/riscv/kernel/sys_riscv.c | 10 ++++++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/vdso.h b/arch/riscv/include/asm/vdso.h
> index 541544d64c33..ec6180a4b55d 100644
> --- a/arch/riscv/include/asm/vdso.h
> +++ b/arch/riscv/include/asm/vdso.h
> @@ -38,8 +38,6 @@ struct vdso_data {
>  	(void __user *)((unsigned long)(base) + __vdso_##name);			\
>  })
>  
> -#ifdef CONFIG_SMP
>  asmlinkage long sys_riscv_flush_icache(uintptr_t, uintptr_t, uintptr_t);
> -#endif
>  
>  #endif /* _ASM_RISCV_VDSO_H */
> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> index f7181ed8aafc..180da8d4e14a 100644
> --- a/arch/riscv/kernel/sys_riscv.c
> +++ b/arch/riscv/kernel/sys_riscv.c
> @@ -48,7 +48,6 @@ SYSCALL_DEFINE6(mmap2, unsigned long, addr, unsigned long, len,
>  }
>  #endif /* !CONFIG_64BIT */
>  
> -#ifdef CONFIG_SMP
>  /*
>   * Allows the instruction cache to be flushed from userspace.  Despite RISC-V
>   * having a direct 'fence.i' instruction available to userspace (which we
> @@ -66,15 +65,22 @@ SYSCALL_DEFINE6(mmap2, unsigned long, addr, unsigned long, len,
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
> +	 * Without CONFIG_SMP flush_icache_mm is a NOP, which generates unused
> +	 * variable warnings all over this function.
> +	 */
> +#ifdef CONFIG_SMP
>  	flush_icache_mm(mm, local);
> +#endif
>  
>  	return 0;
>  }
> -#endif
> -- 
> 2.16.4
> 
