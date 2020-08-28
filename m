Return-Path: <SRS0=ua5H=CG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E48A4C433E7
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 17:21:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B33BE207DF
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 17:21:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FgAMD5E+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="N43O+7uL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B33BE207DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xBzoeeFC5n9AOMWLY8QQEsoZwM7RgU25PqvWWmW2R+U=; b=FgAMD5E+D2MrBFJv7pBtlmV2k
	4FA2TO/0euh09Ax45F6VmS5xiUABHtfYN4BIPXC6WRRh32VqTrMH/iKQdfMEopOVQ9lz90bJbOXxa
	fpzH8e0QBdCZ4q8H7Oq4+k8UuiEc7rtWUuCse/H4ZdVjDIWW1DjGxlqTnDt1HqIhkMVGQkE1k+cHS
	p8/IJ1xSE70kFpvtZ9uCkUEeFldk44CfOgoQqNKHoXRuar9Tz48YW7nTbnjjE7E0y+qg6ycztKlMp
	loCidt/utALkWmYSDC84J0uvdr9s40JotpLDstlE3vj/29BQ3u0yWMvu4dTqe5DJyjZ/MQ8/e+r+M
	sQ9SXYdcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBi3Y-0006Rg-3d; Fri, 28 Aug 2020 17:20:52 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBi3T-0006O2-I8
 for linux-riscv@lists.infradead.org; Fri, 28 Aug 2020 17:20:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1598635247; x=1630171247;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9dzVAvMQzryRH4OY4uy0c2IA1NXr4r5gdlmIqy/4veo=;
 b=N43O+7uLnQ46y9xGnUItX5+Pz47nsmhgUhPumweD4MSFRnEdT/ZRqf/V
 U2BqawvEn7+UnY9J+/dJ9H4cNJutztntJgUvxI1X+SpCCx/Od2SNNKGG9
 j1Tc2iRs98+kiEvL0jgSYhzi/b5o2mz1W4ErrzglZkErssItK/kMdCiB+
 DhVZTv7S45wxi98kE3U5iUfOXYalG2rOGbnVseG3wMgAdO8uP6jVb/x2c
 GOG0NxmLM/4fjKeG25a4HUtY1KQ6uJIZTq2EFHxPBU1v9JDjBZ0ZlaI7b
 qEiLkNhzVvAzd5RfmT3R5IUGP5G6rcNeaJ1q9W0krDjW63EE2mvZJFsl+ Q==;
IronPort-SDR: fNAmR30QohcQ4vQcDxz7TLkd9YRFa5W4Wb8EiD+m69sWAD/9wRrx3ITDefvxYsaj8zWG/N0cbI
 cDWNuk2wOKB/8YDCyfjSVZWJ4gk94iT9m6rkDPIZFUU5HQ5HI8Rn+JE2PkzCYW6WfW0yEl2pYA
 LJcneI7DrtGu3JMY15Llmjm3P3aL2sJxeVOsx19Imbjs1v0lWNeWCO5ORfHrijEsVuDPxx21jP
 I9+TLDvCR38Y3HG3haMuBucA4Aq++KmNaStNmiPB/MrkaC5KR2t0lJ36Af4EQz3s36a3r60HVo
 UMI=
X-IronPort-AV: E=Sophos;i="5.76,364,1592841600"; d="scan'208";a="150414075"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 29 Aug 2020 01:20:44 +0800
IronPort-SDR: o9P/5bPBYP5xeRFG6Fb4uRgp51+fRgo65thXXhgO9GeWLRy1/zLph3Q91lGI+xfnzWL2jq37IG
 phBZfg6rJQrA==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 10:08:16 -0700
IronPort-SDR: cHEGtdZXUata0e29TqwV7pKiqsGxwZ/GjjyrOJsV4uVGyhC0xccgHd+P5yS9KgF9dMW1nvOkqH
 0s8KQjCl06Cw==
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO jedi-01.hgst.com) ([10.86.59.137])
 by uls-op-cesaip01.wdc.com with ESMTP; 28 Aug 2020 10:20:43 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/9] RISC-V: Implement late mapping page table allocation
 functions
Date: Fri, 28 Aug 2020 10:20:30 -0700
Message-Id: <20200828172036.8056-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200828172036.8056-1-atish.patra@wdc.com>
References: <20200828172036.8056-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_132047_776627_DA6427D0 
X-CRM114-Status: GOOD (  19.15  )
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
Cc: Ingo Molnar <mingo@kernel.org>, linux-efi@vger.kernel.org,
 Anup Patel <anup@brainfault.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Anup Patel <anup.patel@wdc.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Atish Patra <atish.patra@wdc.com>,
 Arvind Sankar <nivedita@alum.mit.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, page table setup is done during setup_va_final where fixmap can
be used to create the temporary mappings. The physical frame is allocated
from memblock_alloc_* functions. However, this won't work if page table
mapping needs to be created for a different mm context (i.e. efi mm) at
a later point of time.

