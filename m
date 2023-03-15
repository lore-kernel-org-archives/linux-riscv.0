Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E7CC6FD1D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 10:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1B4KoNj/Lh8pjGFrehfA1przJkPyRLDQi/usg9kkf/c=; b=HYg0TiUgN7kAqI
	BGqcdLfbkWG9sU3mgsLZ486JiWocEPqd10/Yu020GRpQk1Gx3sfcHOJh+JXsOCkENUDYFawVp8h3n
	34geVk3xMUoUbanLdtvkRnQvXTlJFSx9IZ+w72JzcWBiOx0HojuW1yU1FAn2Dq72ddSBT3/xwVN4l
	iR83TMIbGHKLki06puJgiP4zJmaFbvxSD2uQTCLsYJoJOUPPVGZgic8Oj+PgB45Q64XECLbBP8YdH
	+4gv03NJGdfNtZApxCRUgb4hSlgD5Cc1EcrUjES7W/4F5IxADc7Lc1Q6/ZQ5NmLeXPGvXe5cnJS8r
	fXWC5hLeSOBtNwPOUWDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcO5X-00D1dY-0q;
	Wed, 15 Mar 2023 10:10:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcO5Q-00D1b9-0p
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 10:10:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C4E2861BD2;
	Wed, 15 Mar 2023 10:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88760C433D2;
	Wed, 15 Mar 2023 10:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678875023;
	bh=t6+L9+5TgsgHD5i71rZ4I1fBe7Dw8QjjaTgllTsJASg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FTfI9Axm5wAnGiuKp4LdSxj2zUd4+mexU7PMy/4ZvlZVAgRtgmuiSsKsrmAW/5JQ3
	 Nx1+DYd12ijh+vY+2MMUj8nuQgQ5OedPPjhU8pNWewdow+wptVBXcwkFw4Bp4lSpet
	 2soyzjifgj7cmNt/GzZpy1UpdUFQVMDzDg++8igWTouxWPqD+LEpYiFyE2Xgb2LCBW
	 K42eDy6enK3rwqfFgLk8LIX18zMm2M8KEEACm/dcfJeoqEkQSISLHqOj6ibsLibzP4
	 k+UaGeEDysFGEkPgfLQLqMgjLo3PqOdrUooNDmr87ylEWSdVmuLT3ijf8vnE5TGh2S
	 CVUBTV2pOGODQ==
Date: Wed, 15 Mar 2023 12:10:09 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 21/36] riscv: Implement the new page table range API
Message-ID: <ZBGZgfg+Ik+ckQvo@kernel.org>
References: <20230315051444.3229621-1-willy@infradead.org>
 <20230315051444.3229621-22-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230315051444.3229621-22-willy@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_031027_726912_0C0D84B8 
X-CRM114-Status: GOOD (  27.78  )
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

On Wed, Mar 15, 2023 at 05:14:29AM +0000, Matthew Wilcox (Oracle) wrote:
> Add set_ptes(), update_mmu_cache_range() and flush_dcache_folio().
> Change the PG_dcache_clean flag from being per-page to per-folio.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

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
> index b516f3b59616..b077bc8c498c 100644
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
> +#define set_ptes set_ptes
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
> -- 
> 2.39.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
