Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C768EB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 13:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5o6zvK5xDYu9cEz4xtQTym8vEMg5/dXCMN9zyTbGFwY=; b=pFkXm+MSogF8he
	XTkOcyywvljuYfRt/cFikOWXuA7CVQMbvaK8sAXgl3gw+qlOyPV0jPS+Dirksa1V7v6TSLxSu90wg
	EIzhCkeDz2CV64z17t/fpJxPuNoZHerTqDc4ylV/5Ka8OphxBqfjb/8dLClQ2UO6kAALwaVw113iD
	chDOi77WPDRtGrOrgtL7P+uaBOlSVG/w+dMbmXyFJT9SvVgLDKNoYeKo4b7dH80hu98FsJSD2UOjZ
	mEC8A91ymZchkhQ8B6ShKJLZnNL0IXGBa1E9jti1guq5xbrn8y1JfUcbrEknWcLG0RYCGyivIQNX7
	hGUovhpYa+WdeneEl1mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9QvY-00BoPa-0Q;
	Wed, 14 Jun 2023 13:52:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9QvU-00BoNT-1Z;
	Wed, 14 Jun 2023 13:52:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0070864287;
	Wed, 14 Jun 2023 13:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA10DC433C0;
	Wed, 14 Jun 2023 13:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686750763;
	bh=Jr1CjE7x6zZhqlD+PrxSeOCGxWprISw499VNjITcty4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WTLFY5L6mnlqfGDyFTiH9jqq2FKHmRtqRnjsTj1RSarSSy3AxLfMgUgjr8wGlmHBW
	 ZIyTwYSaSC1laCUlNWdYFX2P0Vpo5Cygx+gCIcavFIbmFA7gdFkAZSMhEGMMgWmRbu
	 2PIwOB+Zm2qIyVb3o5W9j04IHSX7uWkmLNNjNW4pTo0Uj3+m7MBHT7TUhTgbQveuQG
	 8Y13PY2/OBFLWcieHZ12iDoM6RLDamAU84EbiDa/rEeH2lt3RpONvk9+fHWXJncK7b
	 7pIkWK95aM9sq+JHpbXwyxHzzP/N7RDgJmdalD7vC2ycKfkQ6ox4Zo04K9yfj/x21h
	 HrE7P9YKzVHGQ==
Date: Wed, 14 Jun 2023 16:52:05 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
	Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH v4 08/34] mm: Convert ptlock_ptr() to use ptdescs
Message-ID: <20230614135205.GG52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-9-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-9-vishal.moola@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_065244_608250_695BD306 
X-CRM114-Status: GOOD (  16.99  )
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

On Mon, Jun 12, 2023 at 02:03:57PM -0700, Vishal Moola (Oracle) wrote:
> This removes some direct accesses to struct page, working towards
> splitting out struct ptdesc from struct page.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/x86/xen/mmu_pv.c |  2 +-
>  include/linux/mm.h    | 14 +++++++-------
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
> index b3b8d289b9ab..f469862e3ef4 100644
> --- a/arch/x86/xen/mmu_pv.c
> +++ b/arch/x86/xen/mmu_pv.c
> @@ -651,7 +651,7 @@ static spinlock_t *xen_pte_lock(struct page *page, struct mm_struct *mm)
>  	spinlock_t *ptl = NULL;
>  
>  #if USE_SPLIT_PTE_PTLOCKS
> -	ptl = ptlock_ptr(page);
> +	ptl = ptlock_ptr(page_ptdesc(page));
>  	spin_lock_nest_lock(ptl, &mm->page_table_lock);
>  #endif
>  
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index e6f1be2a405e..bb934d51390f 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2828,9 +2828,9 @@ void __init ptlock_cache_init(void);
>  bool ptlock_alloc(struct ptdesc *ptdesc);
>  extern void ptlock_free(struct page *page);
>  
> -static inline spinlock_t *ptlock_ptr(struct page *page)
> +static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
>  {
> -	return page->ptl;
> +	return ptdesc->ptl;
>  }
>  #else /* ALLOC_SPLIT_PTLOCKS */
>  static inline void ptlock_cache_init(void)
> @@ -2846,15 +2846,15 @@ static inline void ptlock_free(struct page *page)
>  {
>  }
>  
> -static inline spinlock_t *ptlock_ptr(struct page *page)
> +static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
>  {
> -	return &page->ptl;
> +	return &ptdesc->ptl;
>  }
>  #endif /* ALLOC_SPLIT_PTLOCKS */
>  
>  static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
>  {
> -	return ptlock_ptr(pmd_page(*pmd));
> +	return ptlock_ptr(page_ptdesc(pmd_page(*pmd)));
>  }
>  
>  static inline bool ptlock_init(struct page *page)
> @@ -2869,7 +2869,7 @@ static inline bool ptlock_init(struct page *page)
>  	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
>  	if (!ptlock_alloc(page_ptdesc(page)))
>  		return false;
> -	spin_lock_init(ptlock_ptr(page));
> +	spin_lock_init(ptlock_ptr(page_ptdesc(page)));
>  	return true;
>  }
>  
> @@ -2939,7 +2939,7 @@ static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
>  
>  static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
>  {
> -	return ptlock_ptr(ptdesc_page(pmd_ptdesc(pmd)));
> +	return ptlock_ptr(pmd_ptdesc(pmd));
>  }
>  
>  static inline bool pmd_ptlock_init(struct page *page)
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
