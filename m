From: jeremy.linton@arm.com (Jeremy Linton)
Date: Thu, 30 Aug 2018 14:50:39 -0500
Subject: [PATCH 2/8] RISC-V: Don't set
 cacheinfo.{physical_line_partition,attributes}
In-Reply-To: <20180827184243.25344-3-palmer@sifive.com>
References: <20180827184243.25344-1-palmer@sifive.com>
 <20180827184243.25344-3-palmer@sifive.com>
Message-ID: <fe5ba627-ab8a-79b1-a46a-1d7213707684@arm.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi,

On 08/27/2018 01:42 PM, Palmer Dabbelt wrote:
> These are just hard coded in the RISC-V port, which doesn't make any
> sense.  We should probably be setting these from device tree entries
> when they exist, but for now I think it's saner to just leave them all
> as their default values.

Default value here means unset and not visible in /sys.

Which looks fine to me.

Reviewed-by: Jeremy Linton <jeremy.linton@arm.com>

Thanks,


> 
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> ---
>   arch/riscv/kernel/cacheinfo.c | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index 0bc86e5f8f3f..cb35ffd8ec6b 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -22,13 +22,6 @@ static void ci_leaf_init(struct cacheinfo *this_leaf,
>   {
>   	this_leaf->level = level;
>   	this_leaf->type = type;
> -	/* not a sector cache */
> -	this_leaf->physical_line_partition = 1;
> -	/* TODO: Add to DTS */
> -	this_leaf->attributes =
> -		CACHE_WRITE_BACK
> -		| CACHE_READ_ALLOCATE
> -		| CACHE_WRITE_ALLOCATE;
>   }
>   
>   static int __init_cache_level(unsigned int cpu)
> 
