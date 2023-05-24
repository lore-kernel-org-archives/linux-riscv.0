Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B865C77B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 13:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tQQ7ZfuAcJqBAOQtAsbHvt6zfOPd9gkWA8VJoIDHq88=; b=BL1/BGg+bMM2Ir
	hpC2I2H6REaMf+Ds9Jh+j4lI/QnTgEIPwP8XB+7IHGFezTTuYhYnQFpwHhfng6c9eNsOGGDNQ34Jh
	4c6fyXjVV/Kke/RbI1UzzPP6Dm9PExlIwptUGtbE7UzO8K/g61aIHPEd+PHoQeH9ILZ0f4SmeOVaV
	j3C59pZMLaHPeCCIk+m+fj47cpewxQMPUu3h4r/LXZNZIw1wadxIxFf8djK3Q1b0ebRTZBR/4F74I
	bJJLjRkUey9pEk+th2tS3EJ8W695NvkLs4fj6x1LrtD9UDM9UpHZWO7J7Ils4ZCmIXuKW8UbcvLZr
	eeYTYKzA3auV+/PotBMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1oaV-00DZiB-2P;
	Wed, 24 May 2023 13:31:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1oaS-00DZhi-1x
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 13:31:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2FD4B63A88;
	Wed, 24 May 2023 13:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1260AC433EF;
	Wed, 24 May 2023 13:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684935091;
	bh=lApfRwXovf6sShLKp9WZpEJ/IAEUciPlv4wUIxxP2/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vIU5Ng0mQk+TKKRD6h/50iWmAKbEJq0Gk6ioHa9KHbfNtBYxQim69BDbI0eSGFob/
	 DlsGOeg99HX0bG2rCo52VOZ1mrliej35RXNTXeaPFQr1wdbwx+ZlTDpjsBWshSXfvx
	 21eSpgO5gRGuBzddiZ0iEV48ODxWty0JI5VQkeXJaoSVG/iWGJBoGzrvoHL5pGsPrx
	 F/ZWp54Hct6b8dVcS/2n4hxK82dsznitExvbs3mVToMyOiZFhLDbrjWsX+wuk124My
	 hit8mRkr//kXJelZLkp/JQP/CHC71LZ9S66alFh1D6XEu1wG2ap8RXe1oVLwHabchD
	 6fLl2N9Ck3T7g==
Date: Wed, 24 May 2023 21:20:19 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: guoren@kernel.org
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, surenb@google.com, chenhuacai@kernel.org
Subject: Re: [PATCH] riscv: mm: try VMA lock-based page fault handling first
Message-ID: <ZG4PExps5lGvo7nW@xhacker>
References: <20230523165942.2630-1-jszhang@kernel.org>
 <20230524050259.104358-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230524050259.104358-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_063132_722940_4150B498 
X-CRM114-Status: GOOD (  27.26  )
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

On Wed, May 24, 2023 at 01:02:59AM -0400, guoren@kernel.org wrote:
> > Attempt VMA lock-based page fault handling first, and fall back to the
> > existing mmap_lock-based handling if that fails.
> > 
> > A simple running the ebizzy benchmark on Lichee Pi 4A shows that
> > PER_VMA_LOCK can improve the ebizzy benchmark by about 32.68%. In
> Good improvement, I think VMA lock is worth to support in riscv.
> 
> Please give more details about ebizzy, Is it 
> https://github.com/linux-test-project/ltp/blob/master/utils/benchmark/ebizzy-0.3/ebizzy.c
> ?

yeah it's one of ltp benchmark utils.

> 
> > theory, the more CPUs, the bigger improvement, but I don't have any
> > HW platform which has more than 4 CPUs.
> > 
> > This is the riscv variant of "x86/mm: try VMA lock-based page fault
> > handling first".
> >
> 
> How about add Link tag here:
> Link: https://lwn.net/Articles/906852/
> 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> > Any performance numbers are welcome! Especially the numbers on HW
> > platforms with 8 or more CPUs.
> > 
> >  arch/riscv/Kconfig    |  1 +
> >  arch/riscv/mm/fault.c | 33 +++++++++++++++++++++++++++++++++
> >  2 files changed, 34 insertions(+)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 62e84fee2cfd..b958f67f9a12 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -42,6 +42,7 @@ config RISCV
> >  	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
> >  	select ARCH_SUPPORTS_HUGETLBFS if MMU
> >  	select ARCH_SUPPORTS_PAGE_TABLE_CHECK if MMU
> > +	select ARCH_SUPPORTS_PER_VMA_LOCK if MMU
> >  	select ARCH_USE_MEMTEST
> >  	select ARCH_USE_QUEUED_RWLOCKS
> >  	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
> > diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> > index 8685f85a7474..eccdddf26f4b 100644
> > --- a/arch/riscv/mm/fault.c
> > +++ b/arch/riscv/mm/fault.c
> > @@ -286,6 +286,36 @@ void handle_page_fault(struct pt_regs *regs)
> >  		flags |= FAULT_FLAG_WRITE;
> >  	else if (cause == EXC_INST_PAGE_FAULT)
> >  		flags |= FAULT_FLAG_INSTRUCTION;
> > +#ifdef CONFIG_PER_VMA_LOCK
> > +	if (!(flags & FAULT_FLAG_USER))
> > +		goto lock_mmap;
> > +
> > +	vma = lock_vma_under_rcu(mm, addr);
> > +	if (!vma)
> > +		goto lock_mmap;
> > +
> > +	if (unlikely(access_error(cause, vma))) {
> > +		vma_end_read(vma);
> > +		goto lock_mmap;
> > +	}
> > +
> > +	fault = handle_mm_fault(vma, addr, flags | FAULT_FLAG_VMA_LOCK, regs);
> > +	vma_end_read(vma);
> > +
> > +	if (!(fault & VM_FAULT_RETRY)) {
> > +		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
> > +		goto done;
> > +	}
> > +	count_vm_vma_lock_event(VMA_LOCK_RETRY);
> > +
> > +	if (fault_signal_pending(fault, regs)) {
> > +		if (!user_mode(regs))
> > +			no_context(regs, addr);
> > +		return;
> > +	}
> > +lock_mmap:
> > +#endif /* CONFIG_PER_VMA_LOCK */
> > +
> >  retry:
> >  	mmap_read_lock(mm);
> >  	vma = find_vma(mm, addr);
> > @@ -355,6 +385,9 @@ void handle_page_fault(struct pt_regs *regs)
> >  
> >  	mmap_read_unlock(mm);
> >  
> > +#ifdef CONFIG_PER_VMA_LOCK
> > +done:
> > +#endif
> It's very close to cd7f176aea5f ("arm64/mm: try VMA lock-based page fault 
> handling first"), and I didn't find any problem. So:
> 
> Reviewed-by: Guo Ren <guoren@kernel.org>
> 
> F.Y.I Huacai Chen, maybe he also would be interesting this new feature.
> 
> 
> >  	if (unlikely(fault & VM_FAULT_ERROR)) {
> >  		tsk->thread.bad_cause = cause;
> >  		mm_fault_error(regs, addr, fault);
> > -- 
> > 2.40.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
