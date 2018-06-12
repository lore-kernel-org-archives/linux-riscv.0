From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 11 Jun 2018 17:46:28 -0700 (PDT)
Subject: [PATCH] RISC-V: Fix PTRACE_SETREGSET bug.
In-Reply-To: <20180611214822.8539-1-jimw@sifive.com>
Message-ID: <mhng-7a581ed4-d7ab-4188-92e6-3a8002f3c8d1@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, 11 Jun 2018 14:48:22 PDT (-0700), Jim Wilson wrote:
> In riscv_gpr_set, pass regs instead of &regs to user_regset_copyin to fix
> gdb segfault.
>
> Signed-off-by: Jim Wilson <jimw@sifive.com>
> ---
>  arch/riscv/kernel/ptrace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> index ba3e80712797..9f82a7e34c64 100644
> --- a/arch/riscv/kernel/ptrace.c
> +++ b/arch/riscv/kernel/ptrace.c
> @@ -50,7 +50,7 @@ static int riscv_gpr_set(struct task_struct *target,
>  	struct pt_regs *regs;
>
>  	regs = task_pt_regs(target);
> -	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &regs, 0, -1);
> +	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, regs, 0, -1);
>  	return ret;
>  }

Whoops, that's embarassing :).  I poked around and didn't see this anywhere 
else, so I'm not sure where we managed to obtain this particular pathology.

Thanks for the patch!
