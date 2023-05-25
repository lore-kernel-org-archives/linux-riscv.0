Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8A1C7EE2C
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 08:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DtFR++WJ2ZbL+vV5V03L1LstdvWuDrt5/JWdAQhdMKc=; b=iBmEBFH51xnczs
	ZYzyNMWPKUeO/IcdYQwGn2b5eLZgVLMStB3nR/VXXiLWNZpepmqY+a4xdKoUJ9vsM0Wp6+2lpxCvT
	keI/s49pI/0kukTamOPazKV2Xo9NucyXheswJUiY1IJ9jcOwaRDTNBxvec4HGh/qrwweo2YjyrPKN
	dkfqAyFFQhQdAx1O4rrplmfem5rgzjWln1lffLA9A9SRvh/KDp9qOCtsWlzOnNZ1zJkN+gqP6Vqy3
	/tVN23f5lY/EviWqR+dt10BFquntLXcCn9Xd9/xq7L7wOSRWouZuFusa0yHqphJDQWWgA/7AcvEBm
	+zN71cjRLUsogcbj6/Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q26lm-00G43W-2B;
	Thu, 25 May 2023 08:56:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q26li-00G41s-2N;
	Thu, 25 May 2023 08:56:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 443A86441D;
	Thu, 25 May 2023 08:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9425AC433EF;
	Thu, 25 May 2023 08:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685004981;
	bh=T3x6HsAO3RQbrXA8lAmGWzhIEFxQo3e/SuF/zmio4Hs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mRtUeUA+TIvgOPBLeDE0LEeluR6Lkzocki1ce4LxvGW3Kh74OsnmFoUFRRmQEOqgY
	 vPbs8UllpBsHYQNETyRPKHNQXbkjzvcZ/qcNMJMO2YSn7oQ9dFwS8Ece6KmReDjGKv
	 UHsfvGg5kn0tsbjmZAqeTwYppOTlzTxEsz6d+ZO+0GcrxaOJ0wF3N2ge6+B4EiqPJP
	 Rr14bkavs3kxuqVnqdy8wSuE2VMYBsI0nPEtl+gq6jIzwj54Hlj3QoMxeOG7OsIhLt
	 Fod2UUbjMqcZpiBjbvghJGsfjbRDVycHZQ/GoUx1cUGXfXrx/0id06caAMVPKwYBaI
	 blTpXwhMXt6qg==
Date: Thu, 25 May 2023 11:55:55 +0300
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
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Subject: Re: [PATCH v2 01/34] mm: Add PAGE_TYPE_OP folio functions
Message-ID: <20230525085555.GV4967@kernel.org>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-2-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230501192829.17086-2-vishal.moola@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_015622_855557_08B9183A 
X-CRM114-Status: GOOD (  18.71  )
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

Hi,

On Mon, May 01, 2023 at 12:27:56PM -0700, Vishal Moola (Oracle) wrote:
> No folio equivalents for page type operations have been defined, so
> define them for later folio conversions.

Can you please elaborate why would we need folios for page table descriptors? 
 
> Also changes the Page##uname macros to take in const struct page* since
> we only read the memory here.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  include/linux/page-flags.h | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index 1c68d67b832f..607b495d1b57 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -902,6 +902,8 @@ static inline bool is_page_hwpoison(struct page *page)
>  
>  #define PageType(page, flag)						\
>  	((page->page_type & (PAGE_TYPE_BASE | flag)) == PAGE_TYPE_BASE)
> +#define folio_test_type(folio, flag)					\
> +	((folio->page.page_type & (PAGE_TYPE_BASE | flag)) == PAGE_TYPE_BASE)
>  
>  static inline int page_type_has_type(unsigned int page_type)
>  {
> @@ -914,20 +916,34 @@ static inline int page_has_type(struct page *page)
>  }
>  
>  #define PAGE_TYPE_OPS(uname, lname)					\
> -static __always_inline int Page##uname(struct page *page)		\
> +static __always_inline int Page##uname(const struct page *page)		\
>  {									\
>  	return PageType(page, PG_##lname);				\
>  }									\
> +static __always_inline int folio_test_##lname(const struct folio *folio)\
> +{									\
> +	return folio_test_type(folio, PG_##lname);			\
> +}									\
>  static __always_inline void __SetPage##uname(struct page *page)		\
>  {									\
>  	VM_BUG_ON_PAGE(!PageType(page, 0), page);			\
>  	page->page_type &= ~PG_##lname;					\
>  }									\
> +static __always_inline void __folio_set_##lname(struct folio *folio)	\
> +{									\
> +	VM_BUG_ON_FOLIO(!folio_test_type(folio, 0), folio);		\
> +	folio->page.page_type &= ~PG_##lname;				\
> +}									\
>  static __always_inline void __ClearPage##uname(struct page *page)	\
>  {									\
>  	VM_BUG_ON_PAGE(!Page##uname(page), page);			\
>  	page->page_type |= PG_##lname;					\
> -}
> +}									\
> +static __always_inline void __folio_clear_##lname(struct folio *folio)	\
> +{									\
> +	VM_BUG_ON_FOLIO(!folio_test_##lname(folio), folio);		\
> +	folio->page.page_type |= PG_##lname;				\
> +}									\
>  
>  /*
>   * PageBuddy() indicates that the page is free and in the buddy system
> -- 
> 2.39.2
> 
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
