Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71555E82CB1
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 16:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9rjKPAciBvatWY20v3hDSC2UH3jEmqkgf7NU6JNwZiw=; b=dyUIhdUVDazsra
	hmmKZnXCFmicWkrH1cQU1C2kHv5CWNn/BxZZy02sXrAbE3ZiVcvjT5eGAyJdjPeRF6gs6YFewgWvD
	D4zT+XANPc+8BDx4A1B5TFUZhBKYh2Z1kTa5mrzhi8rkTyhzOYS/GL7kZopIPn5azXHRjT4LvzvW3
	JmWw9ouOuWtqEDjjnK2HhgrzzKNJVmRi5pHYghfil1YtIiuW+fSH8IcQ2XQWNwaEAlWJoUHQrf3pi
	eqXyEXiD20TEzEnHblLcmHC13FdMby91QAm3eRPitXStyoP2dSnRagUPKtdDQaprv6cb5/bvs9NbA
	z9pcOU0pwItNAboIsO6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlXo8-001Sjg-0f;
	Wed, 27 Sep 2023 16:54:40 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlXo0-001SgQ-39
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 16:54:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8567BB81875;
	Wed, 27 Sep 2023 16:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27B43C433CC;
	Wed, 27 Sep 2023 16:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695833670;
	bh=pfq+SQ5jW2o9nXakRgvSgmaqn3orOhnaopBx/4PGPjM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dI0YrIfy3jXCRX8+l+D2FjpPKNs3YV7+hSTiGlNtpGtV7CQS6bd586Pt3ZyMoUV7i
	 jICgsB1K+tZwYyfcHX3fcqS+EjQyqfKN56lB5rxmhPJY1u5C5yqAJzH2Y+Sh7GcCnA
	 Wsjh/mt9gs90sacL9QsJdnhEDORTDgAeSQlZkhrVAQHBgxfLa5jj1XVu8ZHqzgIdZB
	 zk0Ns+qhq+xNHB0bKRIrrb335lwvV5BvXwFSnl0oaVCz5cqX0mwtAQkzs+FzxjX+2m
	 gh/D3N+yoUM4HM2so+vq6e9HXDseLImFHeWW1gISm9LFOO+4RJWBhgwJur/o7zClzJ
	 ononDWm9zlqqw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 2/2] usb: dwc3: add T-HEAD TH1520 usb driver
Date: Thu, 28 Sep 2023 00:42:22 +0800
Message-Id: <20230927164222.3505-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230927164222.3505-1-jszhang@kernel.org>
References: <20230927164222.3505-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_095433_321736_A1B30E5A 
X-CRM114-Status: GOOD (  20.55  )
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

Adds TH1520 Glue layer to support USB controller on T-HEAD TH1520 SoC.
There is a DesignWare USB3 DRD core in TH1520 SoCs, the dwc3 core is
the child of this USB wrapper module device.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 MAINTAINERS                   |   1 +
 drivers/usb/dwc3/Kconfig      |   9 +++
 drivers/usb/dwc3/Makefile     |   1 +
 drivers/usb/dwc3/dwc3-thead.c | 119 ++++++++++++++++++++++++++++++++++
 4 files changed, 130 insertions(+)
 create mode 100644 drivers/usb/dwc3/dwc3-thead.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..d55e40060c46 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18481,6 +18481,7 @@ M:	Fu Wei <wefu@redhat.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
 F:	arch/riscv/boot/dts/thead/
+F:	drivers/usb/dwc3/dwc3-thead.c
 
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 98efcbb76c88..1b02f4f55b47 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -178,4 +178,13 @@ config USB_DWC3_OCTEON
 	  Only the host mode is currently supported.
 	  Say 'Y' or 'M' here if you have one such device.
 
+config USB_DWC3_THEAD
+	tristate "T-HEAD Platform"
+	depends on ARCH_THEAD || COMPILE_TEST
+	default USB_DWC3
+	help
+	  Support T-HEAD platform with DesignWare Core USB3 IP.
+	  Only the host mode is currently supported.
+	  Say 'Y' or 'M' here if you have one such device.
+
 endif
diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
index fe1493d4bbe5..9523a51dd279 100644
--- a/drivers/usb/dwc3/Makefile
+++ b/drivers/usb/dwc3/Makefile
@@ -55,3 +55,4 @@ obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom.o
 obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
 obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
 obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
