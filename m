From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 18 Oct 2018 09:55:14 -0700 (PDT)
Subject: [PATCH, v2] RISC-V: Add FP register ptrace support for gdb.
In-Reply-To: <20181018005905.8100-1-jimw@sifive.com>
Message-ID: <mhng-6049c845-7914-4ec8-8971-1d4ccd471b56@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, 17 Oct 2018 17:59:05 PDT (-0700), Jim Wilson wrote:
> Add a variable and a macro to describe FP registers, assuming only D is
> supported.  FP code is conditional on CONFIG_FPU.  The FP regs and FCSR
> are copied separately to avoid copying struct padding.  Tested by hand and
> with the gdb testsuite.

IIRC, the "padding" field isn't really padding but is instead an extension field 
that we plan on using in the future to indicate the presence of additional 
stateful extensions (with the V extension being the only currently planned 
`one).  As such, we really want to check that the padding is 0 when setting 
state and set the padding to 0 when getting state -- otherwise userspace might 
jam something in there that causes trouble in the future.

Our glibc port enumerates this requirement as a comment 

    struct __riscv_mc_q_ext_state
      {
        unsigned long long int __f[64] __attribute__ ((__aligned__ (16)));
        unsigned int __fcsr;
        /* Reserved for expansion of sigcontext structure.  Currently zeroed
           upon signal, and must be zero upon sigreturn.  */
        unsigned int __glibc_reserved[3];
      };

but appears to not actually check for that behavior, which I would call a bug 
(and I remember having fixed, but maybe I'm just crazy).  Since this is better 
than nothing I've added it to for-next, you're welcome to either submit a 
replacement, submit a followup, or have me fix it :).

> Signed-off-by: Jim Wilson <jimw@sifive.com>

Thanks!

> ---
>  arch/riscv/include/uapi/asm/elf.h |  3 ++
>  arch/riscv/kernel/ptrace.c        | 52 +++++++++++++++++++++++++++++++
>  2 files changed, 55 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/elf.h b/arch/riscv/include/uapi/asm/elf.h
> index 1e0dfc36aab9..644a00ce6e2e 100644
> --- a/arch/riscv/include/uapi/asm/elf.h
> +++ b/arch/riscv/include/uapi/asm/elf.h
> @@ -19,7 +19,10 @@ typedef unsigned long elf_greg_t;
>  typedef struct user_regs_struct elf_gregset_t;
>  #define ELF_NGREG (sizeof(elf_gregset_t) / sizeof(elf_greg_t))
>
> +/* We don't support f without d, or q.  */
> +typedef __u64 elf_fpreg_t;
>  typedef union __riscv_fp_state elf_fpregset_t;
> +#define ELF_NFPREG (sizeof(struct __riscv_d_ext_state) / sizeof(elf_fpreg_t))
>
>  #if __riscv_xlen == 64
>  #define ELF_RISCV_R_SYM(r_info)		ELF64_R_SYM(r_info)
> diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> index 9f82a7e34c64..60f1e02eed36 100644
> --- a/arch/riscv/kernel/ptrace.c
> +++ b/arch/riscv/kernel/ptrace.c
> @@ -28,6 +28,9 @@
>
>  enum riscv_regset {
>  	REGSET_X,
> +#ifdef CONFIG_FPU
> +	REGSET_F,
> +#endif
>  };
>
>  static int riscv_gpr_get(struct task_struct *target,
> @@ -54,6 +57,45 @@ static int riscv_gpr_set(struct task_struct *target,
>  	return ret;
>  }
>
> +#ifdef CONFIG_FPU
> +static int riscv_fpr_get(struct task_struct *target,
> +			 const struct user_regset *regset,
> +			 unsigned int pos, unsigned int count,
> +			 void *kbuf, void __user *ubuf)
> +{
> +	int ret;
> +	struct __riscv_d_ext_state *fstate = &target->thread.fstate;
> +
> +	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, fstate, 0,
> +				  offsetof(struct __riscv_d_ext_state, fcsr));
> +	if (!ret) {
> +		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, fstate, 0,
> +					  offsetof(struct __riscv_d_ext_state, fcsr) +
> +					  sizeof(fstate->fcsr));
> +	}
> +
> +	return ret;
> +}
> +
> +static int riscv_fpr_set(struct task_struct *target,
> +			 const struct user_regset *regset,
> +			 unsigned int pos, unsigned int count,
> +			 const void *kbuf, const void __user *ubuf)
> +{
> +	int ret;
> +	struct __riscv_d_ext_state *fstate = &target->thread.fstate;
> +
> +	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, fstate, 0,
> +				 offsetof(struct __riscv_d_ext_state, fcsr));
> +	if (!ret) {
> +		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, fstate, 0,
> +					 offsetof(struct __riscv_d_ext_state, fcsr) +
> +					 sizeof(fstate->fcsr));
> +	}
> +
> +	return ret;
> +}
> +#endif
>
>  static const struct user_regset riscv_user_regset[] = {
>  	[REGSET_X] = {
> @@ -64,6 +106,16 @@ static const struct user_regset riscv_user_regset[] = {
>  		.get = &riscv_gpr_get,
>  		.set = &riscv_gpr_set,
>  	},
> +#ifdef CONFIG_FPU
> +	[REGSET_F] = {
> +		.core_note_type = NT_PRFPREG,
> +		.n = ELF_NFPREG,
> +		.size = sizeof(elf_fpreg_t),
> +		.align = sizeof(elf_fpreg_t),
> +		.get = &riscv_fpr_get,
> +		.set = &riscv_fpr_set,
> +	},
> +#endif
>  };
>
>  static const struct user_regset_view riscv_user_native_view = {
