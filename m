Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991CBC47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 10:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ErBAGLFS7WJkowJLIYjNXsJ5gDRT/S+TG2HI2khsaMk=; b=RZA+kGvEkJuJDS
	QaKOFrG5cjRBFCqzJmeCSfY1A2mXY87wZJfPWXL8SPnRd7KAxd4F0TXZp2V1t96Qc/jMwmJbMqY52
	Hti+4D4X23uok+/0xNZshdthcihJYVg6YiinolDs32RgwUCvJM8mxXx0BbulKmbpb09p5vxWNg79e
	U8OTxB7aJ81FEC6uywHtQiGTsLIW8F4+WlYP/yR1jQRmURG64ChcqLJqHQ0NAivkI+O8wpZTrX5MV
	0FJJ5S6Mr85JKaSDsuU0ZlWMIGEiU/E8w+/HWE1CjuU2DUX+I0c5tnMdGKZjDt7/d3dsFPgqfHBL+
	tEeM0gJY7nnifpovpOtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSEKh-00G0kT-0C;
	Tue, 23 Jan 2024 10:48:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSEKc-00G0hu-21
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 10:48:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706006917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iER4mCfZQHjX5vldd+UfqoqhW1+fd9a/CugQqPAvg1o=;
	b=S2JVeR97Fe8QWuA30jcxCcFcxPeIGBiG9oxLIJvo02NyDqHRrHlR9sw5k2IKB4x3fTEtGr
	dUdZCGDElHSxJGXQkn2l7aV+vuQ8oe4ik9iNwqc8cGFoUB64aRH47XSPbKHTRDM0UNS+IF
	79ona7dlgl8deqDa6WjDfNF/Y2t89l0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-NBjT3tIrP6CzuMoziXjOPA-1; Tue, 23 Jan 2024 05:48:35 -0500
X-MC-Unique: NBjT3tIrP6CzuMoziXjOPA-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3392814b911so1176018f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jan 2024 02:48:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706006914; x=1706611714;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iER4mCfZQHjX5vldd+UfqoqhW1+fd9a/CugQqPAvg1o=;
        b=u7t5l5fNW14ku1q+99uRWNV4BtzFrTYh8In9GnjDamemxyBsZHiT4H8uT/vy2nmFze
         lQL3A88VUJFo+KMfg4y4wfQXFxLnMCUTDPhSDI4BQg1P+ipxRs8DmhaodhXECOEjd2/Y
         c5DpTKYn/NlhgKRHwDGC24+upLDJmhlcBdFWasAYr3C+KzErXrObrLLFGvNH2phK+fAC
         zUwuIf7lK5M7Ij7u8FEIq15ehp88Pk+TA8Y0fpIvEX/J6Xd/Gtgk6OuSejOwXi6RP+Lc
         L/IeZFu/86Fj4Efa6R0aK2VvIZ/c4tzF+QEvvLdAMfIpDsO3p7Ez82XiH99GaQTmv78X
         pMkQ==
X-Gm-Message-State: AOJu0YxTo3/Rwk7Ij8tpELkgVjNwkHMLJx2Qmo2BsjFBC/2uqFCKs+Tb
	IJlhnxK0UI0eVSHdKQAaigPmm7qQPDOEeOWTPsrcn0ZsrYq5FLYVCSkxbwuqJ040cFXTRfKk62Y
	3g2bvD5LOD/NU3g4oESawODwIHYxEz+GDZjjL3PPFkHCLFlQcIvbXpqgCWHdndZQxvA==
X-Received: by 2002:a05:600c:4515:b0:40e:c047:9336 with SMTP id t21-20020a05600c451500b0040ec0479336mr183547wmo.100.1706006914183;
        Tue, 23 Jan 2024 02:48:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqy0cgCgqnuoQ6JwnAf+pFGk65GDbL13eMCZ3Z9NsmyiQh16dTSTVkrdqi2eQNG6FMLOCVAw==
X-Received: by 2002:a05:600c:4515:b0:40e:c047:9336 with SMTP id t21-20020a05600c451500b0040ec0479336mr183533wmo.100.1706006913777;
        Tue, 23 Jan 2024 02:48:33 -0800 (PST)
