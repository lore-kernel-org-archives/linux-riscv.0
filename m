Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D39606A323
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 15:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WjavgefI;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=cWOV4g7H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:To:In-Reply-To:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9KCJGbEZyWSDMzE8rwQB9hbAXUstuWj6GlUAZzgqEWU=; b=WjavgefIlcwFB4bFrdYa0qnYti
	gBwfj8tDYYRn+ENQ3mEw7vgCtwu12j3qBH9vYdrD/1BIh+z74secC+b9wxAZbN0+QG0s0e28m+sek
	QOMnuXux9MS83AOSPwtR9ZQD/wlmM95tlHucWSlvDGV5vDMl2uj89Fd4tKMoFMUK+vTtGQfUeSq1s
	mahhHLtJQetiTf9Q4beY9MTmSapomLHR1G4fbKqL7Zo/ETDgJDbDXY8ioYWe7C58wYLs14UbX/vxr
	6qf/tD1MWWLBKFfmdz8uOYaMPUZoJtP0tOeHR9lRYmZPNyCiYbecKj75GWLcWqLkVr9SW/1LLikmQ
	e9kU2xDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsrs-00000006zp3-2SEf;
	Tue, 24 Nov 2026 15:55:40 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsqW-00000006yMM-25YJ;
	Tue, 24 Nov 2026 15:54:20 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261124155414euoutp028a3842d9b642fb12898db619c16f0547~rBioqyOnH0605606056euoutp02x;
	Tue, 24 Nov 2026 15:54:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261124155414euoutp028a3842d9b642fb12898db619c16f0547~rBioqyOnH0605606056euoutp02x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795535654;
	bh=crfFbI3cKj+ke4aYdZaScB10py2O16A/EKhDlQi0ffk=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=cWOV4g7HxFt+RjiN5fcDuqt8OwPzkvYEgxEA9EzdRRS9OG88UF/UkbrtOLPnoOlWW
	 Bw8wb/DRJkWtE5UhwR6h12zFyRFvvKvM1o1aNLanJE5dh3qdvLil2FdBmqKw0Z4S4E
	 BO4r1q1NEwAwpDM2PSzhKCnHE/FkBduV0HpDsCDQ=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261124155414eucas1p1061b3aa17e9780ca95c2a723c350495f~rBioVruft1250912509eucas1p1T;
	Tue, 24 Nov 2026 15:54:14 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261124155412eusmtip1041a995c6f79dfa6c03a41b8ce2137f8~rBimsO7_E0284302843eusmtip1C;
	Tue, 24 Nov 2026 15:54:12 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 24 Nov 2026 16:52:44 +0100
Subject: [PATCH v8 08/18] drm/bridge: inno-hdmi: Use a regmap for register
 access
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261124-jh7110-clean-send-v8-8-de92635dd857@samsung.com>
In-Reply-To: <20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,  Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Robert Foss
	<rfoss@kernel.org>,  Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Philipp Zabel
	<p.zabel@pengutronix.de>,  Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>, Heiko Stuebner <heiko@sntech.de>,  Paul
	Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Andy Yan <andyshrk@163.com>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Yakir Yang
	<kuankuan.y@gmail.com>,  Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,  Michal Wilczynski
	<m.wilczynski@samsung.com>,  Conor Dooley <conor@kernel.org>, William Qiu
	<william.qiu@starfivetech.com>,  Xingyu Wu <xingyu.wu@starfivetech.com>,
	Sandy Huang <hjc@rock-chips.com>,  Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3691;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=oaN4zH4Mt+Cbm2CLbYcckqmbiSoUWD8Izw2ThFQkAu8=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWSzbhb9x5X3Pj3KO+yHzuaeshOyMpsSX//nkWbS6TzSn
	2p1+m5DRykLgxgHg6yYIsvZjdFGkv8YnpYff/wLZg4rE8gQBi5OAZjI9jpGhjUrha8/71pc8WLT
	vkeC924xV564J9R74NPq0JoH/vbeqvMZ/grfTlt5Y/pbNWPDijPuhS1/IoUl7iXyHum5eLlGxCx
	OkhsA
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261124155414eucas1p1061b3aa17e9780ca95c2a723c350495f
X-Msg-Generator: CA
X-RootMTR: 20261124155414eucas1p1061b3aa17e9780ca95c2a723c350495f
X-EPHeader: CA
X-CMS-RootMailID: 20261124155414eucas1p1061b3aa17e9780ca95c2a723c350495f
References: <20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
	<CGME20261124155414eucas1p1061b3aa17e9780ca95c2a723c350495f@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_075416_831856_E73C1627 
