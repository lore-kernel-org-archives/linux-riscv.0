Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2482EC27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 15:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DCJf9nYKk9cVAthqC02XvcHD8bx5PGut3GoY8UP7vUY=; b=1DGn/6IKJ8Pqd1
	e+wQ6aHrUjrvBnpcrEws0XwLGWoGb+bygGNkmInj/FByFC2s6NygcEpRJG/pN+hsZ0HtEAMF9xuaH
	zN+8kNIU0ZFMATcSbvmq3+h8yb+IHTmSlSeriXBBiq6WVlK4FjnNPTu9N+wWKhcXc/qkCuiwUOITt
	at9Uaurm3QmozD5TBQ/T5TOAIj1+ov9cnsB5E2MqaQntCcz9RdDakW9RbzboV56yKBWHY/a/mbFzd
	TAcOXqJih5tRHitRLN+PCsW/GKa6aUETriVtdHlJzPKKv09auZNRFHmM6x3JGSG3+DL3UuqVgqlCH
	Iastxdps9uUVK+qopsWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKg7C-00000009j8c-112t;
	Fri, 21 Jun 2024 15:23:50 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKg77-00000009j6Z-0Y1r
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 15:23:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 770D660008;
	Fri, 21 Jun 2024 15:23:39 +0000 (UTC)
Message-ID: <caaeb1d1-12c5-4d07-b299-34734f0099ab@ghiti.fr>
Date: Fri, 21 Jun 2024 17:23:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/1] riscv: mm: Add support for Svinval extension
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Samuel Holland <samuel.holland@sifive.com>
References: <20240609112103.285190-1-mchitale@ventanamicro.com>
 <20240609112103.285190-2-mchitale@ventanamicro.com>
 <20240621-469a3d5eb7bb2c0cc8ae0611@orel>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240621-469a3d5eb7bb2c0cc8ae0611@orel>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_082345_512982_00128531 
X-CRM114-Status: GOOD (  29.28  )
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

Hi Mayuresh, Andrew,

On 21/06/2024 11:15, Andrew Jones wrote:
> On Sun, Jun 09, 2024 at 04:51:03PM GMT, Mayuresh Chitale wrote:
>> The Svinval extension splits SFENCE.VMA instruction into finer-grained
>> invalidation and ordering operations and is mandatory for RVA23S64 profile.
>> When Svinval is enabled the local_flush_tlb_range_threshold_asid function
>> should use the following sequence to optimize the tlb flushes instead of
>> a simple sfence.vma:
>>
>> sfence.w.inval
>> svinval.vma
>>    .
>>    .
>> svinval.vma
>> sfence.inval.ir
>>
>> The maximum number of consecutive svinval.vma instructions that
>> can be executed in local_flush_tlb_range_threshold_asid function
>> is limited to 64. This is required to avoid soft lockups and the
>> approach is similar to that used in arm64.
>>
>> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
>> ---
>>   arch/riscv/mm/tlbflush.c | 58 ++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 58 insertions(+)
>>
>> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
>> index 9b6e86ce3867..49d7978ac8d3 100644
>> --- a/arch/riscv/mm/tlbflush.c
>> +++ b/arch/riscv/mm/tlbflush.c
>> @@ -6,6 +6,54 @@
>>   #include <linux/hugetlb.h>
>>   #include <asm/sbi.h>
>>   #include <asm/mmu_context.h>
>> +#include <asm/cpufeature.h>
>> +
>> +#define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
>> +
>> +static inline void local_sfence_inval_ir(void)
>> +{
>> +	/*
>> +	 * SFENCE.INVAL.IR
>> +	 * 0001100 00001 00000 000 00000 1110011
>> +	 */
>> +	__asm__ __volatile__ (".word 0x18100073" ::: "memory");
>> +}
>> +
>> +static inline void local_sfence_w_inval(void)
>> +{
>> +	/*
>> +	 * SFENCE.W.INVAL
>> +	 * 0001100 00000 00000 000 00000 1110011
>> +	 */
>> +	__asm__ __volatile__ (".word 0x18000073" ::: "memory");
>> +}
>> +
>> +static inline void local_sinval_vma_asid(unsigned long vma, unsigned long asid)
> Please name this to
>
>    void local_sinval_vma(unsigned long vaddr, unsigned long asid)
>
> to match the spec's naming. But, if we want the arguments in the name,
> then it should be something like
>
>    void local_sinval_vma_addr_asid(unsigned long vaddr, unsigned long asid)
>
> but I think that's unnecessary.
>
>> +{
>> +	if (asid != FLUSH_TLB_NO_ASID) {
>> +		/*
>> +		 * rs1 = a0 (VMA)
>> +		 * rs2 = a1 (asid)
>> +		 * SINVAL.VMA a0, a1
>> +		 * 0001011 01011 01010 000 00000 1110011
>> +		 */
>> +		__asm__ __volatile__ ("add a0, %0, zero\n"
>> +					"add a1, %1, zero\n"
>> +					".word 0x16B50073\n"
>> +					:: "r" (vma), "r" (asid)
>> +					: "a0", "a1", "memory");
>> +	} else {
>> +		/*
>> +		 * rs1 = a0 (VMA)
>> +		 * rs2 = 0
>> +		 * SINVAL.VMA a0
>> +		 * 0001011 00000 01010 000 00000 1110011
>> +		 */
>> +		__asm__ __volatile__ ("add a0, %0, zero\n"
>> +					".word 0x16050073\n"
>> +					:: "r" (vma) : "a0", "memory");
>> +	}
> Please create an SINVAL_VMA instruction in insn-def.h to allow the
> compiler to choose which registers will be used for asid and vaddr. And,
> since SINVAL_VMA will be in insn-def.h, then we might as well add
> SFENCE_INVAL_IR and SFENCE_W_INVAL there too for consistency, even though
> they don't have operands. We should still create the three static inline
> wrapper functions here though.
>
>> +}
>>   
>>   /*
>>    * Flush entire TLB if number of entries to be flushed is greater
>> @@ -26,6 +74,16 @@ static void local_flush_tlb_range_threshold_asid(unsigned long start,
>>   		return;
>>   	}
>>   
>> +	if (has_svinval()) {
>> +		local_sfence_w_inval();
>> +		for (i = 0; i < nr_ptes_in_range; ++i) {
> Where do we limit this to 64 as the commit message states it does?


If the number of ptes to flush is greater than tlb_flush_all_threshold 
(= 64), we don't get there so this is indeed limited to 64 entries max.

I think this limit should be different when using svinval, but we can do 
that later and the goal is to allow the vendors to come with their own 
threshold anyway.

Thanks for reviving this Mayuresh, I'll add my RB in the next version 
when you fix Andrew's comments.

Alex


>
>> +			local_sinval_vma_asid(start, asid);
>> +			start += stride;
>> +		}
>> +		local_sfence_inval_ir();
>> +		return;
>> +	}
>> +
>>   	for (i = 0; i < nr_ptes_in_range; ++i) {
>>   		local_flush_tlb_page_asid(start, asid);
>>   		start += stride;
>> -- 
>> 2.34.1
>>
> Thanks,
> drew
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
