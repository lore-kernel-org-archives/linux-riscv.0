From: palmer@sifive.com (Palmer Dabbelt)
Date: Tue, 12 Jun 2018 12:38:08 -0700 (PDT)
Subject: [PATCH] RISC-V: fix R_RISCV_ADD32/R_RISCV_SUB32 relocations
In-Reply-To: <mvmh8m7ex0z.fsf@suse.de>
Message-ID: <mhng-cebe55d5-6612-4422-9519-7d4a26feeac7@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 12 Jun 2018 10:26:36 PDT (-0700), schwab at suse.de wrote:
> The R_RISCV_ADD32/R_RISCV_SUB32 relocations should add/subtract the
> address of the symbol (without overflow check), not its contents.
>
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  arch/riscv/kernel/module.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 29d265d0cf..46aacf6148 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -265,14 +265,14 @@ static int apply_r_riscv_align_rela(struct module *me, u32 *location,
>  static int apply_r_riscv_add32_rela(struct module *me, u32 *location,
>  				    Elf_Addr v)
>  {
> -	*(u32 *)location += (*(u32 *)v);
> +	*(u32 *)location += (u32)v;
>  	return 0;
>  }
>
>  static int apply_r_riscv_sub32_rela(struct module *me, u32 *location,
>  				    Elf_Addr v)
>  {
> -	*(u32 *)location -= (*(u32 *)v);
> +	*(u32 *)location -= (u32)v;
>  	return 0;
>  }

Oops, sorry I missed those.  The entire relocation set might be worth a 
once-over, as there's a lot of bit twiddling in here and I wouldn't be 
surprised if I missed something else as well.

The RISC-V merge window has closed (I tag on Monday, let it bake until 
Wednesday, and then submit the PR), so I'll target this for my post-RC1 pull 
request.

Thanks!
