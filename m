From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 12 Nov 2018 17:52:23 -0800 (PST)
Subject: [PATCH] riscv: fix trace_sys_exit hook
In-Reply-To: <20181029121516.29574-1-david.abdurachmanov@gmail.com>
Message-ID: <mhng-8eb10330-a87b-4bd6-8f91-e9e177d2992b@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, 29 Oct 2018 05:15:16 PDT (-0700), david.abdurachmanov at gmail.com wrote:
> Depends on:
> http://lists.infradead.org/pipermail/linux-riscv/2018-October/001931.html
>
> Why we don't have HAVE_SYSCALL_TRACEPOINTS in arch/riscv/Kconfig?
>
> Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
> ---
>  arch/riscv/kernel/ptrace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> index 9f82a7e34c64..9db7d0076375 100644
> --- a/arch/riscv/kernel/ptrace.c
> +++ b/arch/riscv/kernel/ptrace.c
> @@ -120,6 +120,6 @@ void do_syscall_trace_exit(struct pt_regs *regs)
>
>  #ifdef CONFIG_HAVE_SYSCALL_TRACEPOINTS
>  	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
> -		trace_sys_exit(regs, regs->regs[0]);
> +		trace_sys_exit(regs, regs_return_value(regs));
>  #endif
>  }

I'm dropping this onto next-audit on top of the other two.

Thanks!
