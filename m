Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD53C636CC
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 08:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x4yN8WS+X3Txcq0GIrvJli8gaFQz97/nPDgfa252MRs=; b=aqs8mOTIVWAdYL4vHfmQubGPX0
	5/Vs5WV6hFNyVzWUCCLGiGF5u6sxiIQZ89Bg5uv1jxvy5kPBdReX7as20un8PiaMC61LQ7NEdq9ep
	yRubiSb+J2P1gdPUhmxXCOJBlpgnT+vQDnePIzBRHBiRfnERjfRY0Ke0OmVCNgakqqqjjf/2fr4xe
	BQ+KxvigfxDdOGR6AV9nY0hk0jj+yZg4hH9jFd6iKs3htlsoEVAn6b3lxN9USLRywyWOQKZK8/j8G
	r80MPn7u98pcZuZtV3aAcQQvWnLcuI5NSwni5k0IrqhCbMaoajyCYq0sNvfjAdTzBrkkJMh/FHg1r
	8ZnFb0Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSZS2-008y1I-1M; Thu, 16 Feb 2023 08:17:10 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSZRy-008xxu-5M
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 08:17:08 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 9C48910000E;
	Thu, 16 Feb 2023 08:16:56 +0000 (UTC)
Message-ID: <e107fa05-e3d1-cf9f-227e-01923bfab023@ghiti.fr>
Date: Thu, 16 Feb 2023 09:16:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 10/7] riscv: Implement the new page table range API
Content-Language: en-US
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-arch@vger.kernel.org
References: <20230211033948.891959-1-willy@infradead.org>
 <20230215000446.1655635-1-willy@infradead.org>
 <20230215000446.1655635-2-willy@infradead.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230215000446.1655635-2-willy@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_001706_479844_C52350CB 
X-CRM114-Status: GOOD (  22.54  )
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

Hi Matthew,

On 2/15/23 01:04, Matthew Wilcox (Oracle) wrote:
> Add set_ptes(), update_mmu_cache_range() and flush_dcache_folio().
>
> The PG_dcache_clear flag changes from being a per-page bit to being a
> per-folio bit.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>   arch/riscv/include/asm/cacheflush.h | 19 +++++++++----------
>   arch/riscv/include/asm/pgtable.h    | 25 ++++++++++++++++++-------
>   arch/riscv/mm/cacheflush.c          | 11 ++---------
>   3 files changed, 29 insertions(+), 26 deletions(-)
>
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> index 03e3b95ae6da..10e5e96f09b5 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -15,20 +15,19 @@ static inline void local_flush_icache_all(void)
>   
>   #define PG_dcache_clean PG_arch_1
>   
> -static inline void flush_dcache_page(struct page *page)
> +static inline void flush_dcache_folio(struct folio *folio)
>   {
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
>   }
> +#define flush_dcache_folio flush_dcache_folio
>   #define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 1
>   
> +static inline void flush_dcache_page(struct page *page)
> +{
> +	flush_dcache_folio(page_folio(page));
> +}
> +
>   /*
>    * RISC-V doesn't have an instruction to flush parts of the instruction cache,
>    * so instead we just flush the whole thing.
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 13222fd5c4b4..03706c833e70 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -405,8 +405,8 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
>   
>   
>   /* Commit new configuration to MMU hardware */
> -static inline void update_mmu_cache(struct vm_area_struct *vma,
> -	unsigned long address, pte_t *ptep)
> +static inline void update_mmu_cache_range(struct vm_area_struct *vma,
> +		unsigned long address, pte_t *ptep, unsigned int nr)
>   {
>   	/*
>   	 * The kernel assumes that TLBs don't cache invalid entries, but
> @@ -415,8 +415,10 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
>   	 * Relying on flush_tlb_fix_spurious_fault would suffice, but
>   	 * the extra traps reduce performance.  So, eagerly SFENCE.VMA.
>   	 */
> -	flush_tlb_page(vma, address);
> +	flush_tlb_range(vma, address, address + nr * PAGE_SIZE);
>   }
> +#define update_mmu_cache(vma, addr, ptep) \
> +	update_mmu_cache_range(vma, addr, ptep, 1)
>   
>   #define __HAVE_ARCH_UPDATE_MMU_TLB
>   #define update_mmu_tlb update_mmu_cache
> @@ -456,12 +458,21 @@ static inline void __set_pte_at(struct mm_struct *mm,
>   	set_pte(ptep, pteval);
>   }
>   
> -static inline void set_pte_at(struct mm_struct *mm,
> -	unsigned long addr, pte_t *ptep, pte_t pteval)
> +static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
> +		pte_t *ptep, pte_t pteval, unsigned int nr)
>   {
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
>   }
> +#define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
>   
>   static inline void pte_clear(struct mm_struct *mm,
>   	unsigned long addr, pte_t *ptep)
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index 3cc07ed45aeb..b725c3f6f57f 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -81,16 +81,9 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
>   #ifdef CONFIG_MMU
>   void flush_icache_pte(pte_t pte)
>   {
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
> -	if (!test_and_set_bit(PG_dcache_clean, &page->flags))
> +	if (!test_and_set_bit(PG_dcache_clean, &folio->flags))
>   		flush_icache_all();
>   }
>   #endif /* CONFIG_MMU */

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
