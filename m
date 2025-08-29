Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2424FCA0FF0
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Aug 2025 16:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cCSXFUFG2IXDMJVfVteq7J9HylZSv2Hpw7VgQ81O6LE=; b=BsYX69xPlDgovA
	FalNgHJCeBi9Xp+jOAeEKDCJ3vd+DRHxYZwVUlZwDHsgxL41gx97rBqaCmF1MDlvC7+2O/cN3vHh7
	SROt+sQ3LRzaoZSsdeZ59C1QWEw9usRp0pTgtoJ6LFk3Op96iO8yh+uBgA4AzozXakXidhO+6e7Vt
	8cm8CD8RftI3yqkV4yg344TXvOQ68olHKva03Qu26V7ScsjlkjMMT18UMhszsUU34cJMSt8EVeKpw
	Ir2Y/JRmj/JQBm9xmRabT+d2vWFPS5hag+JuDQM/pWQ+mb5D1CYFVUQYLUEpIwvbg06P7rzAzIQUl
	ssB+C5JPBPOS9fkZCbOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us2Au-00000006R2v-01M4;
	Fri, 29 Aug 2025 16:42:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urzMY-00000005rYz-3xnF
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Aug 2025 13:41:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7ZezTDYPV9FY1vYbYIlP1Z79qo+TmLw98Vo74TFiYNA=; b=FOoBFU96S5Q1OZ6s7iyc1W6iIA
	nl2N+QNNvhaxW4UQos6Qq11GuV02CKcm4n7mv2YW7j8X4x/CZO4JAymmOn64OOsOEVMzd4/FhFSeS
	Mn+Qa8lvb88zqKC0khbXvyOF5ekuJDwDVAKW2WalV+PnFlwp46eSca2buFNrjKCon4XJm9GSGKlPp
	asWDrZs6fETGP9RcOuMT1YpH9JcgBAgRIM2W1DhzJq6Xv4RBuvr+eTVTwGLIqHjS0XyHpLt4Ekyvm
	5g+fRCpwV2zsaPFl8QEfj+dr/SvI3PKvQ14qfUiG/ckVVyDNloOLsfglUHftuGGH9WqKUt+YBZreW
	WUMTqemg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urzMV-000000038rg-1Oki
	for linux-riscv@lists.infradead.org;
	Fri, 29 Aug 2025 13:41:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756474908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7ZezTDYPV9FY1vYbYIlP1Z79qo+TmLw98Vo74TFiYNA=;
	b=CTURm0YoMGEOnQRvZzhxo+5MRntmRN948+9rxtC7usAjXJjTEy1dM1v3JK/KZ4pzkB9epT
	82n4/GeVSLRGEsA6iV3Piw4tsIEHF0lvxpiKslyPYcNgV4537qzqNOLG9NjoQ8Yt2P3TRk
	dpmPRrCAU6hAVphPx7dZ16CeBb+QlcM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756474908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7ZezTDYPV9FY1vYbYIlP1Z79qo+TmLw98Vo74TFiYNA=;
	b=CTURm0YoMGEOnQRvZzhxo+5MRntmRN948+9rxtC7usAjXJjTEy1dM1v3JK/KZ4pzkB9epT
	82n4/GeVSLRGEsA6iV3Piw4tsIEHF0lvxpiKslyPYcNgV4537qzqNOLG9NjoQ8Yt2P3TRk
	dpmPRrCAU6hAVphPx7dZ16CeBb+QlcM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-DHP16J0-PXKACd7kjcKcDw-1; Fri, 29 Aug 2025 09:41:44 -0400
X-MC-Unique: DHP16J0-PXKACd7kjcKcDw-1
X-Mimecast-MFC-AGG-ID: DHP16J0-PXKACd7kjcKcDw_1756474904
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45b7bb85e90so12565835e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 29 Aug 2025 06:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756474904; x=1757079704;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ZezTDYPV9FY1vYbYIlP1Z79qo+TmLw98Vo74TFiYNA=;
        b=CHxxc6iriuM33zzlnNrETmfH0jacCOQG9RYCjWOpwhJa9I+PXGO2L+A7KhYUEft7uj
         fbDo1k9UjyIIEe+OpBzBsvbOSqbpOXIyA1dP45s4fYPqzb9dhI/HgnauKZQP7iZr+OYn
         kyHPkIbel6G/LDNKMbsBXJr4BwacZte22Mp2NBDVccIwzMFUgBtInDSkzbiTTjMHPyxF
         tb+OI6lrlT2ZCOFJNU3/9ZL8S2sYUg9QS+ImP3vYcDjjOXeDOpK9jCM7sw1Q7WyJJewF
         Gq+kqAsUpxtUZuKiU+SNE54dTh7bBwMZNQW0N23ZXvB8H0Dk6kaZd5CxCvbDSGqwJK7Y
         HlOg==
