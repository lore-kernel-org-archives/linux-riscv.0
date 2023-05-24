Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42A8C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 05:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q7CeSjnFNK9IpTvxLorQFVvTwU6nj2V0wQ3LtaEuVkQ=; b=lenBJ4/5wC4ueV
	DDigOA1VYElj/KzMpm21H3GVWG0AdOxw9WRi1j3hR5Ak+AJs2orjWvMK8Jp5TjUFLWGcXnT/BHQUd
	fMeb1o2fmABqC3KnJSXmvRpZ+G5Bqzmyffxta+/5mMui18IfsvL/ORVlqJGEUrwL32SupNxHbExVF
	8jk7VNbMBD78KCTVseosrf0kNvpkN2W4G6YCbaEZy/GDSUD5t4w2vDdKBheqgATgTvtfpuTyYCV4h
	tP/L8uOXsfzfGQF3mePNZkbmGu9oTb2EkgTgbGrztvU1WuCIRi3dbrtCRZc9YONSqTWraBHswGLsz
	0SM14O6W1HHR0sO0VqhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1geW-00CMyt-1m;
	Wed, 24 May 2023 05:03:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1geU-00CMyQ-06
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 05:03:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 91394638D5;
	Wed, 24 May 2023 05:03:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5C1C433D2;
	Wed, 24 May 2023 05:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684904589;
	bh=LFVxfFwT67gFaNdLM975ekdnnjw9GiT6JhuN19MxRFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IQaMOUkGsS803kSJ7OEW66RhxhdwNAEpSpUeNwErbtoEPLw5wGLKALFnjVKymMn2/
	 MlM4a6bPPckxXBmo810IYOnPAY2SezZZAU19lbRT68ZHQIGmvGg2cV2Sa/suRyKQ/w
	 /n+toXz9Yl03D/w7IJa0pFkHaMDWL8iYb85nDozSFoTrfsSVVteKmNRwUQDIrA6To3
	 /NVmYv7H30+FXV088YQeVgYMHlXfO9itWSo2Nf5etrhh8+7/pSnMkL5ukXssIs8Z+/
	 dY+SJpaJNKsxWdZlpFflYHNOJ+2/XQLuZeBvfQykoj6OIs2kFPuY3ZaWyM9AtLrREP
	 a2k72aXibXXmg==
From: guoren@kernel.org
To: jszhang@kernel.org
Cc: aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	surenb@google.com,
	chenhuacai@kernel.org,
	Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH] riscv: mm: try VMA lock-based page fault handling first
Date: Wed, 24 May 2023 01:02:59 -0400
Message-Id: <20230524050259.104358-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230523165942.2630-1-jszhang@kernel.org>
References: <20230523165942.2630-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_220310_163320_941ADD59 
X-CRM114-Status: GOOD (  22.09  )
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

> Attempt VMA lock-based page fault handling first, and fall back to the
> existing mmap_lock-based handling if that fails.
> 
> A simple running the ebizzy benchmark on Lichee Pi 4A shows that
> PER_VMA_LOCK can improve the ebizzy benchmark by about 32.68%. In
Good improvement, I think VMA lock is worth to support in riscv.

Please give more details about ebizzy, Is it 
https://github.com/linux-test-project/ltp/blob/master/utils/benchmark/ebizzy-0.3/ebizzy.c
?

> theory, the more CPUs, the bigger improvement, but I don't have any
> HW platform which has more than 4 CPUs.
> 
> This is the riscv variant of "x86/mm: try VMA lock-based page fault
> handling first".
>

How about add Link tag here:
Link: https://lwn.net/Articles/906852/

> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
> Any performance numbers are welcome! Especially the numbers on HW
> platforms with 8 or more CPUs.
> 
>  arch/riscv/Kconfig    |  1 +
>  arch/riscv/mm/fault.c | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 62e84fee2cfd..b958f67f9a12 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -42,6 +42,7 @@ config RISCV
>  	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
>  	select ARCH_SUPPORTS_HUGETLBFS if MMU
>  	select ARCH_SUPPORTS_PAGE_TABLE_CHECK if MMU
> +	select ARCH_SUPPORTS_PER_VMA_LOCK if MMU
>  	select ARCH_USE_MEMTEST
>  	select ARCH_USE_QUEUED_RWLOCKS
>  	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 8685f85a7474..eccdddf26f4b 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -286,6 +286,36 @@ void handle_page_fault(struct pt_regs *regs)
>  		flags |= FAULT_FLAG_WRITE;
>  	else if (cause == EXC_INST_PAGE_FAULT)
>  		flags |= FAULT_FLAG_INSTRUCTION;
> +#ifdef CONFIG_PER_VMA_LOCK
> +	if (!(flags & FAULT_FLAG_USER))
> +		goto lock_mmap;
> +
> +	vma = lock_vma_under_rcu(mm, addr);
> +	if (!vma)
> +		goto lock_mmap;
> +
> +	if (unlikely(access_error(cause, vma))) {
> +		vma_end_read(vma);
> +		goto lock_mmap;
> +	}
> +
> +	fault = handle_mm_fault(vma, addr, flags | FAULT_FLAG_VMA_LOCK, regs);
> +	vma_end_read(vma);
> +
> +	if (!(fault & VM_FAULT_RETRY)) {
> +		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
> +		goto done;
> +	}
> +	count_vm_vma_lock_event(VMA_LOCK_RETRY);
> +
> +	if (fault_signal_pending(fault, regs)) {
> +		if (!user_mode(regs))
> +			no_context(regs, addr);
> +		return;
> +	}
> +lock_mmap:
> +#endif /* CONFIG_PER_VMA_LOCK */
> +
>  retry:
>  	mmap_read_lock(mm);
>  	vma = find_vma(mm, addr);
> @@ -355,6 +385,9 @@ void handle_page_fault(struct pt_regs *regs)
>  
>  	mmap_read_unlock(mm);
>  
> +#ifdef CONFIG_PER_VMA_LOCK
> +done:
> +#endif
It's very close to cd7f176aea5f ("arm64/mm: try VMA lock-based page fault 
handling first"), and I didn't find any problem. So:

Reviewed-by: Guo Ren <guoren@kernel.org>

F.Y.I Huacai Chen, maybe he also would be interesting this new feature.


>  	if (unlikely(fault & VM_FAULT_ERROR)) {
>  		tsk->thread.bad_cause = cause;
>  		mm_fault_error(regs, addr, fault);
> -- 
> 2.40.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
