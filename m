Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDC1EB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 13:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/QSHULLIDSkxiAzlCmdgQTqei3bwz32cpp6WhMlPPJs=; b=1ddLa9/e2VRJtq
	Z2GlfZAi7gJ7u3ubnMhDMdeKxWZKzsm/10uH6gM60ytU6CImtPtjvYWKYEKkxNI8DRu2i2VyYmB0V
	BHk8X4DhRDiixUSMJoW7nPzJbU7j4jP74E/Uxfdhp7nqOUsUl0eFB9De+xWJSC0jbfX16Wv1xf7Yd
	ubr1JQXKHdM7gRIyAsl6Z1c63UK5oO8yrIw5LJJ0NlaqbcMLL2gOFNjVKVYG+RcpiBGDM76yqQRw1
	wTXE5+sQXpsL6VPBreywVgTQii/31v7VKsJEQ0MGVe3nn6bItoGEjJa8dZmh+ourM04LQyToaaSWK
	bXO+6vgaiq/t3hOiparw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Quh-00Bo1c-1r;
	Wed, 14 Jun 2023 13:51:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Qud-00BnyQ-2m;
	Wed, 14 Jun 2023 13:51:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0D0F86371D;
	Wed, 14 Jun 2023 13:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7653EC433C0;
	Wed, 14 Jun 2023 13:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686750710;
	bh=MAYhMoo3f8WL6wMqKE5pm7ocfhsiks+frK6iH2blioo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UEIirlFbT/jXJvHUAqdydA59j1RgDZUUfgyOKgwNndXqGOEHUHhZfOzL8/NQgVHWq
	 /q8XC8zbUoWUdbEY52nA6n3QMoY+5uT3nVSo46hX3ckloa8Tsk20nvsFk+nFyI69rq
	 kqHKU2qNg4cLDxDKYqW/CF0jwV3eWOULQ1qERJP4E28CBFcj6QUn7snwpsx+9K+Qu2
	 POIbcaK1ERRHtrayBYsdhpVVMqCnIj3U/FswN9W3HiA4Vsg6KhJEbi7yWjCVgy7Bim
	 qkQ5e6uOUhmZCAZAp2Mldqm52UMAWsfOcJWE7Vw1mqKjcEoYqpl1pq42H9ff1U9Ztz
	 NxXUpOfWIJH1g==
Date: Wed, 14 Jun 2023 16:51:12 +0300
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
Subject: Re: [PATCH v4 06/34] mm: Convert pmd_pgtable_page() to pmd_ptdesc()
Message-ID: <20230614135112.GE52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-7-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-7-vishal.moola@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_065151_940155_FD1ED897 
X-CRM114-Status: GOOD (  14.92  )
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

On Mon, Jun 12, 2023 at 02:03:55PM -0700, Vishal Moola (Oracle) wrote:
> Converts pmd_pgtable_page() to pmd_ptdesc() and all its callers. This
> removes some direct accesses to struct page, working towards splitting
> out struct ptdesc from struct page.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  include/linux/mm.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index f184f1eba85d..088b7664f897 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2931,15 +2931,15 @@ static inline void pgtable_pte_page_dtor(struct page *page)
>  
>  #if USE_SPLIT_PMD_PTLOCKS
>  
> -static inline struct page *pmd_pgtable_page(pmd_t *pmd)
> +static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
>  {
>  	unsigned long mask = ~(PTRS_PER_PMD * sizeof(pmd_t) - 1);
> -	return virt_to_page((void *)((unsigned long) pmd & mask));
> +	return virt_to_ptdesc((void *)((unsigned long) pmd & mask));
>  }
>  
>  static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
>  {
> -	return ptlock_ptr(pmd_pgtable_page(pmd));
> +	return ptlock_ptr(ptdesc_page(pmd_ptdesc(pmd)));
>  }
>  
>  static inline bool pmd_ptlock_init(struct page *page)
> @@ -2958,7 +2958,7 @@ static inline void pmd_ptlock_free(struct page *page)
>  	ptlock_free(page);
>  }
>  
> -#define pmd_huge_pte(mm, pmd) (pmd_pgtable_page(pmd)->pmd_huge_pte)
> +#define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
>  
>  #else
>  
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
