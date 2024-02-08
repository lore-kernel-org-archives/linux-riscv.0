Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F44C4828F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 06:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zIwrvI+uK2uWHC5cCcsp/9TRgRT0aFMVqK2bMsbJtqs=; b=I2RiPB8ymMSHY6
	4eYZGojx7IE1JV+xjRIxijTk67bzN8KJoZOVIncWRGfBdoBKj0b7kStoNEAAv3v8XV0vImEW7fL4D
	EaXQBWAn+JUWhMRcLdz7WoreZJkt4OhZppKTGRqqBbRHbRuoZtc71Gpp+LRPJShDLBO+b9KwQtn6K
	NosutcO4iPXoDLpsADeiJQUhF5BY6jHyOTb62kc6qRu4lLvyyhR2skAEc4hzS9q97sPduZeQuXRg8
	IVj6dQtgXbYWR03sXMsoUOMwyIrjSRugMaGK8Yxpov2n3xznNxvQO+QLyIKpVnVS/GLnPDLc3GGCy
	uAB+F2LsfCyZpvAteQyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxux-0000000Cog7-02R5;
	Thu, 08 Feb 2024 06:29:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxut-0000000Coev-0b3q;
	Thu, 08 Feb 2024 06:29:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8BB1E61B29;
	Thu,  8 Feb 2024 06:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E21FC433F1;
	Thu,  8 Feb 2024 06:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707373786;
	bh=x4GCLa2xzNhu7jlHpC2LrDTqBpAccwVcIjWuUAdJzgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Phoix+90khL4IEhQ6gpSoCEIa7eKrFuowZSgj42G9vOi8dSlpe1gQK0YyWgYKp+4r
	 sPLY9+CUFb9aZvZlJVuQqwKhWZ+pa+B4zWmW6ij44vrjGh7IL5UzkD3sKKzoxbKYee
	 QNwaU30tJ0UF6MuasMfjEGa+A4FY8V6otf3jfYDzeJPTIubtszyNvCkdBsoVBCTCKZ
	 +W8z7CCvQhm6qI593PxMf1LOB8FDsoWbQ3LesFfp+jH1tSwZzvF1v7s5703XCDTQvu
	 YYI3y/4CVWlLjbUJLn8zUCRy2xy0Roln1eAOTnw74B+sWgLw7OSbGWrqA5wjWVRClH
	 ouB/3F6aDobjA==
Date: Thu, 8 Feb 2024 08:29:21 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH v3 11/15] mm/memory: factor out copying the actual PTE in
 copy_present_pte()
Message-ID: <ZcR0waPgUzfQgyGQ@kernel.org>
References: <20240129124649.189745-1-david@redhat.com>
 <20240129124649.189745-12-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129124649.189745-12-david@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_222947_278720_12EBF78E 
X-CRM114-Status: GOOD (  26.15  )
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

On Mon, Jan 29, 2024 at 01:46:45PM +0100, David Hildenbrand wrote:
> Let's prepare for further changes.
> 
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  mm/memory.c | 63 ++++++++++++++++++++++++++++-------------------------
>  1 file changed, 33 insertions(+), 30 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 8d14ba440929..a3bdb25f4c8d 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -930,6 +930,29 @@ copy_present_page(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
>  	return 0;
>  }
>  
> +static inline void __copy_present_pte(struct vm_area_struct *dst_vma,
> +		struct vm_area_struct *src_vma, pte_t *dst_pte, pte_t *src_pte,
> +		pte_t pte, unsigned long addr)
> +{
> +	struct mm_struct *src_mm = src_vma->vm_mm;
> +
> +	/* If it's a COW mapping, write protect it both processes. */
> +	if (is_cow_mapping(src_vma->vm_flags) && pte_write(pte)) {
> +		ptep_set_wrprotect(src_mm, addr, src_pte);
> +		pte = pte_wrprotect(pte);
> +	}
> +
> +	/* If it's a shared mapping, mark it clean in the child. */
> +	if (src_vma->vm_flags & VM_SHARED)
> +		pte = pte_mkclean(pte);
> +	pte = pte_mkold(pte);
> +
> +	if (!userfaultfd_wp(dst_vma))
> +		pte = pte_clear_uffd_wp(pte);
> +
> +	set_pte_at(dst_vma->vm_mm, addr, dst_pte, pte);
> +}
> +
>  /*
>   * Copy one pte.  Returns 0 if succeeded, or -EAGAIN if one preallocated page
>   * is required to copy this pte.
> @@ -939,23 +962,23 @@ copy_present_pte(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>  		 pte_t *dst_pte, pte_t *src_pte, unsigned long addr, int *rss,
>  		 struct folio **prealloc)
>  {
> -	struct mm_struct *src_mm = src_vma->vm_mm;
> -	unsigned long vm_flags = src_vma->vm_flags;
>  	pte_t pte = ptep_get(src_pte);
>  	struct page *page;
>  	struct folio *folio;
>  
>  	page = vm_normal_page(src_vma, addr, pte);
> -	if (page)
> -		folio = page_folio(page);
> -	if (page && folio_test_anon(folio)) {
> +	if (unlikely(!page))
> +		goto copy_pte;
> +
> +	folio = page_folio(page);
> +	folio_get(folio);
> +	if (folio_test_anon(folio)) {
>  		/*
>  		 * If this page may have been pinned by the parent process,
>  		 * copy the page immediately for the child so that we'll always
>  		 * guarantee the pinned page won't be randomly replaced in the
>  		 * future.
>  		 */
> -		folio_get(folio);
>  		if (unlikely(folio_try_dup_anon_rmap_pte(folio, page, src_vma))) {
>  			/* Page may be pinned, we have to copy. */
>  			folio_put(folio);
> @@ -963,34 +986,14 @@ copy_present_pte(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>  						 addr, rss, prealloc, page);
>  		}
>  		rss[MM_ANONPAGES]++;
> -	} else if (page) {
> -		folio_get(folio);
> +		VM_WARN_ON_FOLIO(PageAnonExclusive(page), folio);
> +	} else {
>  		folio_dup_file_rmap_pte(folio, page);
>  		rss[mm_counter_file(folio)]++;
>  	}
>  
> -	/*
> -	 * If it's a COW mapping, write protect it both
> -	 * in the parent and the child
> -	 */
> -	if (is_cow_mapping(vm_flags) && pte_write(pte)) {
> -		ptep_set_wrprotect(src_mm, addr, src_pte);
> -		pte = pte_wrprotect(pte);
> -	}
> -	VM_BUG_ON(page && folio_test_anon(folio) && PageAnonExclusive(page));
> -
> -	/*
> -	 * If it's a shared mapping, mark it clean in
> -	 * the child
> -	 */
> -	if (vm_flags & VM_SHARED)
> -		pte = pte_mkclean(pte);
> -	pte = pte_mkold(pte);
> -
> -	if (!userfaultfd_wp(dst_vma))
> -		pte = pte_clear_uffd_wp(pte);
> -
> -	set_pte_at(dst_vma->vm_mm, addr, dst_pte, pte);
> +copy_pte:
> +	__copy_present_pte(dst_vma, src_vma, dst_pte, src_pte, pte, addr);
>  	return 0;
>  }
>  
> -- 
> 2.43.0
> 
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
