Return-Path: <SRS0=J7tQ=FR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25CA2C433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 13:51:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1786222B6
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 13:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1786222B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8SjraXSPTnQTy6G7k/eHK71n0PGd8nri8V4OagJLgug=; b=MsCG1HAXZDEgi+MIXzRYDKugd
	GBZXiLWNUXlLoAX/iQx5kkelGRC92EpxwSYwTP5POThpOuKnR8V78QeRlB3T2Vs/HCUM+m5DI1XPO
	2Lr7svWEmladDAYjRDpB+J9P1DBKG/Vo/xh1JlnpeDwh4Ff/Yzl8YYEIYDrWZ3m54GB+kpvUCIf+I
	Xd6uN8b1lnQ+KdsBkisRlTKt8k9/VLH3Xkv8irInDaFzWxgU2tqvNzOWftp6YjS3yYjrzFYk9RNsl
	MGwGZ/XcDou6KcNZ+fufUpU7walzuu5Zj2Ji/hesmhK4De8e81CF3nrSdSpg+arz6rmqXYrcac7J8
	a5OgtRRqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koRmj-0000Pu-MW; Sun, 13 Dec 2020 13:51:37 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koRmc-0000LN-Hf
 for linux-riscv@lists.infradead.org; Sun, 13 Dec 2020 13:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607867491; x=1639403491;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fIaxjbAWWNgcvXbbu108kFj+8gDfBhmvtKF+sYbgjzk=;
 b=quUoD7SA5lto/ZLtA41I+oYDQHpHiq+Hly6nbDmHj8ubtqGeFgiy3aGH
 kpz2PDe4onqGAdGTXi9YGwmksyzprUgcqlJ1luZBK3uvDzFLicTWpx+uv
 /v8ltepr/tjv0AwvHNAeNgVbblNX5Oh/HUEMs39CnymO2DYsemylqGfnM
 df0fy93CcKzAugSagkvm938DxN4D1BZC29eNn+3cB23bHwSEJBo2c7A3O
 VGtrueo2UCifiYYmv4fpjfCzC17ZWJqO1pugb0sWFIhHh7nULYUmf0eWd
 4XbhG0AufkISXzPwEOXeWe3BbWXkNXWVa2uOCPG6QoSc28u1Sa5CZxVK0 Q==;
IronPort-SDR: MyJFe9c4cIFTNj+UDrKwooqu/VgykZY/JluKo5avvC23WKyuaBUwUzt4jmXg1rP2kF4aSObmg1
 +tAsorZyYUkMKnVmYAHwPkaEBpZAQ8Fq/I7NqEPJjnKbVl+5yPX69OGpnrHJjFcCGSpxCLKzOI
 psTtcakzYaAbGg9v6aumHRsBymSoTitfae8Wv1eUj+1OlDJjT9PNRQQIz29UOupcbjarzXendl
 HvghHn9F15ke1xm5HdbWfBDOi9h6Z2y+3bNeg9PtRsIq8B7GvCs6jZJDUuNl0dVpw0iGWgB6R8
 c6E=
X-IronPort-AV: E=Sophos;i="5.78,416,1599494400"; d="scan'208";a="156242584"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 21:51:30 +0800
IronPort-SDR: iCWGfBj1h9J040fyuspe4sM7ogObeVs7cF9VSq7Zg6DKADKYUCzJOQl2XFTH5sTUmq/n2I/KeN
 aGIMBc0QIcSUiWHZlbcc6bPnLryDQruTb2U/lOAis0Zfs+Si2fStSZE6mc4cH3Wic6ZbDUyIKq
 7lQxkMh2GqRllOZrtPJCxko1i0JwgVeM3SxYDqWCMimurognfqtNA+d+upYj2BuUrKR5WqjQKa
 90P+D2Si1zLjF629KXvIdOgMLPPugHASLVS2VZO7h2nFMWjey/J9Mf0QbLFpEqosUo0APL09Re
 x8zIQ0meHCPNSx76up8UiIL9
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2020 05:35:14 -0800
IronPort-SDR: Fzo/7TG+uYZK09eO+BD+SNP7xj2PMO55j57SmMqU8xT6IhdpS+Yh6Fet92204h4JcunKDXOWY7
 8WwCQrEIRxkmvVLk8MpwAvfFoX817uQbEe7EWwWkWzYobWO1QWNmGSFu+qWVFZI9fekHQFh10K
 YfPSaWn5tE6A1rfNoH6q6StCfh7HpKIX4pIVZYSAiU4MAup17YsA+V8JDD1UMIFSxZ1xU2gnLm
 ArEyKRBMFXrVAqTOdy68YoO9HcY7QoogCxLUjBLn3a30I72rZcnVySxIqdohZuIsMSKSilgZ0X
 G3c=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.197])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Dec 2020 05:51:27 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v10 14/23] riscv: Add Canaan Kendryte K210 reset controller
Date: Sun, 13 Dec 2020 22:50:47 +0900
Message-Id: <20201213135056.24446-15-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213135056.24446-1-damien.lemoal@wdc.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_085130_739988_5AB23F5A 
X-CRM114-Status: GOOD (  24.18  )
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
register mapping. Default this driver compilation to y when the
SOC_CANAAN option is selected.

