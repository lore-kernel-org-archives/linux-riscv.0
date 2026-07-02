Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8707C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 09:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UBIjJi9h5J04Gv3tuclW3mLbNeI4zeTonoxJZi2ZlaM=; b=4BRJrNIRKrQ+km
	Ly/djuayu+kKzjlrEwOJjj4DVTsZJu5VVShwyNvVtePHYyrzzsTyi6zWfxX+ZyBxcSYj2q7Kr2vFB
	Vv2wRcJ2A7ZfFvKWrNJ2+OHFYVUcFiQUOjBLJFSj7y/6aKVz3/mlxuyF1vFsyYYn/MuO+OAoKTA3T
	pxQeFttb/02fGrGl7yawVAjHv0294MBBwNjCzQqpZ9477bdCES8Inl0m50cS3LHs/cgNkGBYF4xRl
	AtOr3apTO+v4VPDparoIJ31FqknERAn35CINVPVVujLv7VNnn9Me+gyrTScgVCo4ucwNGkKBxjMsL
	MM4/h6C2JjOO8rqg1bWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDZJ-00000003zWV-3B1s;
	Thu, 02 Jul 2026 09:18:49 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDZH-00000003zVo-3FW6
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 09:18:49 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493b786d6c0so8049175e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jul 2026 02:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782983926; x=1783588726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=36wN3XWi1Gt2Qu5SY5RvMeGgAjrVK8Wg8A08p9UPw1o=;
        b=BShMS+fkghKb3sm5TV9aKTCRni8PVQFqD+MRrt8rHdv6NqADfLpkapv5UjNF5Ss/U9
         lUbuTwRUtB08ag+ZpYiFKGi33DvVflmPcTUZ1czsPfurg4NbNuJ2aTf2XT8liAjErFSz
         efo7CMfQUVOAQDRu2QFlRIO3voj2xVbsFhX8B4oURhO0uKZREOayOEn6OhdiGcVtwozr
         iSrZwHM1ECTB/jZFRQGjIDccs7ZT/8SGmoqKkH7NWcWhKFUlGgwDTYsEVnrgKv/MKru4
         JScmKjqje8j1CHNyHjf7JgQPHUsuDFUETM9ZqBkDkPmSqVzaApdAyjsyfV53FIgXKfdG
         VR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782983926; x=1783588726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36wN3XWi1Gt2Qu5SY5RvMeGgAjrVK8Wg8A08p9UPw1o=;
        b=hNaK2RGi3NLOpj29qFZb9Fom55sNaghEgdXvTjrvFVm1G83XUvmVz2xEJkdjacMGPa
         PUkbFyuFdrPPtm2P9YkkFzasz9iAmIDqX+Y5zawwiID8cychx7xxur1l/tXbco1lkbWy
         0iLnYPSpO+QRgtigFpYMi+W1Ho28Qtjkszg2XWjf7cRZ+5Ca5ruJEx0K28RYxNtW3F6I
         H0QRgFTefRK1Sx9J6xVpuzefR1GUxpO+KV2zWPrx3aKH5nq3OqPt5uuTZwuD0HVoJWJb
         QUuKCkV+07ordkcs5M8sPqTKk/buXRFGSpmFYVfEa9V7U14jy27hUUn5Jskb3Lda1nxC
         UzfA==
X-Forwarded-Encrypted: i=1; AFNElJ+M8OGSifAQPsjgpRlxsF2LAgrOWpdVnK0LUlidx/JccyGNVPuQ151PNEpE4BX+mwjuFV97uh40N+i1ZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwX7dc6DBXLEtkVpAPR5/MOQxGDkwI4LplZceTZp6ypVA/st98H
	zQTP5asqGLpbvWAMQT6Fgu36YYsArbS+6VbjGQN4QN1lTnsL7KlE1Y6E
X-Gm-Gg: AfdE7cnK1LsJ7mqrj71w4L5r1Ay7diHU9dazGQhdBqTnZd2I8SzljymuhsbfBlliqxR
	pWxdBx5YIMwUDup0duR7eFcpBb/uCw5X/suy4iZD/BWIol3HOKLqvdqobrnz60VOiOxyK+mvzpa
	m4bO4SlWarpO9LnVYyHv9AQ6UjiM+o3V3RHPUalO43UBBj6cXEQEFP+TY5xRpW9YmRmZT5ivivQ
	K+0jemk22ys5nccWG629RF4GOjxAxClaBvBfoosAJitawVOTUs2o0VQFo20uDZpBxpVzTOCXS+0
	tte6Hu2BVVkHkR4twjqyjpf+WvILT7TYOpWa2pu09VPjvAS+33fgs+70mbomuGh0oYq4AQ95U98
	XjkOYX4fUayjQw/yPhGYMesVdHMEVpPgCnc4drx0CCib2ex2KOJUQm5wyaFCturvuf0YpioZzKU
	lxCWXxl8RvWRMxEs6toEPYEWvSVv+mRUQBmdIyy11lehltnkEbpg+0hPeG0DF6PkjwDPQBDVfN
