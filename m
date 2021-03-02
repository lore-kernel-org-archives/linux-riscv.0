Return-Path: <SRS0=olfB=IB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9906C433DB
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Mar 2021 18:37:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4164364ED4
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Mar 2021 18:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4164364ED4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G9rUuUUO3RxoDbS9cf4iLpZyOqLHH91uN+A+C0fC7u0=; b=jFdMFyu1a1ZB2fRcbga++pm8F
	FnvVr/bMe4LkdRHxV2pB9gULmDNIMOXaGE819SBuMTOh7BSAA3dq9nzIo4zxv5prHzO/cjki+DHzS
	Sfoq1sDEEG+PKWEes2fzK29Hhi1CV4+mgFh9qYfGPt9G0mves9f5ZrOIf5TcH6Mo9WqAWhF2/a17q
	M2oOYcu9g3GvPt+fHZLD58G0RjsIi6oSi/yo6eNblmvz98FgjMz2g7a7a38dqTXDiZbeSo9Oc+hCv
	75p7/keNfo4QL+e2p/kB8UuubEU8aRZDdbIW/Jiz1J0dCr4A0BE569nOEd0ZoDOjG9ZPd8jqhUdxg
	QCL0VG3wg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHWMy-0062tO-K0; Wed, 03 Mar 2021 18:37:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT10-005HBT-Qk
 for linux-riscv@desiato.infradead.org; Wed, 03 Mar 2021 15:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description;
 bh=G721zZTwXfYMtU5FKmiux3Od7hwLZ+OelKtBGyhozqk=; b=H88qz9Ybo0yoKIHkD5UuhzhZVs
 JIZoel73dymobL2DxwAMxsVxFYcnlr4ZI7W4waX6oLehPYa8TuixxJbPlHWQBlffBgy/2Q3JBcMbk
 YO+wboZDmN8nJpGmyGqE+cIbf6ZR/kUVn1b0+2kyfXG92DhWWt0ndYZ6JdkYfyv8UXqO6M4rRCny5
 1KQAOFvEbamKkzFV5XGa7sJDLli9PvZtQvz0YkRtXP1ybxuCaFZxPB9xTwuPP75SMR3MULB29lq4S
 2BVJgWOkH3MWdpKt0nFaU7/hx5pQna2y3JX75u6YNw0vmfJvtnlhHWh2LGnTD7L0DjSKZP1cmoJY7
 CFVMh09A==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH2lm-00Gyin-U5
 for linux-riscv@lists.infradead.org; Tue, 02 Mar 2021 11:00:52 +0000
Received: by mail-pj1-x1034.google.com with SMTP id c19so1690935pjq.3
 for <linux-riscv@lists.infradead.org>; Tue, 02 Mar 2021 03:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=G721zZTwXfYMtU5FKmiux3Od7hwLZ+OelKtBGyhozqk=;
 b=grw+olZL2twC8Xldd7dQSXPQfG7nWEMJj8nv87WJS01VE/TWfVFNB7phJ0/1ixVMbS
 9mWP5IRsVDKjJ1Iqw5MD95sNUY5I6+QnbCKgpR9fWmGEljLcCfFUX6f5bsXGnlssvg4L
 6Fe0alWFn121cdEOGTZc9D+V5+G2hU0QEgTgriNZwd9IX8t8MT5LzaWi9babqLwpAApT
 kcPpfdWOrm86mFHWol40KOvqDvyzLApfPPMr9xexnyT7t6Rje5gyJPk6Y3KZHR94RjiB
 77nNi2j8NK5y2c5/QWRCA6IaV8B8lwFAUMZKcBtk4FTnKLGlzKmVhUbLR55pbloOTUQo
 eMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G721zZTwXfYMtU5FKmiux3Od7hwLZ+OelKtBGyhozqk=;
 b=fe6RjdqpiO5TRqxB58H1z2KYiZjHIV5/BAUkE/gmn9KnoYydbvjW4Ce5s1MfH4hA6o
 YeYcX8vFh3tCjHQQtX5Wx0gkXw71CjaUuDRxRQNf++rozxGnUu6I5SZK91pW23raNLq0
 AFykTMaIeOuFOw2YO5AG4iPdiF8qsgt5bZkrjpGEdljYVI3qJHTihIoQ7EChlgl1SfVE
 Ix47/dm6DIowwmtVJSNrfLjDuzd6Az3GXFXjrmHEfrjJpD8AEs2DpSGgRN19UgxjQ1VQ
 +sMLMLmPLfBAdk1p+h0TpEdzZ/yZt75tO6XCFGmDN5gyVVqguUHcQGZrGGDXSapItm4K
 fDXQ==
