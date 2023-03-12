Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA84C6FA99
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Mar 2023 16:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sn/rLlFFOC3Md5V9VCmMin22EsSYC9qxql6I36x5d5w=; b=SDk33DOTIT+iWE
	9FoMUeCfCEPzYOyrBSkoY0VHn3B6bcSSkXTI3mOdOZ696INeB7sSSxRBZmGXGaYnbfnvoRPCyXPMU
	gpeN1vAgHH6d9xd+tJaIgXSLL4MQUPZgNY4utcG7P0rm0NnLB39Ho96Q1sOmNXTVLUvc2ooJolXen
	SQRNVs6AZD3FBi83S6tYXb3Z2DSMWzUyl5uLwjG5DPnuycnIpQv46XV3mleLBEZ1IBAYW2Qi4N2AJ
	4GL3yovKg91FpcQSKaiTvc4W68op/rDbN18esqLsll9SEb1FdC6r6FjCwdrSXQ67zIcfvcsaMbFJD
	lGklQQ/DtIcdch9uX8hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbOLL-002pO4-JK; Sun, 12 Mar 2023 16:14:43 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbOLA-002pLj-Rs; Sun, 12 Mar 2023 16:14:34 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id EC8CA1C0002;
	Sun, 12 Mar 2023 16:14:20 +0000 (UTC)
Message-ID: <8b338d50-d790-a2e9-9ba9-fde444309bfc@ghiti.fr>
Date: Sun, 12 Mar 2023 17:14:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v7 2/4] mm: Introduce memblock_isolate_memory
Content-Language: en-US
To: Mike Rapoport <rppt@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Anup Patel <anup@brainfault.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mm@kvack.org
References: <20230310094539.764357-1-alexghiti@rivosinc.com>
 <20230310094539.764357-3-alexghiti@rivosinc.com>
 <ZA2c4X+acRLHKV38@kernel.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <ZA2c4X+acRLHKV38@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_091433_222497_10D1257C 
X-CRM114-Status: GOOD (  23.08  )
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


On 3/12/23 10:35, Mike Rapoport wrote:
> Hi Alexandre,
>
> On Fri, Mar 10, 2023 at 10:45:37AM +0100, Alexandre Ghiti wrote:
>> This function allows to split a region in memblock.memory and will be
>> useful when setting up the linear mapping with STRICT_KERNEL_RWX: it
>> allows to isolate the kernel text/rodata and then avoid to map those
>> regions with a PUD/P4D/PGD.
>>
>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> ---
>>   include/linux/memblock.h |  1 +
>>   mm/memblock.c            | 22 +++++++++++++++++++++-
>>   2 files changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
>> index 50ad19662a32..2f7ef97c0da7 100644
>> --- a/include/linux/memblock.h
>> +++ b/include/linux/memblock.h
>> @@ -125,6 +125,7 @@ int memblock_clear_hotplug(phys_addr_t base, phys_addr_t size);
>>   int memblock_mark_mirror(phys_addr_t base, phys_addr_t size);
>>   int memblock_mark_nomap(phys_addr_t base, phys_addr_t size);
>>   int memblock_clear_nomap(phys_addr_t base, phys_addr_t size);
>> +int memblock_isolate_memory(phys_addr_t base, phys_addr_t size);
>>   
>>   void memblock_free_all(void);
>>   void memblock_free(void *ptr, size_t size);
>> diff --git a/mm/memblock.c b/mm/memblock.c
>> index 25fd0626a9e7..d8cf1c9eccf0 100644
>> --- a/mm/memblock.c
>> +++ b/mm/memblock.c
>> @@ -753,7 +753,8 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
>>   	int idx;
>>   	struct memblock_region *rgn;
>>   
>> -	*start_rgn = *end_rgn = 0;
>> +	if (start_rgn && end_rgn)
>> +		*start_rgn = *end_rgn = 0;
> Generally, it's possible that either start_rgn or end_rgn will be a valid
> pointer and this should be handled here and below.
>
> My preference, though would be to leave memblock_isolate_range() as is and
> have unused start_rgn and end_rgn in memblock_isolate_memory().


Sure, I'll do that then.


>
>>   
>>   	if (!size)
>>   		return 0;
>> @@ -795,6 +796,9 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
>>   					       memblock_get_region_node(rgn),
>>   					       rgn->flags);
>>   		} else {
>> +			if (!end_rgn || !start_rgn)
>> +				continue;
>> +
>>   			/* @rgn is fully contained, record it */
>>   			if (!*end_rgn)
>>   				*start_rgn = idx;
>> @@ -805,6 +809,22 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
>>   	return 0;
>>   }
>>   
>> +/**
>> + * memblock_isolate_memory - isolate given range from memblock.memory
> I think it'd better to use "... range in memblock.memory"


Ok


>
>> + * @base: base of range to isolate
>> + * @size: size of range to isolate
>> + *
>> + * Call memblock_isolate_range on memblock.memory to isolate the given range.
> Please elaborate that isolate means that the range does not share regions
> with other ranges.


Sure, thanks, I'll come up with a v8 tomorrow along with other fixes 
(rv32 and arm64 comments that I forgot to remove).

Thanks again,

Alex


>> + *
>> + * Return:
>> + * 0 on success, -errno on failure.
>> + */
>> +
>> +int __init_memblock memblock_isolate_memory(phys_addr_t base, phys_addr_t size)
>> +{
>> +	return memblock_isolate_range(&memblock.memory, base, size, NULL, NULL);
>> +}
>> +
>>   static int __init_memblock memblock_remove_range(struct memblock_type *type,
>>   					  phys_addr_t base, phys_addr_t size)
>>   {
>> -- 
>> 2.37.2
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
