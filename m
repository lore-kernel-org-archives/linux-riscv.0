Return-Path: <SRS0=HZsE=GQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 997DFC433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jan 2021 14:41:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1168C23436
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jan 2021 14:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1168C23436
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=We4V95ZK6a18QKIiromULFc2KWxzdpBPjJFIlA73f24=; b=mQSPzdQMs5LWbwXL5DwHQ1Ossq
	21/cF6EGn+NIAkEJWt2f39n+fRHw/+nn9WyMSeUHcBW1ucwpzQTUbtxvAMFUSZx20L5O3S380cLBG
	1EkRtzmjsB6qe0Jov8Di+TUKHZ10/T51YQ2YEhTzbztQZkhhKi7Fb/aa1E95m0si3RDzoDgrZxvJ8
	TRuJMN5R27SApPFFNImQwox4ub0HcMayVzgtTz+B8bQ81dyYHIEWxmECaj8hllgCAxjLOHYT3XAhX
	liqH9dDDwpd6AazO7P6n/hhaPFDDbAyzdy9ukUdatF3dqbZ+StHD9xvHDgLUNcXGMVPAIPCtEUabG
	N6qG5Q9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzhKi-0002Vl-IJ; Wed, 13 Jan 2021 14:41:12 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzhKY-0002OR-2g; Wed, 13 Jan 2021 14:41:06 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DG97x6ZvSz7TmL;
 Wed, 13 Jan 2021 22:39:41 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Wed, 13 Jan 2021 22:40:35 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Russell King <linux@armlinux.org.uk>,
 <palmerdabbelt@google.com>, Atish Patra <atish.patra@wdc.com>
Subject: [PATCH] initramfs: Provide a common initrd reserve function
Date: Wed, 13 Jan 2021 22:45:30 +0800
Message-ID: <20210113144530.98165-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_094103_219566_2A899526 
X-CRM114-Status: GOOD (  16.81  )
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
Cc: guoren@kernel.org, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The arm and riscv have same logic to check and reserve
the memory of initrd, let's provide a common function
to reduce duplicated code.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
PS: 
- Other architecture may use this function too, eg, csky,
  could guoren check it? thanks.

 arch/arm/mm/init.c     | 43 +---------------------------------
 arch/riscv/mm/init.c   | 53 +-----------------------------------------
 include/linux/initrd.h |  6 +++++
 init/initramfs.c       | 45 +++++++++++++++++++++++++++++++++++
 4 files changed, 53 insertions(+), 94 deletions(-)

diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index 828a2561b229..a29e14cd626c 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -153,47 +153,6 @@ phys_addr_t __init arm_memblock_steal(phys_addr_t size, phys_addr_t align)
 	return phys;
 }
 
-static void __init arm_initrd_init(void)
-{
-#ifdef CONFIG_BLK_DEV_INITRD
-	phys_addr_t start;
-	unsigned long size;
-
-	initrd_start = initrd_end = 0;
-
-	if (!phys_initrd_size)
-		return;
-
-	/*
-	 * Round the memory region to page boundaries as per free_initrd_mem()
-	 * This allows us to detect whether the pages overlapping the initrd
-	 * are in use, but more importantly, reserves the entire set of pages
-	 * as we don't want these pages allocated for other purposes.
-	 */
-	start = round_down(phys_initrd_start, PAGE_SIZE);
-	size = phys_initrd_size + (phys_initrd_start - start);
-	size = round_up(size, PAGE_SIZE);
-
-	if (!memblock_is_region_memory(start, size)) {
-		pr_err("INITRD: 0x%08llx+0x%08lx is not a memory region - disabling initrd\n",
-		       (u64)start, size);
-		return;
-	}
-
-	if (memblock_is_region_reserved(start, size)) {
-		pr_err("INITRD: 0x%08llx+0x%08lx overlaps in-use memory region - disabling initrd\n",
-		       (u64)start, size);
-		return;
-	}
-
-	memblock_reserve(start, size);
-
-	/* Now convert initrd to virtual addresses */
-	initrd_start = __phys_to_virt(phys_initrd_start);
-	initrd_end = initrd_start + phys_initrd_size;
-#endif
-}
-
 #ifdef CONFIG_CPU_ICACHE_MISMATCH_WORKAROUND
 void check_cpu_icache_size(int cpuid)
 {
@@ -215,7 +174,7 @@ void __init arm_memblock_init(const struct machine_desc *mdesc)
 	/* Register the kernel text, kernel data and initrd with memblock. */
 	memblock_reserve(__pa(KERNEL_START), KERNEL_END - KERNEL_START);
 
-	arm_initrd_init();
+	reserve_initrd_mem();
 
 	arm_mm_memblock_reserve();
 
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index da53902ef0fc..93cba0d3f43f 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -105,55 +105,6 @@ void __init mem_init(void)
 	print_vm_layout();
 }
 
