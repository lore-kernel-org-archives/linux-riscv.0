From: ley.foon.tan@intel.com (Ley Foon Tan)
Date: Tue, 03 Apr 2018 00:04:46 +0800
Subject: [PATCH v6 11/16] nios2: Switch to generic free_initrd_mem.
In-Reply-To: <20180401145931.7932-11-shea@shealevy.com>
References: <20180329113207.30674-1-shea@shealevy.com>
 <20180401145931.7932-1-shea@shealevy.com>
 <20180401145931.7932-11-shea@shealevy.com>
Message-ID: <1522685086.2498.24.camel@intel.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sun, 2018-04-01 at 10:59 -0400, Shea Levy wrote:
> The first patch in this series added a weakly-defined generic
> implementation, which is functionally identical to the
> architecture-specific one removed here.
> 
> Series boot-tested on RISC-V (which now uses the generic
> implementation) and x86_64 (which doesn't).
> 
> Signed-off-by: Shea Levy <shea@shealevy.com>

Acked-by: Ley Foon Tan <ley.foon.tan@intel.com>

> ---
> ?arch/nios2/mm/init.c | 7 -------
> ?1 file changed, 7 deletions(-)
> 
> diff --git a/arch/nios2/mm/init.c b/arch/nios2/mm/init.c
> index c92fe4234009..3df75ff8c768 100644
> --- a/arch/nios2/mm/init.c
> +++ b/arch/nios2/mm/init.c
> @@ -82,13 +82,6 @@ void __init mmu_init(void)
> ????????flush_tlb_all();
> ?}
> 
> -#ifdef CONFIG_BLK_DEV_INITRD
> -void __init free_initrd_mem(unsigned long start, unsigned long end)
> -{
> -???????free_reserved_area((void *)start, (void *)end, -1, "initrd");
> -}
> -#endif
> -
> ?void __ref free_initmem(void)
> ?{
> ????????free_initmem_default(-1);
> --
> 2.16.2
