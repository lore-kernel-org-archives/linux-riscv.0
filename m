From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 27 Aug 2018 12:50:32 -0700 (PDT)
Subject: [PATCH] riscv: tlb: Provide definition of tlb_flush() before
 including tlb.h
In-Reply-To: <1535134975-18594-1-git-send-email-linux@roeck-us.net>
Message-ID: <mhng-17c848f8-6342-44c6-95b3-f4eee460b91c@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, 24 Aug 2018 11:22:55 PDT (-0700), linux at roeck-us.net wrote:
> From: Will Deacon <will.deacon@arm.com>
>
> As of commit fd1102f0aade ("mm: mmu_notifier fix for tlb_end_vma"),
> asm-generic/tlb.h now calls tlb_flush() from a static inline function,
> so we need to make sure that it's declared before #including the
> asm-generic header in the arch header.
>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: fd1102f0aade ("mm: mmu_notifier fix for tlb_end_vma")
> Signed-off-by: Will Deacon <will.deacon@arm.com>
> [groeck: Use forward declaration instead of moving inline function]
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  arch/riscv/include/asm/tlb.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/include/asm/tlb.h b/arch/riscv/include/asm/tlb.h
> index c229509288ea..439dc7072e05 100644
> --- a/arch/riscv/include/asm/tlb.h
> +++ b/arch/riscv/include/asm/tlb.h
> @@ -14,6 +14,10 @@
>  #ifndef _ASM_RISCV_TLB_H
>  #define _ASM_RISCV_TLB_H
>
> +struct mmu_gather;
> +
> +static void tlb_flush(struct mmu_gather *tlb);
> +
>  #include <asm-generic/tlb.h>
>
>  static inline void tlb_flush(struct mmu_gather *tlb)

Thanks!  I'm going to take this into my for-linus branch which I'm still hoping 
to tag today, pending my email queue.
