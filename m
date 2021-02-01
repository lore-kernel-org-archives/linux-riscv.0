Return-Path: <SRS0=n5X/=HD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33AC1C433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Feb 2021 08:00:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E862F64E11
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Feb 2021 08:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E862F64E11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EQtrSdprS+hosEQ7HFeU9WoOVfpVw9fa6Y5naq1a3g4=; b=L99GS8lMcqY9ijQmdRKHlauMuL
	XZifC75qCkh1BHQOzwNJcDYEBymStP340cnICWaojWkVUTGNIxudcqm1303DWuFnzgysnZKo6xaOX
	u+lqYYtuH+POiBGCwqRw1Ain4MfSn4nzJaWoVIlpQvAMIrGU4o2DXGehBrdpc3j9HAkli1/AT9RWW
	d+L0F0F2A0ggj3Rsod9/MDdTK7d6M4uKd8fx360oQ4T9l2YNjJBtUnRLvznekSKcoymfcVvYmfBWG
	r0ByoIuLfjP/YlBWs5gtdzdiln03fkFl0bTiHwtFeF4oDHZVc9CctxvKui9ChcEOGKW37Gw6uS1OK
	CArH9EHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6U8U-0008Ar-6c; Mon, 01 Feb 2021 08:00:38 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6U8R-0008AJ-7Y
 for linux-riscv@lists.infradead.org; Mon, 01 Feb 2021 08:00:36 +0000
X-Originating-IP: 82.65.183.113
Received: from debian.internal.upmem.com (82-65-183-113.subs.proxad.net
 [82.65.183.113]) (Authenticated sender: alex@ghiti.fr)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 481CE2000E;
 Mon,  1 Feb 2021 08:00:26 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Potapenko <glider@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 kasan-dev@googlegroups.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Improve kasan population by using hugepages when
 possible
Date: Mon,  1 Feb 2021 03:00:24 -0500
Message-Id: <20210201080024.844-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_030035_470202_B402A4E9 
X-CRM114-Status: GOOD (  15.22  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Kasan function that populates the shadow regions used to allocate them
page by page and did not take advantage of hugepages, so fix this by
trying to allocate hugepages of 1GB and fallback to 2MB hugepages or 4K
pages in case it fails.

This reduces the page table memory consumption and improves TLB usage,
as shown below:

Before this patch:

---[ Kasan shadow start ]---
0xffffffc000000000-0xffffffc400000000    0x00000000818ef000        16G PTE     . A . . . . R V
0xffffffc400000000-0xffffffc447fc0000    0x00000002b7f4f000   1179392K PTE     D A . . . W R V
0xffffffc480000000-0xffffffc800000000    0x00000000818ef000        14G PTE     . A . . . . R V
---[ Kasan shadow end ]---

After this patch:

---[ Kasan shadow start ]---
0xffffffc000000000-0xffffffc400000000    0x00000000818ef000        16G PTE     . A . . . . R V
0xffffffc400000000-0xffffffc440000000    0x0000000240000000         1G PGD     D A . . . W R V
0xffffffc440000000-0xffffffc447e00000    0x00000002b7e00000       126M PMD     D A . . . W R V
0xffffffc447e00000-0xffffffc447fc0000    0x00000002b818f000      1792K PTE     D A . . . W R V
0xffffffc480000000-0xffffffc800000000    0x00000000818ef000        14G PTE     . A . . . . R V
---[ Kasan shadow end ]---

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/mm/kasan_init.c | 101 +++++++++++++++++++++++++++----------
 1 file changed, 73 insertions(+), 28 deletions(-)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index a8a2ffd9114a..8f11b73018b1 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -47,37 +47,82 @@ asmlinkage void __init kasan_early_init(void)
 	local_flush_tlb_all();
 }
 
