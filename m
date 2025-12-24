Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91081E776C3
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Dec 2025 16:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FRU6O+hSEz1wfWDN/6ns9IiU/f8CTiQMEEM+ydkL5a0=; b=mJTpcWFKURisD0
	KPOPnU5jGV5DSmtLet0DiR1UB1xRX0xqdGcqjLMk1Oz1/zU/n7ll69Hi6q5BK62jGRf4JLXoA4PjN
	toe/KYg+CxkUyNzu41+7OFCQ7NMyZ4nk7VdvThSydC8o7UoF5tVQ/2ZXYqUUfnEFbeXJtfv3sZ5dt
	q/v7Z3C3OBA1qvMYu8hE5OiqrxXAfa9ylwkiA6VS3v/R/jqiT6coPHpoPs0cqfQah1hNtFvjoCnyJ
	nFov4u2FcQmIXz+n0/alVV7kpHnCx8M29f94AvyRbzcUnoS0VDpgWsA7wCeFJXzv9PWAdQTA08zlP
	dL2+oBur8mxgIMPugJbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRU2-0000000HD2v-2nXJ;
	Wed, 24 Dec 2025 16:13:07 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRTo-0000000HCsD-1py7
	for linux-riscv@lists.infradead.org;
	Wed, 24 Dec 2025 16:13:00 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.54])
	by APP-05 (Coremail) with SMTP id zQCowAA3yw7WEExpgGPNAQ--.14041S7;
	Thu, 25 Dec 2025 00:12:19 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v4 5/9] drm/bridge: add a driver for T-Head TH1520 HDMI controller
Date: Thu, 25 Dec 2025 00:12:01 +0800
Message-ID: <20251224161205.1132149-6-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
References: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAA3yw7WEExpgGPNAQ--.14041S7
X-Coremail-Antispam: 1UD129KBjvJXoW3XF13tFy5KFyrXr1DGr4fuFg_yoWfXryDpa
	y7AayYkrWkXF1aga1fAr48ZrZaya9rXFy5t3y2qwsavwn3tF4rXryDJrWrXFWrArsrZw13
	tFn8uFWYgF17J3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmv14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_
	Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
	IIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
	Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8c
	xan2IY04v7MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCj
	c4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
	CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4U
	MIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
	WUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUv
	cSsGvfC2KfnxnUUI43ZEXa7sRRjg43UUUUU==
X-Originating-IP: [112.94.100.54]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_081252_841889_5E0B228C 
X-CRM114-Status: GOOD (  25.51  )
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
Cc: devicetree@vger.kernel.org, Yao Zi <ziyao@disroot.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Icenowy Zheng <uwu@icenowy.me>

T-Head TH1520 SoC contains a Synopsys DesignWare HDMI controller (paired
with DesignWare HDMI TX PHY Gen2) that takes the "DP" output from the
display controller.

Add a driver for this controller utilizing the common DesignWare HDMI
code in the kernel.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
No changes in v3, v4.

Changes in v2:
- Created a new function to set PHY parameters and refactored the
  control flow of the configure_phy callback.

 MAINTAINERS                             |   1 +
 drivers/gpu/drm/bridge/Kconfig          |  10 ++
 drivers/gpu/drm/bridge/Makefile         |   1 +
 drivers/gpu/drm/bridge/th1520-dw-hdmi.c | 173 ++++++++++++++++++++++++
 4 files changed, 185 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/th1520-dw-hdmi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9de..fc04fc007a054 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22556,6 +22556,7 @@ F:	Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
 F:	arch/riscv/boot/dts/thead/
 F:	drivers/clk/thead/clk-th1520-ap.c
 F:	drivers/firmware/thead,th1520-aon.c
+F:	drivers/gpu/drm/bridge/th1520-dw-hdmi.c
 F:	drivers/mailbox/mailbox-th1520.c
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
 F:	drivers/pinctrl/pinctrl-th1520.c
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index a250afd8d6622..8e19f5fb9ad7c 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -335,6 +335,16 @@ config DRM_THINE_THC63LVD1024
 	help
 	  Thine THC63LVD1024 LVDS/parallel converter driver.
 
