From: palmer@sifive.com (Palmer Dabbelt)
Date: Tue, 06 Nov 2018 16:33:06 -0800 (PST)
Subject: [PATCH] riscv: fix spacing in struct pt_regs
In-Reply-To: <20181105144004.28267-1-david.abdurachmanov@gmail.com>
Message-ID: <mhng-0fc17080-b4cc-4aa4-b269-b3140af7421d@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, 05 Nov 2018 06:40:04 PST (-0800), david.abdurachmanov at gmail.com wrote:
> Replace 8 spaces with tab to match styling.
>
> Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
> ---
>  arch/riscv/include/asm/ptrace.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
> index 2c5df945d43c..bbe1862e8f80 100644
> --- a/arch/riscv/include/asm/ptrace.h
> +++ b/arch/riscv/include/asm/ptrace.h
> @@ -56,8 +56,8 @@ struct pt_regs {
>  	unsigned long sstatus;
>  	unsigned long sbadaddr;
>  	unsigned long scause;
> -        /* a0 value before the syscall */
> -        unsigned long orig_a0;
> +	/* a0 value before the syscall */
> +	unsigned long orig_a0;
>  };
>
>  #ifdef CONFIG_64BIT

Thanks.  I'll also include this for next week's PR.
