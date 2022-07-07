Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E70C43334
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 14:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5CW65qkAi4EOZ8r1RMH+8PrpAmnruJIWC10PhZqkyAQ=; b=vlZVNqG0rIZI/h
	81ircSPOlcs3MVw8f3BN1USTgnDUW+mPyFqGxo2Z3VxFO5rcUtqJpQLdPi8gC+niMD1KjL+6Vensi
	VU2gOfIrGD/fVJCN/SbIepq8jDFPc/Oj5ZZCUdd5vTPGhmeTII3vp5lMmSRNEQKqHCGsezUeIm4bK
	oqqv1ZYXmFKrbF6/VIpmYzqOj8Ozi3bIYT0nJZLqRMhFXwzi35StcLs5AHj35mx3X9eYNycEKGbIu
	PgGbnTH9Une9jfUNEW7xUzN1+n48zyk7Wf1y/9X5rjyLfftslpDcbMeS/lsPbL0KwKoXiQw6vyYaM
	3HZ1+QA352WaMWEvEfDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Svx-00GefN-IN; Thu, 07 Jul 2022 14:56:49 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Svu-00GedP-S7
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 14:56:48 +0000
Received: by mail-wr1-x434.google.com with SMTP id b26so26732810wrc.2
        for <linux-riscv@lists.infradead.org>; Thu, 07 Jul 2022 07:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cLr9Mmcric0DyXLOpIzNCFgMkTA1VLMFK7jDaemXdLU=;
        b=H98wdu5qDGy04oCMwt6ovs0q+XccQqlJ766KgBBKbE3CHuBxjJ1N3NSADsMt8NTJTP
         PJiSMgA2LOpwUXSANpfNHiUYnOzowZJnMjpdIAoEajWX2iW656Z2qt9JRPSyHjBdNAE0
         RGJXvdn6TqeQuHG7WPFxhoW6XELXihSiEO4wrFztAI+oR6MySQkM9dOj1TqZF975WQlf
         IJHpoUxI13I73GJ1w2wLJ/Dp8wREErwQEhh4e138xlHq1u66i9uQ/7PYRjhzcdiQnNgE
         pPeIwjfr79919Ko/EoHAbuN+A6Lg08K4zn29tZajlD7J9PIgQgWMqjH2GZq9DWMg6Fr/
         yOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cLr9Mmcric0DyXLOpIzNCFgMkTA1VLMFK7jDaemXdLU=;
        b=Sc+wFpOS/2r7Od8AlgU+8SBqc+t0nal1t3qNO7tXSxhlmOcYL7OBWIngPRORDyMS+3
         IuJYRC4zVoBRUmZrVRS3/bF8UyuhmoJc/fW1ozsctmQqPMxY4bGlZLGS1rpZoBo1HUY0
         +I+ZK7WJ9cXHJsvjhWCsoWYMaZe6rSqsJmX5CGdcW6l7bVWNg2hRD1atR1yGugW9ROWi
         TPuoUQpdfLgLUUrJ8ja5Q/XLDH4RPjSN59cV05iVKQtUJS8qAT7YKbwUUtGjZOwr019b
         m11ei/WPqMIHP9t9eT1NwGWS7rPNQawCn+x2RMXCrDuTuTukn1+ClBMj+oxIDUrddbeY
         Rq5Q==
X-Gm-Message-State: AJIora+/GKECqiKH2DdnmdqdZvBy8G60yvVZivmV5CAnXvUrfZ8ItILS
	mOQeMJXo/ik0uNO3UmgqwI9Zm1UoKANYA0sdRkqusg==
