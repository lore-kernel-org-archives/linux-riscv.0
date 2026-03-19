Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322351075273
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 08:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qRgFiqsoTAgiJmNanVSrTLkMVqgdGIqfPQSybuoVvt0=; b=ipKPW4AT1MjB7y
	rNlZkwYyOlbWupdyRBtqzl4dHGYXlTSxAVwQafaQ2YoEQkAzcTY9eUxtcoubx/mmLyxqMmKA3HMj/
	FX9nxu0gd//Ui5uAqvmLlEcQ2McRoHSdEynu54qdqDVA3fR7QgC3PHFrAUfQwZ/399JUUv7GMU3kt
	ccvrhxKsyguiYA0GjaH+oz6vOJXraJIKP+n7B5Re+a8VmX5HBpK6ZcuUR89deV8KSR6/wswYqSqUS
	mFN/KThgmW3Cp+Sjbcc1Qg05xHLUvQ/EAP8Xg9UKf2ty0ssekZZ/cxZE0WIh96lGBL/FaTPxNfOGV
	k0DtyYQBujja8GhweDhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w38cV-0000000AE3L-0X3B;
	Thu, 19 Mar 2026 08:20:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w38cT-0000000AE2r-3P4s;
	Thu, 19 Mar 2026 08:20:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D558E6011F;
	Thu, 19 Mar 2026 08:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B22C19425;
	Thu, 19 Mar 2026 08:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773908440;
	bh=XZSmlU5qQZSk3ikAK6msWkB0C1hCUr2T8dbTi52alcU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=siMioE97YWmWg3dsdee3PkKgH+n8pqPcHCbnc6EAggNIaenWaU7afq+6ydhGwa1BV
	 A1iG9LJmU8Lw5Tyz4SQpmVDsf+kP8nwdPtOu2fYoKB7hmSN+p6wqjYPSjuRjkpCvAu
	 yuoo5OzG1ERSTgAj2PzV7QqiSHxS6taM56a0Cg+9bqTj6qeXnvjSmxGHAZ4tkb/Wtw
	 X265+BTIO1cRd7v9TnTwUz5dk9/alFXI0lrS9w9uSVwU17/ghw21lOa64OHs+SuJQc
	 0lM+E29w+qg+o9jxGyY/qD2fpzZewxKBhdYf2j2PJ3cWdle21nX3QEdot45buM5NqD
	 +/zAc5cFalR8A==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Thu, 19 Mar 2026 09:19:41 +0100
Subject: [PATCH 2/2] mm: introduce CONFIG_NUMA_MIGRATION and simplify
 CONFIG_MIGRATION
MIME-Version: 1.0
Message-Id: <20260319-config_migration-v1-2-42270124966f@kernel.org>
References: <20260319-config_migration-v1-0-42270124966f@kernel.org>
In-Reply-To: <20260319-config_migration-v1-0-42270124966f@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-mm@kvack.org, 
 linux-rt-devel@lists.linux.dev, 
 "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.13.0
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

CONFIG_MEMORY_HOTREMOVE, CONFIG_COMPACTION and CONFIG_CMA all select
CONFIG_MIGRATION, because they require it to work (users).

Only CONFIG_NUMA_BALANCING and CONFIG_BALLOON_MIGRATION depend on
CONFIG_MIGRATION. CONFIG_BALLOON_MIGRATION is not an actual user, but
an implementation of migration support, so the dependency is correct
(CONFIG_BALLOON_MIGRATION does not make any sense without
CONFIG_MIGRATION).

However, kconfig-language.rst  clearly states "In general use select only
for non-visible symbols". So far CONFIG_MIGRATION is user-visible ...
and the dependencies rather confusing.

The whole reason why CONFIG_MIGRATION is user-visible is because of
CONFIG_NUMA: some users might want CONFIG_NUMA but not page migration
support.

Let's clean all that up by introducing a dedicated CONFIG_NUMA_MIGRATION
config option for that purpose only. Make CONFIG_NUMA_BALANCING that so
far depended on CONFIG_NUMA && CONFIG_MIGRATION to depend on
CONFIG_MIGRATION instead. CONFIG_NUMA_MIGRATION will depend on
CONFIG_NUMA && CONFIG_MMU.

