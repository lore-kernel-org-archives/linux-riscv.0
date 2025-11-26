Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F57D10F58
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 14:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uo+7vBRIxuBgnw06HrgIIimiETREvy48lKPeyXYV0Oc=; b=YCgWKEZxJ3gVKm
	v8wyvsd1xDxbNqaAbbB8y8NSSenHHM7jx1HvmOUtWpXv61YL+15tX14Evv8rET7M2ve3+0Y7mVPWs
	ASvsLau+Yf147sQZsHQ1iM+gWFmdHVaYJM/+MR7rEMNbclRInUL5s3PVAXjt5aMogIdxhtdmZv/Q6
	W/on0VlU2W2uNz6mpzp+mqaw7cQUW0c/3oSGyFj56hk5VA9PSWDCAodwMMKEmzEelsQCndNObF2jJ
	IVUkXazgEcPYHD9yHdoegiEusSfADPOpFyrnnclBCQtvJilQ7uaE4JsNMIONBLg9VIIe5FVP5J7Zc
	5mpZYsLHprlP2/q/2VdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGwR-0000000F9Gp-2LWx;
	Wed, 26 Nov 2025 14:56:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGwP-0000000F9GM-3xgL
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 14:56:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B03F60206;
	Wed, 26 Nov 2025 14:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E891EC4CEF7;
	Wed, 26 Nov 2025 14:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764168981;
	bh=MeTvCvxV+3MFnGJottwhuC9OB5zcau7n3a2ykik7c8M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=snGe7lbCYacch1xuECwqTvMnBkOI7LejV9Q29Sr1sI4VuESWqOzTzi4cajGQeY8Tn
	 uAyTV8LdLPGTY5p2yq02xOzTfLrefv/J5waZujSxVPQ/KVrQjn1n3FfNfIHfufumd7
	 bmGIiLCfi4slSlSZVHTBsmiSSdnh4WQYAcW0/JBWL16qr9moAC2hbY1bU22M+7532D
	 zmn+v3YTcEaI2Nj36GoaMXVa2TBgRfXVrk2zPi1cT7xiYG6+kvKRBoGE2hgiNFIENM
	 z0Lif+2gOU8Y96CDCaB2W46+eCIAMxYofGQNvNzLdPxvSHDx886s2UKPY/3Zofmuwl
	 PgpoGSq7E4lKw==
Message-ID: <1ca9f99f-6266-47ca-8c94-1a9b9aaa717f@kernel.org>
Date: Wed, 26 Nov 2025 15:56:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/22] mm: Always use page table accessor functions
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Wei Yang
 <richard.weiyang@gmail.com>, Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-mm@kvack.org, devicetree@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Emil Renner Berthing <kernel@esmil.dk>,
 Rob Herring <robh+dt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 Anshuman Khandual <anshuman.khandual@arm.com>
References: <20251113014656.2605447-7-samuel.holland@sifive.com>
 <02e3b3bd-ae6a-4db4-b4a1-8cbc1bc0a1c8@arm.com>
 <bc88d132-452a-42a1-9ee5-5407334d8aac@kernel.org>
 <df7d10ba-bb42-4ea1-8c5b-5db88a18eccb@kernel.org>
 <6bdf2b89-7768-4b90-b5e7-ff174196ea7b@lucifer.local>
 <71123d7a-641b-41df-b959-88e6c2a3a441@kernel.org>
 <c0818f5b-b8a1-4730-aa1d-df0f547a3d47@arm.com>
 <20251126134726.yrya5xxayfcde3kl@master>
 <ee5f5da3-8c6b-4381-aee8-b0fab56cbf83@arm.com>
 <6b966403-91e0-4f06-86a9-a4f7780b9557@kernel.org>
 <ab39d448-aa1c-4c93-8e2b-5d97a9c76af5@lucifer.local>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <ab39d448-aa1c-4c93-8e2b-5d97a9c76af5@lucifer.local>
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

