Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEA4606A69A
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 11:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=auNGXUq8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fvGXWZv+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GM1eAT2eUxRr99dy0FB+iHCNKbdvkaMEh6qsJ+QQhrU=; b=auNGXUq8aDjwAX5EW2Kcw1uLUm
	wz95OtXXKsZiimD/6kztBxM4BDl64PJnQ3wGX0vw8MyUlmGrSRI9y+3jVC9fqHomC+J703zgDiHw/
	EDpe1aQhSZ4dM7JM/4Im7M5cBYgAK2qoBPe1h/g7ZgIiymBPN4fdYPcIibTB6tja9Hd9S0EMUJ8Ft
	4HL/HaAdnMp1bXA0aQk9/9EDT8YXjjcPQrjeOpQ3ZubHF2H5EH9MU7mW8bpSXI5Qk7RJ+/dqYuKlN
	/jsG085CfcVtreDW/7mQxAdY86HtShku0i2RRThAjTboUyOCdtzOYMq1TXGiFtjekTGWfaY8I5Xye
	ao+bk/Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXXb-0000000Cwaf-1EOS;
	Thu, 26 Nov 2026 11:21:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXWS-0000000CvRM-2UPc;
	Thu, 26 Nov 2026 11:20:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F84F4588F;
	Thu, 26 Nov 2026 11:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962C01F00A3D;
	Thu, 26 Nov 2026 11:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795692016;
	bh=ITguBAtaeU1JouI5XylgxXLQvJx8CTSOCOcbVUzTjd8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fvGXWZv+8pi99qzU7b5EhDoIXdzzJsiCfHc+1Zlntkr3m3pkhun1WINtqz4rdzsie
	 jziiCB0LdrTQeKoKP+cu5R80r2pIsX/Y0JsIKlz5jTCWUHlJ5PjjGI7kbGWq6SQUBC
	 OH/NSmXziwPx8bzuosEs4237MSu29h0F0RtcX8jYgwEoV/Vjg9phJULHmw3gJouIze
	 9hIqTpIOLEN8A567d+YKTz+F7fcaL7zu2Hm9VGG6vowtOIjNt2ZwOa9fzC16hdBprX
	 fyURUQ8TtPloWpWF1yAFJ3g1MUNAfNtlp8BhC8QfIDp8DVvIbbD1Do5rDdAqZmpJqT
	 FPBg70e6baOtw==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 26 Nov 2026 13:14:49 +0200
Subject: [PATCH RFC v2 36/54] LoongArch: use the generic CPA core
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-generic-set-memory-v0-1-v2-36-723f1e33c3d8@kernel.org>
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

The availability of the generic CPA core makes LoongArch's implementation
of set_memory_*() APIs unnecessary.

The page table walk in arch/loongarch/mm/pageattr.c can be replaced with
several simple hooks required by CPA core.

This way the core can manage the policy decisions and the architecture only
has to take care of the page table manipulation.

Switch to the generic CPA core and its set_memory() entry points.
For LoongArch this means that:

* an empty entry in the range is reported with a warning and -EFAULT
* nothing is written or flushed when nothing changes
* a request that fails flushes the entire TLB
* set_memory_rox() is a single request instead of set_memory_ro() followed
  by set_memory_x()
* requests are serialized by the core, rather than by the init_mm write
  lock
* lazily unmapped vmap areas are purged before a request, so that they do
  not keep stale TLB entries with the old protection

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/loongarch/Kconfig                  |   1 +
 arch/loongarch/include/asm/set_memory.h |   8 +--
 arch/loongarch/mm/pageattr.c            | 102 ++++++++------------------------
 3 files changed, 28 insertions(+), 83 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index bad699e2847f..455a72b8669d 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -107,6 +107,7 @@ config LOONGARCH
 	select GENERIC_LIB_LSHRDI3
 	select GENERIC_LIB_UCMPDI2
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
+	select GENERIC_PAGEATTR
 	select GENERIC_PCI_IOMAP
 	select GENERIC_SCHED_CLOCK
 	select GENERIC_SMP_IDLE_THREAD
diff --git a/arch/loongarch/include/asm/set_memory.h b/arch/loongarch/include/asm/set_memory.h
index 64c7f942e8ec..5496a3ee27da 100644
--- a/arch/loongarch/include/asm/set_memory.h
+++ b/arch/loongarch/include/asm/set_memory.h
@@ -6,12 +6,6 @@
 #ifndef _ASM_LOONGARCH_SET_MEMORY_H
 #define _ASM_LOONGARCH_SET_MEMORY_H
 
-/*
- * Functions to change memory attributes.
- */
-int set_memory_x(unsigned long addr, int numpages);
-int set_memory_nx(unsigned long addr, int numpages);
-int set_memory_ro(unsigned long addr, int numpages);
-int set_memory_rw(unsigned long addr, int numpages);
+#include <asm-generic/set_memory.h>
 
 #endif /* _ASM_LOONGARCH_SET_MEMORY_H */
