Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD072C79F82
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 13:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KVQecGjqVIAeu3/6avrev5aIuY3CqgkwAjv2ZlDwVDc=; b=LCYh3YerWR8Lms
	qkr+M64+Co9Ftx9W8gdMZ5ZonOecajiex7Pg+Xxzm14ZPpUh3W/L6xErs7/qBkqlFF6pwkjUdGibs
	AhAwaxREkVV7ascu7YkCLveNfj5UdZauYSAatUMDklTTLWb+DZf4zN3lFaAX+5KZOeKaH3W9HG7r6
	8KQDVwFCY7FLVfdKom5jl1VJ16z+a0c44vTRF65zUqUJYOB0qmSeRGggkdQoOVWGtAzsQgs/+MY3w
	BYury74jI8rreZ+beDxC0rqOYxaI9kOy32oeJv8XoYlCrsChG50d134FYfzunVNu2pKcn41BvUg5y
	jKkTQHOAM+ZBC5JZRn0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Txp-00000002BJC-0KNR;
	Fri, 04 Sep 2026 13:28:17 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Tx4-00000002A3s-0zof;
	Fri, 04 Sep 2026 13:27:32 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260904132728euoutp01212041cbb19c07290f9f6006d8c03531~SISXMqgbI0653306533euoutp01Q;
	Fri,  4 Sep 2026 13:27:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260904132728euoutp01212041cbb19c07290f9f6006d8c03531~SISXMqgbI0653306533euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788528448;
	bh=af6IoF9fvKzxk6Nz3PdUhupXRMp7CaOQgPpya1WVVQM=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=BQQq5ujOI0Wa95KtxQen8Rm5D3Mu1lksEpSyItFCvdbvyMOaj0yk9k1KyOqtpDzcU
	 fehGq313zH/rpPwmDLyNm4t+el4Cdhh/iz362mYgxQYsOWhQRzPRfXEblVyjW2BmvX
	 xUha13gVBSxHl0J5adlB3VwkjdwrFn/YgPyhMZU8=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260904132727eucas1p241a5ba1517b5c6a2efde7bb2fdebf299~SISWqzErZ0319603196eucas1p2z;
	Fri,  4 Sep 2026 13:27:27 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260904132725eusmtip15279a878f7e461ea376fa2cbba7ee599~SISU8MvPk1303913039eusmtip1T;
	Fri,  4 Sep 2026 13:27:25 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 04 Sep 2026 15:27:11 +0200
Subject: [PATCH v3 10/19] drm/bridge: inno-hdmi: Add .mode_valid platform
 operation
MIME-Version: 1.0
Message-Id: <20260904-jh7110-clean-send-v3-10-484f9ae72715@samsung.com>
In-Reply-To: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,  Krzysztof
	Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>,  Robert Foss <rfoss@kernel.org>,  Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,  Simona
	Vetter <simona@ffwll.ch>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>,  Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>,  Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,  Heiko
	Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>,  Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,  Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Maud Spierings
	<maud_spierings@murena.io>,  Graham Markall <hello@big-grey.co.uk>,  Icenowy
	Zheng <zhengxingda@iscas.ac.cn>,  Michal Wilczynski
	<m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20260904132727eucas1p241a5ba1517b5c6a2efde7bb2fdebf299
X-Msg-Generator: CA
X-RootMTR: 20260904132727eucas1p241a5ba1517b5c6a2efde7bb2fdebf299
X-EPHeader: CA
X-CMS-RootMailID: 20260904132727eucas1p241a5ba1517b5c6a2efde7bb2fdebf299
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
	<CGME20260904132727eucas1p241a5ba1517b5c6a2efde7bb2fdebf299@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_062730_560734_237B0BE6 
X-CRM114-Status: GOOD (  17.74  )
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

inno_hdmi_bridge_mode_valid() validates the pixel clock against
hdmi->refclk, but that clock is optional and is only present on
platforms that describe a "ref" clock. Platforms where the pixel clock
is produced by a separate device - such as the StarFive JH7110, whose
PHY is both the clock and the PHY provider - have no "ref" clock, so
the check is skipped entirely and every mode is reported as valid.

A mode the platform cannot generate is then advertised to userspace.
The subsequent modeset appears to succeed, since the atomic enable path
cannot fail, and the display silently stays blank.

Add a .mode_valid platform operation so platforms can reject modes they
are unable to drive. Platforms that do not implement it are unaffected.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/inno-hdmi.c | 9 +++++++++
 include/drm/bridge/inno_hdmi.h     | 5 ++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index 410a9eaa13541dfdacc5c96ba9a4d9dc021bc271..e6ca0479e0186023dc41105e4f28f708656db859 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -823,6 +823,7 @@ static enum drm_mode_status inno_hdmi_bridge_mode_valid(struct drm_bridge *bridg
 							const struct drm_display_mode *mode)
 {
 	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
+	const struct inno_hdmi_plat_ops *plat_ops = hdmi->plat_data->ops;
 	unsigned long mpixelclk, max_tolerance;
 	long rounded_refclk;
 
@@ -838,6 +839,14 @@ static enum drm_mode_status inno_hdmi_bridge_mode_valid(struct drm_bridge *bridg
 	if (inno_hdmi_find_phy_config(hdmi, mpixelclk) < 0)
 		return MODE_CLOCK_HIGH;
 
+	if (plat_ops && plat_ops->mode_valid) {
+		enum drm_mode_status status;
+
+		status = plat_ops->mode_valid(hdmi->dev, mode);
+		if (status != MODE_OK)
+			return status;
+	}
+
 	if (hdmi->refclk) {
 		rounded_refclk = clk_round_rate(hdmi->refclk, mpixelclk);
 		if (rounded_refclk < 0)
diff --git a/include/drm/bridge/inno_hdmi.h b/include/drm/bridge/inno_hdmi.h
index 5fca651c56b056d814124aa9c7e91aa7fd7ed1cd..1e9974401c39e3773bb339eaec0b45ff1dd9c975 100644
--- a/include/drm/bridge/inno_hdmi.h
+++ b/include/drm/bridge/inno_hdmi.h
@@ -8,15 +8,18 @@
 
 #include <linux/types.h>
 
+#include <drm/drm_modes.h>
+
 struct device;
 struct drm_encoder;
-struct drm_display_mode;
 struct inno_hdmi;
 struct platform_device;
 
 struct inno_hdmi_plat_ops {
 	void (*enable)(struct device *pdev, struct drm_display_mode *mode);
 	void (*disable)(struct device *pdev);
+	enum drm_mode_status (*mode_valid)(struct device *pdev,
+					   const struct drm_display_mode *mode);
 };
 
 struct inno_hdmi_phy_config {

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
