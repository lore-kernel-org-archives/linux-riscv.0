Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C828BC61CE8
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 06:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gWA4rWQFblMHLyOQJiiZfpNfuYpQigR0aYmrhJ+YKZY=; b=kvUNAEzh7EcWTl
	YK1vtmOKgOgOz5Gq9bxT/DLPBkuRDtUMxZ27M0x5Cdok6a8zx9i54zcbpdLHKlv25hwXDGFHWFBfe
	vHwvuUrwdxWLYtNIm5WMvCixMcnKv+UHf7isxIzkzDj4dI4TtEQ/DH0nICvjaqbj3kT5xJutUJpKP
	Jd7ZPvedm3d2ODtUIFdfTSmvb/D5fQUW0VQCvEGDNM85fOoJ7LBHAzZnMfWqO/mPK4+srRCQ8/7It
	8ivJV88NamZGEziK1cr3pyNstM9gXh2VucMBglYHCmUuZUDe27+iNktCZgZeTY2Nn/NpHJSUB/VZK
	PUV9Sn8TUDQEnwmmzKNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPbnh-0000000CMPz-0Cz7;
	Thu, 12 Jun 2025 06:52:37 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPbne-0000000CMPc-1mez
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 06:52:35 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-2d0d25cebfeso431620fac.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 23:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749711153; x=1750315953; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W2/+iUlaJ294s+wpba9MY64GmUZ7LAOV32lfNtCqjkY=;
        b=hRtuhXanXFEa8JM0M1oftKh+78vLg94V6PwjNIRVXoLK0EVnpbPTEkMA/94mU3RFGo
         a6N4rTY9WtgnQvEB59lK1CL3LrSzw1BgZYC6TuVxKkHddEkQyFR5htKR24h/xqUYMPia
         rjfYLToeSNc5fj5smomxGMmY0QVK3vai7qWIQNO0YvhXux9pYTZiQmqSvxUo23syOt8X
         zBBF0dUibgQkzgRGQ2X5to7XoshRpIUTAUad0pxyIqo/JYgCYpNzErodaC+TjLoUmMn8
         2ZuuY9K70cMx0r0g0A8pSxpuhinuwYCMyDMB4F6b4gFUE+JyGiS1kWdxmf/iw5uX3e5d
         aq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749711153; x=1750315953;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2/+iUlaJ294s+wpba9MY64GmUZ7LAOV32lfNtCqjkY=;
        b=VOi7fYQJR2Gk1FxCZLzygVCB+SuwhMuDIq7Y0iZZjXAmypBF89HZ18niDoelZwvyXe
         QDNKQsH8SwwWE+EX+oP9lmF6B25Q23hCJi3CwGdsWrZ98xd0gDdzKursZs6EqK0dMLbz
         LNuXIDmnn0xW/YDLVeyvatQosF+rq7qka/s4zdDBcrwsfZOn6qhyL/idNUxI96D9JVtU
         tAr4Ib28nbe5YbkxW6Mi6VNGh6G+oRwqQspjU6q4NeTtyjpgYNT5iZr7oEKMtWAMabkC
         yohvsfHKY7io0pZGeKwquSfDhBt0/znKUqhtoQmrg7WKnZiYbyzdxTLawGH/8qfTlu8f
         fUxw==
X-Forwarded-Encrypted: i=1; AJvYcCVs8iXg+e7leE1tfG0Zo+0AiVWQvvtOeuGEzbFgKQVDeBbq025+bWbKaIPrL+FAju2GN9PU5CD2100W5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmQLzQjShfMqGtWZSb9y0l1A+Qe+y0n36m5EOme5Q36m3/vbKL
	SAC6UUp7F1UgyZqZwweUIqn6WTBUcmmIoTDjLXolC/4XPLIBmpOS3TVN3Q6qrV/0AJWkoI6XqG2
	L47PsRyWg3ICCrTdGQglhQri/IYtlngAZzhpY1HM=
X-Gm-Gg: ASbGncuVitZ3rVzqT41jJtnkxNewsrUL8DOrKpOY1bNz4wK/JJuGBOeE2wYGTvSyXt7
	f/zaam0ZWgsJDA/dIeZolHVKtk8RxdyRI65jBglGx2TAb3iDHA31B7kcOrhkz+bgpVq+A6Wr6WJ
	g03tVk5JC4S7I8ZOC88U21Y9+M/C7CcILXLHwatTjosd4EcIxR+a5WNbyXASZigW06YNLYEhM1K
	aQ=
X-Google-Smtp-Source: AGHT+IEXaSAxJHBD5zJ/jXr/ytazFvv/SzoH8XkasFy+/Ngo9EnWqRZ5Z/KblRlbN0mv5KgJa+BmqpKyWeNniLArqs8=
X-Received: by 2002:a05:6870:b489:b0:2e8:7471:6350 with SMTP id
 586e51a60fabf-2eab6ee974fmr940028fac.1.1749711153330; Wed, 11 Jun 2025
 23:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250409095320.224100-1-zhangchunyan@iscas.ac.cn>
 <20250409095320.224100-3-zhangchunyan@iscas.ac.cn> <aEMkW8py61njmNLo@debug.ba.rivosinc.com>