X-Forwarded-Encrypted: i=1; AJvYcCV+yUfN5vNh3gQKf8Ih/bZXgQD2s2rgdVmlN0uAqm+67DWRH4EGUBGvnzInSciTdlAO0Q9exRkFxm8g6A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5ALU1r9Jhf/JgCqrg9y55ZdHqYlVp6/pk++rYxpnjMRzgZ9Ex
	yIkeaLZoNQ1sHPIyAUFpUdO8RiCcjLE5WhcfWtztKN70UtQ5rvFMjTmYR//FJmA9M8+2t+a+nUj
	R4/nCnxrvDs6tSRBBOnUDlzDP1/jSQDGrZ/3BWwK2/ELxf2Mlzo/BtKig6bHi0L1+qT2DAA==
X-Gm-Gg: ASbGncub5oiq7f/GQIodCnrqGLb54bmjkWBnDalor2LFTr6tK4IOlYDNAapLSEYDaUW
	ypNPKDU+83tu9v/8JebCidW+riuTKAjQ0h/nBqV8/Y730gTixpeiLAsBOdjTxQ8fhydLIvL5GVR
	lAoCdp1tSjWaj9O1Dx6GFWpBssZzwARmrGqCMhWTMXfACzipPDhZwf8cwyqKlOda7c2umvTC6+s
	EaMMihVEsPXRe6sUY+nYV/IFW/40vcJDjd6qY831ZE+N0zauqy1pcrVDM+GMBHaj3RaD85zOvjz
	hGic5zIQevi7qsAJgblLRbPOlFZ2ECMtUgqoS1COVI3ZqzXObqfezZPXxly3gzrnVX1A8dU5hk1
	Bk1QcGRz+dEVDGIg4IRN2Nwjd4SA0Ah7D9Jfi3HqzAy2Uc88HcwT9e1RnKNfciCmm
X-Received: by 2002:a05:600c:8b0a:b0:45b:733b:1feb with SMTP id 5b1f17b1804b1-45b733b214dmr83370735e9.10.1756474903641;
        Fri, 29 Aug 2025 06:41:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWe5EWQVl5iPDqqeubvc9kL/5oN1fdgiPPYoM9Zstyja975cqp15HWRaThC/EH89lpSzwt8Q==
X-Received: by 2002:a05:600c:8b0a:b0:45b:733b:1feb with SMTP id 5b1f17b1804b1-45b733b214dmr83370155e9.10.1756474903176;
        Fri, 29 Aug 2025 06:41:43 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1d:100:4f8e:bb13:c3c7:f854? (p200300d82f1d01004f8ebb13c3c7f854.dip0.t-ipconnect.de. [2003:d8:2f1d:100:4f8e:bb13:c3c7:f854])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf3458a67esm3469559f8f.62.2025.08.29.06.41.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 06:41:42 -0700 (PDT)
Message-ID: <632fea32-28aa-4993-9eff-99fc291c64f2@redhat.com>
Date: Fri, 29 Aug 2025 15:41:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 18/36] mm/gup: drop nth_page() usage within folio when
 recording subpages
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>,
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
 <20250827220141.262669-19-david@redhat.com>
 <c0dadc4f-6415-4818-a319-e3e15ff47a24@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <c0dadc4f-6415-4818-a319-e3e15ff47a24@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kDfijjAnbd5Upe3AD90bnsqjkOZLoSow1gHpOXaHdSw_1756474904
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_144151_541709_ACE4EE40 
X-CRM114-Status: GOOD (  21.68  )
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

