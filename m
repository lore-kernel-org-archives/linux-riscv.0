Return-Path: <SRS0=aw4H=SL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C918C10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2019 16:37:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 436D02084F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2019 16:37:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sjiZe3vo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="BzTUVgE8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 436D02084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=tNNyqCoRM6lwzagWximdpFAaAMq6nDl5a1xj908REwY=; b=sjiZe3voivPvTFTYr88MlYd+E
	IGf2811jNxKbQ2KIDF8iSEWNlccM84VIMi9IOuH2ByXRfGN0hZdXMLn+5v1yVxBd6MJJ9nphhAGjS
	v/6NcWPHHEs268QeR5o2T/I5Q2Nzaa/fc9KDUeawPR+AKhCiLkVU8eIQgRktK24+y2DokmZc5592j
	7PoXjZBeL4Zs80Gn9jX3Cs5dzvzmkrmSdZ2XRVxJ1OqPfL6VXCaL4AHLPOK5U4yecf8GgDtjyaz2z
	S+5p2MzVuMlOST4XyR7VHcrUhGp12LEKn6HP51BF7M6a/bSkGx6km0dQieW0wnftWsZkmgZeBRIKl
	kFD2CMtKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDtkw-0000jW-Cl; Tue, 09 Apr 2019 16:37:54 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDtkt-0000j8-Ck
 for linux-riscv@lists.infradead.org; Tue, 09 Apr 2019 16:37:53 +0000
Received: by mail-pl1-x642.google.com with SMTP id w24so9737786plp.2
 for <linux-riscv@lists.infradead.org>; Tue, 09 Apr 2019 09:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=fdT5lut5B8jwoz9gccxGedoHOjSxu9dDfer5vOmg7QA=;
 b=BzTUVgE8903ViBDhJqvZezlqRPYfy8hIjzSZzse+NSCL/XoSMoAKvVWlan1Q+TkZSX
 TOpAg11EY222pWOFjeAqo2gwfrpD3+Xa6SQzaXwcNjsKNIaLJtyl5x18IYoLEvaQW6Iu
 TupaD6vunSi/mq788a6bkeVcuiswtOpxCq5rqqIIndDqhEIiPVck8oq9YYu6bpC8ShY4
 BQMd2hMcCptjRFiQ2XmMkWqHnXirDU0opDrMNHDspc3r21oGdTGJ6jxErqEGwpKpete9
 2g1r0khp/8D3M4FPP6bJFSTj6a4rlCRSz3e8SlGNFdSyefwZirkosUBK0ON9K7lUXPVL
 4FAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=fdT5lut5B8jwoz9gccxGedoHOjSxu9dDfer5vOmg7QA=;
 b=aFsJq3pol/nJAP/y5kg72bZu2U1myWubRMPgt+eUjpVzPMpSmbqtcUExXYXmwTH4up
 heuaisj2JkZuGtcJ0aLJUIielRFov1S+srK5iFcB1gGOpMYS+OjIuuG3rEcOGWIcsE5w
 fzixaUzbwI6112CZ0MaLlsbXDvWPl+yd/LG8NU0sm0vLXGjP6pZaE5oIcGkIrC2VbCjW
 XqbvflpauvlM3VkcHUolEwZk96ePxPl5bUxexYMbJ/QimG7cE8XpxPMhaMD/hpdjqHbn
 KmhuGQHf/nylTHmx6kW2JWEVmknHS3BpXhe76366iYZ3Vd67lY/ew2luvMxR3RbyZ4N7
 Heag==
X-Gm-Message-State: APjAAAUI03y6eY8GqW1A69f29koJ2O4a5vVNgmOy4mta728OgjTNyxzp
 Se/+UdwGNt0BJRVMVcMwWxpBpw==
X-Google-Smtp-Source: APXvYqx+IWNCnHe4gaDcaaVFddMktQPyq3o8pxUkJOphEB5hneMYWnQBhnqN+Xgt0pZoA3LWgFF/mQ==
X-Received: by 2002:a17:902:b407:: with SMTP id
 x7mr39026012plr.288.1554827870142; 
 Tue, 09 Apr 2019 09:37:50 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id t82sm90425705pfa.153.2019.04.09.09.37.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Apr 2019 09:37:48 -0700 (PDT)
Date: Tue, 09 Apr 2019 09:37:48 -0700 (PDT)
X-Google-Original-Date: Tue, 09 Apr 2019 09:37:25 PDT (-0700)
Subject: Re: [PATCH v3 4/4] riscv: rewrite tlb flush for performance
In-Reply-To: <5f387ef7b800d5626f20e413090b30ee66d1c8d5.1552142593.git.gary@garyguo.net>
From: Palmer Dabbelt <palmer@sifive.com>
To: gary@garyguo.net
Message-ID: <mhng-75b4330d-ed93-43cf-9060-36bdb15b5808@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_093751_438714_7EB4BF5D 
X-CRM114-Status: GOOD (  35.78  )
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
Cc: aou@eecs.berkeley.edu, Anup Patel <Anup.Patel@wdc.com>,
 Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com, gary@garyguo.net,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 09 Mar 2019 06:52:04 PST (-0800), gary@garyguo.net wrote:
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

