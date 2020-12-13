Return-Path: <SRS0=J7tQ=FR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D82BC4361B
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 08:11:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10B0722D6F
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 08:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10B0722D6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8SjraXSPTnQTy6G7k/eHK71n0PGd8nri8V4OagJLgug=; b=B4fVPTHZkZpoV5pkOc4HT5tiH
	tIR8+0LytQpPINhL00fVY+D7lL9NMVjEagZk/4xyw7Eq2jSZD0oPYkAfqTpe/q3OkNAWkSvXQgBTk
	1hlRtZVMmpuzKnUBZSIFeeGWmhAE5aslDTpSL2uI56vQ9ClUXEfKDaDyu3NpRidxWBQuEz59R9WyD
	0acNfDembxjKq/M3MeHo/ZH7SBf6Bojnkt/ZYV7eXsxYr710J+9pm26CZ9pt6z4hhfSbbpxSQXyBw
	v3qB+G96lDWSjtz3aA8q5Py3/lG/YnmqS9YVj9ifN8pXzXs32U3mLRlQeCrZ+aqs1mgBnUG6dnN4B
	qp9zXx9ng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koMTB-0002ig-Mj; Sun, 13 Dec 2020 08:11:05 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koMSt-0002a8-T5
 for linux-riscv@lists.infradead.org; Sun, 13 Dec 2020 08:10:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607847048; x=1639383048;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fIaxjbAWWNgcvXbbu108kFj+8gDfBhmvtKF+sYbgjzk=;
 b=EI3/k452tWxGvRN/Fg8yiOws0RPRLv/FQKhC8k1PwPZ86a/YTZ7WkzkT
 13B2mYer9U6+wWuBE2M2/9m3FKUrLzGNVD4+5wHiJqbTR/5aSKOePrR8e
 7hcQ9tyEnPr+ypE5seahW8iQjLUAUK2a+BW0mt2zOuH/CgiIhvcMsrQMt
 ZyZHnElwGHzZl+V+k64j4RmWoz1QwlVWJsn2dJyQTAja6mgSOW0YhHNe3
 UVw4HtCLR+zxtQwwxFtNz6EB4acuw+R8ejnXZYUaEHF9nUdocKmakD+Mk
 5oqAMqZ8y6/NP7i0UoA8AGjOcKYCEqGJ1Wsk2xaOaET3P8oi+YoBvmYfl A==;
IronPort-SDR: +vf9/S/ZNMNvpAjRY5boVUbeLpB5ol3QVy7TGzlkSx4MldptuACyqaRjL2SAIcGDYB0d9jzlif
 Ll87mVbiJioVgUWr4yFHaqA9Ejo0pgQqiOnatk3iegCw61dK4w3etluUDioTdCDE0IMwfFMwei
 /teTabkw3FWAtXVSnzugnXyb3DZlk0/zB34JtZYqJaIJGz8YwgbnaBFbHC3pFu2zS3qe6os48+
 Lfq2hLjLFO5kJHdj5NAVW9wCXq6UjyybZQbb4KWVkzBSSQ/3PmWsy80aBeOVNsoDmMNjCsnVGc
 BVY=
X-IronPort-AV: E=Sophos;i="5.78,415,1599494400"; d="scan'208";a="156235159"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 16:10:47 +0800
IronPort-SDR: MMEY0Gd/TIXJA8yFDSHH2/1xfD+YAE/IKCx1OYiuXwKMrGsaF9aCPVZKiop7Pir4QtmJckQcOO
 ZRoMUgMJ275aShZuR26gjesuCnkjwnwTNVUkFekl1kkafLNgm0RY09w51WU3WF80WvKVq8xm5r
 CjdUU1AE9mEQXN4QTFW5pRO69eOLR+Vmn7kS+culCXmxx2qaUHqK8nD7cfAgPLhdkGy1n5mmXw
 MFiX8Vokj/BwRd0mOJX/1oSO7ac9XDpz5mUwMpEvkYnZWutElkAp5MVeWkqMv20P7wf03zjBNr
 a8zhQiPowWUU9V0UC84Np3tr
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2020 23:54:35 -0800
IronPort-SDR: e3e9QkyjnZJbviseQu/QNipAw15wWTxRLrXTnZL6iCuph6jt9GCSJzddm1NMnnlKlD2A6yJ0kf
 G6oN4q3i3JAFo0Y1zJdtoOARCsGuIBVuz8ZAM7+H3nMhR69DPGLqqS0CEg0falwyHhY0tGxxJG
 jvm1Fz+czdVWUV3y2CSC+zLrRm1sXCSNi1jJ9Js8Brq2R4Yd2SV4rToUuFqOUXCVxioY+UUe/c
 jgRF+k4b2md8IYu1KYcDwUZxx5wGsPm9jxyU5p9/yLknSvADfiXVIf2ZcRU/9+onOVFJPGKglb
 NMg=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.197])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Dec 2020 00:10:46 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v9 13/22] riscv: Add Canaan Kendryte K210 reset controller
Date: Sun, 13 Dec 2020 17:10:07 +0900
Message-Id: <20201213081016.179192-14-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213081016.179192-1-damien.lemoal@wdc.com>
References: <20201213081016.179192-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_031048_177802_48E1CCB3 
X-CRM114-Status: GOOD (  24.10  )
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
