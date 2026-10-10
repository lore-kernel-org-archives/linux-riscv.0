Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B492CA9EBE
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Oct 2026 12:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=liickCSEMjJkcG4vHVUueNqu0S97zS8lDauVWIp+9pg=; b=aO2oZ1lu1ID3sn
	ypK4okYeO5k0NpU0J+sRfx3XKYh7XF4daj8ofiIhM9qQgZumhzHKuWLC8j9kcX0FDUWT+1hfcDlfW
	gdLJ+hxwCYZ5/108Y9D7xCV6xPzlo7LQ2Klf5h6UUxfmg/S2GkPCxgGJbc2si4v0tjMbKEbTc4iYT
	Artf+I/iA6WbjQt6xaVRpB23h8IwBBhI4e53y4C4n22WLuuoHSNnS6+j2ZRI5N3l3glhoMXg+aeyy
	volv/TqsgfSgPvD5g0U2t6GYdz1PmguU9ojbfz1KkSqCYiLQL0LRAIvK2IBpLHU4ewZzLYYDbTM+U
	HkVi9itgXkyI8+k+nAPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVpB-00000007zot-3Jzk;
	Sat, 10 Oct 2026 12:05:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVp9-00000007zoj-37wt
	for linux-riscv@lists.infradead.org;
	Sat, 10 Oct 2026 12:05:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C7E3560204;
	Sat, 10 Oct 2026 12:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF411F000FF;
	Sat, 10 Oct 2026 12:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791633910;
	bh=kS+nMjnSb1CQO1si9eIk4JdEe+ZVXEFm+JCmyhtB+vU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LgAjdzX5yDgTPYrZXpYehZ3TNSyHlYeedIsxOoDbwuARrAYeiP1ZCEn24G3iQ1TP8
	 m7wqiCKboxiyWSCP/4rW0VhB1JJOYzSDie/PrCe/nS8R2Z/hGw9svQhntXYlR/Ml4n
	 Wa112y/p3HT8YQoPeqzuB8HQrqYGKA8SzfnYRTvti/XIBoWzY2ME9Pi+nMETMi8Fso
	 6dLHP/7SJlePSVnenIE+kKRVIfuO+GQJnsfcjdZeixI7UXidM8xe09b/8kRb9/F1MM
	 oPpskZZ7Tzyy8tErMqpYbMsKj3bJuuGhf9nXq5m61SuPCJsTF5C/fWc8059bLprRph
	 Cp3aHlD6498Cw==
Date: Sat, 10 Oct 2026 19:45:08 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] riscv: Fix icache flush being skipped for a second mm
 mapping an exec folio
Message-ID: <asolRA3vLbKEZ1Wm@xhacker>
References: <20261009221957.760606-1-nickolai@csail.mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261009221957.760606-1-nickolai@csail.mit.edu>
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

