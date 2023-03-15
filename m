Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82505C61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 05:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=zcuY5Mmk5BYLFQ49ElW5A+Y6GZywkxlmMKnC+f/IrrM=; b=dzYgFH1AqEuMqj9iFoJ/79s+c4
	KYHNMazQe7KamsBSKqAUifkiBF2b1sidOF9fgTSS5M+Dt2UaNLq6wRbzUgqMKcp9z6YwMoSGHX6bX
	xV8Mc+WRj1s17YI2W2QFT3opWC+UKffYoSWF5cZFKIuzNy4IA3Vsz/OP8qA4M5jDd+gu9oYZMSz3H
	bKE+B/21iiqQkUGMnfiNuZOKV9MVdvK5c1zjmOGzGORR7Q80VjkxcGmzNZrvLyFU1jCzG450yEyIK
	Kk8MiKGR+Dgta5xpHN7dC5LLtGXSNa6bF4itZF9ZZ8mDGZQzMEv+INpqFu9GBGnivq6dgSzbFjdwI
	gEmmNYgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcJc7-00CPjG-1k;
	Wed, 15 Mar 2023 05:23:51 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcJc3-00CPhf-0f
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 05:23:49 +0000
Received: by mail-pl1-x635.google.com with SMTP id v21so8750245ple.9
        for <linux-riscv@lists.infradead.org>; Tue, 14 Mar 2023 22:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678857824;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SjKy7C3/cQxzvvNhh8JYH9DRhvpc3Xb8Ck3BTbP4FIw=;
        b=NjtkBsAXpQlDU4BGX/gYRlZbgHpWpvX3bkRRTtqVjyc8H8Z5BdxENl4cGILMwU9+l7
         6eh5ijqlaXpCMC1g0SgufHGBr9ypr1GR8LET17oDgHNNThI/Sa5eHSJN3Ak3P5x/MSxF
         LKfQewvHVw2h8T74FL0iIOQqgpfVsw+vPMI2LpYPjJHhUd1kqA1fO/wYlxD442bZuy77
         CIyUcwiP00DwhBwe3fYHarJbpJwNVQjtF5SqlgyfpYiyOh9sK/LTyWFaEjPvC8VdC0RZ
         TJ/QZPkfKFKG/BGoXCCul1VsknFsIw/iQ7lvOYXrcjcqezvHS47WEz3Exy1EJ//nQxXS
         U4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678857824;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjKy7C3/cQxzvvNhh8JYH9DRhvpc3Xb8Ck3BTbP4FIw=;
        b=2AXADOJOIbrXXAFsguhqswc4NJbePoiqmGTJBPaOlCysZk987b953wkteaRdu7pkxp
         XN6Y953cIjwxaSZ4rV2W9kTaljImISZtGRuqXTX+daeWSsvCjKpkR1qIpvaFFH7lVZe0
         YiPlgVRppwSsdbF4jU/FStAhMh6Hk8EZOzerLk/lRNnQCh0440j9SdZYv1yJmQJBP5SD
         l7/NlmtL+qsV3IKwPAatRlI4sDSq6C2KrYjSspTqX4heu5SuQU/5FbXR5HPuihtjuWic
         6iw2eThuKdakdVVZKONBsKJxcAxnohtcGyQS202x1lBL5PbGSYP+uf7d6JiqPotvArkL
         PjZw==
X-Gm-Message-State: AO0yUKUti/KZWE8h0TnucRdcZEyhM8NuYU8Mn0XUQkdwUOC+yUQwYg8n
	o60ybUCL6KyriTRRl3GkmjtFOw==
X-Google-Smtp-Source: AK7set/bva9pNCCVEG6ntKH5jwV71fM4HOjl4X0hHTrQaY1lziKShXYFg9iT0LR1BwYfjme5MnxaWg==
X-Received: by 2002:a17:90b:1e42:b0:235:b712:4179 with SMTP id pi2-20020a17090b1e4200b00235b7124179mr39010890pjb.5.1678857823683;
        Tue, 14 Mar 2023 22:23:43 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id z22-20020a17090a015600b00234899c65e7sm392170pje.28.2023.03.14.22.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 22:23:43 -0700 (PDT)
Date: Tue, 14 Mar 2023 22:23:43 -0700 (PDT)
X-Google-Original-Date: Tue, 14 Mar 2023 22:22:49 PDT (-0700)
Subject: Re: [PATCH v3 20/34] riscv: Implement the new page table range API
In-Reply-To: <20230228213738.272178-21-willy@infradead.org>
CC: linux-mm@kvack.org, linux-arch@vger.kernel.org, willy@infradead.org,
  linux-kernel@vger.kernel.org, alexghiti@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: willy@infradead.org
Message-ID: <mhng-21d3fe96-715e-49c4-aec0-2ee4e91b462d@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_222347_282004_321FE6BC 
X-CRM114-Status: GOOD (  24.49  )
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

On Tue, 28 Feb 2023 13:37:23 PST (-0800), willy@infradead.org wrote:
> Add set_ptes(), update_mmu_cache_range() and flush_dcache_folio().
> Change the PG_dcache_clean flag from being per-page to per-folio.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> ---
>  arch/riscv/include/asm/cacheflush.h | 19 +++++++++----------
>  arch/riscv/include/asm/pgtable.h    | 26 +++++++++++++++++++-------
>  arch/riscv/mm/cacheflush.c          | 11 ++---------
>  3 files changed, 30 insertions(+), 26 deletions(-)
>
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> index 03e3b95ae6da..10e5e96f09b5 100644
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
> index b516f3b59616..3a3a776fc047 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -405,8 +405,8 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
>
>
>  /* Commit new configuration to MMU hardware */
> -static inline void update_mmu_cache(struct vm_area_struct *vma,
> -	unsigned long address, pte_t *ptep)
> +static inline void update_mmu_cache_range(struct vm_area_struct *vma,
> +		unsigned long address, pte_t *ptep, unsigned int nr)
>  {
>  	/*
>  	 * The kernel assumes that TLBs don't cache invalid entries, but
> @@ -415,8 +415,11 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
>  	 * Relying on flush_tlb_fix_spurious_fault would suffice, but
>  	 * the extra traps reduce performance.  So, eagerly SFENCE.VMA.
>  	 */
> -	local_flush_tlb_page(address);
> +	while (nr--)
> +		local_flush_tlb_page(address + nr * PAGE_SIZE);
>  }
> +#define update_mmu_cache(vma, addr, ptep) \
> +	update_mmu_cache_range(vma, addr, ptep, 1)
>
>  #define __HAVE_ARCH_UPDATE_MMU_TLB
>  #define update_mmu_tlb update_mmu_cache
> @@ -456,12 +459,21 @@ static inline void __set_pte_at(struct mm_struct *mm,
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
> +		__set_pte_at(mm, addr, ptep, pteval);
> +		if (--nr == 0)
> +			break;
> +		ptep++;
> +		addr += PAGE_SIZE;
> +		pte_val(pteval) += 1 << _PAGE_PFN_SHIFT;
> +	}
>  }
> +#define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
>
>  static inline void pte_clear(struct mm_struct *mm,
>  	unsigned long addr, pte_t *ptep)
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index fcd6145fbead..e36a851e5788 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -81,16 +81,9 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
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
>  		set_bit(PG_dcache_clean, &page->flags);
>  	}

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