Use generic kernel page allocation function & macros for any mapping
after setup_vm_final.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/riscv/mm/init.c | 130 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 99 insertions(+), 31 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index b75ebe8e7a92..cac2c31f8beb 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -32,6 +32,17 @@ extern char _start[];
 void *dtb_early_va __initdata;
 uintptr_t dtb_early_pa __initdata;
 
+struct pt_alloc_ops {
+	pte_t *(*get_pte_virt)(phys_addr_t pa);
+	phys_addr_t (*alloc_pte)(uintptr_t va);
+#ifndef __PAGETABLE_PMD_FOLDED
+	pmd_t *(*get_pmd_virt)(phys_addr_t pa);
+	phys_addr_t (*alloc_pmd)(uintptr_t va);
+#endif
+};
+
+static struct pt_alloc_ops pt_ops;
+
 static void __init zone_sizes_init(void)
 {
 	unsigned long max_zone_pfns[MAX_NR_ZONES] = { 0, };
@@ -211,7 +222,6 @@ EXPORT_SYMBOL(pfn_base);
 pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
 pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
 pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
-static bool mmu_enabled;
 
 #define MAX_EARLY_MAPPING_SIZE	SZ_128M
 
@@ -234,27 +244,46 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
 	}
 }
 
-static pte_t *__init get_pte_virt(phys_addr_t pa)
+static inline pte_t *__init get_pte_virt_early(phys_addr_t pa)
 {
-	if (mmu_enabled) {
-		clear_fixmap(FIX_PTE);
-		return (pte_t *)set_fixmap_offset(FIX_PTE, pa);
-	} else {
-		return (pte_t *)((uintptr_t)pa);
-	}
+	return (pte_t *)((uintptr_t)pa);
 }
 
-static phys_addr_t __init alloc_pte(uintptr_t va)
+static inline pte_t *__init get_pte_virt_fixmap(phys_addr_t pa)
+{
+	clear_fixmap(FIX_PTE);
+	return (pte_t *)set_fixmap_offset(FIX_PTE, pa);
+}
+
+static inline pte_t *get_pte_virt_late(phys_addr_t pa)
+{
+	return (pte_t *) __va(pa);
+}
+
+static inline phys_addr_t __init alloc_pte_early(uintptr_t va)
 {
 	/*
 	 * We only create PMD or PGD early mappings so we
 	 * should never reach here with MMU disabled.
 	 */
-	BUG_ON(!mmu_enabled);
+	BUG();
+}
 
+static inline phys_addr_t __init alloc_pte_fixmap(uintptr_t va)
+{
 	return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
 }
 
+static phys_addr_t alloc_pte_late(uintptr_t va)
+{
+	unsigned long vaddr;
+
+	vaddr = __get_free_page(GFP_KERNEL);
+	if (!vaddr || !pgtable_pte_page_ctor(virt_to_page(vaddr)))
+		BUG();
+	return __pa(vaddr);
+}
+
 static void __init create_pte_mapping(pte_t *ptep,
 				      uintptr_t va, phys_addr_t pa,
 				      phys_addr_t sz, pgprot_t prot)
@@ -279,28 +308,46 @@ pmd_t fixmap_pmd[PTRS_PER_PMD] __page_aligned_bss;
 #endif
 pmd_t early_pmd[PTRS_PER_PMD * NUM_EARLY_PMDS] __initdata __aligned(PAGE_SIZE);
 
-static pmd_t *__init get_pmd_virt(phys_addr_t pa)
+static pmd_t *__init get_pmd_virt_early(phys_addr_t pa)
 {
-	if (mmu_enabled) {
-		clear_fixmap(FIX_PMD);
-		return (pmd_t *)set_fixmap_offset(FIX_PMD, pa);
-	} else {
-		return (pmd_t *)((uintptr_t)pa);
-	}
+	/* Before MMU is enabled */
+	return (pmd_t *)((uintptr_t)pa);
 }
 
-static phys_addr_t __init alloc_pmd(uintptr_t va)
+static pmd_t *__init get_pmd_virt_fixmap(phys_addr_t pa)
 {
-	uintptr_t pmd_num;
+	clear_fixmap(FIX_PMD);
+	return (pmd_t *)set_fixmap_offset(FIX_PMD, pa);
+}
+
+static pmd_t *get_pmd_virt_late(phys_addr_t pa)
+{
+	return (pmd_t *) __va(pa);
+}
 
-	if (mmu_enabled)
-		return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
+static phys_addr_t __init alloc_pmd_early(uintptr_t va)
+{
+	uintptr_t pmd_num;
 
 	pmd_num = (va - PAGE_OFFSET) >> PGDIR_SHIFT;
 	BUG_ON(pmd_num >= NUM_EARLY_PMDS);
 	return (uintptr_t)&early_pmd[pmd_num * PTRS_PER_PMD];
 }
 
