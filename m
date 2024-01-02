Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB61BC47074
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 22:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V7DXzff5lIRucSQHMkgmKg4iMaI3aKsopfU9BV68a/Q=; b=0nzfTgHznvm41v
	M3Fiqh30xZkWojOxEOQdEQmkWvJtWIOiXN2B+05fxbHlc0M/rOYC/LOCxWWuT4sFtwY0BT6pvNxIm
	E1KRxkqfnX7EEohKLkYlRYs6++1F5ccKUpLp0x1YIXOcQEWGVAxfRkb8w+n7/nNCNB9gnHwGIpC7Y
	XT8YlEaGqdIN0svrF8QCRh0qSK+QF4O60agGyPyEZXgz6byMncXuzkZ3kreRnvgfzw9z3vCcuIVCQ
	kXPUtGashOgTnogETWDY2VU0C/6UDH7ETVc5oLt2TaDPHXDsAX4kgTkycvj/vMDfI7I0BQto/nUsg
	zrXOCe0Fq233BALTSSDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKn0a-009BN2-2t;
	Tue, 02 Jan 2024 22:13:12 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKn0X-009BLQ-0C
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 22:13:11 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-7b913830d8eso473440239f.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jan 2024 14:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704233585; x=1704838385; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZIPZDZt4oBEd0SnkIce+xeSPolQ5Jz9+CEZQYYyTK/Y=;
        b=WK8WPqM/taKMlHa7R+gJOSK++l7qSi/e/1DghASDVXtCkcyAny3p0uK/Wzr3k4WeiS
         bfyLAWqxMrZe8Wb52YCKPrRH9rEw7hJA78bbDhUy/Lg9J6G9fT0xaII874a1O6NQ/dTB
         skE5i5iKdd9cvW+IRtEAFn2qBu+RzhTETGiJgAutV0+/qoGnmfjpvqfSRsM2lOl73LJ2
         6LAw1uz4AlL5LHbDbaEk3qllp4Cx8vZ+CKoXsEo9k+oQDwj8W/HyF9zqT/WnI4AzMXZc
         s4gHAwux9qro8q29vP4OJi6xGWVV/B0IryMPJ3iV1nPJy7B55kXmjsh6xOul2EjhI7ZB
         UjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704233585; x=1704838385;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIPZDZt4oBEd0SnkIce+xeSPolQ5Jz9+CEZQYYyTK/Y=;
        b=HDQN5HULzbwGFRLxD5aDXn6r2VfIssYmusaEjUzmr+Lip1CctUFgBhqQ1P9qez26Tn
         Wk3qK7h5itV8uKyL9oVJFH18VJ71c7ZCDOTDknilB08Yq2MijYDW4D68xR+VC4f/Adff
         fwZf2Kbc9SLzJEaCTRhssOrUZmbEc8UvzP5EnvQm/YnIoqZXfYU0uSwDTvef7A7TAF84
         yT5KkO4YxQX1vvOKLKwbfu8MFraFz2/mwqtQoG5lMPt79xRDRa8m7Z9ARLEWTuYiW2Mr
         9pkpcyqbPmI9Vjxq8yqClJ6BKRwfMvpYgPpRhLa42EymUCB7nLAhkeAx5PMlEj5J7J0i
         vtZw==
X-Gm-Message-State: AOJu0YyYFDsrhIIE8LO77Iv67fjdfJxP9PEXjOLDJmHBX2hXBLhw1eNS
	TgFeO+r+KJmJeT/yOqGY0PWX/mc9OkWHSQ==
X-Google-Smtp-Source: AGHT+IF7xHbQKhOKiFpu7G+ldy8yhZ4y+CfLlr5t5QIvHMpys46zIJDC2W1uhpD5aAjANOWXWj5ZGg==
X-Received: by 2002:a6b:5802:0:b0:7ba:9b79:ab81 with SMTP id m2-20020a6b5802000000b007ba9b79ab81mr17054483iob.0.1704233584923;
        Tue, 02 Jan 2024 14:13:04 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:d426:c94f:f6fe:36b0? ([2605:a601:adae:4500:d426:c94f:f6fe:36b0])
        by smtp.gmail.com with ESMTPSA id t3-20020a02ab83000000b0046b15e4d5c7sm7011405jan.54.2024.01.02.14.13.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 14:13:04 -0800 (PST)