CONFIG_NUMA_MIGRATION is user-visible and will default to "y". We
use that default so new configs will automatically enable it, just
like it was the case with CONFIG_MIGRATION. The downside is that
some configs that used to have CONFIG_MIGRATION=n might get it
re-enabled by CONFIG_NUMA_MIGRATION=y, which shouldn't be a problem.

CONFIG_MIGRATION is now a non-visible config option. Any code that
select CONFIG_MIGRATION (as before) must depend directly or indirectly
on CONFIG_MMU.

CONFIG_NUMA_MIGRATION is responsible for any NUMA migration code, which is
mempolicy migration code, memory-tiering code, and move_pages() code in
migrate.c. CONFIG_NUMA_BALANCING uses its functionality.

Note that this implies that with CONFIG_NUMA_MIGRATION=n, move_pages() will
not be available even though CONFIG_MIGRATION=y, which is an expected
change.

In migrate.c, we can remove the CONFIG_NUMA check as both
CONFIG_NUMA_MIGRATION and CONFIG_NUMA_BALANCING depend on it.

With this change, CONFIG_MIGRATION is an internal config, all users of
migration selects CONFIG_MIGRATION, and only CONFIG_BALLOON_MIGRATION
depends on it.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 include/linux/memory-tiers.h |  2 +-
 init/Kconfig                 |  2 +-
 mm/Kconfig                   | 26 +++++++++++++-------------
 mm/memory-tiers.c            | 12 ++++++------
 mm/mempolicy.c               |  2 +-
 mm/migrate.c                 |  5 ++---
 6 files changed, 24 insertions(+), 25 deletions(-)

diff --git a/include/linux/memory-tiers.h b/include/linux/memory-tiers.h
index 96987d9d95a8..7999c58629ee 100644
--- a/include/linux/memory-tiers.h
+++ b/include/linux/memory-tiers.h
@@ -52,7 +52,7 @@ int mt_perf_to_adistance(struct access_coordinate *perf, int *adist);
 struct memory_dev_type *mt_find_alloc_memory_type(int adist,
 						  struct list_head *memory_types);
 void mt_put_memory_types(struct list_head *memory_types);
-#ifdef CONFIG_MIGRATION
+#ifdef CONFIG_NUMA_MIGRATION
 int next_demotion_node(int node, const nodemask_t *allowed_mask);
 void node_get_allowed_targets(pg_data_t *pgdat, nodemask_t *targets);
 bool node_is_toptier(int node);
diff --git a/init/Kconfig b/init/Kconfig
index 444ce811ea67..3648e401b78b 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -997,7 +997,7 @@ config NUMA_BALANCING
 	bool "Memory placement aware NUMA scheduler"
 	depends on ARCH_SUPPORTS_NUMA_BALANCING
 	depends on !ARCH_WANT_NUMA_VARIABLE_LOCALITY
-	depends on SMP && NUMA && MIGRATION && !PREEMPT_RT
+	depends on SMP && NUMA_MIGRATION && !PREEMPT_RT
 	help
 	  This option adds support for automatic NUMA aware memory/task placement.
 	  The mechanism is quite primitive and is based on migrating memory when
diff --git a/mm/Kconfig b/mm/Kconfig
index b2e21d873d3f..bd283958d675 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -627,20 +627,20 @@ config PAGE_REPORTING
 	  those pages to another entity, such as a hypervisor, so that the
 	  memory can be freed within the host for other uses.
 
-#
-# support for page migration
-#
-config MIGRATION
-	bool "Page migration"
+config NUMA_MIGRATION
+	bool "NUMA page migration"
 	default y
-	depends on (NUMA || MEMORY_HOTREMOVE || COMPACTION || CMA) && MMU
-	help
-	  Allows the migration of the physical location of pages of processes
-	  while the virtual addresses are not changed. This is useful in
-	  two situations. The first is on NUMA systems to put pages nearer
-	  to the processors accessing. The second is when allocating huge
-	  pages as migration can relocate pages to satisfy a huge page
-	  allocation instead of reclaiming.
+	depends on NUMA && MMU
+	select MIGRATION
+	help
+	  Support the migration of pages to other NUMA nodes, available to
+	  user space through interfaces like migrate_pages(), move_pages(),
+	  and mbind(). Selecting this option also enables support for page
+	  demotion for memory tiering.
+
+config MIGRATION
+	bool
+	depends on MMU
 
 config DEVICE_MIGRATION
 	def_bool MIGRATION && ZONE_DEVICE
