Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13363C6FD19
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Mar 2023 10:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=to7KVE9Vsi7L7ql3wBy6oCPM7VIFUChkJenGQJmCVl8=; b=EHEUA0Tb7wXGdb
	w5Kc2ta2ooqYJAABbBRcJLzXpk2rsNQCGU/Ka39thiq1M4u7RoYiSczlxGqzwWkxQ9Piocuk8ZWJX
	wohYJiaFIFQmpYfuSh9hOZfH1bT6NST69yYhr2CNDbUQV1c1lRyqpymGtpi2uFPMPzrTulrtXHpYl
	0YuyKRrrFWD6dnFTxdtUUoTxaWfF8TZpoLirxaAl/oOXoygR/Q6z2KwpSLVMOqfURgJbqzyvocY8Y
	3ZaPcPOU9+55eP9JmTxZFmOPf6lWy7DXj/Te62MF0TITjrJ5hmQhXhPrHWSuQXhSK7rOcs1gyuczo
	aRdwMb72KNJmeFtWf7pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbf0E-0055mt-CN; Mon, 13 Mar 2023 10:02:02 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbezy-0055jX-5o; Mon, 13 Mar 2023 10:01:49 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 3F0261C0019;
	Mon, 13 Mar 2023 10:01:33 +0000 (UTC)
Message-ID: <77564d46-5bca-81b8-8e14-c70624ddce5e@ghiti.fr>
Date: Mon, 13 Mar 2023 11:01:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v7 3/4] arm64: Make use of memblock_isolate_memory for the
 linear mapping
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Anup Patel <anup@brainfault.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-mm@kvack.org
References: <20230310094539.764357-1-alexghiti@rivosinc.com>
 <20230310094539.764357-4-alexghiti@rivosinc.com>
 <20230313094306.6kslmrdixuw75iqf@orel>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230313094306.6kslmrdixuw75iqf@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_030147_080838_5913C44F 
X-CRM114-Status: GOOD (  21.38  )
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

Hi Andrew,

On 3/13/23 10:43, Andrew Jones wrote:
> On Fri, Mar 10, 2023 at 10:45:38AM +0100, Alexandre Ghiti wrote:
>> In order to isolate the kernel text mapping, we used some sort of hack
>> to isolate the kernel text range which consisted in marking this region
>> as not mappable with memblock_mark_nomap. Simply use the newly introduced
>> memblock_isolate_memory function which does exactly the same but does not
>> uselessly mark the region as not mappable.
>>
>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> ---
>>   arch/arm64/mm/mmu.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 6f9d8898a025..408dc852805c 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -552,7 +552,7 @@ static void __init map_mem(pgd_t *pgdp)
>>   	 * So temporarily mark them as NOMAP to skip mappings in
>>   	 * the following for-loop
>>   	 */
> The comment above doesn't apply anymore.


Yep, noticed this one after sending, thanks anyway!


>
>> -	memblock_mark_nomap(kernel_start, kernel_end - kernel_start);
>> +	memblock_isolate_memory(kernel_start, kernel_end - kernel_start);
>>   
>>   #ifdef CONFIG_KEXEC_CORE
>>   	if (crash_mem_map) {
>> @@ -568,6 +568,7 @@ static void __init map_mem(pgd_t *pgdp)
>>   	for_each_mem_range(i, &start, &end) {
>>   		if (start >= end)
>>   			break;
>> +
> Mark nomap is also used for the crash kernel. Does the new API not work
> for it?


Seems you're right, I missed it.

Thanks,

Alex


>
> Thanks,
> drew
>
>>   		/*
>>   		 * The linear map must allow allocation tags reading/writing
>>   		 * if MTE is present. Otherwise, it has the same attributes as
>> @@ -589,7 +590,6 @@ static void __init map_mem(pgd_t *pgdp)
>>   	 */
>>   	__map_memblock(pgdp, kernel_start, kernel_end,
>>   		       PAGE_KERNEL, NO_CONT_MAPPINGS);
>> -	memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
>>   
>>   	/*
>>   	 * Use page-level mappings here so that we can shrink the region
>> -- 
>> 2.37.2
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
