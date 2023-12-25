Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC947C3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Dec 2023 06:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=609ZoPEqb0HQ+zf0FnVbprLqgpvo9icNZSpNsEG1Qlk=; b=isnxnN3nsXzRMm
	p5MyOC2qrEgs1p1ROXm6+poSoCpIJ7pmk5UW3xa/6/ybQsnh/+wDzY+W7/BIFbmGM+bD0REXTqORw
	Q1H4cXgNV1lOhsHapy3UiP7DQ2T9LO1Q6UwOTK0f+2dvaElqtkGYVCZ55PraS8hge7dzmhnMyLMs7
	rMjDdCdxFyLGjkIVGUCrC/lP1Sajvo7plxLTJj3hlgVbYhUJ5W3+RyR8KROFQ8lfNd5wrcCXv96KB
	GleXuCjoCaqbZXbqb5l9C+x9oIQTZHvEGX6hUN0dWCUMsFL6/dw9B35f4C4sIwXUsS8mi+38lkIN3
	TT0KyS1zemc62UtsJXMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHeTo-00AGmX-1v;
	Mon, 25 Dec 2023 06:30:24 +0000
Received: from out-170.mta1.migadu.com ([2001:41d0:203:375::aa])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHeTm-00AGhx-0M
	for linux-riscv@lists.infradead.org;
	Mon, 25 Dec 2023 06:30:23 +0000
Message-ID: <135b3189-f459-4b57-9861-bb8acb999d91@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1703485805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mXkiPRdEVvfi9LIMu0a4pQRnrGa3opN+NyWjT9LajSI=;
	b=h682B12QYqT/ZiBDMXBg7hxqm2zl3GqlcPYEpS6y3r1bGCN3rdgqF0yDtrO4pW4CUYWVXI
	sTJy5rRK3CQjhtBukguGXtqnO65rzWMecb3dF6Bh7A7RdO4oHUmUtz51k8Yklj7jcfBANa
	Xv5L0ZESaqeE7oGtj7aq7bWJxH5I2r4=
Date: Mon, 25 Dec 2023 14:29:53 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 03/13] mm: Provide generic pmd_thp_or_huge()
To: peterx@redhat.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc: Matthew Wilcox <willy@infradead.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Lorenzo Stoakes <lstoakes@gmail.com>, David Hildenbrand <david@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Kravetz <mike.kravetz@oracle.com>,
 Mike Rapoport <rppt@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 John Hubbard <jhubbard@nvidia.com>, Andrew Jones <andrew.jones@linux.dev>,
 linux-arm-kernel@lists.infradead.org, Michael Ellerman <mpe@ellerman.id.au>,
 "Kirill A . Shutemov" <kirill@shutemov.name>, linuxppc-dev@lists.ozlabs.org,
 Rik van Riel <riel@surriel.com>, linux-riscv@lists.infradead.org,
 Yang Shi <shy828301@gmail.com>, James Houghton <jthoughton@google.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Andrea Arcangeli <aarcange@redhat.com>,
 Axel Rasmussen <axelrasmussen@google.com>
References: <20231219075538.414708-1-peterx@redhat.com>
 <20231219075538.414708-4-peterx@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20231219075538.414708-4-peterx@redhat.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231224_223022_317477_E26FC965 
X-CRM114-Status: GOOD (  17.79  )
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



On 2023/12/19 15:55, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
>
> ARM defines pmd_thp_or_huge(), detecting either a THP or a huge PMD.  It
> can be a helpful helper if we want to merge more THP and hugetlb code
> paths.  Make it a generic default implementation, only exist when
> CONFIG_MMU.  Arch can overwrite it by defining its own version.
>
> For example, ARM's pgtable-2level.h defines it to always return false.
>
> Keep the macro declared with all config, it should be optimized to a false
> anyway if !THP && !HUGETLB.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   include/linux/pgtable.h | 4 ++++
>   mm/gup.c                | 3 +--
>   2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index af7639c3b0a3..6f2fa1977b8a 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1355,6 +1355,10 @@ static inline int pmd_write(pmd_t pmd)
>   #endif /* pmd_write */
>   #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>   
> +#ifndef pmd_thp_or_huge

I think it may be the time to rename to pmd_thp_or_hugetlb,
the "huge" is really confusing. thp is not huge? Actually,
it is huge. It is better to make it more specific from now on, like
"hugetlb".

BTW, please cc me via the new email (muchun.song@linux.dev) next edition.

Thanks.

> +#define pmd_thp_or_huge(pmd)	(pmd_huge(pmd) || pmd_trans_huge(pmd))
> +#endif
> +
>   #ifndef pud_write
>   static inline int pud_write(pud_t pud)
>   {
> diff --git a/mm/gup.c b/mm/gup.c
> index 0a5f0e91bfec..efc9847e58fb 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -3004,8 +3004,7 @@ static int gup_pmd_range(pud_t *pudp, pud_t pud, unsigned long addr, unsigned lo
>   		if (!pmd_present(pmd))
>   			return 0;
>   
> -		if (unlikely(pmd_trans_huge(pmd) || pmd_huge(pmd) ||
> -			     pmd_devmap(pmd))) {
> +		if (unlikely(pmd_thp_or_huge(pmd) || pmd_devmap(pmd))) {
>   			/* See gup_pte_range() */
>   			if (pmd_protnone(pmd))
>   				return 0;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
