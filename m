From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 08 Feb 2018 10:34:19 -0800 (PST)
Subject: [PATCH 07/20] riscv: Remove ARCH_WANT_OPTIONAL_GPIOLIB select
In-Reply-To: <20180205012146.23981-8-ulfalizer@gmail.com>
Message-ID: <mhng-dc5e58a4-aab6-4d59-bb59-5a5ff20db392@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sun, 04 Feb 2018 17:21:19 PST (-0800), ulfalizer at gmail.com wrote:
> The ARCH_WANT_OPTIONAL_GPIOLIB symbol was removed in commit 65053e1a7743
> ("gpio: delete ARCH_[WANTS_OPTIONAL|REQUIRE]_GPIOLIB"). GPIOLIB should
> just be selected explicitly if needed.
>
> Remove the ARCH_WANT_OPTIONAL_GPIOLIB select from RISCV.
>
> See commit 0145071b3314 ("x86: Do away with
> ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB") and commit da9a1c6767 ("arm64: do
> away with ARCH_[WANT_OPTIONAL|REQUIRE]_GPIOLIB") as well.
>
> Discovered with the
> https://github.com/ulfalizer/Kconfiglib/blob/master/examples/list_undefined.py
> script.
>
> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
> ---
>  arch/riscv/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index ff69c77b9e78..716e90e60e5c 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -19,7 +19,6 @@ config RISCV
>  	select GENERIC_STRNLEN_USER
>  	select GENERIC_SMP_IDLE_THREAD
>  	select GENERIC_ATOMIC64 if !64BIT || !RISCV_ISA_A
> -	select ARCH_WANT_OPTIONAL_GPIOLIB
>  	select HAVE_MEMBLOCK
>  	select HAVE_MEMBLOCK_NODE_MAP
>  	select HAVE_DMA_API_DEBUG

Thanks!

(If you want these through my tree, just say something.)

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
