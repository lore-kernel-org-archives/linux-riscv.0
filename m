Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99839C83029
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jun 2025 13:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/E31v+CnugDemHZ6WfeTmz3IXUTtiNb8mh8kodFfxKI=; b=nDztcaMdAaHjYH
	dFUfPvgudh+YyC2A3eaXrS/iT1XIC3jE4g46EUN9w02In4RyZAxa43TXt8GreMi4xWlUDSd6rs/Pi
	nUMrdNcvuFhV9yFLtF5L5kD79UhgPHUOC1GzgwTFBxRVMw8KKQ9Eeg4EZvrOLgD+/S0/Ar39LJqjI
	kVpxLg38l+QteVVxJyJNwOQjoheUGh+iYX8TBKuyhqvRB/nOn6mGDS5xsKBV0yICQQw/DMgNCxfkm
	bQZRQEbCxTKkp7sSRcsK938rfke2m/K1MwrFDYvKzh6oDqtyLKBZyYm+w4sPJrWqzLDAAJBJuUSWM
	3Ta4rWsDzEjyiv9na3vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWEtm-00000002RKG-22UD;
	Mon, 30 Jun 2025 13:50:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWElE-00000002PUG-2hcO
	for linux-riscv@lists.infradead.org;
	Mon, 30 Jun 2025 13:41:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751290887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0k2rxKDyTrLeAGCInolANnXu3A8lQ0DXnhu+vRzUrjA=;
	b=AK22ZjRMII3dW+0FUCyJZOoW2sLMlFJ7OJbYclzvVtNxXL2P7i92DIJYrPFGDOaHHwZczZ
	xko3ZLeO9yiLKLyvoyxx6mO4dvfNQCBuEK1iIyUHQpa05aUp4B2wvXNFhw0wBF2aagPgDQ
	S4WGVHJ2t+bwaZSIFE16cgvIctFaVrg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-auTL_9CGNkqqi6yOejlEUA-1; Mon, 30 Jun 2025 09:41:25 -0400
X-MC-Unique: auTL_9CGNkqqi6yOejlEUA-1
X-Mimecast-MFC-AGG-ID: auTL_9CGNkqqi6yOejlEUA_1751290884
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451deff247cso26241225e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jun 2025 06:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751290884; x=1751895684;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0k2rxKDyTrLeAGCInolANnXu3A8lQ0DXnhu+vRzUrjA=;
        b=Cq6kjHqRap96N9IAl6xR2+2eHe90bBxDmtVtWwM5/Sn6pdxKkGlq3fhWW728Zrc57R
         RzDcaSB6qS8k+b8nvvBT8CR1JTJYassiBCgrmE/NXLrkv0kMWAsT4IPxEndJ860EXBjr
         r6ciz6X1ACngVqJ0WtNxZXI+L8SpfNTTC3of7dgCZrhSp7i+mHgjn9hNKL8YmksCBCM2
         +ui0RAKAnpz9LSfsqeBTDWpkddRRW6X9HUeFupQ0+XIpndylscP6QuvaugJmN6p15kgR
         HpbOQEn16CALpCnx771z8Wv1heYSB0zWaiXi0RT4KN7+DupmxO+U0IahmzP0Zumy7VP5
         a9Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXqBtn88EJ50vHwUXCAT9TQpUYXW1bqZUqljp3UmzCHEmYboi6ByuBkLDvRioa5ZXgeBWbwGsYqvEscHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YySJ57yjTH6AvFL/wO/zY/AShCW7WbEXgElN7SWnt9/Ptfxz2ey
	8ogMvKZVH1q/urKDPt/aV3CXgAwlr5kjZO7rwB9RN3JFTQvTd1kWSRVE/IAz7ZscjOeUuI+cjC5
	1z5W0W1hxH8HP71o9dQqsKcfkzV/Mtjw9s/2wBlMoTmi+0C00efiJh2hENTRa3QCFHXxdeQ==
X-Gm-Gg: ASbGnctspcU2QXieYmX7Bs7zn/+q4Brq0YSebNXOOCc7t3JswYMXLu2lVlLHc+IjGAX
	QKYEawRWGm+Tw8jSZGsi32narmIQ9+m9DPUdkWqOGlAVBNWPR6KVkM+oor47rfwpub47W9MIr7o
	1kjvCP+1ABbSP7F6lKkmoW2/9QNYVEdxyec9vQgt6coAJk44gomtOpmpggACX87DxG4v/hSNBm3
	+JoXvyUxLt3CeKus3SbLFagOUiVeRRLnftu3pWGMoY4nwdo8LVVeqPcgiMVRzhYEgWasL/VqJxo
	5Nukhj0poseGzRmJ4pDMuW85949z2fDMk1RhYronWflkiuYkq6hQIKy9chnwSFz07KoPqMBknHj
	xgfbZMpW2gsRUAbAvlM6pTFGSw6T9fBfe+eLDGy5Ich2O53E/0w==
X-Received: by 2002:a05:600c:6212:b0:43c:f3e1:a729 with SMTP id 5b1f17b1804b1-45388a0371cmr160686115e9.12.1751290884453;
        Mon, 30 Jun 2025 06:41:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrR723N0U4a8LBGYdriPUXtPEH33drejJE1WXOFzTtappaVkC0Rw6pAoF4eAVkr6seqmnUEg==
