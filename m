From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 19 Apr 2018 17:52:48 -0700 (PDT)
Subject: [PATCH] riscv: select DMA_DIRECT_OPS instead of redefining it
In-Reply-To: <20180416125351.14216-1-hch@lst.de>
Message-ID: <mhng-d2b3eb09-94d9-407f-8ef3-9e8915113bc7@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, 16 Apr 2018 05:53:51 PDT (-0700), Christoph Hellwig wrote:
> DMA_DIRECT_OPS is defined in lib/Kconfig, so don't duplicate it in
> arch/riscv/Kconfig.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/Kconfig | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 23d8acca5c90..cd4fd85fde84 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -11,6 +11,7 @@ config RISCV
>  	select ARCH_WANT_FRAME_POINTERS
>  	select CLONE_BACKWARDS
>  	select COMMON_CLK
> +	select DMA_DIRECT_OPS
>  	select GENERIC_CLOCKEVENTS
>  	select GENERIC_CPU_DEVICES
>  	select GENERIC_IRQ_SHOW
> @@ -89,9 +90,6 @@ config PGTABLE_LEVELS
>  config HAVE_KPROBES
>  	def_bool n
>
> -config DMA_DIRECT_OPS
> -	def_bool y
> -
>  menu "Platform type"
>
>  choice

Thanks!