In-Reply-To: <aEMkW8py61njmNLo@debug.ba.rivosinc.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Thu, 12 Jun 2025 14:51:57 +0800
X-Gm-Features: AX0GCFvfXefT5-e0VhoPel5shfY3P4DRms3fCl30qyUVp20BchYZ18iAG961p5E
Message-ID: <CAAfSe-u3oyjW7D0f=XUVaOJsM00Mqx7-LeR-Ecxjui3sfaAMUQ@mail.gmail.com>
Subject: Re: [PATCH RFC v7 2/3] riscv: mm: Add soft-dirty page tracking support
To: Deepak Gupta <debug@rivosinc.com>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	Ved Shanbhogue <ved@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_235234_466511_5DECE476 
X-CRM114-Status: GOOD (  24.37  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Deepak,

On Sat, 7 Jun 2025 at 01:24, Deepak Gupta <debug@rivosinc.com> wrote:
>
> On Wed, Apr 09, 2025 at 05:53:19PM +0800, Chunyan Zhang wrote:
> >The Svrsw60t59b extension allows to free the PTE reserved bits 60 and 59
> >for software, this patch uses bit 59 for soft-dirty.
> >
> >To add swap PTE soft-dirty tracking, we borrow bit 3 which is available
> >for swap PTEs on RISC-V systems.
> >
> >Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> >---
> > arch/riscv/Kconfig                    |  1 +
> > arch/riscv/include/asm/pgtable-bits.h | 19 +++++++
> > arch/riscv/include/asm/pgtable.h      | 71 ++++++++++++++++++++++++++-
> > 3 files changed, 89 insertions(+), 2 deletions(-)
> >
> >diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> >index 332fc00243ad..652e2bbfb702 100644
> >--- a/arch/riscv/Kconfig
> >+++ b/arch/riscv/Kconfig
> >@@ -139,6 +139,7 @@ config RISCV
> >       select HAVE_ARCH_MMAP_RND_COMPAT_BITS if COMPAT
> >       select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
> >       select HAVE_ARCH_SECCOMP_FILTER
> >+      select HAVE_ARCH_SOFT_DIRTY if 64BIT && MMU && RISCV_ISA_SVRSW60T59B
> >       select HAVE_ARCH_STACKLEAK
> >       select HAVE_ARCH_THREAD_STRUCT_WHITELIST
> >       select HAVE_ARCH_TRACEHOOK
> >diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
> >index a8f5205cea54..a6fa871dc19e 100644
> >--- a/arch/riscv/include/asm/pgtable-bits.h
> >+++ b/arch/riscv/include/asm/pgtable-bits.h
> >@@ -20,6 +20,25 @@
> >
> > #define _PAGE_SPECIAL   (1 << 8)    /* RSW: 0x1 */
> > #define _PAGE_DEVMAP    (1 << 9)    /* RSW, devmap */
> >+
> >+#ifdef CONFIG_MEM_SOFT_DIRTY
> >+
> >+/* ext_svrsw60t59b: bit 59 for software dirty tracking */
> >+#define _PAGE_SOFT_DIRTY                                              \
> >+      ((riscv_has_extension_unlikely(RISCV_ISA_EXT_SVRSW60T59B)) ?    \
> >+       (1UL << 59) : 0)
> >+/*
> >+ * Bit 3 is always zero for swap entry computation, so we
> >+ * can borrow it for swap page soft-dirty tracking.
> >+ */
> >+#define _PAGE_SWP_SOFT_DIRTY                                          \
> >+      ((riscv_has_extension_unlikely(RISCV_ISA_EXT_SVRSW60T59B)) ?    \
> >+       _PAGE_EXEC : 0)
> >+#else
> >+#define _PAGE_SOFT_DIRTY      0
> >+#define _PAGE_SWP_SOFT_DIRTY  0
> >+#endif /* CONFIG_MEM_SOFT_DIRTY */
> >+
>
> Above can be done like this
>
> +
> +#ifdef CONFIG_MEM_SOFT_DIRTY && RISCV_ISA_EXT_SVRSW60T59B
> +
> +/* ext_svrsw60t59b: bit 59 for software dirty tracking */
> +#define _PAGE_SOFT_DIRTY (1UL << 59)
> +/*
> + * Bit 3 is always zero for swap entry computation, so we
> + * can borrow it for swap page soft-dirty tracking.
> + */
> +#define _PAGE_SWP_SOFT_DIRTY _PAGE_EXEC
> +#else
> +#define _PAGE_SOFT_DIRTY       0
> +#define _PAGE_SWP_SOFT_DIRTY   0
> +#endif /* CONFIG_MEM_SOFT_DIRTY */
>

No, the feature depends not only on the compile-time configuration but
also on the run-time environment.

We need to check if the platform on which the system is running
supports the extension SVRSW60T59B, and riscv_has_extension_unlikely()
does that check that is a run-time check, not a build-time condition.

> > #define _PAGE_TABLE     _PAGE_PRESENT
> >
> > /*
> >diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> >index 428e48e5f57d..14461ffe6321 100644
> >--- a/arch/riscv/include/asm/pgtable.h
> >+++ b/arch/riscv/include/asm/pgtable.h
> >@@ -436,7 +436,7 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
>
> Shouldn't "static inline int pte_dirty(pte_t pte)" be updated as well

It may not be needed, since pte_dirty() on X86 and ARM doesn't check
_PAGE_SOFT_DIRTY either.

Thanks for the review,
Chunyan




>
> static inline int pte_dirty(pte_t pte)
> {
>         return pte_val(pte) & (_PAGE_DIRTY | _PAGE_SOFT_DIRTY);
> }
>
> Perhaps have a macro which includes both dirty together and then use together.
>
>
> >
> > static inline pte_t pte_mkdirty(pte_t pte)
> > {
> >-      return __pte(pte_val(pte) | _PAGE_DIRTY);
> >+      return __pte(pte_val(pte) | _PAGE_DIRTY | _PAGE_SOFT_DIRTY);
> > }
> >
> > static inline pte_t pte_mkclean(pte_t pte)
> >@@ -469,6 +469,38 @@ static inline pte_t pte_mkhuge(pte_t pte)
> >       return pte;
> > }
> >
> >+#ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
> >+static inline bool pte_soft_dirty(pte_t pte)
> >+{
> >+      return !!(pte_val(pte) & _PAGE_SOFT_DIRTY);
> >+}
> >+
> >+static inline pte_t pte_mksoft_dirty(pte_t pte)
> >+{
> >+      return __pte(pte_val(pte) | _PAGE_SOFT_DIRTY);
> >+}
> >+
> >+static inline pte_t pte_clear_soft_dirty(pte_t pte)
> >+{
> >+      return __pte(pte_val(pte) & ~(_PAGE_SOFT_DIRTY));
> >+}
> >+
> >+static inline bool pte_swp_soft_dirty(pte_t pte)
> >+{
> >+      return !!(pte_val(pte) & _PAGE_SWP_SOFT_DIRTY);
> >+}
> >+
> >+static inline pte_t pte_swp_mksoft_dirty(pte_t pte)
> >+{
> >+      return __pte(pte_val(pte) | _PAGE_SWP_SOFT_DIRTY);
> >+}
> >+
> >+static inline pte_t pte_swp_clear_soft_dirty(pte_t pte)
> >+{
> >+      return __pte(pte_val(pte) & ~(_PAGE_SWP_SOFT_DIRTY));
> >+}
> >+#endif /* CONFIG_HAVE_ARCH_SOFT_DIRTY */
> >+
> > #ifdef CONFIG_RISCV_ISA_SVNAPOT
> > #define pte_leaf_size(pte)    (pte_napot(pte) ?                               \
> >                                       napot_cont_size(napot_cont_order(pte)) :\
> >@@ -821,6 +853,40 @@ static inline pud_t pud_mkspecial(pud_t pud)
> > }
> > #endif
> >
> >+#ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
> >+static inline bool pmd_soft_dirty(pmd_t pmd)
> >+{
> >+      return pte_soft_dirty(pmd_pte(pmd));
> >+}
> >+
> >+static inline pmd_t pmd_mksoft_dirty(pmd_t pmd)
> >+{
> >+      return pte_pmd(pte_mksoft_dirty(pmd_pte(pmd)));
> >+}
> >+
> >+static inline pmd_t pmd_clear_soft_dirty(pmd_t pmd)
> >+{
> >+      return pte_pmd(pte_clear_soft_dirty(pmd_pte(pmd)));
> >+}
> >+
> >+#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
> >+static inline bool pmd_swp_soft_dirty(pmd_t pmd)
> >+{
> >+      return pte_swp_soft_dirty(pmd_pte(pmd));
> >+}
> >+
> >+static inline pmd_t pmd_swp_mksoft_dirty(pmd_t pmd)
> >+{
> >+      return pte_pmd(pte_swp_mksoft_dirty(pmd_pte(pmd)));
> >+}
> >+
> >+static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
> >+{
> >+      return pte_pmd(pte_swp_clear_soft_dirty(pmd_pte(pmd)));
> >+}
> >+#endif /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
> >+#endif /* CONFIG_HAVE_ARCH_SOFT_DIRTY */
> >+
> > static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
> >                               pmd_t *pmdp, pmd_t pmd)
> > {
> >@@ -910,7 +976,8 @@ extern pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
> >  *
> >  * Format of swap PTE:
> >  *    bit            0:       _PAGE_PRESENT (zero)
> >- *    bit       1 to 3:       _PAGE_LEAF (zero)
> >+ *    bit       1 to 2:       (zero)
> >+ *    bit            3:       _PAGE_SWP_SOFT_DIRTY
> >  *    bit            5:       _PAGE_PROT_NONE (zero)
> >  *    bit            6:       exclusive marker
> >  *    bits      7 to 11:      swap type
> >--
> >2.34.1
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
