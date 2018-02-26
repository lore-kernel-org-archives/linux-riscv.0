From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 26 Feb 2018 09:48:38 -0800 (PST)
Subject: [PATCH] riscv: enable STRICT_DEVMEM by default
In-Reply-To: <20180222153941.20826-1-hch@lst.de>
Message-ID: <mhng-cb9eb9eb-94f2-43ec-8e57-aed7a99d52fa@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, 22 Feb 2018 07:39:41 PST (-0800), Christoph Hellwig wrote:
> No need to enable /dev/mem access on a new port.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  lib/Kconfig.debug | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 6088408ef26c..0c6c2aafe93a 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -1968,7 +1968,7 @@ config STRICT_DEVMEM
>  	bool "Filter access to /dev/mem"
>  	depends on MMU && DEVMEM
>  	depends on ARCH_HAS_DEVMEM_IS_ALLOWED
> -	default y if TILE || PPC || X86 || ARM64
> +	default y if TILE || PPC || X86 || ARM64 | RISCV
>  	---help---
>  	  If this option is disabled, you allow userspace (root) access to all
>  	  of memory, including kernel and userspace memory. Accidental

Looks good to me.  I'm queueing this into for-next, as hopefully we won't have 
any changes remaining for 4.16.
