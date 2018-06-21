From: hch@infradead.org (Christoph Hellwig)
Date: Wed, 20 Jun 2018 23:40:43 -0700
Subject: [PATCH 1/5] RISC-V: Add conditional macro for zone of DMA32
In-Reply-To: <79dba59ab02752b260cb31f557a09df786fd80d7.1529506497.git.zong@andestech.com>
References: <cover.1529506497.git.zong@andestech.com>
 <79dba59ab02752b260cb31f557a09df786fd80d7.1529506497.git.zong@andestech.com>
Message-ID: <20180621064043.GC19319@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Jun 21, 2018 at 09:41:41AM +0800, Zong Li wrote:
> The DMA32 is for 64-bit usage.
> 
> Signed-off-by: Zong Li <zong@andestech.com>
> ---
>  arch/riscv/mm/init.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index c77df8142be2..91a5852e28fd 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -28,8 +28,11 @@ static void __init zone_sizes_init(void)
>  {
>  	unsigned long max_zone_pfns[MAX_NR_ZONES] = { 0, };
>  
> +#ifdef CONFIG_ZONE_DMA32
>  	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(min(4UL * SZ_1G, max_low_pfn));
> +#else
>  	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
> +#endif

This breaks the 64-bit setup.  The second line needs to be kept for
the CONFIG_ZONE_DMA32 case.