On Fri, Oct 09, 2026 at 06:19:57PM -0400, Nickolai Zeldovich wrote:
> Since commit 01261e24cfab ("riscv: Only flush the mm icache when
> setting an exec pte"), flush_icache_pte() flushes only the icache of
> the harts that run the faulting mm (with a deferred fence.i for the
> harts it migrates to later), but it still sets the folio-wide
> PG_dcache_clean bit. The bit is then read as "no hart holds stale
> instructions for this folio", which a per-mm flush does not establish.
> 
> So when a folio that was written through the page cache is mapped
> executable first by mm A on hart X and then by a different mm B on a
> hart Y outside A's cpumask, B gets no flush on Y and executes whatever
> Y's icache still holds for those physical lines, e.g. the page's
> previous contents. Before that commit, flush_icache_all() covered this
> case.

Good catch!

> 
> Reproducer: a parent pinned to hart 0 and a child pinned to hart 3
> share a file. The parent writes text "T1" with write(2), the child
> mmap()s it PROT_EXEC and runs it (priming hart 3's icache with T1),
> then unmaps it. The parent writes text "T2", maps it executable and
> runs it (per-mm flush of hart 0 only, bit set). The child maps the
> file executable again and runs it: no flush on hart 3, and the child
> executes T1. On a StarFive JH7110 (VisionFive 2, non-coherent icache)
> running v7.3-rc6, 149 of 150 iterations over three hart pairs execute
> stale instructions. A control run that executes fence.i in the child
> before the last mapping gets 0 of 50.

I guess the reproducer is just a simple c program.
It would be helpful if you can paste the reproducer code into the commit
msg as well.
> 
> Keep the per-mm flush and make the skip decision per mm instead:
> count the flushes that set the bit in a global generation, and let
> every mm remember the generation of its own last flush taken in
> flush_icache_pte(). An mm whose generation lags cannot trust any bit
> set since, so it flushes its own harts once (local fence.i, IPIs only
> to the harts currently running it, deferred fence.i for the rest) and
> catches up. No global flush is issued, nothing happens while no new
> executable folio is written, and the cost is bounded by one
> flush_icache_mm() per mm per generation bump.
> 
> With the fix the reproducer executes 0 of 150 stale iterations on the
> same board. The function-call IPI counters stay at a few hundred per
> hart for the whole boot plus 200 iterations, i.e. the IPI savings of
> the per-mm flush are kept.
> 
> Tested on the JH7110 with v7.3-rc6 and this patch; not tested on
> 32-bit. The bug does not reproduce under QEMU TCG, which invalidates
> translated code on page writes.
> 
> Fixes: 01261e24cfab ("riscv: Only flush the mm icache when setting an exec pte")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
> ---
>  arch/riscv/include/asm/mmu.h         |  2 ++
>  arch/riscv/include/asm/mmu_context.h |  1 +
>  arch/riscv/mm/cacheflush.c           | 20 ++++++++++++++++++++
>  3 files changed, 23 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
> index cf8e6eac77d5..e0e7a310151c 100644
> --- a/arch/riscv/include/asm/mmu.h
> +++ b/arch/riscv/include/asm/mmu.h
> @@ -21,6 +21,8 @@ typedef struct {
>  	cpumask_t icache_stale_mask;
>  	/* Force local icache flush on all migrations. */
>  	bool force_icache_flush;
> +	/* icache_folio_gen at this mm's last flush in flush_icache_pte(). */
> +	u64 icache_gen;
>  #endif
>  #ifdef CONFIG_BINFMT_ELF_FDPIC
>  	unsigned long exec_fdpic_loadmap;
> diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
> index dbf27a78df6c..cc0f7f65ec8b 100644
> --- a/arch/riscv/include/asm/mmu_context.h
> +++ b/arch/riscv/include/asm/mmu_context.h
> @@ -32,6 +32,7 @@ static inline int init_new_context(struct task_struct *tsk,
>  {
>  #ifdef CONFIG_MMU
>  	atomic_long_set(&mm->context.id, 0);
> +	mm->context.icache_gen = 0;
>  #endif
>  	if (IS_ENABLED(CONFIG_RISCV_ISA_SUPM))
>  		clear_bit(MM_CONTEXT_LOCK_PMLEN, &mm->context.flags);
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index f8ead7cb7c7d..880c210dbfec 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -97,13 +97,33 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
>  #endif /* CONFIG_SMP */
>  
>  #ifdef CONFIG_MMU
> +/*
> + * PG_dcache_clean is folio-wide, but flush_icache_mm() only reaches the
> + * harts of one mm.  Count the flushes that set the bit; an mm whose
> + * generation lags cannot trust a bit set since its own last flush, so it
> + * flushes its harts once before relying on it.
> + */
> +static atomic64_t icache_folio_gen = ATOMIC64_INIT(0);
> +
>  void flush_icache_pte(struct mm_struct *mm, pte_t pte)
>  {
>  	struct folio *folio = page_folio(pte_page(pte));
> +	u64 gen;
>  
>  	if (!test_bit(PG_dcache_clean, &folio->flags.f)) {
> +		gen = atomic64_inc_return(&icache_folio_gen);

Per the commit msg, the bug can only be reproduced on SMP
platforms, so this fix unconditionally brings non-necessary
overhead to UP.

>  		flush_icache_mm(mm, false);
> +		WRITE_ONCE(mm->context.icache_gen, gen);

Since icache_gen is u64, this is not atomic I guess. I'm
not sure whether this is safe on RV32.

>  		set_bit(PG_dcache_clean, &folio->flags.f);
> +		return;
> +	}
> +
> +	/* Pairs with the fully ordered atomic64_inc_return() above. */
> +	smp_rmb();
> +	gen = atomic64_read(&icache_folio_gen);
> +	if (unlikely(READ_ONCE(mm->context.icache_gen) != gen)) {

see above, READ_ONCE a u64 on RV32 isn't atomic operation, is
there any possiblity there's a race between WRITE_ONCE and READ_ONCE?
> +		flush_icache_mm(mm, false);
> +		WRITE_ONCE(mm->context.icache_gen, gen);
>  	}
>  }
>  #endif /* CONFIG_MMU */
> -- 
> 2.56.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
