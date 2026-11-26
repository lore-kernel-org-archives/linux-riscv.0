Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B381E606A321
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 11:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2pdPt0oe;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E1TJoT8r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=trXj4eZlxeqL3LzAUvrtZxtt2zI3djnCNsbqxKeQqPo=; b=2pdPt0oeQ4e2Zm4PAtY8w3a01s
	60XehuSkBwCfU3jovVu48KkIRkgiXEIHorOTekIEw7YVebH43Mhq/LvLrpbaSt2/rq+Jt8tcrAZKC
	MC3QfKfnyzfXLr/yx+eCeVJ7cB6U3X7eWmeu2RhVGICY0hIcAyAgID33mBH0tivm6Ux+n4xr+PgBL
	7Aoc+EFfZaa1fTdHmPg3ND/t5zFEp2TBay4fl+yxyob7sVU14LRJt2DqKQKpTazThFCiIdqGt0BpT
	1zP2IbMhJF6i1EHJcQjQEhECQIUUzuowqY/3Bcg2+J57AGvVbvf1k+EGR1u1UeeHFalSMSullHgtQ
	6Ev8GLqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXXn-0000000Cwlj-3RDz;
	Thu, 26 Nov 2026 11:21:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXWc-0000000Cvb9-19IU;
	Thu, 26 Nov 2026 11:20:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 09BB641704;
	Thu, 26 Nov 2026 11:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D3FB1F000C4;
	Thu, 26 Nov 2026 11:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795692025;
	bh=HGpkwMSSBdHw0hjJcvg7ScFLxw/cXXPctNM1u/isMBg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=E1TJoT8rfxY4RKfkKoTv4gchUZwLK2Dx0k15Ppol9x6DQ+Czm3zQkgQ+GemeSZ9Sf
	 qCz67rIZWDRaOcrjmNSJG+RSk/fYjuNUnRi1qRMYYDGYCFR5B926udrFbyW+JQPZ9y
	 BFzSv23zzVZ3JsfXlIVzWUcrJPHAX3+RCiV/zFmcdE21b0JYQ9G1UTCb4S6D6C7e7J
	 3lQkoarGeF+zT6Yuh2JOCRVnuYIB5omdAF69m8p5HljFjcGGBSU5k77wsCbSC5merl
	 VtcPwSwA4Ox7w+wRkTejliEVb+aBZW61I2onfp405VoHoeUY2ztMHHn6YbmyzKkGQA
	 X+aD2454IOH1g==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 26 Nov 2026 13:14:50 +0200
Subject: [PATCH RFC v2 37/54] ARM: mm: use the generic CPA core
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-generic-set-memory-v0-1-v2-37-723f1e33c3d8@kernel.org>
References: <20261126-generic-set-memory-v0-1-v2-0-723f1e33c3d8@kernel.org>
In-Reply-To: <20261126-generic-set-memory-v0-1-v2-0-723f1e33c3d8@kernel.org>
To: linux-mm@kvack.org
Cc: =?utf-8?q?Adrian_Barna=C5=9B?= <abarnas@google.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Borislav Petkov <bp@alien8.de>, Brendan Jackman <brendan.jackman@linux.dev>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 David Hildenbrand <david@kernel.org>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
 Ingo Molnar <mingo@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <pjw@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Vasily Gorbik <gor@linux.ibm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, x86@kernel.org
X-Mailer: b4 0.16.1-dev
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The availability of the generic CPA core makes ARM's implementation of
set_memory_*() APIs unnecessary and it can be replaced with several hooks
required by CPA core.

This way the core can manage the policy decisions and the architecture only
has to take care of the page table manipulation.

Switch to the generic CPA core and its set_memory() entry points.
For ARM this means that:

* a hole in the range fails the request with a warning instead of getting a
  page table
* nothing is written or flushed when nothing changes
* a request on a section, which ioremap() may create in the vmalloc area on
  !SMP, still fails with a warning and -EINVAL
