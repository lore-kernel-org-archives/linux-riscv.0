Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB39EEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 13:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=C1AM9+yLUbU+M4+Wi5qlipVFJoP2S7GtG9PIbDilyLk=; b=tl8lZcHu0DBbUXu1OB1U69qvg8
	5IQKhI3FNKAqrfDc1waE5DuNut6Phdk/vS9/rvvntXYVtkjMF+aTTxthMIGgdpbmzLDNnwqSHjhaM
	b2rC93hHmHIhkmD2GD4Y1Uk+c/slDKuDUodhezDAQ1n2oxQbmU+6iNPu1BQs1xCT0ymvPGZyaySXY
	6ZcGyRD3dqutjxojfWzPNzEkIK+6swjk9r6xSe1BY712E81QX6m9FP9icaHQYOqaYjcLFw+zNs/hA
	0muvvEo14QE6nNlFKwpqhPig3ou4Am3lmgerJX65O9uGurYOvhPaBjr3Wc99OM4sFyXFkrSPffhlO
	hvKo1rTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJaMv-0007zv-0g;
	Wed, 12 Jul 2023 13:59:01 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJaMr-0007yd-1u
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 13:58:59 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3909756b8b1so3788034b6e.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 06:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1689170334; x=1691762334;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WtiPPmkimlf1cfbcZtKGy3NvKyESLQgOrGfUSB0R+RM=;
        b=D7vYLwD0d+cm+/50I06d5LTEFId3x/YrwBjY/a4xVK74mteWzgneFjalmuxORj52ca
         gWxFHvKbOR5pmot+DxeOlx30OJ+VfVBw+Ar/YySRZsMUe1eviZctwGugnI4l7kp60lbQ
         4NpaToE7ZtAebZrtqGNE0FRpXhOUIvaH5YPWepcTfypqK1iZ7aJOKELncvKCegDE9MUX
         MogrWsUyN/O3Q6STv9oJoXhzselyzbhBTRHOOepN/FHbrbYs135kip5JLwjzW0YJDdfz
         pfFHkxAfNaXnv6NFsXwi7SNcwWVhCW3J3hG5CJjIsaVc1zTs/cqsdKljqWy3CrC6vf7t
         xQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689170334; x=1691762334;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtiPPmkimlf1cfbcZtKGy3NvKyESLQgOrGfUSB0R+RM=;
        b=By2iuCo/PfD+h3tLSc2tGUQW1HiAfryHnOFrSHq5+8slMqCaS0wPcE8L3oUK2GPUn+
         O9nAbeE3nXhTY0W+uk6dpKyqKaC3MJmtFnmieOCgRNcCFmYaRF9R8hHbeAXth2Suml6Q
         fwf4F9lVDahLaN4rwKzOcgAyEW0kLl+p74OzTA+5qdSRxP6qfTB37ZqWWuAeIAlDcUlT
         ZaFW6Dp3hDnbgI4R7ckopcgo2+ocvaM5NMPSFAe38cktoOCWTr8j+FAErTZEe4CIc8F4
         JqT+s/BjMDgAaHUHKF64v8GmcZkK6v33ioIOuFHP26uQ3hdqCwzZ/l4QBWrvd69KcqON
         Pkmw==
X-Gm-Message-State: ABy/qLbYDxEb6VA9oSxkq4OnsI3l0fQPiOX5lyU+mBaWdu/E8aDojS1f
	+5UArnZGgz0oD8Oc8sd2oIsijw==
X-Google-Smtp-Source: APBJJlEDKV1lafoYvKOBZ1aTJjv6CVXylfJX/ok+2beQDlkAS+AoMoK8n/64bLsknN7G9FdyH8JNSw==
X-Received: by 2002:a05:6358:4311:b0:133:f39:5e8f with SMTP id r17-20020a056358431100b001330f395e8fmr6770464rwc.10.1689170334098;
        Wed, 12 Jul 2023 06:58:54 -0700 (PDT)
