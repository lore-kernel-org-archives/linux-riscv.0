From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 26 Feb 2018 16:35:06 -0800 (PST)
Subject: [PATCH 3/9] RISC-V: Support RISCV_CALL relocations for non-PIC
 modules.
In-Reply-To: <20180223031218.10390-4-shea@shealevy.com>
Message-ID: <mhng-0bde0493-1d0b-48d3-b2af-ee5a143e94f0@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, 22 Feb 2018 19:12:12 PST (-0800), shea at shealevy.com wrote:
> Only PIC objects have RISCV_CALL_PLT relocations.
>
> Signed-off-by: Shea Levy <shea@shealevy.com>
> ---
>  arch/riscv/kernel/module.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 8ad24bdf69de..0db01486a357 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -94,7 +94,7 @@ static int apply_r_riscv_pcrel_lo12_s_rela(struct module *me, u32 *location,
>  	return 0;
>  }
>
> -static int apply_r_riscv_call_plt_rela(struct module *me, u32 *location,
> +static int apply_r_riscv_call_rela(struct module *me, u32 *location,
>  				       Elf_Addr v)

This is misaligned, but don't bother submitting another patch set just for 
this.  I'll fix it up.

>  {
>  	s64 offset = (void *)v - (void *)location;
> @@ -129,7 +129,7 @@ static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
>  	[R_RISCV_PCREL_HI20]		= apply_r_riscv_pcrel_hi20_rela,
>  	[R_RISCV_PCREL_LO12_I]		= apply_r_riscv_pcrel_lo12_i_rela,
>  	[R_RISCV_PCREL_LO12_S]		= apply_r_riscv_pcrel_lo12_s_rela,
> -	[R_RISCV_CALL_PLT]		= apply_r_riscv_call_plt_rela,
> +	[R_RISCV_CALL]			= apply_r_riscv_call_rela,
>  	[R_RISCV_RELAX]			= apply_r_riscv_relax_rela,
>  };
