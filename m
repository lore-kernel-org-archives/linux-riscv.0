Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B832CA0FF6
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 23:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VqOJvcXK0gW3Q6zETQ/ID0lAE+ZBii3HEe8i1gteeyI=; b=JB0Wt5bB8r9P7I
	+wOtc5yVMzBlFDOvosqOPmPVEwpf8IzXAZjbzM8zCmo5K+d/j8UWDFPNmlcpWnYeIsCOpZ7cl3VLp
	2fWHjATr+/ghX/AOLnl6P8mdRGFrJOOBSn0Re8KfWsnA0F2z/e5PVzEeDFuSKtade4BUtIi/LflIL
	MjQpKG2oAUQH8bsNwa0fMx88yMTFzMRBzhWwl1ohnGmm5BtR9JjP3VSGjdHaIyEUH+pG5F3cKupRz
	0lalHF2i5e4mKjHXK7WvnXmrqXg7kEPmm5KkZyHmGmRZl71grwyyDM/WaPrt4e23MBtpIwOZwt7ew
	bsYiXS1Il8zMj2rAOvmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urm1C-00000003fhZ-02aT;
	Thu, 28 Aug 2025 23:26:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urjb9-00000003FWt-0yph
	for linux-riscv@lists.infradead.org;
	Thu, 28 Aug 2025 20:51:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756414313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TWFVCA1eidbRWe4Mvk+B7obYKckT+mqN7M8LbBoJEjM=;
	b=UhYX4RW1cHSThivPDmx+7E/zp/Ld67BOG3uhZx1RXHbL0liP0AH/b13dNOrsmkjoCJe6mj
	+R7+Nc9u+NgfBfpjSD+0Gbty4mb/leeHYP7oPGfLuhnwSwrpS343bsU0ZGIpjAVrKV6Ge4
	WKMw6E9/Mbsp7lDM5VBFso1x3bYkySo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-6p-_-sGGOGi5Yf1sTQGQAw-1; Thu, 28 Aug 2025 16:51:52 -0400
X-MC-Unique: 6p-_-sGGOGi5Yf1sTQGQAw-1
X-Mimecast-MFC-AGG-ID: 6p-_-sGGOGi5Yf1sTQGQAw_1756414311
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45b612dbc28so9258035e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Aug 2025 13:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756414311; x=1757019111;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TWFVCA1eidbRWe4Mvk+B7obYKckT+mqN7M8LbBoJEjM=;
        b=j3ABEBkaFV//QFlNuuxCH8VMHJoI9Oj3KtSDcb/raogNadLBDJn083Cp5QHkV5ica9
         rX8DzYY0VD5wi0HTR7H3YV0rCe75sBgZpC26ezkmeeVpgck4h9hCQfNTt7WZ4FhsAq4D
         luAkYT20F6UNZXlSxPcUNnQpWlIh0oeCcJ0c02gQAfQVNh+0PHiNS5PMRjORpNpqKWea
         2qDXsikn2cneez/5bFiYmrVpUR4F/Ddd3HhULJWlSnPPQcxYh4GVgmMbUAmX9V/0tL2+
         aeq/TdZPnQBTn3aT3vsl3hXYCPFrF1GECEzUD7fNgQApnkzskpVN/w3xt6SKfrRhK2X+
         kz+w==
X-Forwarded-Encrypted: i=1; AJvYcCUfpE+RS/FH+jEZHHkWqbDXryzIaCjHygvi6TorFWKoSVF4+OpwVGFADUEpE3baK3HnlL5PMurl0VMgog==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9CVShP6n8wR3Mlbjbr1y5ZK9JV82HEgJpPme8MJfC+8Lhqwit
	09AaFvEk6pbdJQ7lh6et78c1sTKY1J7rEDcyNFkk+spFhjLCB8ccJ/6fJTvpvGSrJ+lFm33Br6j
	6+4vDFLS58DBtY4Xzlwlcy3YECeN7/6K8JdFSJZyLY8gYFPTo4XZEvFjc8W9RwoCGLh96qQ==
X-Gm-Gg: ASbGnctJRCvVchFtzRjoM6y0MoKK2NNVBeMkXVxBSDVDZo5t/Dewce0OI+5ABO+hAD4
	/VwlQbXjuap6leFKRxuvRogfvxZ9jfbcVEjTB7Ar3ZXvUV2Noc5hTeu/wSQXaXKm50ZPqb1hLTB
	qv2LhzKm1LrnlW/KtVknEv+Ufs+rvIcRUnp1KuD9fd1RAg7Foni8mgnMtSG7HesCFFmtBw770SL
	oEK5AtXLBVOgP8/4CdHDG/eWvRbSF38tgek2Nr+g/A1H6cWNI7W+mwdigCamZxD+jZOGeKh1bcT
	Hhgl9z6ufSIiNlCFs32wvERcf6DTvCn/xbDNw89z6sagEve5DjuVqUBFDDLU8NZJLjnIf2i/u2L
	eynX9im1Q2eGqJgBm4lXv0r2Hu/xnnRhYIuIoq1oQb2TFJleUSAXqPxytm4kPYeLyf9Y=
