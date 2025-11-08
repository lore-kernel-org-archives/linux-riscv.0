Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F837CCF9E3
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Nov 2025 01:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s22rcHehOiYQ0qTZC0VnnmuyoFX2rYZk9WOZuVfS1Uw=; b=Qcu2LA4Mfya8c5
	sSk6NY/oHlviy6YKcwFH7sd+9OkLcSklL9qG2fMaY1ZWWqOpPChLLqEUL9vJsJnnWqIQI0fdMSqTT
	we+ufWif6awuD++5A/AKH8UQxrtnLtyOpzu1qyofJZiQFs30pzXKeH6bYc4DkoBd3pjKhq4U1XYK9
	wDoBeXCtvGNU5u9QMiu8MiI2lYXAoBNYvZt/e9ALksYNc5UTxg8a4g9gZp70lTT7Px0j/SqreU+EM
	ZxFI7G5O/xQuIs6g6siQjitT5Szxi8/MA38vYCVj6Mj2Rm9c4YW+6+eIvyYjvLTVceJk2hDNVGPh3
	t3d+yqwt2u8aKhcpLCJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHXOI-00000001r9u-3RMz;
	Sat, 08 Nov 2025 01:05:18 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHXOC-00000001r0Z-1beJ;
	Sat, 08 Nov 2025 01:05:13 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251108010510euoutp0194ff5e5d49d0d9498810a71e32cad1af~14onQIx5P2093120931euoutp01b;
	Sat,  8 Nov 2025 01:05:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251108010510euoutp0194ff5e5d49d0d9498810a71e32cad1af~14onQIx5P2093120931euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1762563910;
	bh=HqRmeZFUp3WFg9X0ciyVMkr7iVHX1W4b0RU7djvf4bQ=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=vehcd89DSEX99jbdra20gvcQAlK/1h6rtWRR/aujM4roMa2U4Nf/fc0ipJwvz7jT+
	 kIrIRj5aLPw16uvAldhegbsMZxd1CooVE5xYWi6QL4OI31Wo+ViE4/aYPbw0njw/+T
	 /bRpu9Dw0NejM1r8qspjG1FepNHM5MstzN4STpYc=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251108010509eucas1p1cabce45ee13f19249da4898088088146~14omIV2eA0665006650eucas1p1f;
	Sat,  8 Nov 2025 01:05:09 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251108010507eusmtip2838c4b5c39cde625fda213dbbe3397b9~14oks0YLk2515425154eusmtip2g;
	Sat,  8 Nov 2025 01:05:07 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Sat, 08 Nov 2025 02:04:45 +0100
Subject: [PATCH RFC 11/13] drm: bridge: starfive: Add hdmi-controller driver
MIME-Version: 1.0
Message-Id: <20251108-jh7110-clean-send-v1-11-06bf43bb76b1@samsung.com>
In-Reply-To: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,  Conor Dooley
	<conor@kernel.org>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
	<krzk+dt@kernel.org>,  Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>,  Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Xingyu
	Wu <xingyu.wu@starfivetech.com>, Vinod Koul <vkoul@kernel.org>,  Kishon
	Vijay Abraham I <kishon@kernel.org>,  Andrzej Hajda
	<andrzej.hajda@intel.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,  Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>,  Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Lee Jones <lee@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,  Paul Walmsley
	<paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,  Marek Szyprowski
	<m.szyprowski@samsung.com>, Icenowy Zheng <uwu@icenowy.me>,  Maud Spierings
	<maudspierings@gocontroll.com>, Andy Yan <andyshrk@163.com>,  Heiko Stuebner
	<heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20251108010509eucas1p1cabce45ee13f19249da4898088088146
X-Msg-Generator: CA
X-RootMTR: 20251108010509eucas1p1cabce45ee13f19249da4898088088146
X-EPHeader: CA
X-CMS-RootMailID: 20251108010509eucas1p1cabce45ee13f19249da4898088088146
References: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
	<CGME20251108010509eucas1p1cabce45ee13f19249da4898088088146@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_170512_711779_49D6AD68 
X-CRM114-Status: GOOD (  25.40  )
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

Add the HDMI controller (bridge) driver for the StarFive JH7110.

This driver binds to the starfive,jh7110-inno-hdmi-controller MFD child.
It gets its shared regmap from the MFD parent and its clocks (sys, mclk,
bclk) from voutcrg. It consumes the pclk (pixel clock) and PHY from its
hdmi_phy sibling.

The driver calls the generic inno_hdmi_probe function and passes the
shared regmap to it, registering as a DRM bridge. The .enable hook is
responsible for setting the PHY's pixel clock rate via clk_set_rate()
and powering on the PHY via phy_power_on().

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 MAINTAINERS                               |   1 +
 drivers/gpu/drm/bridge/Kconfig            |  11 ++
 drivers/gpu/drm/bridge/Makefile           |   1 +
 drivers/gpu/drm/bridge/jh7110-inno-hdmi.c | 190 ++++++++++++++++++++++++++++++
 4 files changed, 203 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f1867018ee92fb754689934f6d238f9c9f185161..5984b83e55aeadb59c25a6e8f01057fb9d982d81 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24053,6 +24053,7 @@ F:	Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml
 F:	Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-vout-subsystem.yaml
 F:	drivers/soc/starfive/jh7110-hdmi-mfd.c
 F:	drivers/soc/starfive/jh7110-vout-subsystem.c