X-Received: by 2002:a7b:cc14:0:b0:492:53e2:7712 with SMTP id 5b1f17b1804b1-493c2b85612mr47882905e9.21.1782983925366;
        Thu, 02 Jul 2026 02:18:45 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c636cc08sm40757995e9.11.2026.07.02.02.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:18:44 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Dev Jain <dev.jain@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] mm: pgtable: free kernel page tables via RCU to fix ptdump UAF
Date: Thu,  2 Jul 2026 10:18:41 +0100
Message-ID: <20260702091841.332318-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_021847_854351_4F498CE1 
X-CRM114-Status: GOOD (  28.34  )
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

ptdump_walk_pgd() walks the kernel page tables under get_online_mems().
That does not stop vmalloc from freeing a kernel PTE page underneath the
walk.

When vmap_try_huge_pmd() promotes a range to a huge PMD it collapses the
existing PTE table and frees it via pmd_free_pte_page(). On x86, riscv and
powerpc this runs without the init_mm mmap lock; only arm64 takes it, and
not on the block-split path. So ptdump can dereference a just-freed PTE
page, which is the use after free syzbot hit in ptdump_pte_entry().

The race is not new. ptdump walks the whole kernel address space, including
ranges other code is actively mapping, so it reads page tables it does not
own. 5ba2f0a15564 ("mm: introduce deferred freeing for kernel page tables")
only widened the window; the Fixes tag points there for that reason.

Every other walker works on a range it owns and is the only one mutating
it: set_memory() on arm64/riscv/loongarch, the arm64 block-split path, the
openrisc DMA path and the hugetlb_vmemmap remap. Nothing frees those ranges
concurrently, so they cannot race and do not need RCU. ptdump is the only
walker that traverses ranges it does not own.

Defer the free by an RCU grace period. pagetable_free_kernel() now frees
via call_rcu() in both the async and non-async configs. The async path
still flushes the TLB first, then queues the per-page RCU free. The page
stays valid until any walk that may have observed it drops its RCU read
lock.

On the read side walk_page_range_debug() walks the init_mm range in bounded
chunks, taking rcu_read_lock() around each chunk and calling cond_resched()
between them. A walker either sees the cleared PMD and skips, or keeps the
page alive until it drops the lock; chunking keeps the read section short
on a large kernel address space instead of holding RCU across the whole
walk. The owned-range walkers are unchanged.

Drop the mmap_write_lock() in ptdump_walk_pgd(). It never guarded against
this free -- most architectures free the collapsed PTE table without it --
and RCU now provides the synchronisation.

ptdump callbacks run under RCU within a chunk, so they must not sleep. The
arch note_page() and effective_prot() callbacks only format into the
preallocated seq_file buffer; the only GFP_KERNEL marker setup runs before
the walk, and cond_resched() happens between chunks, outside the read lock.

Fixes: 5ba2f0a15564 ("mm: introduce deferred freeing for kernel page tables")
Reported-by: syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/6a287988.39669fcc.33b062.00a0.GAE@google.com/T/
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 include/linux/mm.h   |  7 -------
 mm/pagewalk.c        | 35 ++++++++++++++++++++++++++++++-----
 mm/pgtable-generic.c | 22 +++++++++++++++++++++-
 mm/ptdump.c          |  2 --
 4 files changed, 51 insertions(+), 15 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 485df9c2dbdd..79408a17a1b0 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3695,14 +3695,7 @@ static inline void __pagetable_free(struct ptdesc *pt)
 	__free_pages(page, compound_order(page));
 }
 
-#ifdef CONFIG_ASYNC_KERNEL_PGTABLE_FREE
 void pagetable_free_kernel(struct ptdesc *pt);
-#else
-static inline void pagetable_free_kernel(struct ptdesc *pt)
-{
-	__pagetable_free(pt);
-}
-#endif
 /**
  * pagetable_free - Free pagetables
  * @pt:	The page table descriptor
diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index 3ae2586ff45b..ee7250ad0571 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -620,7 +620,7 @@ int walk_page_range(struct mm_struct *mm, unsigned long start,
  * Note: Be careful to walk the kernel pages tables, the caller may be need to
  * take other effective approaches (mmap lock may be insufficient) to prevent
  * the intermediate kernel page tables belonging to the specified address range
- * from being freed (e.g. memory hot-remove).
+ * from being freed (e.g. memory hot-remove, vmap huge page promotion).
  */
 int walk_kernel_page_table_range(unsigned long start, unsigned long end,
 		const struct mm_walk_ops *ops, pgd_t *pgd, void *private)
