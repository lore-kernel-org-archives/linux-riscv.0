Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9268C05027
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 17:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FkBAIqb+dLQ0xGx79jWr8HqTZJRqSDmibsw0qb70tc4=; b=Si9UHBvW5k2gK4
	yWWkIB0p7jOQIprph9XUQY7hGC0x6Kks2Uqp/rJGipBvj68sxq4LTsQGfZJXZ0/OKh4etGKsVJbCv
	cj4aaP/PtBgwGq/PdPdF+RysOlPrMjNq+z5bHVpP/5REL56BirVL1uENwQLSlurGHq7dcqLWFyEkn
	2ojVOnyvUjiZ6hj8cVnEyuKBXh80dGs4mnu8WnmVzdAYmTcwGwl00lB0AmaEk+E9EGoxmycwyxR6w
	q+p3A9xYDPiHkQaHZmL3AlGo1Y9Z1paoVV7KYdGiwm+dI9KQbCVyR0WYHb9b7cPtI5y9/4Ywuqozb
	p/QO60OPi34k5sJtZ+OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNznG-0034J4-Ot; Fri, 03 Feb 2023 17:24:10 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNznD-0034IV-1y
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 17:24:08 +0000
Received: by mail-ua1-x92e.google.com with SMTP id u16so276024uaa.3
        for <linux-riscv@lists.infradead.org>; Fri, 03 Feb 2023 09:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=89yBHEx50fXHgg0NRtVxRmcfX41pY68ibDRd1lJCdBE=;
        b=i1bAmm9pXyJrF/+0+fr/ZTFt1bZrIjhvURHpdSIFiwY2NCRSk7HXRe/0y+Xqr3hnZQ
         7iUcmveplvQcF88Gb072G53O6PfI+WmLolMwfFKiipcgq94vji+JdyW+f/Y/unB6+1gF
         FApcnuNl0oAXIpbXUUSzo5jevGqDba7pcT6PpjR3SMcgCN2y2T19e435CuuiYtXv7/jK
         dHfV/W9X32xR8CGmkZRMp8q0CKOiUr7u6fdmj+0iOkFzuijeiWRt8f3LoZ3anuRRg19S
         YbKCB0OuIhmnp56e6UJ9bZ2cBDwWEcQuufuMj1NwucgdzQFhnD38tcbqX/ffOPQhY7pS
         sM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89yBHEx50fXHgg0NRtVxRmcfX41pY68ibDRd1lJCdBE=;
        b=7QMnZr2GUz0cPVBxI7t64DLXYkiYR6f+sxPiE0ESSjueBAou8e36SIbLoArrSL6AQK
         iNmUezHL6sJNLB6t4xAcE8OU7UzML4d5rOqkUmrcUrxaxasLSskSjtruotwbK7aZRwcC
         7oMzGBKzodLqne+crEgAmPWFrffyDAXpde7OCJCR0cbtThlGQv/OR3iPw06lfdZozdsm
         0s90kzGT1hat8p5gnZfT6ez8NA+i5hZJkbEPGxwWhnsjEmRhjHMsdNf/lxY06kK1QLQk
         HO0UBmD3yZKnSxiMJApfvPxYiApED3iKMWehuoff+wsN9S/fLmWfXa9ezYnioM417X20
         89Nw==
X-Gm-Message-State: AO0yUKUIPiv9R1+9YYn7OYl9oZ03vsTYjD8Wnyi0efqIDIoBmAgIUuTq
	ImHM5ynuxnKwRqYYp0xDc9ufrU8F/K9ufaptngNWCA==
X-Google-Smtp-Source: AK7set/+VXlwxyGe6xCHHUv/l3mKIi9GWClnq8QEsufCr6kzWA8p9N/KyrABLDApyL/azwQu2KgHFi86awnUSegVyfw=
X-Received: by 2002:ab0:134c:0:b0:419:5b8b:4cda with SMTP id
 h12-20020ab0134c000000b004195b8b4cdamr1715937uae.8.1675445044619; Fri, 03 Feb
 2023 09:24:04 -0800 (PST)
MIME-Version: 1.0
References: <20230130074815.1694055-1-mchitale@ventanamicro.com> <mhng-9764af90-4c82-4d80-9aed-a3234e8b889f@palmer-ri-x1c9>
In-Reply-To: <mhng-9764af90-4c82-4d80-9aed-a3234e8b889f@palmer-ri-x1c9>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 3 Feb 2023 22:53:54 +0530
Message-ID: <CAK9=C2ULVepZ-M57NChK7CGbHCAi2HP15J5kOoXb0-Ler9eMfg@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: mm: Implement pmdp_collapse_flush for THP
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: mchitale@ventanamicro.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, sunnanyong@huawei.com, 
	ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_092407_126032_9A02211F 
X-CRM114-Status: GOOD (  32.08  )
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