Received: from ?IPV6:2003:cb:c741:de00:bf0f:cd46:dc1c:2de9? (p200300cbc741de00bf0fcd46dc1c2de9.dip0.t-ipconnect.de. [2003:cb:c741:de00:bf0f:cd46:dc1c:2de9])
        by smtp.gmail.com with ESMTPSA id l6-20020a7bc346000000b0040d81ca11casm40988147wmj.28.2024.01.23.02.48.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 02:48:33 -0800 (PST)
Message-ID: <46080ac1-7789-499b-b7f3-0231d7bd6de7@redhat.com>
Date: Tue, 23 Jan 2024 11:48:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/11] arm/pgtable: define PFN_PTE_SHIFT on arm and
 arm64
To: Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, "David S. Miller"
 <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-2-david@redhat.com>
 <fdaeb9a5-d890-499a-92c8-d171df43ad01@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <fdaeb9a5-d890-499a-92c8-d171df43ad01@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_024838_744198_340011A2 
X-CRM114-Status: GOOD (  25.37  )
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

On 23.01.24 11:34, Ryan Roberts wrote:
> On 22/01/2024 19:41, David Hildenbrand wrote:
>> We want to make use of pte_next_pfn() outside of set_ptes(). Let's
>> simpliy define PFN_PTE_SHIFT, required by pte_next_pfn().
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   arch/arm/include/asm/pgtable.h   | 2 ++
>>   arch/arm64/include/asm/pgtable.h | 2 ++
>>   2 files changed, 4 insertions(+)
>>
>> diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
>> index d657b84b6bf70..be91e376df79e 100644
>> --- a/arch/arm/include/asm/pgtable.h
>> +++ b/arch/arm/include/asm/pgtable.h
>> @@ -209,6 +209,8 @@ static inline void __sync_icache_dcache(pte_t pteval)
>>   extern void __sync_icache_dcache(pte_t pteval);
>>   #endif
>>   
>> +#define PFN_PTE_SHIFT		PAGE_SHIFT
>> +
>>   void set_ptes(struct mm_struct *mm, unsigned long addr,
>>   		      pte_t *ptep, pte_t pteval, unsigned int nr);
>>   #define set_ptes set_ptes
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index 79ce70fbb751c..d4b3bd96e3304 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -341,6 +341,8 @@ static inline void __sync_cache_and_tags(pte_t pte, unsigned int nr_pages)
>>   		mte_sync_tags(pte, nr_pages);
>>   }
>>   
>> +#define PFN_PTE_SHIFT		PAGE_SHIFT
> 
> I think this is buggy. And so is the arm64 implementation of set_ptes(). It
> works fine for 48-bit output address, but for 52-bit OAs, the high bits are not
> kept contigously, so if you happen to be setting a mapping for which the
> physical memory block straddles bit 48, this won't work.

Right, as soon as the PTE bits are not contiguous, this stops working, 
just like set_ptes() would, which I used as orientation.

> 
> Today, only the 64K base page config can support 52 bits, and for this,
> OA[51:48] are stored in PTE[15:12]. But 52 bits for 4K and 16K base pages is
> coming (hopefully v6.9) and in this case OA[51:50] are stored in PTE[9:8].
> Fortunately we already have helpers in arm64 to abstract this.
> 
> So I think arm64 will want to define its own pte_next_pfn():
> 
> #define pte_next_pfn pte_next_pfn
> static inline pte_t pte_next_pfn(pte_t pte)
> {
> 	return pfn_pte(pte_pfn(pte) + 1, pte_pgprot(pte));
> }
> 
> I'll do a separate patch to fix the already broken arm64 set_ptes() implementation.

Make sense.

> 
> I'm not sure if this type of problem might also apply to other arches?

I saw similar handling in the PPC implementation of set_ptes, but was 
not able to convince me that it is actually required there.

pte_pfn on ppc does:

static inline unsigned long pte_pfn(pte_t pte)
{
	return (pte_val(pte) & PTE_RPN_MASK) >> PTE_RPN_SHIFT;
}

But that means that the PFNs *are* contiguous. If high bits are used for 
something else, then we might produce a garbage PTE on overflow, but 
that shouldn't really matter I concluded for folio_pte_batch() purposes, 
we'd not detect "belongs to this folio batch" either way.

Maybe it's likely cleaner to also have a custom pte_next_pfn() on ppc, I 
just hope that we don't lose any other arbitrary PTE bits by doing the 
pte_pgprot().


I guess pte_pfn() implementations should tell us if anything special 
needs to happen.

-- 
Cheers,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
