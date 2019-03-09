Return-Path: <SRS0=jXit=RM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1F4C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  9 Mar 2019 08:17:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACB8B207E0
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  9 Mar 2019 08:17:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BfgmLTxG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="n7BjQqie"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACB8B207E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8A8Srr0SLHeFHskmNIxQkhN0cezJVJbTAFaPgs4rOyY=; b=BfgmLTxGUSnQ7aJEhO0rfVt62
	tQI9T1mFqWlFGoj6JpbyzA9NggwE63oLC96QRV/gLxwCbUjBQcMPReEuyK+LZFltxt1IBmXQc+6+H
	kT/3zpVcllbiRJm/nejn+9caZP30CrwIdAv6hegF4rQlmQ3B7v7NTgOkRwDPaQz4sA16FavPqp4ck
	pu7sZTv5FnmsQYHQLEQ6wMGjmiosG78CSDBtCdFWaY1f9DjnImwqicAVTLhfjeu/lns3lC0cdGUxT
	joq/kWEcwRbREGySRBI7X78NqlPEgCiCYg9RmF1Y3rwqZcVD5A+XkoibLXl2fpoGVh3JQ/mdVU55x
	1s45RD6HA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2XAn-0000LK-D2; Sat, 09 Mar 2019 08:17:37 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2XAj-0000KZ-Av
 for linux-riscv@lists.infradead.org; Sat, 09 Mar 2019 08:17:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1552119454; x=1583655454;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=gzokYm7NQ6VyPL8f4+dVLTnHc2sdGy5sX0OBHpRcLCc=;
 b=n7BjQqievX+B0oP0WMzHiS1B/IL8zYggoAt5yQGi/vogL+r0UC0AvYmb
 MLAPDdEfaU8FW2tAvODxCARD1tXJkTRAN4awgmQoUaRS6jXM3euMdIWAW
 jo49x0rEFJSZhZXO984ydMOFy1SUFpKHlpHAA9ieBGOeSTNwLTnhUUb8h
 D2BXxgbNRm/woV/1+TO/pthJNtDt2QuVGqMv8dRJUfp9ydHG4I9Y3wmBu
 gSwLQ9xWSjC53qBOJxEY5HIu3OJWwg1V/r1b8WtXwUjzot5xKtnnXiPPQ
 Fcuu1k09fmrrR0gqUOocAQcMDTDRPbIWOkU2do4XFcGqWkzwVhkOZ6lor A==;
X-IronPort-AV: E=Sophos;i="5.58,459,1544457600"; d="scan'208";a="104406882"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Mar 2019 16:17:29 +0800
IronPort-SDR: 14SmxvCH+15pFaK5r79tNrMJO4NJNzz3LHdvW+b2rd5sCUUuFp91VTP/cjZgYm7b9tLui1ObKE
 Kn6tPsm2X8Sjdvv0WznvRwH3thMGBkqgYvX8/+saBvF+rS/+hcRg9wh9ZAXK0TzL7UlcxbRpP/
 snYr0BP9Kr8Bisu8modNBfxRVWmx6XnmEbD3TX7aOmVcoZz2xewxExiq6ghHnXCCz3MMq6xobe
 NTBg6VK5UK/sOB4D2pHC021Ye0SRYI1UhtPLsWJqqDD6+/eS/mvLUtAHpszrWXR9SfMK/s5ItF
 YstLl2aUKsenCdWTfP1d8Jy/
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 08 Mar 2019 23:57:26 -0800
IronPort-SDR: hhai1+LA+xSP+flxXBHXbLjaqjMQu5BLh6L9IEH1F6KDfcA+3oPsEd2YY/DScFEMkD5mVMROaJ
 aUhDDmMPSx5uZy9QA0tsIrSVIDsFFo6qQxn/XuEPr6diFuJtAHfXm9Ph+VdD8X5YKWIC8Z2edb
 B/nwZ2poX6Q+XzfXOuUMJPSkhbKjqEwdKUOsC621cz7CsXdoPCu4XAAlBRENkyiSQgRl76y8rR
 TVLPDBevaEUG/976qQDE7tXxkrSU2yN1FdsBJHDbCR2pgumoqioo5xEm586lm8FgW3mqXgtCaR
 HjI=
