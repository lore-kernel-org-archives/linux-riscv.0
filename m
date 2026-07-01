Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68571C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 15:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yW6HnqIV57Gb6+/xfT2PdY6wmjxjYGc68KQwiJkOkDI=; b=oLmDfOLZzl0Zdq
	Te6+wjjpIpcgAg/Vjn0xB4LVsBu4y8YxWFXDCn3Q3gEaudp6pjN6IboIm2ePmDV58XQW9eR7evBo9
	PkWuyQ1vta6xqNo0btXmjLnRdAXOvkD0+TbifDaFU+Dj/J6zkSGzwBoWxjZekT47InwDvz/0pWd0O
	gkmBzHefVm2yo5CzTbEFo4xL+4gGjnJddfQhbM8rOZ/sUBdKeeGiExNwHrmK+uqjGY5bEiVWg4SIY
	Xkxtw4Ij51daoyEg7g7OA8nHi+QseurCsaBMabvZiD0KVV0woua+ov2pLl7mFT4ADNh3qw2kL+Lut
	BshayKTPAUEmivguj8Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexKm-00000002SDm-2d4d;
	Wed, 01 Jul 2026 15:58:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexKk-00000002SDK-3OxF
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 15:58:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B07F40DAA;
	Wed,  1 Jul 2026 15:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A22E91F000E9;
	Wed,  1 Jul 2026 15:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782921522;
	bh=aAG9TrNisIZHuthY+yScjOyw/gVbaJTA4J/CXY2KVrQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SAY5qnlMHlDYmH27OFf3df2mtHF/dD2ijs5M+wlz1whCzEeztcOMpyvZw67zNRpNF
	 jNCKBE/Sl6yiU7CtG+guxWzwZjDiasyzNnFxcRe0ocyLOPXSpQn6i3JqZaqASCfw5u
	 kS6TlEn7tkoYy5KpDNAJBnn2F42vK+QNifAgB4wyjn6eVkeSIsQ3Q208zv9NR7ytUD
	 9ndXe5s+C4j8v6+nb+/MrJtXvjCSGKDP8mYn9FvzrVGm8GFIwzz0WCLZGM+BpJznOd
	 9Tz6IiF92wBjeAtoX3fmtOSTUWjOfXjL9XArJvtVm447sHAaycTDaaFipLWNROGuIy
	 jSnh++2YuRX/g==
Message-ID: <560ce7db-1afb-421a-bac3-3710f8f1966e@kernel.org>
Date: Wed, 1 Jul 2026 17:58:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: pgtable: free kernel page tables via RCU to fix
 ptdump UAF
To: David Carlier <devnexen@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Dave Hansen <dave.hansen@linux.intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>,
 syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260630041012.5975-1-devnexen@gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260630041012.5975-1-devnexen@gmail.com>
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

On 6/30/26 06:10, David Carlier wrote:
> ptdump_walk_pgd() walks the kernel page tables under get_online_mems() and
> mmap_write_lock(&init_mm). Neither lock stops vmalloc from freeing a kernel
> PTE page underneath the walk.

I guess other directmap modifications would similarly be problematic (assuming
we'd collapse into PMDs for reducing directmap fragmentation, I think some
patches are on the list for that).

Not sure if all of these would go through pagetable_free_kernel(), given that we
have memblock-allocated page tables that are freed entirely differently.