Thanks for doing so much work here, but I don't think this actually the right 
way to go.  I'd rather fix the firmware than put all this code in the kernel, 
particularly as we're putting this in the firmware under an assumption that 
there will be implementation-specific mechanism in the future.

> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  arch/riscv/include/asm/pgtable.h  |   2 +-
>  arch/riscv/include/asm/tlbflush.h |  76 +++++------
>  arch/riscv/mm/Makefile            |   1 +
>  arch/riscv/mm/context.c           |   8 +-
>  arch/riscv/mm/init.c              |   2 +-
>  arch/riscv/mm/tlbflush.c          | 216 ++++++++++++++++++++++++++++++
>  6 files changed, 257 insertions(+), 48 deletions(-)
>  create mode 100644 arch/riscv/mm/tlbflush.c
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 1141364d990e..19d1aeb059da 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -279,7 +279,7 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
>  	 * Relying on flush_tlb_fix_spurious_fault would suffice, but
>  	 * the extra traps reduce performance.  So, eagerly SFENCE.VMA.
>  	 */
> -	local_flush_tlb_page(address);
> +	local_flush_tlb_page(vma, address);
>  }
>  
>  #define __HAVE_ARCH_PTE_SAME
> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
> index 54fee0cadb1e..8c3086c6084c 100644
> --- a/arch/riscv/include/asm/tlbflush.h
> +++ b/arch/riscv/include/asm/tlbflush.h
> @@ -1,22 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * Copyright (C) 2009 Chen Liqin <liqin.chen@sunplusct.com>
>   * Copyright (C) 2012 Regents of the University of California
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
>   */
>  
>  #ifndef _ASM_RISCV_TLBFLUSH_H
>  #define _ASM_RISCV_TLBFLUSH_H
>  
>  #include <linux/mm_types.h>
> -#include <asm/smp.h>
>  
>  /*
>   * Flush entire local TLB.  'sfence.vma' implicitly fences with the instruction
> @@ -27,53 +19,47 @@ static inline void local_flush_tlb_all(void)
>  	__asm__ __volatile__ ("sfence.vma" : : : "memory");
>  }
>  
> -/* Flush one page from local TLB */
> -static inline void local_flush_tlb_page(unsigned long addr)
> +static inline void local_flush_tlb_mm(struct mm_struct *mm)
>  {
> -	__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory");
> +	/* Flush ASID 0 so that global mappings are not affected */
> +	__asm__ __volatile__ ("sfence.vma x0, %0" : : "r" (0) : "memory");
>  }
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
>  {
> -	local_flush_tlb_all();
> +	__asm__ __volatile__ ("sfence.vma %0, %1"
> +			      : : "r" (addr), "r" (0)
> +			      : "memory");
>  }
>  
> -#define flush_tlb_mm(mm) flush_tlb_all()
> +static inline void local_flush_tlb_kernel_page(unsigned long addr)
> +{
> +	__asm__ __volatile ("sfence.vma %0" : : "r" (addr) : "memory");
> +}
>  
> -#else /* CONFIG_SMP */
> +void local_flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
> +	unsigned long end);
> +void local_flush_tlb_kernel_range(unsigned long start, unsigned long end);
>  
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
>  #endif /* CONFIG_SMP */
>  
> -/* Flush a range of kernel pages */
> -static inline void flush_tlb_kernel_range(unsigned long start,
> -	unsigned long end)
> -{
> -	flush_tlb_all();
> -}
> -
>  #endif /* _ASM_RISCV_TLBFLUSH_H */
> diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
> index d75b035786d6..53b68fd3cb45 100644
> --- a/arch/riscv/mm/Makefile
> +++ b/arch/riscv/mm/Makefile
> @@ -4,3 +4,4 @@ obj-y += extable.o
>  obj-y += ioremap.o
>  obj-y += cacheflush.o
>  obj-y += context.o
> +obj-y += tlbflush.o
> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> index fbb1cfe80267..0f787bcd3a7a 100644
> --- a/arch/riscv/mm/context.c
> +++ b/arch/riscv/mm/context.c
> @@ -64,7 +64,13 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
>  	 * privileged ISA 1.10 yet.
>  	 */
>  	csr_write(sptbr, virt_to_pfn(next->pgd) | SATP_MODE);
> -	local_flush_tlb_all();
> +
> +	/*
> +	 * sfence.vma after SATP write. We call it on MM context instead of
> +	 * calling local_flush_tlb_all to prevent global mappings from being
> +	 * affected.
> +	 */
> +	local_flush_tlb_mm(next);
>  
>  	flush_icache_deferred(next);
>  }
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index b379a75ac6a6..858f55e8b219 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -168,7 +168,7 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
>  		set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, prot));
>  	} else {
>  		pte_clear(&init_mm, addr, ptep);
> -		local_flush_tlb_page(addr);
> +		local_flush_tlb_kernel_page(addr);
>  	}
>  }
>  
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> new file mode 100644
> index 000000000000..9099dc037cbd
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
> + * Increase this number can negatively impact performance on implementations
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
> +		return -EINVAL;
> +
> +	tlbi_range_threshold = value * PAGE_SIZE;
> +	return 0;
> +}
> +early_param("tlbi_max_ops", setup_tlbi_max_ops);
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
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +early_param("tlbi_method", setup_tlbi_method);
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
> -- 
> 2.17.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
