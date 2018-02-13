From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 12 Feb 2018 18:07:43 -0800 (PST)
Subject: [PATCH] riscv: kconfig: Remove RISCV_IRQ_INTC select
In-Reply-To: <20180208225446.rj7ioyeikaqfm2jc@huvuddator>
Message-ID: <mhng-90fa3f65-61f6-4ae2-af42-d739f6fbb0aa@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, 08 Feb 2018 14:54:46 PST (-0800), ulfalizer at gmail.com wrote:
> The RISCV_IRQ_INTC configuration symbol is undefined, but RISCV selects
> it. Quoting Palmer Dabbelt:
>
> 	It looks like this slipped through, the symbol has been renamed
> 	RISCV_INTC.
>
> No RISCV_INTC configuration symbol has been merged either. Just remove
> the RISCV_IRQ_INTC select for now.
>
> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
> ---
>  arch/riscv/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index b6722c246d9c..2be44b6651c5 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -34,7 +34,6 @@ config RISCV
>  	select HAVE_ARCH_TRACEHOOK
>  	select MODULES_USE_ELF_RELA if MODULES
>  	select THREAD_INFO_IN_TASK
> -	select RISCV_IRQ_INTC
>  	select RISCV_TIMER
>
>  config MMU

Thanks!  I'll take this (and the other relevant ones) into the RISC-V tree.