+config DRM_THEAD_TH1520_DW_HDMI
+	tristate "T-Head TH1520 DesignWare HDMI bridge"
+	depends on OF
+	depends on COMMON_CLK
+	depends on ARCH_THEAD || COMPILE_TEST
+	select DRM_DW_HDMI
+	help
+	  Choose this to enable support for the internal HDMI bridge found
+	  on the T-Head TH1520 SoC.
+
 config DRM_TOSHIBA_TC358762
 	tristate "TC358762 DSI/DPI bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index c7dc03182e592..085b5db45d6fd 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_DRM_SII902X) += sii902x.o
 obj-$(CONFIG_DRM_SII9234) += sii9234.o
 obj-$(CONFIG_DRM_SIMPLE_BRIDGE) += simple-bridge.o
 obj-$(CONFIG_DRM_SOLOMON_SSD2825) += ssd2825.o
+obj-$(CONFIG_DRM_THEAD_TH1520_DW_HDMI) += th1520-dw-hdmi.o
 obj-$(CONFIG_DRM_THINE_THC63LVD1024) += thc63lvd1024.o
 obj-$(CONFIG_DRM_TOSHIBA_TC358762) += tc358762.o
 obj-$(CONFIG_DRM_TOSHIBA_TC358764) += tc358764.o