-static void __init populate(void *start, void *end)
+static void kasan_populate_pte(pmd_t *pmd, unsigned long vaddr, unsigned long end)
+{
+	phys_addr_t phys_addr;
+	pte_t *ptep = memblock_alloc(PTRS_PER_PTE * sizeof(pte_t), PAGE_SIZE);
+
+	do {
+		phys_addr = memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
+		set_pte(ptep, pfn_pte(PFN_DOWN(phys_addr), PAGE_KERNEL));
+	} while (ptep++, vaddr += PAGE_SIZE, vaddr != end);
+
+	set_pmd(pmd, pfn_pmd(PFN_DOWN(__pa(ptep)), PAGE_TABLE));
+}
+
+static void kasan_populate_pmd(pgd_t *pgd, unsigned long vaddr, unsigned long end)
+{
+	phys_addr_t phys_addr;
+	pmd_t *pmdp = memblock_alloc(PTRS_PER_PMD * sizeof(pmd_t), PAGE_SIZE);
+	unsigned long next;
+
+	do {
+		next = pmd_addr_end(vaddr, end);
+
+		if (IS_ALIGNED(vaddr, PMD_SIZE) && (next - vaddr) >= PMD_SIZE) {
+			phys_addr = memblock_phys_alloc(PMD_SIZE, PMD_SIZE);
+			if (phys_addr) {
+				set_pmd(pmdp, pfn_pmd(PFN_DOWN(phys_addr), PAGE_KERNEL));
+				continue;
+			}
+		}
+
+		kasan_populate_pte(pmdp, vaddr, end);
+	} while (pmdp++, vaddr = next, vaddr != end);
+
+	/*
+	 * Wait for the whole PGD to be populated before setting the PGD in
+	 * the page table, otherwise, if we did set the PGD before populating
+	 * it entirely, memblock could allocate a page at a physical address
+	 * where KASAN is not populated yet and then we'd get a page fault.
+	 */
+	set_pgd(pgd, pfn_pgd(PFN_DOWN(__pa(pmdp)), PAGE_TABLE));
+}
+
+static void kasan_populate_pgd(unsigned long vaddr, unsigned long end)
+{
+	phys_addr_t phys_addr;
+	pgd_t *pgdp = pgd_offset_k(vaddr);
+	unsigned long next;
+
+	do {
+		next = pgd_addr_end(vaddr, end);
+
+		if (IS_ALIGNED(vaddr, PGDIR_SIZE) && (next - vaddr) >= PGDIR_SIZE) {
+			phys_addr = memblock_phys_alloc(PGDIR_SIZE, PGDIR_SIZE);
+			if (phys_addr) {
+				set_pgd(pgdp, pfn_pgd(PFN_DOWN(phys_addr), PAGE_KERNEL));
+				continue;
+			}
+		}
+
+		kasan_populate_pmd(pgdp, vaddr, end);
+	} while (pgdp++, vaddr = next, vaddr != end);
+}
+
+/*
+ * This function populates KASAN shadow region focusing on hugepages in
+ * order to minimize the page table cost and TLB usage too.
+ * Note that start must be PGDIR_SIZE-aligned in SV39 which amounts to be
+ * 1G aligned (that represents a 8G alignment constraint on virtual address
+ * ranges because of KASAN_SHADOW_SCALE_SHIFT).
+ */
+static void __init kasan_populate(void *start, void *end)
 {
-	unsigned long i, offset;
 	unsigned long vaddr = (unsigned long)start & PAGE_MASK;
 	unsigned long vend = PAGE_ALIGN((unsigned long)end);
-	unsigned long n_pages = (vend - vaddr) / PAGE_SIZE;
-	unsigned long n_ptes =
-	    ((n_pages + PTRS_PER_PTE) & -PTRS_PER_PTE) / PTRS_PER_PTE;
-	unsigned long n_pmds =
-	    ((n_ptes + PTRS_PER_PMD) & -PTRS_PER_PMD) / PTRS_PER_PMD;
-
-	pte_t *pte =
-	    memblock_alloc(n_ptes * PTRS_PER_PTE * sizeof(pte_t), PAGE_SIZE);
-	pmd_t *pmd =
-	    memblock_alloc(n_pmds * PTRS_PER_PMD * sizeof(pmd_t), PAGE_SIZE);
-	pgd_t *pgd = pgd_offset_k(vaddr);
-
-	for (i = 0; i < n_pages; i++) {
-		phys_addr_t phys = memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
-		set_pte(&pte[i], pfn_pte(PHYS_PFN(phys), PAGE_KERNEL));
-	}
-
-	for (i = 0, offset = 0; i < n_ptes; i++, offset += PTRS_PER_PTE)
-		set_pmd(&pmd[i],
-			pfn_pmd(PFN_DOWN(__pa(&pte[offset])),
-				__pgprot(_PAGE_TABLE)));
 
-	for (i = 0, offset = 0; i < n_pmds; i++, offset += PTRS_PER_PMD)
-		set_pgd(&pgd[i],
-			pfn_pgd(PFN_DOWN(__pa(&pmd[offset])),
-				__pgprot(_PAGE_TABLE)));
+	kasan_populate_pgd(vaddr, vend);
 
 	local_flush_tlb_all();
 	memset(start, 0, end - start);
@@ -99,7 +144,7 @@ void __init kasan_init(void)
 		if (start >= end)
 			break;
 
-		populate(kasan_mem_to_shadow(start), kasan_mem_to_shadow(end));
+		kasan_populate(kasan_mem_to_shadow(start), kasan_mem_to_shadow(end));
 	};
 
 	for (i = 0; i < PTRS_PER_PTE; i++)
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
