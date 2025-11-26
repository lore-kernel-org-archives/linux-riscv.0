Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8ACD10F58
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 16:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dqx3u01mED0F+Yub32DRXkCHKvfBmwxDp8TXww/mi1A=; b=G5+sP7JQAAL6B4
	jZnaHnv3YKhjJHtyBgtFLWUrqgtVLIFIE0aTDQmbLuBnZmWcVdsHKvjx5VTExfLhO5K+lXLN34ofU
	UpbfO1ESK+aScT86Ey4CkTSvKue26dLPCfb8qe38104ejZ6wpX30e+R5Pmofj81qiYoumpNl5qwBD
	VNALS+II6gRM4ERdUTlBiUHr1fwdZBlEPyieJOVBygKCdlAb2EF/r9oHopcwUHQ3gq1gvHqfQdtVB
	WT0HpT1cOjfogwyRedi3Zv0CFaYOYAB2ZIHb+qUa9HUdGk3n4zLxonSXsmgCZFw8DFJLrDix3bA2Q
	xUANlSiXgNXeRmL0fYJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOI3H-0000000FEye-35vV;
	Wed, 26 Nov 2025 16:07:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOI3F-0000000FEyH-0dG4
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 16:07:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B9C41692;
	Wed, 26 Nov 2025 08:07:20 -0800 (PST)
Received: from [10.1.33.153] (unknown [10.1.33.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 051ED3F73B;
	Wed, 26 Nov 2025 08:07:24 -0800 (PST)
Message-ID: <4505a93b-2bac-4ce1-8971-4c31f1ce1362@arm.com>
Date: Wed, 26 Nov 2025 16:07:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/22] mm: Always use page table accessor functions
Content-Language: en-GB
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Wei Yang <richard.weiyang@gmail.com>,
 Samuel Holland <samuel.holland@sifive.com>,
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
References: <bc88d132-452a-42a1-9ee5-5407334d8aac@kernel.org>
 <df7d10ba-bb42-4ea1-8c5b-5db88a18eccb@kernel.org>
 <6bdf2b89-7768-4b90-b5e7-ff174196ea7b@lucifer.local>
 <71123d7a-641b-41df-b959-88e6c2a3a441@kernel.org>
 <c0818f5b-b8a1-4730-aa1d-df0f547a3d47@arm.com>
 <20251126134726.yrya5xxayfcde3kl@master>
 <ee5f5da3-8c6b-4381-aee8-b0fab56cbf83@arm.com>
 <6b966403-91e0-4f06-86a9-a4f7780b9557@kernel.org>
 <ab39d448-aa1c-4c93-8e2b-5d97a9c76af5@lucifer.local>
 <1ca9f99f-6266-47ca-8c94-1a9b9aaa717f@kernel.org>
 <37973e21-e8f4-4603-b93d-4e0b1b2499fa@lucifer.local>
 <a1d25bde-3ab6-46b5-a957-db80da7e737b@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <a1d25bde-3ab6-46b5-a957-db80da7e737b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_080729_278678_0FDD1BDD 
X-CRM114-Status: GOOD (  22.81  )
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

On 26/11/2025 15:12, David Hildenbrand (Red Hat) wrote:
> On 11/26/25 16:08, Lorenzo Stoakes wrote:
>> On Wed, Nov 26, 2025 at 03:56:13PM +0100, David Hildenbrand (Red Hat) wrote:
>>> On 11/26/25 15:52, Lorenzo Stoakes wrote:
>>>>
>>>> Would the pmdp_get() never get invoked then? Or otherwise wouldn't that end up
>>>> requiring a READ_ONCE() further up the stack?
>>>
>>> See my other reply, I think the pmdp_get() is required because all pud_*
>>> functions are just simple stubs.
>>
>> OK, thought you were saying we should push further down the stack? Or up
>> depending on how you view these things :P as in READ_ONCE at leaf?
> 
> I think at leaf because I think the previous ones should essentially be only
> used by stubs.
> 
> But I haven't fully digested how this is all working. Or supposed to work.
> 
> I'm trying to chew through the arch/arm/include/asm/pgtable-2level.h example to
> see if I can make sense of it,

I wonder if we can think about this slightly differently;

READ_ONCE() has two important properties:

 - It guarrantees that a load will be issued, *even if output is unused*
 - It guarrantees that the read will be single-copy-atomic (no tearing)

I think for the existing places where READ_ONCE() is used for pagetable reads we
only care about:

 - It guarrantees that a load will be issued, *if output is used*
 - It guarrantees that the read will be single-copy-atomic (no tearing)

I think if we can weaken to the "if output is used" property, then the compiler
will optimize out all the unneccessary reads.

AIUI, a C dereference provides neither of the guarrantees so that's no good.

What about non-volatile asm? I'm told (thought need to verify) that for
non-volatile asm, the compiler will emit it if the output is used and remove it
otherwise. So if the asm contains the required single-copy-atomic, perhaps we
are in business?

So we would need a new READ_SCA() macro that could default to READ_ONCE() (which
is stronger) and arches could opt in to providing a weaker asm version. Then the
default pXdp_get() could be READ_SCA(). And this should work for all cases.

I think.

> 
>>
>> Anyway. I am now designating you the expert at this ;)
> 
> Oh no. :)
> 
>>
>>>
>>>>
>>>>>
>>>>> IOW, push the READ_ONCE() down to the lowest level so the previous ones
>>>>> (that will get essentially ignore?) will get folded into the last
>>>>> READ_ONCE()?
>>>>>
>>>>> But my head still hurts and I am focusing on something else concurrently :)
>>>>
>>>> Even if we could make this work, I don't love that there's some implicit
>>>> assumption there that could easily break later on.
>>>>
>>>> I'd rather we kept it as stupid/obvious as possible...
>>>
>>> Looking at include/asm-generic/pgtable-nopmd.h I am not sure we are talking
>>> about implicit assumptions here. It's kind-of the design that the pud_t
>>> values are dummies, so why shoul the pudp_get() give you any guarantees.
>>>
>>> At least that's my current understanding, which might be very flawed :)
>>
>> I mean I'm waving my hands around like I'm working on an aircraft carrier here
>> so if you're _sure_ it's _absolutely_ safe then fine :)
> 
> Well, not yet ... :)
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
