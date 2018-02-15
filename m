From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 15 Feb 2018 15:02:28 -0800 (PST)
Subject: [patches] [PATCH] Rename sbi_save to parse_dtb to improve code
 readability
In-Reply-To: <1518726629-89073-1-git-send-email-mjc@sifive.com>
Message-ID: <mhng-2d88cabf-dea4-407f-8750-59c354ae3c06@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, 15 Feb 2018 12:30:29 PST (-0800), Michael Clark wrote:
> From: Michael Clark <michaeljclark@mac.com>
>
> The sbi_ prefix would seem to indicate an SBI interface, and save is not
> very specific. After applying this patch, reading head.S makes more sense.
>
> Signed-off-by: Michael Clark <michaeljclark@mac.com>
> ---
>  arch/riscv/kernel/head.S  | 2 +-
>  arch/riscv/kernel/setup.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 226eeb1..6e07ed3 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -64,7 +64,7 @@ ENTRY(_start)
>  	/* Start the kernel */
>  	mv a0, s0
>  	mv a1, s1
> -	call sbi_save
> +	call parse_dtb
>  	tail start_kernel
>
>  relocate:
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index c6f332b..41d3400 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -165,7 +165,7 @@ asmlinkage void __init setup_vm(void)
>  #endif
>  }
>
> -void __init sbi_save(unsigned int hartid, void *dtb)
> +void __init parse_dtb(unsigned int hartid, void *dtb)
>  {
>  	early_init_dt_scan(__va(dtb));
>  }

Thanks.