X-Gm-Message-State: AOAM532MwcXplrALRnjiAk1LDSt/dhOBvrXTbzU+RMJtJN5QbKdoGDOT
 91KbwnSQ/CwZauYn1N+wBAH8tg==
X-Google-Smtp-Source: ABdhPJzQis8oY/O/HsDLYmmbmxWLv7ai03+FTORunnD359++ALLJ2+RnWQAUsXuOc3FNu0HXCHI00A==
X-Received: by 2002:a17:902:b711:b029:e3:71f1:e08e with SMTP id
 d17-20020a170902b711b02900e371f1e08emr3262092pls.18.1614682787466; 
 Tue, 02 Mar 2021 02:59:47 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id t26sm19500451pfq.208.2021.03.02.02.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 02:59:47 -0800 (PST)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, paul.walmsley@sifive.com, hes@sifive.com,
 erik.danie@sifive.com, zong.li@sifive.com, bhelgaas@google.com,
 robh+dt@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, sboyd@kernel.org, lorenzo.pieralisi@arm.com,
 p.zabel@pengutronix.de, alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com, jh80.chung@samsung.com,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [RFC PATCH 5/6] PCI: designware: Add SiFive FU740 PCIe host
 controller driver
Date: Tue,  2 Mar 2021 18:59:16 +0800
Message-Id: <34c2c3985443b23a75ce89c605c4b833bbafd134.1614681831.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <cover.1614681831.git.greentime.hu@sifive.com>
References: <cover.1614681831.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_110052_444192_DC77A87E 
X-CRM114-Status: GOOD (  24.25  )
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

Co-developed-by: Henry Styles <hes@sifive.com>
Signed-off-by: Henry Styles <hes@sifive.com>
Co-developed-by: Erik Danie <erik.danie@sifive.com>
Signed-off-by: Erik Danie <erik.danie@sifive.com>
Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
---
 drivers/pci/controller/dwc/Kconfig      |   9 +
 drivers/pci/controller/dwc/Makefile     |   1 +
 drivers/pci/controller/dwc/pcie-fu740.c | 455 ++++++++++++++++++++++++
 3 files changed, 465 insertions(+)
 create mode 100644 drivers/pci/controller/dwc/pcie-fu740.c

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index 22c5529e9a65..0a37d21ed64e 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -318,4 +318,13 @@ config PCIE_AL
 	  required only for DT-based platforms. ACPI platforms with the
 	  Annapurna Labs PCIe controller don't need to enable this.
 
