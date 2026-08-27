Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04648C61DB9
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 07:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+JfnVURcstNeCETqPAnka8iv0WL62OAOUFm3IBeLZ1E=; b=qq5vUAg5dSG7oR
	vG8KRj2cnZAA7QqqY8bGIGp4KuMauZcG/Dgnq0RJCQ9ygIFFcamMFH2MsbrZPghsMinJrPobkL5Jt
	01L0jDuir9QiGfTKVJEJtXcX8cY1CcIJUx/mlgL0V3N8fVpaITHp0jIiddcpgz2apnsjP7KtHhWe1
	1E9KESnr3YRnm5al9zPfo1a2ecszCin4BKNXhsnyZePpCywU6ICyJdFLp218VvNXt2HItuijXdN/7
	4kH9axGRpwRnLWVEsXzwCD1Rlv5g4q20lNnkQdm+uO+iV9L1t7blKmndK3HOtQfU0qSoGSwEHlP7Q
	tXziu8lKD703jKLMgV3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzUf3-00000003ZNy-1hWz;
	Thu, 27 Aug 2026 07:36:33 +0000
Received: from out28-197.mail.aliyun.com ([115.124.28.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzUez-00000003ZKH-0pb9
	for linux-riscv@lists.infradead.org;
	Thu, 27 Aug 2026 07:36:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bosc.ac.cn; s=default;
	t=1787816181; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Zj1CGUu40u6mvDQVh2yoztBvTyR7+rnJQenMhLHVZow=;
	b=HDusTIS1qSIKcTaNXbNLkGUpU3rzZ4SWK0XYZpCMeEccL4ma0DRQALGKl1QR/eyQEeKFw6qw74PCtq4ROnOFPq7sL+x2FWMxqiG4jJjU1A3LDUN2a7jwEBtMtd6fiYrelrmoODEb0sixdfqW0PW1lUVavMp63B1jLbAJu6RtkgRZzSwWK5vwFKi4ZJpseb8wYQwWwcoCCDG23ts8uqTLtJhhcdWRmpt++TOjDrbGi31/wQc1FjH4YpAbQ8RIkvkmKkYiisNPpvocudD8PA6R/Tb5JBmbD6xYYycbPcNk9MfOMv8eHi7sSMDuDLMRqaTA1dDlS8cjr3aRcvmh+Vs7XA==
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07437934|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0491107-0.0354629-0.915426;FP=4643906214911627698|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037006180;MF=guoyaxing@bosc.ac.cn;NM=1;PH=DS;RN=16;RT=16;SR=0;TI=SMTPD_---.izBQHpp_1787816170;
Received: from guoyaxing..(mailfrom:guoyaxing@bosc.ac.cn fp:SMTPD_---.izBQHpp_1787816170 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 27 Aug 2026 15:36:19 +0800
From: Yaxing Guo <guoyaxing@bosc.ac.cn>
To: Paul Walmsley <pjw@kernel.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	guoyaxing@bosc.ac.cn,
	Zhizun Wang <anzoso@outlook.com>
Subject: [PATCH] riscv: mm: Flush vmemmap TLB after sparse_init()
Date: Thu, 27 Aug 2026 15:36:02 +0800
Message-ID: <20260827073603.141426-1-guoyaxing@bosc.ac.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_003630_004151_716A4439 
X-CRM114-Status: GOOD (  15.22  )
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

Commit 4267739cabb8 ("arch, mm: consolidate initialization of SPARSE
memory model") moved sparse_init() from RISC-V arch setup code into
free_area_init(), but left the RISC-V VMEMMAP TLB flush in
misc_mem_init(). RISC-V now flushes the VMEMMAP range before
sparse_init() populates the vmemmap page tables.

RISC-V supports caching non-present entries in the TLB. If a hart cached
a non-present translation for the VMEMMAP range, installing the vmemmap
page-table entries is not guaranteed to be observed until an sfence.vma
invalidates the stale entry. The first access to the corresponding
struct page during memmap initialization can then hit the old non-present
entry.

Call an arch hook at the end of sparse_init(), after the boot-time
vmemmap population has completed. On RISC-V, use flush_cache_vmap_early()
for the hook. Unlike flush_cache_vmap(), which can defer RISC-V
invalidation through the new_vmalloc lazy fault path,
flush_cache_vmap_early() maps to local_flush_tlb_kernel_range() and
performs the local sfence.vma needed before the boot hart accesses the
new mappings.

Observed boot failure:

  Unable to handle kernel paging request at virtual address ffffffd8002200038
  Current swapper pgtable: 4K pagesize, 48-bit VAs, pgdp=0000000083006000
  [ffff8d8002200038] pgd=0000000081a74401, p4d=0000000081a74401, pud=0000000081a74401, pmd=000000007fe800e7
  Oops [#1]
  CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 7.1.9-g3846b7652eb2-dirty #18 PREEMPTLAZY

  epc : __init_single_page+0x2a/0x128
  ra  : __init_single_page+0x26/0x128
  status: 0000000200000100 badaddr: ffffffd8002200038 cause: 000000000000000f
  [<ffffffff81621e04>] __init_single_page+0x2a/0x128
  [<ffffffff8162286c>] memmap_init_range+0x218/0x284
  [<ffffffff81624e68>] mm_core_init_early+0xe2c/0xf6e
  [<ffffffff81601188>] start_kernel+0x7a/0x612
  Code: 0385 3c23 fac4 8ab6 1097 feea 80e7 3580 8513 0304 (bc23) 0204
  Kernel panic - not syncing: Attempted to kill the idle task!

Fixes: 4267739cabb8 ("arch, mm: consolidate initialization of SPARSE memory model")
Link: https://lore.kernel.org/linux-riscv/7B0CB4ED-C190-4F49-97EE-E1F14F08DED2@linux.dev/
Co-developed-by: Zhizun Wang <anzoso@outlook.com>
Signed-off-by: Zhizun Wang <anzoso@outlook.com>
Signed-off-by: Yaxing Guo <guoyaxing@bosc.ac.cn>
---
 arch/riscv/mm/init.c | 13 +++++++++----
 include/linux/mm.h   |  1 +
 mm/sparse.c          |  5 +++++
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index decd7df40fa4..200a058e80ca 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -19,6 +19,7 @@
 #include <linux/set_memory.h>
 #include <linux/dma-map-ops.h>
 #include <linux/crash_dump.h>
+#include <linux/cacheflush.h>
 #include <linux/hugetlb.h>
 #include <linux/kfence.h>
 #include <linux/execmem.h>
@@ -1325,14 +1326,18 @@ void __init misc_mem_init(void)
 {
 	early_memtest(min_low_pfn << PAGE_SHIFT, max_low_pfn << PAGE_SHIFT);
 	arch_numa_init();
-#ifdef CONFIG_SPARSEMEM_VMEMMAP
-	/* The entire VMEMMAP region has been populated. Flush TLB for this region */
-	local_flush_tlb_kernel_range(VMEMMAP_START, VMEMMAP_END);
-#endif
 	arch_reserve_crashkernel();
 	memblock_dump_all();
 }
 
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+void __init arch_post_sparse_init(void)
+{
+	/* The entire VMEMMAP region has been populated by sparse_init(). */
+	flush_cache_vmap_early(VMEMMAP_START, VMEMMAP_END);
+}
+#endif
+
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
 void __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
 			       unsigned long addr, unsigned long next)
diff --git a/include/linux/mm.h b/include/linux/mm.h
index af23453e9dbd..5a75b69296cd 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -46,6 +46,7 @@ struct pt_regs;
 struct folio_batch;
 
 void arch_mm_preinit(void);
+void arch_post_sparse_init(void);
 void mm_core_init_early(void);
 void mm_core_init(void);
 void init_mm_internals(void);
diff --git a/mm/sparse.c b/mm/sparse.c
index effdac6b0ab1..ecf1b2510fb3 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -309,6 +309,10 @@ void __weak __meminit vmemmap_populate_print_last(void)
 {
 }
 
+void __weak __init arch_post_sparse_init(void)
+{
+}
+
 static void *sparse_usagebuf __meminitdata;
 static void *sparse_usagebuf_end __meminitdata;
 
@@ -446,4 +450,5 @@ void __init sparse_init(void)
 	/* cover the last node */
 	sparse_init_nid(nid_begin, pnum_begin, pnum_end, map_count);
 	vmemmap_populate_print_last();
+	arch_post_sparse_init();
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
