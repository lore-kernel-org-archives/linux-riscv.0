Return-Path: <SRS0=9QI1=LA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 876C4C47096
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 14:41:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 321CE6136E
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 14:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 321CE6136E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iHinMc1m2fQhakOOV7Csh+4gz/xXkWjdaVh4V0wtLq4=; b=JDmxaG+ZBJU2Gn
	2UyAiSLuM6qb0EIWnB6fN5CqC2/b1GS8Dtxf6SP8HYZO8mZIkULBPmyEK1v2QBdgzxScqJjnS3t9R
	fpv9OSPNglBm5eSJ9hRFVnn9zsjhaA08fRL50KjRSPcj4bgNrrpuCnmFa6URcct8z5UaZ0N6hURHx
	JdA3AN3R6chzL425E/UCyOprv/Pnl1JIBF9+QcyviNzmKoNlFxejpPQKMKJmdMF01WAKpboXpn99X
	gySwmW6/xkjJitCnOGz3d5J6SElSRiBV6Px3U4f0PCefxS2U4G4L1vXKZ86nVIn1/uXZI04K2J1rC
	h+uxBugSKR7jMrgOhTKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lptvk-000Qpn-Aw; Sun, 06 Jun 2021 14:39:12 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lptvX-000QmU-41
 for linux-riscv@lists.infradead.org; Sun, 06 Jun 2021 14:39:01 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1D8B767373; Sun,  6 Jun 2021 16:38:49 +0200 (CEST)
Date: Sun, 6 Jun 2021 16:38:48 +0200
From: Christoph Hellwig <hch@lst.de>
To: guoren@kernel.org
Cc: anup.patel@wdc.com, palmerdabbelt@google.com, arnd@arndb.de,
 wens@csie.org, maxime@cerno.tech, drew@beagleboard.org,
 liush@allwinnertech.com, lazyparser@gmail.com, wefu@redhat.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH V5 2/3] riscv: Add ASID-based tlbflushing methods
Message-ID: <20210606143848.GA5983@lst.de>
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
 <1622970249-50770-4-git-send-email-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1622970249-50770-4-git-send-email-guoren@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_073859_336252_784B5A80 
X-CRM114-Status: GOOD (  15.10  )
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

On Sun, Jun 06, 2021 at 09:03:58AM +0000, guoren@kernel.org wrote:
> +static inline void local_flush_tlb_all_asid(unsigned long asid)
> +{
> +	__asm__ __volatile__ ("sfence.vma x0, %0"
> +			:
> +			: "r" (asid)
> +			: "memory");
> +}
> +
> +static inline void local_flush_tlb_range_asid(unsigned long start,
> +				unsigned long size, unsigned long asid)
> +{
> +	unsigned long tmp, end = ALIGN(start + size, PAGE_SIZE);
> +
> +	for (tmp = start & PAGE_MASK; tmp < end; tmp += PAGE_SIZE) {
> +		__asm__ __volatile__ ("sfence.vma %0, %1"
> +				:
> +				: "r" (tmp), "r" (asid)
> +				: "memory");
> +	}

No need to expose these in a header.

> +static void __sbi_tlb_flush_range_asid(struct cpumask *cmask,
> +				       unsigned long start,
> +				       unsigned long size,
> +				       unsigned long asid)
> +{
> +	struct cpumask hmask;
> +	unsigned int cpuid;
> +
> +	if (cpumask_empty(cmask))
> +		return;
> +
> +	cpuid = get_cpu();
> +
> +	if (cpumask_any_but(cmask, cpuid) >= nr_cpu_ids) {
> +		if (size == -1)
> +			local_flush_tlb_all_asid(asid);
> +		else
> +			local_flush_tlb_range_asid(start, size, asid);
> +	} else {
> +		riscv_cpuid_to_hartid_mask(cmask, &hmask);
> +		sbi_remote_sfence_vma_asid(cpumask_bits(&hmask),
> +					   start, size, asid);
> +	}
> +
> +	put_cpu();
> +}

Still no need to duplicate most of this logic.  Also please document
why this uses a different tradeoff for the flush all logic compared
to the non-ASID path.

> +
>  void flush_tlb_mm(struct mm_struct *mm)
>  {
> -	__sbi_tlb_flush_range(mm_cpumask(mm), 0, -1);
> +	if (static_branch_unlikely(&use_asid_allocator))
> +		__sbi_tlb_flush_range_asid(mm_cpumask(mm), 0, -1,
> +					   atomic_long_read(&mm->context.id));
> +	else
> +		__sbi_tlb_flush_range(mm_cpumask(mm), 0, -1);
>  }
>  
>  void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
>  {
> -	__sbi_tlb_flush_range(mm_cpumask(vma->vm_mm), addr, PAGE_SIZE);
> +	if (static_branch_unlikely(&use_asid_allocator))
> +		__sbi_tlb_flush_range_asid(mm_cpumask(vma->vm_mm), addr, PAGE_SIZE,
> +					   atomic_long_read(&vma->vm_mm->context.id));
> +	else
> +		__sbi_tlb_flush_range(mm_cpumask(vma->vm_mm), addr, PAGE_SIZE);
>  }
>  
>  void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>  		     unsigned long end)
>  {
> -	__sbi_tlb_flush_range(mm_cpumask(vma->vm_mm), start, end - start);
> +	if (static_branch_unlikely(&use_asid_allocator))
> +		__sbi_tlb_flush_range_asid(mm_cpumask(vma->vm_mm), start, end - start,
> +					   atomic_long_read(&vma->vm_mm->context.id));
> +	else
> +		__sbi_tlb_flush_range(mm_cpumask(vma->vm_mm), start, end - start);

Various overly long lines (which are trivially avoided when doing the
right thing from the beginning).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