+config PCIE_FU740
+	bool "SiFive FU740 PCIe host controller"
+	depends on PCI_MSI_IRQ_DOMAIN
+	depends on SOC_SIFIVE || COMPILE_TEST
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
index 000000000000..6916eea40ea5
--- /dev/null
+++ b/drivers/pci/controller/dwc/pcie-fu740.c
@@ -0,0 +1,455 @@
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
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of_gpio.h>
+#include <linux/of_device.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/resource.h>
+#include <linux/signal.h>
+#include <linux/types.h>
+#include <linux/interrupt.h>
+#include <linux/reset.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+
+#include "pcie-designware.h"
+
+#define to_fu740_pcie(x)	dev_get_drvdata((x)->dev)
+
+struct fu740_pcie {
+	struct dw_pcie *pci;
+	void __iomem *mgmt_base;
+	int perstn_gpio;
+	int pwren_gpio;
+	struct clk *pcie_aux;
+	struct reset_control *rst;
+};
+
+#define SIFIVE_DEVICESRESETREG			0x28
+
+#define PCIEX8MGMT_PERST_N			0x0
+#define PCIEX8MGMT_APP_LTSSM_ENABLE		0x10
+#define PCIEX8MGMT_APP_HOLD_PHY_RST		0x18
+#define PCIEX8MGMT_DEVICE_TYPE			0x708
+#define PCIEX8MGMT_PHY0_CR_PARA_ADDR		0x860
+#define PCIEX8MGMT_PHY0_CR_PARA_RD_EN		0x870
+#define PCIEX8MGMT_PHY0_CR_PARA_RD_DATA		0x878
+#define PCIEX8MGMT_PHY0_CR_PARA_SEL		0x880
+#define PCIEX8MGMT_PHY0_CR_PARA_WR_DATA		0x888
+#define PCIEX8MGMT_PHY0_CR_PARA_WR_EN		0x890
+#define PCIEX8MGMT_PHY0_CR_PARA_ACK		0x898
+#define PCIEX8MGMT_PHY1_CR_PARA_ADDR		0x8a0
+#define PCIEX8MGMT_PHY1_CR_PARA_RD_EN		0x8b0
+#define PCIEX8MGMT_PHY1_CR_PARA_RD_DATA		0x8b8
+#define PCIEX8MGMT_PHY1_CR_PARA_SEL		0x8c0
+#define PCIEX8MGMT_PHY1_CR_PARA_WR_DATA		0x8c8
+#define PCIEX8MGMT_PHY1_CR_PARA_WR_EN		0x8d0
+#define PCIEX8MGMT_PHY1_CR_PARA_ACK		0x8d8
+
+/* PCIe Port Logic registers (memory-mapped) */
+#define PL_OFFSET				0x700
+#define PCIE_PL_GEN2_CTRL_OFF			(PL_OFFSET + 0x10c)
+#define PCIE_PL_DIRECTED_SPEED_CHANGE_OFF	0x20000
+
+#define PCIE_PHY_MAX_RETRY_CNT			1000
+
+static void fu740_pcie_assert_perstn(struct fu740_pcie *afp)
+{
+	/* PERST_N GPIO */
+	if (gpio_is_valid(afp->perstn_gpio))
+		gpio_direction_output(afp->perstn_gpio, 0);
+
+	/* Controller PERST_N */
+	__raw_writel(0x0, afp->mgmt_base + PCIEX8MGMT_PERST_N);
+}
+
+static void fu740_pcie_deassert_perstn(struct fu740_pcie *afp)
+{
+	/* Controller PERST_N */
+	__raw_writel(0x1, afp->mgmt_base + PCIEX8MGMT_PERST_N);
+	/* PERST_N GPIO */
+	if (gpio_is_valid(afp->perstn_gpio))
+		gpio_direction_output(afp->perstn_gpio, 1);
+}
+
+static void fu740_pcie_power_on(struct fu740_pcie *afp)
+{
+	if (gpio_is_valid(afp->pwren_gpio)) {
+		gpio_direction_output(afp->pwren_gpio, 1);
+		mdelay(100);
+	}
+}
+
+static void fu740_pcie_drive_perstn(struct fu740_pcie *afp)
+{
+	fu740_pcie_assert_perstn(afp);
+	fu740_pcie_power_on(afp);
+	fu740_pcie_deassert_perstn(afp);
+}
+
+static void fu740_phyregreadwrite(const uint8_t phy, const uint8_t write,
+				const uint16_t addr,
+				const uint16_t wrdata, uint16_t *rddata,
+				struct fu740_pcie *afp)
+{
+	unsigned char ack = 0;
+	unsigned int cnt = 0;
+	struct device *dev = afp->pci->dev;
+
+	/* setup */
+	__raw_writel(addr,
+		     afp->mgmt_base +
+		     (phy ? PCIEX8MGMT_PHY1_CR_PARA_ADDR :
+		      PCIEX8MGMT_PHY0_CR_PARA_ADDR));
+	if (write)
+		__raw_writel(wrdata,
+			     afp->mgmt_base +
+			     (phy ? PCIEX8MGMT_PHY1_CR_PARA_WR_DATA :
+			      PCIEX8MGMT_PHY0_CR_PARA_WR_DATA));
+	if (write)
+		__raw_writel(1,
+			     afp->mgmt_base +
+			     (phy ? PCIEX8MGMT_PHY1_CR_PARA_WR_EN :
+			      PCIEX8MGMT_PHY0_CR_PARA_WR_EN));
+	else
+		__raw_writel(1,
+			     afp->mgmt_base +
+			     (phy ? PCIEX8MGMT_PHY1_CR_PARA_RD_EN :
+			      PCIEX8MGMT_PHY0_CR_PARA_RD_EN));
+
+	/* wait for wait_idle */
+	do {
+		if (__raw_readl
+		    (afp->mgmt_base +
+		     (phy ? PCIEX8MGMT_PHY1_CR_PARA_ACK :
+		      PCIEX8MGMT_PHY0_CR_PARA_ACK))) {
+			ack = 1;
+			if (!write)
+				__raw_readl(afp->mgmt_base +
+					    (phy ?
+					     PCIEX8MGMT_PHY1_CR_PARA_RD_DATA :
+					     PCIEX8MGMT_PHY0_CR_PARA_RD_DATA));
+		}
+	} while (!ack);
+
+	/* clear */
+	if (write)
+		__raw_writel(0,
+			     afp->mgmt_base +
+			     (phy ? PCIEX8MGMT_PHY1_CR_PARA_WR_EN :
+			      PCIEX8MGMT_PHY0_CR_PARA_WR_EN));
+	else
+		__raw_writel(0,
+			     afp->mgmt_base +
+			     (phy ? PCIEX8MGMT_PHY1_CR_PARA_RD_EN :
+			      PCIEX8MGMT_PHY0_CR_PARA_RD_EN));
+
+	/* wait for ~wait_idle */
+	while (__raw_readl
+	       (afp->mgmt_base +
+		(phy ? PCIEX8MGMT_PHY1_CR_PARA_ACK :
+		 PCIEX8MGMT_PHY0_CR_PARA_ACK))) {
+		cpu_relax();
+		cnt++;
+		if (cnt > PCIE_PHY_MAX_RETRY_CNT) {
+			dev_err(dev, "PCIE phy doesn't enter idle state.\n");
+			break;
+		}
+	}
+}
+
+static void fu740_pcie_init_phy(struct fu740_pcie *afp)
+{
+	int lane;
+
+	/* enable phy cr_para_sel interfaces */
+	__raw_writel(0x1, afp->mgmt_base + PCIEX8MGMT_PHY0_CR_PARA_SEL);
+	__raw_writel(0x1, afp->mgmt_base + PCIEX8MGMT_PHY1_CR_PARA_SEL);
+
+	/* wait 10 cr_para cycles */
+	msleep(1);
+
+	/* set PHY AC termination mode */
+	for (lane = 0; lane < 4; lane++) {
+		fu740_phyregreadwrite(0, 1,
+				     0x1008 + (0x100 * lane),
+				     0x0e21, NULL, afp);
+		fu740_phyregreadwrite(1, 1,
+				     0x1008 + (0x100 * lane),
+				     0x0e21, NULL, afp);
+	}
+
+}
+
+static void fu740_pcie_ltssm_enable(struct device *dev)
+{
+	struct fu740_pcie *afp = dev_get_drvdata(dev);
+
+	/* Enable LTSSM */
+	__raw_writel(0x1, afp->mgmt_base + PCIEX8MGMT_APP_LTSSM_ENABLE);
+}
+
+static int fu740_pcie_start_link(struct dw_pcie *pci)
+{
+	struct device *dev = pci->dev;
+	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u32 tmp;
+	int ret;
+
+	/*
+	 * Force Gen1 operation when starting the link.  In case the link is
+	 * started in Gen2 mode, there is a possibility the devices on the
+	 * bus will not be detected at all.  This happens with PCIe switches.
+	 */
+	dw_pcie_dbi_ro_wr_en(pci);
+	tmp = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
+	tmp &= ~PCI_EXP_LNKCAP_SLS;
+	tmp |= PCI_EXP_LNKCAP_SLS_2_5GB;
+	dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, tmp);
+	dw_pcie_dbi_ro_wr_dis(pci);
+
+	/* Start LTSSM. */
+	fu740_pcie_ltssm_enable(dev);
+
+	ret = dw_pcie_wait_for_link(pci);
+	if (ret)
+		goto err_reset_phy;
+
+	/* Now set it to operate in Gen3 */
+	dw_pcie_dbi_ro_wr_en(pci);
+	tmp = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
+	tmp &= ~PCI_EXP_LNKCAP_SLS;
+	tmp |= PCI_EXP_LNKCAP_SLS_8_0GB;
+	dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, tmp);
+	/* Enable DIRECTED SPEED CHANGE bit of GEN2_CTRL_OFF register */
+	tmp = dw_pcie_readl_dbi(pci, PCIE_PL_GEN2_CTRL_OFF);
+	tmp |= PCIE_PL_DIRECTED_SPEED_CHANGE_OFF;
+	dw_pcie_writel_dbi(pci, PCIE_PL_GEN2_CTRL_OFF, tmp);
+	dw_pcie_dbi_ro_wr_dis(pci);
+
+	ret = dw_pcie_wait_for_link(pci);
+	if (ret)
+		goto err_reset_phy;
+
+	/*
+	 * Reenable DIRECTED SPEED CHANGE.
+	 *
+	 * You need to set this bit after each speed change, but after
+	 * reaching G1, setting it once doesn't seem to work (it reaches G3
+	 * equalization states and then times out, falls back to G1). But
+	 * If after that, you set it again, it then reaches G3 perfectly
+	 * fine.
+	 */
+	dw_pcie_dbi_ro_wr_en(pci);
+	tmp = dw_pcie_readl_dbi(pci, PCIE_PL_GEN2_CTRL_OFF);
+	tmp |= PCIE_PL_DIRECTED_SPEED_CHANGE_OFF;
+	dw_pcie_writel_dbi(pci, PCIE_PL_GEN2_CTRL_OFF, tmp);
+	dw_pcie_dbi_ro_wr_dis(pci);
+
+	ret = dw_pcie_wait_for_link(pci);
+	if (ret)
+		goto err_reset_phy;
+
+	tmp = dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKSTA);
+	dev_info(dev, "Link up, Gen%i\n", tmp & PCI_EXP_LNKSTA_CLS);
+	return 0;
+
+ err_reset_phy:
+	dev_err(dev, "Failed to bring link up!\n"
+		"PHY DEBUG_R0=0x%08x DEBUG_R1=0x%08x\n",
+		dw_pcie_readl_dbi(pci, PCIE_PORT_DEBUG0),
+		dw_pcie_readl_dbi(pci, PCIE_PORT_DEBUG1));
+	return ret;
+}
+
+static int fu740_pcie_host_init(struct pcie_port *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct fu740_pcie *afp = to_fu740_pcie(pci);
+	struct device *dev = pci->dev;
+	int ret = 0;
+
+	/* power on reset */
+	fu740_pcie_drive_perstn(afp);
+
+	/* enable pcieauxclk */
+	ret = clk_prepare_enable(afp->pcie_aux);
+	if (ret)
+		dev_err(dev, "unable to enable pcie_aux clock\n");
+
+	/*
+	 * assert hold_phy_rst (hold the controller LTSSM in reset after
+	 * power_up_rst_n
+	 * for register programming with cr_para)
+	 */
+	__raw_writel(0x1, afp->mgmt_base + PCIEX8MGMT_APP_HOLD_PHY_RST);
+
+	/* deassert power_up_rst_n */
+	ret = reset_control_deassert(afp->rst);
+	if (ret)
+		dev_err(dev, "unable to deassert pcie_power_up_rst_n\n");
+
+	fu740_pcie_init_phy(afp);
+
+	/* disable pcieauxclk */
+	clk_disable_unprepare(afp->pcie_aux);
+	/* clear hold_phy_rst */
+	__raw_writel(0x0, afp->mgmt_base + PCIEX8MGMT_APP_HOLD_PHY_RST);
+	/* enable pcieauxclk */
+	ret = clk_prepare_enable(afp->pcie_aux);
+	/* set RC mode */
+	__raw_writel(0x4, afp->mgmt_base + PCIEX8MGMT_DEVICE_TYPE);
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
+static const struct dev_pm_ops fu740_pcie_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(fu740_pcie_suspend_noirq,
+				      fu740_pcie_resume_noirq)
+};
+
+static int fu740_pcie_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct dw_pcie *pci;
+	struct fu740_pcie *afp;
+	struct resource *mgmt_res;
+	struct device_node *node = dev->of_node;
+	int ret;
+	u16 val;
+
+	afp = devm_kzalloc(dev, sizeof(*afp), GFP_KERNEL);
+	if (!afp)
+		return -ENOMEM;
+
+	pci = devm_kzalloc(dev, sizeof(*pci), GFP_KERNEL);
+	if (!pci)
+		return -ENOMEM;
+
+	pci->dev = dev;
+	pci->ops = &dw_pcie_ops;
+	pci->pp.ops = &fu740_pcie_host_ops;
+
+	afp->pci = pci;
+
+	mgmt_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mgmt");
+	if (!mgmt_res) {
+		dev_warn(dev, "missing required mgmt address range");
+		return -ENOENT;
+	}
+	afp->mgmt_base = devm_ioremap_resource(dev, mgmt_res);
+	if (IS_ERR(afp->mgmt_base))
+		return PTR_ERR(afp->mgmt_base);
+
+	/* Fetch GPIOs */
+	afp->perstn_gpio = of_get_named_gpio(node, "perstn-gpios", 0);
+	if (gpio_is_valid(afp->perstn_gpio)) {
+		ret = devm_gpio_request_one(dev, afp->perstn_gpio,
+					    GPIOF_OUT_INIT_LOW, "perstn-gpios");
+		if (ret) {
+			dev_err(dev, "unable to get perstn gpio\n");
+			return ret;
+		}
+	} else if (afp->perstn_gpio == -EPROBE_DEFER) {
+		dev_err(dev, "perst-gpios EPROBE_DEFER\n");
+		return afp->perstn_gpio;
+	}
+
+	afp->pwren_gpio = of_get_named_gpio(node, "pwren-gpios", 0);
+	if (gpio_is_valid(afp->pwren_gpio)) {
+		ret = devm_gpio_request_one(dev, afp->pwren_gpio,
+					    GPIOF_OUT_INIT_LOW, "pwren-gpios");
+		if (ret) {
+			dev_err(dev, "unable to get pwren gpio\n");
+			return ret;
+		}
+	} else if (afp->pwren_gpio == -EPROBE_DEFER) {
+		dev_err(dev, "pwren-gpios EPROBE_DEFER\n");
+		return afp->pwren_gpio;
+	}
+
+	/* Fetch clocks */
+	afp->pcie_aux = devm_clk_get(dev, "pcie_aux");
+	if (IS_ERR(afp->pcie_aux))
+		return dev_err_probe(dev, PTR_ERR(afp->pcie_aux),
+					     "pcie_aux clock source missing or invalid\n");
+
+	/* Fetch reset */
+	afp->rst = devm_reset_control_get(dev, NULL);
+	if (IS_ERR(afp->rst))
+		return dev_err_probe(dev, PTR_ERR(afp->rst), "unable to get reset\n");
+
+	platform_set_drvdata(pdev, afp);
+
+	ret = dw_pcie_host_init(&pci->pp);
+	if (ret < 0)
+		return ret;
+
+	if (pci_msi_enabled()) {
+		u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_MSI);
+
+		val = dw_pcie_readw_dbi(pci, offset + PCI_MSI_FLAGS);
+		val |= PCI_MSI_FLAGS_ENABLE;
+		dw_pcie_writew_dbi(pci, offset + PCI_MSI_FLAGS, val);
+	}
+
+	return 0;
+}
+
+static void fu740_pcie_shutdown(struct platform_device *pdev)
+{
+	struct fu740_pcie *afp = platform_get_drvdata(pdev);
+
+	/* bring down link, so bootloader gets clean state in case of reboot */
+	fu740_pcie_assert_perstn(afp);
+}
+
+static const struct of_device_id fu740_pcie_of_match[] = {
+	{.compatible = "sifive,fu740-pcie"},
+	{},
+};
+
+static struct platform_driver fu740_pcie_driver = {
+	.driver = {
+		   .name = "fu740-pcie",
+		   .of_match_table = fu740_pcie_of_match,
+		   .suppress_bind_attrs = true,
+		   .pm = &fu740_pcie_pm_ops,
+		   },
+	.probe = fu740_pcie_probe,
+	.shutdown = fu740_pcie_shutdown,
+};
+
+static int __init fu740_pcie_init(void)
+{
+	return platform_driver_register(&fu740_pcie_driver);
+}
+
+device_initcall(fu740_pcie_init);
-- 
2.30.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
