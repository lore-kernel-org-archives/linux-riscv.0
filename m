Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4F3FB3D00
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 10:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cHRO0YtD6xLETebudVTKqbx/goyc9xjUatNULT04u6s=; b=4oJR3xY5XCdOhr
	mUkqVhhlXjL0iqCq6mHcKQ9apHGI9BGvnYNDnLxpEdE15Hy1Qp44sOxqnIgQ5VmSPI/c8e7kRrUba
	EJKmtLRRdmVtS2D1y0FgczSIu4UPyN9zPmQfs9XThFzYwyrZw6/rKFIG/2bVCU4e/avEs8iD81V9D
	8tgqyqxwG7EOIz/AnVtfIlluJzeQxHWzjxvd4YNgUUgv8+YY+Kcm1PWPxGhXhHUSLIrI7dFO2NtOA
	dMI6qAy/P8IhB2/P3LkkThXAHxsHGsbQ/o2GNyg06UDyzAlKwAJ3mkFBSFZ1GyhnB0z46sQmrf0y9
	FVmozXmEIZSXhqZHl9OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79rY-0000000B3VQ-1ZIu;
	Mon, 30 Mar 2026 10:28:52 +0000
Received: from exmail.andestech.com ([60.248.187.195] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79rU-0000000B3UV-1r42
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 10:28:50 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTP id 62UARsjB038086;
	Mon, 30 Mar 2026 18:27:54 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Mar
 2026 18:27:54 +0800
From: Hui Min Mina Chou <minachou@andestech.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <geert+renesas@glider.be>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <magnus.damm@gmail.com>,
        <ben717@andestech.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jonathan.cameron@huawei.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
CC: <tim609@andestech.com>, <alex749@andestech.com>, <az70021@gmail.com>,
        "Hui
 Min Mina Chou" <minachou@andestech.com>,
        charles <dminus@andestech.com>
Subject: [PATCH 1/7] cache: ax45mp_cache: refactor cache driver for generic Andes platform support
Date: Mon, 30 Mar 2026 18:27:18 +0800
Message-ID: <20260330102724.1012470-2-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330102724.1012470-1-minachou@andestech.com>
References: <20260330102724.1012470-1-minachou@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 62UARsjB038086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_032848_833598_36395589 
X-CRM114-Status: GOOD (  24.14  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Andes cache driver is not only usable with the AX45MP CPU but can also be
applied to other CPU within Andes platform (such as A27L2).
To improve maintainability and support future SoCs, this patch performs a
comprehensive refactoring to move away from model-specific naming.

key changes include:
 - replaced AX45MP-specific Kconfig and function names with generic "ANDES"
   prefixes to support multiple CPU types
 - updated all L2-related identifiers, structs, and prefixes to "LLC"
   to accurately reflect its role as the system's last-level cache
 - moved UCCTL* CSR definitions to <linux/soc/andes/csr.h>
 - standardized L1D and LLC macro prefixes (ANDES_L1D_* and ANDES_LLC_*)
   for better clarity
 - renamed compatible strings from ax45mp-cache to generic llcache
 - rename ax45mp_cache.c to andes_llcache.c

This is a structural refactoring; no functional behavior is changed.

Signed-off-by: charles <dminus@andestech.com>
Signed-off-by: Hui Min Mina Chou <minachou@andestech.com>
---
 arch/riscv/Kconfig.errata     |   2 +-
 drivers/cache/Kconfig         |   6 +-
 drivers/cache/Makefile        |   2 +-
 drivers/cache/andes_llcache.c | 224 ++++++++++++++++++++++++++++++++++
 drivers/cache/ax45mp_cache.c  | 217 --------------------------------
 drivers/soc/renesas/Kconfig   |   2 +-
 include/linux/soc/andes/csr.h |  12 ++
 7 files changed, 242 insertions(+), 223 deletions(-)
 create mode 100644 drivers/cache/andes_llcache.c
 delete mode 100644 drivers/cache/ax45mp_cache.c
 create mode 100644 include/linux/soc/andes/csr.h

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 3c945d086c7d..e32f1563ce3a 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -1,7 +1,7 @@
 menu "CPU errata selection"
 
 config ERRATA_ANDES
-	bool "Andes AX45MP errata"
+	bool "Andes errata"
 	depends on RISCV_ALTERNATIVE && RISCV_SBI
 	help
 	  All Andes errata Kconfig depend on this Kconfig. Disabling
diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
index 1518449d47b5..78142189f45c 100644
--- a/drivers/cache/Kconfig
+++ b/drivers/cache/Kconfig
@@ -10,11 +10,11 @@ menuconfig CACHEMAINT_FOR_DMA
 
 if CACHEMAINT_FOR_DMA
 
-config AX45MP_L2_CACHE
-	bool "Andes Technology AX45MP L2 Cache controller"
+config ANDES_CACHE
+	bool "Andes platform CPUs Cache controller"
 	select RISCV_NONSTANDARD_CACHE_OPS
 	help
-	  Support for the L2 cache controller on Andes Technology AX45MP platforms.
+	  Support for the L1 and LLC (last level cache) controller on Andes platform CPUs.
 
 config SIFIVE_CCACHE
 	bool "Sifive Composable Cache controller"
diff --git a/drivers/cache/Makefile b/drivers/cache/Makefile
index b3362b15d6c1..4a218ad6cec0 100644
--- a/drivers/cache/Makefile
+++ b/drivers/cache/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_AX45MP_L2_CACHE)		+= ax45mp_cache.o
+obj-$(CONFIG_ANDES_CACHE)		+= andes_llcache.o
 obj-$(CONFIG_SIFIVE_CCACHE)		+= sifive_ccache.o
 obj-$(CONFIG_STARFIVE_STARLINK_CACHE)	+= starfive_starlink_cache.o
 
diff --git a/drivers/cache/andes_llcache.c b/drivers/cache/andes_llcache.c
new file mode 100644
index 000000000000..d5e382f3c801
--- /dev/null
+++ b/drivers/cache/andes_llcache.c
@@ -0,0 +1,224 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * non-coherent cache operations for Andes Platform CPUs.
+ *
+ * Copyright (C) 2023 Renesas Electronics Corp.
+ */
+
+#include <linux/cacheflush.h>
+#include <linux/cacheinfo.h>
+#include <linux/dma-direction.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/soc/andes/csr.h>
+
+#include <asm/dma-noncoherent.h>
+
+/* L1 D-cache operation encoding */
+#define ANDES_L1D_CCTL_VA_INVAL			0x0	/* Invalidate an L1D cacheline */
+#define ANDES_L1D_CCTL_VA_WB			0x1	/* Write-back an L1D cacheline */
+#define ANDES_L1D_CCTL_VA_WBINVAL		0x2	/* Flush an L1D cacheline */
+#define ANDES_L1D_CCTL_WBINVAL_ALL		0x6	/* Flush the entire L1D cache */
+
+/* LLC registers */
+#define ANDES_LLC_REG_CFG_OFFSET		0x0
+#define ANDES_LLC_REG_CTRL_OFFSET		0x8
+#define ANDES_LLC_REG_ASYNC_ERR_OFFSET		0x30
+#define ANDES_LLC_REG_ERR_OFFSET		0x38
+#define ANDES_LLC_REG_CCTL_CMD_OFFSET_C0	0x40
+#define ANDES_LLC_REG_CCTL_ACC_OFFSET_C0	0x48
+#define ANDES_LLC_REG_CCTL_STATUS_OFFSET_C0	0x80
+
+/* LLC CCTL status encoding */
+#define ANDES_LLC_CCTL_STATUS_IDLE		0x0
+#define ANDES_LLC_CCTL_STATUS_RUNNING		0x1
+#define ANDES_LLC_CCTL_STATUS_ILLEGAL		0x2
+
+/* LLC CCTL status core 0 mask */
+#define ANDES_LLC_CCTL_STATUS_MASK_C0		GENMASK(3, 0)
+
+/* LLC operation encoding */
+#define ANDES_LLC_CCTL_PA_INVAL			0x8	/* Invalidate an LLC cacheline */
+#define ANDES_LLC_CCTL_PA_WB			0x9	/* Write-back an LLC cacheline */
+#define ANDES_LLC_CCTL_PA_WBINVAL		0xa	/* Flush an LLC cacheline */
+#define ANDES_LLC_CCTL_WBINVAL_ALL		0x12	/* Flush the entire LLC cache */
+
+/* LLC CCTL registers and fields by core */
+#define ANDES_LLC_REG_PER_CORE_OFFSET		0x10
+#define ANDES_CCTL_LLC_STATUS_PER_CORE_OFFSET	0x4
+
+#define ANDES_LLC_REG_CCTL_CMD_OFFSET_BY_CORE(n)	\
+	(ANDES_LLC_REG_CCTL_CMD_OFFSET_C0 + ((n) * ANDES_LLC_REG_PER_CORE_OFFSET))
+#define ANDES_LLC_REG_CCTL_ACC_OFFSET_BY_CORE(n)	\
+	(ANDES_LLC_REG_CCTL_ACC_OFFSET_C0 + ((n) * ANDES_LLC_REG_PER_CORE_OFFSET))
+#define ANDES_LLC_CCTL_STATUS_MASK_BY_CORE(n)	\
+	(ANDES_LLC_CCTL_STATUS_MASK_C0 << ((n) * ANDES_CCTL_LLC_STATUS_PER_CORE_OFFSET))
+
+#define ANDES_CACHE_LINE_SIZE			64
+
+struct andes_priv {
+	void __iomem *llc_base;
+	u32 andes_cache_line_size;
+};
+
+static struct andes_priv andes_priv;
+
+/* LLC operations */
+static inline uint32_t andes_cpu_llc_get_cctl_status(void)
+{
+	return readl(andes_priv.llc_base + ANDES_LLC_REG_CCTL_STATUS_OFFSET_C0);
+}
+
+static void andes_cpu_cache_operation(unsigned long start, unsigned long end,
+				       unsigned int l1_op, unsigned int llc_op)
+{
+	unsigned long line_size = andes_priv.andes_cache_line_size;
+	void __iomem *base = andes_priv.llc_base;
+	int mhartid = smp_processor_id();
+	unsigned long pa;
+
+	while (end > start) {
+		csr_write(CSR_UCCTLBEGINADDR, start);
+		csr_write(CSR_UCCTLCOMMAND, l1_op);
+
+		pa = virt_to_phys((void *)start);
+		writel(pa, base + ANDES_LLC_REG_CCTL_ACC_OFFSET_BY_CORE(mhartid));
+		writel(llc_op, base + ANDES_LLC_REG_CCTL_CMD_OFFSET_BY_CORE(mhartid));
+		while ((andes_cpu_llc_get_cctl_status() &
+			ANDES_LLC_CCTL_STATUS_MASK_BY_CORE(mhartid)) !=
+			ANDES_LLC_CCTL_STATUS_IDLE)
+			;
+
+		start += line_size;
+	}
+}
+
+/* Write-back L1 and LLC entry */
+static inline void andes_cpu_dcache_wb_range(unsigned long start, unsigned long end)
+{
+	andes_cpu_cache_operation(start, end, ANDES_L1D_CCTL_VA_WB,
+				   ANDES_LLC_CCTL_PA_WB);
+}
+
+/* Invalidate the L1 and LLC entry */
+static inline void andes_cpu_dcache_inval_range(unsigned long start, unsigned long end)
+{
+	andes_cpu_cache_operation(start, end, ANDES_L1D_CCTL_VA_INVAL,
+				   ANDES_LLC_CCTL_PA_INVAL);
+}
+
+static void andes_dma_cache_inv(phys_addr_t paddr, size_t size)
+{
+	unsigned long start = (unsigned long)phys_to_virt(paddr);
+	unsigned long end = start + size;
+	unsigned long line_size;
+	unsigned long flags;
+
+	if (unlikely(start == end))
+		return;
+
+	line_size = andes_priv.andes_cache_line_size;
+
+	start = start & (~(line_size - 1));
+	end = ((end + line_size - 1) & (~(line_size - 1)));
+
+	local_irq_save(flags);
+
+	andes_cpu_dcache_inval_range(start, end);
+
+	local_irq_restore(flags);
+}
+
+static void andes_dma_cache_wback(phys_addr_t paddr, size_t size)
+{
+	unsigned long start = (unsigned long)phys_to_virt(paddr);
+	unsigned long end = start + size;
+	unsigned long line_size;
+	unsigned long flags;
+
+	if (unlikely(start == end))
+		return;
+
+	line_size = andes_priv.andes_cache_line_size;
+	start = start & (~(line_size - 1));
+	end = ((end + line_size - 1) & (~(line_size - 1)));
+	local_irq_save(flags);
+	andes_cpu_dcache_wb_range(start, end);
+	local_irq_restore(flags);
+}
+
+static void andes_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
+{
+	andes_dma_cache_wback(paddr, size);
+	andes_dma_cache_inv(paddr, size);
+}
+
+static int andes_get_llc_line_size(struct device_node *np)
+{
+	int ret;
+
+	ret = of_property_read_u32(np, "cache-line-size", &andes_priv.andes_cache_line_size);
+	if (ret) {
+		pr_err("Failed to get cache-line-size, defaulting to 64 bytes\n");
+		return ret;
+	}
+
+	if (andes_priv.andes_cache_line_size != ANDES_CACHE_LINE_SIZE) {
+		pr_err("Expected cache-line-size to be 64 bytes (found:%u)\n",
+		       andes_priv.andes_cache_line_size);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct riscv_nonstd_cache_ops andes_cmo_ops __initconst = {
+	.wback = &andes_dma_cache_wback,
+	.inv = &andes_dma_cache_inv,
+	.wback_inv = &andes_dma_cache_wback_inv,
+};
+
+static const struct of_device_id andes_cache_ids[] = {
+	{ .compatible = "andestech,llcache" },
+	{ /* sentinel */ }
+};
+
+static int __init andes_cache_init(void)
+{
+	struct resource res;
+	int ret;
+
+	struct device_node *np __free(device_node) =
+		of_find_matching_node(NULL, andes_cache_ids);
+	if (!of_device_is_available(np))
+		return -ENODEV;
+
+	ret = of_address_to_resource(np, 0, &res);
+	if (ret)
+		return ret;
+
+	/*
+	 * If IOCP is present on the Andes AX45MP core riscv_cbom_block_size
+	 * will be 0 for sure, so we can definitely rely on it. If
+	 * riscv_cbom_block_size = 0 we don't need to handle CMO using SW any
+	 * more so we just return success here and only if its being set we
+	 * continue further in the probe path.
+	 */
+	if (!riscv_cbom_block_size)
+		return 0;
+
+	andes_priv.llc_base = ioremap(res.start, resource_size(&res));
+	if (!andes_priv.llc_base)
+		return -ENOMEM;
+
+	ret = andes_get_llc_line_size(np);
+	if (ret) {
+		iounmap(andes_priv.llc_base);
+		return ret;
+	}
+
+	riscv_noncoherent_register_cache_ops(&andes_cmo_ops);
+
+	return 0;
+}
+early_initcall(andes_cache_init);
diff --git a/drivers/cache/ax45mp_cache.c b/drivers/cache/ax45mp_cache.c
deleted file mode 100644
index 934c5087ec2b..000000000000
--- a/drivers/cache/ax45mp_cache.c
+++ /dev/null
@@ -1,217 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * non-coherent cache functions for Andes AX45MP
- *
- * Copyright (C) 2023 Renesas Electronics Corp.
- */
-
-#include <linux/cacheflush.h>
-#include <linux/cacheinfo.h>
-#include <linux/dma-direction.h>
-#include <linux/of_address.h>
-#include <linux/of_platform.h>
-
-#include <asm/dma-noncoherent.h>
-
-/* L2 cache registers */
-#define AX45MP_L2C_REG_CTL_OFFSET		0x8
-
-#define AX45MP_L2C_REG_C0_CMD_OFFSET		0x40
-#define AX45MP_L2C_REG_C0_ACC_OFFSET		0x48
-#define AX45MP_L2C_REG_STATUS_OFFSET		0x80
-
-/* D-cache operation */
-#define AX45MP_CCTL_L1D_VA_INVAL		0 /* Invalidate an L1 cache entry */
-#define AX45MP_CCTL_L1D_VA_WB			1 /* Write-back an L1 cache entry */
-
-/* L2 CCTL status */
-#define AX45MP_CCTL_L2_STATUS_IDLE		0
-
-/* L2 CCTL status cores mask */
-#define AX45MP_CCTL_L2_STATUS_C0_MASK		0xf
-
-/* L2 cache operation */
-#define AX45MP_CCTL_L2_PA_INVAL			0x8 /* Invalidate an L2 cache entry */
-#define AX45MP_CCTL_L2_PA_WB			0x9 /* Write-back an L2 cache entry */
-
-#define AX45MP_L2C_REG_PER_CORE_OFFSET		0x10
-#define AX45MP_CCTL_L2_STATUS_PER_CORE_OFFSET	4
-
-#define AX45MP_L2C_REG_CN_CMD_OFFSET(n)	\
-	(AX45MP_L2C_REG_C0_CMD_OFFSET + ((n) * AX45MP_L2C_REG_PER_CORE_OFFSET))
-#define AX45MP_L2C_REG_CN_ACC_OFFSET(n)	\
-	(AX45MP_L2C_REG_C0_ACC_OFFSET + ((n) * AX45MP_L2C_REG_PER_CORE_OFFSET))
-#define AX45MP_CCTL_L2_STATUS_CN_MASK(n)	\
-	(AX45MP_CCTL_L2_STATUS_C0_MASK << ((n) * AX45MP_CCTL_L2_STATUS_PER_CORE_OFFSET))
-
-#define AX45MP_CCTL_REG_UCCTLBEGINADDR_NUM	0x80b
-#define AX45MP_CCTL_REG_UCCTLCOMMAND_NUM	0x80c
-
-#define AX45MP_CACHE_LINE_SIZE			64
-
-struct ax45mp_priv {
-	void __iomem *l2c_base;
-	u32 ax45mp_cache_line_size;
-};
-
-static struct ax45mp_priv ax45mp_priv;
-
-/* L2 Cache operations */
-static inline uint32_t ax45mp_cpu_l2c_get_cctl_status(void)
-{
-	return readl(ax45mp_priv.l2c_base + AX45MP_L2C_REG_STATUS_OFFSET);
-}
-
-static void ax45mp_cpu_cache_operation(unsigned long start, unsigned long end,
-				       unsigned int l1_op, unsigned int l2_op)
-{
-	unsigned long line_size = ax45mp_priv.ax45mp_cache_line_size;
-	void __iomem *base = ax45mp_priv.l2c_base;
-	int mhartid = smp_processor_id();
-	unsigned long pa;
-
-	while (end > start) {
-		csr_write(AX45MP_CCTL_REG_UCCTLBEGINADDR_NUM, start);
-		csr_write(AX45MP_CCTL_REG_UCCTLCOMMAND_NUM, l1_op);
-
-		pa = virt_to_phys((void *)start);
-		writel(pa, base + AX45MP_L2C_REG_CN_ACC_OFFSET(mhartid));
-		writel(l2_op, base + AX45MP_L2C_REG_CN_CMD_OFFSET(mhartid));
-		while ((ax45mp_cpu_l2c_get_cctl_status() &
-			AX45MP_CCTL_L2_STATUS_CN_MASK(mhartid)) !=
-			AX45MP_CCTL_L2_STATUS_IDLE)
-			;
-
-		start += line_size;
-	}
-}
-
-/* Write-back L1 and L2 cache entry */
-static inline void ax45mp_cpu_dcache_wb_range(unsigned long start, unsigned long end)
-{
-	ax45mp_cpu_cache_operation(start, end, AX45MP_CCTL_L1D_VA_WB,
-				   AX45MP_CCTL_L2_PA_WB);
-}
-
-/* Invalidate the L1 and L2 cache entry */
-static inline void ax45mp_cpu_dcache_inval_range(unsigned long start, unsigned long end)
-{
-	ax45mp_cpu_cache_operation(start, end, AX45MP_CCTL_L1D_VA_INVAL,
-				   AX45MP_CCTL_L2_PA_INVAL);
-}
-
-static void ax45mp_dma_cache_inv(phys_addr_t paddr, size_t size)
-{
-	unsigned long start = (unsigned long)phys_to_virt(paddr);
-	unsigned long end = start + size;
-	unsigned long line_size;
-	unsigned long flags;
-
-	if (unlikely(start == end))
-		return;
-
-	line_size = ax45mp_priv.ax45mp_cache_line_size;
-
-	start = start & (~(line_size - 1));
-	end = ((end + line_size - 1) & (~(line_size - 1)));
-
-	local_irq_save(flags);
-
-	ax45mp_cpu_dcache_inval_range(start, end);
-
-	local_irq_restore(flags);
-}
-
-static void ax45mp_dma_cache_wback(phys_addr_t paddr, size_t size)
-{
-	unsigned long start = (unsigned long)phys_to_virt(paddr);
-	unsigned long end = start + size;
-	unsigned long line_size;
-	unsigned long flags;
-
-	if (unlikely(start == end))
-		return;
-
-	line_size = ax45mp_priv.ax45mp_cache_line_size;
-	start = start & (~(line_size - 1));
-	end = ((end + line_size - 1) & (~(line_size - 1)));
-	local_irq_save(flags);
-	ax45mp_cpu_dcache_wb_range(start, end);
-	local_irq_restore(flags);
-}
-
-static void ax45mp_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
-{
-	ax45mp_dma_cache_wback(paddr, size);
-	ax45mp_dma_cache_inv(paddr, size);
-}
-
-static int ax45mp_get_l2_line_size(struct device_node *np)
-{
-	int ret;
-
-	ret = of_property_read_u32(np, "cache-line-size", &ax45mp_priv.ax45mp_cache_line_size);
-	if (ret) {
-		pr_err("Failed to get cache-line-size, defaulting to 64 bytes\n");
-		return ret;
-	}
-
-	if (ax45mp_priv.ax45mp_cache_line_size != AX45MP_CACHE_LINE_SIZE) {
-		pr_err("Expected cache-line-size to be 64 bytes (found:%u)\n",
-		       ax45mp_priv.ax45mp_cache_line_size);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static const struct riscv_nonstd_cache_ops ax45mp_cmo_ops __initdata = {
-	.wback = &ax45mp_dma_cache_wback,
-	.inv = &ax45mp_dma_cache_inv,
-	.wback_inv = &ax45mp_dma_cache_wback_inv,
-};
-
-static const struct of_device_id ax45mp_cache_ids[] = {
-	{ .compatible = "andestech,ax45mp-cache" },
-	{ /* sentinel */ }
-};
-
-static int __init ax45mp_cache_init(void)
-{
-	struct resource res;
-	int ret;
-
-	struct device_node *np __free(device_node) =
-		of_find_matching_node(NULL, ax45mp_cache_ids);
-	if (!of_device_is_available(np))
-		return -ENODEV;
-
-	ret = of_address_to_resource(np, 0, &res);
-	if (ret)
-		return ret;
-
-	/*
-	 * If IOCP is present on the Andes AX45MP core riscv_cbom_block_size
-	 * will be 0 for sure, so we can definitely rely on it. If
-	 * riscv_cbom_block_size = 0 we don't need to handle CMO using SW any
-	 * more so we just return success here and only if its being set we
-	 * continue further in the probe path.
-	 */
-	if (!riscv_cbom_block_size)
-		return 0;
-
-	ax45mp_priv.l2c_base = ioremap(res.start, resource_size(&res));
-	if (!ax45mp_priv.l2c_base)
-		return -ENOMEM;
-
-	ret = ax45mp_get_l2_line_size(np);
-	if (ret) {
-		iounmap(ax45mp_priv.l2c_base);
-		return ret;
-	}
-
-	riscv_noncoherent_register_cache_ops(&ax45mp_cmo_ops);
-
-	return 0;
-}
-early_initcall(ax45mp_cache_init);
diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 1e50dc7c31cd..e0319c8236ee 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -447,7 +447,7 @@ config ARCH_R9A07G043
 	depends on !RISCV_ISA_ZICBOM
 	depends on RISCV_SBI
 	select ARCH_RZG2L
-	select AX45MP_L2_CACHE
+	select ANDES_CACHE
 	select CACHEMAINT_FOR_DMA
 	select DMA_GLOBAL_POOL
 	select ERRATA_ANDES
diff --git a/include/linux/soc/andes/csr.h b/include/linux/soc/andes/csr.h
new file mode 100644
index 000000000000..3214b4b08a46
--- /dev/null
+++ b/include/linux/soc/andes/csr.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2026 Andes Technology Corporation.
+ */
+#ifndef __LINUX_SOC_ANDES_CSR_H
+#define __LINUX_SOC_ANDES_CSR_H
+
+/* User mode control registers */
+#define CSR_UCCTLBEGINADDR		0x80b
+#define CSR_UCCTLCOMMAND		0x80c
+
+#endif /* !__LINUX_SOC_ANDES_CSR_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
