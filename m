Return-Path: <SRS0=+l7Y=HK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04665C433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 19:33:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BBE464E85
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 19:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BBE464E85
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=98obmhcY6Jsq1Z+eepThNzUyZX0i1lgLlQlZbvLH8Ss=; b=kwaTlETi7/HwUWLgTvLsCpACx
	vDXUZ+Y7HkLLaSKReE9vZ0K5cWU6gyxjXK97tsMg+oQYX0I7n5DdsJcGc7FjJmAs2Hd4okAW+3dkU
	ks8eNyJ3Do5CPWaLg0ZMQuwrUVD1jNBV7rLaVOKrqKF3ld/1a5IgxuH2bbXZUBPVT6C0kFiTZILx8
	Fy0d5TclKc0mKJCySA+jYoBHtsstDwRF8dSxtY0D5I2AdX3wcWEijBmIWWtgapCiLhog/k3VbGEJq
	XnHjxsh+Okepuz/jKJIAVqjnravYkY716Nlh2ttPAkFwHd7v6PjmKKPOgj7DUNczft5rMTejzu9nM
	clOlhmXxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9CI1-0007NN-Ei; Mon, 08 Feb 2021 19:33:41 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9CHy-0007Mp-AN
 for linux-riscv@lists.infradead.org; Mon, 08 Feb 2021 19:33:39 +0000
X-Originating-IP: 2.7.49.219
Received: from debian.home (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id D3BB0240005;
 Mon,  8 Feb 2021 19:33:31 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Potapenko <glider@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 kasan-dev@googlegroups.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] riscv: Improve kasan population function
Date: Mon,  8 Feb 2021 14:30:16 -0500
Message-Id: <20210208193017.30904-4-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210208193017.30904-1-alex@ghiti.fr>
References: <20210208193017.30904-1-alex@ghiti.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_143338_560225_959B1C41 
X-CRM114-Status: GOOD (  16.22  )
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

Current population code populates a whole page table without taking care
of what could have been already allocated and without taking into account
possible index in page table, assuming the virtual address to map is always
aligned on the page table size, which, for example, won't be the case when
the kernel will get pushed to the end of the address space.

Address those problems by rewriting the kasan population function,
splitting it into subfunctions for each different page table level.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/mm/kasan_init.c | 91 ++++++++++++++++++++++++++------------
 1 file changed, 63 insertions(+), 28 deletions(-)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index 7bbe09416a2e..b7d4d9abd144 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -47,37 +47,72 @@ asmlinkage void __init kasan_early_init(void)
 	local_flush_tlb_all();
 }
 
-static void __init populate(void *start, void *end)
+static void kasan_populate_pte(pmd_t *pmd, unsigned long vaddr, unsigned long end)
+{
+	phys_addr_t phys_addr;
+	pte_t *ptep, *base_pte;
+
+	if (pmd_none(*pmd))
+		base_pte = memblock_alloc(PTRS_PER_PTE * sizeof(pte_t), PAGE_SIZE);
+	else
+		base_pte = (pte_t *)pmd_page_vaddr(*pmd);
+
+	ptep = base_pte + pte_index(vaddr);
+
+	do {
+		if (pte_none(*ptep)) {
+			phys_addr = memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
+			set_pte(ptep, pfn_pte(PFN_DOWN(phys_addr), PAGE_KERNEL));
+		}
+	} while (ptep++, vaddr += PAGE_SIZE, vaddr != end);
+
+	set_pmd(pmd, pfn_pmd(PFN_DOWN(__pa(base_pte)), PAGE_TABLE));
+}
+
+static void kasan_populate_pmd(pgd_t *pgd, unsigned long vaddr, unsigned long end)
+{
+	phys_addr_t phys_addr;
+	pmd_t *pmdp, *base_pmd;
+	unsigned long next;
+
+	base_pmd = (pmd_t *)pgd_page_vaddr(*pgd);
+	if (base_pmd == lm_alias(kasan_early_shadow_pmd))
+		base_pmd = memblock_alloc(PTRS_PER_PMD * sizeof(pmd_t), PAGE_SIZE);
+
+	pmdp = base_pmd + pmd_index(vaddr);
+
+	do {
+		next = pmd_addr_end(vaddr, end);
+		kasan_populate_pte(pmdp, vaddr, next);
+	} while (pmdp++, vaddr = next, vaddr != end);
+
+	/*
+	 * Wait for the whole PGD to be populated before setting the PGD in
+	 * the page table, otherwise, if we did set the PGD before populating
+	 * it entirely, memblock could allocate a page at a physical address
+	 * where KASAN is not populated yet and then we'd get a page fault.
+	 */
+	set_pgd(pgd, pfn_pgd(PFN_DOWN(__pa(base_pmd)), PAGE_TABLE));
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
+		kasan_populate_pmd(pgdp, vaddr, next);
+	} while (pgdp++, vaddr = next, vaddr != end);
+}
+
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
 	memset(start, KASAN_SHADOW_INIT, end - start);
@@ -99,7 +134,7 @@ void __init kasan_init(void)
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
