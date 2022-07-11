Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CA6C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 04:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w+AFuz+kQIvE5KP16dW5Lb73DXZ28ZRLFt+36u5cGEM=; b=SYw+poLPCEGJ86
	Da1MbL/GdWqVVH8ZgKRtr1I7DHXZoWJjrqKcUFWDDvHUOwBoJ5wgs815BlWalRI2Jww6Eray392jD
	IwUob0LRxtVXfj3HX8cc+x91JI6d/SpKWpfoHLNj3fuIfiVqU1cuH0xd5CPawEN5AfGn6irNcuhrz
	K8sI5Os6M7+Bl1YlvWsZo9It1NzxPaHUYU80JSVskJ4aclVhDHrEAi13W2BVkJdRW4pCMUAYQ12Va
	3oVAej39e9rD81xhVvtC4i8/n4MkyOcDmdzPItM4SoqkcjQHBeSFITvK26fzRV7muq3I6bD6SGMrY
	vj7VcftTanCrAH+YR4og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAks3-00FqWo-1H; Mon, 11 Jul 2022 04:18:07 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAks0-00FqVb-Lb
	for linux-riscv@lists.infradead.org; Mon, 11 Jul 2022 04:18:06 +0000
Received: by mail-lf1-x136.google.com with SMTP id m18so6714710lfg.10
        for <linux-riscv@lists.infradead.org>; Sun, 10 Jul 2022 21:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BXMvZ5KKLKE+nh0OYbWGNjBxoJw8VkWFj1ZZS1mY0SI=;
        b=ej7GRO+QKUJQH443sPYaA4gOJkZCo7IxmJpeWGl0AHhMCNInxVZNLwcZLElsVyptjU
         HhylwHvV+PAQSFFof10iJ3Tutb31VJYYIei1/pB0iuKwvu9hN5fNbOhaYDOajU/fN5+x
         dS+2r69qPtHMvstkwMGqSe80+dbmc+YQRJG/qRtXFtiEEDz3lbFXLdScVNoRLZevtRiU
         KZ0uCx/FGRKgdkwysWBbSVgc18Ibey3GaT5en28gRMQRXbfes9HT6YTTEeFwVzCmPusl
         W3cU8H8oiBBjedFYSna5ze/37MrNAuWwy+jkuhtT6NBzeeDeP8Ss8M3sBIntsGoDGe27
         CX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BXMvZ5KKLKE+nh0OYbWGNjBxoJw8VkWFj1ZZS1mY0SI=;
        b=MjNpgi9qv1ZjAA32TbiA+o/f0XUpRlgp6Guw9GLDhn6mBtpm/uDYGW8aVybkZHVXEo
         Lv+mX8ODxDVwo9P4sqOKtK06al3c3877kstp8yh9i5D13e05yBu2FpVd+suqS7ks3LyS
         Ci0XJfvmmltOYyo3yxmNNlfjkQ81QgBUFlSOuRVyxN9GHA+2ZwMErqo6o5wz7uJSWhPV
         00W10K3fVD1H6Xetd1IbvBTy7ap13sQZn4+Pcd08q0RBue9kCVSgRMZyVc3QUh0snVUH
         vOFOe4RFA/x2P4v/va1DKtHwRFkIYqF+IlC/wE+lu23KLbMRHS6Fdy9syQnn9HMLjjhR
         KJWw==
X-Gm-Message-State: AJIora//+coR39UXHe5SEMiyv5JXVPeJ6VoZniRtwGDDeX/+4zEBJP0x
	ED1an5hHqZcB1BiGxoFlektVwLcx5C2MKltvQmPC9g==
X-Google-Smtp-Source: AGRyM1uLPA/b/bMbbC5qfsVLjsr93id3RByQNKW8mBzZDyUntxtEJGIfmJ6aXXnyNhDo5y4BGMCTWvJhjWZ8nKtpZuk=
X-Received: by 2002:a19:5f46:0:b0:488:4e69:2da2 with SMTP id
 a6-20020a195f46000000b004884e692da2mr10794220lfj.130.1657513081932; Sun, 10
 Jul 2022 21:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220707145248.458771-1-apatel@ventanamicro.com> <20220707145248.458771-3-apatel@ventanamicro.com>
In-Reply-To: <20220707145248.458771-3-apatel@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 11 Jul 2022 09:47:46 +0530
Message-ID: <CAK9=C2U9jmbgE7FDzBqGChd+HffBdod7+8b_n45HzqYY1amd_Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] riscv: Fix missing PAGE_PFN_MASK
To: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
	Alexandre Ghiti <alexandre.ghiti@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_211804_750675_EF726EC8 
X-CRM114-Status: GOOD (  19.01  )
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

On Thu, Jul 7, 2022 at 8:23 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
>
> There are a bunch of functions that use the PFN from a page table entry
> that end up with the svpbmt upper-bits because they are missing the newly
> introduced PAGE_PFN_MASK which leads to wrong addresses conversions and
> then crash: fix this by adding this mask.
>
> Fixes: 100631b48ded ("riscv: Fix accessing pfn bits in PTEs for non-32bit variants")
> Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>

I have queued this patch for 5.19-rcX fixes which I will send-out this week.

Thanks,
Anup

