Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967BF606A31A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 08:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c3e8VDBP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=rcxxw4Af
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VlkLBC//fhraWq/HFqwLFB/kEee2Gwzl9UOXVqOG+s0=; b=c3e8VDBP6QnXhaDBxVYwQhP+Ej
	ahvdadUURqWXQ2bQF6KAXRa4dY4yYjvLpl8lw8fUm9QmbjcVkAoiMFnrQxox1+JZTiYVT2AWCt4vX
	Wer8BL4PQ+Z+NWwExIq6Joof3yZLykgTs6ZU35GDyWhteZZnuLc2SCICMDkPm+7Aytob4aTabzY/O
	dckBH6Gdry2Z97LNyxN9Y9tsSn4jyE1jD5rFP5PTA40odoBZYlpNRr8A43wNACAgBTpdEDXqWtedD
	evk73NNZYzoORnP4wEUwVXsZAZfsIPsh1i+kXDpkyLdlOPVj3vRffrBPIi//SG8zkpmBOPa8W37Vb
	2gs7YCWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPlu-00000002bkI-2XpX;
	Mon, 23 Nov 2026 08:51:34 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPlq-00000002biR-2EGH
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 08:51:33 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jY06C6Qnfz5B7RB;
	Mon, 23 Nov 2026 16:51:15 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1795423876;
	bh=cVG2XoK0ElJXi5aZovzr665A2Cep3ko3KkzHGkB5Ikk=;
	h=Date:From:To:Cc:Subject;
	b=rcxxw4AfncxsHVJ0HXC25OV2DcV4UaiLgYXBLt7TVvyXThhSFyFtqjqDyMbHFFLEW
	 IHWKczxIrUCKBFAi5Y/yjJWWLyS74WZrjEdMBTRxszKTcah3Jsxl3/XjP656XGK/8f
	 N5QCBoVRDQNpNBtJeV2avhW29sTmEju0Dzf2V0xuyv6/bSC9hw/RAFCGgvpKKTjdnl
	 sjjKYqvdR0Bn9Q7M9FUcB0a5N4M1bRrt59yAUHd3LJ1lhE7phS00MjeOUHKjRKDolx
	 J8QckCEUvuC1AZAWco76sw9d9Wxx+T9rGZ/SwUnf/7ss9v+Q9D8SZIrzG2la8nUY5b
	 NHaQyRubQceOQ==
Received: (from root@localhost)
	by mse-fl1.zte.com.cn id 6AN8pFDD065900;
	Mon, 23 Nov 2026 16:51:15 +0800 (+08)
	(envelope-from li.hanting@zte.com.cn)
Message-Id: <202611230851.6AN8pFDD065900@mse-fl1.zte.com.cn>
Received: from njy2app08.zte.com.cn ([10.40.13.206])
	by mse-fl2.zte.com.cn with SMTP id 6AN7vv0x060409;
	Mon, 23 Nov 2026 15:57:57 +0800 (+08)
	(envelope-from li.hanting@zte.com.cn)
Received: from mapi (njy2app08[null])
	by mapi (Zmail) with MAPI id mid203;
	Mon, 23 Nov 2026 15:57:59 +0800 (CST)