+obj-$(CONFIG_USB_DWC3_THEAD)		+= dwc3-thead.o
diff --git a/drivers/usb/dwc3/dwc3-thead.c b/drivers/usb/dwc3/dwc3-thead.c
new file mode 100644
index 000000000000..999b1e319c72
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-thead.c
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * dwc3-thead.c - T-HEAD platform specific glue layer
+ *
+ * Inspired by dwc3-of-simple.c
+ *
+ * Copyright (C) 2021 Alibaba Group Holding Limited.
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "core.h"
+
+#define USB_SSP_EN		0x34
+#define  REF_SSP_EN		BIT(0)
+#define USB_SYS			0x3c
+#define  COMMONONN		BIT(0)
+
+#define USB3_DRD_SWRST		0x14
+#define  USB3_DRD_PRST		BIT(0)
+#define  USB3_DRD_PHYRST	BIT(1)
+#define  USB3_DRD_VCCRST	BIT(2)
+#define  USB3_DRD_RSTMASK	(USB3_DRD_PRST | USB3_DRD_PHYRST | USB3_DRD_VCCRST)
+
+struct dwc3_thead {
+	void __iomem		*base;
+	struct regmap		*misc_sysreg;
+	struct regulator	*vbus;
+};
+
+static void dwc3_thead_optimize_power(struct dwc3_thead *thead)
+{
+	u32 val;
+
+	/* config usb top within USB ctrl & PHY reset */
+	regmap_update_bits(thead->misc_sysreg, USB3_DRD_SWRST,
+			   USB3_DRD_RSTMASK, USB3_DRD_PRST);
+
+	/*
+	 * dwc reg also need to be configed to save power
+	 * 1. set USB_SYS[COMMONONN]
+	 * 2. set DWC3_GCTL[SOFITPSYNC](done by core.c)
+	 * 3. set GUSB3PIPECTL[SUSPENDEN] (done by core.c)
+	 */
+	val = readl(thead->base + USB_SYS);
+	val |= COMMONONN;
+	writel(val, thead->base + USB_SYS);
+	val = readl(thead->base + USB_SSP_EN);
+	val |= REF_SSP_EN;
+	writel(val, thead->base + USB_SSP_EN);
+
+	regmap_update_bits(thead->misc_sysreg, USB3_DRD_SWRST,
+			   USB3_DRD_RSTMASK, USB3_DRD_RSTMASK);
+}
+
+static int dwc3_thead_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct dwc3_thead *thead;
+	int ret;
+
+	thead = devm_kzalloc(&pdev->dev, sizeof(*thead), GFP_KERNEL);
+	if (!thead)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, thead);
+
+	ret = devm_regulator_get_enable_optional(dev, "vbus");
+	if (ret < 0 && ret != -ENODEV)
+		return ret;
+
+	thead->misc_sysreg = syscon_regmap_lookup_by_phandle(np, "thead,misc-sysreg");
+	if (IS_ERR(thead->misc_sysreg))
+		return PTR_ERR(thead->misc_sysreg);
+
+	thead->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(thead->base))
+		return PTR_ERR(thead->base);
+
+	dwc3_thead_optimize_power(thead);
+
+	return of_platform_populate(np, NULL, NULL, dev);
+}
+
+static void dwc3_thead_remove(struct platform_device *pdev)
+{
+	of_platform_depopulate(&pdev->dev);
+}
+
+static const struct of_device_id dwc3_thead_of_match[] = {
+	{ .compatible = "thead,th1520-usb" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, dwc3_thead_of_match);
+
+static struct platform_driver dwc3_thead_driver = {
+	.probe		= dwc3_thead_probe,
+	.remove_new	= dwc3_thead_remove,
+	.driver		= {
+		.name	= "dwc3-thead",
+		.of_match_table	= dwc3_thead_of_match,
+	},
+};
+module_platform_driver(dwc3_thead_driver);
+
+MODULE_ALIAS("platform:dwc3-thead");
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("DesignWare DWC3 T-HEAD Glue Driver");
+MODULE_AUTHOR("Jisheng Zhang <jszhang@kernel.org>");
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
