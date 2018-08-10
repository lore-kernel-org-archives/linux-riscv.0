From: zongbox@gmail.com (Zong Li)
Date: Fri, 10 Aug 2018 08:37:39 +0800
Subject: FW: [PATCH v2] RISC-V: Add the directive for alignment of stvec's
 value
In-Reply-To: <3AB16BFE6992A349B44EA6D8F29BFB476B1EA2CC@ATCPCS16.andestech.com>
References: <1533223316-9942-1-git-send-email-zong@andestech.com>
 <3AB16BFE6992A349B44EA6D8F29BFB476B1EA2CC@ATCPCS16.andestech.com>
Message-ID: <CA+ZOyajyOfjZh8tQB4reAka3s+tqXachY4hiAtpA4Bb67x58AQ@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

> Subject: [PATCH v2] RISC-V: Add the directive for alignment of stvec's value
>
> The stvec's value must be 4 byte alignment by specification definition.
> These directives avoid to stvec be set the non-alignment value.
>
> Signed-off-by: Zong Li <zong@andestech.com>
> ---
>  arch/riscv/kernel/head.S | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S index 3b6293f..11066d5 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -94,6 +94,7 @@ relocate:
>         or a0, a0, a1
>         sfence.vma
>         csrw sptbr, a0
> +.align 2
>  1:
>         /* Set trap vector to spin forever to help debug */
>         la a0, .Lsecondary_park
> @@ -143,6 +144,7 @@ relocate:
>         tail smp_callin
>  #endif
>
> +.align 2
>  .Lsecondary_park:
>         /* We lack SMP support or have too many harts, so park this hart */
>         wfi


ping
