Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B88DCCD18D
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 15:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uES7HSxGO83/68tnLy1221DwPDDjFNByi/cc1DgWA64=; b=4yokCZ+UL9Awu3
	JtPYU0TzulK7eBOEoxbYAE+CCYCK88Ib1KYgmXMpgb3tTVVqrtdEZKj34cy+cpQUIXGrKSJBVFtNZ
	glSdLmtrScaRewYTSexQr6XZ2Hp5ISEBYNFskZtp1sbnnS7C/+aHopa3mqVE7enjw4CdhQRjlMyq8
	C1ojVFqBWIQooNHooRSjnLUY7bqA9V17eWADOpPTm2AoXmXGq3XgnBg252oAb6TWNcJl6Tg65865D
	DMZJSYaIe2MUoa6rs/0CsPPrdu6WkwV5p9hBeYtxDE3PiA9ZO9T38ALByM2MTKT2zXN9HbP70JXCq
	6oP2ThmHt/8CPYAR9jAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KaP-0000000DiGJ-0nE2;
	Mon, 13 Oct 2025 15:35:45 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KaL-0000000DiB5-3VIt
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 15:35:43 +0000
Received: by mail-il1-x143.google.com with SMTP id e9e14a558f8ab-42e6df6fe53so18150005ab.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 08:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760369741; x=1760974541; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5w3UvnnZmvULW91Nw3sqHq6gHytRfs1UsmObXdK/1xk=;
        b=grSVpOVqix/JE11zKRGiOVaw4wLHoJXiTk4IJkL1Gvs7xBc/0VXKhaUT+v2Saj3QOO
         +cC/NfXQsZabyCAGUZ/4EgAR018xuDb6pUQkJ5bi8JiKCn5ZjkRUufACGw3OCxkL0LdX
         eHcgvI6WC89d0RlSzbrn/hrgHXzgZZ2Pbeq1MUvwVpzt8xNTeosjhDNFan3y31vsq1cT
         JFqWMzpBzMUKUjTm+Gf9wRc15Hei+2nBgREyMnmys55xSqBC3SLGLFKXm07q/3dFd1Wk
         Mm2axnsyNMutIio/L53cZ8r5BFym4Z6PBZwa9utvXv/g84z8BqrLSNfd3jDrnrdtzoG5
         5MkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760369741; x=1760974541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5w3UvnnZmvULW91Nw3sqHq6gHytRfs1UsmObXdK/1xk=;
        b=b7lXtTacMezTy1XtQXij+PVgc3OgYQV6sc1znkSx/fLRE9EzkLuHaBCzgwMruubZXn
         YiStW4eL/r0i6x/VxP8fZmmup0FmMsG125MB0fOzhC5xxqPN4kjjquS1CVr9S8L6URmm
         u9jCGEk+THm44/Zx+Gn6JjfSHwhnn9i1qyrMSXG2jl0Fx9X481gatvE2gCrNB5AYqb/d
         6VWQhg/fFjoZyY9dBS5zf8SvjVgTTi+WV9eBfFMlUSSYg3+DTtw3sE/YEyyYWJitsRH1
         lX0HBprjmF9jXWrEDmC/kllwcAVPE7XAnPvgLlbMOv2yB0jplTMucdLba/HxApoW2i67
         Frvw==
X-Forwarded-Encrypted: i=1; AJvYcCUna2uvHC9QgzhKR2G6wWqKNOdH6gzbhSSFsnrzenbb0ArUYaP3B7/qN46BLwiZxUlVQ8tttQQCfJPOzA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMvHk+iVYXO/37dteTbXhB3prcxEnvrliaiS+HaudHw8MvflAl
	Km8m3afiiKUHc0U3rvhoWDneHrcBA5BVcstUXBQmHn4d2E5VQY/dYtyBXLBh+KfZJ3g=