> 
> When vmap_try_huge_pmd() promotes a range to a huge PMD it collapses the
> existing PTE table and frees it via pmd_free_pte_page(). On x86, riscv and
> powerpc this runs without the init_mm mmap lock; only arm64 takes it, and not
> on the block-split path. So ptdump can dereference a just-freed PTE page,
> which is the use after free syzbot hit in ptdump_pte_entry().
> 
> The race is not new. ptdump walks the whole kernel address space, including
> ranges other code is actively mapping, so it reads page tables it does not
> own. 5ba2f0a15564 ("mm: introduce deferred freeing for kernel page tables")
> only widened the window; the Fixes tag points there for that reason.
> 
> Every other walker works on a range it owns and is the only one mutating it:
> set_memory() on arm64/riscv/loongarch, the arm64 block-split path, the
> openrisc DMA path and the hugetlb_vmemmap remap. Nothing frees those ranges
> concurrently, so they cannot race and do not need RCU. ptdump is the only
> walker that traverses ranges it does not own.
> 
> Defer the free by an RCU grace period. pagetable_free_kernel() now frees via
> call_rcu() in both the async and non-async configs. The async path still
> flushes the TLB first, then queues the per-page RCU free. The page stays
> valid until any walk that may have observed it drops its RCU read lock.
> 
> On the read side ptdump_walk_pgd() takes the RCU read lock around the walk,
> and walk_page_range_debug() asserts it with RCU_LOCKDEP_WARN() for the
> init_mm case rather than taking it, matching pagewalk.c convention. A walker
> either sees the cleared PMD and skips, or keeps the page alive until it drops
> the lock. The owned-range walkers are unchanged.
> 
> ptdump callbacks now run under RCU, so they must not sleep. The arch
> note_page() and effective_prot() callbacks only format into the preallocated
> seq_file buffer, and the walker does not call cond_resched(); the only
> GFP_KERNEL marker setup runs before the walk.
> 
> Fixes: 5ba2f0a15564 ("mm: introduce deferred freeing for kernel page tables")
> Reported-by: syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/6a287988.39669fcc.33b062.00a0.GAE@google.com/T/
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
> v5: reframe changelog around the pre-existing race and range ownership;
>     correct the mmap-lock description (arm64 is the exception, not x86);
>     move rcu_read_lock() into ptdump_walk_pgd() and assert it in
>     walk_page_range_debug(); drop walk_kernel_page_table_range_rcu(); fix the
>     pgtable-generic.c comment; document the no-sleep audit of the callbacks.
> v4: defer the free in both the async and non async configs, not just
>     the async one. Move the walk under a named
>     walk_kernel_page_table_range_rcu() helper instead of open coding
>     rcu_read_lock() in walk_page_range_debug().
> v3: take rcu_read_lock() in the init_mm branch of
>     walk_page_range_debug() rather than inside the lockless walker,
>     which the arm64 split paths also use with GFP_PGTABLE_KERNEL and
>     can sleep.
> v2: use call_rcu() instead of synchronize_rcu().
> ---
>  include/linux/mm.h   |  7 -------
>  mm/pagewalk.c        | 14 +++++++++-----
>  mm/pgtable-generic.c | 22 +++++++++++++++++++++-
>  mm/ptdump.c          |  2 ++
>  4 files changed, 32 insertions(+), 13 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 485df9c2dbdd..79408a17a1b0 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3695,14 +3695,7 @@ static inline void __pagetable_free(struct ptdesc *pt)
>  	__free_pages(page, compound_order(page));
>  }
>  
> -#ifdef CONFIG_ASYNC_KERNEL_PGTABLE_FREE
>  void pagetable_free_kernel(struct ptdesc *pt);
> -#else
> -static inline void pagetable_free_kernel(struct ptdesc *pt)
> -{
> -	__pagetable_free(pt);
> -}
> -#endif

Okay, now we always incur a function call overhead. I guess it will be fine,
just saying.

