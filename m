Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D86C4321E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 23:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=THuH+WvCi1R1j6RlYI+WqpTUZ/KuCf5tZlI+mPtCpLs=; b=sDYjPOraVklKKG
	YyoZ1gBo9l7oiHn9VYRCv3Wufmb9cTeX75JzqTANKGaoh21GykYGjV71exIpmuuIn2tXlIjJ8ptQm
	GvxlgFrWrEOGfP1/iJjsg25XhuwPom3cFI/j2KClo3l6jNi/+qNdFl5w02tXsmC4sE48D1Ho6w56i
	065Gm/PlCgz4wm4BF1DZ6KwLMktNqDcpjW5/38kocgt9+I1aVdrMCaCL59ik5Gx7ZwJw8ki/BL19S
	yatlKrf3fwZ4CAgIuXVK6RYxkoEyyXDunaFujc0NjkReR4NK/0d+8xUbheZbRDcozKGZjqSgyixpJ
	+2pQNSVxmeK8mSlW67+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p09we-00Bctj-Ru; Tue, 29 Nov 2022 23:23:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p09wT-00BcrO-SC; Tue, 29 Nov 2022 23:23:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 17AB86193C;
	Tue, 29 Nov 2022 23:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A426C433C1;
	Tue, 29 Nov 2022 23:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1669764188;
	bh=0fdNX9QhucmvGYsJWGOg9jQeFn+znvsZsA3GeeD73CM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oBPkt6FJJWfvsgtGvs6SjxHs/2kYEDb40oxeDjWBuNGLbmZH0jVfpuraJ/TrV9+F4
	 hqoAFA2+L/RlQ1wICENr1s9GsmPkIDc9zBUGenqCJRgb4PHm3qYEnMhYXx+xLEakLb
	 I+GNCiUTX4XFglOckyjmCJUxKp2DIu33twwtFObY=
Date: Tue, 29 Nov 2022 15:23:06 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
 <x86@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
 <anshuman.khandual@arm.com>, <linux-doc@vger.kernel.org>, <corbet@lwn.net>,
 <peterz@infradead.org>, <arnd@arndb.de>, <punit.agrawal@bytedance.com>,
 <linux-kernel@vger.kernel.org>, <darren@os.amperecomputing.com>,
 <yangyicong@hisilicon.com>, <huzhanyuan@oppo.com>, <lipeifeng@oppo.com>,
 <zhangshiming@oppo.com>, <guojian@oppo.com>, <realmz6@gmail.com>,
 <linux-mips@vger.kernel.org>, <openrisc@lists.librecores.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
 <linux-s390@vger.kernel.org>, Barry Song <21cnbao@gmail.com>,
 <wangkefeng.wang@huawei.com>, <xhao@linux.alibaba.com>,
 <prime.zeng@hisilicon.com>, Anshuman Khandual
 <khandual@linux.vnet.ibm.com>, Barry Song <baohua@kernel.org>
Subject: Re: [PATCH v7 1/2] mm/tlbbatch: Introduce
 arch_tlbbatch_should_defer()
Message-Id: <20221129152306.54b6d439e2a0ca7ece1d1afa@linux-foundation.org>
In-Reply-To: <20221117082648.47526-2-yangyicong@huawei.com>
References: <20221117082648.47526-1-yangyicong@huawei.com>
	<20221117082648.47526-2-yangyicong@huawei.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_152310_022474_BB3068C2 
X-CRM114-Status: GOOD (  21.54  )
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

On Thu, 17 Nov 2022 16:26:47 +0800 Yicong Yang <yangyicong@huawei.com> wrote:

> From: Anshuman Khandual <khandual@linux.vnet.ibm.com>
> 
> The entire scheme of deferred TLB flush in reclaim path rests on the
> fact that the cost to refill TLB entries is less than flushing out
> individual entries by sending IPI to remote CPUs. But architecture
> can have different ways to evaluate that. Hence apart from checking
> TTU_BATCH_FLUSH in the TTU flags, rest of the decision should be
> architecture specific.
> 
> ...
>
> --- a/arch/x86/include/asm/tlbflush.h
> +++ b/arch/x86/include/asm/tlbflush.h
> @@ -240,6 +240,18 @@ static inline void flush_tlb_page(struct vm_area_struct *vma, unsigned long a)
>  	flush_tlb_mm_range(vma->vm_mm, a, a + PAGE_SIZE, PAGE_SHIFT, false);
>  }
>  
> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> +{
> +	bool should_defer = false;
> +
> +	/* If remote CPUs need to be flushed then defer batch the flush */
> +	if (cpumask_any_but(mm_cpumask(mm), get_cpu()) < nr_cpu_ids)
> +		should_defer = true;
> +	put_cpu();
> +
> +	return should_defer;
> +}
> +
>  static inline u64 inc_mm_tlb_gen(struct mm_struct *mm)
>  {
>  	/*
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 2ec925e5fa6a..a9ab10bc0144 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -685,17 +685,10 @@ static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable)
>   */
>  static bool should_defer_flush(struct mm_struct *mm, enum ttu_flags flags)
>  {
> -	bool should_defer = false;
> -
>  	if (!(flags & TTU_BATCH_FLUSH))
>  		return false;
>  
> -	/* If remote CPUs need to be flushed then defer batch the flush */
> -	if (cpumask_any_but(mm_cpumask(mm), get_cpu()) < nr_cpu_ids)
> -		should_defer = true;
> -	put_cpu();
> -
> -	return should_defer;
> +	return arch_tlbbatch_should_defer(mm);
>  }

I think this conversion could have been done better.

should_defer_flush() is compiled if
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH.  So the patch implicitly
assumes that only x86 implements
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH.  Presently true, but what
happens if sparc (for example) wants to set
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH?  Now sparc needs its private
version of arch_tlbbatch_should_defer(), even if that is identical to
x86's.

Wouldn't it be better to make arch_tlbbatch_should_defer() a __weak
function in rmap.c, or a static inline inside #ifndef
ARCH_HAS_ARCH_TLBBATCH_SHOULD_DEFER, or whatever technique best fits?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
