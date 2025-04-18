Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A1DC369AB
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 13:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=22R5vH94EEeVwidOw+6QElDX97I0Ys0Bdy7IUKJCIDE=; b=ACXzcVgjhF5vV/
	aU6PNUcwIxAU15LIOvEy9YA75nWKoavzsCUbwLt46X4Mz5s8xgPLJKC4JOycT0511DDNPlpGGwQEq
	1pwBAypSh0sfFMvv9a8ojYZSOoC8F7JBccU6yidRFkril3ea6d1upRbVOqa7boYsnml1sQizhH6qu
	N6EWR2TFZzSE/DtNFXwHm0+T+MQm3kUl1yJSUA1MBkNCCJQ7wCmklTnTv2aMN1MpeiGNr0Yjuptir
	bdoChH1FeBRvuUpc16aZEiiR5tE8q8gZ4EH8MWnsLN+OSZB/Yq6Tj+Jp8VaHusK1qniUioxjcK92H
	To2D0EW7a909FrvP9peg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5lec-0000000GCfR-2Pwi;
	Fri, 18 Apr 2025 13:21:14 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5leZ-0000000GCbF-0lBX;
	Fri, 18 Apr 2025 13:21:12 +0000
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [27.18.99.221])
	by smtp.qiye.163.com (Hmail) with ESMTP id 125ec878c;
	Fri, 18 Apr 2025 21:21:03 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Date: Fri, 18 Apr 2025 21:19:53 +0800
Subject: [PATCH v2 4/4] phy: spacemit: add USB3 support for K1 PCIe/USB3
 combo PHY
MIME-Version: 1.0
Message-Id: <20250418-b4-k1-usb3-phy-v2-v2-4-b69e02da84eb@whut.edu.cn>
References: <20250418-b4-k1-usb3-phy-v2-v2-0-b69e02da84eb@whut.edu.cn>
In-Reply-To: <20250418-b4-k1-usb3-phy-v2-v2-0-b69e02da84eb@whut.edu.cn>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huangze@whut.edu.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744982442; l=8732;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=D3lMowTCmBQgmDedVETXxSZd+5kyo7+v+a+kj2y35rs=;
 b=N0Euq8c4iQgLpwAQsWdBVg5CWhy7oS2xb5D3pD8ckTe1BhDou2TIFpzsQh37qCyxkKBpAuypm
 ajiVb2h2MfSASYMiSmFB4dTW89/ShoxuEK0VZ8rt0t0gJQsFwdHuHL3
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaS0oeVh5MTkgaTxhPGUwaHlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVJSUpZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0tVSktLVUtZBg
	++
X-HM-Tid: 0a96490f56f903a1kunm125ec878c
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NDI6LQw5SzIDDgkCLwkQEUkT
	Lz0aCjNVSlVKTE9PQkNJT01DQk9JVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVJSUpZV1kIAVlBSktKSks3Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_062111_472292_0B014E69 
X-CRM114-Status: GOOD (  21.08  )
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

Add support for USB 3.0 mode on the K1 PCIe/USB3 combo PHY. Currently,
only USB mode is supported; PCIe support is not included in this change.

Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
 drivers/phy/spacemit/Kconfig          |   8 ++
 drivers/phy/spacemit/Makefile         |   1 +
 drivers/phy/spacemit/phy-k1-combphy.c | 251 ++++++++++++++++++++++++++++++++++
 3 files changed, 260 insertions(+)

diff --git a/drivers/phy/spacemit/Kconfig b/drivers/phy/spacemit/Kconfig
index 0136aee2e8a2f5f484da136b26f80130794b992c..ccc6bf9ea49f4988a27f79a4dcd024b18cbd78b0 100644
--- a/drivers/phy/spacemit/Kconfig
+++ b/drivers/phy/spacemit/Kconfig
@@ -11,3 +11,11 @@ config PHY_SPACEMIT_K1_USB2
 	help
 	  Enable this to support K1 USB 2.0 PHY driver. This driver takes care of
 	  enabling and clock setup and will be used by K1 udc/ehci/otg/xhci driver.
+
+config PHY_SPACEMIT_K1_COMBPHY
+	tristate "SpacemiT K1 PCIe/USB3 combo PHY support"
+	depends on (ARCH_SPACEMIT || COMPILE_TEST) && OF
+	depends on COMMON_CLK
+	select GENERIC_PHY
+	help
+	  USB3/PCIe Combo PHY Support for SpacemiT K1 SoC
diff --git a/drivers/phy/spacemit/Makefile b/drivers/phy/spacemit/Makefile
index fec0b425a948541b39b814caef0b05e1e002d92f..1fd0c65f2c5cd10ea2f70e43e62c70588d1ffae9 100644
--- a/drivers/phy/spacemit/Makefile
+++ b/drivers/phy/spacemit/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_PHY_SPACEMIT_K1_COMBPHY)	+= phy-k1-combphy.o
 obj-$(CONFIG_PHY_SPACEMIT_K1_USB2)		+= phy-k1-usb2.o
