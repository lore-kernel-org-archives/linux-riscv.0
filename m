From: rostedt@goodmis.org (Steven Rostedt)
Date: Tue, 8 May 2018 09:11:42 -0400
Subject: [PATCH] riscv/ftrace: Fix the problem modules cannot find _mcount
In-Reply-To: <1525749717-384-1-git-send-email-alankao@andestech.com>
References: <1525749717-384-1-git-send-email-alankao@andestech.com>
Message-ID: <20180508091142.12b5231a@gandalf.local.home>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 8 May 2018 11:21:57 +0800
Alan Kao <alankao@andestech.com> wrote:

> Enabling ftrace and module support at the same time fails the kernel
> build process, because modules cannot find the _mcount symbol.  This
> patch fixes this issue.

I think you have a much bigger issue.

> 
> Signed-off-by: Alan Kao <alankao@andestech.com>
> Cc: Greentime Hu <greentime@andestech.com>
> Cc: Zong Li <zong@andestech.com>
> ---
>  arch/riscv/kernel/mcount.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
> index ce9bdc57a2a1..5721624886a1 100644
> --- a/arch/riscv/kernel/mcount.S
> +++ b/arch/riscv/kernel/mcount.S
> @@ -126,5 +126,5 @@ do_trace:
>  	RESTORE_ABI_STATE
>  	ret
>  ENDPROC(_mcount)
> -EXPORT_SYMBOL(_mcount)
>  #endif
> +EXPORT_SYMBOL(_mcount)

How does this work? How do you export _mcount if _mcount isn't even
defined?

-- Steve
