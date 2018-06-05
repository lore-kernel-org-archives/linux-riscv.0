From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 04 Jun 2018 18:18:51 -0700 (PDT)
Subject: [PATCH] riscv: add riscv-specific predefines to CHECKFLAGS
In-Reply-To: <20180531154201.48618-1-luc.vanoostenryck@gmail.com>
Message-ID: <mhng-82ddb68f-98e3-422d-9828-8bff3ee48512@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, 31 May 2018 08:42:01 PDT (-0700), luc.vanoostenryck at gmail.com wrote:
> RISC-V uses the macro __riscv_xlen, predefined by GCC, to
> make the distinction between 32 or 64 bit code.
>
> However, sparse doesn't know anything about this macro
> which lead to wrong warnings and failures.
>
> Fix this by adding a define of __riscv_xlen to CHECKFLAGS
> and add one for __riscv too.
>
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  arch/riscv/Makefile | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 76e958a54..6d4a5f6c3 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -71,6 +71,9 @@ KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-relax)
>  # architectures.  It's faster to have GCC emit only aligned accesses.
>  KBUILD_CFLAGS += $(call cc-option,-mstrict-align)
>
> +# arch specific predefines for sparse
> +CHECKFLAGS += -D__riscv -D__riscv_xlen=$(BITS)
> +
>  head-y := arch/riscv/kernel/head.o
>
>  core-y += arch/riscv/kernel/ arch/riscv/mm/

Thanks!
