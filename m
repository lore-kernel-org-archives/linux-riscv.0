Return-Path: <SRS0=FKry=J7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C91C433B4
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 11:01:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A682613B4
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 11:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A682613B4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZCoaHpHd/E1e0KhLC8GSv3qsQLe2nQ0wb8yM0Vh48fc=; b=K8vuXd0uGU86tYuZVOP91GYiB
	lMHaXsfFVorsPEQ0QetTm3QTWyYSdXXgcFdx7apBnaPoZ9EfIutRU7P5qoeBmXjBZb437tj4GGS+2
	r6ITqrXoPk3Flp1qxg3dfLmEJb2E3AShnxpkZ/t1sIwPF00slt9AXIpFt2LFOhgo8I4xZMIuc1w9m
	0G2kFFJLb7plF1VNo+hREyHno3MmLWLbVSC2omZtXfCMQBTYnVI86rtlIlMkPdwr9f2jMyM9AwpLL
	JivNWev4NS18EkdHWA8e1rodhhdtIULpKgYkG1PzF+z7kc47Pw9qfTws5yN1DnpY22KazcVcxYmpa
	q74KjX4JA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldsnE-00G24f-40; Tue, 04 May 2021 11:00:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldsn8-00G220-6V
 for linux-riscv@desiato.infradead.org; Tue, 04 May 2021 11:00:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:
 Reply-To:Cc:Content-Type:Content-ID:Content-Description;
 bh=PLgwNAdqB2Wo2xt9JMJ03ON74F/f1h2Lct5R3G/0NuU=; b=a//VK2NSnNCqp8hxHAZsJA39kE
 EOS8J6TuCjeXlJWVg4OVm27aC5zSyb7re0JxJvo/H+rVDzz9t751web9gZz/bjQQhK6siRZTPF4mb
 eT6HJqtcoW5nIPTtDF2hs6PqhtZZ/h5BGAvuB1W5Zp2evxbM7e/YrNQyKW/DONqMQ7CFJ+X7eMniI
 Tcy8w/GLAHNt4MgtAa0AeQF6Upu5dlrKc8SM1eGDA7zv2ExQkf6S0n5hF520WsE+3N1GUqEKZEUUu
 +dYDWzJyccfvoNqgOTStT3rqU6dEbRCND0LqIXPanPtKA11BfcPYWnSwkxka0fGxtQtq8SC42IYEm
 BT2HkH4w==;
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldsn4-003uu0-OZ
 for linux-riscv@lists.infradead.org; Tue, 04 May 2021 11:00:37 +0000
Received: by mail-pf1-x431.google.com with SMTP id v191so7014883pfc.8
 for <linux-riscv@lists.infradead.org>; Tue, 04 May 2021 04:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PLgwNAdqB2Wo2xt9JMJ03ON74F/f1h2Lct5R3G/0NuU=;
 b=ajd+kcGgNbU2jg5ku2ZwrMpmLgbKWYz8C7iOpffLT3E2ugMxfb6WqYeD4GLPnyxI3P
 lxTaeso4iL5oLcR8J6DFsCclGzy7iMZt/Xt0ARDDBgtb/wdhZsosJQs+XR0EcO9jAcVn
 9bB9LmPTSOjoMD/PlUxwjY+QgSVY0cxMdXwUM6JytwH33xgzKAbeFwgeeH/AFNAXz4s8
 fOg4qzorEo5CLxtEjeh7wUsK8JfbPZ2DcTLJ/BauDkhLv6E9Skw0dYhwUW+qzaHVpYlb
 NeP7EsNcMs45ySI7TaVnA/HdpeeOi+BdOqCP2Vu70Vagu0thUwWzlp0RmMKCC5cJomHB
 gFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PLgwNAdqB2Wo2xt9JMJ03ON74F/f1h2Lct5R3G/0NuU=;
 b=DG7YwxRmKKuSjB91YeJ7n9Dtfn6+ktzOXLqafNDfOHadeTdL6WS1JLCPK2LEGLGHCw
 +0kW/kCroahrqdJSZxf+pwaR98ILJeOwatCwT3VhSjZQEulW4AGDacbl3y2TypTFI5RL
 u4EppPQ4d/kph3xnljLytF4lIHJwsiGds+kOk0x4avHsvoM/uY9uohvUIppJtnLEp4je
 SwCLvPAJO+JXIjgHbCG5maV50wqfHyYWONSXBt1MWk/G2k231VG9Aebv4PdxRAjOLwz9
 AD4fl+B+StnIbh7/QB5Z2gqztnQNiWuB+YeM0oLWw0/XurryTfoik/J771icxdqVOSYk
 nAJg==
