Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24467C7EE2A
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 14:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YaXVjxyoA0SG2UNv1xyTHy/NCmU/ABCLGn0OKR+6d80=; b=HNLknz0VzF2gUt
	n9c0C7kRzMVjt+L238UYfVRlUdURGdSng51TOu/jRnn4nw3+sSpQ96tCDzM5yeSqk1WmdyhP+R75Q
	iOKa9uMxWoNFQBP/fma6uhVTwgDKvhkucJ+30hjRaI71e9sbssKygFtdp4XTXRvu182BxJIwONSvl
	5j235/Kv3x4T8MrsR7lf8ykNG46VzgUy9NqYPw/+Wh0o2S1XfCtNhAlo1Mmo3M4TXONaSHZMi8iYL
	6gSaY9/B4qvhQQoe5ol8yDYBi0EBN4VqexBe7taMia98CiCAU+ht+6Nz8PHhx0b6FhKlE6Mp+1BY9
	RyoEMe/19s+2c+LUPBeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUR5B-00000008xo4-14G8;
	Wed, 25 Jun 2025 14:26:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNsl-00000008PAO-1laW
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 11:01:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750849294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Kz6APK9dsF4j4P9pg66c0MDK7d+JPOfYEid0r31fCbs=;
	b=T8NMi8K8V48XEiohwY/MvBqbejqJTo30qm37WEowl2AEPgtryRYWdpgbl6bnsnDK7T1x/V
	U5spjR/UhG3P0bZq4fyqtH4bVD3AryqAnreRY1YHhRwYZifNtMsBYr+VQpel8Lsl8izJ1S
	Nn7CNuLkNrVRHRNGswFody+X3nFdy0A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-8b-uKVW1PGuYYWbAi_lXbw-1; Wed, 25 Jun 2025 07:01:33 -0400
X-MC-Unique: 8b-uKVW1PGuYYWbAi_lXbw-1
X-Mimecast-MFC-AGG-ID: 8b-uKVW1PGuYYWbAi_lXbw_1750849292
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450de98b28eso3908725e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jun 2025 04:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750849292; x=1751454092;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Kz6APK9dsF4j4P9pg66c0MDK7d+JPOfYEid0r31fCbs=;
        b=GmsCPEZ0GHytyQssbseynT95B1XZXYd3GGSUwlSeItmnPmd9okD8SXiay4PA80VPuB
         cq3mK9g7IiigwDHGY4SwINDifzxLvEquXVTogNiT9DT6R97RyMa7sreL0VzqiMN/xdtJ
         43KVasnMWi5u/nwu+YUcvFnyI/vTOtVkAZDl1cADLEGzH003mn/z5Q3ttIJvpAEmc6Ot
         347gWwvqCZcGbsa/aRjWIA5ULEzwqfBiFT2ehiKJTRTePAl6+TqZr5xKMGUQ/QP3OYkT
         WKlMM7dkSqDsVtsdQSU0aJXNVUkC31v8Xjxga/JP5X0RLk8D039NE9z0j2/p80H6b0gj
         3Gbg==
X-Forwarded-Encrypted: i=1; AJvYcCUDadJEaxmpowC8wWh2p6uPy3ThxSDufyHpGU98vlOsMjy0C5+01Hzs806f87WqsTf+zWBvMqT9KY7bQg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9uxsUDfRdy6o1W2K+4Mqg+QfK85+3oibDN93gsUEHO/Rh+CF+
	GBBx8Sgg16NF8oj76GZUO/9nQkr2HxFyzMUSNtKp9BawELD/cIA5wp3pj/rPLEy2HZBbZxylvkY
	rvpf7JP+Vm+C8/yZyK/Bcim5/d50+pY8F4xdH71VGfHh6mvHvlKlYqbYffDAaVFqAcBoSvQ==
X-Gm-Gg: ASbGnctong4CEr1Qz60Jlzq+vZ40VvCZ/qRciQTco5POc/UFH+6Yd5vnehEqofncqbg
	zo4vC03VWhk15lQGc/HWxxDLRfh1Z2MDaxoUYA5lTXK0zY6SM91VrBEKAo/MgRIQJNUDH1jDPFm
	QcX3qpDRc6+GiJxZl56kP7GiW522e/fRstpeMYyk2HKbsUkSht+pNBLhpbTjJ1aHuGsbrLqutOQ
	7E0deMlpnpRkKbfItS13ox0G/zFLqdsdsTkGooc2NnAs6pyVWc420v2IxUEm7GXTAIFjuF3TYEu
	P9QqQ5epyfS23+e5Lk0PbYJ3k+uPwX8b2Pqp276lKmQYXEyTeR0CcvhJsdXI+DbEVWMtG5j+LSb
	RhTqJqau3CNmgGOLt2vqwKO3h4DcrMvQJAxFx03GAgD5k