diff --git a/drivers/phy/spacemit/phy-k1-combphy.c b/drivers/phy/spacemit/phy-k1-combphy.c
new file mode 100644
index 0000000000000000000000000000000000000000..a291b7a78fae2f4072b74c1d2cc65847ed821bec
--- /dev/null
+++ b/drivers/phy/spacemit/phy-k1-combphy.c
@@ -0,0 +1,251 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SpacemiT K1 PCIE/USB3 PHY driver
+ *
+ * Copyright (C) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
+ * Copyright (C) 2025 Ze Huang <huangze@whut.edu.cn>
+ */
+
+#include <dt-bindings/phy/phy.h>
+#include <linux/clk.h>
+#include <linux/iopoll.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/usb/of.h>
+
+#define COMBPHY_USB_REG1		0x68
+#define  COMBPHY_USB_REG1_VAL		0x00
+#define COMBPHY_USB_REG2		0x48
+#define  COMBPHY_USB_REG2_VAL		0x603a2276
+#define COMBPHY_USB_REG3		0x08
+#define  COMBPHY_USB_REG3_VAL		0x97c
+#define COMBPHY_USB_REG4		0x18
+#define  COMBPHY_USB_REG4_VAL		0x00
+#define  COMBPHY_USB_TERM_SHORT_MASK	0x3000
+#define  COMBPHY_USB_TERM_SHORT_VAL	0x3000
+#define COMBPHY_USB_PLL_REG		0x08
+#define  COMBPHY_USB_PLL_MASK		0x01
+#define  COMBPHY_USB_PLL_VAL		0x01
+#define COMBPHY_USB_LFPS_REG		0x58
+#define  COMBPHY_USB_LFPS_MASK		0x700
+#define  COMBPHY_USB_LFPS_THRES_DEFAULT	0x03
+
+#define COMBPHY_MODE_SEL	BIT(3)
+#define COMBPHY_WAIT_TIMEOUT	1000
+
+struct spacemit_combphy_priv {
+	struct device *dev;
+	struct phy *phy;
+	struct reset_control *phy_rst;
+	void __iomem *phy_ctrl;
+	void __iomem *phy_sel;
+	bool rx_always_on;
+	u8 lfps_threshold;
+	u8 type;
+};
+
+static void spacemit_reg_update(void __iomem *reg, u32 offset, u32 mask, u32 val)
+{
+	u32 tmp;
+
+	tmp = readl(reg + offset);
+	tmp = (tmp & ~(mask)) | val;
+	writel(tmp, reg + offset);
+}
+
+static int spacemit_combphy_wait_ready(struct spacemit_combphy_priv *priv,
+				       u32 offset, u32 mask, u32 val)
+{
+	u32 reg_val;
+	int ret = 0;
+
+	ret = read_poll_timeout(readl, reg_val, (reg_val & mask) == val,
+				1000, COMBPHY_WAIT_TIMEOUT * 1000, false,
+				priv->phy_ctrl + offset);
+
+	return ret;
+}
+
+static int spacemit_combphy_set_mode(struct spacemit_combphy_priv *priv)
+{
+	int ret = 0;
+
+	switch (priv->type) {
+	case PHY_TYPE_USB3:
+		spacemit_reg_update(priv->phy_sel, 0, 0, COMBPHY_MODE_SEL);
+		break;
+	default:
+		dev_err(priv->dev, "PHY type %x not supported\n", priv->type);
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int spacemit_combphy_init_usb(struct spacemit_combphy_priv *priv)
+{
+	void __iomem *base = priv->phy_ctrl;
+	int ret;
+
+	writel(COMBPHY_USB_REG1_VAL, base + COMBPHY_USB_REG1);
+	writel(COMBPHY_USB_REG2_VAL, base + COMBPHY_USB_REG2);
+	writel(COMBPHY_USB_REG3_VAL, base + COMBPHY_USB_REG3);
+	writel(COMBPHY_USB_REG4_VAL, base + COMBPHY_USB_REG4);
+
+	ret = spacemit_combphy_wait_ready(priv, COMBPHY_USB_PLL_REG,
+					  COMBPHY_USB_PLL_MASK,
+					  COMBPHY_USB_PLL_VAL);
+
+	dev_dbg(priv->dev, "USB3 PHY init lfps threshold %d\n", priv->lfps_threshold);
+	spacemit_reg_update(base, COMBPHY_USB_LFPS_REG,
+			    COMBPHY_USB_LFPS_MASK,
+			    (priv->lfps_threshold << 8));
+
+	if (priv->rx_always_on)
+		spacemit_reg_update(base, COMBPHY_USB_REG4,
+				    COMBPHY_USB_TERM_SHORT_MASK,
+				    COMBPHY_USB_TERM_SHORT_VAL);
+
+	if (ret)
+		dev_err(priv->dev, "USB3 PHY init timeout!\n");
+
+	return ret;
+}
+
+static int spacemit_combphy_init(struct phy *phy)
+{
+	struct spacemit_combphy_priv *priv = phy_get_drvdata(phy);
+	int ret;
+
+	ret = spacemit_combphy_set_mode(priv);
+	if (ret) {
+		dev_err(priv->dev, "failed to set mode for PHY type %x\n",
+			priv->type);
+		goto out;
+	}
+
+	ret = reset_control_deassert(priv->phy_rst);
+	if (ret) {
+		dev_err(priv->dev, "failed to deassert rst\n");
+		goto err_rst;
+	}
+
+	switch (priv->type) {
+	case PHY_TYPE_USB3:
+		ret = spacemit_combphy_init_usb(priv);
+		break;
+	default:
+		dev_err(priv->dev, "PHY type %x not supported\n", priv->type);
+		ret = -EINVAL;
+		break;
+	}
+
+	if (ret)
+		goto err_rst;
+
+	return 0;
+
+err_rst:
+	reset_control_assert(priv->phy_rst);
+out:
+	return ret;
+}
+
+static int spacemit_combphy_exit(struct phy *phy)
+{
+	struct spacemit_combphy_priv *priv = phy_get_drvdata(phy);
+
+	reset_control_assert(priv->phy_rst);
+
+	return 0;
+}
+
+static struct phy *spacemit_combphy_xlate(struct device *dev,
+					  const struct of_phandle_args *args)
+{
+	struct spacemit_combphy_priv *priv = dev_get_drvdata(dev);
+
+	if (args->args_count != 1) {
+		dev_err(dev, "invalid number of arguments\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (priv->type != PHY_NONE && priv->type != args->args[0])
+		dev_warn(dev, "PHY type %d is selected to override %d\n",
+			 args->args[0], priv->type);
+
+	priv->type = args->args[0];
+
+	if (args->args_count > 1)
+		dev_dbg(dev, "combo phy idx: %d selected",  args->args[1]);
+
+	return priv->phy;
+}
+
+static const struct phy_ops spacemit_combphy_ops = {
+	.init = spacemit_combphy_init,
+	.exit = spacemit_combphy_exit,
+	.owner = THIS_MODULE,
+};
+
+static int spacemit_combphy_probe(struct platform_device *pdev)
+{
+	struct spacemit_combphy_priv *priv;
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->phy_ctrl = devm_platform_ioremap_resource_byname(pdev, "ctrl");
+	if (IS_ERR(priv->phy_ctrl))
+		return PTR_ERR(priv->phy_ctrl);
+
+	priv->phy_sel = devm_platform_ioremap_resource_byname(pdev, "sel");
+	if (IS_ERR(priv->phy_sel))
+		return PTR_ERR(priv->phy_sel);
+
+	priv->lfps_threshold = COMBPHY_USB_LFPS_THRES_DEFAULT;
+	device_property_read_u8(&pdev->dev, "spacemit,lfps-threshold", &priv->lfps_threshold);
+
+	priv->rx_always_on = device_property_read_bool(&pdev->dev, "spacemit,rx-always-on");
+	priv->type = PHY_NONE;
+	priv->dev = dev;
+
+	priv->phy_rst = devm_reset_control_get(dev, NULL);
+	if (IS_ERR(priv->phy_rst))
+		return dev_err_probe(dev, PTR_ERR(priv->phy_rst),
+				     "failed to get phy reset\n");
+
+	priv->phy = devm_phy_create(dev, NULL, &spacemit_combphy_ops);
+	if (IS_ERR(priv->phy))
+		return dev_err_probe(dev, PTR_ERR(priv->phy),
+				     "failed to create combphy\n");
+
+	dev_set_drvdata(dev, priv);
+	phy_set_drvdata(priv->phy, priv);
+	phy_provider = devm_of_phy_provider_register(dev, spacemit_combphy_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct of_device_id spacemit_combphy_of_match[] = {
+	{ .compatible = "spacemit,k1-combphy", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, spacemit_combphy_of_match);
+
+static struct platform_driver spacemit_combphy_driver = {
+	.probe	= spacemit_combphy_probe,
+	.driver = {
+		.name = "spacemit-k1-combphy",
+		.of_match_table = spacemit_combphy_of_match,
+	},
+};
+module_platform_driver(spacemit_combphy_driver);
+
+MODULE_DESCRIPTION("Spacemit PCIE/USB3.0 COMBO PHY driver");
+MODULE_LICENSE("GPL");

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
