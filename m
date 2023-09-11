Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13DBEE57DF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 08:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EIX/Pvu6mYedlZ9HGcHjkqO3bZAfHhvm4h30LJvVSMU=; b=qjnIKzHD4T4KAF
	v+li7yv0VXfH71UEu0vY/FsA1vXGXAGgINK7v+VoTRE6KT5Ir5y9DX+rkVr1Ca7kptBK1WjMX4DIu
	gTXNqVXke2JH3dQC2CuaeHKC6WMGe0zq6KVHRSMQudLsc+sjjPmbQGgGn5MuzVuCLRazV4txeoVew
	kEbSpQv+81qxviqFQLPrOF/9hhmH3Xy+rGsbPfXsxy6s28zklCiZ60wtnlP1cvCLT5ZjfId9Y1izG
	J9AzD901vRE4iP1D26ZlIO0ZM1SMZjSXeM9E/gHAqtGZMRBZtc6odBBZSN3JsMRpdrjSHTTYObV14
	IReJcCGijVP2vqUkXF1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfcMn-00HY8N-1j;
	Mon, 11 Sep 2023 08:33:57 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfcMj-00HY74-0r
	for linux-riscv@lists.infradead.org;
	Mon, 11 Sep 2023 08:33:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6B7E40003;
	Mon, 11 Sep 2023 08:33:39 +0000 (UTC)
Message-ID: <adb67b73-7b6b-edbd-81f2-2319999c1fd8@ghiti.fr>
Date: Mon, 11 Sep 2023 10:33:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 4/4] riscv: Improve flush_tlb_kernel_range()
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-arch@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230801085402.1168351-1-alexghiti@rivosinc.com>
 <20230801085402.1168351-5-alexghiti@rivosinc.com>
 <0e101df0-397a-0d1a-0080-2e60c68c79b6@sholland.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <0e101df0-397a-0d1a-0080-2e60c68c79b6@sholland.org>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_013353_600387_E77DE9AC 
X-CRM114-Status: GOOD (  28.02  )
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


On 09/09/2023 21:00, Samuel Holland wrote:
> Hi Alex,
>
> On 8/1/23 03:54, Alexandre Ghiti wrote:
>> This function used to simply flush the whole tlb of all harts, be more
>> subtile and try to only flush the range.
>>
>> The problem is that we can only use PAGE_SIZE as stride since we don't know
>> the size of the underlying mapping and then this function will be improved
>> only if the size of the region to flush is < threshold * PAGE_SIZE.
>>
>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>> ---
>>   arch/riscv/include/asm/tlbflush.h | 11 +++++-----
>>   arch/riscv/mm/tlbflush.c          | 34 +++++++++++++++++++++++--------
>>   2 files changed, 31 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
>> index f5c4fb0ae642..7426fdcd8ec5 100644
>> --- a/arch/riscv/include/asm/tlbflush.h
>> +++ b/arch/riscv/include/asm/tlbflush.h
>> @@ -37,6 +37,7 @@ void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
>>   void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr);
>>   void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>>   		     unsigned long end);
>> +void flush_tlb_kernel_range(unsigned long start, unsigned long end);
>>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>   #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
>>   void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
>> @@ -53,15 +54,15 @@ static inline void flush_tlb_range(struct vm_area_struct *vma,
>>   	local_flush_tlb_all();
>>   }
>>   
>> -#define flush_tlb_mm(mm) flush_tlb_all()
>> -#define flush_tlb_mm_range(mm, start, end, page_size) flush_tlb_all()
>> -#endif /* !CONFIG_SMP || !CONFIG_MMU */
>> -
>>   /* Flush a range of kernel pages */
>>   static inline void flush_tlb_kernel_range(unsigned long start,
>>   	unsigned long end)
>>   {
>> -	flush_tlb_all();
>> +	local_flush_tlb_all();
>>   }
>>   
>> +#define flush_tlb_mm(mm) flush_tlb_all()
>> +#define flush_tlb_mm_range(mm, start, end, page_size) flush_tlb_all()
>> +#endif /* !CONFIG_SMP || !CONFIG_MMU */
>> +
>>   #endif /* _ASM_RISCV_TLBFLUSH_H */
>> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
>> index 0c955c474f3a..687808013758 100644
>> --- a/arch/riscv/mm/tlbflush.c
>> +++ b/arch/riscv/mm/tlbflush.c
>> @@ -120,18 +120,27 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
>>   			      unsigned long size, unsigned long stride)
>>   {
>>   	struct flush_tlb_range_data ftd;
>> -	struct cpumask *cmask = mm_cpumask(mm);
>> -	unsigned int cpuid;
>> +	struct cpumask *cmask, full_cmask;
>>   	bool broadcast;
>>   
>> -	if (cpumask_empty(cmask))
>> -		return;
>> +	if (mm) {
>> +		unsigned int cpuid;
>> +
>> +		cmask = mm_cpumask(mm);
>> +		if (cpumask_empty(cmask))
>> +			return;
>> +
>> +		cpuid = get_cpu();
>> +		/* check if the tlbflush needs to be sent to other CPUs */
>> +		broadcast = cpumask_any_but(cmask, cpuid) < nr_cpu_ids;
>> +	} else {
>> +		cpumask_setall(&full_cmask);
>> +		cmask = &full_cmask;
>> +		broadcast = true;
>> +	}
>>   
>> -	cpuid = get_cpu();
>> -	/* check if the tlbflush needs to be sent to other CPUs */
>> -	broadcast = cpumask_any_but(cmask, cpuid) < nr_cpu_ids;
>>   	if (static_branch_unlikely(&use_asid_allocator)) {
>> -		unsigned long asid = atomic_long_read(&mm->context.id) & asid_mask;
>> +		unsigned long asid = mm ? atomic_long_read(&mm->context.id) & asid_mask : 0;
> I think the bug is here. Passing a value of 0 for the ASID is not the
> same as passing the ASID in register x0. Only in the latter case does
> the TLB flush apply to global mappings, which is what you need for
> flush_tlb_kernel_range().


Fantastic, thank you, I was miles away from finding this! Really nice 
catch, thanks again.

I'm fixing this and while doing so, I may be stepping a bit on your 
patchset (some code removal), sorry about that. I'll provide a new 
version quickly for Prabhakar to test, and we'll see how we'll rebase 
each other series.

Thanks again Samuel, well done!

Alex


> Regards,
> Samuel
>
>>   
>>   		if (broadcast) {
>>   			if (riscv_use_ipi_for_rfence()) {
>> @@ -165,7 +174,8 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
>>   		}
>>   	}
>>   
>> -	put_cpu();
>> +	if (mm)
>> +		put_cpu();
>>   }
>>   
>>   void flush_tlb_mm(struct mm_struct *mm)
>> @@ -196,6 +206,12 @@ void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>>   
>>   	__flush_tlb_range(vma->vm_mm, start, end - start, stride_size);
>>   }
>> +
>> +void flush_tlb_kernel_range(unsigned long start, unsigned long end)
>> +{
>> +	__flush_tlb_range(NULL, start, end, PAGE_SIZE);
>> +}
>> +
>>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>   void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
>>   			unsigned long end)
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
