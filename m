From: j.neuschaefer@gmx.net (Jonathan =?utf-8?Q?Neusch=C3=A4fer?=)
Date: Mon, 5 Feb 2018 11:45:39 +0100
Subject: [PATCH 06/20] riscv: Remove ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE
 select
In-Reply-To: <20180205012146.23981-7-ulfalizer@gmail.com>
References: <20180205012146.23981-1-ulfalizer@gmail.com>
 <20180205012146.23981-7-ulfalizer@gmail.com>
Message-ID: <20180205104539.iod5anzzl3axlfbh@latitude>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Feb 05, 2018 at 02:21:18AM +0100, Ulf Magnusson wrote:
> The ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE symbol was removed in
> commit 51a021244b9d ("atomic64: no need for
> CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE").
> 
> Remove the ARCH_HAS_ATOMIC64_DEC_IS_POSITIVE select from RISCV.
> 
> Discovered with the
> https://github.com/ulfalizer/Kconfiglib/blob/master/examples/list_undefined.py
> script.
> 
> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
> ---
>  arch/riscv/Kconfig | 1 -
>  1 file changed, 1 deletion(-)

Looks good.

Reviewed-by: Jonathan Neusch?fer <j.neuschaefer@gmx.net>

> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index b6722c246d9c..ff69c77b9e78 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -8,7 +8,6 @@ config RISCV
>  	select OF
>  	select OF_EARLY_FLATTREE
>  	select OF_IRQ
> -	select ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE
>  	select ARCH_WANT_FRAME_POINTERS
>  	select CLONE_BACKWARDS
>  	select COMMON_CLK
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20180205/3c543c9a/attachment.sig>