* a request on a static I/O mapping, which may use sections in the vmalloc
  area, fails with a warning and -EINVAL as well
* a request that fails flushes the entire TLB
* set_memory_rox() is a single request instead of set_memory_ro() followed
  by set_memory_x()
* lazily unmapped vmap areas and unused kmaps are purged before a request,
  so that they do not keep stale mappings or TLB entries with the old
  protection

ARM only changes ranges mapped with base pages: modules and vmalloc, as
checked before, and the KFENCE pool, which arch_kfence_init_pool() splits.

KFENCE keeps set_memory_valid(), which runs with interrupts disabled. It
now walks with apply_to_existing_page_range(), which never allocates,
rather than apply_to_page_range(), which allocates a page table for a hole
with GFP_KERNEL.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/arm/Kconfig                  |  1 +
 arch/arm/include/asm/set_memory.h |  6 +--
 arch/arm/mm/pageattr.c            | 96 +++++++++++++++++++++++++--------------
 3 files changed, 65 insertions(+), 38 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 0cc289a7184a..7a7ccc113126 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -77,6 +77,7 @@ config ARM
 	select GENERIC_IRQ_SHOW
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
+	select GENERIC_PAGEATTR if MMU
 	select GENERIC_PCI_IOMAP
 	select GENERIC_SCHED_CLOCK
 	select GENERIC_SMP_IDLE_THREAD
diff --git a/arch/arm/include/asm/set_memory.h b/arch/arm/include/asm/set_memory.h
index 0211b9c5b14d..4f1988dad160 100644
--- a/arch/arm/include/asm/set_memory.h
+++ b/arch/arm/include/asm/set_memory.h
@@ -7,10 +7,8 @@
 #define _ASMARM_SET_MEMORY_H
 
 #ifdef CONFIG_MMU
-int set_memory_ro(unsigned long addr, int numpages);
-int set_memory_rw(unsigned long addr, int numpages);
-int set_memory_x(unsigned long addr, int numpages);
-int set_memory_nx(unsigned long addr, int numpages);
+#include <asm-generic/set_memory.h>
+
 int set_memory_valid(unsigned long addr, int numpages, int enable);
 #else
 static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
diff --git a/arch/arm/mm/pageattr.c b/arch/arm/mm/pageattr.c
index 064ad508c149..2147b58b19cb 100644
--- a/arch/arm/mm/pageattr.c
+++ b/arch/arm/mm/pageattr.c
@@ -4,10 +4,14 @@
  */
 #include <linux/mm.h>
 #include <linux/module.h>
+#include <linux/pageattr.h>
+#include <linux/vmalloc.h>
 
 #include <asm/tlbflush.h>
 #include <asm/set_memory.h>
 