Received: from localhost ([50.38.6.230])
        by smtp.gmail.com with ESMTPSA id f13-20020a63380d000000b0052858b41008sm3560696pga.87.2023.07.12.06.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 06:58:53 -0700 (PDT)
Date: Wed, 12 Jul 2023 06:58:53 -0700 (PDT)
X-Google-Original-Date: Wed, 12 Jul 2023 06:58:07 PDT (-0700)
Subject: Re: [PATCH v5 22/38] riscv: Implement the new page table range API
In-Reply-To: <20230710204339.3554919-23-willy@infradead.org>
CC: akpm@linux-foundation.org, willy@infradead.org, linux-arch@vger.kernel.org,
  linux-mm@kvack.org, linux-kernel@vger.kernel.org, alexghiti@rivosinc.com, rppt@kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: willy@infradead.org
Message-ID: <mhng-1a169eaf-69a5-4d1b-bda7-f707f5f98dd7@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_065857_633049_AB08D37D 
X-CRM114-Status: GOOD (  28.27  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 10 Jul 2023 13:43:23 PDT (-0700), willy@infradead.org wrote:
> Add set_ptes(), update_mmu_cache_range() and flush_dcache_folio().
> Change the PG_dcache_clean flag from being per-page to per-folio.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> ---
>  arch/riscv/include/asm/cacheflush.h | 19 +++++++--------
>  arch/riscv/include/asm/pgtable.h    | 38 +++++++++++++++++++----------
>  arch/riscv/mm/cacheflush.c          | 13 +++-------
>  3 files changed, 37 insertions(+), 33 deletions(-)
>
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> index 8091b8bf4883..0d8c92c5dfb7 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -15,20 +15,19 @@ static inline void local_flush_icache_all(void)
>
>  #define PG_dcache_clean PG_arch_1
>
> -static inline void flush_dcache_page(struct page *page)
> +static inline void flush_dcache_folio(struct folio *folio)
>  {
> -	/*
> -	 * HugeTLB pages are always fully mapped and only head page will be
> -	 * set PG_dcache_clean (see comments in flush_icache_pte()).
> -	 */
> -	if (PageHuge(page))
> -		page = compound_head(page);
> -
> -	if (test_bit(PG_dcache_clean, &page->flags))
> -		clear_bit(PG_dcache_clean, &page->flags);
> +	if (test_bit(PG_dcache_clean, &folio->flags))
> +		clear_bit(PG_dcache_clean, &folio->flags);
>  }
> +#define flush_dcache_folio flush_dcache_folio
>  #define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 1
>
> +static inline void flush_dcache_page(struct page *page)
> +{
> +	flush_dcache_folio(page_folio(page));
> +}
> +
>  /*
>   * RISC-V doesn't have an instruction to flush parts of the instruction cache,
>   * so instead we just flush the whole thing.
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 2137e36595b3..c8f897ed5fd0 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -445,8 +445,9 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
>
>
>  /* Commit new configuration to MMU hardware */
> -static inline void update_mmu_cache(struct vm_area_struct *vma,
> -	unsigned long address, pte_t *ptep)
> +static inline void update_mmu_cache_range(struct vm_fault *vmf,
> +		struct vm_area_struct *vma, unsigned long address,
> +		pte_t *ptep, unsigned int nr)
>  {
>  	/*
>  	 * The kernel assumes that TLBs don't cache invalid entries, but
> @@ -455,8 +456,11 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
>  	 * Relying on flush_tlb_fix_spurious_fault would suffice, but
>  	 * the extra traps reduce performance.  So, eagerly SFENCE.VMA.
>  	 */
> -	local_flush_tlb_page(address);
> +	while (nr--)
> +		local_flush_tlb_page(address + nr * PAGE_SIZE);
>  }
> +#define update_mmu_cache(vma, addr, ptep) \
> +	update_mmu_cache_range(NULL, vma, addr, ptep, 1)
>
>  #define __HAVE_ARCH_UPDATE_MMU_TLB
>  #define update_mmu_tlb update_mmu_cache
> @@ -487,8 +491,7 @@ static inline void set_pte(pte_t *ptep, pte_t pteval)
>
>  void flush_icache_pte(pte_t pte);
>
> -static inline void __set_pte_at(struct mm_struct *mm,
> -	unsigned long addr, pte_t *ptep, pte_t pteval)
> +static inline void __set_pte_at(pte_t *ptep, pte_t pteval)
>  {
>  	if (pte_present(pteval) && pte_exec(pteval))
>  		flush_icache_pte(pteval);
> @@ -496,17 +499,26 @@ static inline void __set_pte_at(struct mm_struct *mm,
>  	set_pte(ptep, pteval);
>  }
>
> -static inline void set_pte_at(struct mm_struct *mm,
> -	unsigned long addr, pte_t *ptep, pte_t pteval)
> +static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
> +		pte_t *ptep, pte_t pteval, unsigned int nr)
>  {
> -	page_table_check_ptes_set(mm, addr, ptep, pteval, 1);
> -	__set_pte_at(mm, addr, ptep, pteval);
> +	page_table_check_ptes_set(mm, addr, ptep, pteval, nr);
> +
> +	for (;;) {
> +		__set_pte_at(ptep, pteval);
> +		if (--nr == 0)
> +			break;
> +		ptep++;
> +		addr += PAGE_SIZE;
> +		pte_val(pteval) += 1 << _PAGE_PFN_SHIFT;
> +	}
>  }
> +#define set_ptes set_ptes
>
>  static inline void pte_clear(struct mm_struct *mm,
>  	unsigned long addr, pte_t *ptep)
>  {
> -	__set_pte_at(mm, addr, ptep, __pte(0));
> +	__set_pte_at(ptep, __pte(0));
>  }
>
>  #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
> @@ -515,7 +527,7 @@ static inline int ptep_set_access_flags(struct vm_area_struct *vma,
>  					pte_t entry, int dirty)
>  {
>  	if (!pte_same(*ptep, entry))
> -		set_pte_at(vma->vm_mm, address, ptep, entry);
> +		__set_pte_at(ptep, entry);
>  	/*
>  	 * update_mmu_cache will unconditionally execute, handling both
>  	 * the case that the PTE changed and the spurious fault case.
> @@ -688,14 +700,14 @@ static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
>  				pmd_t *pmdp, pmd_t pmd)
>  {
>  	page_table_check_pmd_set(mm, addr, pmdp, pmd);
> -	return __set_pte_at(mm, addr, (pte_t *)pmdp, pmd_pte(pmd));
> +	return __set_pte_at((pte_t *)pmdp, pmd_pte(pmd));
>  }
>
>  static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
>  				pud_t *pudp, pud_t pud)
>  {
>  	page_table_check_pud_set(mm, addr, pudp, pud);
> -	return __set_pte_at(mm, addr, (pte_t *)pudp, pud_pte(pud));
> +	return __set_pte_at((pte_t *)pudp, pud_pte(pud));
>  }
>
>  #ifdef CONFIG_PAGE_TABLE_CHECK
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index fbc59b3f69f2..f1387272a551 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -82,18 +82,11 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
>  #ifdef CONFIG_MMU
>  void flush_icache_pte(pte_t pte)
>  {
> -	struct page *page = pte_page(pte);
> +	struct folio *folio = page_folio(pte_page(pte));
>
> -	/*
> -	 * HugeTLB pages are always fully mapped, so only setting head page's
> -	 * PG_dcache_clean flag is enough.
> -	 */
> -	if (PageHuge(page))
> -		page = compound_head(page);
> -
> -	if (!test_bit(PG_dcache_clean, &page->flags)) {
> +	if (!test_bit(PG_dcache_clean, &folio->flags)) {
>  		flush_icache_all();
> -		set_bit(PG_dcache_clean, &page->flags);
> +		set_bit(PG_dcache_clean, &folio->flags);
>  	}
>  }
>  #endif /* CONFIG_MMU */

Sorry I missed this earlier.  IIRC it ended up somewhere, but

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

anyway.  Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