X-Received: by 2002:a05:600c:c491:b0:45b:4d47:5559 with SMTP id 5b1f17b1804b1-45b517dadd6mr212975985e9.36.1756414310785;
        Thu, 28 Aug 2025 13:51:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBxEpIi+OizhCOrvRivNgDFtglg6ujTEy6gKjCh35xHRfgibjOrf5BEosBm4/LLfFcliwoKA==
X-Received: by 2002:a05:600c:c491:b0:45b:4d47:5559 with SMTP id 5b1f17b1804b1-45b517dadd6mr212975405e9.36.1756414310334;
        Thu, 28 Aug 2025 13:51:50 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f28:c100:2225:10aa:f247:7b85? (p200300d82f28c100222510aaf2477b85.dip0.t-ipconnect.de. [2003:d8:2f28:c100:2225:10aa:f247:7b85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7df3ff72sm8506805e9.1.2025.08.28.13.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 13:51:49 -0700 (PDT)
Message-ID: <2be7db96-2fa2-4348-837e-648124bd604f@redhat.com>
Date: Thu, 28 Aug 2025 22:51:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 20/36] mips: mm: convert __flush_dcache_pages() to
 __flush_dcache_folio_pages()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Alexander Potapenko <glider@google.com>,
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
 linux-scsi@vger.kernel.org, Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-21-david@redhat.com>
 <ea74f0e3-bacf-449a-b7ad-213c74599df1@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <ea74f0e3-bacf-449a-b7ad-213c74599df1@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rXDZn1nByTe8FY7PxuYC70ne7ZRnQkfuCqT6xGQ_qtU_1756414311
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_135155_349497_6C24182D 
X-CRM114-Status: GOOD (  20.21  )
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

On 28.08.25 18:57, Lorenzo Stoakes wrote:
> On Thu, Aug 28, 2025 at 12:01:24AM +0200, David Hildenbrand wrote:
>> Let's make it clearer that we are operating within a single folio by
>> providing both the folio and the page.
>>
>> This implies that for flush_dcache_folio() we'll now avoid one more
>> page->folio lookup, and that we can safely drop the "nth_page" usage.
>>
>> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   arch/mips/include/asm/cacheflush.h | 11 +++++++----
>>   arch/mips/mm/cache.c               |  8 ++++----
>>   2 files changed, 11 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/mips/include/asm/cacheflush.h b/arch/mips/include/asm/cacheflush.h
>> index 5d283ef89d90d..8d79bfc687d21 100644
>> --- a/arch/mips/include/asm/cacheflush.h
>> +++ b/arch/mips/include/asm/cacheflush.h
>> @@ -50,13 +50,14 @@ extern void (*flush_cache_mm)(struct mm_struct *mm);
>>   extern void (*flush_cache_range)(struct vm_area_struct *vma,
>>   	unsigned long start, unsigned long end);
>>   extern void (*flush_cache_page)(struct vm_area_struct *vma, unsigned long page, unsigned long pfn);
>> -extern void __flush_dcache_pages(struct page *page, unsigned int nr);
>> +extern void __flush_dcache_folio_pages(struct folio *folio, struct page *page, unsigned int nr);
> 
> NIT: Be good to drop the extern.

I think I'll leave the one in, though, someone should clean up all of 
them in one go.

Just imagine how the other functions would think about the new guy 
showing off here. :)

> 
>>
>>   #define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 1
>>   static inline void flush_dcache_folio(struct folio *folio)
>>   {
>>   	if (cpu_has_dc_aliases)
>> -		__flush_dcache_pages(&folio->page, folio_nr_pages(folio));
>> +		__flush_dcache_folio_pages(folio, folio_page(folio, 0),
>> +					   folio_nr_pages(folio));
>>   	else if (!cpu_has_ic_fills_f_dc)
>>   		folio_set_dcache_dirty(folio);
>>   }
>> @@ -64,10 +65,12 @@ static inline void flush_dcache_folio(struct folio *folio)
>>
>>   static inline void flush_dcache_page(struct page *page)
>>   {
>> +	struct folio *folio = page_folio(page);
>> +
>>   	if (cpu_has_dc_aliases)
>> -		__flush_dcache_pages(page, 1);
>> +		__flush_dcache_folio_pages(folio, page, folio_nr_pages(folio));
> 
> Hmmm, shouldn't this be 1 not folio_nr_pages()? Seems that the original
> implementation only flushed a single page even if contained within a larger
> folio?

Yes, reworked it 3 times and messed it up during the last rework. Thanks!

-- 
Cheers

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