Message-ID: <9cd39ef1-9750-4e4d-9df1-3dad0a7ea015@sifive.com>
Date: Tue, 2 Jan 2024 16:13:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Add support for BATCHED_UNMAP_TLB_FLUSH
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240102141851.105144-1-alexghiti@rivosinc.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240102141851.105144-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_141309_105731_6B6C7FAC 
X-CRM114-Status: GOOD (  28.76  )
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

Hi Alex,

On 2024-01-02 8:18 AM, Alexandre Ghiti wrote:
> Allow to defer the flushing of the TLB when unmapping pges, which allows
> to reduce the numbers of IPI and the number of sfence.vma.
> 
> The ubenchmarch used in commit 43b3dfdd0455 ("arm64: support
> batched/deferred tlb shootdown during page reclamation/migration") shows
> good performance improvement and perf reports an important decrease in
> time spent flushing the tlb (results come from qemu):
> 
> Before this patch:
> 
> real	2m1.135s
> user	0m0.980s
> sys	2m0.096s
> 
> 4.83%  batch_tlb  [kernel.kallsyms]            [k] __flush_tlb_range
> 
> After this patch:
> 
> real	1m0.543s
> user	0m1.059s
> sys	0m59.489s
> 
> 0.14%  batch_tlb  [kernel.kallsyms]            [k] __flush_tlb_range

That's a great improvement!

> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/Kconfig                |  1 +
>  arch/riscv/include/asm/tlbbatch.h | 15 +++++++
>  arch/riscv/include/asm/tlbflush.h | 10 +++++
>  arch/riscv/mm/tlbflush.c          | 71 ++++++++++++++++++++++---------
>  4 files changed, 77 insertions(+), 20 deletions(-)
>  create mode 100644 arch/riscv/include/asm/tlbbatch.h
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 7603bd8ab333..aa07bd43b138 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -53,6 +53,7 @@ config RISCV
>  	select ARCH_USE_MEMTEST
>  	select ARCH_USE_QUEUED_RWLOCKS
>  	select ARCH_USES_CFI_TRAPS if CFI_CLANG
> +	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH if SMP && MMU

Is the SMP dependency because the batching is only useful with multiple CPUs, or
just because tlbflush.c is only compiled in SMP configurations (which is
resolved by [1])?

[1]:
https://lore.kernel.org/linux-riscv/20240102220134.3229156-1-samuel.holland@sifive.com/

>  	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>  	select ARCH_WANT_FRAME_POINTERS
>  	select ARCH_WANT_GENERAL_HUGETLB if !RISCV_ISA_SVNAPOT
> diff --git a/arch/riscv/include/asm/tlbbatch.h b/arch/riscv/include/asm/tlbbatch.h
> new file mode 100644
> index 000000000000..46014f70b9da
> --- /dev/null
> +++ b/arch/riscv/include/asm/tlbbatch.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2023 Rivos Inc.
> + */
> +
> +#ifndef _ASM_RISCV_TLBBATCH_H
> +#define _ASM_RISCV_TLBBATCH_H
> +
> +#include <linux/cpumask.h>
> +
> +struct arch_tlbflush_unmap_batch {
> +	struct cpumask cpumask;
> +};
> +
> +#endif /* _ASM_RISCV_TLBBATCH_H */
> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
> index 8f3418c5f172..f0b731ccc0c2 100644
> --- a/arch/riscv/include/asm/tlbflush.h
> +++ b/arch/riscv/include/asm/tlbflush.h
> @@ -46,6 +46,16 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end);
>  void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
>  			unsigned long end);
>  #endif
> +
> +#ifdef CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
> +bool arch_tlbbatch_should_defer(struct mm_struct *mm);
> +void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
> +			       struct mm_struct *mm,
> +			       unsigned long uaddr);
> +void arch_flush_tlb_batched_pending(struct mm_struct *mm);
> +void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);
> +#endif /* CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH */
> +
>  #else /* CONFIG_SMP && CONFIG_MMU */
>  
>  #define flush_tlb_all() local_flush_tlb_all()
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index e6659d7368b3..bb623bca0a7d 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -93,29 +93,23 @@ static void __ipi_flush_tlb_range_asid(void *info)
>  	local_flush_tlb_range_asid(d->start, d->size, d->stride, d->asid);
>  }
>  
> -static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
> -			      unsigned long size, unsigned long stride)
> +static void __flush_tlb_range(struct cpumask *cmask, unsigned long asid,
> +			      unsigned long start, unsigned long size,
> +			      unsigned long stride)
>  {
>  	struct flush_tlb_range_data ftd;
> -	const struct cpumask *cmask;
> -	unsigned long asid = FLUSH_TLB_NO_ASID;
>  	bool broadcast;
>  
> -	if (mm) {
> -		unsigned int cpuid;
> +	if (cpumask_empty(cmask))
> +		return;
>  
> -		cmask = mm_cpumask(mm);
> -		if (cpumask_empty(cmask))
> -			return;
> +	if (cmask != cpu_online_mask) {
> +		unsigned int cpuid;
>  
>  		cpuid = get_cpu();
>  		/* check if the tlbflush needs to be sent to other CPUs */
>  		broadcast = cpumask_any_but(cmask, cpuid) < nr_cpu_ids;
> -
> -		if (static_branch_unlikely(&use_asid_allocator))
> -			asid = atomic_long_read(&mm->context.id) & asid_mask;
>  	} else {
> -		cmask = cpu_online_mask;
>  		broadcast = true;
>  	}
>  
> @@ -135,25 +129,34 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
>  		local_flush_tlb_range_asid(start, size, stride, asid);
>  	}
>  
> -	if (mm)
> +	if (cmask != cpu_online_mask)
>  		put_cpu();
>  }
>  
> +static inline unsigned long get_mm_asid(struct mm_struct *mm)
> +{
> +	return static_branch_unlikely(&use_asid_allocator) ?
> +			atomic_long_read(&mm->context.id) & asid_mask : FLUSH_TLB_NO_ASID;
> +}
> +
>  void flush_tlb_mm(struct mm_struct *mm)
>  {
> -	__flush_tlb_range(mm, 0, FLUSH_TLB_MAX_SIZE, PAGE_SIZE);
> +	__flush_tlb_range(mm_cpumask(mm), get_mm_asid(mm),
> +			  0, FLUSH_TLB_MAX_SIZE, PAGE_SIZE);
>  }
>  
>  void flush_tlb_mm_range(struct mm_struct *mm,
>  			unsigned long start, unsigned long end,
>  			unsigned int page_size)
>  {
> -	__flush_tlb_range(mm, start, end - start, page_size);
> +	__flush_tlb_range(mm_cpumask(mm), get_mm_asid(mm),
> +			  start, end - start, page_size);
>  }
>  
>  void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
>  {
> -	__flush_tlb_range(vma->vm_mm, addr, PAGE_SIZE, PAGE_SIZE);
> +	__flush_tlb_range(mm_cpumask(vma->vm_mm), get_mm_asid(vma->vm_mm),
> +			  addr, PAGE_SIZE, PAGE_SIZE);
>  }
>  
>  void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
> @@ -185,18 +188,46 @@ void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>  		}
>  	}
>  
> -	__flush_tlb_range(vma->vm_mm, start, end - start, stride_size);
> +	__flush_tlb_range(mm_cpumask(vma->vm_mm), get_mm_asid(vma->vm_mm),
> +			  start, end - start, stride_size);
>  }
>  
>  void flush_tlb_kernel_range(unsigned long start, unsigned long end)
>  {
> -	__flush_tlb_range(NULL, start, end - start, PAGE_SIZE);
> +	__flush_tlb_range((struct cpumask *)cpu_online_mask, FLUSH_TLB_NO_ASID,
> +			  start, end - start, PAGE_SIZE);
>  }
>  
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
>  			unsigned long end)
>  {
> -	__flush_tlb_range(vma->vm_mm, start, end - start, PMD_SIZE);
> +	__flush_tlb_range(mm_cpumask(vma->vm_mm), get_mm_asid(vma->vm_mm),
> +			  start, end - start, PMD_SIZE);
>  }
>  #endif
> +
> +#ifdef CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH

This condition is necessarily true if the file is being compiled.

> +bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> +{
> +	return true;
> +}
> +
> +void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
> +			       struct mm_struct *mm,
> +			       unsigned long uaddr)
> +{
> +	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
> +}
> +
> +void arch_flush_tlb_batched_pending(struct mm_struct *mm)
> +{
> +	flush_tlb_mm(mm);
> +}
> +
> +void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
> +{
> +	__flush_tlb_range(&batch->cpumask, FLUSH_TLB_NO_ASID, 0,

The batching appears to be limited to within a single mm, so we could save the
ASID inside struct arch_tlbflush_unmap_batch and use it here.

Regards,
Samuel

> +			  FLUSH_TLB_MAX_SIZE, PAGE_SIZE);
> +}
> +#endif /* CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH */


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