+F:	drivers/gpu/drm/bridge/jh7110-inno-hdmi.c
 
 STARFIVE JH7110 DPHY RX DRIVER
 M:	Jack Zhu <jack.zhu@starfivetech.com>
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index a5b8df9655ba70c6d653183780089258946b0e5a..2bf97ec0096ed093ed078b48300d9aa12088c486 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -323,6 +323,17 @@ config DRM_SIMPLE_BRIDGE
 	  Support for non-programmable DRM bridges, such as ADI ADV7123, TI
 	  THS8134 and THS8135 or passive resistor ladder DACs.
 
+config DRM_STARFIVE_JH7110_INNO_HDMI
+	tristate "Starfive JH7110 Innosilicon HDMI bridge"
+	depends on OF
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select DRM_INNO_HDMI
+	help
+	  Enable support for the StarFive JH7110 specific implementation
+	  of the Innosilicon HDMI controller.
+	  This driver acts as a glue layer between the JH7110 HDMI MFD
+	  parent driver and the generic Innosilicon HDMI bridge driver.
+
 config DRM_THINE_THC63LVD1024
 	tristate "Thine THC63LVD1024 LVDS decoder bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 4bc2236c8ae9169ac998e9d0448badff457cabaa..b2f5835ec05bcbb4367499d1cebb5403d7b9f247 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_DRM_SIL_SII8620) += sil-sii8620.o
 obj-$(CONFIG_DRM_SII902X) += sii902x.o
 obj-$(CONFIG_DRM_SII9234) += sii9234.o
 obj-$(CONFIG_DRM_SIMPLE_BRIDGE) += simple-bridge.o
+obj-$(CONFIG_DRM_STARFIVE_JH7110_INNO_HDMI) += jh7110-inno-hdmi.o
 obj-$(CONFIG_DRM_THEAD_TH1520_DW_HDMI) += th1520-dw-hdmi.o
 obj-$(CONFIG_DRM_THINE_THC63LVD1024) += thc63lvd1024.o
 obj-$(CONFIG_DRM_TOSHIBA_TC358762) += tc358762.o