diff --git a/arch/loongarch/mm/pageattr.c b/arch/loongarch/mm/pageattr.c
index 11cea93c7415..a90380b387d3 100644
--- a/arch/loongarch/mm/pageattr.c
+++ b/arch/loongarch/mm/pageattr.c
@@ -3,100 +3,50 @@
  * Copyright (C) 2024 Loongson Technology Corporation Limited
  */
 
-#include <linux/pagewalk.h>
+#include <linux/pageattr.h>
 #include <linux/pgtable.h>
 #include <asm/set_memory.h>
 #include <asm/tlbflush.h>
 
-struct pageattr_masks {
-	pgprot_t set_mask;
-	pgprot_t clear_mask;
-};
-
-static unsigned long set_pageattr_masks(unsigned long val, struct mm_walk *walk)
-{
-	unsigned long new_val = val;
-	struct pageattr_masks *masks = walk->private;
-
-	new_val &= ~(pgprot_val(masks->clear_mask));
-	new_val |= (pgprot_val(masks->set_mask));
-
-	return new_val;
-}
-
-static int pageattr_pte_entry(pte_t *pte, unsigned long addr,
-			      unsigned long next, struct mm_walk *walk)
+void arch_cpa_decode_leaf(struct cpa_leaf *leaf)
 {
-	pte_t val = ptep_get(pte);
-
-	val = __pte(set_pageattr_masks(pte_val(val), walk));
-	set_pte(pte, val);
+	pte_t pte = ptep_get(leaf->kpte);
 
-	return 0;
+	leaf->pfn = pte_pfn(pte);
+	leaf->prot = pte_pgprot(pte);
 }
 
-static int pageattr_pte_hole(unsigned long addr, unsigned long next,
-			     int depth, struct mm_walk *walk)
+void arch_cpa_modify_leaf(struct cpa_leaf *leaf, pgprot_t prot)
 {
-	return 0;
+	set_pte(leaf->kpte, pfn_pte(leaf->pfn, prot));
 }
 
-static const struct mm_walk_ops pageattr_ops = {
-	.pte_entry = pageattr_pte_entry,
-	.pte_hole = pageattr_pte_hole,
-	.walk_lock = PGWALK_RDLOCK,
-};
-
-static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask, pgprot_t clear_mask)
+void arch_cpa_flush(struct cpa_data *cpa)
 {
-	int ret;
-	unsigned long start = addr;
-	unsigned long end = start + PAGE_SIZE * numpages;
-	struct pageattr_masks masks = {
-		.set_mask = set_mask,
-		.clear_mask = clear_mask
-	};
-
-	if (!numpages)
-		return 0;
-
-	mmap_write_lock(&init_mm);
-	ret = walk_kernel_page_table_range(start, end, &pageattr_ops, NULL, &masks);
-	mmap_write_unlock(&init_mm);
-
-	flush_tlb_kernel_range(start, end);
+	if (cpa->state & CPA_ST_FLUSH_ALL) {
+		flush_tlb_all();
+		return;
+	}
 
-	return ret;
+	cpa_flush_tlb_kernel_range(cpa);
 }
 
-int set_memory_x(unsigned long addr, int numpages)
-{
-	if (addr < vm_map_base)
-		return 0;
-
-	return __set_memory(addr, numpages, __pgprot(0), __pgprot(_PAGE_NO_EXEC));
-}
-
-int set_memory_nx(unsigned long addr, int numpages)
-{
-	if (addr < vm_map_base)
-		return 0;
-
-	return __set_memory(addr, numpages, __pgprot(_PAGE_NO_EXEC), __pgprot(0));
-}
+static const struct cpa_op_prot cpa_ops[CPA_OP_NR] = {
+	[CPA_OP_RO]	= { .clr = __pgprot(_PAGE_WRITE | _PAGE_DIRTY) },
+	[CPA_OP_RW]	= { .set = __pgprot(_PAGE_WRITE | _PAGE_DIRTY) },
+	[CPA_OP_X]	= { .clr = __pgprot(_PAGE_NO_EXEC) },
+	[CPA_OP_NX]	= { .set = __pgprot(_PAGE_NO_EXEC) },
+	[CPA_OP_ROX]	= { .clr = __pgprot(_PAGE_WRITE | _PAGE_DIRTY |
+					   _PAGE_NO_EXEC) },
+};
 
-int set_memory_ro(unsigned long addr, int numpages)
+int arch_cpa_prepare(struct cpa_data *cpa, enum cpa_op op)
 {
-	if (addr < vm_map_base)
+	/* The direct mapping windows below vm_map_base have no page tables */
+	if (cpa->addr < vm_map_base)
 		return 0;
 
-	return __set_memory(addr, numpages, __pgprot(0), __pgprot(_PAGE_WRITE | _PAGE_DIRTY));
-}
+	cpa_init_op(cpa, &cpa_ops[op]);
 
-int set_memory_rw(unsigned long addr, int numpages)
-{
-	if (addr < vm_map_base)
-		return 0;
-
-	return __set_memory(addr, numpages, __pgprot(_PAGE_WRITE | _PAGE_DIRTY), __pgprot(0));
+	return 0;
 }

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
