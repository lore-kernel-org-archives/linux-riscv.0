Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3295EE49AA
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Aug 2023 12:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SumH5mXH91ZFpiTRb+B5e2Gi4Qh/dw6y2WWNoE3B3ZM=; b=orKxZl8pP6n8Ti
	Z/pn5IBT/iAQRUkjmINv3ghla6ogDhHVIM0xszXhn82g57h1n5EenjTsKJCINtic9USrPyVrRs+9j
	zeDO4rUJiy1ntKp8PtpqLL5qDrZYogULxWCV8IMB/2j5sFi7o1+yM69HYYoeKgNW9hoKpYE43Fru1
	FfXOaR6bzWnms36tkhigOHksKKF3tDkDFLdq+FXw/0ozjCV/kLbO88KdASjxTxZrkA1lcAGyJxvUJ
	sf9QHLKEiz35loa5Z6ZMqvqFS+jxTE3MK+1js37vrDG6nXjhfTEUaK5sL2abPo7xF1zjev05yyTCn
	v+x+VBlPDiqo2tduHaiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXhKC-00Bsef-17;
	Sun, 20 Aug 2023 12:14:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXhJx-00Bsa1-0a;
	Sun, 20 Aug 2023 12:14:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B3C2160A6D;
	Sun, 20 Aug 2023 12:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4441DC433C9;
	Sun, 20 Aug 2023 12:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692533656;
	bh=Den5dFS0MXDAQfMUN5eWruNGI0pHi2wHRF4CX/oFhPU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WAWeleQQXgSnGBz+bKec0yrb1T+7jeNMDNsHql0UcfYmV0J77tSPOorMEJwMpeu6C
	 AWHfiUp2W0gq60d3KViN4Iqg14fabrwtSp1W5XtuvHI8Ididi4UkRHvydQXFMSX82o
	 pCN7l+cGuosKiNXqjyiX29D6KEVXvNGvtLpY6ck5hHGA4z2Cq44Zv1ysG3jVbhL9/M
	 TLGWRRXeGMtv71YF2JoecVmuEOFK4JqYUNyK63ePNUOmsnDzUAd8nuFz1iOqbjexeP
	 01SGbXzbBTsZCp6MjeSZh6DwG82+UZOTNHWPUmkNJx6Cu6NsEQ+zvLMTpzZaDs8agH
	 7ifgar5a/FxKw==
From: Jisheng Zhang <jszhang@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net-next 3/3] net: stmmac: add glue layer for T-HEAD TH1520 SoC
Date: Sun, 20 Aug 2023 20:02:13 +0800
Message-Id: <20230820120213.2054-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230820120213.2054-1-jszhang@kernel.org>
References: <20230820120213.2054-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230820_051417_310010_B4CDAD8E 
X-CRM114-Status: GOOD (  23.12  )
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

Add dwmac glue driver to support the dwmac on the T-HEAD TH1520 SoC.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac-thead.c | 304 ++++++++++++++++++
 3 files changed, 316 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 06c6871f8788..1bf71804c270 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -216,6 +216,17 @@ config DWMAC_SUN8I
 	  stmmac device driver. This driver is used for H3/A83T/A64
 	  EMAC ethernet controller.
 
+config DWMAC_THEAD
+	tristate "T-HEAD dwmac support"
+	depends on OF && (ARCH_THEAD || COMPILE_TEST)
+	select MFD_SYSCON
+	help
+	  Support for ethernet controllers on T-HEAD RISC-V SoCs
+
+	  This selects the T-HEAD platform specific glue layer support for
+	  the stmmac device driver. This driver is used for T-HEAD TH1520
+	  ethernet controller.
+
 config DWMAC_IMX8
 	tristate "NXP IMX8 DWMAC support"
 	default ARCH_MXC
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index 5b57aee19267..d73171ed6ad7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_DWMAC_STI)		+= dwmac-sti.o
 obj-$(CONFIG_DWMAC_STM32)	+= dwmac-stm32.o
 obj-$(CONFIG_DWMAC_SUNXI)	+= dwmac-sunxi.o
 obj-$(CONFIG_DWMAC_SUN8I)	+= dwmac-sun8i.o
