Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D0EC6FD1D
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 11:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x/NItxjgqi3hWGaG7gd7i8zBdvl8DwGaf/dE40S1v/s=; b=abWjf8IIG7N0jS
	i5QsCCjIzLJrN6+g3BVhjrKiMV5u9inN+OKiOTj/dzoYVVcl8e5ZeQOZZCJ8or01GY588JolBW0kE
	XfHL0YxKJrSfw7eFT17x5kfcr0ctU+Q286A4sGaPR8akFDuXEFrKOxIWSPuJLzZtUaMlXiCrIvGek
	s12WPIwkeT04sBd1GplO54IdGG26SAwSJzrM2uIlrQVj+Ryu1yms+rT7ecYoTEQcLRk4TIvmSSCuC
	C4/oHQ1VbKijtIXTW4sCEM/q+8rG5TNfzbsrX1LYmDk9LFBQbN5p5byv9/qHu1QlQFGDpcDp+oB1R
	kpQJXgW75DNc4c1x0dPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfJUy-001n4t-1u;
	Thu, 23 Mar 2023 11:52:52 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfJUu-001n0b-2b;
	Thu, 23 Mar 2023 11:52:50 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id BCAA7C0006;
	Thu, 23 Mar 2023 11:52:36 +0000 (UTC)
Message-ID: <67ba29ff-b03d-2d24-a844-7ae25ddca447@ghiti.fr>
Date: Thu, 23 Mar 2023 12:52:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 2/4] mm: Introduce memblock_isolate_memory
Content-Language: en-US
To: Mike Rapoport <rppt@kernel.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Anup Patel <anup@brainfault.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mm@kvack.org
References: <20230316131711.1284451-1-alexghiti@rivosinc.com>
 <20230316131711.1284451-3-alexghiti@rivosinc.com>
 <ZBN4Hoo99DNd5wKx@kernel.org> <efe1ef6b-b1c2-8d5b-82b7-3cd64053643e@ghiti.fr>
 <ZBibYDR0h1UeL6L5@kernel.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <ZBibYDR0h1UeL6L5@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_045249_139106_5888A640 
X-CRM114-Status: GOOD (  19.75  )
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


On 3/20/23 18:44, Mike Rapoport wrote:
> On Mon, Mar 20, 2023 at 11:54:14AM +0100, Alexandre Ghiti wrote:
>> Hi Mike,
>>
>> On 3/16/23 21:12, Mike Rapoport wrote:
>>> Hi Alexandre,
>>>
>>> On Thu, Mar 16, 2023 at 02:17:09PM +0100, Alexandre Ghiti wrote:
>>>> This function allows to split a region in memblock.memory and will be
>>>> useful when setting up the linear mapping with STRICT_KERNEL_RWX: it
>>>> allows to isolate the kernel text/rodata and then avoid to map those
>>>> regions with a PUD/P4D/PGD.
>>> Sorry I've missed it last time. The changelog is fine in the context of
>>
>> No worries :)
>>
>>
>>> this series, but if you look at it as a part of memblock changelog it
>>> doesn't provide enough background on why memblock_isolate_memory() is
>>> useful.
>>>
>>> Can you please add more context so it would be self explanatory?
>>
>> What about: "memblock.memory contains the list of memory regions and a
>> memory region can cover memory that will be mapped with different
>> permissions. So to ease the mapping process, allow to isolate those regions
>> by introducing a new function called memblock_isolate_memory. This will be
>> used in arch specific code to isolate the kernel text/rodata regions when
>> STRICT_KERNEL_RWX is enabled so that we avoid mapping them with PUD/P4D/PGD
>> mappings."
> With this change
>
> ... STRICT_KERNEL_RWX is enabled so that they can be mapped with base pages.


Actually they will get mapped with PMD mappings :) I'll just append: "or 
PMD mapping" to your sentence above if that's ok with you.


>
> Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>


Thanks for your review,

Alex


>
>> Thanks,
>>
>> Alex
>>
>>
>>>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>>>> Reviewed-by: Anup Patel <anup@brainfault.org>
>>>> Tested-by: Anup Patel <anup@brainfault.org>
>>>> ---
>>>>    include/linux/memblock.h |  1 +
>>>>    mm/memblock.c            | 20 ++++++++++++++++++++
>>>>    2 files changed, 21 insertions(+)
>>>>
>>>> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
>>>> index 50ad19662a32..2f7ef97c0da7 100644
>>>> --- a/include/linux/memblock.h
>>>> +++ b/include/linux/memblock.h
>>>> @@ -125,6 +125,7 @@ int memblock_clear_hotplug(phys_addr_t base, phys_addr_t size);
>>>>    int memblock_mark_mirror(phys_addr_t base, phys_addr_t size);
>>>>    int memblock_mark_nomap(phys_addr_t base, phys_addr_t size);
>>>>    int memblock_clear_nomap(phys_addr_t base, phys_addr_t size);
>>>> +int memblock_isolate_memory(phys_addr_t base, phys_addr_t size);
>>>>    void memblock_free_all(void);
>>>>    void memblock_free(void *ptr, size_t size);
>>>> diff --git a/mm/memblock.c b/mm/memblock.c
>>>> index 25fd0626a9e7..e8c651a37012 100644
>>>> --- a/mm/memblock.c
>>>> +++ b/mm/memblock.c
>>>> @@ -805,6 +805,26 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
>>>>    	return 0;
>>>>    }
>>>> +/**
>>>> + * memblock_isolate_memory - isolate given range in memblock.memory
>>>> + * @base: base of range to isolate
>>>> + * @size: size of range to isolate
>>>> + *
>>>> + * Isolates the given range in memblock.memory so that it does not share any
>>>> + * region with other ranges.
>>>> + *
>>>> + * Return:
>>>> + * 0 on success, -errno on failure.
>>>> + */
>>>> +
>>>> +int __init_memblock memblock_isolate_memory(phys_addr_t base, phys_addr_t size)
>>>> +{
>>>> +	int start_rgn, end_rgn;
>>>> +
>>>> +	return memblock_isolate_range(&memblock.memory, base, size,
>>>> +				      &start_rgn, &end_rgn);
>>>> +}
>>>> +
>>>>    static int __init_memblock memblock_remove_range(struct memblock_type *type,
>>>>    					  phys_addr_t base, phys_addr_t size)
>>>>    {
>>>> -- 
>>>> 2.37.2
>>>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
