Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC121606B3C9
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 07:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ds0HQ5hR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XY0D+6ev8p2NxMdzGLqF2otv4S3OOUU3smcFeXbMcDs=; b=Ds0HQ5hR0/dLl89+bNVSGwyAcU
	nMHNPaL4vxkYCIIY7lZWt3tVwLabn6UXyuvyFCyPztl98CW7mA0HF9tdeDZRgnjv4X3cGNl/QCHuB
	iTBQEVGCPpdjQlHwOBnZd+pQGNtAL0zo7wiz8Oexx8Pd79DcdUK6RKFWeuKJQPdSU8aFkfmtSA3AS
	ZhLduhKSVgdFMPR3W1RVSl8r1KeFSomH7igqrZK41vGrIsCQ0T2EngjtZofC0cHNnGi/Rf9GBx0S0
	D5I2yBSDiglAnGcdhZwNYlGB7j9T7pBhAo7y1qF7AlDS1lUz1NHUCPI3Tvm+xTXrnijD9ZSejHE3P
	FaowWwGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlU8-0000000Br0Z-49As;
	Fri, 13 Nov 2026 07:14:10 +0000
Received: from atcsqr.andestech.com ([220.128.198.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlTp-0000000BqrS-2Brh
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 07:13:52 +0000
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CR5J059129
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:29 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 15:12:28 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Nov
 2026 15:12:27 +0800
From: Mina Hui-Min Chou <minachou@andestech.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <conor@kernel.org>, <jic23@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <geert+renesas@glider.be>, <magnus.damm@gmail.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <randolph@andestech.com>, <cyyang772@andestech.com>,
        <tim609@andestech.com>, <minachou@andestech.com>, <az70021@gmail.com>
Subject: [PATCH v2 02/19] cache: ax45mp_cache: rename AX45MP-specific identifiers to generic ANDES
Date: Fri, 13 Nov 2026 15:11:26 +0800
Message-ID: <20261113071143.1446167-3-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113071143.1446167-1-minachou@andestech.com>
References: <20261113071143.1446167-1-minachou@andestech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs55.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 6AD7CR5J059129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_231350_136793_5216E8AE 
X-CRM114-Status: GOOD (  22.50  )
X-Spam-Score: -1.9 (-)
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

The Andes cache driver is not limited to AX45MP; it can also be used
with other Andes CPUs such as the A27L2. To prepare for SoC support
(Allwinner V821 with an A27L2 CPU), rename all AX45MP-specific
identifiers to use generic ANDES prefixes.

This is a mechanical rename with no functional change:
- Kconfig: AX45MP_L2_CACHE -> ANDES_LLCACHE
- struct: ax45mp_priv -> andes_priv
- macros: AX45MP_* -> ANDES_*
- functions: ax45mp_cpu_* -> andes_cpu_*

Update the Kconfig prompt and help text to match, and re-align the
continuation lines affected by the shorter function names.

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 drivers/cache/Kconfig        |   9 ++-
 drivers/cache/Makefile       |   2 +-
 drivers/cache/ax45mp_cache.c | 142 +++++++++++++++++------------------
 drivers/soc/renesas/Kconfig  |   2 +-
 4 files changed, 79 insertions(+), 76 deletions(-)

diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
index 1518449d47b5..68e6e4aead21 100644
--- a/drivers/cache/Kconfig
+++ b/drivers/cache/Kconfig
@@ -10,11 +10,14 @@ menuconfig CACHEMAINT_FOR_DMA
 
 if CACHEMAINT_FOR_DMA
 
-config AX45MP_L2_CACHE
-	bool "Andes Technology AX45MP L2 Cache controller"
+config ANDES_LLCACHE
+	bool "Andes last level cache controller"
 	select RISCV_NONSTANDARD_CACHE_OPS
 	help
-	  Support for the L2 cache controller on Andes Technology AX45MP platforms.
+	  Support for the cache controller of Andes CPU cores such as the
+	  AX45MP and A27L2. It provides cache maintenance operations on the
+	  L1 data cache and the last level cache (LLC), which are needed for
+	  non-coherent DMA on cores without the standard Zicbom extension.
 
 config SIFIVE_CCACHE
 	bool "Sifive Composable Cache controller"
diff --git a/drivers/cache/Makefile b/drivers/cache/Makefile
index b3362b15d6c1..290aa238b2e2 100644
--- a/drivers/cache/Makefile
+++ b/drivers/cache/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_AX45MP_L2_CACHE)		+= ax45mp_cache.o
+obj-$(CONFIG_ANDES_LLCACHE)		+= ax45mp_cache.o
 obj-$(CONFIG_SIFIVE_CCACHE)		+= sifive_ccache.o
 obj-$(CONFIG_STARFIVE_STARLINK_CACHE)	+= starfive_starlink_cache.o
 
diff --git a/drivers/cache/ax45mp_cache.c b/drivers/cache/ax45mp_cache.c
index df40dea7b0d9..4f9b8a9ad969 100644
--- a/drivers/cache/ax45mp_cache.c
+++ b/drivers/cache/ax45mp_cache.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * non-coherent cache functions for Andes AX45MP
+ * non-coherent cache operations for Andes Platform CPUs
  *
  * Copyright (C) 2023 Renesas Electronics Corp.
  */
@@ -14,72 +14,72 @@
 #include <asm/dma-noncoherent.h>
 
 /* L2 cache registers */
-#define AX45MP_L2C_REG_CTL_OFFSET		0x8
+#define ANDES_L2C_REG_CTL_OFFSET		0x8
 
-#define AX45MP_L2C_REG_C0_CMD_OFFSET		0x40
-#define AX45MP_L2C_REG_C0_ACC_OFFSET		0x48
-#define AX45MP_L2C_REG_STATUS_OFFSET		0x80
+#define ANDES_L2C_REG_C0_CMD_OFFSET		0x40
+#define ANDES_L2C_REG_C0_ACC_OFFSET		0x48
+#define ANDES_L2C_REG_STATUS_OFFSET		0x80
 
 /* D-cache operation */
-#define AX45MP_CCTL_L1D_VA_INVAL		0 /* Invalidate an L1 cache entry */
-#define AX45MP_CCTL_L1D_VA_WB			1 /* Write-back an L1 cache entry */
+#define ANDES_CCTL_L1D_VA_INVAL		0 /* Invalidate an L1 cache entry */
+#define ANDES_CCTL_L1D_VA_WB			1 /* Write-back an L1 cache entry */
 
 /* L2 CCTL status */
-#define AX45MP_CCTL_L2_STATUS_IDLE		0
+#define ANDES_CCTL_L2_STATUS_IDLE		0
 
 /* L2 CCTL status cores mask */
-#define AX45MP_CCTL_L2_STATUS_C0_MASK		0xf
+#define ANDES_CCTL_L2_STATUS_C0_MASK		0xf
 
 /* L2 cache operation */
-#define AX45MP_CCTL_L2_PA_INVAL			0x8 /* Invalidate an L2 cache entry */
-#define AX45MP_CCTL_L2_PA_WB			0x9 /* Write-back an L2 cache entry */
+#define ANDES_CCTL_L2_PA_INVAL			0x8 /* Invalidate an L2 cache entry */
+#define ANDES_CCTL_L2_PA_WB			0x9 /* Write-back an L2 cache entry */
 
-#define AX45MP_L2C_REG_PER_CORE_OFFSET		0x10
-#define AX45MP_CCTL_L2_STATUS_PER_CORE_OFFSET	4
+#define ANDES_L2C_REG_PER_CORE_OFFSET		0x10
+#define ANDES_CCTL_L2_STATUS_PER_CORE_OFFSET	4
 
-#define AX45MP_L2C_REG_CN_CMD_OFFSET(n)	\
-	(AX45MP_L2C_REG_C0_CMD_OFFSET + ((n) * AX45MP_L2C_REG_PER_CORE_OFFSET))
-#define AX45MP_L2C_REG_CN_ACC_OFFSET(n)	\
-	(AX45MP_L2C_REG_C0_ACC_OFFSET + ((n) * AX45MP_L2C_REG_PER_CORE_OFFSET))
-#define AX45MP_CCTL_L2_STATUS_CN_MASK(n)	\
-	(AX45MP_CCTL_L2_STATUS_C0_MASK << ((n) * AX45MP_CCTL_L2_STATUS_PER_CORE_OFFSET))
+#define ANDES_L2C_REG_CN_CMD_OFFSET(n)	\
+	(ANDES_L2C_REG_C0_CMD_OFFSET + ((n) * ANDES_L2C_REG_PER_CORE_OFFSET))
+#define ANDES_L2C_REG_CN_ACC_OFFSET(n)	\
+	(ANDES_L2C_REG_C0_ACC_OFFSET + ((n) * ANDES_L2C_REG_PER_CORE_OFFSET))
+#define ANDES_CCTL_L2_STATUS_CN_MASK(n)	\
+	(ANDES_CCTL_L2_STATUS_C0_MASK << ((n) * ANDES_CCTL_L2_STATUS_PER_CORE_OFFSET))
 
-#define AX45MP_CCTL_REG_UCCTLBEGINADDR_NUM	0x80b
-#define AX45MP_CCTL_REG_UCCTLCOMMAND_NUM	0x80c
+#define ANDES_CCTL_REG_UCCTLBEGINADDR_NUM	0x80b
+#define ANDES_CCTL_REG_UCCTLCOMMAND_NUM	0x80c
 
-#define AX45MP_CACHE_LINE_SIZE			64
+#define ANDES_CACHE_LINE_SIZE			64
 
-struct ax45mp_priv {
+struct andes_priv {
 	void __iomem *l2c_base;
-	u32 ax45mp_cache_line_size;
+	u32 andes_cache_line_size;
 };
 
-static struct ax45mp_priv ax45mp_priv;
+static struct andes_priv andes_priv;
 
 /* L2 Cache operations */
-static inline uint32_t ax45mp_cpu_l2c_get_cctl_status(void)
+static inline uint32_t andes_cpu_l2c_get_cctl_status(void)
 {
-	return readl(ax45mp_priv.l2c_base + AX45MP_L2C_REG_STATUS_OFFSET);
+	return readl(andes_priv.l2c_base + ANDES_L2C_REG_STATUS_OFFSET);
 }
 
-static void ax45mp_cpu_cache_operation(unsigned long start, unsigned long end,
-				       unsigned int l1_op, unsigned int l2_op)
+static void andes_cpu_cache_operation(unsigned long start, unsigned long end,
+				      unsigned int l1_op, unsigned int l2_op)
 {
-	unsigned long line_size = ax45mp_priv.ax45mp_cache_line_size;
-	void __iomem *base = ax45mp_priv.l2c_base;
+	unsigned long line_size = andes_priv.andes_cache_line_size;
+	void __iomem *base = andes_priv.l2c_base;
 	int mhartid = smp_processor_id();
 	unsigned long pa;
 
 	while (end > start) {
-		csr_write(AX45MP_CCTL_REG_UCCTLBEGINADDR_NUM, start);
-		csr_write(AX45MP_CCTL_REG_UCCTLCOMMAND_NUM, l1_op);
+		csr_write(ANDES_CCTL_REG_UCCTLBEGINADDR_NUM, start);
+		csr_write(ANDES_CCTL_REG_UCCTLCOMMAND_NUM, l1_op);
 
 		pa = virt_to_phys((void *)start);
-		writel(pa, base + AX45MP_L2C_REG_CN_ACC_OFFSET(mhartid));
-		writel(l2_op, base + AX45MP_L2C_REG_CN_CMD_OFFSET(mhartid));
-		while ((ax45mp_cpu_l2c_get_cctl_status() &
-			AX45MP_CCTL_L2_STATUS_CN_MASK(mhartid)) !=
-			AX45MP_CCTL_L2_STATUS_IDLE)
+		writel(pa, base + ANDES_L2C_REG_CN_ACC_OFFSET(mhartid));
+		writel(l2_op, base + ANDES_L2C_REG_CN_CMD_OFFSET(mhartid));
+		while ((andes_cpu_l2c_get_cctl_status() &
+			ANDES_CCTL_L2_STATUS_CN_MASK(mhartid)) !=
+			ANDES_CCTL_L2_STATUS_IDLE)
 			;
 
 		start += line_size;
@@ -87,20 +87,20 @@ static void ax45mp_cpu_cache_operation(unsigned long start, unsigned long end,
 }
 
 /* Write-back L1 and L2 cache entry */
-static inline void ax45mp_cpu_dcache_wb_range(unsigned long start, unsigned long end)
+static inline void andes_cpu_dcache_wb_range(unsigned long start, unsigned long end)
 {
-	ax45mp_cpu_cache_operation(start, end, AX45MP_CCTL_L1D_VA_WB,
-				   AX45MP_CCTL_L2_PA_WB);
+	andes_cpu_cache_operation(start, end, ANDES_CCTL_L1D_VA_WB,
+				  ANDES_CCTL_L2_PA_WB);
 }
 
 /* Invalidate the L1 and L2 cache entry */
-static inline void ax45mp_cpu_dcache_inval_range(unsigned long start, unsigned long end)
+static inline void andes_cpu_dcache_inval_range(unsigned long start, unsigned long end)
 {
-	ax45mp_cpu_cache_operation(start, end, AX45MP_CCTL_L1D_VA_INVAL,
-				   AX45MP_CCTL_L2_PA_INVAL);
+	andes_cpu_cache_operation(start, end, ANDES_CCTL_L1D_VA_INVAL,
+				  ANDES_CCTL_L2_PA_INVAL);
 }
 
-static void ax45mp_dma_cache_inv(phys_addr_t paddr, size_t size)
+static void andes_dma_cache_inv(phys_addr_t paddr, size_t size)
 {
 	unsigned long start = (unsigned long)phys_to_virt(paddr);
 	unsigned long end = start + size;
@@ -110,19 +110,19 @@ static void ax45mp_dma_cache_inv(phys_addr_t paddr, size_t size)
 	if (unlikely(start == end))
 		return;
 
-	line_size = ax45mp_priv.ax45mp_cache_line_size;
+	line_size = andes_priv.andes_cache_line_size;
 
 	start = start & (~(line_size - 1));
 	end = ((end + line_size - 1) & (~(line_size - 1)));
 
 	local_irq_save(flags);
 
-	ax45mp_cpu_dcache_inval_range(start, end);
+	andes_cpu_dcache_inval_range(start, end);
 
 	local_irq_restore(flags);
 }
 
-static void ax45mp_dma_cache_wback(phys_addr_t paddr, size_t size)
+static void andes_dma_cache_wback(phys_addr_t paddr, size_t size)
 {
 	unsigned long start = (unsigned long)phys_to_virt(paddr);
 	unsigned long end = start + size;
@@ -132,57 +132,57 @@ static void ax45mp_dma_cache_wback(phys_addr_t paddr, size_t size)
 	if (unlikely(start == end))
 		return;
 
-	line_size = ax45mp_priv.ax45mp_cache_line_size;
+	line_size = andes_priv.andes_cache_line_size;
 	start = start & (~(line_size - 1));
 	end = ((end + line_size - 1) & (~(line_size - 1)));
 	local_irq_save(flags);
-	ax45mp_cpu_dcache_wb_range(start, end);
+	andes_cpu_dcache_wb_range(start, end);
 	local_irq_restore(flags);
 }
 
-static void ax45mp_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
+static void andes_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
 {
-	ax45mp_dma_cache_wback(paddr, size);
-	ax45mp_dma_cache_inv(paddr, size);
+	andes_dma_cache_wback(paddr, size);
+	andes_dma_cache_inv(paddr, size);
 }
 
-static int ax45mp_get_l2_line_size(struct device_node *np)
+static int andes_get_l2_line_size(struct device_node *np)
 {
 	int ret;
 
-	ret = of_property_read_u32(np, "cache-line-size", &ax45mp_priv.ax45mp_cache_line_size);
+	ret = of_property_read_u32(np, "cache-line-size", &andes_priv.andes_cache_line_size);
 	if (ret) {
 		pr_err("Failed to get cache-line-size, defaulting to 64 bytes\n");
 		return ret;
 	}
 
-	if (ax45mp_priv.ax45mp_cache_line_size != AX45MP_CACHE_LINE_SIZE) {
+	if (andes_priv.andes_cache_line_size != ANDES_CACHE_LINE_SIZE) {
 		pr_err("Expected cache-line-size to be 64 bytes (found:%u)\n",
-		       ax45mp_priv.ax45mp_cache_line_size);
+		       andes_priv.andes_cache_line_size);
 		return -EINVAL;
 	}
 
 	return 0;
 }
 
-static const struct riscv_nonstd_cache_ops ax45mp_cmo_ops __initconst = {
-	.wback = &ax45mp_dma_cache_wback,
-	.inv = &ax45mp_dma_cache_inv,
-	.wback_inv = &ax45mp_dma_cache_wback_inv,
+static const struct riscv_nonstd_cache_ops andes_cmo_ops __initconst = {
+	.wback = &andes_dma_cache_wback,
+	.inv = &andes_dma_cache_inv,
+	.wback_inv = &andes_dma_cache_wback_inv,
 };
 
-static const struct of_device_id ax45mp_cache_ids[] = {
+static const struct of_device_id andes_cache_ids[] = {
 	{ .compatible = "andestech,ax45mp-cache" },
 	{ /* sentinel */ }
 };
 
-static int __init ax45mp_cache_init(void)
+static int __init andes_cache_init(void)
 {
 	struct resource res;
 	int ret;
 
 	struct device_node *np __free(device_node) =
-		of_find_matching_node(NULL, ax45mp_cache_ids);
+		of_find_matching_node(NULL, andes_cache_ids);
 	if (!of_device_is_available(np))
 		return -ENODEV;
 
@@ -191,7 +191,7 @@ static int __init ax45mp_cache_init(void)
 		return ret;
 
 	/*
-	 * If IOCP is present on the Andes AX45MP core riscv_cbom_block_size
+	 * If IOCP is present on the Andes core riscv_cbom_block_size
 	 * will be 0 for sure, so we can definitely rely on it. If
 	 * riscv_cbom_block_size = 0 we don't need to handle CMO using SW any
 	 * more so we just return success here and only if its being set we
@@ -200,18 +200,18 @@ static int __init ax45mp_cache_init(void)
 	if (!riscv_cbom_block_size)
 		return 0;
 
-	ax45mp_priv.l2c_base = ioremap(res.start, resource_size(&res));
-	if (!ax45mp_priv.l2c_base)
+	andes_priv.l2c_base = ioremap(res.start, resource_size(&res));
+	if (!andes_priv.l2c_base)
 		return -ENOMEM;
 
-	ret = ax45mp_get_l2_line_size(np);
+	ret = andes_get_l2_line_size(np);
 	if (ret) {
-		iounmap(ax45mp_priv.l2c_base);
+		iounmap(andes_priv.l2c_base);
 		return ret;
 	}
 
-	riscv_noncoherent_register_cache_ops(&ax45mp_cmo_ops);
+	riscv_noncoherent_register_cache_ops(&andes_cmo_ops);
 
 	return 0;
 }
-early_initcall(ax45mp_cache_init);
+early_initcall(andes_cache_init);
diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index a63df28df3b5..b36265d53ebb 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -465,7 +465,7 @@ config ARCH_R9A07G043
 	depends on !RISCV_ISA_ZICBOM
 	depends on RISCV_SBI
 	select ARCH_RZG2L
-	select AX45MP_L2_CACHE
+	select ANDES_LLCACHE
 	select CACHEMAINT_FOR_DMA
 	select DMA_GLOBAL_POOL
 	select ERRATA_ANDES
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