On 28.08.25 18:37, Lorenzo Stoakes wrote:
> On Thu, Aug 28, 2025 at 12:01:22AM +0200, David Hildenbrand wrote:
>> nth_page() is no longer required when iterating over pages within a
>> single folio, so let's just drop it when recording subpages.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> This looks correct to me, so notwithtsanding suggestion below, LGTM and:
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
>> ---
>>   mm/gup.c | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/mm/gup.c b/mm/gup.c
>> index b2a78f0291273..89ca0813791ab 100644
>> --- a/mm/gup.c
>> +++ b/mm/gup.c
>> @@ -488,12 +488,11 @@ static int record_subpages(struct page *page, unsigned long sz,
>>   			   unsigned long addr, unsigned long end,
>>   			   struct page **pages)
>>   {
>> -	struct page *start_page;
>>   	int nr;
>>
>> -	start_page = nth_page(page, (addr & (sz - 1)) >> PAGE_SHIFT);
>> +	page += (addr & (sz - 1)) >> PAGE_SHIFT;
>>   	for (nr = 0; addr != end; nr++, addr += PAGE_SIZE)
>> -		pages[nr] = nth_page(start_page, nr);
>> +		pages[nr] = page++;
> 
> 
> This is really nice, but I wonder if (while we're here) we can't be even
> more clear as to what's going on here, e.g.:
> 
> static int record_subpages(struct page *page, unsigned long sz,
> 			   unsigned long addr, unsigned long end,
> 			   struct page **pages)
> {
> 	size_t offset_in_folio = (addr & (sz - 1)) >> PAGE_SHIFT;
> 	struct page *subpage = page + offset_in_folio;
> 
> 	for (; addr != end; addr += PAGE_SIZE)
> 		*pages++ = subpage++;
> 
> 	return nr;
> }
> 
> Or some variant of that with the masking stuff self-documented.

What about the following cleanup on top:


diff --git a/mm/gup.c b/mm/gup.c
index 89ca0813791ab..5a72a135ec70b 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -484,19 +484,6 @@ static inline void mm_set_has_pinned_flag(struct mm_struct *mm)
  #ifdef CONFIG_MMU
  
  #ifdef CONFIG_HAVE_GUP_FAST
-static int record_subpages(struct page *page, unsigned long sz,
-                          unsigned long addr, unsigned long end,
-                          struct page **pages)
-{
-       int nr;
-
-       page += (addr & (sz - 1)) >> PAGE_SHIFT;
-       for (nr = 0; addr != end; nr++, addr += PAGE_SIZE)
-               pages[nr] = page++;
-
-       return nr;
-}
-
  /**
   * try_grab_folio_fast() - Attempt to get or pin a folio in fast path.
   * @page:  pointer to page to be grabbed
@@ -2963,8 +2950,8 @@ static int gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp, unsigned long addr,
         if (pmd_special(orig))
                 return 0;
  
-       page = pmd_page(orig);
-       refs = record_subpages(page, PMD_SIZE, addr, end, pages + *nr);
+       refs = (end - addr) >> PAGE_SHIFT;
+       page = pmd_page(orig) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
  
         folio = try_grab_folio_fast(page, refs, flags);
         if (!folio)
@@ -2985,6 +2972,8 @@ static int gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp, unsigned long addr,
         }
  
         *nr += refs;
+       for (; refs; refs--)
+               *(pages++) = page++;
         folio_set_referenced(folio);
         return 1;
  }
@@ -3003,8 +2992,8 @@ static int gup_fast_pud_leaf(pud_t orig, pud_t *pudp, unsigned long addr,
         if (pud_special(orig))
                 return 0;
  
-       page = pud_page(orig);
-       refs = record_subpages(page, PUD_SIZE, addr, end, pages + *nr);
+       refs = (end - addr) >> PAGE_SHIFT;
+       page = pud_page(orig) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
  
         folio = try_grab_folio_fast(page, refs, flags);
         if (!folio)
@@ -3026,6 +3015,8 @@ static int gup_fast_pud_leaf(pud_t orig, pud_t *pudp, unsigned long addr,
         }
  
         *nr += refs;
+       for (; refs; refs--)
+               *(pages++) = page++;
         folio_set_referenced(folio);
         return 1;
  }


The nice thing is that we only record pages in the array if they actually passed our tests.


-- 
Cheers

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