X-Received: by 2002:a05:600c:6212:b0:43c:f3e1:a729 with SMTP id 5b1f17b1804b1-45388a0371cmr160685765e9.12.1751290883904;
        Mon, 30 Jun 2025 06:41:23 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f40:b300:53f7:d260:aff4:7256? (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a5b7fsm138954025e9.10.2025.06.30.06.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:41:23 -0700 (PDT)
Message-ID: <498648fd-655e-47b3-8b7b-9c2ee11acc9b@redhat.com>
Date: Mon, 30 Jun 2025 15:41:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] mm/rmap: fix potential out-of-bounds page table
 access during batched unmap
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Lance Yang <ioworker0@gmail.com>
Cc: akpm@linux-foundation.org, 21cnbao@gmail.com,
 baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, ryan.roberts@arm.com,
 v-songbaohua@oppo.com, x86@kernel.org, huang.ying.caritas@gmail.com,
 zhengtangquan@oppo.com, riel@surriel.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, harry.yoo@oracle.com, mingzhe.yang@ly.com,
 stable@vger.kernel.org, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>
References: <20250630011305.23754-1-lance.yang@linux.dev>
 <41483c78-84f2-42fc-b9ab-09823eb796c4@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <41483c78-84f2-42fc-b9ab-09823eb796c4@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1xs3eNSoGCt71z9Vkq0hy8KXDApWBdQMrEgNQC0r4sA_1751290884
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_064128_761838_618E1ACB 
X-CRM114-Status: GOOD (  20.79  )
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

On 30.06.25 15:39, Lorenzo Stoakes wrote:
> On Mon, Jun 30, 2025 at 09:13:05AM +0800, Lance Yang wrote:
>> From: Lance Yang <lance.yang@linux.dev>
>>
>> As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
>> may read past the end of a PTE table when a large folio's PTE mappings
>> are not fully contained within a single page table.
>>
>> While this scenario might be rare, an issue triggerable from userspace must
>> be fixed regardless of its likelihood. This patch fixes the out-of-bounds
>> access by refactoring the logic into a new helper, folio_unmap_pte_batch().
>>
>> The new helper correctly calculates the safe batch size by capping the scan
>> at both the VMA and PMD boundaries. To simplify the code, it also supports
>> partial batching (i.e., any number of pages from 1 up to the calculated
>> safe maximum), as there is no strong reason to special-case for fully
>> mapped folios.
>>
>> [1] https://lore.kernel.org/linux-mm/a694398c-9f03-4737-81b9-7e49c857fcbe@redhat.com
>>
>> Fixes: 354dffd29575 ("mm: support batched unmap for lazyfree large folios during reclamation")
>> Cc: <stable@vger.kernel.org>
>> Acked-by: Barry Song <baohua@kernel.org>
>> Suggested-by: David Hildenbrand <david@redhat.com>
>> Suggested-by: Barry Song <baohua@kernel.org>
>> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> 
> This LGTM:
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
>> ---
>> v2 -> v3:
>>   - Tweak changelog (per Barry and David)
>>   - Pick AB from Barry - thanks!
>>   - https://lore.kernel.org/linux-mm/20250627062319.84936-1-lance.yang@linux.dev
>>
>> v1 -> v2:
>>   - Update subject and changelog (per Barry)
>>   - https://lore.kernel.org/linux-mm/20250627025214.30887-1-lance.yang@linux.dev
>>
>>   mm/rmap.c | 46 ++++++++++++++++++++++++++++------------------
>>   1 file changed, 28 insertions(+), 18 deletions(-)
>>
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index fb63d9256f09..1320b88fab74 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -1845,23 +1845,32 @@ void folio_remove_rmap_pud(struct folio *folio, struct page *page,
>>   #endif
>>   }
>>
>> -/* We support batch unmapping of PTEs for lazyfree large folios */
>> -static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>> -			struct folio *folio, pte_t *ptep)
>> +static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
>> +			struct page_vma_mapped_walk *pvmw,
>> +			enum ttu_flags flags, pte_t pte)
>>   {
>>   	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> -	int max_nr = folio_nr_pages(folio);
>> -	pte_t pte = ptep_get(ptep);
>> +	unsigned long end_addr, addr = pvmw->address;
>> +	struct vm_area_struct *vma = pvmw->vma;
>> +	unsigned int max_nr;
>> +
>> +	if (flags & TTU_HWPOISON)
>> +		return 1;
>> +	if (!folio_test_large(folio))
>> +		return 1;
>>
>> +	/* We may only batch within a single VMA and a single page table. */
>> +	end_addr = pmd_addr_end(addr, vma->vm_end);
>> +	max_nr = (end_addr - addr) >> PAGE_SHIFT;
>> +
>> +	/* We only support lazyfree batching for now ... */
>>   	if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
>> -		return false;
>> +		return 1;
>>   	if (pte_unused(pte))
>> -		return false;
>> -	if (pte_pfn(pte) != folio_pfn(folio))
>> -		return false;
>> +		return 1;
>>
>> -	return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags, NULL,
>> -			       NULL, NULL) == max_nr;
>> +	return folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, fpb_flags,
>> +			       NULL, NULL, NULL);
> 
> I guess this will conflict with David's changes, but maybe in this simpler case
> and given this was existing code a bit less? Anyway let's see.

It's a fix, so this is fine to go in first. (I already rebased on top of 
mm/mm-new where this is in)

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