On Thu, Feb 2, 2023 at 10:05 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Sun, 29 Jan 2023 23:48:15 PST (-0800), mchitale@ventanamicro.com wrote:
> > When THP is enabled, 4K pages are collapsed into a single huge
> > page using the generic pmdp_collapse_flush() which will further
> > use flush_tlb_range() to shoot-down stale TLB entries. Unfortunately,
> > the generic pmdp_collapse_flush() only invalidates cached leaf PTEs
> > using address specific SFENCEs which results in repetitive (or
> > unpredictable) page faults on RISC-V implementations which cache
> > non-leaf PTEs.
> >
> > Provide a RISC-V specific pmdp_collapse_flush() which ensures both
> > cached leaf and non-leaf PTEs are invalidated by using non-address
> > specific SFENCEs as recommended by the RISC-V privileged specification.
> >
> > Fixes: e88b333142e4 ("riscv: mm: add THP support on 64-bit")
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/pgtable.h |  4 ++++
> >  arch/riscv/mm/pgtable.c          | 26 ++++++++++++++++++++++++++
> >  2 files changed, 30 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > index 4eba9a98d0e3..3e01f4f3ab08 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -721,6 +721,10 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
> >       page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
> >       return __pmd(atomic_long_xchg((atomic_long_t *)pmdp, pmd_val(pmd)));
> >  }
> > +
> > +#define pmdp_collapse_flush pmdp_collapse_flush
> > +extern pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
> > +                              unsigned long address, pmd_t *pmdp);
> >  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
> >
> >  /*
> > diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
> > index 6645ead1a7c1..5da1916c231e 100644
> > --- a/arch/riscv/mm/pgtable.c
> > +++ b/arch/riscv/mm/pgtable.c
> > @@ -81,3 +81,29 @@ int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
> >  }
> >
> >  #endif /* CONFIG_HAVE_ARCH_HUGE_VMAP */
> > +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> > +pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
> > +                                     unsigned long address, pmd_t *pmdp)
> > +{
> > +     pmd_t pmd = pmdp_huge_get_and_clear(vma->vm_mm, address, pmdp);
> > +
> > +     VM_BUG_ON(address & ~HPAGE_PMD_MASK);
> > +     VM_BUG_ON(pmd_trans_huge(*pmdp));
> > +     /*
> > +      * When leaf PTE enteries (regular pages) are collapsed into a leaf
> > +      * PMD entry (huge page), a valid non-leaf PTE is converted into a
> > +      * valid leaf PTE at the level 1 page table. The RISC-V privileged v1.12
> > +      * specification allows implementations to cache valid non-leaf PTEs,
> > +      * but the section "4.2.1 Supervisor Memory-Management Fence
> > +      * Instruction" recommends the following:
> > +      * "If software modifies a non-leaf PTE, it should execute SFENCE.VMA
> > +      * with rs1=x0. If any PTE along the traversal path had its G bit set,
> > +      * rs2 must be x0; otherwise, rs2 should be set to the ASID for which
> > +      * the translation is being modified."
> > +      * Based on the above recommendation, we should do full flush whenever
> > +      * leaf PTE entries are collapsed into a leaf PMD entry.
>
> It's generally best to ignore the recommendations in the commentary
> about flushes, they assume a specific software model that doesn't always
> apply to Linux.  In this case we do need the fence, though, but I
> changed the comment to explain it differently (an fix at least one
> spelling mistake).
>
> I've squashed this in and have it in staging, if that looks good I'll
> put it on fixes.  Thanks!
>
> diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
> index 5da1916c231e..fef4e7328e49 100644
> --- a/arch/riscv/mm/pgtable.c
> +++ b/arch/riscv/mm/pgtable.c
> @@ -90,18 +90,12 @@ pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
>         VM_BUG_ON(address & ~HPAGE_PMD_MASK);
>         VM_BUG_ON(pmd_trans_huge(*pmdp));
>         /*
> -        * When leaf PTE enteries (regular pages) are collapsed into a leaf
> +        * When leaf PTE entries (regular pages) are collapsed into a leaf
>          * PMD entry (huge page), a valid non-leaf PTE is converted into a
> -        * valid leaf PTE at the level 1 page table. The RISC-V privileged v1.12
> -        * specification allows implementations to cache valid non-leaf PTEs,
> -        * but the section "4.2.1 Supervisor Memory-Management Fence
> -        * Instruction" recommends the following:
> -        * "If software modifies a non-leaf PTE, it should execute SFENCE.VMA
> -        * with rs1=x0. If any PTE along the traversal path had its G bit set,
> -        * rs2 must be x0; otherwise, rs2 should be set to the ASID for which
> -        * the translation is being modified."
> -        * Based on the above recommendation, we should do full flush whenever
> -        * leaf PTE entries are collapsed into a leaf PMD entry.
> +        * valid leaf PTE at the level 1 page table.  Since the sfence.vma
> +        * forms that specify an address only apply to leaf PTEs, we need a
> +        * global flush here.  collapse_huge_page() assumes these flushes are
> +        * eager, so just do the fence here.
>          */
>         flush_tlb_mm(vma->vm_mm);
>         return pmd;

This looks good to me. Please add it to the list of fixes.

Regards,
Anup

>
>
> > +      */
> > +     flush_tlb_mm(vma->vm_mm);
> > +     return pmd;
> > +}
> > +#endif /* CONFIG_TRANSPARENT_HUGEPAGE */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
