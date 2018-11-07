From: palmer@sifive.com (Palmer Dabbelt)
Date: Tue, 06 Nov 2018 16:33:04 -0800 (PST)
Subject: [PATCH] riscv: add missing vdso_install target
In-Reply-To: <20181105143537.27396-1-david.abdurachmanov@gmail.com>
Message-ID: <mhng-a44df3fe-5958-4566-a057-5e028be53203@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, 05 Nov 2018 06:35:37 PST (-0800), david.abdurachmanov at gmail.com wrote:
> Building kernel 4.20 for Fedora as RPM fails, because riscv is missing
> vdso_install target in arch/riscv/Makefile.
>
> Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
> ---
>  arch/riscv/Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index d10146197533..4af153a182b0 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -77,4 +77,8 @@ core-y += arch/riscv/kernel/ arch/riscv/mm/
>
>  libs-y += arch/riscv/lib/
>
> +PHONY += vdso_install
> +vdso_install:
> +	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
> +
>  all: vmlinux

While this doesn't smell like it should be an arch-specific thing, it looks 
like everyone else has a copy and they're all slightly different so it'd 
probably be more complexity to merge them than duplicate them.

I'll take this into my PR for next week.

Thanks!