X-Received: by 2002:a5d:64e6:0:b0:3a4:f722:a46b with SMTP id ffacd0b85a97d-3a6e71ff6aamr6361380f8f.15.1750849291854;
        Wed, 25 Jun 2025 04:01:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPZFLBLmsDHtXRB4H5l5o76XKJEC5l5yx1gYpH977UiB1XroTTTWDmy2sKvb5kr0xD7UuyEA==
X-Received: by 2002:a5d:64e6:0:b0:3a4:f722:a46b with SMTP id ffacd0b85a97d-3a6e71ff6aamr6361311f8f.15.1750849291308;
        Wed, 25 Jun 2025 04:01:31 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538235600csm16446145e9.20.2025.06.25.04.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 04:01:30 -0700 (PDT)
Message-ID: <5ba95609-302b-456a-a863-2bd5df51baf2@redhat.com>
Date: Wed, 25 Jun 2025 13:01:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Barry Song <21cnbao@gmail.com>, Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com,
 chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org,
 ying.huang@intel.com, zhengtangquan@oppo.com,
 Lance Yang <ioworker0@gmail.com>
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com>
 <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
 <938c4726-b93e-46df-bceb-65c7574714a6@linux.dev>
 <CAGsJ_4y1GObH-C7R=FQL=UWe3kF6qhKoRqPxNPYx0k7uwocc+g@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CAGsJ_4y1GObH-C7R=FQL=UWe3kF6qhKoRqPxNPYx0k7uwocc+g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: brvtbIXR6EOoD8B-zrmrqnL38s9O62sPPZDHOaW4IXM_1750849292
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_040135_535468_0CB56EA4 
X-CRM114-Status: GOOD (  16.37  )
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

On 25.06.25 12:57, Barry Song wrote:
>>>
>>> Note that I don't quite understand why we have to batch the whole thing
>>> or fallback to
>>> individual pages. Why can't we perform other batches that span only some
>>> PTEs? What's special
>>> about 1 PTE vs. 2 PTEs vs. all PTEs?
>>
>> That's a good point about the "all-or-nothing" batching logic ;)
>>
>> It seems the "all-or-nothing" approach is specific to the lazyfree use
>> case, which needs to unmap the entire folio for reclamation. If that's
>> not possible, it falls back to the single-page slow path.
> 
> Other cases advance the PTE themselves, while try_to_unmap_one() relies
> on page_vma_mapped_walk() to advance the PTE. Unless we want to manually
> modify pvmw.pte and pvmw.address outside of page_vma_mapped_walk(), which
> to me seems like a violation of layers. :-)

Please explain to me why the following is not clearer and better:

diff --git a/mm/rmap.c b/mm/rmap.c
index 8200d705fe4ac..09e2c2f28aa58 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1845,23 +1845,31 @@ void folio_remove_rmap_pud(struct folio *folio, struct page *page,
  #endif
  }
  
-/* We support batch unmapping of PTEs for lazyfree large folios */
-static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
-                       struct folio *folio, pte_t *ptep)
+static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
+               struct page_vma_mapped_walk *pvmw, enum ttu_flags flags,
+               pte_t pte)
  {
         const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
-       int max_nr = folio_nr_pages(folio);
-       pte_t pte = ptep_get(ptep);
+       struct vm_area_struct *vma = pvmw->vma;
+       unsigned long end_addr, addr = pvmw->address;
+       unsigned int max_nr;
+
+       if (flags & TTU_HWPOISON)
+               return 1;
+       if (!folio_test_large(folio))
+               return 1;
+
+       /* We may only batch within a single VMA and a single page table. */
+       end_addr = min_t(unsigned long, ALIGN(addr + 1, PMD_SIZE), vma->vm_end);
+       max_nr = (end_addr - addr) >> PAGE_SHIFT;
  
+       /* We only support lazyfree batching for now ... */
         if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
-               return false;
+               return 1;
         if (pte_unused(pte))
-               return false;
-       if (pte_pfn(pte) != folio_pfn(folio))
-               return false;
-
-       return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags, NULL,
-                              NULL, NULL) == max_nr;
+               return 1;
+       return folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, fpb_flags,
+                              NULL, NULL, NULL);
  }
  
  /*
@@ -2024,9 +2032,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
                         if (pte_dirty(pteval))
                                 folio_mark_dirty(folio);
                 } else if (likely(pte_present(pteval))) {
-                       if (folio_test_large(folio) && !(flags & TTU_HWPOISON) &&
-                           can_batch_unmap_folio_ptes(address, folio, pvmw.pte))
-                               nr_pages = folio_nr_pages(folio);
+                       nr_pages = folio_unmap_pte_batch(folio, &pvmw, flags, pteval);
                         end_addr = address + nr_pages * PAGE_SIZE;
                         flush_cache_range(vma, address, end_addr);


-- 
Cheers,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