diff --git a/drivers/gpu/drm/bridge/jh7110-inno-hdmi.c b/drivers/gpu/drm/bridge/jh7110-inno-hdmi.c
new file mode 100644
index 0000000000000000000000000000000000000000..8d3e1c3e736b801882b1b057199fc341142bba52
--- /dev/null
+++ b/drivers/gpu/drm/bridge/jh7110-inno-hdmi.c
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) StarFive Technology Co., Ltd.
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ * Author: Michal Wilczynski <m.wilczynski@samsung.com>
+ *
+ * HDMI Controller (bridge) driver for StarFive JH7110 MFD.
+ */
+
+#include <linux/clk.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/phy/phy.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+
+#include <drm/bridge/inno_hdmi.h>
+
+enum stf_hdmi_ctrl_clocks { CLK_SYS = 0, CLK_M, CLK_B, CLK_PCLK, CLK_CTRL_NUM };
+
+struct stf_inno_hdmi_controller {
+	struct inno_hdmi *inno;
+	struct device *dev;
+	struct clk_bulk_data clks[CLK_CTRL_NUM];
+	struct reset_control *tx_rst;
+	struct phy *phy;
+};
+
+static void inno_hdmi_starfive_enable(struct device *dev,
+				      struct drm_display_mode *mode)
+{
+	struct stf_inno_hdmi_controller *ctrl = dev_get_drvdata(dev);
+	int ret;
+
+	/*
+	 * 1. Set the pixel clock rate. This calls the PHY driver's .set_rate op.
+	 */
+	ret = clk_set_rate(ctrl->clks[CLK_PCLK].clk, mode->clock * 1000);
+	if (ret) {
+		dev_err(dev, "Failed to set pclk rate %d: %d\n",
+			mode->clock * 1000, ret);
+		return;
+	}
+
+	/*
+	 * 2. Enable the pixel clock. This calls the PHY driver's .prepare op.
+	 */
+	ret = clk_prepare_enable(ctrl->clks[CLK_PCLK].clk);
+	if (ret) {
+		dev_err(dev, "Failed to enable pclk: %d\n", ret);
+		return;
+	}
+
+	/*
+	 * 3. Power on the PHY. This calls the PHY driver's .power_on op,
+	 * which configures the Post-PLL and analog blocks.
+	 */
+	ret = phy_power_on(ctrl->phy);
+	if (ret) {
+		dev_err(dev, "Failed to power on PHY: %d\n", ret);
+		clk_disable_unprepare(ctrl->clks[CLK_PCLK].clk);
+		return;
+	}
+}
+
+static void inno_hdmi_starfive_disable(struct device *dev)
+{
+	struct stf_inno_hdmi_controller *ctrl = dev_get_drvdata(dev);
+
+	phy_power_off(ctrl->phy);
+	clk_disable_unprepare(ctrl->clks[CLK_PCLK].clk);
+}
+
+static int starfive_inno_hdmi_controller_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device *parent = dev->parent;
+	struct stf_inno_hdmi_controller *ctrl;
+	const struct inno_hdmi_plat_data *plat_data;
+	struct regmap *mfd_regmap;
+	int ret;
+
+	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
+	if (!ctrl)
+		return -ENOMEM;
+
+	ctrl->dev = dev;
+	platform_set_drvdata(pdev, ctrl);
+
+	/* Get the shared regmap from the MFD parent */
+	mfd_regmap = dev_get_regmap(parent, NULL);
+	if (!mfd_regmap) {
+		dev_err(dev, "Failed to get parent regmap\n");
+		return -ENODEV;
+	}
+
+	ctrl->phy = devm_phy_get(dev, "hdmi-phy");
+	if (IS_ERR(ctrl->phy))
+		return dev_err_probe(dev, PTR_ERR(ctrl->phy), "Failed to get PHY\n");
+
+	ctrl->tx_rst = devm_reset_control_get_exclusive(dev, "hdmi_tx");
+	if (IS_ERR(ctrl->tx_rst))
+		return dev_err_probe(dev, PTR_ERR(ctrl->tx_rst), "failed to get tx reset\n");
+
+	/* Populate the clock names this controller *consumes* */
+	ctrl->clks[CLK_SYS].id = "sys";
+	ctrl->clks[CLK_M].id = "mclk";
+	ctrl->clks[CLK_B].id = "bclk";
+	ctrl->clks[CLK_PCLK].id = "pclk"; /* Pixel clock *from* PHY */
+
+	ret = devm_clk_bulk_get(dev, CLK_CTRL_NUM, ctrl->clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "Unable to get controller clocks\n");
+
+	/* pclk is enabled on demand during modeset */
+	ret = clk_bulk_prepare_enable(CLK_CTRL_NUM - 1, ctrl->clks);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(ctrl->tx_rst);
+	if (ret) {
+		clk_bulk_disable_unprepare(CLK_CTRL_NUM - 1, ctrl->clks);
+		return ret;
+	}
+
+	plat_data = of_device_get_match_data(dev);
+
+	/* Hand off to the generic library to create the bridge. */
+	ctrl->inno = inno_hdmi_probe(pdev, plat_data);
+	if (IS_ERR(ctrl->inno)) {
+		reset_control_assert(ctrl->tx_rst);
+		clk_bulk_disable_unprepare(CLK_CTRL_NUM - 1, ctrl->clks);
+		return PTR_ERR(ctrl->inno);
+	}
+
+	return 0;
+}
+
+static void starfive_inno_hdmi_controller_remove(struct platform_device *pdev)
+{
+	struct stf_inno_hdmi_controller *ctrl = platform_get_drvdata(pdev);
+
+	inno_hdmi_remove(ctrl->inno);
+
+	reset_control_assert(ctrl->tx_rst);
+	clk_bulk_disable_unprepare(CLK_CTRL_NUM - 1, ctrl->clks);
+}
+
+/*
+ * This table is now only used for the generic .mode_valid check.
+ * The real validation happens in the PHY driver's .round_rate.
+ */
+static struct inno_hdmi_phy_config stf_hdmi_phy_configs[] = {
+	{ 297000000, 0x00, 0x00 },
+	{ ~0UL, 0x00, 0x00 }, /* Sentinel */
+};
+
+static const struct inno_hdmi_plat_ops stf_inno_hdmi_plat_ops = {
+	.enable = inno_hdmi_starfive_enable,
+	.disable = inno_hdmi_starfive_disable,
+};
+
+static const struct inno_hdmi_plat_data stf_inno_hdmi_plat_data = {
+	.ops = &stf_inno_hdmi_plat_ops,
+	.phy_configs = stf_hdmi_phy_configs,
+	.default_phy_config = &stf_hdmi_phy_configs[0],
+};
+
+static const struct of_device_id starfive_hdmi_controller_dt_ids[] = {
+	{ .compatible = "starfive,jh7110-inno-hdmi-controller",
+	  .data = &stf_inno_hdmi_plat_data },
+	{}
+};
+MODULE_DEVICE_TABLE(of, starfive_hdmi_controller_dt_ids);
+
+struct platform_driver starfive_inno_hdmi_controller_driver = {
+	.probe = starfive_inno_hdmi_controller_probe,
+	.remove = starfive_inno_hdmi_controller_remove,
+	.driver = {
+		.name = "starfive-inno-hdmi-controller",
+		.of_match_table = starfive_hdmi_controller_dt_ids,
+	},
+};
+module_platform_driver(starfive_inno_hdmi_controller_driver);
+
+MODULE_AUTHOR("Michal Wilczynski <m.wilczynski@samsung.com>");
+MODULE_DESCRIPTION("StarFive INNO HDMI Controller Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
