Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA89CCFA05
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Nov 2025 01:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zJBMrY4/bJZ+S14RKrCl/R+vy5kYLtmIx8hSdiL0qF4=; b=3S91PJ5oKZkhpU
	Z8BUXHN2xSi/3xDb+cBBOh84mx0cGmImZPpnmqxiy1zd0Rrvpx8F0u0rAaJeMvmflCvYg2GHqKUmf
	DNTwI6BB5clnSJXagKO+HYJuVF7LZL6JX9kYxYX996ye5FCZYKkaobPjM5mlOPPQrKCGn3BmvMQjU
	Yd3TdpDffX0oC6ANdVZI1VXptl9TnjGH3F6TaQguIwhoiQmxD1xo27NO4YJc48foEG9J21IBpgBag
	bMwmQpwSPUThTP/YPIwg/Db5BTleRTPMLFhYVzjX4R/BMrZ5C7YYSK0domI3GaF2i64ES+hdOLLas
	utTXx9XzxbnYH/kLLGsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHXOA-00000001r0N-3tUP;
	Sat, 08 Nov 2025 01:05:10 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHXO4-00000001qtQ-30Qk;
	Sat, 08 Nov 2025 01:05:06 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251108010502euoutp024ea98c9aca03df47d4fab0d114e22f73~14ogDcEPi1808118081euoutp02T;
	Sat,  8 Nov 2025 01:05:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251108010502euoutp024ea98c9aca03df47d4fab0d114e22f73~14ogDcEPi1808118081euoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1762563903;
	bh=u3fOvH+1X+j1/dbws73AX3amGSo2D6LaOVAdTotBb28=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=pOFD2mHfAowqUUGBQj+QdCROnZ8+SjaQ9XapNecIXgfjr5Jk2HS1GLWrym/1cAEv2
	 +2CE+RQVVHTx3dtzEzaXWxqArdnRyH17waephBH7B173n0XHLpzM5dRvfwKPLYOKtt
	 zdTDMYMS8q5/FaWaDNyQT2BxLEaKM49bGJn7427g=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251108010501eucas1p1357090a298d586f1843280ac7f37178a~14oe0KxvI0739307393eucas1p1T;
	Sat,  8 Nov 2025 01:05:01 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251108010500eusmtip298823f1a54fe88f4dc14b973462869e9~14odaK2TJ0912409124eusmtip2T;
	Sat,  8 Nov 2025 01:05:00 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Sat, 08 Nov 2025 02:04:40 +0100
Subject: [PATCH RFC 06/13] drm: bridge: inno_hdmi: Refactor to support
 regmap and probe
MIME-Version: 1.0
Message-Id: <20251108-jh7110-clean-send-v1-6-06bf43bb76b1@samsung.com>
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
X-CMS-MailID: 20251108010501eucas1p1357090a298d586f1843280ac7f37178a
X-Msg-Generator: CA
X-RootMTR: 20251108010501eucas1p1357090a298d586f1843280ac7f37178a
X-EPHeader: CA
X-CMS-RootMailID: 20251108010501eucas1p1357090a298d586f1843280ac7f37178a
References: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
	<CGME20251108010501eucas1p1357090a298d586f1843280ac7f37178a@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_170505_044067_B8F18C35 
X-CRM114-Status: GOOD (  26.04  )
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

Refactor the Innosilicon HDMI bridge driver into a library
to support being called by MFD (Multi-Function Device) drivers.
This is necessary for platforms like the StarFive JH7110, where
the HDMI controller and PHY are part of a monolithic MFD block.

This patch makes the following changes:
- The core probing logic is moved into a new exported function,
  inno_hdmi_probe().
- A corresponding exported inno_hdmi_remove() is added.
- The existing inno_hdmi_bind() function is updated to use the
  new inno_hdmi_probe() helper.
- The driver now supports retrieving a shared regmap from a parent
  device, falling back to ioremap if one is not found.
