Return-Path: <SRS0=BUIi=DT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9818EC433DF
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2020 14:25:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C913B2076C
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2020 14:25:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H1TfEEvV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C913B2076C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X1X8P3kPSHSGNCk3KpaQPKqtuRYGB8NbpyG5i1UpfFI=; b=H1TfEEvVlEM2zqZ6mRlYKY3R1N
	vLR4KjwbJgPSbPKNLiZXtFbH7IvNvT6KDnFdCbFXFKiK89brcPBrOkJ5Bxljpjebp1M18vGPcO6Uj
	i3eD/5ZTeQx40mYHDXbe+4b1FFM7M5e06KJS8SmjdUbfBE3Sh5jYKi1DZ3Hi9UeM87SZgnypY+gv2
	vCxfV0vqomxQhRw6dVfsN3WCyUzhwIX2ZsM/FHhYaAKxAPxQgZdT+85ZlQdSyMjeO+poDRDKT1Ac4
	UVnKiB6XRl58ENpoq8Aqk724iyawLpN9F5UWqkI8Tgjco79wu2qrX3u1Xq200eszD7Cgk85lELGrW
	qp+lCHpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRyl2-0001kz-7V; Mon, 12 Oct 2020 14:25:00 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRyky-0001iu-Cj
 for linux-riscv@lists.infradead.org; Mon, 12 Oct 2020 14:24:58 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 09CEOfGK097792; Mon, 12 Oct 2020 17:24:41 +0300 (EEST)
X-AuditID: 8b5b014d-2bdff70000004c4c-1a-5f84672363d3
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 70.27.19532.327648F5; Mon, 12 Oct 2020 17:24:35 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user: mick@ics.forth.gr at ics.forth.gr
From: Nick Kossifidis <mick@ics.forth.gr>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com
Subject: [PATCH] RISC-V: Add kernel image sections to the resource tree
Date: Mon, 12 Oct 2020 17:24:10 +0300
Message-Id: <20201012142410.308002-1-mick@ics.forth.gr>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprELMWRmVeSWpSXmKPExsXSHT1dWVc5vSXe4MtJC4uWD+9YLRat+M5i
 se1zC5tF87tz7BYvL/cwW7TN4rf4cHc2mwO7x9TfZ1g83rx8yeLxcNMlJo/NS+o9LjVfZ/do
 P9DNFMAWxWWTkpqTWZZapG+XwJUx48IdxoJpFhUvenqZGxiX63YxcnJICJhInN54nK2LkYtD
 SOAoo8SN1uOsEAk3idv3d4LZbAKaEvMvHWQBsUUEzCWaZ75mBGlgFuhglDj45AcjSEJYwF2i
 9d4aJhCbRUBV4k7TNzCbF6hhfftBJoih8hLty7ezQcQFJU7OfAI2lBko3rx1NvMERp5ZSFKz
 kKQWMDKtYhRILDPWy0wu1kvLLyrJ0Esv2sQIDjZG3x2Mtze/1TvEyMTBeIhRgoNZSYT3nHpT
 vBBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHePO7lsUIC6YklqdmpqQWpRTBZJg5OqQam7futmg84
 TItdeEm3iC9T+sO2B3KrjWy3zdjilt2YaKBWXrBsk4JTTcEBPtmrX4smvX9Xfd2wVkn/p3kA
 b32/jM27Zt6NCU/ylt26e+HMlSB2AT8hO/WpXgIm4Wsehvyq5v846f1r/9bXM7qEe+7deXtm
 2xPFA+0r029pT8l33XRZJGPukk+CbNl/5EN0eDdu2BopcL8rY6bn37euPyvEYlZNMc6IbeH1
 MGLuvfCw8Py/va9jRE3uaAalpUw6XLfyySGpRqUnK96y+ujHdkx82d+y0+br9/1rGKVNVpzs
 bzp96uD5Po59304318XqygqneBonnotyEvYLXSd08dsvo8hPFq/3JGVsXMmW0vZHiaU4I9FQ
 i7moOBEAsFNdx6UCAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_102456_728494_0C57159C 