@@ -643,7 +643,7 @@ int walk_kernel_page_table_range(unsigned long start, unsigned long end,
  * Use this function to walk the kernel page tables locklessly. It should be
  * guaranteed that the caller has exclusive access over the range they are
  * operating on - that there should be no concurrent access, for example,
- * changing permissions for vmalloc objects.
+ * changing permissions for vmalloc objects, or vmap huge page promotion.
  */
 int walk_kernel_page_table_range_lockless(unsigned long start, unsigned long end,
 		const struct mm_walk_ops *ops, pgd_t *pgd, void *private)
@@ -692,9 +692,34 @@ int walk_page_range_debug(struct mm_struct *mm, unsigned long start,
 	};
 
 	/* For convenience, we allow traversal of kernel mappings. */
-	if (mm == &init_mm)
-		return walk_kernel_page_table_range(start, end, ops,
-						    pgd, private);
+	if (mm == &init_mm) {
+		unsigned long addr = start;
+
+		/*
+		 * Walk in bounded chunks so the RCU read lock is never held
+		 * across the whole kernel address space.  A kernel page table
+		 * freed via pagetable_free_kernel() stays valid until the walk
+		 * that may have observed it drops the lock; releasing the lock
+		 * between chunks is safe as no page table pointer is held
+		 * across the gap.
+		 */
+		while (addr < end) {
+			unsigned long next = min(end, ALIGN(addr + 1, PGDIR_SIZE));
+			int err;
+
+			rcu_read_lock();
+			err = walk_kernel_page_table_range(addr, next, ops,
+							   pgd, private);
+			rcu_read_unlock();
+			if (err)
+				return err;
+
+			addr = next;
+			cond_resched();
+		}
+		return 0;
+	}
+
 	if (start >= end || !walk.mm)
 		return -EINVAL;
 	if (!check_ops_safe(ops))
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index b91b1a98029c..7a32e4821957 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -410,6 +410,13 @@ pte_t *pte_offset_map_lock(struct mm_struct *mm, pmd_t *pmd,
 	goto again;
 }
 
+static void kernel_pgtable_free_rcu(struct rcu_head *head)
+{
+	struct ptdesc *pt = container_of(head, struct ptdesc, pt_rcu_head);
+
+	__pagetable_free(pt);
+}
+
 #ifdef CONFIG_ASYNC_KERNEL_PGTABLE_FREE
 static void kernel_pgtable_work_func(struct work_struct *work);
 
@@ -434,8 +441,15 @@ static void kernel_pgtable_work_func(struct work_struct *work)
 	spin_unlock(&kernel_pgtable_work.lock);
 
 	iommu_sva_invalidate_kva_range(PAGE_OFFSET, TLB_FLUSH_ALL);
+
+	/*
+	 * Debug walkers (ptdump) may walk ranges they do not own and race this
+	 * free, so they walk under rcu_read_lock(). Free after a grace period:
+	 * a walker either already saw the cleared PMD, or keeps the page alive
+	 * until it drops the RCU lock.
+	 */
 	list_for_each_entry_safe(pt, next, &page_list, pt_list)
-		__pagetable_free(pt);
+		call_rcu(&pt->pt_rcu_head, kernel_pgtable_free_rcu);
 }
 
 void pagetable_free_kernel(struct ptdesc *pt)
@@ -446,4 +460,10 @@ void pagetable_free_kernel(struct ptdesc *pt)
 
 	schedule_work(&kernel_pgtable_work.work);
 }
+#else
+void pagetable_free_kernel(struct ptdesc *pt)
+{
+	/* Defer the free by a grace period; see kernel_pgtable_work_func(). */
+	call_rcu(&pt->pt_rcu_head, kernel_pgtable_free_rcu);
+}
 #endif
diff --git a/mm/ptdump.c b/mm/ptdump.c
index 973020000096..4fc6313f290c 100644
--- a/mm/ptdump.c
+++ b/mm/ptdump.c
@@ -177,13 +177,11 @@ void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
 	const struct ptdump_range *range = st->range;
 
 	get_online_mems();
-	mmap_write_lock(mm);
 	while (range->start != range->end) {
 		walk_page_range_debug(mm, range->start, range->end,
 				      &ptdump_ops, pgd, st);
 		range++;
 	}
-	mmap_write_unlock(mm);
 	put_online_mems();
 
 	/* Flush out the last page */
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