X-Gm-Gg: ASbGncsgvAEeztJg1RquSuRPhLwsV58qD4/32y6kqvVb1pFMBatS52Yw9nr7s/nH+Rl
	1P8k2CCXFrc+z97uG4WS5oO6wMfI1q7/lR/ienLLP+ypszVtSg5uygQKW7u+WJCBT0IYrgkOAYV
	zjU3BrCk3DDu8FHkWgBeDFRDLcW3VFKKf1ISlRC4TlWEEk1yz/1AGKLpmW+jMx/Ak/myz6o3uN4
	P6/pXdrNdC2qo0aCtI+Tq1PjEvxo+px70x9wrWW3VFqOpC3UagQrYnRSHXcvwTY/ypcgfWLwcHH
	VDVRN4QHtmd6bTtBrqmT0fC4w60BJi8g9BkHS6g7gDXsaRSx5alFClCG6um51X7EmLRz7fb3ixv
	cuiomkXc4KaKoewitywj8ZDPeEsOYSJyzuf9926g+wgebtMPUZ85Zk9wAf28/0nMEjXF9vKt4ag
	NRtUadMsvjMI8MpvUlmxg=
X-Google-Smtp-Source: AGHT+IES+fB7FUMZ1lbNwr3SH2nYvzCas9CYlWeRrdVjRa/jHhDD4zHUYKmDNK63qqxQfLzG9WgNYg==
X-Received: by 2002:a05:6e02:1946:b0:42f:96ec:50a5 with SMTP id e9e14a558f8ab-42f96ec51a2mr136311375ab.20.1760369740902;
        Mon, 13 Oct 2025 08:35:40 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-58f6c49b522sm3910266173.1.2025.10.13.08.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 08:35:40 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	christian.bruel@foss.st.com,
	shradha.t@samsung.com,
	krishna.chundru@oss.qualcomm.com,
	qiang.yu@oss.qualcomm.com,
	namcao@linutronix.de,
	thippeswamy.havalige@amd.com,
	inochiama@gmail.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] PCI: spacemit: introduce SpacemiT PCIe host driver
Date: Mon, 13 Oct 2025 10:35:22 -0500
Message-ID: <20251013153526.2276556-6-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251013153526.2276556-1-elder@riscstar.com>
References: <20251013153526.2276556-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_083541_908454_19923631 
X-CRM114-Status: GOOD (  28.32  )
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

Introduce a driver for the PCIe host controller found in the SpacemiT
K1 SoC.  The hardware is derived from the Synopsys DesignWare PCIe IP.
The driver supports three PCIe ports that operate at PCIe gen2 transfer
rates (5 GT/sec).  The first port uses a combo PHY, which may be
configured for use for USB 3 instead.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - Renamed the PCIe driver source file "pcie-spacemit-k1.c"
    - Renamed the PCIe driver Kconfig option PCIE_SPACEMIT_K1; it
      is now tristate rather than Boolean
    - The PCIe host compatible string is now "spacemit,k1-pcie"
    - Renamed the PMU syscon property to be "spacemit,apmu"
    - Renamed the symbols representing the PCI vendor and device IDs
      to align with <linux/pci_ids.h>
    - Use PCIE_T_PVPERL_MS rather than 100 to represent a standard
      delay period.
    - Use platform (not dev) driver-data access functions; assignment
      is done only after the private structure is initialized
    - Deleted some unneeded includes in the PCIe driver.
    - Dropped error checking when operating on MMIO-backed regmaps
    - Added a regmap_read() call in two places, to ensure a specified
      delay occurs *after* the a MMIO write has reached its target.
    - Used ARRAY_SIZE() (not a local variable value) in a few spots
    - Now use readl_relaxed()/writel_relaxed() when operating on
      the "link" I/O memory space in the PCIe driver
    - Updated a few error messages for consistency
    - No longer specify suppress_bind_attrs in the PCIe driver
    - Now specify PCIe driver probe type as PROBE_PREFER_ASYNCHRONOUS
    - No longer use (void) cast to indicate ignored return values

 drivers/pci/controller/dwc/Kconfig            |  10 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 319 ++++++++++++++++++
 3 files changed, 330 insertions(+)
 create mode 100644 drivers/pci/controller/dwc/pcie-spacemit-k1.c

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index 349d4657393c9..ede59b34c99ba 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -509,6 +509,16 @@ config PCI_KEYSTONE_EP
 	  on DesignWare hardware and therefore the driver re-uses the
 	  DesignWare core functions to implement the driver.
 
