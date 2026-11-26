Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0F7606A691
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 11:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bkkP0cYP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zl+CRlyx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Xvkecj8PJRBTG5kZAz1idghNKB+Ppv779A9Ay0JwjpE=; b=bkkP0cYPpKKWw5ELDQhJKpPgdk
	rz92ltYCrNs0aMxc8bzhKaGC2aqwnnb5y2ggF76fUEvS7eQEEPBNu2/tROlaFqjI939M9ar2anyFg
	Tn+X/BvHnJA3iUNGbYNK2gjNK+4aE9UJNnPHiWw+9l5f0O7vXKY0BRa1xQOSbCjbs9BUb/ukURND5
	ww2PpMcPAlWYDRenixKnaePt0xoP3fAcrZitFCL08E3o7xXmcMuYX45UkteevDMpA1vcgXhINwtaB
	F77JO09+AQhccTmPrf1vJyQ2SCd+Wyz02ErpFl7fpjX5fAMEr7W8ELxJJXmx4Ov6rGSPT2obqJ+AE
	L5cKqYiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXZo-0000000Cz4v-3IVx;
	Thu, 26 Nov 2026 11:23:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXYw-0000000Cy4L-2DIJ;
	Thu, 26 Nov 2026 11:22:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EB9560D9A;
	Thu, 26 Nov 2026 11:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB421F000CF;
	Thu, 26 Nov 2026 11:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795692168;
	bh=6WYcKE+tNEbcV6PVwG1N7LpHdq4HcIVT1zq0dfG4sec=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Zl+CRlyx2I87IdbB1JjDCBPiNmKv4bM3IAC45ktE5s3I91L2jmCmRUoptnipGkKgl
	 BUE5kN97wXFLUC85uzwNpJJy7KixHU2IXlqkidLGKe+3woRJZHzcPXmlb+AxWDuKBB
	 UPGryb2k5YbIZxUqTu22JWldXgFR2GhweHJsnywyofX6FCMS+197XcSD+PpDSV91di
	 0Robh4VbtGiy65suWKd5uGtTAUBp0SYHIy2Y2NU+abhtWG5slvBzvF2XW7wLKh3XBs
	 MK+nfJOsSsKaW0gMv9BnXjO4gNsLD+feKOCcYwglUygk2LWwCivUbj7eMLAOX1Qa1b
	 ua3YBSB8LM7wg==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 26 Nov 2026 13:15:05 +0200
Subject: [PATCH RFC v2 52/54] arm64: count the mappings of the linear map
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-generic-set-memory-v0-1-v2-52-723f1e33c3d8@kernel.org>
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

The core keeps a counter of the direct map entries at every page table
level. A split moves an entry to the level below and counts a
direct_map_level2_splits or direct_map_level3_splits event in /proc/vmstat.
The counters start from what the architecture mapped.

arm64 never counts its linear map, so the core finds no large pages to take
a split from, and the split events stay at zero.

Count the linear map when it is created at boot and on memory hotplug, and
when memory is removed. map_mem() maps the kernel alias and the KFENCE pool
before it maps all of memory over them, so only the entries that were empty
count. The split of the linear map at boot, when not all CPUs support
BBML3, bypasses the core, so count its splits as well.

Report the counters in /proc/meminfo.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/arm64/mm/mmu.c      | 28 ++++++++++++++++++++++++++++
 arch/arm64/mm/pageattr.c | 13 +++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 40c5ac95f574..c415b81fb6f3 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -160,9 +160,19 @@ static void init_clear_pgtable(void *table)
 	dsb(ishst);
 }
 
+static void linear_map_count(unsigned long addr, enum pgtable_level level,
+			     long nr)
+{
+	if (__is_lm_address(addr))
+		direct_map_count_update(level, nr);
+}
+
 static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
 		     phys_addr_t phys, pgprot_t prot)
 {
+	unsigned long start = addr;
+	long nr = 0;
+
 	do {
 		pte_t old_pte = __ptep_get(ptep);
 
@@ -179,8 +189,12 @@ static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
 		BUG_ON(!pgattr_change_is_safe(pte_val(old_pte),
 					      pte_val(__ptep_get(ptep))));
 
+		if (pte_none(old_pte))
+			nr++;
 		phys += PAGE_SIZE;
 	} while (ptep++, addr += PAGE_SIZE, addr != end);
+
+	linear_map_count(start, PGTABLE_LEVEL_PTE, nr);
 }
 
 static bool pte_range_has_valid_noncont(pte_t *ptep)