diff --git a/mm/memory-tiers.c b/mm/memory-tiers.c
index 986f809376eb..54851d8a195b 100644
--- a/mm/memory-tiers.c
+++ b/mm/memory-tiers.c
@@ -69,7 +69,7 @@ bool folio_use_access_time(struct folio *folio)
 }
 #endif
 
-#ifdef CONFIG_MIGRATION
+#ifdef CONFIG_NUMA_MIGRATION
 static int top_tier_adistance;
 /*
  * node_demotion[] examples:
@@ -129,7 +129,7 @@ static int top_tier_adistance;
  *
  */
 static struct demotion_nodes *node_demotion __read_mostly;
-#endif /* CONFIG_MIGRATION */
+#endif /* CONFIG_NUMA_MIGRATION */
 
 static BLOCKING_NOTIFIER_HEAD(mt_adistance_algorithms);
 
@@ -273,7 +273,7 @@ static struct memory_tier *__node_get_memory_tier(int node)
 				     lockdep_is_held(&memory_tier_lock));
 }
 
-#ifdef CONFIG_MIGRATION
+#ifdef CONFIG_NUMA_MIGRATION
 bool node_is_toptier(int node)
 {
 	bool toptier;
@@ -519,7 +519,7 @@ static void establish_demotion_targets(void)
 
 #else
 static inline void establish_demotion_targets(void) {}
-#endif /* CONFIG_MIGRATION */
+#endif /* CONFIG_NUMA_MIGRATION */
 
 static inline void __init_node_memory_type(int node, struct memory_dev_type *memtype)
 {
@@ -911,7 +911,7 @@ static int __init memory_tier_init(void)
 	if (ret)
 		panic("%s() failed to register memory tier subsystem\n", __func__);
 
-#ifdef CONFIG_MIGRATION
+#ifdef CONFIG_NUMA_MIGRATION
 	node_demotion = kzalloc_objs(struct demotion_nodes, nr_node_ids);
 	WARN_ON(!node_demotion);
 #endif
@@ -938,7 +938,7 @@ subsys_initcall(memory_tier_init);
 
 bool numa_demotion_enabled = false;
 
-#ifdef CONFIG_MIGRATION
+#ifdef CONFIG_NUMA_MIGRATION
 #ifdef CONFIG_SYSFS
 static ssize_t demotion_enabled_show(struct kobject *kobj,
 				     struct kobj_attribute *attr, char *buf)
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index e5528c35bbb8..fd08771e2057 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -1239,7 +1239,7 @@ static long do_get_mempolicy(int *policy, nodemask_t *nmask,
 	return err;
 }
 
-#ifdef CONFIG_MIGRATION
+#ifdef CONFIG_NUMA_MIGRATION
 static bool migrate_folio_add(struct folio *folio, struct list_head *foliolist,
 				unsigned long flags)
 {
diff --git a/mm/migrate.c b/mm/migrate.c
index fdbb20163f66..05cb408846f2 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2224,8 +2224,7 @@ struct folio *alloc_migration_target(struct folio *src, unsigned long private)
 	return __folio_alloc(gfp_mask, order, nid, mtc->nmask);
 }
 
-#ifdef CONFIG_NUMA
-
+#ifdef CONFIG_NUMA_MIGRATION
 static int store_status(int __user *status, int start, int value, int nr)
 {
 	while (nr-- > 0) {
@@ -2624,6 +2623,7 @@ SYSCALL_DEFINE6(move_pages, pid_t, pid, unsigned long, nr_pages,
 {
 	return kernel_move_pages(pid, nr_pages, pages, nodes, status, flags);
 }
+#endif /* CONFIG_NUMA_MIGRATION */
 
 #ifdef CONFIG_NUMA_BALANCING
 /*
@@ -2766,4 +2766,3 @@ int migrate_misplaced_folio(struct folio *folio, int node)
 	return nr_remaining ? -EAGAIN : 0;
 }
 #endif /* CONFIG_NUMA_BALANCING */
-#endif /* CONFIG_NUMA */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