On 11/26/25 15:52, Lorenzo Stoakes wrote:
> On Wed, Nov 26, 2025 at 03:46:40PM +0100, David Hildenbrand (Red Hat) wrote:
>> On 11/26/25 15:22, Ryan Roberts wrote:
>>> On 26/11/2025 13:47, Wei Yang wrote:
>>>> On Wed, Nov 26, 2025 at 01:03:42PM +0000, Ryan Roberts wrote:
>>>>> On 26/11/2025 12:35, David Hildenbrand (Red Hat) wrote:
>>>> [...]
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>> I've just come across this patch and wanted to mention that we could also
>>>>>>>>>> benefit from this improved absraction for some features we are looking at for
>>>>>>>>>> arm64. As you mention, Anshuman had a go but hit some roadblocks.
>>>>>>>>>>
>>>>>>>>>> The main issue is that the compiler was unable to optimize away the
>>>>>>>>>> READ_ONCE()s
>>>>>>>>>> for the case where certain levels of the pgtable are folded. But it can
>>>>>>>>>> optimize
>>>>>>>>>> the plain C dereferences. There were complaints the the generated code for arm
>>>>>>>>>> (32) and powerpc was significantly impacted due to having many more
>>>>>>>>>> (redundant)
>>>>>>>>>> loads.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> We do have mm_pmd_folded()/p4d_folded() etc, could that help to sort
>>>>>>>>> this out internally?
>>>>>>>>>
>>>>>>>>
>>>>>>>> Just stumbled over the reply from Christope:
>>>>>>>>
>>>>>>>> https://lkml.kernel.org/r/0019d675-ce3d-4a5c-89ed-f126c45145c9@kernel.org
>>>>>>>>
>>>>>>>> And wonder if we could handle that somehow directly in the pgdp_get() etc.
>>>>>
>>>>> I certainly don't like the suggestion of doing the is_folded() test outside the
>>>>> helper, but if we can push that logic down into pXdp_get() that would be pretty
>>>>> neat. Anshuman and I did briefly play with the idea of doing a C dereference if
>>>>> the level is folded and a READ_ONCE() otherwise, all inside each pXdp_get()
>>>>> helper. Although we never proved it to be correct. I struggle with the model for
>>>>> folding. Do you want to optimize out all-but-the-highest level's access or
>>>>> all-but-the-lowest level's access? Makes my head hurt...
>>>>>
>>>>>
>>>>
>>>> You mean sth like:
>>>>
>>>> static inline pmd_t pmdp_get(pmd_t *pmdp)
>>>> {
>>>> #ifdef __PAGETABLE_PMD_FOLDED
>>>> 	return *pmdp;
>>>> #else
>>>> 	return READ_ONCE(*pmdp);
>>>> #endif
>>>> }
>>>
>>> Yes. But I'm not convinced it's correct.
>>
>> Yeah, I'm also still trying to understand how it could work.
>>
>>>
>>> I *think* (but please correct me if I'm wrong) if the PMD is folded, the PUD and
>>> P4D must also be folded, and you effectively have a 2 level pgtable consisting
>>> of the PGD table and the PTE table. p4dp_get(), pudp_get() and pmdp_get() are
>>> all effectively duplicating the load of the pgd entry? So assuming pgdp_get()
>>> was already called and used READ_ONCE(), you might hope the compiler will just
>>> drop the other loads and just use the value returned by READ_ONCE(). But I doubt
>>> there is any guarantee of that and you might be in a situation where pgdp_get()
>>> never even got called (perhaps you already have the pmd pointer).
>> With __PAGETABLE_PMD_FOLDED we treat the PUD to be fake-present, like
>>
>> static inline int pud_present(pud_t pud)	{ return 1; }
>>
>> And obtaining the pmd_t* is essentially  cast of the pud_t*
>>
>> static inline pmd_t * pmd_offset(pud_t * pud, unsigned long address)
>> {
>> 	return (pmd_t *)pud;
>> }
>>
>> So in that case we might want to have the READ_ONCE() remove from the
>> pudp_get(), not the pmdp_get()?
> 
> Would the pmdp_get() never get invoked then? Or otherwise wouldn't that end up
> requiring a READ_ONCE() further up the stack?

See my other reply, I think the pmdp_get() is required because all pud_* 
functions are just simple stubs.

> 
>>
>> IOW, push the READ_ONCE() down to the lowest level so the previous ones
>> (that will get essentially ignore?) will get folded into the last
>> READ_ONCE()?
>>
>> But my head still hurts and I am focusing on something else concurrently :)
> 
> Even if we could make this work, I don't love that there's some implicit
> assumption there that could easily break later on.
> 
> I'd rather we kept it as stupid/obvious as possible...

Looking at include/asm-generic/pgtable-nopmd.h I am not sure we are 
talking about implicit assumptions here. It's kind-of the design that 
the pud_t values are dummies, so why shoul the pudp_get() give you any 
guarantees.

At least that's my current understanding, which might be very flawed :)

-- 
Cheers

David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
