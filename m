Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6824C606A31E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 15:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xPx5HdeQ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=qWX2bgYw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:To:In-Reply-To:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vPsWR2+dtIXYH/a1iA6Q7u09flr0fSZqpToxRdMUu/s=; b=xPx5HdeQ0MAvBHgv3bLPvXqnF/
	nVc42s5iAjFCwpc8j1mMNKPGsTpxK5jwfR0bPElCh/M1xWwFvOWBVySpmttTxKnB+eGl9BDQtweOK
	yzBIBBA76SVk9WAYv5nBEL+BcIby+OjBYm30ivVH3S1dc1uZzCCqH49waCFOCmsk/iue3NWVwIhz1
	kMG0wNWlHU3/O3yI9XTbo+wQxo7UewTJYfTVbRNrkFGFk3hGhOdPlDTRi3cIRPDjOvUzQyr4XbHlW
	0UADY21gtKaGfFxYg/wT0nxOUOK5f305Z4ZgcGzkoHe8LAhX6JjAvnViZHq4heVaEn0Y9vBAnmHwr
	i5YUgepQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVssM-000000070MG-1yES;
	Tue, 24 Nov 2026 15:56:10 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsqc-00000006yPB-04q8;
	Tue, 24 Nov 2026 15:54:26 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261124155420euoutp02ed0ecbaab92d1c1cf87102c5dc34c838~rBit0TbQu0431004310euoutp02Z;
	Tue, 24 Nov 2026 15:54:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261124155420euoutp02ed0ecbaab92d1c1cf87102c5dc34c838~rBit0TbQu0431004310euoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795535660;
	bh=5CJANeA2ON+YlQW2j7eJ1/GHr+S6g6Lga9FVar8L/40=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=qWX2bgYw2t+0Nqlg6Vnkcux4xnPMv/lYfTLNK3NDN0nKRYZAYMh78BetiPcK7yBtd
	 hn4o5g4rX5zGF+HKrY1RDJEde5mrGzrMr6ga4x8FLAtNk93UoiacMPRQTAgpcel30f
	 3RkeLXaBY+eIcIBs5opNjLEQPpwwp/EhNqQ1lOfU=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261124155419eucas1p1be4546e9ca9aa75f3f98c9a63d7e8ae6~rBithxDoI0891008910eucas1p1X;
	Tue, 24 Nov 2026 15:54:19 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261124155418eusmtip1a63961ed3150b3c24dc76d254ccce2ed~rBir2paU90146501465eusmtip1e;
	Tue, 24 Nov 2026 15:54:17 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 24 Nov 2026 16:52:47 +0100
Subject: [PATCH v8 11/18] drm/bridge: inno-hdmi: Make the PHY configuration
 table optional
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261124-jh7110-clean-send-v8-11-de92635dd857@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3000;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=/L2+KcjssdSwNg9HKRbt0chlmto0vxPs1WCA0fQ47cM=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWSzbhZVZo7bGTuncVHhR/bFtvafl5zyFOyb4h4p/r/st
	pzQwb6fHaUsDGIcDLJiiixnN0YbSf5jeFp+/PEvmDmsTCBDGLg4BWAiU1Yy/Pe5MnWd77MT5Yuy
	wuK2OCf2R7FIyIbMOlWTeqHoPT97VgQjQ/PbjrUTjuUe9lpaffSn4Rah5K/ncpZ7+dhtfprLfvS
	AJSsA
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261124155419eucas1p1be4546e9ca9aa75f3f98c9a63d7e8ae6
X-Msg-Generator: CA
X-RootMTR: 20261124155419eucas1p1be4546e9ca9aa75f3f98c9a63d7e8ae6
X-EPHeader: CA
X-CMS-RootMailID: 20261124155419eucas1p1be4546e9ca9aa75f3f98c9a63d7e8ae6
References: <20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
	<CGME20261124155419eucas1p1be4546e9ca9aa75f3f98c9a63d7e8ae6@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_075423_045787_D6AC3F14 