X-CRM114-Status: GOOD (  19.54  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Joshua Peisach <jpeisach@ubuntu.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chaoyi Chen <chaoyi.chen@rock-chips.com>, Maud Spierings <maud_spierings@murena.io>, linux-rockchip@lists.infradead.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, linux-riscv@lists.infradead.org, Graham Markall <hello@big-grey.co.uk>, Owen O'Hehir <oo.hehir@gmail.com>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On some SoCs the HDMI controller does not own its register window. The
StarFive JH7110 documents one 64 KB block, u0_hdmitx, that holds both
the controller and the PHY, so the parent device maps it and owns the
regmap while the two children share it.

Access the registers through a regmap. Use the one supplied by the
parent device when there is one, and otherwise create an MMIO regmap
over our own resource. The MMIO regmap uses 32-bit accesses with a
4-byte stride, matching the readl_relaxed() and writel_relaxed() calls
it replaces, so the Rockchip platforms see the same register accesses.

Tested-by: Owen O'Hehir <oo.hehir@gmail.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/Kconfig     |  1 +
 drivers/gpu/drm/bridge/inno-hdmi.c | 39 ++++++++++++++++++++++++++++++++------
 2 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index c7da6b02d7b6b281f328fb3016ea2f167f8da093..34bcee88170317a4796178452ab5d2e673daf1fd 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -105,6 +105,7 @@ config DRM_INNO_HDMI
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
+	select REGMAP_MMIO
 
 config DRM_ITE_IT6263
 	tristate "ITE IT6263 LVDS/HDMI bridge"
diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index 9368814c1414c2e7a00f44dcced996a397ede150..9b90a37bf29d164b6500ddd119bcf8ca094a1735 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -395,7 +395,7 @@ struct inno_hdmi {
 	struct drm_bridge bridge;
 	struct clk *pclk;
 	struct clk *refclk;
-	void __iomem *regs;
+	struct regmap *regmap;
 	struct regmap *grf;
 
 	struct inno_hdmi_i2c *i2c;
@@ -467,14 +467,25 @@ static int inno_hdmi_find_phy_config(struct inno_hdmi *hdmi,
 	return -EINVAL;
 }
 
+static const struct regmap_config inno_hdmi_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
 static inline u8 hdmi_readb(struct inno_hdmi *hdmi, u16 offset)
 {
-	return readl_relaxed(hdmi->regs + (offset) * 0x04);
+	u32 val;
+
+	if (regmap_read(hdmi->regmap, offset * 4, &val))
+		return 0;
+
+	return val;
 }
 
 static inline void hdmi_writeb(struct inno_hdmi *hdmi, u16 offset, u32 val)
 {
-	writel_relaxed(val, hdmi->regs + (offset) * 0x04);
+	regmap_write(hdmi->regmap, offset * 4, val);
 }
 
 static inline void hdmi_modb(struct inno_hdmi *hdmi, u16 offset,
@@ -1080,6 +1091,7 @@ struct inno_hdmi *inno_hdmi_probe(struct platform_device *pdev,
 {
 	struct device *dev = &pdev->dev;
 	struct inno_hdmi *hdmi;
+	void __iomem *regs;
 	int irq;
 	int ret;
 
@@ -1095,9 +1107,24 @@ struct inno_hdmi *inno_hdmi_probe(struct platform_device *pdev,
 	hdmi->dev = dev;
 	hdmi->plat_data = plat_data;
 
-	hdmi->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(hdmi->regs))
-		return ERR_CAST(hdmi->regs);
+	/*
+	 * On platforms where the controller shares a register space with
+	 * other blocks, the parent owns the regmap. Otherwise map our own
+	 * resource.
+	 */
+	if (dev->parent)
+		hdmi->regmap = dev_get_regmap(dev->parent, NULL);
+
+	if (!hdmi->regmap) {
+		regs = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(regs))
+			return ERR_CAST(regs);
+
+		hdmi->regmap = devm_regmap_init_mmio(dev, regs,
+						     &inno_hdmi_regmap_config);
+		if (IS_ERR(hdmi->regmap))
+			return ERR_CAST(hdmi->regmap);
+	}
 
 	hdmi->pclk = devm_clk_get_enabled(hdmi->dev, "pclk");
 	if (IS_ERR(hdmi->pclk)) {

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