- The struct inno_hdmi definition is moved to a public header
  (include/drm/bridge/inno_hdmi.h) to be accessible by other
  drivers.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/inno-hdmi.c | 99 +++++++++++++++++++++++++++-----------
 include/drm/bridge/inno_hdmi.h     | 25 +++++++++-
 2 files changed, 96 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index e46ee4d85044f18407aaa624b4e3dd1a6c5af5cb..9a2370ed2f208caf3dafb4a4d8884516d489263c 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -395,12 +395,6 @@ enum inno_hdmi_dev_type {
 	RK3128_HDMI,
 };
 
-struct inno_hdmi_phy_config {
-	unsigned long pixelclock;
-	u8 pre_emphasis;
-	u8 voltage_level_control;
-};
-
 struct inno_hdmi_variant {
 	enum inno_hdmi_dev_type dev_type;
 	struct inno_hdmi_phy_config *phy_configs;
@@ -417,19 +411,6 @@ struct inno_hdmi_i2c {
 	struct completion cmp;
 };
 
-struct inno_hdmi {
-	struct device *dev;
-	struct drm_bridge bridge;
-	struct clk *pclk;
-	struct clk *refclk;
-	void __iomem *regs;
-	struct regmap *grf;
-
-	struct inno_hdmi_i2c *i2c;
-	struct i2c_adapter *ddc;
-	const struct inno_hdmi_plat_data *plat_data;
-};
-
 enum {
 	CSC_RGB_0_255_TO_ITU601_16_235_8BIT,
 	CSC_RGB_0_255_TO_ITU709_16_235_8BIT,
@@ -496,11 +477,23 @@ static int inno_hdmi_find_phy_config(struct inno_hdmi *hdmi,
 
 static inline u8 hdmi_readb(struct inno_hdmi *hdmi, u16 offset)
 {
+	u32 val;
+
+	if (hdmi->regmap) {
+		regmap_read(hdmi->regmap, offset * 4, &val);
+		return val;
+	}
+
 	return readl_relaxed(hdmi->regs + (offset) * 0x04);
 }
 
 static inline void hdmi_writeb(struct inno_hdmi *hdmi, u16 offset, u32 val)
 {
+	if (hdmi->regmap) {
+		regmap_write(hdmi->regmap, offset * 4, val);
+		return;
+	}
+
 	writel_relaxed(val, hdmi->regs + (offset) * 0x04);
 }
 
@@ -1082,11 +1075,24 @@ static struct i2c_adapter *inno_hdmi_i2c_adapter(struct inno_hdmi *hdmi)
 	return adap;
 }
 
-struct inno_hdmi *inno_hdmi_bind(struct device *dev,
-				 struct drm_encoder *encoder,
-				 const struct inno_hdmi_plat_data *plat_data)
+/**
+ * inno_hdmi_probe - Internal helper to perform common setup
+ * @pdev: platform device
+ * @plat_data: SoC-specific platform data
+ *
+ * This function handles all the common hardware setup: allocating the main
+ * struct, mapping registers, getting clocks, initializing the hardware,
+ * setting up the IRQ, and initializing the DDC adapter and bridge struct.
+ * It returns a pointer to the inno_hdmi struct on success, or an ERR_PTR
+ * on failure.
+ *
+ * This function is used by modern, decoupled MFD/glue drivers. It registers
+ * the bridge but does not attach it.
+ */
+struct inno_hdmi *inno_hdmi_probe(struct platform_device *pdev,
+					 const struct inno_hdmi_plat_data *plat_data)
 {
-	struct platform_device *pdev = to_platform_device(dev);
+	struct device *dev = &pdev->dev;
 	struct inno_hdmi *hdmi;
 	int irq;
 	int ret;
@@ -1103,9 +1109,21 @@ struct inno_hdmi *inno_hdmi_bind(struct device *dev,
 	hdmi->dev = dev;
 	hdmi->plat_data = plat_data;
 
-	hdmi->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(hdmi->regs))
-		return ERR_CAST(hdmi->regs);
+	/*
+	 * MFD Support: Check if parent provides a regmap.
+	 * If so, use it. Otherwise, fall back to ioremap.
+	 */
+	if (dev->parent)
+		hdmi->regmap = dev_get_regmap(dev->parent, NULL);
+
+	if (hdmi->regmap) {
+		dev_info(dev, "Using MFD regmap for registers\n");
+	} else {
+		dev_info(dev, "Falling back to ioremap for registers\n");
+		hdmi->regs = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(hdmi->regs))
+			return ERR_CAST(hdmi->regs);
+	}
 
 	hdmi->pclk = devm_clk_get_enabled(hdmi->dev, "pclk");
 	if (IS_ERR(hdmi->pclk)) {
@@ -1149,7 +1167,34 @@ struct inno_hdmi *inno_hdmi_bind(struct device *dev,
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = drm_bridge_attach(encoder, &hdmi->bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	return hdmi;
+}
+EXPORT_SYMBOL_GPL(inno_hdmi_probe);
+
+/**
+ * inno_hdmi_remove - Remove a bridge created by inno_hdmi_probe
+ * @hdmi: The inno_hdmi instance to remove
+ */
+void inno_hdmi_remove(struct inno_hdmi *hdmi)
+{
+	drm_bridge_remove(&hdmi->bridge);
+}
+EXPORT_SYMBOL_GPL(inno_hdmi_remove);
+
+struct inno_hdmi *inno_hdmi_bind(struct device *dev,
+				 struct drm_encoder *encoder,
+				 const struct inno_hdmi_plat_data *plat_data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct inno_hdmi *hdmi;
+	int ret;
+
+	hdmi = inno_hdmi_probe(pdev, plat_data);
+	if (IS_ERR(hdmi))
+		return hdmi;
+
+	ret = drm_bridge_attach(encoder, &hdmi->bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/include/drm/bridge/inno_hdmi.h b/include/drm/bridge/inno_hdmi.h
index 8b39655212e247d9ca7b1f220f970df1fb6afe13..019680622324197e046a1c606ec25aabe95537b4 100644
--- a/include/drm/bridge/inno_hdmi.h
+++ b/include/drm/bridge/inno_hdmi.h
@@ -6,10 +6,13 @@
 #ifndef __INNO_HDMI__
 #define __INNO_HDMI__
 
+#include <drm/drm_bridge.h>
+
 struct device;
 struct drm_encoder;
 struct drm_display_mode;
-struct inno_hdmi;
+struct i2c_adapter;
+struct inno_hdmi_i2c;
 
 struct inno_hdmi_plat_ops {
 	void (*enable)(struct device *pdev, struct drm_display_mode *mode);
@@ -27,7 +30,27 @@ struct inno_hdmi_plat_data {
 	struct inno_hdmi_phy_config *default_phy_config;
 };
 
+struct inno_hdmi {
+	struct device *dev;
+	struct drm_bridge bridge;
+	struct clk *pclk;
+	struct clk *refclk;
+	void __iomem *regs;
+	struct regmap *regmap;
+	struct regmap *grf;
+
+	struct i2c_adapter *ddc;
+	struct inno_hdmi_i2c *i2c;
+	const struct inno_hdmi_plat_data *plat_data;
+};
+
 struct inno_hdmi *inno_hdmi_bind(struct device *pdev,
 				 struct drm_encoder *encoder,
 				 const struct inno_hdmi_plat_data *plat_data);
+
+struct inno_hdmi *inno_hdmi_probe(struct platform_device *pdev,
+				 const struct inno_hdmi_plat_data *plat_data);
+
+void inno_hdmi_remove(struct inno_hdmi *hdmi);
+
 #endif /* __INNO_HDMI__ */

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