>  /**
>   * pagetable_free - Free pagetables
>   * @pt:	The page table descriptor
> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
> index 3ae2586ff45b..c0be87580989 100644
> --- a/mm/pagewalk.c
> +++ b/mm/pagewalk.c
> @@ -620,7 +620,7 @@ int walk_page_range(struct mm_struct *mm, unsigned long start,
>   * Note: Be careful to walk the kernel pages tables, the caller may be need to
>   * take other effective approaches (mmap lock may be insufficient) to prevent
>   * the intermediate kernel page tables belonging to the specified address range
> - * from being freed (e.g. memory hot-remove).
> + * from being freed (e.g. memory hot-remove, vmap huge page promotion).
>   */
>  int walk_kernel_page_table_range(unsigned long start, unsigned long end,
>  		const struct mm_walk_ops *ops, pgd_t *pgd, void *private)
> @@ -643,7 +643,7 @@ int walk_kernel_page_table_range(unsigned long start, unsigned long end,
>   * Use this function to walk the kernel page tables locklessly. It should be
>   * guaranteed that the caller has exclusive access over the range they are
>   * operating on - that there should be no concurrent access, for example,
> - * changing permissions for vmalloc objects.
> + * changing permissions for vmalloc objects, or vmap huge page promotion.
>   */
>  int walk_kernel_page_table_range_lockless(unsigned long start, unsigned long end,
>  		const struct mm_walk_ops *ops, pgd_t *pgd, void *private)
> @@ -692,9 +692,13 @@ int walk_page_range_debug(struct mm_struct *mm, unsigned long start,
>  	};
>  
>  	/* For convenience, we allow traversal of kernel mappings. */
> -	if (mm == &init_mm)
> -		return walk_kernel_page_table_range(start, end, ops,
> -						    pgd, private);
> +	if (mm == &init_mm) {
> +		RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> +				 "RCU read lock must be held across kernel page table walk");
> +		return walk_kernel_page_table_range(start, end, ops, pgd,
> +							private);
> +	}
> +
>  	if (start >= end || !walk.mm)
>  		return -EINVAL;
>  	if (!check_ops_safe(ops))
> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
> index b91b1a98029c..7a32e4821957 100644
> --- a/mm/pgtable-generic.c
> +++ b/mm/pgtable-generic.c
> @@ -410,6 +410,13 @@ pte_t *pte_offset_map_lock(struct mm_struct *mm, pmd_t *pmd,
>  	goto again;
>  }
>  
> +static void kernel_pgtable_free_rcu(struct rcu_head *head)
> +{
> +	struct ptdesc *pt = container_of(head, struct ptdesc, pt_rcu_head);
> +
> +	__pagetable_free(pt);
> +}
> +
>  #ifdef CONFIG_ASYNC_KERNEL_PGTABLE_FREE
>  static void kernel_pgtable_work_func(struct work_struct *work);
>  
> @@ -434,8 +441,15 @@ static void kernel_pgtable_work_func(struct work_struct *work)
>  	spin_unlock(&kernel_pgtable_work.lock);
>  
>  	iommu_sva_invalidate_kva_range(PAGE_OFFSET, TLB_FLUSH_ALL);
> +
> +	/*
> +	 * Debug walkers (ptdump) may walk ranges they do not own and race this
> +	 * free, so they walk under rcu_read_lock(). Free after a grace period:
> +	 * a walker either already saw the cleared PMD, or keeps the page alive
> +	 * until it drops the RCU lock.
> +	 */
>  	list_for_each_entry_safe(pt, next, &page_list, pt_list)
> -		__pagetable_free(pt);
> +		call_rcu(&pt->pt_rcu_head, kernel_pgtable_free_rcu);
>  }
>  
>  void pagetable_free_kernel(struct ptdesc *pt)
> @@ -446,4 +460,10 @@ void pagetable_free_kernel(struct ptdesc *pt)
>  
>  	schedule_work(&kernel_pgtable_work.work);
>  }
> +#else
> +void pagetable_free_kernel(struct ptdesc *pt)
> +{
> +	/* Defer the free by a grace period; see kernel_pgtable_work_func(). */
> +	call_rcu(&pt->pt_rcu_head, kernel_pgtable_free_rcu);
> +}
>  #endif
> diff --git a/mm/ptdump.c b/mm/ptdump.c
> index 973020000096..50cd96a33dfd 100644
> --- a/mm/ptdump.c
> +++ b/mm/ptdump.c
> @@ -178,11 +178,13 @@ void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
>  
>  	get_online_mems();
>  	mmap_write_lock(mm);
> +	rcu_read_lock();
>  	while (range->start != range->end) {
>  		walk_page_range_debug(mm, range->start, range->end,
>  				      &ptdump_ops, pgd, st);
>  		range++;
>  	}
> +	rcu_read_unlock();

Any reason that is not done inside walk_page_range_debug() ? Dropping the lock
in between should not be a concern?

-- 
Cheers,

David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
