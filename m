Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3328103FF85
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 21:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=brzhFqIhYmDCKzbvEDZ3etbOSOAaq5XxSLP2AWLj0cA=; b=2G12jpufQOLkWE
	WmHyN4tphQ27ga1+WkV77Z+PSyd//E5CTf1JZPFTomfoFGrFEKTs/t4QnwA935zBj9NcWag4ChKi9
	jHRdX9evN5747p7Paax+eqSUiZAUS4GyWiXA5qZBb9JKrqE7wpr4kWbKV5Ck7UiU+FFzpdKxZVBta
	cG6gMR3zZYDutp35Olbc5p4zCAIbt8f/Af50yB7ogWdfQCzKXm+/3MiAr6PlrdaqCywjE8i01M4ef
	0TxeR6WW+LWtB6RoU6iIKxxYhIshlc4X5Z20YoOM5G/16BArokujft34hcrf5QicekBPb/qCpEgZA
	8SI1As91RX5zIBI2GcBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw54x-00000009A22-2ZlZ;
	Fri, 27 Feb 2026 21:08:55 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw54u-00000009A1r-3Ob7;
	Fri, 27 Feb 2026 21:08:52 +0000
Message-ID: <7d4ece82-2d92-4e97-851b-822816cfd800@infradead.org>
Date: Fri, 27 Feb 2026 13:08:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv7 17/18] hugetlb: Update vmemmap_dedup.rst
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
References: <20260227194302.274384-1-kas@kernel.org>
 <20260227194302.274384-18-kas@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260227194302.274384-18-kas@kernel.org>
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



On 2/27/26 11:42 AM, Kiryl Shutsemau (Meta) wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> Update the documentation regarding vmemmap optimization for hugetlb to
> reflect the changes in how the kernel maps the tail pages.
> 
> Fake heads no longer exist. Remove their description.
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> Reviewed-by: Muchun Song <muchun.song@linux.dev>
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  Documentation/mm/vmemmap_dedup.rst | 60 +++++++++++++-----------------
>  1 file changed, 26 insertions(+), 34 deletions(-)
> 
> diff --git a/Documentation/mm/vmemmap_dedup.rst b/Documentation/mm/vmemmap_dedup.rst
> index 1863d88d2dcb..4aaef36d8971 100644
> --- a/Documentation/mm/vmemmap_dedup.rst
> +++ b/Documentation/mm/vmemmap_dedup.rst
> @@ -124,33 +124,35 @@ Here is how things look before optimization::
>   |           |
>   +-----------+
>  
> -The value of page->compound_info is the same for all tail pages. The first
> -page of ``struct page`` (page 0) associated with the HugeTLB page contains the 4
> -``struct page`` necessary to describe the HugeTLB. The only use of the remaining
> -pages of ``struct page`` (page 1 to page 7) is to point to page->compound_info.
> -Therefore, we can remap pages 1 to 7 to page 0. Only 1 page of ``struct page``
> -will be used for each HugeTLB page. This will allow us to free the remaining
> -7 pages to the buddy allocator.
> +The first page of ``struct page`` (page 0) associated with the HugeTLB page
> +contains the 4 ``struct page`` necessary to describe the HugeTLB. The remaining
> +pages of ``struct page`` (page 1 to page 7) are tail pages.
> +
> +The optimization is only applied when the size of the struct page is a power-of-2

                  end that ^^ sentence with a period                      power of 2.

> +In this case, all tail pages of the same order are identical. See
> +compound_head(). This allows us to remap the tail pages of the vmemmap to a
> +shared, read-only page. The head page is also remapped to a new page. This
> +allows the original vmemmap pages to be freed.


-- 
~Randy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
