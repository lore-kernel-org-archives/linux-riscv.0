Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F101D10F58
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 15:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A5PXNgS3Z4eXjqLb9Qr9HckUJNeQU6G0sz2/dkYCU3o=; b=j9O1cdzyPwCEU0
	E6Wm6hkxh4yBynpUKVuE9TbmNN89G7+uD7Wpcjqr/Vyemcx2zS0x6pEfGOWg4J5zRTq4IPTNKY+GY
	K48q6QlsObu8DS0HfP9fpiucPC1hqdgzApW3QhGRmhaG7PbnY+ZIgKRyviBLVR1AYtTtk0N8qFIER
	e7ekHR2MP9CDVMj60+zn7wbB7T2o5QJ/bgMGHX2c9cDz4mCjsoRtDjKgLMyK8W/4Gr/IFsi4DXhvg
	2gCmNxRyXTU8QU3la3Ve9LKV0EnsPBYFoqrekfvXIsvvY56NoOOwoVk8bMqGeQSqvmovcl43ZIcjX
	5aQeBLcr6R6PmdL3NjQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHCe-0000000FAKC-0i6W;
	Wed, 26 Nov 2025 15:13:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHCc-0000000FAJX-4198
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 15:13:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D3CE60206;
	Wed, 26 Nov 2025 15:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7514BC4CEF8;
	Wed, 26 Nov 2025 15:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764169986;
	bh=0u1o2KJFgGMlu+9bXPvNMO4fZcJG4zl5WGYFbdjOE0Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XvQkRN19LTR69pvq2REcXFW4oZY2i6UXRWgCyQ+XMFsOHihwUBtRRoLFAqpzZh/7A
	 QSmA9b7gJXSongNcKgQRd0Tl81WGpeWnFPHPCE5XLU20g83tc9/LiFpPnla6RobhWK
	 7WJlJ68CBeBqZnbfDcilHelOkUJ0XgBa6yhQJsUpyY/AdVSi5b3JtEZV6jjvvo9rro
	 X6orAvcL9QSKPyIUJnbAqHNObN42cyYmzMr89w7Nu4SWB423xBfhJFOM6bKgasGFaD
	 N7TmXBm8NiGtSi1DuX0uaQ4PdUWXN3llZdwJ/rL/iuND4nZeCj68zfriwWrVUeIyRT
	 Yu5/d68RRECEg==
Message-ID: <a1d25bde-3ab6-46b5-a957-db80da7e737b@kernel.org>
Date: Wed, 26 Nov 2025 16:12:59 +0100
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
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <37973e21-e8f4-4603-b93d-4e0b1b2499fa@lucifer.local>
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

On 11/26/25 16:08, Lorenzo Stoakes wrote:
> On Wed, Nov 26, 2025 at 03:56:13PM +0100, David Hildenbrand (Red Hat) wrote:
>> On 11/26/25 15:52, Lorenzo Stoakes wrote:
>>>
>>> Would the pmdp_get() never get invoked then? Or otherwise wouldn't that end up
>>> requiring a READ_ONCE() further up the stack?
>>
>> See my other reply, I think the pmdp_get() is required because all pud_*
>> functions are just simple stubs.
> 
> OK, thought you were saying we should push further down the stack? Or up
> depending on how you view these things :P as in READ_ONCE at leaf?

I think at leaf because I think the previous ones should essentially be 
only used by stubs.

But I haven't fully digested how this is all working. Or supposed to work.

I'm trying to chew through the arch/arm/include/asm/pgtable-2level.h 
example to see if I can make sense of it,

> 
> Anyway. I am now designating you the expert at this ;)

Oh no. :)

> 
>>
>>>
>>>>
>>>> IOW, push the READ_ONCE() down to the lowest level so the previous ones
>>>> (that will get essentially ignore?) will get folded into the last
>>>> READ_ONCE()?
>>>>
>>>> But my head still hurts and I am focusing on something else concurrently :)
>>>
>>> Even if we could make this work, I don't love that there's some implicit
>>> assumption there that could easily break later on.
>>>
>>> I'd rather we kept it as stupid/obvious as possible...
>>
>> Looking at include/asm-generic/pgtable-nopmd.h I am not sure we are talking
>> about implicit assumptions here. It's kind-of the design that the pud_t
>> values are dummies, so why shoul the pudp_get() give you any guarantees.
>>
>> At least that's my current understanding, which might be very flawed :)
> 
> I mean I'm waving my hands around like I'm working on an aircraft carrier here
> so if you're _sure_ it's _absolutely_ safe then fine :)

Well, not yet ... :)

-- 
Cheers

David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
