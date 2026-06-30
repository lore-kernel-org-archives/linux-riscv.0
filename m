Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4597BC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 04:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xz66i0YORCd/4D/p6/2Z4UN4CzCRMG+pGMRLJKU0BDM=; b=warVnzy1EZ0bw7
	CFlxZ5uHEPud4/hsunEnVsICF7bO+b33377UWruqL5gStpIR8g4yeHoKOAsll5YyNoDlXx/QjfRYv
	D0FToQgYb4xJvSjaUx/+39zZy/HyRij+KON2AuYmFw/1PLXG/wPJqlLx6f1b1U61+0tydaZj5APk2
	9O9N/zycwaWCS5t37kPqN7HV6fjhW+zA+m7adt53g5+5UnfmT/dxaMA7IYw9zca1MrTHClQopGsSn
	sBzIiAap1gnTJ1QFHkDog71QTnjqxFaSs0BzWIkVziz9x60HtO0h2SYYA39x1h3hGeonz6K8L6hh+
	zmQ3iMXp2Nd8DSupH4jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wePno-0000000FlbW-3dXY;
	Tue, 30 Jun 2026 04:10:28 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wePnf-0000000Flar-25Mh
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 04:10:27 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-493bab44440so476655e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 21:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782792617; x=1783397417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WfOCgBUYMvXbl1f8j58WJcsxpt1QKz3Glw/S1uy49Es=;
        b=SZFnO+hErpdPJoAF2VbCmuHUgp5o3TGi5kBYmErQEgdaUpG/uEpAxzkfJYkZn2J0JG
         pvmzsAaqsn1Wwkb6RsbjtVLCtX92Y2K1PPDuGVbvfiZc6MDZv4bctjgHJQdZ/JIR3EhZ
         SYyAiI5efPWgT6MCpWNc9QsxzYzHfKj1U4ohT2EePGU85zgjjA8Ws48WHeNq8H8mwUMS
         sQQuiYD942LQCcKA0Zw0PsFfafAkYSzN8u+OdG5CN+kwMOUqcwPMPqsG8cCbF4FKIuxp
         /86Jm8v+a/BwH1xcFKUfOBaNOCawjADJbYmxXVFEzU5Lc7ic3yf2d8g5l04dPqd9rC1D
         UccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782792617; x=1783397417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfOCgBUYMvXbl1f8j58WJcsxpt1QKz3Glw/S1uy49Es=;
        b=M/RRFXVelTLHVHbf1CHeYdILbP6eZGT1xeal5qZDUoD4sk762RWWnE9bjGHJLlc1/v
         dzTVYyDpPKlM/zip3aEvWdsmfQk3Z218c+lVIi/OnWq0IO+JsbD3YAbtMROEEEW50tQz
         HeZozSgMx5ammi3NhCg2z3JgW1YWkHmP6nE8EysBC+9h+zWDnOpu+LkQZl7h6t2Dj7W6
         JX58GR92jNebwVdj+3gsXB5t/dK1nKghI5iuAEAlZR0XsVCjdCk+e84hp1EisyCUWoxY
         +RX1hAPoFIrmiD1vXfLiYZ4SsbZmS+vdb10LP7tU6jpabISLleyeXt29Y1gZniAK1ghi
         1eeQ==
X-Forwarded-Encrypted: i=1; AFNElJ9fWO7O7Yci5C0fFE+bKAcRkvswXwG6xSgaL9ndc+DlpsrN6HTx+s6HOv6dGxU71ExfL/dR1J7toMiVEA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwP/LQ7MK52QuNrFKOc5dpmfJOb+RcEH3l8olHOL9AKz8AW72IQ
	/WW9sOXgCjundt5AEFAuk+0bQ/m53fMn6CSgPN/W2ys2sxBiJUF8wGuR
X-Gm-Gg: AfdE7ckU4zoyocZqhgQ47iqusfwDFYVlJUDIZoPKM9SBMNZBPkgXFNjsUEGWha559RU
	RdojMcmD/faPofi5GKnQvN0L7iR9ARvu71X4OoL3xs8BBis83O8xGo3n4dSzT2Ior24OZo339gF
	xkUN0YPp5kDhkqowh79pylzrbI1OK2s52h0MsQE4dZ/cuEQJurbw9JQ5718BDOcWcpUDTbvw8OD
	g69iR7E7Zu0zDvQh9PTuvBioR6UZQ6mbR+tH+16PYrQnKHvlHGp34ts6SWbAz+5ejOvh9M9Xtmh
	imqHO7gqVHJifJfEVaPy/VgRjs/TCg2rQVUOCL9miLkEpitPynvdxyzdCXtTii5/F5hoaT+7Yi9
	mFi5sQvf7wKFQLUQj7cKo/FTPNZdG18riCHdiUA24z6McAe0OHoWOFrULhiaT9KRgfiVRLYtSUB
	LlnZQoed0pezWGJcOVQa3k6vlv4NIbGu1wbDq6lPPw0Y2atu0WWysA7NTVkd3GiphnBTnHvn2rO
	vpyzve5+j8=
