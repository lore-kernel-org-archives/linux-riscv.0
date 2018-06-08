From: palmer@sifive.com (Palmer Dabbelt)
Date: Fri, 08 Jun 2018 15:33:35 -0700 (PDT)
Subject: [PATCH] RISC-V: Handle R_RISCV_32 in modules
In-Reply-To: <mvm7enaki28.fsf@suse.de>
Message-ID: <mhng-3f91f2da-55ae-41b8-b5b2-956ea638bed0@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, 07 Jun 2018 03:27:27 PDT (-0700), schwab at suse.de wrote:
> With CONFIG_MODVERSIONS=y the R_RISCV_32 relocation is used by the
> __kcrctab section.
>
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  arch/riscv/kernel/module.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 5dddba301d..1d5e9b934b 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -17,6 +17,17 @@
>  #include <linux/errno.h>
>  #include <linux/moduleloader.h>
>
> +static int apply_r_riscv_32_rela(struct module *me, u32 *location, Elf_Addr v)
> +{
> +	if (v != (u32)v) {

My worry with this kind of check is that it relies on some sort of undefined 
behavior in C and that at some point in the future GCC will just go decide the 
check can never fail.  I checked and GCC doesn't elide these checks now, so I 
might be wrong.

Is this defined to do what it looks like it's doing?

> +		pr_err("%s: value %016llx out of range for 32-bit field\n",
> +		       me->name, v);
> +		return -EINVAL;
> +	}
> +	*location = v;
> +	return 0;
> +}
> +
>  static int apply_r_riscv_64_rela(struct module *me, u32 *location, Elf_Addr v)
>  {
>  	*(u64 *)location = v;
> @@ -265,6 +276,7 @@ static int apply_r_riscv_sub32_rela(struct module *me, u32 *location,
>
>  static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
>  				Elf_Addr v) = {
> +	[R_RISCV_32]			= apply_r_riscv_32_rela,
>  	[R_RISCV_64]			= apply_r_riscv_64_rela,
>  	[R_RISCV_BRANCH]		= apply_r_riscv_branch_rela,
>  	[R_RISCV_JAL]			= apply_r_riscv_jal_rela,

Thanks!