-#ifdef CONFIG_BLK_DEV_INITRD
-static void __init setup_initrd(void)
-{
-	phys_addr_t start;
-	unsigned long size;
-
-	/* Ignore the virtul address computed during device tree parsing */
-	initrd_start = initrd_end = 0;
-
-	if (!phys_initrd_size)
-		return;
-	/*
-	 * Round the memory region to page boundaries as per free_initrd_mem()
-	 * This allows us to detect whether the pages overlapping the initrd
-	 * are in use, but more importantly, reserves the entire set of pages
-	 * as we don't want these pages allocated for other purposes.
-	 */
-	start = round_down(phys_initrd_start, PAGE_SIZE);
-	size = phys_initrd_size + (phys_initrd_start - start);
-	size = round_up(size, PAGE_SIZE);
-
-	if (!memblock_is_region_memory(start, size)) {
-		pr_err("INITRD: 0x%08llx+0x%08lx is not a memory region",
-		       (u64)start, size);
-		goto disable;
-	}
-
-	if (memblock_is_region_reserved(start, size)) {
-		pr_err("INITRD: 0x%08llx+0x%08lx overlaps in-use memory region\n",
-		       (u64)start, size);
-		goto disable;
-	}
-
-	memblock_reserve(start, size);
-	/* Now convert initrd to virtual addresses */
-	initrd_start = (unsigned long)__va(phys_initrd_start);
-	initrd_end = initrd_start + phys_initrd_size;
-	initrd_below_start_ok = 1;
-
-	pr_info("Initial ramdisk at: 0x%p (%lu bytes)\n",
-		(void *)(initrd_start), size);
-	return;
-disable:
-	pr_cont(" - disabling initrd\n");
-	initrd_start = 0;
-	initrd_end = 0;
-}
-#endif /* CONFIG_BLK_DEV_INITRD */
-
 void __init setup_bootmem(void)
 {
 	phys_addr_t mem_start = 0;
@@ -198,9 +149,7 @@ void __init setup_bootmem(void)
 	dma32_phys_limit = min(4UL * SZ_1G, (unsigned long)PFN_PHYS(max_low_pfn));
 	set_max_mapnr(max_low_pfn);
 
-#ifdef CONFIG_BLK_DEV_INITRD
-	setup_initrd();
-#endif /* CONFIG_BLK_DEV_INITRD */
+	reserve_initrd_mem();
 
 	/*
 	 * Avoid using early_init_fdt_reserve_self() since __pa() does
diff --git a/include/linux/initrd.h b/include/linux/initrd.h
index 8db6f8c8030b..07af5ebc1eaa 100644
--- a/include/linux/initrd.h
+++ b/include/linux/initrd.h
@@ -15,6 +15,12 @@ extern int initrd_below_start_ok;
 extern unsigned long initrd_start, initrd_end;
 extern void free_initrd_mem(unsigned long, unsigned long);
 
+#ifdef CONFIG_BLK_DEV_INITRD
+extern void __init reserve_initrd_mem(void);
+#else
+static inline void __init reserve_initrd_mem(void) {}
+#endif
+
 extern phys_addr_t phys_initrd_start;
 extern unsigned long phys_initrd_size;
 
diff --git a/init/initramfs.c b/init/initramfs.c
index 55b74d7e5260..f75c89e9d602 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -535,6 +535,51 @@ extern unsigned long __initramfs_size;
 #include <linux/initrd.h>
 #include <linux/kexec.h>
 
+void __init reserve_initrd_mem(void)
+{
+	phys_addr_t start;
+	unsigned long size;
+
+	/* Ignore the virtul address computed during device tree parsing */
+	initrd_start = initrd_end = 0;
+
+	if (!phys_initrd_size)
+		return;
+	/*
+	 * Round the memory region to page boundaries as per free_initrd_mem()
+	 * This allows us to detect whether the pages overlapping the initrd
+	 * are in use, but more importantly, reserves the entire set of pages
+	 * as we don't want these pages allocated for other purposes.
+	 */
+	start = round_down(phys_initrd_start, PAGE_SIZE);
+	size = phys_initrd_size + (phys_initrd_start - start);
+	size = round_up(size, PAGE_SIZE);
+
+	if (!memblock_is_region_memory(start, size)) {
+		pr_err("INITRD: 0x%08llx+0x%08lx is not a memory region",
+		       (u64)start, size);
+		goto disable;
+	}
+
+	if (memblock_is_region_reserved(start, size)) {
+		pr_err("INITRD: 0x%08llx+0x%08lx overlaps in-use memory region\n",
+		       (u64)start, size);
+		goto disable;
+	}
+
+	memblock_reserve(start, size);
+	/* Now convert initrd to virtual addresses */
+	initrd_start = (unsigned long)__va(phys_initrd_start);
+	initrd_end = initrd_start + phys_initrd_size;
+	initrd_below_start_ok = 1;
+
+	return;
+disable:
+	pr_cont(" - disabling initrd\n");
+	initrd_start = 0;
+	initrd_end = 0;
+}
+
 void __weak __init free_initrd_mem(unsigned long start, unsigned long end)
 {
 #ifdef CONFIG_ARCH_KEEP_MEMBLOCK
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