X-Google-Smtp-Source: AGRyM1v2GKFg3mDosjnF8piazRMU2qMePGvWEuuAe8aZZ3/XVozApEBgtIF6+Dtf0usPsP6pOOONf283f3z8fh4OUbM=
X-Received: by 2002:adf:e9cf:0:b0:21d:7b89:da5 with SMTP id
 l15-20020adfe9cf000000b0021d7b890da5mr9332902wrn.346.1657205804325; Thu, 07
 Jul 2022 07:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220613085307.260256-1-alexandre.ghiti@canonical.com> <CAAhSdy1gr_WvCJUMXMwtZUux9qBsW-b_LGFg4=tdnkv5b538sg@mail.gmail.com>
In-Reply-To: <CAAhSdy1gr_WvCJUMXMwtZUux9qBsW-b_LGFg4=tdnkv5b538sg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 7 Jul 2022 20:26:31 +0530
Message-ID: <CAAhSdy3_EvAZJtHxFH=ihrfUaPUmp5EbXNY4eD+CRsiqNkYx9w@mail.gmail.com>
Subject: Re: [PATCH -fixes v2] riscv: Fix missing PAGE_PFN_MASK
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_075647_017989_0709C3B5 
X-CRM114-Status: GOOD (  23.01  )
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

Hi Palmer,

On Mon, Jun 13, 2022 at 3:01 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Jun 13, 2022 at 2:23 PM Alexandre Ghiti
> <alexandre.ghiti@canonical.com> wrote:
> >
> > There are a bunch of functions that use the PFN from a page table entry
> > that end up with the svpbmt upper-bits because they are missing the newly
> > introduced PAGE_PFN_MASK which leads to wrong addresses conversions and
> > then crash: fix this by adding this mask.
> >
> > Fixes: 100631b48ded ("riscv: Fix accessing pfn bits in PTEs for non-32bit variants")
> > Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
>
> Looks good to me.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>
>
> @Palmer let me know if you want me to take this through the KVM repo.

This patch is required for KVM Svpbmt support so I have included it
in my KVM RISC-V Svpbmt series.

Let me know if you plan to send this as fix for Linux-5.19-rcX

Regards,
Anup

