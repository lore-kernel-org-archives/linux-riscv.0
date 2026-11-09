Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66485606A323
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 11:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X/e4WW02;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=ZUs+FV59
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ry+wn/P+poqNNJXgSnomJeMgqATqGwG6siTYNMaxCo8=; b=X/e4WW02XdKVudWxtgAiqtgQA+
	ZBGI0HOIDP4uSZM1XAu+zJ5Jz5gA5DGk8ji0a05m+NP3MCwGGf2Kda158Mcefnj0LW3SHb8X2hZtT
	Hh5fhFzCc9blUTKMQFO8VX7H+OhLjcHz3DHCufgHdPodmas00RHoIVWIoUoo4p4NjWh2XbhuVib3Y
	D4ursmOHqwL7z/HWQ8c7pnpzih1ggrdIYx3eQx70GHvfnP+3DfWUDlfBW7E6dNDWinAuizddeqWFa
	MrzKROiqXeUTZfZsbAguolfWpDlCUi4GlhKmyZtweB9xT1FuWB20ra6nFrW4TtktjGkTnuBIJXxg+
	U15uVhlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQN87-00000000TlS-2bbr;
	Mon, 09 Nov 2026 11:01:39 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQN84-00000000Tk8-1XfF
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 11:01:38 +0000
Received: from mse-db.zte.com.cn (unknown [10.5.228.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jNRft36Scz8XrrJ;
	Mon, 09 Nov 2026 19:01:26 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794222086;
	bh=itkllB25WknucUpyACa0RC+UTO1VRBYX5JFqDj30goQ=;
	h=Date:From:To:Cc:Subject;
	b=ZUs+FV59KZ0bCuO+9b9BlOaIB9EPgu2xXOJA5LA0i1SUxrGoC2mk0QErmqMo+mrNS
	 DCTsaMNvXU/5VnIOYvrMCOOioOtXONIwGs4xWAvj536yWpRIBHwKnzOeYDb56VFgEL
	 f3Ash0CLECXby8f6HMsAUffLs94HxSfBMqe9qe0UbAsdv4qRJji12lBCHPhDCdyupY
	 7iCP2Ojtscw0OU90z3ETTGk6i+NukgzlLR0+EoBI0x+1Hbjllj3t0q/+ZqzOxAFqxg
	 dy/lEd8rlIk82FkX7wBKR1XLxCBGRX0xKzPGZWu7p4mt+V9I/yOAo2NXTR2oyffhSs
	 JF/09UXTx5txQ==
Received: (from root@localhost)
	by mse-db.zte.com.cn id 6A9B1Nf3015337;
	Mon, 9 Nov 2026 19:01:23 +0800 (+08)
	(envelope-from li.hanting@zte.com.cn)
Message-Id: <202611091101.6A9B1Nf3015337@mse-db.zte.com.cn>
Received: from njb2app06.zte.com.cn ([10.55.23.119])
	by mse-fl1.zte.com.cn with SMTP id 6A98Ea6W097280;
	Mon, 9 Nov 2026 16:14:36 +0800 (+08)
	(envelope-from li.hanting@zte.com.cn)
Received: from mapi (njy2app03[null])
	by mapi (Zmail) with MAPI id mid203;
	Mon, 9 Nov 2026 16:14:38 +0800 (CST)
X-Zmail-TransId: 2afb6af180ee1f1-e104d
X-Mailer: Zmail v1.0
Date: Mon, 9 Nov 2026 16:14:38 +0800 (CST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
From: <li.hanting@zte.com.cn>
To: <palmer@dabbelt.com>, <pjw@kernel.org>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-mm@kvack.org>, <akpm@linux-foundation.org>, <ljs@kernel.org>,
        <rppt@kernel.org>
Subject: =?UTF-8?B?W1JGQyBQQVRDSF0gcmlzY3Y6IG1tOiBhbGxvY2F0ZSBzcGxpdCBsaW5lYXIgbWFwcGluZyBwYWdlIHRhYmxlcyB2aWEgdGhlIHN0YW5kYXJkIHBhZ2UgdGFibGUgYWxsb2NhdGlvbiBBUElz?=
X-MAIL: mse-db.zte.com.cn 6A9B1Nf3015337
X-MSS: AUDITRELEASE@mse-db.zte.com.cn
X-TLS: YES
X-ENVELOPE-SENDER: li.hanting@zte.com.cn
X-SOURCE-IP: 10.5.228.131 unknown Mon, 09 Nov 2026 19:01:26 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF1A806.000/4jNRft36Scz8XrrJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_030136_931903_A9712FCB 
X-CRM114-Status: GOOD (  20.77  )
X-Spam-Score: -2.1 (--)
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

While looking at the fallout of that commit, I noticed that RISC-V
open-codes the same pattern when splitting the linear mapping on behalf
of set_memory_*(): __split_linear_mapping_{pmd,pud,p4d}() allocate the
new page table pages with bare alloc_page(GFP_KERNEL) - three call
sites in arch/riscv/mm/pageattr.c, introduced by 311cd2f6e253 ("riscv:
Fix set_memory_XX() and set_direct_map_XX() by splitting huge linear
mappings").

The consequences are the same as on pre-fix x86: page tables that live
in init_mm without the PG_table flag, without NR_PAGETABLE accounting
and without the kernel ptdesc marking.

To be clear about severity: this is a latent inconsistency, not an
exploitable bug today. RISC-V never collapses the split linear mapping
back, and these page tables are never freed, so there is no free-path
mismatch of the kind the x86 fix was concerned about. But the
accounting mismatch is real (/proc/vmstat under-counts kernel page
tables), and any future work that frees these tables - linear map
memory hotplug, collapse support or anything similar - would inherit
the exact bug class the x86 fix addressed.

This RFC aligns the three sites with the standard allocation paths:

 - the PTE level switches to pte_alloc_one_kernel(), exactly like the
   x86 fix;

 - the PMD and PUD levels have no *_alloc_one_kernel() variant today,
   so a small local helper wraps pagetable_alloc() +
   __pagetable_ctor() + ptdesc_set_kernel(), mirroring what the
   generic PTE path does. GFP_PGTABLE_KERNEL also brings in
   __GFP_ZERO, which the open-coded allocation was missing.

No functional change is intended; the observable difference is that
split linear mapping page tables now show up in
/proc/vmstat:nr_page_table_pages.

Open questions:

 1. Would it make sense to provide generic pmd_alloc_one_kernel() /
    pud_alloc_one_kernel() variants in asm-generic/pgalloc.h so that
    architectures do not have to open-code this dance? This is the
    main reason this is an RFC rather than a regular patch.

 2. Since these tables are never freed today, is it preferable to take
    this alignment now (my preference: it removes a trap for any
    future free-path work), or defer it until such work actually
    lands?

    (Note: the generic CPA rework series "[PATCH RFC 00/18] arch, mm:
    create a generic set_memory/change_page_attr core" would eventually
    replace this code entirely; this patch is intended as a small fix in
    the meantime. The series author has said he is waiting for such
    fixes to settle before posting a non-RFC version.)

Comments welcome.

Signed-off-by: Hanting Li <li.hanting@zte.com.cn>

---
 arch/riscv/mm/pageattr.c | 65 ++++++++++++++++++++++++++++-------------
 1 file changed, 44 insertions(+), 21 deletions(-)

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
@@ -93,6 +95,26 @@
 };

 #ifdef CONFIG_64BIT
+/*
+ * Kernel page tables allocated for the split linear mapping are never
+ * freed today, but they must still go through the page table constructor
+ * so that they are flagged PG_table, accounted in NR_PAGETABLE and marked
+ * as kernel page tables, like any other kernel page table allocated via
+ * the standard allocation APIs.
+ */
+static struct ptdesc *alloc_kernel_pgtable(void)
+{
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_PGTABLE_KERNEL, 0);
+
+	if (!ptdesc)
+		return NULL;
+
+	__pagetable_ctor(ptdesc);
+	ptdesc_set_kernel(ptdesc);
+
+	return ptdesc;
+}
+
 static int __split_linear_mapping_pmd(pud_t *pudp,
 				      unsigned long vaddr, unsigned long end)
 {
@@ -109,23 +131,22 @@
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

@@ -149,24 +170,25 @@
 			continue;

 		if (pud_leaf(pudp_get(pudp))) {
-			struct page *pmd_page;
+			struct ptdesc *ptdesc;
 			unsigned long pfn = _pud_pfn(pudp_get(pudp));
 			pgprot_t prot = __pgprot(pud_val(pudp_get(pudp)) & ~_PAGE_PFN_MASK);
 			pmd_t *pmdp_new;
 			int i;

-			pmd_page = alloc_page(GFP_KERNEL);
-			if (!pmd_page)
+			ptdesc = alloc_kernel_pgtable();
+			if (!ptdesc)
 				return -ENOMEM;

-			pmdp_new = (pmd_t *)page_address(pmd_page);
-			for (i = 0; i < PTRS_PER_PMD; ++i, ++pmdp_new)
-				set_pmd(pmdp_new,
+			pmdp_new = (pmd_t *)ptdesc_address(ptdesc);
+			for (i = 0; i < PTRS_PER_PMD; ++i)
+				set_pmd(pmdp_new + i,
 					pfn_pmd(pfn + ((i * PMD_SIZE) >> PAGE_SHIFT), prot));

 			smp_wmb();

-			set_pud(pudp, pfn_pud(page_to_pfn(pmd_page), PAGE_TABLE));
+			set_pud(pudp, pfn_pud(page_to_pfn(ptdesc_page(ptdesc)),
+					      PAGE_TABLE));
 		}

 		ret = __split_linear_mapping_pmd(pudp, vaddr, next);
@@ -198,23 +220,23 @@
 			continue;

 		if (p4d_leaf(p4dp_get(p4dp))) {
-			struct page *pud_page;
+			struct ptdesc *ptdesc;
 			unsigned long pfn = _p4d_pfn(p4dp_get(p4dp));
 			pgprot_t prot = __pgprot(p4d_val(p4dp_get(p4dp)) & ~_PAGE_PFN_MASK);
 			pud_t *pudp_new;
 			int i;

-			pud_page = alloc_page(GFP_KERNEL);
-			if (!pud_page)
+			ptdesc = alloc_kernel_pgtable();
+			if (!ptdesc)
 				return -ENOMEM;

 			/*
 			 * Fill the pud level with leaf puds that have the same
 			 * protections as the leaf p4d.
 			 */
-			pudp_new = (pud_t *)page_address(pud_page);
-			for (i = 0; i < PTRS_PER_PUD; ++i, ++pudp_new)
-				set_pud(pudp_new,
+			pudp_new = (pud_t *)ptdesc_address(ptdesc);
+			for (i = 0; i < PTRS_PER_PUD; ++i)
+				set_pud(pudp_new + i,
 					pfn_pud(pfn + ((i * PUD_SIZE) >> PAGE_SHIFT), prot));

 			/*
@@ -224,7 +246,8 @@
 			 */
 			smp_wmb();

-			set_p4d(p4dp, pfn_p4d(page_to_pfn(pud_page), PAGE_TABLE));
+			set_p4d(p4dp, pfn_p4d(page_to_pfn(ptdesc_page(ptdesc)),
+					      PAGE_TABLE));
 		}

 		ret = __split_linear_mapping_pud(p4dp, vaddr, next);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
