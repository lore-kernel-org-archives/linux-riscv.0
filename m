Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C38C001DE
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 15:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m6Ry5XTNnwcC/TyocPKMkWbVoOtvUz9tdqgUMGWRHrU=; b=x1QWejvkZkQWmD
	KQyg7oP3SHAdlDSC0h7QoDEtntpJnwZh0r3M2rcbQ9F7V9En4rrj6+dVc4733qmKOdOM/z1mETNE3
	mP1ELoVnqWpajCwMC6zSkmw0FfxYItjqUW8dURtWycyr1agmvitpzLwP9ZTtZViBa5VFo3WWjyOli
	fDg8q8UwdwvY15SjoZkOSu7xmFaQtMFJHyQcOOqmipW6VoIUnmsJTS4wS7aKRx6zXToo4Eaj9oE1+
	rwjkrSVwdAI9DlKOdVxbZu4XH+gcrzD84Oup7UohGZAh78XfWIrZduUO1JvHx6/1kmzEo1YVFIKg2
	Lyn7JJtWjDk4rWEmgv4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9S2b-00Bzix-1k;
	Wed, 14 Jun 2023 15:04:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9S2Y-00Bzhc-29;
	Wed, 14 Jun 2023 15:04:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F175B60B85;
	Wed, 14 Jun 2023 15:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B074C433C9;
	Wed, 14 Jun 2023 15:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686755045;
	bh=9A+PDe1vPCUMDrQYdu5z8EQPSeOjm0q+6tl+clXFAfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j5Ugc1koC28gH2KkEPLkPoTIPNK11ApEJ+qx3mv6eyx57zInMns1iK9e2ZeYWZtaS
	 d6VTROxAYi4QnXIkn3k8NB95BIGVtq/48gNq3/0I/WMA49BRIKydm5cPzbMITNJFuZ
	 ukIwVNbIGFF0ylO7WubZ38JabSGFDmsGB/tgUH9+2GD4DtHbeAr300i11RRFVklrjO
	 zXwlgRZnQv07KKoC7y7mb9Y81PZOH2N9ueNVcmIy2/IhSmwSzwFpOrdGsiFw0fBA3k
	 Xwkm0A1j+e4mOhYVoVB8lslu0VNwTEUQ6zk7ZxZcwqL0ZAjNIDJH5uFFjVn0dxTv++
	 vvViLh1xvoRTQ==
Date: Wed, 14 Jun 2023 18:03:27 +0300
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
	Hugh Dickins <hughd@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v4 20/34] arm: Convert various functions to use ptdescs
Message-ID: <20230614150327.GS52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-21-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-21-vishal.moola@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_080406_783927_280A0280 
X-CRM114-Status: GOOD (  18.35  )
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

On Mon, Jun 12, 2023 at 02:04:09PM -0700, Vishal Moola (Oracle) wrote:
> As part of the conversions to replace pgtable constructor/destructors with
> ptdesc equivalents, convert various page table functions to use ptdescs.
> 
> late_alloc() also uses the __get_free_pages() helper function. Convert
> this to use pagetable_alloc() and ptdesc_address() instead to help
> standardize page tables further.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

One comment below.

> ---
>  arch/arm/include/asm/tlb.h | 12 +++++++-----
>  arch/arm/mm/mmu.c          |  6 +++---
>  2 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
> index b8cbe03ad260..f40d06ad5d2a 100644
> --- a/arch/arm/include/asm/tlb.h
> +++ b/arch/arm/include/asm/tlb.h
> @@ -39,7 +39,9 @@ static inline void __tlb_remove_table(void *_table)
>  static inline void
>  __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, unsigned long addr)
>  {
> -	pgtable_pte_page_dtor(pte);
> +	struct ptdesc *ptdesc = page_ptdesc(pte);
> +
> +	pagetable_pte_dtor(ptdesc);
>  
>  #ifndef CONFIG_ARM_LPAE
>  	/*
> @@ -50,17 +52,17 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, unsigned long addr)
>  	__tlb_adjust_range(tlb, addr - PAGE_SIZE, 2 * PAGE_SIZE);
>  #endif
>  
> -	tlb_remove_table(tlb, pte);
> +	tlb_remove_ptdesc(tlb, ptdesc);
>  }
>  
>  static inline void
>  __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp, unsigned long addr)
>  {
>  #ifdef CONFIG_ARM_LPAE
> -	struct page *page = virt_to_page(pmdp);
> +	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
>  
> -	pgtable_pmd_page_dtor(page);
> -	tlb_remove_table(tlb, page);
> +	pagetable_pmd_dtor(ptdesc);
> +	tlb_remove_ptdesc(tlb, ptdesc);
>  #endif
>  }
>  
> diff --git a/arch/arm/mm/mmu.c b/arch/arm/mm/mmu.c
> index 22292cf3381c..294518fd0240 100644
> --- a/arch/arm/mm/mmu.c
> +++ b/arch/arm/mm/mmu.c
> @@ -737,11 +737,11 @@ static void __init *early_alloc(unsigned long sz)
>  
>  static void *__init late_alloc(unsigned long sz)
>  {
> -	void *ptr = (void *)__get_free_pages(GFP_PGTABLE_KERNEL, get_order(sz));
> +	void *ptdesc = pagetable_alloc(GFP_PGTABLE_KERNEL, get_order(sz));
>  
> -	if (!ptr || !pgtable_pte_page_ctor(virt_to_page(ptr)))
> +	if (!ptdesc || !pagetable_pte_ctor(ptdesc))
>  		BUG();
> -	return ptr;
> +	return ptdesc;

should be

	return  ptdesc_to_virt(ptdesc);

>  }
>  
>  static pte_t * __init arm_pte_alloc(pmd_t *pmd, unsigned long addr,
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