X-Gm-Message-State: AOAM531epU/6dhufcb0a49hhRAg2TdEqfW3E5QhpAtcX0d0l0yfTNpKh
 IC6jacYLsaqMioRtpislV8Haug==
X-Google-Smtp-Source: ABdhPJyVsfVk71BMN/FbBJl2dML/3driScwgrkxcCXNdpMVV1EKFriiSdfPrOBEFkH8FdO1cMVrFrg==
X-Received: by 2002:a63:9350:: with SMTP id w16mr20077964pgm.53.1620126033516; 
 Tue, 04 May 2021 04:00:33 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id k17sm11762529pfa.68.2021.05.04.04.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 04:00:33 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, paul.walmsley@sifive.com, hes@sifive.com,
 erik.danie@sifive.com, zong.li@sifive.com, bhelgaas@google.com,
 robh+dt@kernel.org, aou@eecs.berkeley.edu, mturquette@baylibre.com,
 sboyd@kernel.org, lorenzo.pieralisi@arm.com, p.zabel@pengutronix.de,
 alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com, jh80.chung@samsung.com,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, helgaas@kernel.org
Subject: [PATCH v6 5/6] PCI: fu740: Add SiFive FU740 PCIe host controller
 driver
Date: Tue,  4 May 2021 18:59:39 +0800
Message-Id: <20210504105940.100004-6-greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504105940.100004-1-greentime.hu@sifive.com>
References: <20210504105940.100004-1-greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_040034_832604_9457EDFE 
X-CRM114-Status: GOOD (  23.06  )
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

From: Paul Walmsley <paul.walmsley@sifive.com>

Add driver for the SiFive FU740 PCIe host controller.
This controller is based on the DesignWare PCIe core.

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Co-developed-by: Henry Styles <hes@sifive.com>
Signed-off-by: Henry Styles <hes@sifive.com>
Co-developed-by: Erik Danie <erik.danie@sifive.com>
Signed-off-by: Erik Danie <erik.danie@sifive.com>
Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 drivers/pci/controller/dwc/Kconfig      |  10 +
 drivers/pci/controller/dwc/Makefile     |   1 +
 drivers/pci/controller/dwc/pcie-fu740.c | 309 ++++++++++++++++++++++++
 3 files changed, 320 insertions(+)
 create mode 100644 drivers/pci/controller/dwc/pcie-fu740.c

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index 22c5529e9a65..255d43b1661b 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -318,4 +318,14 @@ config PCIE_AL
 	  required only for DT-based platforms. ACPI platforms with the
 	  Annapurna Labs PCIe controller don't need to enable this.
 
+config PCIE_FU740
+	bool "SiFive FU740 PCIe host controller"
+	depends on PCI_MSI_IRQ_DOMAIN
+	depends on SOC_SIFIVE || COMPILE_TEST
+	depends on GPIOLIB
+	select PCIE_DW_HOST
+	help
+	  Say Y here if you want PCIe controller support for the SiFive
+	  FU740.
+
 endmenu
diff --git a/drivers/pci/controller/dwc/Makefile b/drivers/pci/controller/dwc/Makefile
index a751553fa0db..625f6aaeb5b8 100644
--- a/drivers/pci/controller/dwc/Makefile
+++ b/drivers/pci/controller/dwc/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_PCIE_DW_EP) += pcie-designware-ep.o
 obj-$(CONFIG_PCIE_DW_PLAT) += pcie-designware-plat.o
 obj-$(CONFIG_PCI_DRA7XX) += pci-dra7xx.o
 obj-$(CONFIG_PCI_EXYNOS) += pci-exynos.o
