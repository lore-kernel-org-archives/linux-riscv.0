Return-Path: <SRS0=xwCb=FG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA37C64E7C
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 03:25:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 481D0221E2
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 03:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 481D0221E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lE0zEb2yR8Q0zwxOsJAHyTNr7Lgp9uG63BhuPD//EkU=; b=uQ4qxoIysgVoiyz7SBqbwf6f3
	z9Ne8Gmi8TJmTXJK76wOQz/LZh3FlcA5OPjUKAk6I+XYjp4ixCC7MZqG/4ymRl58AI/EOYbXd5W37
	dkD7pimNCB6Iv4vomSZ2+SaKUMpxuIGC86g9hB7WAgAW0lgt5aWm93AZuRV7x3y8PP0G7hVJyvyHY
	FOwPUVl4isYiz7XmRQ07NVoqnW0ZslPtiVKNC8UV8yk9NAmljbkKMF5LcwcDpqZ68IJg5Xmy2BCNM
	WK5aCqWfWaztuW980BGHyvvxjvDnmivi+dfq3FwMuINKD/jzEWBc9ZBs1BdjO6I+yIqj8dUSxaHHz
	uD9fDSm3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkIm5-00010L-2T; Wed, 02 Dec 2020 03:25:49 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkIlu-0000n9-3A
 for linux-riscv@lists.infradead.org; Wed, 02 Dec 2020 03:25:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606879537; x=1638415537;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qUhgcXAEmstFvDDTZCs254hVW5tXrcrt1MkiwYeb6Sc=;
 b=XMGc6QhAPvxcR/SVc0cH0BcdXKWiViz0Hlb+fwi/ZZ8/RN5HZdjsTpxS
 OBPtt+M3LHyQ6V9kdn1O3qvttNBvgQElO34w+PKQrmMaA3XANwdvRbS1n
 khHxv8LbiUN2H3W1UVyoFGnZKmkHfDjeNNL7Dlk+l9h43ttYZqWat2ZgH
 W4LoeGI/OhRlsbG8dvO3SnhGU3v51/37Fh5RrLlaMHV/JnR+3ICjoOzrg
 EMT7LwUaW0iLxKfxTzdS3hfSChk2iepFkZcUgxUBwoN9Hw/wGJG/f5EhS
 OZu27ToF2jyx3JjfMI1/vzYHL141EXxsBKV0HDE7f+HxzBcwwBz06uKMQ Q==;
IronPort-SDR: trFf1k0CpEu7I14yaCnQc/X62Le/Jhsckda5XG+pRmiUESRGqwfKvK02869o3XoZ7yEirc8Tfk
 daJJje1KH0bKooBb9o06t5Op7ZJ/uN2KPxnt7vuk1hHm6ikEQgT+pn8rc19skp83q3NVYZsG1i
 Ujerb4Pn5GJK6fJNIheYHDShX9eNpFmVz6abh4i8NzUYMXnBWKQQ0ToFutfevaH0fJPTQs34y/
 6nFECMl7UqBRhQq6tmPn2ad4U3m0Bc9SNwwPY87cOaH5zyaVE6U2+93aF3RDagIToOPRjYvuWQ
 uoQ=
X-IronPort-AV: E=Sophos;i="5.78,385,1599494400"; d="scan'208";a="153922359"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 02 Dec 2020 11:25:31 +0800
IronPort-SDR: YpxFFn/aDdJpSm1KbRHXh1fnu6BJexphWMYWLUBGnWzZPqpq3Sm1Bf6QsJiQhCBralIgY3JKTP
 8hbNnYfSr4hsDfhSMBvCmcxeB9fsbXH2g=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 19:11:06 -0800
IronPort-SDR: gyr0Zvw0NdAGIsOh+cSeT8mVDmndtnYuHKACkkUn3CFAO2TpKoexk942VgpX/AMnNedmirp7Ds
 iLkPXg7s/MfQ==
WDCIronportException: Internal
Received: from phd004834.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.196])
 by uls-op-cesaip02.wdc.com with ESMTP; 01 Dec 2020 19:25:30 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v4 13/21] riscv: Add Canaan Kendryte K210 reset controller
Date: Wed,  2 Dec 2020 12:24:52 +0900
Message-Id: <20201202032500.206346-14-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201202032500.206346-1-damien.lemoal@wdc.com>
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_222538_306229_B2968F15 
X-CRM114-Status: GOOD (  23.17  )
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

The MAINTAINERS file is updated, adding the entry "CANAAN/KENDRYTE K210
SOC RESET CONTROLLER DRIVER" with myself listed as maintainer for this
driver.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 MAINTAINERS                |   8 +++
 arch/riscv/Kconfig.socs    |   3 +
 drivers/reset/Kconfig      |   9 +++
 drivers/reset/Makefile     |   1 +
 drivers/reset/reset-k210.c | 141 +++++++++++++++++++++++++++++++++++++
 5 files changed, 162 insertions(+)
 create mode 100644 drivers/reset/reset-k210.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a059ab02fa8a..c2b3d6e48cd5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3837,6 +3837,14 @@ L:	linux-gpio@vger.kernel.org (pinctrl driver)
 F:	Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml
 F:	drivers/pinctrl/pinctrl-k210.c
 
+CANAAN/KENDRYTE K210 SOC RESET CONTROLLER DRIVER
+M:	Damien Le Moal <damien.lemoal@wdc.com>
+L:	linux-kernel@vger.kernel.org
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml
+F:	drivers/reset/reset-k210.c
+
 CANAAN/KENDRYTE K210 SOC SYSTEM CONTROLLER DRIVER
 M:	Damien Le Moal <damien.lemoal@wdc.com>
 L:	linux-riscv@lists.infradead.org
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
