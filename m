Return-Path: <SRS0=EtLq=FE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED7DEC64E90
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 23:49:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EE94207F7
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 23:49:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ibAlpzYp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="DCmXEkHZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EE94207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PElKL8P027VFIWRirNeV8slWCZMYRdF3YLyvP6wej9E=; b=ibAlpzYpMVIXoezGYyslnT+2d
	Rz+jrGtr8w4m4E0Z9ob9Ih85jntOGCtbWj3sITFGAiljzAlQXgHWkcdPtGg2ZVtikqOujyHnU6uBp
	C0QCy+pxPptMR2mLpt3Ehcgc9xV27yUQ0TmfhsnmwaTe1LhdAUgUWYxmR4CJS5duwSMuXqDjqxMqb
	XLyWk5p9ZHcSOe633IoE+8MeFKCpEEL5/BOJHOz62ob4vGHDTLrinSFEpU+gHVQy79ULApBb0lo+A
	DMzxRkd/fH89pPznwHdLMXNxrY/7BiSr9PngqeRNtKg0CxtuttVckzWo0sm5ostzYK+TYAOH0S6LK
	HxbFzBZuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjsux-0003TM-Nd; Mon, 30 Nov 2020 23:49:15 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjsuk-0003Kq-Pd
 for linux-riscv@lists.infradead.org; Mon, 30 Nov 2020 23:49:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606780143; x=1638316143;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E+b7c8urpicJDRQUpY/CZ+PfrVONj4BhVfmCYYgqZws=;
 b=DCmXEkHZkGm+w7i5lJwzus7kAlO19phJObDhi3f/VWl2wxuzZOVqXWfS
 3wlqi+QTXkOg6j4W8edUeYnDPmH7327qXqiU1SxRdtXaIUHrtGnQGbirL
 JvKl3qzzbxpHXEbF91DAw+/238kZmt7ntAvofBwxqyYnCY4IlwNv3wdNf
 Gens8skksown3fcOi2wkaDJrRt/O+EntFKu02d+mF3lOabcCtcl+Cg0mt
 /5nwYOHmzBohVb9a/UJGT273NY8PhAEaBqjBN3hnqOtaImf/RsHsaK/Nf
 Irs0MNr9G8a3XaBFsiUV4RGS3mbw9WSfIbDORFvdBwtSBkF5oi/UYsKdz w==;
IronPort-SDR: v2GHOE/jXYVS4vWgWLdoOIXRPn6U8udlBg4HoCUqUsdbQHibz4prsbkv4jp1oUzvhGWbfHNjBL
 HI46FktsEC0ScRAMSYFvjaeABX3ceu7x8KJHxFRZGKh+oDLstZ523QHB9N+a7bkyKWt2RTFYUe
 en6aOTlPoWD2gdD6Eaud9e5Mh/r9WxXQwC7pnmyASVwJEmZsOCRIYQs+zUMFmjc47mTUBf5h3e
 bZuvrW5TLMpO5bM8DhiETeasRQfJgCOOjbF9X3Tlc9N5xcUA0HvHDRAiHZEXv6hr7UQtSOCBWS
 d84=
X-IronPort-AV: E=Sophos;i="5.78,382,1599494400"; d="scan'208";a="155058333"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Dec 2020 07:49:02 +0800
IronPort-SDR: q9MmnAUCf2Fen4MK0s+jkl18JQN1yOjN6c2rHqjPauoC498Wr0/JAIOPv/V/zMo736U+F6aPRx
 2svJbsBr13cN8IVzJmw8/U7zaKc/3O37k=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 15:34:37 -0800
IronPort-SDR: wcVaWN6b94icwvxwh8UoFfp77ob2l+K82YjRNda35Ac3ZF2hSHhLXQokkgE1kJAwdQmVmMAmpE
 rGF0k4v87aJg==
WDCIronportException: Internal
Received: from phd004834.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.196])
 by uls-op-cesaip01.wdc.com with ESMTP; 30 Nov 2020 15:48:59 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v3 13/21] riscv: Add Canaan Kendryte K210 reset controller
Date: Tue,  1 Dec 2020 08:48:21 +0900
Message-Id: <20201130234829.118298-14-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201130234829.118298-1-damien.lemoal@wdc.com>
References: <20201130234829.118298-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_184903_051566_B4DE8E6A 
X-CRM114-Status: GOOD (  25.71  )
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
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add a reset controller driver for the Canaan Kendryte K210 SoC. This
driver relies on its syscon compatible parent node (sysctl) for its
register mapping. Automatically select this driver for compilation
when the SOC_CANAAN option is selected.

The MAINTAINERS file is updated to list myself as maintainer of this new
driver.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 MAINTAINERS                |   2 +
 arch/riscv/Kconfig.socs    |   3 +
 drivers/reset/Kconfig      |   9 +++
 drivers/reset/Makefile     |   1 +
 drivers/reset/reset-k210.c | 141 +++++++++++++++++++++++++++++++++++++
 5 files changed, 156 insertions(+)
 create mode 100644 drivers/reset/reset-k210.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 7836f471df71..64cf5a801360 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3831,8 +3831,10 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml
 F:	Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
 F:	Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml
+F:	Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml
 F:	drivers/clk/clk-k210.c
 F:	drivers/pinctrl/pinctrl-k210.c
+F:	drivers/reset/reset-k210.c
 F:	drivers/soc/canaan/
 F:	include/soc/canaan/
 
diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 68bdd664b5c2..b3cd253ec2c2 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -33,6 +33,9 @@ config SOC_CANAAN
 	select CLK_K210
 	select PINCTRL
 	select PINCTRL_K210