+config PCIE_SPACEMIT_K1
+	tristate "SpacemiT K1 PCIe controller (host mode)"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on PCI && OF && HAS_IOMEM
+	select PCIE_DW_HOST
+	default ARCH_SPACEMIT
+	help
+	  Enables support for the PCIe controller in the K1 SoC operating
+	  in host mode.
+
 config PCIE_VISCONTI_HOST
 	bool "Toshiba Visconti PCIe controller"
 	depends on ARCH_VISCONTI || COMPILE_TEST
diff --git a/drivers/pci/controller/dwc/Makefile b/drivers/pci/controller/dwc/Makefile
index 7ae28f3b0fb39..662b0a219ddc4 100644
--- a/drivers/pci/controller/dwc/Makefile
+++ b/drivers/pci/controller/dwc/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_PCIE_UNIPHIER) += pcie-uniphier.o
 obj-$(CONFIG_PCIE_UNIPHIER_EP) += pcie-uniphier-ep.o
 obj-$(CONFIG_PCIE_VISCONTI_HOST) += pcie-visconti.o
 obj-$(CONFIG_PCIE_RCAR_GEN4) += pcie-rcar-gen4.o
+obj-$(CONFIG_PCIE_SPACEMIT_K1) += pcie-spacemit-k1.o
 obj-$(CONFIG_PCIE_STM32_HOST) += pcie-stm32.o
 obj-$(CONFIG_PCIE_STM32_EP) += pcie-stm32-ep.o
 
diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
new file mode 100644
index 0000000000000..d58232cbb8a02
--- /dev/null
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -0,0 +1,319 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SpacemiT K1 PCIe host driver
+ *
+ * Copyright (C) 2025 by RISCstar Solutions Corporation.  All rights reserved.
+ * Copyright (c) 2023, spacemit Corporation.
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gfp.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mod_devicetable.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <linux/types.h>
+
+#include "pcie-designware.h"
+
+#define PCI_VENDOR_ID_SPACEMIT		0x201f
+#define PCI_DEVICE_ID_SPACEMIT_K1	0x0001
+
+/* Offsets and field definitions for link management registers */
+
+#define K1_PHY_AHB_IRQ_EN			0x0000
+#define PCIE_INTERRUPT_EN		BIT(0)
+
+#define K1_PHY_AHB_LINK_STS			0x0004
+#define SMLH_LINK_UP			BIT(1)
+#define RDLH_LINK_UP			BIT(12)
+
+#define INTR_ENABLE				0x0014
+#define MSI_CTRL_INT			BIT(11)
+
+/* Some controls require APMU regmap access */
+#define SYSCON_APMU			"spacemit,apmu"
+
+/* Offsets and field definitions for APMU registers */
+
+#define PCIE_CLK_RESET_CONTROL			0x0000
+#define LTSSM_EN			BIT(6)
+#define PCIE_AUX_PWR_DET		BIT(9)
+#define PCIE_RC_PERST			BIT(12)	/* 1: assert PERST# */
+#define APP_HOLD_PHY_RST		BIT(30)
+#define DEVICE_TYPE_RC			BIT(31)	/* 0: endpoint; 1: RC */
+
+#define PCIE_CONTROL_LOGIC			0x0004
+#define PCIE_SOFT_RESET			BIT(0)
+
+struct k1_pcie {
+	struct dw_pcie pci;
+	struct phy *phy;
+	void __iomem *link;
+	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
+	u32 pmu_off;
+};
+
+#define to_k1_pcie(dw_pcie) \
+		platform_get_drvdata(to_platform_device((dw_pcie)->dev))
+
+static void k1_pcie_toggle_soft_reset(struct k1_pcie *k1)
+{
+	u32 offset;
+	u32 val;
+
+	/*
+	 * Write, then read back to guarantee it has reached the device
+	 * before we start the delay.
+	 */
+	offset = k1->pmu_off + PCIE_CONTROL_LOGIC;
+	regmap_set_bits(k1->pmu, offset, PCIE_SOFT_RESET);
+	regmap_read(k1->pmu, offset, &val);
+
+	mdelay(2);
+
+	regmap_clear_bits(k1->pmu, offset, PCIE_SOFT_RESET);
+}
+
+/* Enable app clocks, deassert resets */
+static int k1_pcie_activate(struct k1_pcie *k1)
+{
+	struct dw_pcie *pci = &k1->pci;
+	int ret;
+
+	ret = clk_bulk_prepare_enable(ARRAY_SIZE(pci->app_clks), pci->app_clks);
+	if (ret)
+		return ret;
+
+	ret = reset_control_bulk_deassert(ARRAY_SIZE(pci->app_rsts),
+					  pci->app_rsts);
+	if (ret)
+		goto err_disable_clks;
+
+	ret = reset_control_bulk_deassert(ARRAY_SIZE(pci->core_rsts),
+					  pci->core_rsts);
+	if (ret)
+		goto err_assert_resets;
+
+	return 0;
+
+err_assert_resets:
+	reset_control_bulk_assert(ARRAY_SIZE(pci->app_rsts), pci->app_rsts);
+err_disable_clks:
+	clk_bulk_disable_unprepare(ARRAY_SIZE(pci->app_clks), pci->app_clks);
+
+	return ret;
+}
+
+/* Assert resets, disable app clocks */
+static void k1_pcie_deactivate(struct k1_pcie *k1)
+{
+	struct dw_pcie *pci = &k1->pci;
+
+	reset_control_bulk_assert(ARRAY_SIZE(pci->core_rsts), pci->core_rsts);
+	reset_control_bulk_assert(ARRAY_SIZE(pci->app_rsts), pci->app_rsts);
+	clk_bulk_disable_unprepare(ARRAY_SIZE(pci->app_clks), pci->app_clks);
+}
+
+static int k1_pcie_init(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct k1_pcie *k1 = to_k1_pcie(pci);
+	u32 offset;
+	u32 mask;
+	u32 val;
+	int ret;
+
+	k1_pcie_toggle_soft_reset(k1);
+
+	ret = k1_pcie_activate(k1);
+	if (ret)
+		return ret;
+
+	ret = phy_init(k1->phy);
+	if (ret) {
+		k1_pcie_deactivate(k1);
+
+		return ret;
+	}
+
+	/* Set the PCI vendor and device ID */
+	dw_pcie_dbi_ro_wr_en(pci);
+	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
+	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, PCI_DEVICE_ID_SPACEMIT_K1);
+	dw_pcie_dbi_ro_wr_dis(pci);
+
+	/*
+	 * Assert fundamental reset (drive PERST# low).  Put the port in
+	 * root complex mode, and indicate that Vaux (3.3v) is present.
+	 */
+	mask = PCIE_RC_PERST;
+	mask |= DEVICE_TYPE_RC | PCIE_AUX_PWR_DET;
+
+	/*
+	 * Write, then read back to guarantee it has reached the device
+	 * before we start the delay.
+	 */
+	offset = k1->pmu_off + PCIE_CLK_RESET_CONTROL;
+	regmap_set_bits(k1->pmu, offset, mask);
+	regmap_read(k1->pmu, offset, &val);
+
+	mdelay(PCIE_T_PVPERL_MS);
+
+	/* Deassert fundamental reset (drive PERST# high) */
+	regmap_clear_bits(k1->pmu, offset, PCIE_RC_PERST);
+
+	return 0;
+}
+
+static void k1_pcie_deinit(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct k1_pcie *k1 = to_k1_pcie(pci);
+
+	/* Assert fundamental reset (drive PERST# low) */
+	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
+			PCIE_RC_PERST);
+
+	phy_exit(k1->phy);
+
+	k1_pcie_deactivate(k1);
+}
+
+static const struct dw_pcie_host_ops k1_pcie_host_ops = {
+	.init		= k1_pcie_init,
+	.deinit		= k1_pcie_deinit,
+};
+
+static bool k1_pcie_link_up(struct dw_pcie *pci)
+{
+	struct k1_pcie *k1 = to_k1_pcie(pci);
+	u32 val;
+
+	val = readl_relaxed(k1->link + K1_PHY_AHB_LINK_STS);
+
+	return (val & RDLH_LINK_UP) && (val & SMLH_LINK_UP);
+}
+
+static int k1_pcie_start_link(struct dw_pcie *pci)
+{
+	struct k1_pcie *k1 = to_k1_pcie(pci);
+	u32 val;
+
+	/* Stop holding the PHY in reset, and enable link training */
+	regmap_update_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
+			   APP_HOLD_PHY_RST | LTSSM_EN, LTSSM_EN);
+
+	/* Enable the MSI interrupt */
+	writel_relaxed(MSI_CTRL_INT, k1->link + INTR_ENABLE);
+
+	/* Top-level interrupt enable */
+	val = readl_relaxed(k1->link + K1_PHY_AHB_IRQ_EN);
+	val |= PCIE_INTERRUPT_EN;
+	writel_relaxed(val, k1->link + K1_PHY_AHB_IRQ_EN);
+
+	return 0;
+}
+
+static void k1_pcie_stop_link(struct dw_pcie *pci)
+{
+	struct k1_pcie *k1 = to_k1_pcie(pci);
+	u32 val;
+
+	/* Disable interrupts */
+	val = readl_relaxed(k1->link + K1_PHY_AHB_IRQ_EN);
+	val &= ~PCIE_INTERRUPT_EN;
+	writel_relaxed(val, k1->link + K1_PHY_AHB_IRQ_EN);
+
+	writel_relaxed(0, k1->link + INTR_ENABLE);
+
+	/* Disable the link and hold the PHY in reset */
+	regmap_update_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
+			   APP_HOLD_PHY_RST | LTSSM_EN, APP_HOLD_PHY_RST);
+}
+
+static const struct dw_pcie_ops k1_pcie_ops = {
+	.link_up	= k1_pcie_link_up,
+	.start_link	= k1_pcie_start_link,
+	.stop_link	= k1_pcie_stop_link,
+};
+
+static int k1_pcie_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct k1_pcie *k1;
+	int ret;
+
+	k1 = devm_kzalloc(dev, sizeof(*k1), GFP_KERNEL);
+	if (!k1)
+		return -ENOMEM;
+
+	k1->pmu = syscon_regmap_lookup_by_phandle_args(dev_of_node(dev),
+						       SYSCON_APMU, 1,
+						       &k1->pmu_off);
+	if (IS_ERR(k1->pmu))
+		return dev_err_probe(dev, PTR_ERR(k1->pmu),
+				     "failed to lookup PMU registers\n");
+
+	k1->link = devm_platform_ioremap_resource_byname(pdev, "link");
+	if (!k1->link)
+		return dev_err_probe(dev, -ENOMEM,
+				     "failed to map \"link\" registers\n");
+
+	ret = devm_regulator_get_enable(dev, "vpcie3v3-supply");
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get \"vpcie3v3\" supply\n");
+
+	/* Hold the PHY in reset until we start the link */
+	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
+			APP_HOLD_PHY_RST);
+
+	k1->phy = devm_phy_get(dev, NULL);
+	if (IS_ERR(k1->phy))
+		return dev_err_probe(dev, PTR_ERR(k1->phy),
+				     "failed to get PHY\n");
+
+	k1->pci.dev = dev;
+	k1->pci.ops = &k1_pcie_ops;
+	dw_pcie_cap_set(&k1->pci, REQ_RES);
+
+	k1->pci.pp.ops = &k1_pcie_host_ops;
+	k1->pci.pp.num_vectors = MAX_MSI_IRQS;
+
+	platform_set_drvdata(pdev, k1);
+
+	ret = dw_pcie_host_init(&k1->pci.pp);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to initialize host\n");
+
+	return 0;
+}
+
+static void k1_pcie_remove(struct platform_device *pdev)
+{
+	struct k1_pcie *k1 = platform_get_drvdata(pdev);
+
+	dw_pcie_host_deinit(&k1->pci.pp);
+}
+
+static const struct of_device_id k1_pcie_of_match_table[] = {
+	{ .compatible = "spacemit,k1-pcie", },
+	{ },
+};
+
+static struct platform_driver k1_pcie_driver = {
+	.probe	= k1_pcie_probe,
+	.remove	= k1_pcie_remove,
+	.driver = {
+		.name			= "spacemit-k1-pcie",
+		.of_match_table		= k1_pcie_of_match_table,
+		.probe_type		= PROBE_PREFER_ASYNCHRONOUS,
+	},
+};
+module_platform_driver(k1_pcie_driver);
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
