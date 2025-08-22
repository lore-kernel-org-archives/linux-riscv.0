Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE2DCA0EED
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 12:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K6wQmHPkcXTCyMSUK/61Zbp9aM0DtOSa1fpcQAWJdfc=; b=P4UTlhjjJhgu9B
	axJLNfJgvltX5Ax8W4UeLmVLmdKR0+B0OgoPQiIRpN6YfkZ3gzl+Aa1jdZIz+rtHvJRI34iIDwxl3
	8lO/6F3o0lAO+HzGBqkhF3Qgg/2rsLlxWi7K70rVzvAENFAwW/qjKe9F8zr+dPrHlze1TgUUk1BLC
	YNoWSVQZM8r899NXpiHpSR+TiePMt4b/BFNcNiI1QAwI0TItLBryWBj1IlBdbYa9/qXMbSQ6/yUVD
	jVbdZeraLJXXhSDaguj7vnZl0ymiI3vdkqeyAv16amP8FMaaFPmTZT0g2lsrJNkxmTeWTJPFukXQ7
	tRT8Fz9DPjkt1u/Km82g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRCj-00000002XKG-2nWo;
	Fri, 22 Aug 2025 12:49:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upJ5k-00000001TZp-1tx2
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 04:09:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755835766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wD6Kie9NmTYlBWSYITqg8VmPWCkzgpHh3Jn6J+e3AEM=;
	b=HQQnlVLIyAFLwTFey09rKZ+g0o7S2xxEBh8sfVMpq9eBV9wjXNRV96j1hejxVSFCADuIQ4
	eslU3Xz3lrQNcU7B4qVmVahzWOSK7Nh9BJhdEL76JLYDaNTIiyps/A9GTWwkQSgnIN9xOZ
	GBRDnC32BkNuDrEZhFHSCJ9XxLFjLbI=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-DztohzFyPDqNb6Ks5WtGlg-1; Fri, 22 Aug 2025 00:09:23 -0400
X-MC-Unique: DztohzFyPDqNb6Ks5WtGlg-1
X-Mimecast-MFC-AGG-ID: DztohzFyPDqNb6Ks5WtGlg_1755835762
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-333f8fa3672so7380101fa.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 21:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755835762; x=1756440562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wD6Kie9NmTYlBWSYITqg8VmPWCkzgpHh3Jn6J+e3AEM=;
        b=RQRnWMFbVK3HvMLVbVvQom080u8ikKzViJENh8od4OvY1dHK+HZgp9o0MMtCCueq/6
         keCEsJtxHrBPadD0bFUX2JqTyB6U5Mof/mU9Z+4DVwHLIR0RdqomuuFRdde2/UBljIhk
         Dot5vFmmW3hJuF5rlOA5W7rmGSPpocFT/cJNClp3LLaCVGl9TEXtufk1A541y/t80Vvm
         SrUoIeDQMgznaZH3KXgju+5UgqB9sh/xdmzeoXo/bCoPiUzB1XNZz7D2NBAuzlk/V6CV
         RLNogAhGULaMl1TL2sUzKAECymSrxqf9PNvAc49SeR+Mlh6Re5xYCmzZGQHR39khKAxv
         zUFA==
X-Forwarded-Encrypted: i=1; AJvYcCUMobZYB5NBAuxSz6f/ze6jwieUN1KRooNUVnCkT6G2asGGxkSiVZ8oeNyISJMj+3W7thpaYnkevNpNkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9FcV7DNMb/eIcfukbycWkfUFhwyw27l0hwHJ7kSgRQ7yHmB5r
	YWbl66drjg5bxd5/lyApLraSjxFI9JecPiMYz9BiW+COLrhMY8QCEFm/sNvkCKu1hOoYWKrJ+ya
	LVaC1wXQqKfgDwSd8P3kHjh4eNZ9AksMSpDN4opgvZy0YrJUa91NY6rlHHDzOkhZAKe6i
X-Gm-Gg: ASbGncuXg4VLc4DqLWg0eEA5oZJucSKL5JXk2IJqjuaCcKe0waEcPWUXsy6LWmlrflk
	7lsETqh2UHOXLI1pEN/eqNGAHo2C1bd2dLbb5Wx7tx5VfPSN1G377asnbRsKWWZAmL9QwUjeAlq
	bD5eMtEFmINpes6LsAlqWIhRuWic9eSgRSxNb8xkBQNqsxmTlXZyWc+jQoL1CY+Io0KuNQHC8J8
	0BPhyz/KPchnWZDTHXTzD3V6gzrtzPibGqOkfEvEUM5MCTwsp6zenY9ECVZdU9EhGGnd/PfQBYC
	R3HXbtjtEiU005sZhch5b84dfj8k3kGvGX5GlH9u1uB9OLoWVt1KUzu4+FXA+CRL9w==