X-CRM114-Status: GOOD (  22.30  )
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
Cc: Nick Kossifidis <mick@ics.forth.gr>, atish.patra@wdc.com,
 anup@brainfault.org, zong.li@sifive.com, paul.walmsley@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch (previously part of my kexec/kdump series) populates
/proc/iomem with the various sections of the kernel image. We need
this for kexec-tools to be able to prepare the crashkernel image
for kdump to work. Since resource tree initialization is not
related to memory initialization I added the code to kernel/setup.c
and removed the original code (derived from the arm64 tree) from
mm/init.c.

Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
---
 arch/riscv/kernel/setup.c | 160 ++++++++++++++++++++++++++++++++++++++
 arch/riscv/mm/init.c      |  27 -------
 2 files changed, 160 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 2c6dd3293..450f0142f 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -4,6 +4,8 @@
  *  Chen Liqin <liqin.chen@sunplusct.com>
  *  Lennox Wu <lennox.wu@sunplusct.com>
  * Copyright (C) 2012 Regents of the University of California
+ * Copyright (C) 2020 FORTH-ICS/CARV
+ *  Nick Kossifidis <mick@ics.forth.gr>
  */
 
 #include <linux/init.h>
@@ -48,6 +50,163 @@ atomic_t hart_lottery __section(.sdata);
 unsigned long boot_cpu_hartid;
 static DEFINE_PER_CPU(struct cpu, cpu_devices);
 
