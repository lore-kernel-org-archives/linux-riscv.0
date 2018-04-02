From: deller@gmx.de (Helge Deller)
Date: Mon, 2 Apr 2018 22:07:38 +0200
Subject: [PATCH v6 13/16] parisc: Switch to generic free_initrd_mem.
In-Reply-To: <20180401145931.7932-13-shea@shealevy.com>
References: <20180329113207.30674-1-shea@shealevy.com>
 <20180401145931.7932-1-shea@shealevy.com>
 <20180401145931.7932-13-shea@shealevy.com>
Message-ID: <267cfdc0-d905-1f3a-e4f2-16209605fca9@gmx.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 01.04.2018 16:59, Shea Levy wrote:
> The first patch in this series added a weakly-defined generic
> implementation, which is functionally identical to the
> architecture-specific one removed here.
> 
> Series boot-tested on RISC-V (which now uses the generic
> implementation) and x86_64 (which doesn't).
> 
> Signed-off-by: Shea Levy <shea@shealevy.com>

Acked-by: Helge Deller <deller@gmx.de> # parisc

> ---
>  arch/parisc/mm/init.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
> index cab32ee824d2..3643399230f3 100644
> --- a/arch/parisc/mm/init.c
> +++ b/arch/parisc/mm/init.c
> @@ -932,10 +932,3 @@ void flush_tlb_all(void)
>  	spin_unlock(&sid_lock);
>  }
>  #endif
> -
> -#ifdef CONFIG_BLK_DEV_INITRD
> -void free_initrd_mem(unsigned long start, unsigned long end)
> -{
> -	free_reserved_area((void *)start, (void *)end, -1, "initrd");
> -}
> -#endif
> 
