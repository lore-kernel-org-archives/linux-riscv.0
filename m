Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF6CCC6B1A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 04:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SPnlqDdikMqaxQa9Blg72EH712+ceVN5jMPke72KVCo=; b=F3FBMXvbqrj3lR
	WIByGN0HuUzjEKZGMKI7H6T5xg/ZklpeUeeR4ThEHuhDdJ4/T9z2ggF4oD4fhR1UNJ4o6z8GUO+Xj
	BdeDbnVHLNcB4HPonXV+iscDmf/9fiX5Sa/9lV/M94RtmHsLCPI/8WpQ2JsdLLegoXsaDOc5XjomQ
	wL8H0xy2VNwaU/qpIIc8uKPCjGn82hV1WuYW0Qqgm5Wz3rW+ozhc3UOlJnYCjgjJdcf7guOKoNdp5
	gSYIP4yhAJT6VSqEOR/On47iNhyuIIkJP00bdajiSfvJuQVln8SVxLYIDI3R3G59lKJAugNk/XScs
	gCmTRCicggloUqXb+rWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGqwM-0000000EWaI-1Ih8;
	Wed, 14 Oct 2026 04:50:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGqwK-0000000EWa7-3AWq
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 04:50:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D138760213;
	Wed, 14 Oct 2026 04:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 686D01F000FF;
	Wed, 14 Oct 2026 04:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791953407;
	bh=cl47tcviVDpqqzgHdWKVjrgzkSuGWKUJT78Tht8dJ3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QjI5wdcl2w+jbkUo6EGj6OMqbxNrdS9hVOWqJ/BV0wDXujaCSUf2owcBOTvFsiMel
	 JLoSHYjm8x8WoD4vsM19IATLN2tqqJMmT3ETDZkEgIFVtKs/2CE6E9jvqHpUjBvErg
	 SjkghPgK6gr8JNxY1RILRJUvHZMVs6jXpIL65/DHwyQ/g/N1QYe9Nz8hYEMxX0J7NM
	 RuhVYDEUJYyvz7aljgX74uB+Hn73J7hzXJaYAFBIK5lVrcO4yavFE76Wd+ePkwmCSq
	 m/Rv4UhICmB24epXXWUQYswhfz+/WTmFX9TIOOb6h6WNnXA4uNNQtrevExXUBtAg95
	 6RMitQSvt6hFg==
Date: Wed, 14 Oct 2026 12:30:06 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] riscv: Fix icache flush being skipped for a second mm
 mapping an exec folio
Message-ID: <as8FTtH7yzeKCpE7@xhacker>
References: <20261009221957.760606-1-nickolai@csail.mit.edu>
 <20261010155110.764010-1-nickolai@csail.mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261010155110.764010-1-nickolai@csail.mit.edu>
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

