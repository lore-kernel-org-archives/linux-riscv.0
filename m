From: hch@infradead.org (Christoph Hellwig)
Date: Fri, 29 Jun 2018 00:22:29 -0700
Subject: [PATCH v2] riscv: Add support to no-FPU systems
In-Reply-To: <1530073346-5341-1-git-send-email-alankao@andestech.com>
References: <1530073346-5341-1-git-send-email-alankao@andestech.com>
Message-ID: <20180629072229.GE12956@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 6d4a5f6c3f4f..ad3033739430 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -26,7 +26,6 @@ ifeq ($(CONFIG_ARCH_RV64I),y)
>  
>  	KBUILD_CFLAGS += -mabi=lp64
>  	KBUILD_AFLAGS += -mabi=lp64
> -	KBUILD_MARCH = rv64im
>  	LDFLAGS += -melf64lriscv
>  else
>  	BITS := 32
> @@ -34,22 +33,20 @@ else
>  
>  	KBUILD_CFLAGS += -mabi=ilp32
>  	KBUILD_AFLAGS += -mabi=ilp32
> -	KBUILD_MARCH = rv32im
>  	LDFLAGS += -melf32lriscv
>  endif
>  
>  KBUILD_CFLAGS += -Wall
>  
> -ifeq ($(CONFIG_RISCV_ISA_A),y)
> -	KBUILD_ARCH_A = a
> -endif
> -ifeq ($(CONFIG_RISCV_ISA_C),y)
> -	KBUILD_ARCH_C = c
> -endif
> -
> -KBUILD_AFLAGS += -march=$(KBUILD_MARCH)$(KBUILD_ARCH_A)fd$(KBUILD_ARCH_C)
> +# ISA string setting
> +riscv-march-$(CONFIG_ARCH_RV32I)      := rv32im
> +riscv-march-$(CONFIG_ARCH_RV64I)      := rv64im
> +riscv-march-$(CONFIG_RISCV_ISA_A)     := $(riscv-march-y)a
> +riscv-march-$(CONFIG_FPU)             := $(riscv-march-y)fd
> +riscv-march-$(CONFIG_RISCV_ISA_C)     := $(riscv-march-y)c
> +KBUILD_CFLAGS += -march=$(riscv-march-y)
> +KBUILD_AFLAGS += -march=$(riscv-march-y)
>  
> -KBUILD_CFLAGS += -march=$(KBUILD_MARCH)$(KBUILD_ARCH_A)$(KBUILD_ARCH_C)

I think the cleanup part here should be split into a separate patch
with a changelog for it.  Just do iscv-march-y += fd for now, and then
change it in the actual nofpu patch.

> +#ifdef CONFIG_FPU
>  ENTRY(__fstate_save)
>  	li  a2,  TASK_THREAD_F0
>  	add a0, a0, a2
> @@ -442,7 +443,7 @@ ENTRY(__fstate_restore)
>  	csrc sstatus, t1
>  	ret
>  ENDPROC(__fstate_restore)
> -
> +#endif

I'm tempted to move the fpu save/restore routines into a new
conditionally compiled fpu.S file.  Palmer, what do you think?

> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index cb209139ba53..99d20283bb62 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -83,7 +83,12 @@ void show_regs(struct pt_regs *regs)
>  void start_thread(struct pt_regs *regs, unsigned long pc,
>  	unsigned long sp)
>  {
> -	regs->sstatus = SR_SPIE /* User mode, irqs on */ | SR_FS_INITIAL;
> +	/* User mode, irqs on */
> +#ifdef CONFIG_FPU
> +	regs->sstatus = SR_SPIE | SR_FS_INITIAL;
> +#else
> +	regs->sstatus = SR_SPIE | SR_FS_OFF;
> +#endif

Just provide two different DEFAULT_SSTATUS values in switch_to.h based
on the CONFIG_FPU ifdef there.  And I'd be really tempted to remove
the comment..

> -static long restore_d_state(struct pt_regs *regs,
> -	struct __riscv_d_ext_state __user *state)
> +#ifdef CONFIG_FPU
> +static inline long __restore_d_state(struct pt_regs *regs,
> +				     struct __riscv_d_ext_state __user *state)

FYI, I find function delcarations much more readable if the continuing
line is indented using two tabs always, especially if we have such very
long paramewter declarations.  But your style is also fairly common,
so this is not a hard requirement.

Also the refactoring in signal.c should probably be a separate prep
patch as well, so that the nofpu patch just adds the ifdef and nofpu
stubs.

> +	/* Restore the floating-point state. */
> +	err = restore_d_state(regs, &sc->sc_fpregs);
> +
>  	return err;

This could be:

	return restore_d_state(regs, &sc->sc_fpregs);

But then again I think we could just remove restore_sigcontext
and setup_sigcontext and opencode them in their only callers.