+/*
+ * Place kernel memory regions on the resource tree so that
+ * kexec-tools can retrieve them from /proc/iomem. While there
+ * also add "System RAM" regions for compatibility with other
+ * archs, and the rest of the known regions for completeness.
+ */
+static struct resource code_res = { .name = "Kernel code", };
+static struct resource data_res = { .name = "Kernel data", };
+static struct resource rodata_res = { .name = "Kernel rodata", };
+static struct resource bss_res = { .name = "Kernel bss", };
+
+static int __init add_resource(struct resource *parent,
+				struct resource *res)
+{
+	int ret = 0;
+
+	ret = insert_resource(parent, res);
+	if (ret < 0) {
+		pr_err("Failed to add a %s resource at %llx\n",
+			res->name, (unsigned long long) res->start);
+		return ret;
+	}
+
+	return 1;
+}
+
+static int __init add_kernel_resources(struct resource *res)
+{
+	int ret = 0;
+
+	/*
+	 * The memory region of the kernel image is continuous and
+	 * was reserved on setup_bootmem, find it here and register
+	 * it as a resource, then register the various segments of
+	 * the image as child nodes
+	 */
+	if (!(res->start <= code_res.start && res->end >= data_res.end))
+		return 0;
+
+	res->name = "Kernel image";
+	res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
+
+	/*
+	 * We removed a part of this region on setup_bootmem so
+	 * we need to expand the resource for the bss to fit in.
+	 */
+	res->end = bss_res.end;
+
+	ret = add_resource(&iomem_resource, res);
+	if (ret < 0)
+		return ret;
+
+	ret = add_resource(res, &code_res);
+	if (ret < 0)
+		return ret;
+
+	ret = add_resource(res, &rodata_res);
+	if (ret < 0)
+		return ret;
+
+	ret = add_resource(res, &data_res);
+	if (ret < 0)
+		return ret;
+
+	ret = add_resource(res, &bss_res);
+
+	return ret;
+}
+
+static void __init init_resources(void)
+{
+	struct memblock_region *region = NULL;
+	struct resource *res = NULL;
+	int ret = 0;
+
+	code_res.start = __pa_symbol(_text);
+	code_res.end = __pa_symbol(_etext) - 1;
+	code_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
+
+	rodata_res.start = __pa_symbol(__start_rodata);
+	rodata_res.end = __pa_symbol(__end_rodata) - 1;
+	rodata_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
+
+	data_res.start = __pa_symbol(_data);
+	data_res.end = __pa_symbol(_edata) - 1;
+	data_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
+
+	bss_res.start = __pa_symbol(__bss_start);
+	bss_res.end = __pa_symbol(__bss_stop) - 1;
+	bss_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
+
+	/*
+	 * Start by adding the reserved regions, if they overlap
+	 * with /memory regions, insert_resource later on will take
+	 * care of it.
+	 */
+	for_each_memblock(reserved, region) {
+		res = memblock_alloc(sizeof(struct resource), SMP_CACHE_BYTES);
+		if (!res)
+			panic("%s: Failed to allocate %zu bytes\n", __func__,
+			      sizeof(struct resource));
+
+		res->name = "Reserved";
+		res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
+		res->start = __pfn_to_phys(memblock_region_reserved_base_pfn(region));
+		res->end = __pfn_to_phys(memblock_region_reserved_end_pfn(region)) - 1;
+
+		ret = add_kernel_resources(res);
+		if (ret < 0)
+			goto error;
+		else if (ret)
+			continue;
+
+		/*
+		 * Ignore any other reserved regions within
+		 * system memory.
+		 */
+		if (memblock_is_memory(res->start))
+			continue;
+
+		ret = add_resource(&iomem_resource, res);
+		if (ret < 0)
+			goto error;
+	}
+
+	/* Add /memory regions to the resource tree */
+	for_each_memblock(memory, region) {
+		res = memblock_alloc(sizeof(struct resource), SMP_CACHE_BYTES);
+		if (!res)
+			panic("%s: Failed to allocate %zu bytes\n", __func__,
+			      sizeof(struct resource));
+
+		if (unlikely(memblock_is_nomap(region))) {
+			res->name = "Reserved";
+			res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
+		} else {
+			res->name = "System RAM";
+			res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
+		}
+
+		res->start = __pfn_to_phys(memblock_region_memory_base_pfn(region));
+		res->end = __pfn_to_phys(memblock_region_memory_end_pfn(region)) - 1;
+
+		ret = add_resource(&iomem_resource, res);
+		if (ret < 0)
+			goto error;
+	}
+
+	return;
+
+ error:
+	memblock_free((phys_addr_t) res, sizeof(struct resource));
+	/* Better an empty resource tree than an inconsistent one */
+	release_child_resources(&iomem_resource);
+}
+
+
 void __init parse_dtb(void)
 {
 	if (early_init_dt_scan(dtb_early_va))
@@ -73,6 +232,7 @@ void __init setup_arch(char **cmdline_p)
 
 	setup_bootmem();
 	paging_init();
+	init_resources();
 #if IS_ENABLED(CONFIG_BUILTIN_DTB)
 	unflatten_and_copy_device_tree();
 #else
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index f750e012d..05d6cf0c2 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -541,39 +541,12 @@ void mark_rodata_ro(void)
 }
 #endif
 
-static void __init resource_init(void)
-{
-	struct memblock_region *region;
-
-	for_each_memblock(memory, region) {
-		struct resource *res;
-
-		res = memblock_alloc(sizeof(struct resource), SMP_CACHE_BYTES);
-		if (!res)
-			panic("%s: Failed to allocate %zu bytes\n", __func__,
-			      sizeof(struct resource));
-
-		if (memblock_is_nomap(region)) {
-			res->name = "reserved";
-			res->flags = IORESOURCE_MEM;
-		} else {
-			res->name = "System RAM";
-			res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
-		}
-		res->start = __pfn_to_phys(memblock_region_memory_base_pfn(region));
-		res->end = __pfn_to_phys(memblock_region_memory_end_pfn(region)) - 1;
-
-		request_resource(&iomem_resource, res);
-	}
-}
-
 void __init paging_init(void)
 {
 	setup_vm_final();
 	sparse_init();
 	setup_zero_page();
 	zone_sizes_init();
-	resource_init();
 }
 
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