+obj-$(CONFIG_DWMAC_THEAD)	+= dwmac-thead.o
 obj-$(CONFIG_DWMAC_DWC_QOS_ETH)	+= dwmac-dwc-qos-eth.o
 obj-$(CONFIG_DWMAC_INTEL_PLAT)	+= dwmac-intel-plat.o
 obj-$(CONFIG_DWMAC_GENERIC)	+= dwmac-generic.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
new file mode 100644
index 000000000000..1a5a174b88ff
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
@@ -0,0 +1,304 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * T-HEAD DWMAC platform driver
+ *
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ * Copyright (C) 2021 Alibaba Group Holding Limited.
+ *
+ */
+
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_net.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "stmmac_platform.h"
+
+#define GMAC_CLK_EN			0x00
+#define  GMAC_TX_CLK_EN			BIT(1)
+#define  GMAC_TX_CLK_N_EN		BIT(2)
+#define  GMAC_TX_CLK_OUT_EN		BIT(3)
+#define  GMAC_RX_CLK_EN			BIT(4)
+#define  GMAC_RX_CLK_N_EN		BIT(5)
+#define  GMAC_EPHY_REF_CLK_EN		BIT(6)
+#define GMAC_RXCLK_DELAY_CTRL		0x04
+#define  GMAC_RXCLK_BYPASS		BIT(15)
+#define  GMAC_RXCLK_INVERT		BIT(14)
+#define  GMAC_RXCLK_DELAY_MASK		GENMASK(4, 0)
+#define  GMAC_RXCLK_DELAY_VAL(x)	FIELD_PREP(GMAC_RXCLK_DELAY_MASK, (x))
+#define GMAC_TXCLK_DELAY_CTRL		0x08
+#define  GMAC_TXCLK_BYPASS		BIT(15)
+#define  GMAC_TXCLK_INVERT		BIT(14)
+#define  GMAC_TXCLK_DELAY_MASK		GENMASK(4, 0)
+#define  GMAC_TXCLK_DELAY_VAL(x)	FIELD_PREP(GMAC_RXCLK_DELAY_MASK, (x))
+#define GMAC_PLLCLK_DIV			0x0c
+#define  GMAC_PLLCLK_DIV_EN		BIT(31)
+#define  GMAC_PLLCLK_DIV_MASK		GENMASK(7, 0)
+#define  GMAC_PLLCLK_DIV_NUM(x)		FIELD_PREP(GMAC_PLLCLK_DIV_MASK, (x))
+#define GMAC_GTXCLK_SEL			0x18
+#define  GMAC_GTXCLK_SEL_PLL		BIT(0)
+#define GMAC_INTF_CTRL			0x1c
+#define  PHY_INTF_MASK			BIT(0)
+#define  PHY_INTF_RGMII			FIELD_PREP(PHY_INTF_MASK, 1)
+#define  PHY_INTF_MII_GMII		FIELD_PREP(PHY_INTF_MASK, 0)
+#define GMAC_TXCLK_OEN			0x20
+#define  TXCLK_DIR_MASK			BIT(0)
+#define  TXCLK_DIR_OUTPUT		FIELD_PREP(TXCLK_DIR_MASK, 0)
+#define  TXCLK_DIR_INPUT		FIELD_PREP(TXCLK_DIR_MASK, 1)
+
+#define GMAC_GMII_RGMII_RATE	125000000
+#define GMAC_MII_RATE		25000000
+
+struct thead_dwmac {
+	struct plat_stmmacenet_data *plat;
+	struct regmap *apb_regmap;
+	struct device *dev;
+	struct clk *clk_axi;
+	u32 rx_delay;
+	u32 tx_delay;
+};
+
+static int thead_dwmac_set_phy_if(struct plat_stmmacenet_data *plat)
+{
+	struct thead_dwmac *dwmac = plat->bsp_priv;
+	u32 phyif;
+
+	switch (plat->interface) {
+	case PHY_INTERFACE_MODE_MII:
+		phyif = PHY_INTF_MII_GMII;
+		break;
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+		phyif = PHY_INTF_RGMII;
+		break;
+	default:
+		dev_err(dwmac->dev, "unsupported phy interface %d\n",
+			plat->interface);
+		return -EINVAL;
+	};
+
+	regmap_write(dwmac->apb_regmap, GMAC_INTF_CTRL, phyif);
+
+	return 0;
+}
+
+static int thead_dwmac_set_txclk_dir(struct plat_stmmacenet_data *plat)
+{
+	struct thead_dwmac *dwmac = plat->bsp_priv;
+	u32 txclk_dir;;
+
+	switch (plat->interface) {
+	case PHY_INTERFACE_MODE_MII:
+		txclk_dir = TXCLK_DIR_INPUT;
+		break;
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+		txclk_dir = TXCLK_DIR_OUTPUT;
+		break;
+	default:
+		dev_err(dwmac->dev, "unsupported phy interface %d\n",
+			plat->interface);
+		return -EINVAL;
+	};
+
+	regmap_write(dwmac->apb_regmap, GMAC_TXCLK_OEN, txclk_dir);
+
+	return 0;
+}
+
+static void thead_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mode)
+{
+	struct thead_dwmac *dwmac = priv;
+	struct plat_stmmacenet_data *plat = dwmac->plat;
+	unsigned long rate;
+	u32 div;
+
+	switch (plat->interface) {
+	/* For MII, rxc/txc is provided by phy */
+	case PHY_INTERFACE_MODE_MII:
+		return;
+
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		rate = clk_get_rate(plat->stmmac_clk);
+		if (!rate || rate % GMAC_GMII_RGMII_RATE != 0 ||
+		    rate % GMAC_MII_RATE != 0) {
+			dev_err(dwmac->dev, "invalid gmac rate %ld\n", rate);
+			return;
+		}
+
+		regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV, GMAC_PLLCLK_DIV_EN, 0);
+
+		switch (speed) {
+		case SPEED_1000:
+			div = rate / GMAC_GMII_RGMII_RATE;
+			break;
+		case SPEED_100:
+			div = rate / GMAC_MII_RATE;
+			break;
+		case SPEED_10:
+			div = rate * 10 / GMAC_MII_RATE;
+			break;
+		default:
+			dev_err(dwmac->dev, "invalid speed %u\n", speed);
+			break;
+		}
+		regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV,
+				   GMAC_PLLCLK_DIV_MASK, GMAC_PLLCLK_DIV_NUM(div));
+
+		regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV,
+				   GMAC_PLLCLK_DIV_EN, GMAC_PLLCLK_DIV_EN);
+		break;
+	default:
+		dev_err(dwmac->dev, "unsupported phy interface %d\n",
+			plat->interface);
+		return;
+	}
+}
+
+static int thead_dwmac_enable_clk(struct plat_stmmacenet_data *plat)
+{
+	struct thead_dwmac *dwmac = plat->bsp_priv;
+	u32 reg;
+
+	switch (plat->interface) {
+	case PHY_INTERFACE_MODE_MII:
+		reg = GMAC_RX_CLK_EN | GMAC_TX_CLK_EN;
+		break;
+
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		/* use pll */
+		regmap_write(dwmac->apb_regmap, GMAC_GTXCLK_SEL, GMAC_GTXCLK_SEL_PLL);
+
+		reg = GMAC_TX_CLK_EN | GMAC_TX_CLK_N_EN | GMAC_TX_CLK_OUT_EN |
+		      GMAC_RX_CLK_EN | GMAC_RX_CLK_N_EN;
+		break;
+
+	default:
+		dev_err(dwmac->dev, "unsupported phy interface %d\n",
+			plat->interface);
+		return -EINVAL;
+	}
+
+	regmap_write(dwmac->apb_regmap, GMAC_CLK_EN, reg);
+
+	return 0;
+}
+
+static int thead_dwmac_init(struct platform_device *pdev,
+			    struct plat_stmmacenet_data *plat)
+{
+	struct thead_dwmac *dwmac = plat->bsp_priv;
+	int ret;
+
+	ret = thead_dwmac_set_phy_if(plat);
+	if (ret)
+		return ret;
+
+	ret = thead_dwmac_set_txclk_dir(plat);
+	if (ret)
+		return ret;
+
+	regmap_write(dwmac->apb_regmap, GMAC_RXCLK_DELAY_CTRL,
+		     GMAC_RXCLK_DELAY_VAL(dwmac->rx_delay));
+	regmap_write(dwmac->apb_regmap, GMAC_TXCLK_DELAY_CTRL,
+		     GMAC_TXCLK_DELAY_VAL(dwmac->tx_delay));
+
+	thead_dwmac_fix_speed(dwmac, SPEED_1000, 0);
+
+	return thead_dwmac_enable_clk(plat);
+}
+
+static int thead_dwmac_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat;
+	struct stmmac_resources stmmac_res;
+	struct thead_dwmac *dwmac;
+	struct device_node *np = pdev->dev.of_node;
+	u32 delay_ps;
+	int ret;
+
+	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to get resources\n");
+
+	plat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat))
+		return dev_err_probe(&pdev->dev, PTR_ERR(plat),
+				     "dt configuration failed\n");
+
+	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
+	if (!dwmac)
+		return -ENOMEM;
+
+	dwmac->clk_axi = devm_clk_get_enabled(&pdev->dev, "axi");
+	if (IS_ERR(dwmac->clk_axi))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_axi),
+				     "error getting axi clock\n");
+
+	if (!of_property_read_u32(np, "rx-internal-delay-ps", &delay_ps))
+		dwmac->rx_delay = delay_ps;
+	if (!of_property_read_u32(np, "tx-internal-delay-ps", &delay_ps))
+		dwmac->tx_delay = delay_ps;
+
+	dwmac->apb_regmap = syscon_regmap_lookup_by_phandle(np, "thead,gmacapb");
+	if (IS_ERR(dwmac->apb_regmap)) {
+		dev_err(&pdev->dev, "Failed to get gmac apb syscon\n");
+		return PTR_ERR(dwmac->apb_regmap);
+	}
+
+	dwmac->dev = &pdev->dev;
+	dwmac->plat = plat;
+	plat->bsp_priv = dwmac;
+	plat->fix_mac_speed = thead_dwmac_fix_speed;
+
+	ret = thead_dwmac_init(pdev, plat);
+	if (ret)
+		goto err_dvr_probe;
+
+	ret = stmmac_dvr_probe(&pdev->dev, plat, &stmmac_res);
+	if (ret)
+		goto err_dvr_probe;
+
+	return 0;
+
+err_dvr_probe:
+	stmmac_remove_config_dt(pdev, plat);
+
+	return ret;
+}
+
+static const struct of_device_id thead_dwmac_match[] = {
+	{ .compatible = "thead,th1520-dwmac" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, thead_dwmac_match);
+
+static struct platform_driver thead_dwmac_driver = {
+	.probe = thead_dwmac_probe,
+	.remove_new = stmmac_pltfr_remove,
+	.driver = {
+		.name = "thead-dwmac",
+		.pm = &stmmac_pltfr_pm_ops,
+		.of_match_table = thead_dwmac_match,
+	},
+};
+module_platform_driver(thead_dwmac_driver);
+
+MODULE_AUTHOR("T-HEAD");
+MODULE_AUTHOR("Jisheng Zhang <jszhang@kernel.org>");
+MODULE_DESCRIPTION("T-HEAD dwmac platform driver");
+MODULE_LICENSE("GPL");
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