+#include "mm.h"
+
 struct page_change_data {
 	pgprot_t set_mask;
 	pgprot_t clear_mask;
@@ -44,58 +48,82 @@ static int __change_memory_common(unsigned long start, unsigned long size,
 	data.set_mask = set_mask;
 	data.clear_mask = clear_mask;
 
-	ret = apply_to_page_range(&init_mm, start, size, change_page_range,
-				  &data);
+	ret = apply_to_existing_page_range(&init_mm, start, size,
+					   change_page_range, &data);
 
 	flush_tlb_kernel_range(start, start + size);
 	return ret;
 }
 
-static int change_memory_common(unsigned long addr, int numpages,
-				pgprot_t set_mask, pgprot_t clear_mask)
+/* Only page mappings are changed: a section has a different format. */
+void arch_cpa_decode_leaf(struct cpa_leaf *leaf)
 {
-	unsigned long start = addr & PAGE_MASK;
-	unsigned long end = PAGE_ALIGN(addr) + numpages * PAGE_SIZE;
-	unsigned long size = end - start;
-
-	WARN_ON_ONCE(start != addr);
-
-	if (!size)
-		return 0;
+	pte_t pte = ptep_get(leaf->kpte);
 
-	if (!range_in_range(start, size, MODULES_VADDR, MODULES_END) &&
-	    !range_in_range(start, size, VMALLOC_START, VMALLOC_END))
-		return -EINVAL;
+	if (leaf->level != PGTABLE_LEVEL_PTE) {
+		leaf->pfn = 0;
+		leaf->prot = __pgprot(0);
+		return;
+	}
 
-	return __change_memory_common(start, size, set_mask, clear_mask);
+	leaf->pfn = pte_pfn(pte);
+	leaf->prot = __pgprot(pte_val(pte) & ~(PHYS_MASK & (s32)PAGE_MASK));
 }
 
-int set_memory_ro(unsigned long addr, int numpages)
+void arch_cpa_modify_leaf(struct cpa_leaf *leaf, pgprot_t prot)
 {
-	return change_memory_common(addr, numpages,
-					__pgprot(L_PTE_RDONLY),
-					__pgprot(0));
+	if (leaf->level == PGTABLE_LEVEL_PTE)
+		set_pte_ext(leaf->kpte, pfn_pte(leaf->pfn, prot), 0);
 }
 
-int set_memory_rw(unsigned long addr, int numpages)
+void arch_cpa_flush(struct cpa_data *cpa)
 {
-	return change_memory_common(addr, numpages,
-					__pgprot(0),
-					__pgprot(L_PTE_RDONLY));
-}
+	if (cpa->state & CPA_ST_FLUSH_ALL) {
+		flush_tlb_all();
+		return;
+	}
 
-int set_memory_nx(unsigned long addr, int numpages)
-{
-	return change_memory_common(addr, numpages,
-					__pgprot(L_PTE_XN),
-					__pgprot(0));
+	cpa_flush_tlb_kernel_range(cpa);
 }
 
-int set_memory_x(unsigned long addr, int numpages)
+static const struct cpa_op_prot cpa_ops[CPA_OP_NR] = {
+	[CPA_OP_RO]	= { .set = __pgprot(L_PTE_RDONLY) },
+	[CPA_OP_RW]	= { .clr = __pgprot(L_PTE_RDONLY) },
+	[CPA_OP_X]	= { .clr = __pgprot(L_PTE_XN) },
+	[CPA_OP_NX]	= { .set = __pgprot(L_PTE_XN) },
+	[CPA_OP_ROX]	= { .set = __pgprot(L_PTE_RDONLY),
+			    .clr = __pgprot(L_PTE_XN) },
+};
+
+int arch_cpa_prepare(struct cpa_data *cpa, enum cpa_op op)
 {
-	return change_memory_common(addr, numpages,
-					__pgprot(0),
-					__pgprot(L_PTE_XN));
+	unsigned long end = PAGE_ALIGN(cpa->addr) + cpa->numpages * PAGE_SIZE;
+	unsigned long start = cpa->addr & PAGE_MASK;
+	unsigned long size = end - start;
+	bool in_modules, in_vmalloc;
+	struct vm_struct *area;
+
+	if (!size)
+		return 0;
+
+	/*
+	 * The sections of the linear map are copied to every page table, so
+	 * only the page mappings of the modules and vmalloc areas can change.
+	 * ioremap() and the static I/O mappings may use sections there.
+	 */
+	in_modules = range_in_range(start, size, MODULES_VADDR, MODULES_END);
+	in_vmalloc = range_in_range(start, size, VMALLOC_START, VMALLOC_END);
+	if (!in_modules && !in_vmalloc)
+		return -EINVAL;
+
+	area = find_vm_area((void *)start);
+	if (WARN_ON_ONCE(area && (area->flags & (VM_ARM_SECTION_MAPPING |
+						 VM_ARM_STATIC_MAPPING))))
+		return -EINVAL;
+
+	cpa_init_op(cpa, &cpa_ops[op]);
+
+	return 0;
 }
 
 int set_memory_valid(unsigned long addr, int numpages, int enable)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