diff --git a/drivers/gpu/drm/bridge/th1520-dw-hdmi.c b/drivers/gpu/drm/bridge/th1520-dw-hdmi.c
new file mode 100644
index 0000000000000..389eead5f1c45
--- /dev/null
+++ b/drivers/gpu/drm/bridge/th1520-dw-hdmi.c
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
+ *
+ * Based on rcar_dw_hdmi.c, which is:
+ *   Copyright (C) 2016 Renesas Electronics Corporation
+ * Based on imx8mp-hdmi-tx.c, which is:
+ *   Copyright (C) 2022 Pengutronix, Lucas Stach <kernel@pengutronix.de>
+ */
+
+#include <linux/clk.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+#include <drm/bridge/dw_hdmi.h>
+#include <drm/drm_modes.h>
+
+#define TH1520_HDMI_PHY_OPMODE_PLLCFG	0x06	/* Mode of operation and PLL dividers */
+#define TH1520_HDMI_PHY_CKSYMTXCTRL	0x09	/* Clock Symbol and Transmitter Control Register */
+#define TH1520_HDMI_PHY_VLEVCTRL	0x0e	/* Voltage Level Control Register */
+#define TH1520_HDMI_PHY_PLLCURRGMPCTRL	0x10	/* PLL current and Gmp (conductance) */
+#define TH1520_HDMI_PHY_PLLDIVCTRL	0x11	/* PLL dividers */
+#define TH1520_HDMI_PHY_TXTERM		0x19	/* Transmission Termination Register */
+
+struct th1520_hdmi_phy_params {
+	unsigned long mpixelclock;
+	u16 opmode_pllcfg;
+	u16 pllcurrgmpctrl;
+	u16 plldivctrl;
+	u16 cksymtxctrl;
+	u16 vlevctrl;
+	u16 txterm;
+};
+
+static const struct th1520_hdmi_phy_params th1520_hdmi_phy_params[] = {
+	{ 35500000,  0x0003, 0x0283, 0x0628, 0x8088, 0x01a0, 0x0007 },
+	{ 44900000,  0x0003, 0x0285, 0x0228, 0x8088, 0x01a0, 0x0007 },
+	{ 71000000,  0x0002, 0x1183, 0x0614, 0x8088, 0x01a0, 0x0007 },
+	{ 90000000,  0x0002, 0x1142, 0x0214, 0x8088, 0x01a0, 0x0007 },
+	{ 121750000, 0x0001, 0x20c0, 0x060a, 0x8088, 0x01a0, 0x0007 },
+	{ 165000000, 0x0001, 0x2080, 0x020a, 0x8088, 0x01a0, 0x0007 },
+	{ 198000000, 0x0000, 0x3040, 0x0605, 0x83c8, 0x0120, 0x0004 },
+	{ 297000000, 0x0000, 0x3041, 0x0205, 0x81dc, 0x0200, 0x0005 },
+	{ 371250000, 0x0640, 0x3041, 0x0205, 0x80f6, 0x0140, 0x0000 },
+	{ 495000000, 0x0640, 0x3080, 0x0005, 0x80f6, 0x0140, 0x0000 },
+	{ 594000000, 0x0640, 0x3080, 0x0005, 0x80fa, 0x01e0, 0x0004 },
+};
+
+struct th1520_hdmi {
+	struct dw_hdmi_plat_data plat_data;
+	struct dw_hdmi *dw_hdmi;
+	struct clk *pixclk;
+	struct reset_control *mainrst, *prst;
+};
+
+static enum drm_mode_status
+th1520_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
+		       const struct drm_display_info *info,
+		       const struct drm_display_mode *mode)
+{
+	/*
+	 * The maximum supported clock frequency is 594 MHz, as shown in the PHY
+	 * parameters table.
+	 */
+	if (mode->clock > 594000)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static void th1520_hdmi_phy_set_params(struct dw_hdmi *hdmi,
+				const struct th1520_hdmi_phy_params *params)
+{
+	dw_hdmi_phy_i2c_write(hdmi, params->opmode_pllcfg,
+			      TH1520_HDMI_PHY_OPMODE_PLLCFG);
+	dw_hdmi_phy_i2c_write(hdmi, params->pllcurrgmpctrl,
+			      TH1520_HDMI_PHY_PLLCURRGMPCTRL);
+	dw_hdmi_phy_i2c_write(hdmi, params->plldivctrl,
+			      TH1520_HDMI_PHY_PLLDIVCTRL);
+	dw_hdmi_phy_i2c_write(hdmi, params->vlevctrl,
+			      TH1520_HDMI_PHY_VLEVCTRL);
+	dw_hdmi_phy_i2c_write(hdmi, params->cksymtxctrl,
+			      TH1520_HDMI_PHY_CKSYMTXCTRL);
+	dw_hdmi_phy_i2c_write(hdmi, params->txterm,
+			      TH1520_HDMI_PHY_TXTERM);
+}
+
+static int th1520_hdmi_phy_configure(struct dw_hdmi *hdmi, void *data,
+				     unsigned long mpixelclock)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(th1520_hdmi_phy_params); i++) {
+		if (mpixelclock <= th1520_hdmi_phy_params[i].mpixelclock) {
+			th1520_hdmi_phy_set_params(hdmi,
+						   &th1520_hdmi_phy_params[i]);
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int th1520_dw_hdmi_probe(struct platform_device *pdev)
+{
+	struct th1520_hdmi *hdmi;
+	struct dw_hdmi_plat_data *plat_data;
+	struct device *dev = &pdev->dev;
+
+	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
+	if (!hdmi)
+		return -ENOMEM;
+
+	plat_data = &hdmi->plat_data;
+
+	hdmi->pixclk = devm_clk_get_enabled(dev, "pix");
+	if (IS_ERR(hdmi->pixclk))
+		return dev_err_probe(dev, PTR_ERR(hdmi->pixclk),
+				     "Unable to get pixel clock\n");
+
+	hdmi->mainrst = devm_reset_control_get_exclusive_deasserted(dev, "main");
+	if (IS_ERR(hdmi->mainrst))
+		return dev_err_probe(dev, PTR_ERR(hdmi->mainrst),
+				     "Unable to get main reset\n");
+
+	hdmi->prst = devm_reset_control_get_exclusive_deasserted(dev, "apb");
+	if (IS_ERR(hdmi->prst))
+		return dev_err_probe(dev, PTR_ERR(hdmi->prst),
+				     "Unable to get apb reset\n");
+
+	plat_data->output_port = 1;
+	plat_data->mode_valid = th1520_hdmi_mode_valid;
+	plat_data->configure_phy = th1520_hdmi_phy_configure;
+	plat_data->priv_data = hdmi;
+
+	hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
+	if (IS_ERR(hdmi))
+		return PTR_ERR(hdmi);
+
+	platform_set_drvdata(pdev, hdmi);
+
+	return 0;
+}
+
+static void th1520_dw_hdmi_remove(struct platform_device *pdev)
+{
+	struct dw_hdmi *hdmi = platform_get_drvdata(pdev);
+
+	dw_hdmi_remove(hdmi);
+}
+
+static const struct of_device_id th1520_dw_hdmi_of_table[] = {
+	{ .compatible = "thead,th1520-dw-hdmi" },
+	{ /* Sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, th1520_dw_hdmi_of_table);
+
+static struct platform_driver th1520_dw_hdmi_platform_driver = {
+	.probe		= th1520_dw_hdmi_probe,
+	.remove		= th1520_dw_hdmi_remove,
+	.driver		= {
+		.name	= "th1520-dw-hdmi",
+		.of_match_table = th1520_dw_hdmi_of_table,
+	},
+};
+
+module_platform_driver(th1520_dw_hdmi_platform_driver);
+
+MODULE_AUTHOR("Icenowy Zheng <uwu@icenowy.me>");
+MODULE_DESCRIPTION("T-Head TH1520 HDMI Encoder Driver");
+MODULE_LICENSE("GPL");
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