X-Received: by 2002:a2e:be0c:0:b0:333:b6b0:e665 with SMTP id 38308e7fff4ca-33650fa8605mr4319591fa.30.1755835762126;
        Thu, 21 Aug 2025 21:09:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIfwy5viYQG7CiACnNo0XJ1QLrkAQo6vQi0t/AKYxGuojOFc+bxzH8Oeop0sL+wr/cDEqByA==
X-Received: by 2002:a2e:be0c:0:b0:333:b6b0:e665 with SMTP id 38308e7fff4ca-33650fa8605mr4319091fa.30.1755835761548;
        Thu, 21 Aug 2025 21:09:21 -0700 (PDT)
Received: from [192.168.1.86] (85-23-48-6.bb.dnainternet.fi. [85.23.48.6])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a41e3cfsm35236551fa.6.2025.08.21.21.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 21:09:19 -0700 (PDT)
Message-ID: <9156d191-9ec4-4422-bae9-2e8ce66f9d5e@redhat.com>
Date: Fri, 22 Aug 2025 07:09:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/35] mm/hugetlb: cleanup
 hugetlb_folio_init_tail_vmemmap()
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>, virtualization@lists.linux.dev,
 Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, x86@kernel.org,
 Zi Yan <ziy@nvidia.com>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-11-david@redhat.com>
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20250821200701.1329277-11-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DIf9R92Yp62hXA-iQmhWwt9UzJNLaPZN4aIIEFtihVk_1755835762
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_210928_558480_11EF90E3 
X-CRM114-Status: GOOD (  24.54  )
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


On 8/21/25 23:06, David Hildenbrand wrote:

> All pages were already initialized and set to PageReserved() with a
> refcount of 1 by MM init code.

Just to be sure, how is this working with MEMBLOCK_RSRV_NOINIT, where MM is supposed not to
initialize struct pages?

> In fact, by using __init_single_page(), we will be setting the refcount to
> 1 just to freeze it again immediately afterwards.
>
> So drop the __init_single_page() and use __ClearPageReserved() instead.
> Adjust the comments to highlight that we are dealing with an open-coded
> prep_compound_page() variant.
>
> Further, as we can now safely iterate over all pages in a folio, let's
> avoid the page-pfn dance and just iterate the pages directly.
>
> Note that the current code was likely problematic, but we never ran into
> it: prep_compound_tail() would have been called with an offset that might
> exceed a memory section, and prep_compound_tail() would have simply
> added that offset to the page pointer -- which would not have done the
> right thing on sparsemem without vmemmap.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/hugetlb.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
>
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index d12a9d5146af4..ae82a845b14ad 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -3235,17 +3235,14 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
>  					unsigned long start_page_number,
>  					unsigned long end_page_number)
>  {
> -	enum zone_type zone = zone_idx(folio_zone(folio));
> -	int nid = folio_nid(folio);
> -	unsigned long head_pfn = folio_pfn(folio);
> -	unsigned long pfn, end_pfn = head_pfn + end_page_number;
> +	struct page *head_page = folio_page(folio, 0);
> +	struct page *page = folio_page(folio, start_page_number);
> +	unsigned long i;
>  	int ret;
>  
> -	for (pfn = head_pfn + start_page_number; pfn < end_pfn; pfn++) {
> -		struct page *page = pfn_to_page(pfn);
> -
> -		__init_single_page(page, pfn, zone, nid);
> -		prep_compound_tail((struct page *)folio, pfn - head_pfn);
> +	for (i = start_page_number; i < end_page_number; i++, page++) {
> +		__ClearPageReserved(page);
> +		prep_compound_tail(head_page, i);
>  		ret = page_ref_freeze(page, 1);
>  		VM_BUG_ON(!ret);
>  	}
> @@ -3257,12 +3254,14 @@ static void __init hugetlb_folio_init_vmemmap(struct folio *folio,
>  {
>  	int ret;
>  
> -	/* Prepare folio head */
> +	/*
> +	 * This is an open-coded prep_compound_page() whereby we avoid
> +	 * walking pages twice by preparing+freezing them in the same go.
> +	 */
>  	__folio_clear_reserved(folio);
>  	__folio_set_head(folio);
>  	ret = folio_ref_freeze(folio, 1);
>  	VM_BUG_ON(!ret);
> -	/* Initialize the necessary tail struct pages */
>  	hugetlb_folio_init_tail_vmemmap(folio, 1, nr_pages);
>  	prep_compound_head((struct page *)folio, huge_page_order(h));
>  }

--Mika


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