X-Zmail-TransId: 2b006b03f20744a-c5a8d
X-Mailer: Zmail v1.0
Date: Mon, 23 Nov 2026 15:57:59 +0800 (CST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
From: <li.hanting@zte.com.cn>
To: <palmer@dabbelt.com>, <pjw@kernel.org>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-mm@kvack.org>, <akpm@linux-foundation.org>, <rppt@kernel.org>,
        <songmuchun@bytedance.com>
Subject: =?UTF-8?B?W1BBVENIIHYyXSByaXNjdjogbW06IGFsbG9jYXRlIHNwbGl0IGxpbmVhciBtYXBwaW5nIHBhZ2UgdGFibGVzIHZpYSB0aGUgc3RhbmRhcmQgcGFnZSB0YWJsZSBhbGxvY2F0aW9uIEFQSXM=?=
X-MAIL: mse-fl1.zte.com.cn 6AN8pFDD065900
X-MSS: AUDITRELEASE@mse-fl1.zte.com.cn
X-TLS: YES
X-ENVELOPE-SENDER: li.hanting@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Mon, 23 Nov 2026 16:51:16 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6B03FE83.000/4jY06C6Qnfz5B7RB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_005131_206639_A3C63A4E 
X-CRM114-Status: GOOD (  18.83  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Commit 9e4a3ec3411b ("x86/mm/pat: Allocate split page tables as kernel
page tables") recently fixed a latent inconsistency in the x86 CPA code
(assigned CVE-2026-97525): __split_large_page() allocated the new PTE
page with a bare pagetable_alloc(), bypassing pte_alloc_one_kernel(), so
the page table constructor never ran and the resulting page was neither
flagged PG_table, nor accounted in NR_PAGETABLE, nor marked as a kernel
page table.

RISC-V open-codes the same pattern when splitting the linear mapping on
behalf of set_memory_*(): __split_linear_mapping_{pmd,pud,p4d}()
allocate the new page table pages with bare alloc_page(GFP_KERNEL) -
three call sites in arch/riscv/mm/pageattr.c, introduced by
commit 311cd2f6e253 ("riscv: Fix set_memory_XX() and set_direct_map_XX()
by splitting huge linear mappings").

As on pre-fix x86, the resulting pages live in init_mm without the
PG_table flag, without NR_PAGETABLE accounting and without the kernel
ptdesc marking. Under CONFIG_MEMORY_HOTPLUG, hot-removing memory tears
down the linear mapping of the removed range via arch_remove_memory()
-> remove_linear_mapping() -> free_p*d_table(), which releases these
page tables through pagetable_dtor() even though the constructor never
ran, underflowing NR_PAGETABLE on current mainline. Muchun Song's
series "mm: Fix page-table teardown during memory hot-remove" [2]
fixes the freeing side by skipping the destructor for pages without
the PG_table flag, but the root cause remains: the allocation side
still bypasses the page-table constructors, so these tables are
unflagged and unaccounted for their entire lifetime.

Align the three sites with the standard allocation paths:

 - the PTE level switches to pte_alloc_one_kernel(&init_mm), exactly
   like the x86 fix;

 - the PMD and PUD levels switch to the generic pmd_alloc_one() and
   pud_alloc_one(), which already handle the init_mm case by selecting
   GFP_PGTABLE_KERNEL, running the level constructors and marking the
   ptdesc as a kernel page table.

No functional change is intended; the observable difference is that
split linear mapping page tables are now properly flagged and
accounted, so /proc/vmstat:nr_page_table_pages no longer under-counts.

Fixes: 311cd2f6e253 ("riscv: Fix set_memory_XX() and set_direct_map_XX() by splitting huge linear mappings")
Signed-off-by: Hanting Li <li.hanting@zte.com.cn>

---
Changes since v1 [1]:

- Switch the PMD and PUD levels to the generic pmd_alloc_one() /
  pud_alloc_one() instead of a local helper, as suggested by the
  Sashiko automated review. The generic versions already handle
  init_mm correctly, which also resolves the first open question of
  v1.

- Correct the severity discussion. v1 claimed these page tables are
  never freed; that is wrong under CONFIG_MEMORY_HOTPLUG, where memory
  hot-removal frees them through remove_linear_mapping() ->
  free_p*d_table() -> pagetable_dtor(), so the ctor/dtor mismatch can
  actually underflow NR_PAGETABLE. Also pointed out by the automated
  review.

- Add the Fixes: tag and move the discussion notes below the tear
  line.

[1] https://lore.kernel.org/r/202611091101.6A9B1Nf3015337@mse-db.zte.com.cn
[2] https://lore.kernel.org/r/20261008073021.2512665-3-songmuchun@bytedance.com

Hello,

One discussion point from v1 remains open:

Since RISC-V never collapses the split linear mapping back, one could
argue for deferring this change until free-path work actually lands.
My preference is to take it now: with CONFIG_MEMORY_HOTPLUG the free
path already exists today, and taking this now removes a trap for any
future work on the linear mapping.

(Note: the generic CPA rework series "[PATCH RFC 00/18] arch, mm:
create a generic set_memory/change_page_attr core" would eventually
replace this code entirely; this patch is intended as a small fix in
the meantime. The series author has said he is waiting for such fixes
to settle before posting a non-RFC version.)

Comments welcome.

 arch/riscv/mm/pageattr.c | 41 +++++++++++++++++------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -3,9 +3,11 @@
  * Copyright (C) 2019 SiFive
  */

+#include <linux/mm.h>
 #include <linux/pagewalk.h>
 #include <linux/pgtable.h>
 #include <linux/vmalloc.h>
+#include <asm/pgalloc.h>
 #include <asm/tlbflush.h>
 #include <asm/bitops.h>
 #include <asm/set_memory.h>
@@ -109,23 +111,22 @@ static int __split_linear_mapping_pmd(pud_t *pudp,
 			continue;

 		if (pmd_leaf(pmdp_get(pmdp))) {
-			struct page *pte_page;
 			unsigned long pfn = _pmd_pfn(pmdp_get(pmdp));
 			pgprot_t prot = __pgprot(pmd_val(pmdp_get(pmdp)) & ~_PAGE_PFN_MASK);
 			pte_t *ptep_new;
 			int i;

-			pte_page = alloc_page(GFP_KERNEL);
-			if (!pte_page)
+			ptep_new = pte_alloc_one_kernel(&init_mm);
+			if (!ptep_new)
 				return -ENOMEM;

-			ptep_new = (pte_t *)page_address(pte_page);
-			for (i = 0; i < PTRS_PER_PTE; ++i, ++ptep_new)
-				set_pte(ptep_new, pfn_pte(pfn + i, prot));
+			for (i = 0; i < PTRS_PER_PTE; ++i)
+				set_pte(ptep_new + i, pfn_pte(pfn + i, prot));

 			smp_wmb();

-			set_pmd(pmdp, pfn_pmd(page_to_pfn(pte_page), PAGE_TABLE));
+			set_pmd(pmdp, pfn_pmd(page_to_pfn(virt_to_page(ptep_new)),
+					      PAGE_TABLE));
 		}
 	} while (pmdp++, vaddr = next, vaddr != end);

@@ -149,24 +150,23 @@ static int __split_linear_mapping_pud(p4d_t *p4dp,
 			continue;

 		if (pud_leaf(pudp_get(pudp))) {
-			struct page *pmd_page;
 			unsigned long pfn = _pud_pfn(pudp_get(pudp));
 			pgprot_t prot = __pgprot(pud_val(pudp_get(pudp)) & ~_PAGE_PFN_MASK);
 			pmd_t *pmdp_new;
 			int i;

-			pmd_page = alloc_page(GFP_KERNEL);
-			if (!pmd_page)
+			pmdp_new = pmd_alloc_one(&init_mm, vaddr);
+			if (!pmdp_new)
 				return -ENOMEM;

-			pmdp_new = (pmd_t *)page_address(pmd_page);
-			for (i = 0; i < PTRS_PER_PMD; ++i, ++pmdp_new)
-				set_pmd(pmdp_new,
+			for (i = 0; i < PTRS_PER_PMD; ++i)
+				set_pmd(pmdp_new + i,
 					pfn_pmd(pfn + ((i * PMD_SIZE) >> PAGE_SHIFT), prot));

 			smp_wmb();

-			set_pud(pudp, pfn_pud(page_to_pfn(pmd_page), PAGE_TABLE));
+			set_pud(pudp, pfn_pud(page_to_pfn(virt_to_page(pmdp_new)),
+					      PAGE_TABLE));
 		}

 		ret = __split_linear_mapping_pmd(pudp, vaddr, next);
@@ -198,23 +198,21 @@ static int __split_linear_mapping_p4d(pgd_t *pgdp,
 			continue;

 		if (p4d_leaf(p4dp_get(p4dp))) {
-			struct page *pud_page;
 			unsigned long pfn = _p4d_pfn(p4dp_get(p4dp));
 			pgprot_t prot = __pgprot(p4d_val(p4dp_get(p4dp)) & ~_PAGE_PFN_MASK);
 			pud_t *pudp_new;
 			int i;

-			pud_page = alloc_page(GFP_KERNEL);
-			if (!pud_page)
+			pudp_new = pud_alloc_one(&init_mm, vaddr);
+			if (!pudp_new)
 				return -ENOMEM;

 			/*
 			 * Fill the pud level with leaf puds that have the same
 			 * protections as the leaf p4d.
 			 */
-			pudp_new = (pud_t *)page_address(pud_page);
-			for (i = 0; i < PTRS_PER_PUD; ++i, ++pudp_new)
-				set_pud(pudp_new,
+			for (i = 0; i < PTRS_PER_PUD; ++i)
+				set_pud(pudp_new + i,
 					pfn_pud(pfn + ((i * PUD_SIZE) >> PAGE_SHIFT), prot));

 			/*
@@ -224,7 +222,8 @@ static int __split_linear_mapping_p4d(pgd_t *pgdp,
 			 */
 			smp_wmb();

-			set_p4d(p4dp, pfn_p4d(page_to_pfn(pud_page), PAGE_TABLE));
+			set_p4d(p4dp, pfn_p4d(page_to_pfn(virt_to_page(pudp_new)),
+					      PAGE_TABLE));
 		}

 		ret = __split_linear_mapping_pud(p4dp, vaddr, next);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