> ---
>  arch/riscv/include/asm/pgtable-64.h | 12 ++++++------
>  arch/riscv/include/asm/pgtable.h    |  6 +++---
>  arch/riscv/kvm/mmu.c                |  2 +-
>  3 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> index 5c2aba5efbd0..dc42375c2357 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -175,7 +175,7 @@ static inline pud_t pfn_pud(unsigned long pfn, pgprot_t prot)
>
>  static inline unsigned long _pud_pfn(pud_t pud)
>  {
> -       return pud_val(pud) >> _PAGE_PFN_SHIFT;
> +       return __page_val_to_pfn(pud_val(pud));
>  }
>
>  static inline pmd_t *pud_pgtable(pud_t pud)
> @@ -278,13 +278,13 @@ static inline p4d_t pfn_p4d(unsigned long pfn, pgprot_t prot)
>
>  static inline unsigned long _p4d_pfn(p4d_t p4d)
>  {
> -       return p4d_val(p4d) >> _PAGE_PFN_SHIFT;
> +       return __page_val_to_pfn(p4d_val(p4d));
>  }
>
>  static inline pud_t *p4d_pgtable(p4d_t p4d)
>  {
>         if (pgtable_l4_enabled)
> -               return (pud_t *)pfn_to_virt(p4d_val(p4d) >> _PAGE_PFN_SHIFT);
> +               return (pud_t *)pfn_to_virt(__page_val_to_pfn(p4d_val(p4d)));
>
>         return (pud_t *)pud_pgtable((pud_t) { p4d_val(p4d) });
>  }
> @@ -292,7 +292,7 @@ static inline pud_t *p4d_pgtable(p4d_t p4d)
>
>  static inline struct page *p4d_page(p4d_t p4d)
>  {
> -       return pfn_to_page(p4d_val(p4d) >> _PAGE_PFN_SHIFT);
> +       return pfn_to_page(__page_val_to_pfn(p4d_val(p4d)));
>  }
>
>  #define pud_index(addr) (((addr) >> PUD_SHIFT) & (PTRS_PER_PUD - 1))
> @@ -347,7 +347,7 @@ static inline void pgd_clear(pgd_t *pgd)
>  static inline p4d_t *pgd_pgtable(pgd_t pgd)
>  {
>         if (pgtable_l5_enabled)
> -               return (p4d_t *)pfn_to_virt(pgd_val(pgd) >> _PAGE_PFN_SHIFT);
> +               return (p4d_t *)pfn_to_virt(__page_val_to_pfn(pgd_val(pgd)));
>
>         return (p4d_t *)p4d_pgtable((p4d_t) { pgd_val(pgd) });
>  }
> @@ -355,7 +355,7 @@ static inline p4d_t *pgd_pgtable(pgd_t pgd)
>
>  static inline struct page *pgd_page(pgd_t pgd)
>  {
> -       return pfn_to_page(pgd_val(pgd) >> _PAGE_PFN_SHIFT);
> +       return pfn_to_page(__page_val_to_pfn(pgd_val(pgd)));
>  }
>  #define pgd_page(pgd)  pgd_page(pgd)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 1d1be9d9419c..5dbd6610729b 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -261,7 +261,7 @@ static inline pgd_t pfn_pgd(unsigned long pfn, pgprot_t prot)
>
>  static inline unsigned long _pgd_pfn(pgd_t pgd)
>  {
> -       return pgd_val(pgd) >> _PAGE_PFN_SHIFT;
> +       return __page_val_to_pfn(pgd_val(pgd));
>  }
>
>  static inline struct page *pmd_page(pmd_t pmd)
> @@ -590,14 +590,14 @@ static inline pmd_t pmd_mkinvalid(pmd_t pmd)
>         return __pmd(pmd_val(pmd) & ~(_PAGE_PRESENT|_PAGE_PROT_NONE));
>  }
>
> -#define __pmd_to_phys(pmd)  (pmd_val(pmd) >> _PAGE_PFN_SHIFT << PAGE_SHIFT)
> +#define __pmd_to_phys(pmd)  (__page_val_to_pfn(pmd_val(pmd)) << PAGE_SHIFT)
>
>  static inline unsigned long pmd_pfn(pmd_t pmd)
>  {
>         return ((__pmd_to_phys(pmd) & PMD_MASK) >> PAGE_SHIFT);
>  }
>
> -#define __pud_to_phys(pud)  (pud_val(pud) >> _PAGE_PFN_SHIFT << PAGE_SHIFT)
> +#define __pud_to_phys(pud)  (__page_val_to_pfn(pud_val(pud)) << PAGE_SHIFT)
>
>  static inline unsigned long pud_pfn(pud_t pud)
>  {
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 2965284a490d..b75d4e200064 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -54,7 +54,7 @@ static inline unsigned long gstage_pte_index(gpa_t addr, u32 level)
>
>  static inline unsigned long gstage_pte_page_vaddr(pte_t pte)
>  {
> -       return (unsigned long)pfn_to_virt(pte_val(pte) >> _PAGE_PFN_SHIFT);
> +       return (unsigned long)pfn_to_virt(__page_val_to_pfn(pte_val(pte)));
>  }
>
>  static int gstage_page_size_to_level(unsigned long page_size, u32 *out_level)
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