>
> Regards,
> Anup
>
> > ---
> >  arch/riscv/include/asm/pgtable-64.h | 12 ++++++------
> >  arch/riscv/include/asm/pgtable.h    |  6 +++---
> >  arch/riscv/kvm/mmu.c                |  2 +-
> >  3 files changed, 10 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> > index 5c2aba5efbd0..dc42375c2357 100644
> > --- a/arch/riscv/include/asm/pgtable-64.h
> > +++ b/arch/riscv/include/asm/pgtable-64.h
> > @@ -175,7 +175,7 @@ static inline pud_t pfn_pud(unsigned long pfn, pgprot_t prot)
> >
> >  static inline unsigned long _pud_pfn(pud_t pud)
> >  {
> > -       return pud_val(pud) >> _PAGE_PFN_SHIFT;
> > +       return __page_val_to_pfn(pud_val(pud));
> >  }
> >
> >  static inline pmd_t *pud_pgtable(pud_t pud)
> > @@ -278,13 +278,13 @@ static inline p4d_t pfn_p4d(unsigned long pfn, pgprot_t prot)
> >
> >  static inline unsigned long _p4d_pfn(p4d_t p4d)
> >  {
> > -       return p4d_val(p4d) >> _PAGE_PFN_SHIFT;
> > +       return __page_val_to_pfn(p4d_val(p4d));
> >  }
> >
> >  static inline pud_t *p4d_pgtable(p4d_t p4d)
> >  {
> >         if (pgtable_l4_enabled)
> > -               return (pud_t *)pfn_to_virt(p4d_val(p4d) >> _PAGE_PFN_SHIFT);
> > +               return (pud_t *)pfn_to_virt(__page_val_to_pfn(p4d_val(p4d)));
> >
> >         return (pud_t *)pud_pgtable((pud_t) { p4d_val(p4d) });
> >  }
> > @@ -292,7 +292,7 @@ static inline pud_t *p4d_pgtable(p4d_t p4d)
> >
> >  static inline struct page *p4d_page(p4d_t p4d)
> >  {
> > -       return pfn_to_page(p4d_val(p4d) >> _PAGE_PFN_SHIFT);
> > +       return pfn_to_page(__page_val_to_pfn(p4d_val(p4d)));
> >  }
> >
> >  #define pud_index(addr) (((addr) >> PUD_SHIFT) & (PTRS_PER_PUD - 1))
> > @@ -347,7 +347,7 @@ static inline void pgd_clear(pgd_t *pgd)
> >  static inline p4d_t *pgd_pgtable(pgd_t pgd)
> >  {
> >         if (pgtable_l5_enabled)
> > -               return (p4d_t *)pfn_to_virt(pgd_val(pgd) >> _PAGE_PFN_SHIFT);
> > +               return (p4d_t *)pfn_to_virt(__page_val_to_pfn(pgd_val(pgd)));
> >
> >         return (p4d_t *)p4d_pgtable((p4d_t) { pgd_val(pgd) });
> >  }
> > @@ -355,7 +355,7 @@ static inline p4d_t *pgd_pgtable(pgd_t pgd)
> >
> >  static inline struct page *pgd_page(pgd_t pgd)
> >  {
> > -       return pfn_to_page(pgd_val(pgd) >> _PAGE_PFN_SHIFT);
> > +       return pfn_to_page(__page_val_to_pfn(pgd_val(pgd)));
> >  }
> >  #define pgd_page(pgd)  pgd_page(pgd)
> >
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > index 1d1be9d9419c..5dbd6610729b 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -261,7 +261,7 @@ static inline pgd_t pfn_pgd(unsigned long pfn, pgprot_t prot)
> >
> >  static inline unsigned long _pgd_pfn(pgd_t pgd)
> >  {
> > -       return pgd_val(pgd) >> _PAGE_PFN_SHIFT;
> > +       return __page_val_to_pfn(pgd_val(pgd));
> >  }
> >
> >  static inline struct page *pmd_page(pmd_t pmd)
> > @@ -590,14 +590,14 @@ static inline pmd_t pmd_mkinvalid(pmd_t pmd)
> >         return __pmd(pmd_val(pmd) & ~(_PAGE_PRESENT|_PAGE_PROT_NONE));
> >  }
> >
> > -#define __pmd_to_phys(pmd)  (pmd_val(pmd) >> _PAGE_PFN_SHIFT << PAGE_SHIFT)
> > +#define __pmd_to_phys(pmd)  (__page_val_to_pfn(pmd_val(pmd)) << PAGE_SHIFT)
> >
> >  static inline unsigned long pmd_pfn(pmd_t pmd)
> >  {
> >         return ((__pmd_to_phys(pmd) & PMD_MASK) >> PAGE_SHIFT);
> >  }
> >
> > -#define __pud_to_phys(pud)  (pud_val(pud) >> _PAGE_PFN_SHIFT << PAGE_SHIFT)
> > +#define __pud_to_phys(pud)  (__page_val_to_pfn(pud_val(pud)) << PAGE_SHIFT)
> >
> >  static inline unsigned long pud_pfn(pud_t pud)
> >  {
> > diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> > index 1c00695ebee7..9826073fbc67 100644
> > --- a/arch/riscv/kvm/mmu.c
> > +++ b/arch/riscv/kvm/mmu.c
> > @@ -54,7 +54,7 @@ static inline unsigned long gstage_pte_index(gpa_t addr, u32 level)
> >
> >  static inline unsigned long gstage_pte_page_vaddr(pte_t pte)
> >  {
> > -       return (unsigned long)pfn_to_virt(pte_val(pte) >> _PAGE_PFN_SHIFT);
> > +       return (unsigned long)pfn_to_virt(__page_val_to_pfn(pte_val(pte)));
> >  }
> >
> >  static int gstage_page_size_to_level(unsigned long page_size, u32 *out_level)
> > --
> > 2.34.1
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