Received: from usa002788.ad.shared (HELO [10.86.52.191]) ([10.86.52.191])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Mar 2019 00:17:28 -0800
Subject: Re: [PATCH v2 4/4] riscv: rewrite tlb flush for performance
To: Gary Guo <gary@garyguo.net>
References: <cover.1552069700.git.gary@garyguo.net>
 <33588efb3909a4d699a952f93c26ea2f3c8bfdc4.1552069700.git.gary@garyguo.net>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <a121c2b1-16d2-833c-131e-6c753249b178@wdc.com>
Date: Sat, 9 Mar 2019 00:17:27 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <33588efb3909a4d699a952f93c26ea2f3c8bfdc4.1552069700.git.gary@garyguo.net>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190309_001733_581318_FFCDAA27 
X-CRM114-Status: GOOD (  37.76  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Christoph Hellwig <hch@infradead.org>, Anup Patel <Anup.Patel@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/8/19 10:40 AM, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> This patch rewrites the logic related to TLB flushing, both to cleanup
> the code and to improve performance.
> 
> We now use sfence.vma variant with specified ASID and virtual address
> whenever possible.  Even though only ASID 0 is used, it still improves
> performance by preventing global mappings from being flushed from TLB.
> 
> This patch also includes a IPI-based remote TLB shootdown, which is
> useful at this stage for testing because BBL/OpenSBI ignores operands
> of sbi_remote_sfence_vma_asid and always perform a global TLB flush.
> The SBI-based remote TLB shootdown can still be opt-in using boot
> cmdline "tlbi_method=sbi".
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>   arch/riscv/include/asm/pgtable.h  |   2 +-
>   arch/riscv/include/asm/tlbflush.h |  73 ++++------
>   arch/riscv/mm/Makefile            |   1 +
>   arch/riscv/mm/context.c           |   8 +-
>   arch/riscv/mm/tlbflush.c          | 216 ++++++++++++++++++++++++++++++
>   5 files changed, 252 insertions(+), 48 deletions(-)
>   create mode 100644 arch/riscv/mm/tlbflush.c
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 16301966d65b..47a8616b9de0 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -279,7 +279,7 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
>   	 * Relying on flush_tlb_fix_spurious_fault would suffice, but
>   	 * the extra traps reduce performance.  So, eagerly SFENCE.VMA.
>   	 */
> -	local_flush_tlb_page(address);
> +	local_flush_tlb_page(vma, address);
>   }
>   
>   #define __HAVE_ARCH_PTE_SAME
> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
> index 54fee0cadb1e..d6c247ce17f3 100644
> --- a/arch/riscv/include/asm/tlbflush.h
> +++ b/arch/riscv/include/asm/tlbflush.h
> @@ -1,22 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>   /*
>    * Copyright (C) 2009 Chen Liqin <liqin.chen@sunplusct.com>
>    * Copyright (C) 2012 Regents of the University of California
> - *
> - *   This program is free software; you can redistribute it and/or
> - *   modify it under the terms of the GNU General Public License
> - *   as published by the Free Software Foundation, version 2.
> - *
> - *   This program is distributed in the hope that it will be useful,
> - *   but WITHOUT ANY WARRANTY; without even the implied warranty of
> - *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - *   GNU General Public License for more details.
> + * Copyright (C) 2019 Gary Guo, University of Cambridge
>    */
>   
>   #ifndef _ASM_RISCV_TLBFLUSH_H
>   #define _ASM_RISCV_TLBFLUSH_H
>   
>   #include <linux/mm_types.h>
> -#include <asm/smp.h>
>   
>   /*
>    * Flush entire local TLB.  'sfence.vma' implicitly fences with the instruction
> @@ -27,53 +19,42 @@ static inline void local_flush_tlb_all(void)
>   	__asm__ __volatile__ ("sfence.vma" : : : "memory");
>   }
>   
> -/* Flush one page from local TLB */
> -static inline void local_flush_tlb_page(unsigned long addr)
> +static inline void local_flush_tlb_mm(struct mm_struct *mm)
>   {
> -	__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory");
> +	/* Flush ASID 0 so that global mappings are not affected */
> +	__asm__ __volatile__ ("sfence.vma x0, %0" : : "r" (0) : "memory");
>   }
>   
> -#ifndef CONFIG_SMP
> -
> -#define flush_tlb_all() local_flush_tlb_all()
> -#define flush_tlb_page(vma, addr) local_flush_tlb_page(addr)
> -
> -static inline void flush_tlb_range(struct vm_area_struct *vma,
> -		unsigned long start, unsigned long end)
> +static inline void local_flush_tlb_page(struct vm_area_struct *vma,
> +	unsigned long addr)
>   {
> -	local_flush_tlb_all();
> +	__asm__ __volatile__ ("sfence.vma %0, %1"
> +			      : : "r" (addr), "r" (0)
> +			      : "memory");
>   }
>   
> -#define flush_tlb_mm(mm) flush_tlb_all()
> +void local_flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
> +	unsigned long end);
> +void local_flush_tlb_kernel_range(unsigned long start, unsigned long end);
>   
> -#else /* CONFIG_SMP */
> -
> -#include <asm/sbi.h>
> +#ifdef CONFIG_SMP
>   
> -static inline void remote_sfence_vma(struct cpumask *cmask, unsigned long start,
> -				     unsigned long size)
> -{
> -	struct cpumask hmask;
> +void flush_tlb_all(void);
> +void flush_tlb_mm(struct mm_struct *mm);
> +void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr);
> +void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
> +	unsigned long end);
> +void flush_tlb_kernel_range(unsigned long start, unsigned long end);
>   
> -	cpumask_clear(&hmask);
> -	riscv_cpuid_to_hartid_mask(cmask, &hmask);
> -	sbi_remote_sfence_vma(hmask.bits, start, size);
> -}
> +#else /* CONFIG_SMP */
>   
> -#define flush_tlb_all() sbi_remote_sfence_vma(NULL, 0, -1)
> -#define flush_tlb_page(vma, addr) flush_tlb_range(vma, addr, 0)
> -#define flush_tlb_range(vma, start, end) \
> -	remote_sfence_vma(mm_cpumask((vma)->vm_mm), start, (end) - (start))
> -#define flush_tlb_mm(mm) \
> -	remote_sfence_vma(mm_cpumask(mm), 0, -1)
> +#define flush_tlb_all() local_flush_tlb_all()
> +#define flush_tlb_mm(mm) local_flush_tlb_mm(mm)
> +#define flush_tlb_page(vma, addr) local_flush_tlb_page(vma, addr)
> +#define flush_tlb_range(vma, start, end) local_flush_tlb_range(vma, start, end)
> +#define flush_tlb_kernel_range(start, end) \
> +	local_flush_tlb_kernel_range(start, end)
>   
>   #endif /* CONFIG_SMP */
>   
> -/* Flush a range of kernel pages */
> -static inline void flush_tlb_kernel_range(unsigned long start,
> -	unsigned long end)
> -{
> -	flush_tlb_all();
> -}
> -
>   #endif /* _ASM_RISCV_TLBFLUSH_H */
> diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
> index d75b035786d6..53b68fd3cb45 100644
> --- a/arch/riscv/mm/Makefile
> +++ b/arch/riscv/mm/Makefile
> @@ -4,3 +4,4 @@ obj-y += extable.o
>   obj-y += ioremap.o
>   obj-y += cacheflush.o
>   obj-y += context.o
> +obj-y += tlbflush.o
> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> index fbb1cfe80267..0f787bcd3a7a 100644
> --- a/arch/riscv/mm/context.c
> +++ b/arch/riscv/mm/context.c
> @@ -64,7 +64,13 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
>   	 * privileged ISA 1.10 yet.
>   	 */
>   	csr_write(sptbr, virt_to_pfn(next->pgd) | SATP_MODE);
> -	local_flush_tlb_all();
> +
> +	/*
> +	 * sfence.vma after SATP write. We call it on MM context instead of
> +	 * calling local_flush_tlb_all to prevent global mappings from being
> +	 * affected.
> +	 */
> +	local_flush_tlb_mm(next);
>   
>   	flush_icache_deferred(next);
>   }
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> new file mode 100644
> index 000000000000..b4b35e825495
> --- /dev/null
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -0,0 +1,216 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 Gary Guo, University of Cambridge
> + */
> +
> +#include <linux/mm.h>
> +#include <asm/sbi.h>
> +
> +#define SFENCE_VMA_FLUSH_ALL ((unsigned long) -1)
> +
> +/*
> + * This controls the maximum amount of page-level sfence.vma that the kernel
> + * can issue when the kernel needs to flush a range from the TLB.  If the size
> + * of range goes beyond this threshold, a full sfence.vma is issued.
> + *
> + * Increase this number can negatively impact performance on implemntations
> + * where sfence.vma's address operand is ignored and always perform a global
> + * TLB flush.  On the other hand, implementations with page-level TLB flush
> + * support can benefit from a larger number.
> + */
> +static unsigned long tlbi_range_threshold = PAGE_SIZE;
> +
> +static int __init setup_tlbi_max_ops(char *str)
> +{
> +	int value = 0;
> +
> +	get_option(&str, &value);
> +
> +	/*
> +	 * This value cannot be greater or equal to PTRS_PER_PTE, as we need
> +	 * to full flush for any non-leaf page table change. The value has also
> +	 * be at least 1.
> +	 */
> +	if (value >= PTRS_PER_PTE || value < 1)
> +		return 0;
> +
> +	tlbi_range_threshold = value * PAGE_SIZE;
> +	return 1;
> +}
> +__setup("tlbi_max_ops=", setup_tlbi_max_ops);
> +
> +void local_flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
> +	unsigned long end)
> +{
> +	if (end - start > tlbi_range_threshold) {
> +		local_flush_tlb_mm(vma->vm_mm);
> +		return;
> +	}
> +
> +	while (start < end) {
> +		__asm__ __volatile__ ("sfence.vma %0, %1"
> +				      : : "r" (start), "r" (0)
> +				      : "memory");
> +		start += PAGE_SIZE;
> +	}
> +}
> +
> +void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
> +{
> +	if (end - start > tlbi_range_threshold) {
> +		local_flush_tlb_all();
> +		return;
> +	}
> +
> +	while (start < end) {
> +		__asm__ __volatile__ ("sfence.vma %0"
> +				      : : "r" (start)
> +				      : "memory");
> +		start += PAGE_SIZE;
> +	}
> +}
> +
> +#ifdef CONFIG_SMP
> +
> +/*
> + * BBL/OpenSBI are currently ignoring ASID and address range provided
> + * by SBI call argument, and do a full TLB flush instead. This may
> + * negatively impact performance on implementations with page-level
> + * sfence.vma support.
> + *
> + * We provide an IPI-based remote shootdown implementation to improve
> + * performance on implementations with page-level sfence.vma, and also to
> + * allow testing of these implementations.
> + *
> + * This parameter allows the approach (IPI/SBI) to be specified using boot
> + * cmdline.
> + */
> +static bool tlbi_ipi = true;
> +
> +static int __init setup_tlbi_method(char *str)
> +{
> +	if (strcmp(str, "ipi") == 0)
> +		tlbi_ipi = true;
> +	else if (strcmp(str, "sbi") == 0)
> +		tlbi_ipi = false;
> +	else
> +		return 0;
> +
> +	return 1;
> +}
> +__setup("tlbi_method=", setup_tlbi_method);
> +
> +
> +struct tlbi {
> +	unsigned long start;
> +	unsigned long size;
> +	unsigned long asid;
> +};
> +
> +static void ipi_remote_sfence_vma(void *info)
> +{
> +	struct tlbi *data = info;
> +	unsigned long start = data->start;
> +	unsigned long size = data->size;
> +	unsigned long i;
> +
> +	for (i = 0; i < size; i += PAGE_SIZE) {
> +		__asm__ __volatile__ ("sfence.vma %0"
> +				      : : "r" (start + i)
> +				      : "memory");
> +	}
> +}
> +
> +static void ipi_remote_sfence_vma_asid(void *info)
> +{
> +	struct tlbi *data = info;
> +	unsigned long asid = data->asid;
> +	unsigned long start = data->start;
> +	unsigned long size = data->size;
> +	unsigned long i;
> +
> +	/* Flush entire MM context */
> +	if (size == SFENCE_VMA_FLUSH_ALL) {
> +		__asm__ __volatile__ ("sfence.vma x0, %0"
> +				      : : "r" (asid)
> +				      : "memory");
> +		return;
> +	}
> +
> +	for (i = 0; i < size; i += PAGE_SIZE) {
> +		__asm__ __volatile__ ("sfence.vma %0, %1"
> +				      : : "r" (start + i), "r" (asid)
> +				      : "memory");
> +	}
> +}
> +
> +static void remote_sfence_vma(unsigned long start, unsigned long size)
> +{
> +	if (tlbi_ipi) {
> +		struct tlbi info = {
> +			.start = start,
> +			.size = size,
> +		};
> +		on_each_cpu(ipi_remote_sfence_vma, &info, 1);
> +	} else
> +		sbi_remote_sfence_vma(NULL, start, size);
> +}
> +
> +static void remote_sfence_vma_asid(cpumask_t *mask, unsigned long start,
> +		unsigned long size, unsigned long asid)
> +{
> +	if (tlbi_ipi) {
> +		struct tlbi info = {
> +			.start = start,
> +			.size = size,
> +			.asid = asid,
> +		};
> +		on_each_cpu_mask(mask, ipi_remote_sfence_vma_asid, &info, 1);
> +	} else {
> +		cpumask_t hmask;
> +
> +		cpumask_clear(&hmask);
> +		riscv_cpuid_to_hartid_mask(mask, &hmask);
> +		sbi_remote_sfence_vma_asid(hmask.bits, start, size, asid);
> +	}
> +}
> +
> +
> +void flush_tlb_all(void)
> +{
> +	sbi_remote_sfence_vma(NULL, 0, SFENCE_VMA_FLUSH_ALL);
> +}
> +
> +void flush_tlb_mm(struct mm_struct *mm)
> +{
> +	remote_sfence_vma_asid(mm_cpumask(mm), 0, SFENCE_VMA_FLUSH_ALL, 0);
> +}
> +
> +void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
> +{
> +	remote_sfence_vma_asid(mm_cpumask(vma->vm_mm), addr, PAGE_SIZE, 0);
> +}
> +

Can you please rebase on top of latest master ?
The fixmap patchset which got merged as a part of 5.1-rc1. It introduced 
another flush_tlb_page usage with old arguments causing a compilation 
failure.

Here is the PR.
https://patchwork.kernel.org/patch/10823195/

or if you prefer the series.

https://patchwork.kernel.org/project/linux-riscv/list/?series=79489

Regards,
Atish
> +
> +void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
> +	unsigned long end)
> +{
> +	if (end - start > tlbi_range_threshold) {
> +		flush_tlb_mm(vma->vm_mm);
> +		return;
> +	}
> +
> +	remote_sfence_vma_asid(mm_cpumask(vma->vm_mm), start, end - start, 0);
> +}
> +
> +void flush_tlb_kernel_range(unsigned long start, unsigned long end)
> +{
> +	if (end - start > tlbi_range_threshold) {
> +		flush_tlb_all();
> +		return;
> +	}
> +
> +	remote_sfence_vma(start, end - start);
> +}
> +
> +#endif /* CONFIG_SMP */
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