+	select ARCH_HAS_RESET_CONTROLLER
+	select RESET_CONTROLLER
+	select RESET_K210
 	help
 	  This enables support for Canaan Kendryte K210 SoC platform hardware.
 
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 07d162b179fc..529d206cfdfd 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -245,6 +245,15 @@ config RESET_ZYNQ
 	help
 	  This enables the reset controller driver for Xilinx Zynq SoCs.
 
+config RESET_K210
+	bool "Reset controller driver for Canaan Kendryte K210 SoC"
+	depends on RISCV && SOC_CANAAN
+	depends on OF && MFD_SYSCON
+	help
+	  Support for the Canaan Kendryte K210 RISC-V SoC reset controller.
+	  Say Y if you want to control reset signals provided by this
+	  controller.
+
 source "drivers/reset/sti/Kconfig"
 source "drivers/reset/hisilicon/Kconfig"
 source "drivers/reset/tegra/Kconfig"
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 16947610cc3b..1730a31e6871 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -33,4 +33,5 @@ obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
 obj-$(CONFIG_RESET_UNIPHIER_GLUE) += reset-uniphier-glue.o
 obj-$(CONFIG_RESET_ZYNQ) += reset-zynq.o
 obj-$(CONFIG_ARCH_ZYNQMP) += reset-zynqmp.o
+obj-$(CONFIG_RESET_K210) += reset-k210.o
 
diff --git a/drivers/reset/reset-k210.c b/drivers/reset/reset-k210.c
new file mode 100644
index 000000000000..2cf9a63c763d
--- /dev/null
+++ b/drivers/reset/reset-k210.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Western Digital Corporation or its affiliates.
+ */
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+#include <linux/delay.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
+#include <soc/canaan/k210-sysctl.h>
+
+#include <dt-bindings/reset/k210-rst.h>
+
+#define K210_RST_MASK	0x27FFFFFF
+
+struct k210_rst {
+	struct regmap *map;
+	struct reset_controller_dev rcdev;
+};
+
+static inline struct k210_rst *
+to_k210_rst(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct k210_rst, rcdev);
+}
+
+static inline int k210_rst_assert(struct reset_controller_dev *rcdev,
+				  unsigned long id)
+{
+	struct k210_rst *ksr = to_k210_rst(rcdev);
+	u32 bit = BIT(id);
+
+	if (!(bit & K210_RST_MASK))
+		return -EINVAL;
+
+	dev_dbg(rcdev->dev, "assert %lu\n", id);
+
+	regmap_update_bits(ksr->map, K210_SYSCTL_PERI_RESET, bit, 1);
+
+	return 0;
+}
+
+static inline int k210_rst_deassert(struct reset_controller_dev *rcdev,
+				    unsigned long id)
+{
+	struct k210_rst *ksr = to_k210_rst(rcdev);
+	u32 bit = BIT(id);
+
+	if (!(bit & K210_RST_MASK))
+		return -EINVAL;
+
+	dev_dbg(rcdev->dev, "deassert %lu\n", id);
+
+	regmap_update_bits(ksr->map, K210_SYSCTL_PERI_RESET, bit, 0);
+
+	return 0;
+}
+
+static int k210_rst_reset(struct reset_controller_dev *rcdev,
+			  unsigned long id)
+{
+	int ret;
+
+	dev_dbg(rcdev->dev, "reset %lu\n", id);
+
+	ret = k210_rst_assert(rcdev, id);
+	if (ret == 0) {
+		udelay(10);
+		ret = k210_rst_deassert(rcdev, id);
+	}
+
+	return ret;
+}
+
+static int k210_rst_status(struct reset_controller_dev *rcdev,
+			   unsigned long id)
+{
+	struct k210_rst *ksr = to_k210_rst(rcdev);
+	u32 reg, bit = BIT(id);
+	int ret;
+
+	if (!(bit & K210_RST_MASK))
+		return -EINVAL;
+
+	ret = regmap_read(ksr->map, K210_SYSCTL_PERI_RESET, &reg);
+	if (ret)
+		return ret;
+
+	return ret & bit;
+}
+
+static const struct reset_control_ops k210_rst_ops = {
+	.assert		= k210_rst_assert,
+	.deassert	= k210_rst_deassert,
+	.reset		= k210_rst_reset,
+	.status		= k210_rst_status,
+};
+
+static int __init k210_rst_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct k210_rst *ksr;
+
+	dev_info(dev, "K210 reset controller\n");
+
+	if (!dev->parent) {
+		dev_err(&pdev->dev, "No parent for K210 reset controller\n");
+		return -ENODEV;
+	}
+
+	ksr = devm_kzalloc(dev, sizeof(*ksr), GFP_KERNEL);
+	if (!ksr)
+		return -ENOMEM;
+
+	ksr->map = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(ksr->map))
+		return PTR_ERR(ksr->map);
+
+	ksr->rcdev.owner = THIS_MODULE;
+	ksr->rcdev.dev = dev;
+	ksr->rcdev.of_node = dev->of_node;
+	ksr->rcdev.nr_resets = fls(K210_RST_MASK);
+	ksr->rcdev.ops = &k210_rst_ops;
+
+	return devm_reset_controller_register(dev, &ksr->rcdev);
+}
+
+static const struct of_device_id k210_rst_dt_ids[] = {
+	{ .compatible = "canaan,k210-rst" },
+};
+
+static struct platform_driver k210_rst_driver = {
+	.probe	= k210_rst_probe,
+	.driver = {
+		.name		= "k210-rst",
+		.of_match_table	= k210_rst_dt_ids,
+	},
+};
+builtin_platform_driver(k210_rst_driver);
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
