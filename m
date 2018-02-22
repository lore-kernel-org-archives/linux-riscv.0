From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 22 Feb 2018 15:14:53 -0800 (PST)
Subject: [PATCH] riscv: Respect the initrd found in the dt, if any.
In-Reply-To: <20180220125426.6388-1-shea@shealevy.com>
Message-ID: <mhng-b4425a52-f6fd-48df-b227-c3a786332e6c@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 20 Feb 2018 04:54:26 PST (-0800), shea at shealevy.com wrote:
> Signed-off-by: Shea Levy <shea@shealevy.com>
> ---
>  arch/riscv/kernel/setup.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 41d34008faf6..c4ebc907af34 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -88,15 +88,20 @@ static void __init setup_initrd(void)
>  	extern unsigned long __initramfs_size;
>  	unsigned long size;
>
> +	if (initrd_start)
> +		goto found;
> +
>  	if (__initramfs_size > 0) {
>  		initrd_start = (unsigned long)(&__initramfs_start);
>  		initrd_end = initrd_start + __initramfs_size;
>  	}
>
> +	initrd_below_start_ok = 1;
>  	if (initrd_start >= initrd_end) {
>  		printk(KERN_INFO "initrd not found or empty");
>  		goto disable;
>  	}
> +found:
>  	if (__pa(initrd_end) > PFN_PHYS(max_low_pfn)) {
>  		printk(KERN_ERR "initrd extends beyond end of memory");
>  		goto disable;
> @@ -104,13 +109,13 @@ static void __init setup_initrd(void)
>
>  	size =  initrd_end - initrd_start;
>  	memblock_reserve(__pa(initrd_start), size);
> -	initrd_below_start_ok = 1;
>
>  	printk(KERN_INFO "Initial ramdisk at: 0x%p (%lu bytes)\n",
>  		(void *)(initrd_start), size);
>  	return;
>  disable:
>  	pr_cont(" - disabling initrd\n");
> +	initrd_below_start_ok = 0;
>  	initrd_start = 0;
>  	initrd_end = 0;
>  }

It looks like there's some amount of generic support in 
__early_init_dt_declare_initrd(), can we just use that?