+obj-$(CONFIG_PCIE_FU740) += pcie-fu740.o
 obj-$(CONFIG_PCI_IMX6) += pci-imx6.o
 obj-$(CONFIG_PCIE_SPEAR13XX) += pcie-spear13xx.o
 obj-$(CONFIG_PCI_KEYSTONE) += pci-keystone.o
diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
new file mode 100644
index 000000000000..00cde9a248b5
--- /dev/null
+++ b/drivers/pci/controller/dwc/pcie-fu740.c
@@ -0,0 +1,309 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * FU740 DesignWare PCIe Controller integration
+ * Copyright (C) 2019-2021 SiFive, Inc.
+ * Paul Walmsley
+ * Greentime Hu
+ *
+ * Based in part on the i.MX6 PCIe host controller shim which is:
+ *
+ * Copyright (C) 2013 Kosagi
+ *		https://www.kosagi.com
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/resource.h>
+#include <linux/types.h>
+#include <linux/interrupt.h>
+#include <linux/iopoll.h>
+#include <linux/reset.h>
+
+#include "pcie-designware.h"
+
+#define to_fu740_pcie(x)	dev_get_drvdata((x)->dev)
+
+struct fu740_pcie {
+	struct dw_pcie pci;
+	void __iomem *mgmt_base;
+	struct gpio_desc *reset;
+	struct gpio_desc *pwren;
+	struct clk *pcie_aux;
+	struct reset_control *rst;
+};
+
+#define SIFIVE_DEVICESRESETREG		0x28
+
+#define PCIEX8MGMT_PERST_N		0x0
+#define PCIEX8MGMT_APP_LTSSM_ENABLE	0x10
+#define PCIEX8MGMT_APP_HOLD_PHY_RST	0x18
+#define PCIEX8MGMT_DEVICE_TYPE		0x708
+#define PCIEX8MGMT_PHY0_CR_PARA_ADDR	0x860
+#define PCIEX8MGMT_PHY0_CR_PARA_RD_EN	0x870
+#define PCIEX8MGMT_PHY0_CR_PARA_RD_DATA	0x878
+#define PCIEX8MGMT_PHY0_CR_PARA_SEL	0x880
+#define PCIEX8MGMT_PHY0_CR_PARA_WR_DATA	0x888
+#define PCIEX8MGMT_PHY0_CR_PARA_WR_EN	0x890
+#define PCIEX8MGMT_PHY0_CR_PARA_ACK	0x898
+#define PCIEX8MGMT_PHY1_CR_PARA_ADDR	0x8a0
+#define PCIEX8MGMT_PHY1_CR_PARA_RD_EN	0x8b0
+#define PCIEX8MGMT_PHY1_CR_PARA_RD_DATA	0x8b8
+#define PCIEX8MGMT_PHY1_CR_PARA_SEL	0x8c0
+#define PCIEX8MGMT_PHY1_CR_PARA_WR_DATA	0x8c8
+#define PCIEX8MGMT_PHY1_CR_PARA_WR_EN	0x8d0
+#define PCIEX8MGMT_PHY1_CR_PARA_ACK	0x8d8
+
+#define PCIEX8MGMT_PHY_CDR_TRACK_EN	BIT(0)
+#define PCIEX8MGMT_PHY_LOS_THRSHLD	BIT(5)
+#define PCIEX8MGMT_PHY_TERM_EN		BIT(9)
+#define PCIEX8MGMT_PHY_TERM_ACDC	BIT(10)
+#define PCIEX8MGMT_PHY_EN		BIT(11)
+#define PCIEX8MGMT_PHY_INIT_VAL		(PCIEX8MGMT_PHY_CDR_TRACK_EN|\
+					 PCIEX8MGMT_PHY_LOS_THRSHLD|\
+					 PCIEX8MGMT_PHY_TERM_EN|\
+					 PCIEX8MGMT_PHY_TERM_ACDC|\
+					 PCIEX8MGMT_PHY_EN)
+
+#define PCIEX8MGMT_PHY_LANEN_DIG_ASIC_RX_OVRD_IN_3	0x1008
+#define PCIEX8MGMT_PHY_LANE_OFF		0x100
+#define PCIEX8MGMT_PHY_LANE0_BASE	(PCIEX8MGMT_PHY_LANEN_DIG_ASIC_RX_OVRD_IN_3 + 0x100 * 0)
+#define PCIEX8MGMT_PHY_LANE1_BASE	(PCIEX8MGMT_PHY_LANEN_DIG_ASIC_RX_OVRD_IN_3 + 0x100 * 1)
+#define PCIEX8MGMT_PHY_LANE2_BASE	(PCIEX8MGMT_PHY_LANEN_DIG_ASIC_RX_OVRD_IN_3 + 0x100 * 2)
+#define PCIEX8MGMT_PHY_LANE3_BASE	(PCIEX8MGMT_PHY_LANEN_DIG_ASIC_RX_OVRD_IN_3 + 0x100 * 3)
+
+static void fu740_pcie_assert_reset(struct fu740_pcie *afp)
+{
+	/* Assert PERST_N GPIO */
+	gpiod_set_value_cansleep(afp->reset, 0);
+	/* Assert controller PERST_N */
+	writel_relaxed(0x0, afp->mgmt_base + PCIEX8MGMT_PERST_N);
+}
+
+static void fu740_pcie_deassert_reset(struct fu740_pcie *afp)
+{
+	/* Deassert controller PERST_N */
+	writel_relaxed(0x1, afp->mgmt_base + PCIEX8MGMT_PERST_N);
+	/* Deassert PERST_N GPIO */
+	gpiod_set_value_cansleep(afp->reset, 1);
+}
+
+static void fu740_pcie_power_on(struct fu740_pcie *afp)
+{
+	gpiod_set_value_cansleep(afp->pwren, 1);
+	/*
+	 * Ensure that PERST has been asserted for at least 100 ms.
+	 * Section 2.2 of PCI Express Card Electromechanical Specification
+	 * Revision 3.0
+	 */
+	msleep(100);
+}
+
+static void fu740_pcie_drive_reset(struct fu740_pcie *afp)
+{
+	fu740_pcie_assert_reset(afp);
+	fu740_pcie_power_on(afp);
+	fu740_pcie_deassert_reset(afp);
+}
+
+static void fu740_phyregwrite(const uint8_t phy, const uint16_t addr,
+			      const uint16_t wrdata, struct fu740_pcie *afp)
+{
+	struct device *dev = afp->pci.dev;
+	void __iomem *phy_cr_para_addr;
+	void __iomem *phy_cr_para_wr_data;
+	void __iomem *phy_cr_para_wr_en;
+	void __iomem *phy_cr_para_ack;
+	int ret, val;
+
+	/* Setup */
+	if (phy) {
+		phy_cr_para_addr = afp->mgmt_base + PCIEX8MGMT_PHY1_CR_PARA_ADDR;
+		phy_cr_para_wr_data = afp->mgmt_base + PCIEX8MGMT_PHY1_CR_PARA_WR_DATA;
+		phy_cr_para_wr_en = afp->mgmt_base + PCIEX8MGMT_PHY1_CR_PARA_WR_EN;
+		phy_cr_para_ack = afp->mgmt_base + PCIEX8MGMT_PHY1_CR_PARA_ACK;
+	} else {
+		phy_cr_para_addr = afp->mgmt_base + PCIEX8MGMT_PHY0_CR_PARA_ADDR;
+		phy_cr_para_wr_data = afp->mgmt_base + PCIEX8MGMT_PHY0_CR_PARA_WR_DATA;
+		phy_cr_para_wr_en = afp->mgmt_base + PCIEX8MGMT_PHY0_CR_PARA_WR_EN;
+		phy_cr_para_ack = afp->mgmt_base + PCIEX8MGMT_PHY0_CR_PARA_ACK;
+	}
+
+	writel_relaxed(addr, phy_cr_para_addr);
+	writel_relaxed(wrdata, phy_cr_para_wr_data);
+	writel_relaxed(1, phy_cr_para_wr_en);
+
+	/* Wait for wait_idle */
+	ret = readl_poll_timeout(phy_cr_para_ack, val, val, 10, 5000);
+	if (ret)
+		dev_warn(dev, "Wait for wait_idle state failed!\n");
+
+	/* Clear */
+	writel_relaxed(0, phy_cr_para_wr_en);
+
+	/* Wait for ~wait_idle */
+	ret = readl_poll_timeout(phy_cr_para_ack, val, !val, 10, 5000);
+	if (ret)
+		dev_warn(dev, "Wait for !wait_idle state failed!\n");
+}
+
+static void fu740_pcie_init_phy(struct fu740_pcie *afp)
+{
+	/* Enable phy cr_para_sel interfaces */
+	writel_relaxed(0x1, afp->mgmt_base + PCIEX8MGMT_PHY0_CR_PARA_SEL);
+	writel_relaxed(0x1, afp->mgmt_base + PCIEX8MGMT_PHY1_CR_PARA_SEL);
+
+	/*
+	 * Wait 10 cr_para cycles to guarantee that the registers are ready
+	 * to be edited.
+	 */
+	ndelay(10);
+
+	/* Set PHY AC termination mode */
+	fu740_phyregwrite(0, PCIEX8MGMT_PHY_LANE0_BASE, PCIEX8MGMT_PHY_INIT_VAL, afp);
+	fu740_phyregwrite(0, PCIEX8MGMT_PHY_LANE1_BASE, PCIEX8MGMT_PHY_INIT_VAL, afp);
+	fu740_phyregwrite(0, PCIEX8MGMT_PHY_LANE2_BASE, PCIEX8MGMT_PHY_INIT_VAL, afp);
+	fu740_phyregwrite(0, PCIEX8MGMT_PHY_LANE3_BASE, PCIEX8MGMT_PHY_INIT_VAL, afp);
+	fu740_phyregwrite(1, PCIEX8MGMT_PHY_LANE0_BASE, PCIEX8MGMT_PHY_INIT_VAL, afp);
+	fu740_phyregwrite(1, PCIEX8MGMT_PHY_LANE1_BASE, PCIEX8MGMT_PHY_INIT_VAL, afp);
+	fu740_phyregwrite(1, PCIEX8MGMT_PHY_LANE2_BASE, PCIEX8MGMT_PHY_INIT_VAL, afp);
+	fu740_phyregwrite(1, PCIEX8MGMT_PHY_LANE3_BASE, PCIEX8MGMT_PHY_INIT_VAL, afp);
+}
+
+static int fu740_pcie_start_link(struct dw_pcie *pci)
+{
+	struct device *dev = pci->dev;
+	struct fu740_pcie *afp = dev_get_drvdata(dev);
+
+	/* Enable LTSSM */
+	writel_relaxed(0x1, afp->mgmt_base + PCIEX8MGMT_APP_LTSSM_ENABLE);
+	return 0;
+}
+
+static int fu740_pcie_host_init(struct pcie_port *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct fu740_pcie *afp = to_fu740_pcie(pci);
+	struct device *dev = pci->dev;
+	int ret;
+
+	/* Power on reset */
+	fu740_pcie_drive_reset(afp);
+
+	/* Enable pcieauxclk */
+	ret = clk_prepare_enable(afp->pcie_aux);
+	if (ret) {
+		dev_err(dev, "unable to enable pcie_aux clock\n");
+		return ret;
+	}
+
+	/*
+	 * Assert hold_phy_rst (hold the controller LTSSM in reset after
+	 * power_up_rst_n for register programming with cr_para)
+	 */
+	writel_relaxed(0x1, afp->mgmt_base + PCIEX8MGMT_APP_HOLD_PHY_RST);
+
+	/* Deassert power_up_rst_n */
+	ret = reset_control_deassert(afp->rst);
+	if (ret) {
+		dev_err(dev, "unable to deassert pcie_power_up_rst_n\n");
+		return ret;
+	}
+
+	fu740_pcie_init_phy(afp);
+
+	/* Disable pcieauxclk */
+	clk_disable_unprepare(afp->pcie_aux);
+	/* Clear hold_phy_rst */
+	writel_relaxed(0x0, afp->mgmt_base + PCIEX8MGMT_APP_HOLD_PHY_RST);
+	/* Enable pcieauxclk */
+	ret = clk_prepare_enable(afp->pcie_aux);
+	/* Set RC mode */
+	writel_relaxed(0x4, afp->mgmt_base + PCIEX8MGMT_DEVICE_TYPE);
+
+	return 0;
+}
+
+static const struct dw_pcie_host_ops fu740_pcie_host_ops = {
+	.host_init = fu740_pcie_host_init,
+};
+
+static const struct dw_pcie_ops dw_pcie_ops = {
+	.start_link = fu740_pcie_start_link,
+};
+
+static int fu740_pcie_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct dw_pcie *pci;
+	struct fu740_pcie *afp;
+
+	afp = devm_kzalloc(dev, sizeof(*afp), GFP_KERNEL);
+	if (!afp)
+		return -ENOMEM;
+	pci = &afp->pci;
+	pci->dev = dev;
+	pci->ops = &dw_pcie_ops;
+	pci->pp.ops = &fu740_pcie_host_ops;
+
+	/* SiFive specific region: mgmt */
+	afp->mgmt_base = devm_platform_ioremap_resource_byname(pdev, "mgmt");
+	if (IS_ERR(afp->mgmt_base))
+		return PTR_ERR(afp->mgmt_base);
+
+	/* Fetch GPIOs */
+	afp->reset = devm_gpiod_get_optional(dev, "reset-gpios", GPIOD_OUT_LOW);
+	if (IS_ERR(afp->reset))
+		return dev_err_probe(dev, PTR_ERR(afp->reset), "unable to get reset-gpios\n");
+
+	afp->pwren = devm_gpiod_get_optional(dev, "pwren-gpios", GPIOD_OUT_LOW);
+	if (IS_ERR(afp->pwren))
+		return dev_err_probe(dev, PTR_ERR(afp->pwren), "unable to get pwren-gpios\n");
+
+	/* Fetch clocks */
+	afp->pcie_aux = devm_clk_get(dev, "pcie_aux");
+	if (IS_ERR(afp->pcie_aux))
+		return dev_err_probe(dev, PTR_ERR(afp->pcie_aux),
+					     "pcie_aux clock source missing or invalid\n");
+
+	/* Fetch reset */
+	afp->rst = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(afp->rst))
+		return dev_err_probe(dev, PTR_ERR(afp->rst), "unable to get reset\n");
+
+	platform_set_drvdata(pdev, afp);
+
+	return dw_pcie_host_init(&pci->pp);
+}
+
+static void fu740_pcie_shutdown(struct platform_device *pdev)
+{
+	struct fu740_pcie *afp = platform_get_drvdata(pdev);
+
+	/* Bring down link, so bootloader gets clean state in case of reboot */
+	fu740_pcie_assert_reset(afp);
+}
+
+static const struct of_device_id fu740_pcie_of_match[] = {
+	{ .compatible = "sifive,fu740-pcie", },
+	{},
+};
+
+static struct platform_driver fu740_pcie_driver = {
+	.driver = {
+		   .name = "fu740-pcie",
+		   .of_match_table = fu740_pcie_of_match,
+		   .suppress_bind_attrs = true,
+	},
+	.probe = fu740_pcie_probe,
+	.shutdown = fu740_pcie_shutdown,
+};
+
+builtin_platform_driver(fu740_pcie_driver);
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