+static phys_addr_t __init alloc_pmd_fixmap(uintptr_t va)
+{
+	return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
+}
+
+static phys_addr_t alloc_pmd_late(uintptr_t va)
+{
+	unsigned long vaddr;
+
+	vaddr = __get_free_page(GFP_KERNEL);
+	BUG_ON(!vaddr);
+	return __pa(vaddr);
+}
+
 static void __init create_pmd_mapping(pmd_t *pmdp,
 				      uintptr_t va, phys_addr_t pa,
 				      phys_addr_t sz, pgprot_t prot)
@@ -316,28 +363,28 @@ static void __init create_pmd_mapping(pmd_t *pmdp,
 	}
 
 	if (pmd_none(pmdp[pmd_idx])) {
-		pte_phys = alloc_pte(va);
+		pte_phys = pt_ops.alloc_pte(va);
 		pmdp[pmd_idx] = pfn_pmd(PFN_DOWN(pte_phys), PAGE_TABLE);
-		ptep = get_pte_virt(pte_phys);
+		ptep = pt_ops.get_pte_virt(pte_phys);
 		memset(ptep, 0, PAGE_SIZE);
 	} else {
 		pte_phys = PFN_PHYS(_pmd_pfn(pmdp[pmd_idx]));
-		ptep = get_pte_virt(pte_phys);
+		ptep = pt_ops.get_pte_virt(pte_phys);
 	}
 
 	create_pte_mapping(ptep, va, pa, sz, prot);
 }
 
 #define pgd_next_t		pmd_t
-#define alloc_pgd_next(__va)	alloc_pmd(__va)
-#define get_pgd_next_virt(__pa)	get_pmd_virt(__pa)
+#define alloc_pgd_next(__va)	pt_ops.alloc_pmd(__va)
+#define get_pgd_next_virt(__pa)	pt_ops.get_pmd_virt(__pa)
 #define create_pgd_next_mapping(__nextp, __va, __pa, __sz, __prot)	\
 	create_pmd_mapping(__nextp, __va, __pa, __sz, __prot)
 #define fixmap_pgd_next		fixmap_pmd
 #else
 #define pgd_next_t		pte_t
-#define alloc_pgd_next(__va)	alloc_pte(__va)
-#define get_pgd_next_virt(__pa)	get_pte_virt(__pa)
+#define alloc_pgd_next(__va)	pt_ops.alloc_pte(__va)
+#define get_pgd_next_virt(__pa)	pt_ops.get_pte_virt(__pa)
 #define create_pgd_next_mapping(__nextp, __va, __pa, __sz, __prot)	\
 	create_pte_mapping(__nextp, __va, __pa, __sz, __prot)
 #define fixmap_pgd_next		fixmap_pte
@@ -421,6 +468,12 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	BUG_ON((load_pa % map_size) != 0);
 	BUG_ON(load_sz > MAX_EARLY_MAPPING_SIZE);
 
+	pt_ops.alloc_pte = alloc_pte_early;
+	pt_ops.get_pte_virt = get_pte_virt_early;
+#ifndef __PAGETABLE_PMD_FOLDED
+	pt_ops.alloc_pmd = alloc_pmd_early;
+	pt_ops.get_pmd_virt = get_pmd_virt_early;
+#endif
 	/* Setup early PGD for fixmap */
 	create_pgd_mapping(early_pg_dir, FIXADDR_START,
 			   (uintptr_t)fixmap_pgd_next, PGDIR_SIZE, PAGE_TABLE);
@@ -497,9 +550,16 @@ static void __init setup_vm_final(void)
 	phys_addr_t pa, start, end;
 	struct memblock_region *reg;
 
-	/* Set mmu_enabled flag */
-	mmu_enabled = true;
-
+	/**
+	 * MMU is enabled at this point. But page table setup is not complete yet.
+	 * fixmap page table alloc functions should be used at this point
+	 */
+	pt_ops.alloc_pte = alloc_pte_fixmap;
+	pt_ops.get_pte_virt = get_pte_virt_fixmap;
+#ifndef __PAGETABLE_PMD_FOLDED
+	pt_ops.alloc_pmd = alloc_pmd_fixmap;
+	pt_ops.get_pmd_virt = get_pmd_virt_fixmap;
+#endif
 	/* Setup swapper PGD for fixmap */
 	create_pgd_mapping(swapper_pg_dir, FIXADDR_START,
 			   __pa_symbol(fixmap_pgd_next),
@@ -533,6 +593,14 @@ static void __init setup_vm_final(void)
 	/* Move to swapper page table */
 	csr_write(CSR_SATP, PFN_DOWN(__pa_symbol(swapper_pg_dir)) | SATP_MODE);
 	local_flush_tlb_all();
+
+	/* generic page allocation functions must be used to setup page table */
+	pt_ops.alloc_pte = alloc_pte_late;
+	pt_ops.get_pte_virt = get_pte_virt_late;
+#ifndef __PAGETABLE_PMD_FOLDED
+	pt_ops.alloc_pmd = alloc_pmd_late;
+	pt_ops.get_pmd_virt = get_pmd_virt_late;
+#endif
 }
 #else
 asmlinkage void __init setup_vm(uintptr_t dtb_pa)
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
