Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8030C6FD1C
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 15:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bc4sABNXe4YwEwMpuDWi9OOEexveAsOLJCTY1gnCr/A=; b=QowiGyNPPBZaeD
	2cjf8/mcqEnstTnuYhJFpIYqnsieqHnQF07rsXl4XVLcJ4BowEPcjH2rP2ft2hrJLThFbIAMYNxta
	bOiqsf0asKi2AiiJzHPZWLqCAD69IOagI6ZOocuwPn6OGk5DWkTR7yY2KeUqNx9YWqT7Fnkh+TAHA
	Qj4LFFNFmPkDGzBUubrbqIbzBDTmSGs0zE5a+EH01hs6azsgYho84qXsT2Bpv/Kj4uq1GIbTBHUEi
	a2N8F7WPcasGsdlNj7RbIOdXG4iMypaXOl47bTjKcih7mxl2TV5zmzWAF0IlJSxtQm52eNMJMEXpw
	oYAregB0O6Z5UqlIA+SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfjGn-004qNu-39;
	Fri, 24 Mar 2023 15:23:57 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfjGi-004qL8-2c;
	Fri, 24 Mar 2023 15:23:54 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id A71C1FF814;
	Fri, 24 Mar 2023 15:23:42 +0000 (UTC)
Message-ID: <dc0ffd3c-18cf-aeb9-52f9-dfcf9c92c6e9@ghiti.fr>
Date: Fri, 24 Mar 2023 16:23:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 3/4] arm64: Make use of memblock_isolate_memory for the
 linear mapping
Content-Language: en-US
To: Will Deacon <will@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Anup Patel <anup@brainfault.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-mm@kvack.org
References: <20230316131711.1284451-1-alexghiti@rivosinc.com>
 <20230316131711.1284451-4-alexghiti@rivosinc.com>
 <20230324152112.GD27199@willie-the-truck>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230324152112.GD27199@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_082353_164661_540AA734 
X-CRM114-Status: GOOD (  27.41  )
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

Hi Will,

On 3/24/23 16:21, Will Deacon wrote:
> On Thu, Mar 16, 2023 at 02:17:10PM +0100, Alexandre Ghiti wrote:
>> In order to isolate the kernel text mapping and the crash kernel
>> region, we used some sort of hack to isolate thoses ranges which consisted
>> in marking them as not mappable with memblock_mark_nomap.
>>
>> Simply use the newly introduced memblock_isolate_memory function which does
>> exactly the same but does not uselessly mark the region as not mappable.
> But that's not what this patch does -- it's also adding special-case code
> for kexec and, honestly, I'm struggling to see why this is improving
> anything.
>
> Can we leave the code like it is, or is there something else going on?


Yes, the next version won't touch arm64 at all since actually, I'll 
remove this new api.

Thanks for your time,

Alex


>
> Will
>
>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> ---
>>   arch/arm64/mm/mmu.c | 25 ++++++++++++++++---------
>>   1 file changed, 16 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 6f9d8898a025..387c2a065a09 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -548,19 +548,18 @@ static void __init map_mem(pgd_t *pgdp)
>>   
>>   	/*
>>   	 * Take care not to create a writable alias for the
>> -	 * read-only text and rodata sections of the kernel image.
>> -	 * So temporarily mark them as NOMAP to skip mappings in
>> -	 * the following for-loop
>> +	 * read-only text and rodata sections of the kernel image so isolate
>> +	 * those regions and map them after the for loop.
>>   	 */
>> -	memblock_mark_nomap(kernel_start, kernel_end - kernel_start);
>> +	memblock_isolate_memory(kernel_start, kernel_end - kernel_start);
>>   
>>   #ifdef CONFIG_KEXEC_CORE
>>   	if (crash_mem_map) {
>>   		if (defer_reserve_crashkernel())
>>   			flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>>   		else if (crashk_res.end)
>> -			memblock_mark_nomap(crashk_res.start,
>> -			    resource_size(&crashk_res));
>> +			memblock_isolate_memory(crashk_res.start,
>> +						resource_size(&crashk_res));
>>   	}
>>   #endif
>>   
>> @@ -568,6 +567,17 @@ static void __init map_mem(pgd_t *pgdp)
>>   	for_each_mem_range(i, &start, &end) {
>>   		if (start >= end)
>>   			break;
>> +
>> +		if (start == kernel_start)
>> +			continue;
>> +
>> +#ifdef CONFIG_KEXEC_CORE
>> +		if (start == crashk_res.start &&
>> +		    crash_mem_map && !defer_reserve_crashkernel() &&
>> +		    crashk_res.end)
>> +			continue;
>> +#endif
>> +
>>   		/*
>>   		 * The linear map must allow allocation tags reading/writing
>>   		 * if MTE is present. Otherwise, it has the same attributes as
>> @@ -589,7 +599,6 @@ static void __init map_mem(pgd_t *pgdp)
>>   	 */
>>   	__map_memblock(pgdp, kernel_start, kernel_end,
>>   		       PAGE_KERNEL, NO_CONT_MAPPINGS);
>> -	memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
>>   
>>   	/*
>>   	 * Use page-level mappings here so that we can shrink the region
>> @@ -603,8 +612,6 @@ static void __init map_mem(pgd_t *pgdp)
>>   				       crashk_res.end + 1,
>>   				       PAGE_KERNEL,
>>   				       NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS);
>> -			memblock_clear_nomap(crashk_res.start,
>> -					     resource_size(&crashk_res));
>>   		}
>>   	}
>>   #endif
>> -- 
>> 2.37.2
>>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