On Sat, Oct 10, 2026 at 11:51:10AM -0400, Nickolai Zeldovich wrote:
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
> 
> Reproducer:
> 
>   /* Build with the kernel's nolibc (after "make headers_install"):
>    *   clang --target=riscv64-linux-gnu -Os -static -nostdlib -nostdinc \
>    *     -I tools/include/nolibc -I usr/include -include nolibc.h \
>    *     -o icache_repro repro.c
>    * Usage: ./icache_repro <file> <hartA> <hartB> [iterations]
>    */
>   #define N 1000    /* li a0,0; N x addi a0,a0,v; ret: returns N*v */
>   static unsigned int text[N + 2];
>   static int fd;
> 
>   static void write_text(unsigned int v)
>   {
>       int i;
> 
>       text[0] = 0x00000513;
>       for (i = 1; i <= N; i++)
>           text[i] = 0x00050513 | (v << 20);
>       text[N + 1] = 0x00008067;
>       lseek(fd, 0, SEEK_SET);
>       write(fd, text, sizeof(text));
>   }
> 
>   static long run_text(void)
>   {
>       long (*f)(void) = mmap(NULL, 4096, PROT_READ | PROT_EXEC,
>                      MAP_PRIVATE, fd, 0);
>       long r = f();
> 
>       munmap(f, 4096);
>       return r;
>   }
> 
>   static void pin(const char *cpu)
>   {
>       unsigned long mask = 1UL << atoi(cpu);
> 
>       syscall(__NR_sched_setaffinity, 0, sizeof(mask), &mask);
>   }
> 
>   int main(int argc, char **argv)
>   {
>       int p2c[2], c2p[2], i, stale = 0;
>       int iters = argc > 4 ? atoi(argv[4]) : 50;
>       long got;
>       char c;
> 
>       fd = open(argv[1], O_RDWR | O_CREAT | O_TRUNC, 0755);
>       pipe(p2c);
>       pipe(c2p);
>       pin(argv[2]);
>       if (!fork()) {            /* child = mm B on hart B */
>           close(p2c[1]);
>           pin(argv[3]);
>           while (read(p2c[0], &c, 1) == 1) {
>               got = run_text();
>               write(c2p[1], &got, sizeof(got));
>           }
>           _exit(0);
>       }
>       for (i = 0; i < iters; i++) {    /* parent = mm A on hart A */
>           write_text(1);
>           write(p2c[1], "", 1);    /* B runs T1: primes hart B */
>           read(c2p[0], &got, sizeof(got));
>           write_text(2);
>           run_text();        /* A runs T2: flushes hart A, sets the bit */
>           write(p2c[1], "", 1);    /* B runs again: no flush on hart B */
>           read(c2p[0], &got, sizeof(got));
>           stale += got != 2 * N;
>       }
>       close(p2c[1]);
>       wait(NULL);
>       printf("%d of %d iterations stale\n", stale, iters);
>       return !!stale;
>   }
> 
> The parent (mm A, hart A) and the child (mm B, hart B) share a file.
> Each iteration: A writes text T1, B maps it executable and runs it
> (priming hart B's icache with T1) and unmaps it; A writes text T2 and
> maps and runs it (per-mm flush of hart A only, bit set); B maps and
> runs it again, with no flush on hart B, and executes T1. On a StarFive
> JH7110 (VisionFive 2, non-coherent icache) running v7.3-rc6, 148 of
> 150 iterations over three hart pairs (50 each on harts 0/3, 0/2 and
> 1/3) execute stale instructions.
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
> hart for the whole boot plus the 150 iterations, i.e. the IPI savings
> of the per-mm flush are kept.
> 
> The generation is kept per mm as an atomic64_t so that the field is
> read and written atomically on 32-bit as well, and the whole mechanism
> is compiled only with CONFIG_SMP and CONFIG_MMU: on a single hart
> flush_icache_mm() is the local flush and the bug cannot occur, and
> without an MMU there is no flush_icache_pte() and no second mapping of
> a written page to begin with.
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
> 
> Notes:
>     v3: compile the generation logic only with CONFIG_SMP (on UP the bug cannot
>         occur and flush_icache_mm() is the local flush) and CONFIG_MMU (the only
>         user is flush_icache_pte()); keep the per-mm
>         generation in an atomic64_t so it is read and written atomically on
>         32-bit too; add the reproducer to the commit message (Jisheng Zhang).
>     v2: move icache_gen out of the CONFIG_SMP block of mm_context_t; v1 did
>         not build with CONFIG_SMP=n (kernel test robot).
> 
>  arch/riscv/include/asm/mmu.h         |  4 +++
>  arch/riscv/include/asm/mmu_context.h |  3 +++
>  arch/riscv/mm/cacheflush.c           | 38 ++++++++++++++++++++++++++++
>  3 files changed, 45 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
> index cf8e6eac77d5..4eacf06f7d2a 100644
> --- a/arch/riscv/include/asm/mmu.h
> +++ b/arch/riscv/include/asm/mmu.h
> @@ -21,6 +21,10 @@ typedef struct {
>  	cpumask_t icache_stale_mask;
>  	/* Force local icache flush on all migrations. */
>  	bool force_icache_flush;
> +#ifdef CONFIG_MMU
> +	/* icache_folio_gen at this mm's last flush in flush_icache_pte(). */
> +	atomic64_t icache_gen;
> +#endif
>  #endif
>  #ifdef CONFIG_BINFMT_ELF_FDPIC
>  	unsigned long exec_fdpic_loadmap;
> diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
> index dbf27a78df6c..909404fb250b 100644
> --- a/arch/riscv/include/asm/mmu_context.h
> +++ b/arch/riscv/include/asm/mmu_context.h
> @@ -32,6 +32,9 @@ static inline int init_new_context(struct task_struct *tsk,
>  {
>  #ifdef CONFIG_MMU
>  	atomic_long_set(&mm->context.id, 0);
> +#ifdef CONFIG_SMP
> +	atomic64_set(&mm->context.icache_gen, 0);
> +#endif
>  #endif
>  	if (IS_ENABLED(CONFIG_RISCV_ISA_SUPM))
>  		clear_bit(MM_CONTEXT_LOCK_PMLEN, &mm->context.flags);
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index f8ead7cb7c7d..00bfdb7c487c 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -97,13 +97,51 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
>  #endif /* CONFIG_SMP */
>  
>  #ifdef CONFIG_MMU
> +#ifdef CONFIG_SMP
> +/*
> + * PG_dcache_clean is folio-wide, but flush_icache_mm() only reaches the
> + * harts of one mm.  Count the flushes that set the bit; an mm whose
> + * generation lags cannot trust a bit set since its own last flush, so it
> + * flushes its harts once before relying on it.
> + */
> +static atomic64_t icache_folio_gen = ATOMIC64_INIT(0);
> +
> +static u64 icache_gen_bump(void)
> +{
> +	return atomic64_inc_return(&icache_folio_gen);
> +}
> +
> +static bool icache_gen_stale(struct mm_struct *mm, u64 *gen)
> +{
> +	/* Pairs with the fully ordered atomic64_inc_return() in icache_gen_bump(). */
> +	smp_rmb();
> +	*gen = atomic64_read(&icache_folio_gen);
> +	return atomic64_read(&mm->context.icache_gen) != *gen;

Now the patch looks better. I only have one concern: RV32 doesn't have
native atomic64, so falls back to generic atomic64 implementation which
disables local irq, takes spin lock, then does the operation, unlock,
restore local irq, so I'm not sure whether overhead for RV32 is too
heavy or not. However, I have no other better solution for RV32.

> +}
> +
> +static void icache_gen_set(struct mm_struct *mm, u64 gen)
> +{
> +	atomic64_set(&mm->context.icache_gen, gen);
> +}
> +#else
> +static u64 icache_gen_bump(void) { return 0; }
> +static bool icache_gen_stale(struct mm_struct *mm, u64 *gen) { return false; }
> +static void icache_gen_set(struct mm_struct *mm, u64 gen) { }
> +#endif
> +
>  void flush_icache_pte(struct mm_struct *mm, pte_t pte)
>  {
>  	struct folio *folio = page_folio(pte_page(pte));
> +	u64 gen;
>  
>  	if (!test_bit(PG_dcache_clean, &folio->flags.f)) {
> +		gen = icache_gen_bump();
>  		flush_icache_mm(mm, false);
> +		icache_gen_set(mm, gen);
>  		set_bit(PG_dcache_clean, &folio->flags.f);
> +	} else if (unlikely(icache_gen_stale(mm, &gen))) {
> +		flush_icache_mm(mm, false);
> +		icache_gen_set(mm, gen);
>  	}
>  }
>  #endif /* CONFIG_MMU */
> 
> base-commit: af32da41b0327b9c6a37856ba82b6760d6c8d10e
> -- 
> 2.55.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