The MAINTAINERS file is updated, adding the entry "CANAAN/KENDRYTE K210
SOC RESET CONTROLLER DRIVER" with myself listed as maintainer for this
driver.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 MAINTAINERS                |   8 +++
 arch/riscv/Kconfig.socs    |   1 +
 drivers/reset/Kconfig      |  10 +++
 drivers/reset/Makefile     |   1 +
 drivers/reset/reset-k210.c | 131 +++++++++++++++++++++++++++++++++++++
 5 files changed, 151 insertions(+)
 create mode 100644 drivers/reset/reset-k210.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 85a6a0beebd1..6059a1e4caa6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3831,6 +3831,14 @@ W:	https://github.com/Cascoda/ca8210-linux.git
 F:	Documentation/devicetree/bindings/net/ieee802154/ca8210.txt
 F:	drivers/net/ieee802154/ca8210.c
 
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
index 88ac0d1a5da4..fdefd7eff1ae 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -29,6 +29,7 @@ config SOC_CANAAN
 	select SERIAL_SIFIVE if TTY
 	select SERIAL_SIFIVE_CONSOLE if TTY
 	select SIFIVE_PLIC
+	select ARCH_HAS_RESET_CONTROLLER
 	help
 	  This enables support for Canaan Kendryte K210 SoC platform hardware.
 
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 07d162b179fc..8bd4f1c34631 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -82,6 +82,16 @@ config RESET_INTEL_GW
 	  Say Y to control the reset signals provided by reset controller.
 	  Otherwise, say N.
 
+config RESET_K210
+	bool "Reset controller driver for Canaan Kendryte K210 SoC"
+	depends on (SOC_CANAAN || COMPILE_TEST) && OF
+	select MFD_SYSCON
+	default SOC_CANAAN
+	help
+	  Support for the Canaan Kendryte K210 RISC-V SoC reset controller.
+	  Say Y if you want to control reset signals provided by this
+	  controller.
+
 config RESET_LANTIQ
 	bool "Lantiq XWAY Reset Driver" if COMPILE_TEST
 	default SOC_TYPE_XWAY
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 16947610cc3b..ef2e807721fa 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_RESET_BRCMSTB_RESCAL) += reset-brcmstb-rescal.o
 obj-$(CONFIG_RESET_HSDK) += reset-hsdk.o
 obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
 obj-$(CONFIG_RESET_INTEL_GW) += reset-intel-gw.o
+obj-$(CONFIG_RESET_K210) += reset-k210.o
 obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
 obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
 obj-$(CONFIG_RESET_MESON) += reset-meson.o
diff --git a/drivers/reset/reset-k210.c b/drivers/reset/reset-k210.c
new file mode 100644
index 000000000000..1b6e03522b40
--- /dev/null
+++ b/drivers/reset/reset-k210.c
@@ -0,0 +1,131 @@
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
+
+	return regmap_update_bits(ksr->map, K210_SYSCTL_PERI_RESET, BIT(id), 1);
+}
+
+static inline int k210_rst_deassert(struct reset_controller_dev *rcdev,
+				    unsigned long id)
+{
+	struct k210_rst *ksr = to_k210_rst(rcdev);
+
+	return regmap_update_bits(ksr->map, K210_SYSCTL_PERI_RESET, BIT(id), 0);
+}
+
+static int k210_rst_reset(struct reset_controller_dev *rcdev,
+			  unsigned long id)
+{
+	int ret;
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
+	ret = regmap_read(ksr->map, K210_SYSCTL_PERI_RESET, &reg);
+	if (ret)
+		return ret;
+
+	return reg & bit;
+}
+
+static int k210_rst_xlate(struct reset_controller_dev *rcdev,
+			  const struct of_phandle_args *reset_spec)
+{
+	unsigned long id = reset_spec->args[0];
+
+	if (!(BIT(id) & K210_RST_MASK))
+		return -EINVAL;
+
+	return id;
+}
+
+static const struct reset_control_ops k210_rst_ops = {
+	.assert		= k210_rst_assert,
+	.deassert	= k210_rst_deassert,
+	.reset		= k210_rst_reset,
+	.status		= k210_rst_status,
+};
+
+static int k210_rst_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *parent_np = of_get_parent(dev->of_node);
+	struct k210_rst *ksr;
+
+	dev_info(dev, "K210 reset controller\n");
+
+	ksr = devm_kzalloc(dev, sizeof(*ksr), GFP_KERNEL);
+	if (!ksr)
+		return -ENOMEM;
+
+	ksr->map = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
+	if (IS_ERR(ksr->map))
+		return PTR_ERR(ksr->map);
+
+	ksr->rcdev.owner = THIS_MODULE;
+	ksr->rcdev.dev = dev;
+	ksr->rcdev.of_node = dev->of_node;
+	ksr->rcdev.ops = &k210_rst_ops;
+	ksr->rcdev.nr_resets = fls(K210_RST_MASK);
+	ksr->rcdev.of_reset_n_cells = 1;
+	ksr->rcdev.of_xlate = k210_rst_xlate;
+
+	return devm_reset_controller_register(dev, &ksr->rcdev);
+}
+
+static const struct of_device_id k210_rst_dt_ids[] = {
+	{ .compatible = "canaan,k210-rst" },
+	{ /* sentinel */ },
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
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