@@ -274,6 +288,9 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 			 */
 			BUG_ON(!pgattr_change_is_safe(pmd_val(old_pmd),
 						      READ_ONCE(pmd_val(*pmdp))));
+
+			if (pmd_none(old_pmd))
+				linear_map_count(addr, PGTABLE_LEVEL_PMD, 1);
 		} else {
 			int ret;
 
@@ -410,6 +427,9 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 			 */
 			BUG_ON(!pgattr_change_is_safe(pud_val(old_pud),
 						      READ_ONCE(pud_val(*pudp))));
+
+			if (pud_none(old_pud))
+				linear_map_count(addr, PGTABLE_LEVEL_PUD, 1);
 		} else {
 			ret = alloc_init_cont_pmd(pudp, addr, next, phys, prot,
 						  pgtable_alloc, flags);
@@ -750,6 +770,7 @@ static int split_to_ptes_pud_entry(pud_t *pudp, unsigned long addr,
 		return -ENOMEM;
 
 	split_pud(pudp, pud, pmdp, false);
+	direct_map_count_split(PGTABLE_LEVEL_PUD);
 
 	return 0;
 }
@@ -771,6 +792,7 @@ static int split_to_ptes_pmd_entry(pmd_t *pmdp, unsigned long addr,
 	if (pmd_cont(pmd))
 		split_contpmd(pmdp);
 	split_pmd(pmdp, pmd, ptep, false);
+	direct_map_count_split(PGTABLE_LEVEL_PMD);
 
 	/*
 	 * We have split the pmd directly to ptes so there is no need to
@@ -1424,6 +1446,8 @@ static void unmap_hotplug_pte_range(pmd_t *pmdp, unsigned long addr,
 			flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
 			free_hotplug_page_range(pte_page(pte),
 						PAGE_SIZE, altmap);
+		} else {
+			direct_map_count_update(PGTABLE_LEVEL_PTE, -1);
 		}
 		/* unmap_hotplug_range() flushes TLB for !free_mapped */
 	} while (addr += PAGE_SIZE, addr < end);
@@ -1458,6 +1482,8 @@ static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
 				flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
 				free_hotplug_page_range(pmd_page(pmd),
 							PMD_SIZE, altmap);
+			} else {
+				direct_map_count_update(PGTABLE_LEVEL_PMD, -1);
 			}
 			/* unmap_hotplug_range() flushes TLB for !free_mapped */
 			continue;
@@ -1489,6 +1515,8 @@ static void unmap_hotplug_pud_range(p4d_t *p4dp, unsigned long addr,
 				flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
 				free_hotplug_page_range(pud_page(pud),
 							PUD_SIZE, altmap);
+			} else {
+				direct_map_count_update(PGTABLE_LEVEL_PUD, -1);
 			}
 			/* unmap_hotplug_range() flushes TLB for !free_mapped */
 			continue;
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index a2f5266b77b2..5e6782ef4b6c 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -9,6 +9,7 @@
 #include <linux/sched.h>
 #include <linux/vmalloc.h>
 #include <linux/pageattr.h>
+#include <linux/proc_fs.h>
 
 #include <asm/cacheflush.h>
 #include <asm/pgtable-prot.h>
@@ -16,6 +17,18 @@
 #include <asm/tlbflush.h>
 #include <asm/kfence.h>
 
+#ifdef CONFIG_PROC_FS
+void arch_report_meminfo(struct seq_file *m)
+{
+	unsigned long levels = BIT(PGTABLE_LEVEL_PTE) | BIT(PGTABLE_LEVEL_PMD);
+
+	if (pud_sect_supported())
+		levels |= BIT(PGTABLE_LEVEL_PUD);
+
+	cpa_report_meminfo(m, levels);
+}
+#endif
+
 void arch_cpa_decode_leaf(struct cpa_leaf *leaf)
 {
 	enum pgtable_level level = leaf->level;

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
