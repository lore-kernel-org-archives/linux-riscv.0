From: hch@infradead.org (Christoph Hellwig)
Date: Wed, 8 Aug 2018 00:18:54 -0700
Subject: [PATCH v4 5/5] Auto-detect whether a FPU exists
In-Reply-To: <1533698685-18022-6-git-send-email-alankao@andestech.com>
References: <1533698685-18022-1-git-send-email-alankao@andestech.com>
 <1533698685-18022-6-git-send-email-alankao@andestech.com>
Message-ID: <20180808071854.GB27402@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

>  extern unsigned long elf_hwcap;
> +#ifdef CONFIG_FPU
> +extern bool no_fpu;
> +#endif

No need to have an ifdef around an extern declaration.

>  static inline void fstate_save(struct task_struct *task,
>  			       struct pt_regs *regs)
>  {
> +	if (unlikely(no_fpu))
> +		return;
> +
>  	if ((regs->sstatus & SR_FS) == SR_FS_DIRTY) {

Wouldn't the sstatus check here always evaluate to false for the
no_fpu case anyway?

> @@ -39,6 +43,9 @@ static inline void fstate_save(struct task_struct *task,
>  static inline void fstate_restore(struct task_struct *task,
>  				  struct pt_regs *regs)
>  {
> +	if (unlikely(no_fpu))
> +		return;
> +

Same here?

> -#define DEFAULT_SSTATUS (SR_SPIE | SR_FS_INITIAL)
> +#define DEFAULT_SSTATUS \
> +	((unlikely(no_fpu)) ? (SR_SPIE | SR_FS_OFF) : (SR_SPIE | SR_FS_INITIAL))

Please don't hide this in a a macro.

I'd rather get rid of the macro and do this in start_thread:

	regs->sstatus = SR_SPIE /* User mode, irqs on */
	if (!no_fpu)
		regs->sstatus |= SR_FS_INITIAL;

and provide a stub for the no_fpu variable for the !CONFIG_CPU case.

In fact I'd probably invert the polarity of this variable and make it
'has_fpu'.  The for !CONFIG_FPU you define that as

#define has_cpu	false
		
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -22,6 +22,9 @@
>  #include <asm/hwcap.h>
>  
>  unsigned long elf_hwcap __read_mostly;
> +#ifdef CONFIG_FPU
> +bool no_fpu __read_mostly;
> +#endif
>  
>  void riscv_fill_hwcap(void)
>  {
> @@ -58,4 +61,12 @@ void riscv_fill_hwcap(void)
>  		elf_hwcap |= isa2hwcap[(unsigned char)(isa[i])];
>  
>  	pr_info("elf_hwcap is 0x%lx", elf_hwcap);
> +
> +#ifdef CONFIG_FPU
> +	no_fpu = 0;
> +	if (!(elf_hwcap & (COMPAT_HWCAP_ISA_F | COMPAT_HWCAP_ISA_D))) {
> +		pr_info("Bypass FPU code.");
> +		no_fpu = 1;
> +	}
> +#endif

Note that variables unless they are on stack in a function are always
initialized to zero.  So together with my above ideas this could become:

#ifdef CONFIG_FPU
	if (elf_hwcap & (COMPAT_HWCAP_ISA_F | COMPAT_HWCAP_ISA_D)
		has_fpu = true;
#endif

Note the use of true/false for booleans and dropping the printk.

> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> index 2450b824d799..9714e4fccb69 100644
> --- a/arch/riscv/kernel/signal.c
> +++ b/arch/riscv/kernel/signal.c
> @@ -45,6 +45,9 @@ static long restore_fp_state(struct pt_regs *regs,
>  	struct __riscv_d_ext_state __user *state = &sc_fpregs->d;
>  	size_t i;
>  
> +	if (unlikely(no_fpu))
> +		return 0;

I'd be tempted to move this into the caler, e.g.

	if (has_fpu) {
		restore_fp_state()..
	}

Also the unlikely annotations seem odd - this seems like something that
even the simplest branch predictor can handle.  If we really want to
optimize it (not for this series but in the future) we should implement
the alternatives mechanism for live patching.
