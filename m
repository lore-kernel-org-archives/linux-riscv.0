From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 06 Sep 2018 02:45:03 -0700 (PDT)
Subject: [PATCH] riscv: move GCC version check for ARCH_SUPPORTS_INT128 to
 Kconfig
In-Reply-To: <1535099634-29439-1-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <mhng-89887f62-7423-4fcf-9df5-f5777e6644db@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, 24 Aug 2018 01:33:53 PDT (-0700), yamada.masahiro at socionext.com wrote:
> This becomes much neater in Kconfig.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  arch/riscv/Kconfig  | 1 +
>  arch/riscv/Makefile | 2 --
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index a344980..ed81df4 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -112,6 +112,7 @@ config ARCH_RV32I
>  config ARCH_RV64I
>  	bool "RV64I"
>  	select 64BIT
> +	select ARCH_SUPPORTS_INT128 if GCC_VERSION >= 50000
>  	select HAVE_FUNCTION_TRACER
>  	select HAVE_FUNCTION_GRAPH_TRACER
>  	select HAVE_FTRACE_MCOUNT_RECORD
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 61ec424..33700e4 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -25,8 +25,6 @@ ifeq ($(CONFIG_ARCH_RV64I),y)
>
>  	KBUILD_CFLAGS += -mabi=lp64
>  	KBUILD_AFLAGS += -mabi=lp64
> -
> -	KBUILD_CFLAGS	+= $(call cc-ifversion, -ge, 0500, -DCONFIG_ARCH_SUPPORTS_INT128)
>
>  	KBUILD_MARCH = rv64im
>  	KBUILD_LDFLAGS += -melf64lriscv

FWIW, while there isn't an official RISC-V GCC port that old (IIRC 6 was our 
first version, but it may have been 7) there are out-of-tree ports so I think 
this is OK to leave as it stands.