X-Received: by 2002:a05:600c:83c7:b0:492:4871:7e21 with SMTP id 5b1f17b1804b1-493bc24ab30mr1469935e9.10.1782792616730;
        Mon, 29 Jun 2026 21:10:16 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bc19f4b0sm5675465e9.1.2026.06.29.21.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 21:10:16 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
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
Date: Tue, 30 Jun 2026 05:10:12 +0100
Message-ID: <20260630041012.5975-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_211019_586903_6D8B3185 
X-CRM114-Status: GOOD (  24.90  )
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

ptdump_walk_pgd() walks the kernel page tables under get_online_mems() and
mmap_write_lock(&init_mm). Neither lock stops vmalloc from freeing a kernel
PTE page underneath the walk.

When vmap_try_huge_pmd() promotes a range to a huge PMD it collapses the
existing PTE table and frees it via pmd_free_pte_page(). On x86, riscv and
powerpc this runs without the init_mm mmap lock; only arm64 takes it, and not
on the block-split path. So ptdump can dereference a just-freed PTE page,
which is the use after free syzbot hit in ptdump_pte_entry().

The race is not new. ptdump walks the whole kernel address space, including
ranges other code is actively mapping, so it reads page tables it does not
own. 5ba2f0a15564 ("mm: introduce deferred freeing for kernel page tables")
only widened the window; the Fixes tag points there for that reason.

Every other walker works on a range it owns and is the only one mutating it:
set_memory() on arm64/riscv/loongarch, the arm64 block-split path, the
openrisc DMA path and the hugetlb_vmemmap remap. Nothing frees those ranges
concurrently, so they cannot race and do not need RCU. ptdump is the only
walker that traverses ranges it does not own.

Defer the free by an RCU grace period. pagetable_free_kernel() now frees via
call_rcu() in both the async and non-async configs. The async path still
flushes the TLB first, then queues the per-page RCU free. The page stays
valid until any walk that may have observed it drops its RCU read lock.

On the read side ptdump_walk_pgd() takes the RCU read lock around the walk,
and walk_page_range_debug() asserts it with RCU_LOCKDEP_WARN() for the
init_mm case rather than taking it, matching pagewalk.c convention. A walker
either sees the cleared PMD and skips, or keeps the page alive until it drops
the lock. The owned-range walkers are unchanged.

ptdump callbacks now run under RCU, so they must not sleep. The arch
note_page() and effective_prot() callbacks only format into the preallocated
seq_file buffer, and the walker does not call cond_resched(); the only
GFP_KERNEL marker setup runs before the walk.

Fixes: 5ba2f0a15564 ("mm: introduce deferred freeing for kernel page tables")
Reported-by: syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/6a287988.39669fcc.33b062.00a0.GAE@google.com/T/
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: David Carlier <devnexen@gmail.com>
---
v5: reframe changelog around the pre-existing race and range ownership;
    correct the mmap-lock description (arm64 is the exception, not x86);
    move rcu_read_lock() into ptdump_walk_pgd() and assert it in
    walk_page_range_debug(); drop walk_kernel_page_table_range_rcu(); fix the
    pgtable-generic.c comment; document the no-sleep audit of the callbacks.
v4: defer the free in both the async and non async configs, not just
    the async one. Move the walk under a named
    walk_kernel_page_table_range_rcu() helper instead of open coding
    rcu_read_lock() in walk_page_range_debug().
v3: take rcu_read_lock() in the init_mm branch of
    walk_page_range_debug() rather than inside the lockless walker,
    which the arm64 split paths also use with GFP_PGTABLE_KERNEL and
    can sleep.
v2: use call_rcu() instead of synchronize_rcu().
---
 include/linux/mm.h   |  7 -------
 mm/pagewalk.c        | 14 +++++++++-----
 mm/pgtable-generic.c | 22 +++++++++++++++++++++-
 mm/ptdump.c          |  2 ++
 4 files changed, 32 insertions(+), 13 deletions(-)

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
index 3ae2586ff45b..c0be87580989 100644
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
@@ -692,9 +692,13 @@ int walk_page_range_debug(struct mm_struct *mm, unsigned long start,
 	};
 
 	/* For convenience, we allow traversal of kernel mappings. */
-	if (mm == &init_mm)
-		return walk_kernel_page_table_range(start, end, ops,
-						    pgd, private);
+	if (mm == &init_mm) {
+		RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
+				 "RCU read lock must be held across kernel page table walk");
+		return walk_kernel_page_table_range(start, end, ops, pgd,
+							private);
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
index 973020000096..50cd96a33dfd 100644
--- a/mm/ptdump.c
+++ b/mm/ptdump.c
@@ -178,11 +178,13 @@ void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
 
 	get_online_mems();
 	mmap_write_lock(mm);
+	rcu_read_lock();
 	while (range->start != range->end) {
 		walk_page_range_debug(mm, range->start, range->end,
 				      &ptdump_ops, pgd, st);
 		range++;
 	}
+	rcu_read_unlock();
 	mmap_write_unlock(mm);
 	put_online_mems();
 
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
