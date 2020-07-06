Return-Path: <SRS0=gb7b=AR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BABCC433E1
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 17:26:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D48A420724
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 17:26:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mO7vCMkc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="IduSwXCC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D48A420724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PJL95+cl+gbQ+4F0udXjihgW5rAISNR6V1z/0U9vgkQ=; b=mO7vCMkcuV86Ze55VItMvw6YP
	TMrhikZytSZicXXavJozG00xyGDr8vXw4xXxNWoNwFFEZ9SpzRXmMl6CRodW4Ia2Uj49qtxyI1uqg
	XH0qc8OyZngMJCvFKNTyRc4ReYKwI5bY8A8+ZiejPPojYz3EyfzZoOMH5lYpNnjM3RNBTs+xVeogr
	qK5IoeX97jSAx5GXIEpJMAEDfOAQjc5kWDUAz3ec/ijm8CMkSvXTaUSDjoh2maPBBUupOIZuUPdd4
	nCwZOwoTkyJi1mTivbw+dteNk6aCCTa3jqEMlORMNE9eEqjJlzD4DvAONMOVYUGU1pVw3sgjzt+2Z
	3QdRzXA6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsUt4-0002dZ-Np; Mon, 06 Jul 2020 17:26:38 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsUt0-0002aE-6X
 for linux-riscv@lists.infradead.org; Mon, 06 Jul 2020 17:26:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594056395; x=1625592395;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ihAfLD97lU7TjJORSki+rGBXYnAkG5Afd7XbqxsjX2E=;
 b=IduSwXCCAuBMNTXSgckEwaaLkjEAfDm1Ghy5M0wa7xAZ2syFs5htVoeG
 MOFViIqhWytgfB7Lp/TTfpU4783yAHicvzE29Qf7H05sca+oPlfk7O6Qf
 3few+C9enU9Q/eqqBns+I+x1dYpGfDYv8fYRF9HUrU0Z4twyUPy0V4lrd
 90f/6TTlOpRv5zsSoGpDVB54zStsLJQBjCyIjRgOUWY/BQuqdF2PpFeNN
 dDEqT/vQ5ArPKIWLdMKTR+Yxmz60CEVBjfBibur9QbPV9tP1ugRzy+LTo
 3w4gehLRs8YR4i/Ag7Pi3DQIlSKqXuFbOGs5H7XMzwgsM85sSDSYnlfQt A==;
IronPort-SDR: FPmN8Rov0U+/6Dt+ikuJRXyu+jB44utkUMH91i5k3/msfG4Sn61x6gxIncbiGd9j1xFWYaovdb
 mJQllRfAd0ROUvHeMSgdP7+JaXAG/BTo3hIA3HqzsT2rSGZ5+6xmX1/wNPEG6rIvXk8aMtmo5i
 cWON3LuS1BFuEYnCtIsXylmOvBWd+GCoVWO0Zex5ExRAVuJikzDriIHhEJxiodiZbu8RQLJ7Vg
 pWK2YIy81/8DCKWxXYuFhRW/uxwJWwvn2TewdL/CNNSO+sBUjTYChaepk0v1PiBf9Z+11z7Is5
 Zic=
X-IronPort-AV: E=Sophos;i="5.75,320,1589212800"; d="scan'208";a="141930679"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Jul 2020 01:26:31 +0800
IronPort-SDR: gMv/3iSH5kIYz1nu9kldIbbhUtpZ32Y9RW6Th08+SThf01EBJ/y8xGQsWuWsb8BfdBEzA7/Hx5
 Q2NNKMAJReWs516ipkM673ORWLXTPDpk0=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2020 10:15:11 -0700
IronPort-SDR: 8BPyeAFugfQ7vcY4FOBjK8k4D9Wq3qcPHzxx/TXBvy4o44HkaDoMMWpj8fedogoDvDgZnn0vgI
 tJlwLUq1NXtw==
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO jedi-01.hgst.com) ([10.86.57.161])
 by uls-op-cesaip01.wdc.com with ESMTP; 06 Jul 2020 10:26:29 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 02/11] RISC-V: Move DT mapping outof fixmap
Date: Mon,  6 Jul 2020 10:26:00 -0700
Message-Id: <20200706172609.25965-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200706172609.25965-1-atish.patra@wdc.com>
References: <20200706172609.25965-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_132634_460038_9A88299D 
X-CRM114-Status: GOOD (  15.94  )
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
Cc: linux-efi@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Anup Patel <anup.patel@wdc.com>

Currently, RISC-V reserves 1MB of fixmap memory for device tree. However,
it maps only single PMD (2MB) space for fixmap which leaves only < 1MB space
left for other kernel features such as early ioremap which requires fixmap
as well. The fixmap size can be increased by another 2MB but it brings
additional complexity and changes the virtual memory layout as well.
If we require some additional feature requiring fixmap again, it has to be
moved again.

Technically, DT doesn't need a fixmap as the memory occupied by the DT is
only used during boot. Thus, init memory section can be used for the same
purpose as well. This simplifies fixmap implementation.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/fixmap.h |  3 ---
 arch/riscv/kernel/head.S        |  1 -
 arch/riscv/kernel/head.h        |  2 --
 arch/riscv/kernel/setup.c       |  8 +++-----
 arch/riscv/mm/init.c            | 36 ++++++++++++++-------------------
 5 files changed, 18 insertions(+), 32 deletions(-)

diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
index 1ff075a8dfc7..11613f38228a 100644
--- a/arch/riscv/include/asm/fixmap.h
+++ b/arch/riscv/include/asm/fixmap.h
@@ -22,9 +22,6 @@
  */
 enum fixed_addresses {
 	FIX_HOLE,
-#define FIX_FDT_SIZE	SZ_1M
-	FIX_FDT_END,
-	FIX_FDT = FIX_FDT_END + FIX_FDT_SIZE / PAGE_SIZE - 1,
 	FIX_PTE,
 	FIX_PMD,
 	FIX_TEXT_POKE1,
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 7ed1b22950fd..c5b529234ad8 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -244,7 +244,6 @@ clear_bss_done:
 #endif
 	/* Start the kernel */
 	call soc_early_init
-	call parse_dtb
 	tail start_kernel
 
 .Lsecondary_start:
diff --git a/arch/riscv/kernel/head.h b/arch/riscv/kernel/head.h
index 105fb0496b24..b48dda3d04f6 100644
--- a/arch/riscv/kernel/head.h
+++ b/arch/riscv/kernel/head.h
@@ -16,6 +16,4 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa);
 extern void *__cpu_up_stack_pointer[];
 extern void *__cpu_up_task_pointer[];
 
-void __init parse_dtb(void);
-
 #endif /* __ASM_HEAD_H */
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index f04373be54a6..8519a6d29857 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -49,8 +49,9 @@ atomic_t hart_lottery __section(.sdata);
 unsigned long boot_cpu_hartid;
 static DEFINE_PER_CPU(struct cpu, cpu_devices);
 
-void __init parse_dtb(void)
+static void __init parse_dtb(void)
 {
+	/* Early scan of device tree from init memory */
 	if (early_init_dt_scan(dtb_early_va))
 		return;
 
@@ -63,6 +64,7 @@ void __init parse_dtb(void)
 
 void __init setup_arch(char **cmdline_p)
 {
+	parse_dtb();
 	init_mm.start_code = (unsigned long) _stext;
 	init_mm.end_code   = (unsigned long) _etext;
 	init_mm.end_data   = (unsigned long) _edata;
@@ -74,11 +76,7 @@ void __init setup_arch(char **cmdline_p)
 
 	setup_bootmem();
 	paging_init();
-#if IS_ENABLED(CONFIG_BUILTIN_DTB)
 	unflatten_and_copy_device_tree();
-#else
-	unflatten_device_tree();
-#endif
 	clint_init_boot_cpu();
 
 #ifdef CONFIG_SWIOTLB
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index f4adb3684f3d..c18c94ab3b23 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -28,7 +28,6 @@ unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
 EXPORT_SYMBOL(empty_zero_page);
 
 extern char _start[];
-void *dtb_early_va;
 
 static void __init zone_sizes_init(void)
 {
@@ -120,8 +119,6 @@ static void __init setup_initrd(void)
 }
 #endif /* CONFIG_BLK_DEV_INITRD */
 
-static phys_addr_t dtb_early_pa __initdata;
-
 void __init setup_bootmem(void)
 {
 	struct memblock_region *reg;
@@ -158,13 +155,9 @@ void __init setup_bootmem(void)
 	setup_initrd();
 #endif /* CONFIG_BLK_DEV_INITRD */
 
-	/*
-	 * Avoid using early_init_fdt_reserve_self() since __pa() does
-	 * not work for DTB pointers that are fixmap addresses
-	 */
-	memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
-
+	early_init_fdt_reserve_self();
 	early_init_fdt_scan_reserved_mem();
+
 	memblock_allow_resize();
 	memblock_dump_all();
 
@@ -184,6 +177,10 @@ EXPORT_SYMBOL(va_pa_offset);
 unsigned long pfn_base;
 EXPORT_SYMBOL(pfn_base);
 
+#define DTB_EARLY_SIZE		SZ_1M
+static char early_dtb[DTB_EARLY_SIZE] __initdata;
+void *dtb_early_va __initdata = early_dtb;
+
 pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
 pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
 pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
@@ -375,7 +372,8 @@ static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
 
 asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 {
-	uintptr_t va, end_va;
+	int dtb_size;
+	uintptr_t va, pa, end_va;
 	uintptr_t load_pa = (uintptr_t)(&_start);
 	uintptr_t load_sz = (uintptr_t)(&_end) - load_pa;
 	uintptr_t map_size = best_map_size(load_pa, MAX_EARLY_MAPPING_SIZE);
@@ -424,17 +422,11 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 				   load_pa + (va - PAGE_OFFSET),
 				   map_size, PAGE_KERNEL_EXEC);
 
-	/* Create fixed mapping for early FDT parsing */
-	end_va = __fix_to_virt(FIX_FDT) + FIX_FDT_SIZE;
-	for (va = __fix_to_virt(FIX_FDT); va < end_va; va += PAGE_SIZE)
-		create_pte_mapping(fixmap_pte, va,
-				   dtb_pa + (va - __fix_to_virt(FIX_FDT)),
-				   PAGE_SIZE, PAGE_KERNEL);
-
-	/* Save pointer to DTB for early FDT parsing */
-	dtb_early_va = (void *)fix_to_virt(FIX_FDT) + (dtb_pa & ~PAGE_MASK);
-	/* Save physical address for memblock reservation */
-	dtb_early_pa = dtb_pa;
+	/* Copy FDT to init memory for early scan */
+	pa = load_pa + ((unsigned long)dtb_early_va - PAGE_OFFSET);
+	dtb_size = fdt_totalsize((void *)dtb_pa);
+	dtb_size = (dtb_size > DTB_EARLY_SIZE) ? DTB_EARLY_SIZE : dtb_size;
+	memcpy((void *)pa, (void *)dtb_pa, dtb_size);
 }
 
 static void __init setup_vm_final(void)
@@ -481,6 +473,8 @@ static void __init setup_vm_final(void)
 	local_flush_tlb_all();
 }
 #else
+void *dtb_early_va __initdata;
+
 asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 {
 #ifdef CONFIG_BUILTIN_DTB
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
