Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40B5606A323
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 15:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k8072viA;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=QTAegHl3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:To:In-Reply-To:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Cro2qAlLJpl8+4N6O5dzxgkaS8d3Evnj7X83Il13bv4=; b=k8072viAOzOlR8TR0kYRK6ZI4R
	RWvj9aj7v236UQ7FLJc9tPF0oR1j+dJSc5aGOWr/whGd7q7mWuD57xXUaPlmIda41u2GgkNUCF6nn
	wk9qQFrCgRjfiBBjUkXfX350r2+ubqHkDK95F7X5kLtVVDOp0KeuYs/y9xQtd2/nwHEwuyg8p/Lhy
	FxZUObcUQoBAX+7O5KurvwwCbkiXyjgYwmaTxv6H/xqYcHcttV2NG24Xvlthq+JSCXxms8AS6Z4RV
	CWOOFYV3PO14lIHC0YiSCeaDwAdbkkbAp6/iYvj7T1h4f/RPDcpnNMqHLu+T60jdle8s6+TPqKHqa
	6vCZgdgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVssc-000000070cP-0OCr;
	Tue, 24 Nov 2026 15:56:26 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsqf-00000006yUS-3xUW;
	Tue, 24 Nov 2026 15:54:30 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261124155423euoutp02eec8ad6e3011de31a32a1c9604515160~rBixZJ2hW0431604316euoutp02U;
	Tue, 24 Nov 2026 15:54:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261124155423euoutp02eec8ad6e3011de31a32a1c9604515160~rBixZJ2hW0431604316euoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795535664;
	bh=KiI8d4cKVeyNsxfRDWA6gviPifCD35OJXPxKhstld7E=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=QTAegHl3FbYGn9eL/Lg1jImVCWu9mFd1UxcXNY0kUEUeBNQlUzd7EatI58loj1Udu
	 I3mVDXnn0yQ1pHQEGnbpak/2ekbH5lIhY6+mE2iJi8PupOf39Mes7AXC+w8oZ6eorA
	 O5vhLCMnYb7SJLXZZaMg9CqVwYDyAyTxaBL+yuSE=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261124155423eucas1p2dc9d18f8a847d77c60615bc7f37ed657~rBixArJQT0856008560eucas1p2G;
	Tue, 24 Nov 2026 15:54:23 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261124155421eusmtip1da8a2deb01b07769b105bf7000d86256~rBivWoOMY2656326563eusmtip1R;
	Tue, 24 Nov 2026 15:54:21 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 24 Nov 2026 16:52:49 +0100
Subject: [PATCH v8 13/18] drm/bridge: inno-hdmi: Make the supported HDMI
 version selectable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261124-jh7110-clean-send-v8-13-de92635dd857@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2279;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=E63qKCoHeBTDbROc0mY6FZDQcS54lq6G9OYzSsmEdo8=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWSzbhb1r9sSXftMnUMz7l37B+t/fyt3Jk8vVxMPlQpbe
	53p9RfujlIWBjEOBlkxRZazG6ONJP8xPC0//vgXzBxWJpAhDFycAjCRJXcZ/nCba9k2n58fsbBB
	WtjBhu2h6N7/R5o+7Pl6eaqb9l4/YyVGhiPSPtn/i2xe3eA4Ki903ObuCmXHpB8bN5Ts+Rft9KL
	blRcA
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261124155423eucas1p2dc9d18f8a847d77c60615bc7f37ed657
X-Msg-Generator: CA
X-RootMTR: 20261124155423eucas1p2dc9d18f8a847d77c60615bc7f37ed657
X-EPHeader: CA
X-CMS-RootMailID: 20261124155423eucas1p2dc9d18f8a847d77c60615bc7f37ed657
References: <20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
	<CGME20261124155423eucas1p2dc9d18f8a847d77c60615bc7f37ed657@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_075426_332015_815AA351 
X-CRM114-Status: GOOD (  14.78  )
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

inno_hdmi_probe() advertises HDMI 1.2 for every integration, which caps
the TMDS character rate at 165 MHz. That matches the Rockchip variants,
whose PHY configuration tables stop at 165 MHz, but not every SoC that
uses this controller: the StarFive JH7110 supports HDMI 1.4b and drives
pixel clocks up to 297 MHz for 3840x2160 and 4096x2160 at 30 Hz.

Add a plat_data field for the supported version and keep HDMI 1.2 when
it is left unset, so the Rockchip integrations are unchanged.

Tested-by: Owen O'Hehir <oo.hehir@gmail.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/inno-hdmi.c | 3 ++-
 include/drm/bridge/inno_hdmi.h     | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index 19add900bf728ca7dcdd1b3605d3fbcb2e879db4..8b9850637dcc677bbba61b4a93a3db6c0dcd020c 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -1169,7 +1169,8 @@ struct inno_hdmi *inno_hdmi_probe(struct platform_device *pdev,
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Inno";
 	hdmi->bridge.product = "Inno HDMI";
-	hdmi->bridge.supported_hdmi_ver = HDMI_VERSION_1_2;
+	hdmi->bridge.supported_hdmi_ver = plat_data->supported_hdmi_ver ?:
+					  HDMI_VERSION_1_2;
 
 	hdmi->bridge.ddc = inno_hdmi_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))
diff --git a/include/drm/bridge/inno_hdmi.h b/include/drm/bridge/inno_hdmi.h
index cc5099d05f641eef5de91ed5becde7337c04b013..89a38f26091eda1ef7818fea9d1d9c99e4ae019e 100644
--- a/include/drm/bridge/inno_hdmi.h
+++ b/include/drm/bridge/inno_hdmi.h
@@ -6,6 +6,7 @@
 #ifndef __INNO_HDMI__
 #define __INNO_HDMI__
 
+#include <linux/hdmi.h>
 #include <linux/types.h>
 
 #include <drm/drm_modes.h>
@@ -34,6 +35,8 @@ struct inno_hdmi_plat_data {
 	struct inno_hdmi_phy_config *default_phy_config;
 	/* Clock the register interface from the TMDS clock, not the system clock. */
 	bool reg_clk_source_tmds;
+	/* HDMI version the integration supports; HDMI 1.2 if left unset. */
+	enum hdmi_version supported_hdmi_ver;
 };
 
 struct inno_hdmi *inno_hdmi_bind(struct platform_device *pdev,

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
