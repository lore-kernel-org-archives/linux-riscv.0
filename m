Return-Path: <SRS0=wRFB=R6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 613A2C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 07:26:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E2C12075E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 07:26:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hI7USr3i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E2C12075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5OHrvYgesMcLYxH9fV5UCiqpNprYgc/zXgsduZ5ryII=; b=hI7USr3iOKMd7+
	ASCESwUnomexO+KN0zhkdRC5NKExnhzdxMswoa+u4jAlqHG/UzySkntAaNO7cTxOAqmKiJPtQvidE
	cTcl19cjScqly/sJEPwfxTMyBMW0QMkH0evrmOCChh7wCxELuUTayk2G9zVRLdDPwKyZpqztiRF4o
	mLGd5fflZpb4cOWC9ZZYfyNbSz2Fd3KF6iXNeKZAnJ6KnNGYVE1dktl95EUjsDsuPPuCde6PT6qcl
	rZuOIXOzG9RfzdQKFEmrow39KRhrHRUUO6dCWHGHD9vLd8fPXrGPVL8o4QcWWHYhWVu5Qs+DHUiUm
	tvLxCFcTgUuSmF9ldINA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h92wh-00017r-Oj; Wed, 27 Mar 2019 07:25:59 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h92wf-00017S-QX; Wed, 27 Mar 2019 07:25:57 +0000
Date: Wed, 27 Mar 2019 00:25:57 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH v4 4/5] riscv: rewrite tlb flush for performance
Message-ID: <20190327072557.GE3210@infradead.org>
References: <cover.1553647082.git.gary@garyguo.net>
 <d60a62cfbbf63382a47e3c2226c5dd6148f8b814.1553647082.git.gary@garyguo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d60a62cfbbf63382a47e3c2226c5dd6148f8b814.1553647082.git.gary@garyguo.net>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

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
> +static inline void local_flush_tlb_page(struct vm_area_struct *vma,
> +	unsigned long addr)
> +{
> +	__asm__ __volatile__ ("sfence.vma %0, %1"
> +			      : : "r" (addr), "r" (0)
> +			      : "memory");
> +}

Why do we pass the vma argument here even if it is never used?  That
just seems to create some rather pointless churn.  Also I'd add
local_flush_tlb_mm below local_flush_tlb_page to avoid churn as well,
nevermind that it seems the more logical order to me.

> +void local_flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
> +	unsigned long end);
> +void local_flush_tlb_kernel_range(unsigned long start, unsigned long end);

As far as I can tell these are only used for the !SMP case and only
to implement the non-local prefixed versions.  In that case we should
just drop the local_prefix and implement those APIs directly, and only
for !SMP builds.

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

I really hate having this is a tunable in the kernel code.  I think
the right answer is to have a device tree entry to carry this number
so that the platform can supply it.  Btw, what are examples of
platforms that flush globalls vs per-page at the moment?  What is a good
larger value for the latter based on your testing?

Also I wonder if we should also split this tunable and the optional
global flush into a separate patch.  This is in this first patch
just make use of the asid,  and then another patch to add the threshold
for doing the full flush.

> +void local_flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
> +			   unsigned long end)
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

I think this should just call local_flush_tlb_page.

> +		start += PAGE_SIZE;
> +	}

And maybe use a for loop to short cut it a bit:

	for (; start < end; start += PAGE_SIZE)
		local_flush_tlb_page(start);

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

Same here, just with local_flush_tlb_kernel_page.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