X-CRM114-Status: GOOD (  15.44  )
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
Cc: Joshua Peisach <jpeisach@ubuntu.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chaoyi Chen <chaoyi.chen@rock-chips.com>, Maud Spierings <maud_spierings@murena.io>, linux-rockchip@lists.infradead.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Byron Stanoszek <gandalf@winds.org>, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, linux-riscv@lists.infradead.org, Graham Markall <hello@big-grey.co.uk>, Owen O'Hehir <oo.hehir@gmail.com>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The pre-emphasis and drive-strength values in inno_hdmi_phy_config, and
the registers they are written to, belong to the PHY integrated into the
controller. A platform whose PHY is a separate device has neither, and
its own .mode_valid already validates the pixel clock against the real
PHY, so the table only bounds the generic check.

Let such a platform omit the table: skip the table-driven pre-emphasis
and drive-strength writes in the power-up path and the table lookup in
.mode_valid when it is absent. Platforms that supply one are unaffected.

Tested-by: Byron Stanoszek <gandalf@winds.org>
Tested-by: Owen O'Hehir <oo.hehir@gmail.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/inno-hdmi.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index 0932ec47f151b531f63e7c42c715a6ae7fe252fd..19cea14d142667f7f4534db8fbcf7806f2f37943 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -533,8 +533,14 @@ static void inno_hdmi_power_up(struct inno_hdmi *hdmi,
 			       unsigned long mpixelclock)
 {
 	struct inno_hdmi_phy_config *phy_config;
-	int ret = inno_hdmi_find_phy_config(hdmi, mpixelclock);
+	int ret;
+
+	inno_hdmi_sys_power(hdmi, false);
+
+	if (!hdmi->plat_data->phy_configs)
+		goto out;
 
+	ret = inno_hdmi_find_phy_config(hdmi, mpixelclock);
 	if (ret < 0) {
 		phy_config = hdmi->plat_data->default_phy_config;
 		DRM_DEV_ERROR(hdmi->dev,
@@ -544,8 +550,6 @@ static void inno_hdmi_power_up(struct inno_hdmi *hdmi,
 		phy_config = &hdmi->plat_data->phy_configs[ret];
 	}
 
-	inno_hdmi_sys_power(hdmi, false);
-
 	hdmi_writeb(hdmi, HDMI_PHY_PRE_EMPHASIS, phy_config->pre_emphasis);
 	hdmi_writeb(hdmi, HDMI_PHY_DRIVER, phy_config->voltage_level_control);
 	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x15);
@@ -555,6 +559,7 @@ static void inno_hdmi_power_up(struct inno_hdmi *hdmi,
 	hdmi_writeb(hdmi, HDMI_PHY_SYNC, 0x00);
 	hdmi_writeb(hdmi, HDMI_PHY_SYNC, 0x01);
 
+out:
 	inno_hdmi_sys_power(hdmi, true);
 };
 
@@ -831,7 +836,8 @@ static enum drm_mode_status inno_hdmi_bridge_mode_valid(struct drm_bridge *bridg
 	if (mpixelclk < HDMI_TMDS_CHAR_RATE_MIN_HZ)
 		return MODE_CLOCK_LOW;
 
-	if (inno_hdmi_find_phy_config(hdmi, mpixelclk) < 0)
+	if (hdmi->plat_data->phy_configs &&
+	    inno_hdmi_find_phy_config(hdmi, mpixelclk) < 0)
 		return MODE_CLOCK_HIGH;
 
 	if (plat_ops && plat_ops->mode_valid) {
@@ -1108,11 +1114,6 @@ struct inno_hdmi *inno_hdmi_probe(struct platform_device *pdev,
 	int irq;
 	int ret;
 
-	if (!plat_data->phy_configs || !plat_data->default_phy_config) {
-		dev_err(dev, "Missing platform PHY ops\n");
-		return ERR_PTR(-ENODEV);
-	}
-
 	hdmi = devm_drm_bridge_alloc(dev, struct inno_hdmi, bridge, &inno_hdmi_bridge_funcs);
 	if (IS_ERR(hdmi))
 		return ERR_CAST(hdmi);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
