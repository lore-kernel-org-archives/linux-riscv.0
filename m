Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F632CA0EDA
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 18:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JZFgnNj1bbut84UKhTeJkBMAwC6JOZ1gJUDwNU9IFeI=; b=Vk0KPyPKFb7Psv
	9V0oc2lsN+NLnTVwjuh3BzglmaRfqQ7yLcCSlXuzYtqENbXQhw9hYfH25ERmbPIn/JakAeeGcgT4H
	3PHp4qQTBWW9v9dQhzfPhp/xMT9rsShOgZkSICbE9UDIXBMUKYZlALq/udF34jzvve0BAKKwAhZA/
	v5wrXAoBlUlznNVBT3MUQnjVCdtAue9ep2N0moHT/9H/3aFW+U3XuSGnfFp3NeCLh6Cy29jh7nBaD
	J/mocB4/WDaaXsccsqB+a7HtNtNmMZ9hIjgvD4iVudq5Gi0TXkCd69WdXEjMJsNJXcvVb1n0d3CT7
	r+ql6N/BcxImX057Xj3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWws-00000008gEa-2P5z;
	Mon, 11 Aug 2025 18:08:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUIH-00000008AeW-0lu2;
	Mon, 11 Aug 2025 15:18:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B835668AC;
	Mon, 11 Aug 2025 15:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C39F0C4AF12;
	Mon, 11 Aug 2025 15:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925509;
	bh=/xbZfJSWvgdrl56vtnWeCWhWPwuGG/9fbB17u7Zh+os=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eicOe+rmPzTbK81aaaLg0N2PLwABrySSQigI8l1wTp9DfW/by0z7m2ZSXskzMSySo
	 4u44god1D1RspSWXnpLeVHdcNGAjHAV8gl718mPMCdwoWa3R8wBQ7+67xLr0oc8hsx
	 YrB5d6GfK0T4AUPdvGcH8MMPYHfRCyLkPztHjo+Zr/KdmZyC1Oxo6VtZ6aP5Hhhg5q
	 NQR26tAX7R7zLSBNP++ER9psV81xlGW5bN4db6NJWdtSqnNY6m3ZhNcVgADghV78zq
	 2IuP1i7N9YYS1ES7TwaNkGREcudFR+QzPUwMdSXXT9PgP9+EvsVkBFXgtFHHMK1M3B
	 84CMzInmee+xA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD9D3C87FD2;
	Mon, 11 Aug 2025 15:18:29 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:36 -0400
Subject: [PATCH 044/114] clk: si544: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250811-clk-for-stephen-round-rate-v1-44-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Max Filippov <jcmvbkbc@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Alex Helms <alexander.helms.jy@renesas.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
 linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=1503;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=fVELDYjSyI3lUqmGhDZt2zJiIzyldRApSKQVIiZoQQc=;
 b=mXhZDIe2ygJEtQnwK6iMSzuNOozId22qmcQlmwQLfFq1GIf1Zsc4/MiB2qDJEao85Qr9DATBb
 PBR/+f6XuiFDi3gSkSnXvUTuo2rqaXmEr1A/Q8nkhuGhfsTsRfTJ2Bl
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Endpoint-Received: by B4 Relay for bmasney@redhat.com/20250528 with
 auth_id=472
X-Original-From: Brian Masney <bmasney@redhat.com>
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
Reply-To: bmasney@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Brian Masney <bmasney@redhat.com>

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk-si544.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-si544.c b/drivers/clk/clk-si544.c
index ca3473efa314b44b7eff6bc3ec9eafa518e0bd9e..09c06ecec1a52a6a521428e349cbd4cf166bbea3 100644
--- a/drivers/clk/clk-si544.c
+++ b/drivers/clk/clk-si544.c
@@ -307,16 +307,16 @@ static unsigned long si544_recalc_rate(struct clk_hw *hw,
 	return si544_calc_rate(&settings);
 }
 
-static long si544_round_rate(struct clk_hw *hw, unsigned long rate,
-		unsigned long *parent_rate)
+static int si544_determine_rate(struct clk_hw *hw,
+				struct clk_rate_request *req)
 {
 	struct clk_si544 *data = to_clk_si544(hw);
 
-	if (!is_valid_frequency(data, rate))
+	if (!is_valid_frequency(data, req->rate))
 		return -EINVAL;
 
 	/* The accuracy is less than 1 Hz, so any rate is possible */
-	return rate;
+	return 0;
 }
 
 /* Calculates the maximum "small" change, 950 * rate / 1000000 */
@@ -408,7 +408,7 @@ static const struct clk_ops si544_clk_ops = {
 	.unprepare = si544_unprepare,
 	.is_prepared = si544_is_prepared,
 	.recalc_rate = si544_recalc_rate,
-	.round_rate = si544_round_rate,
+	.determine_rate = si544_determine_rate,
 	.set_rate = si544_set_rate,
 };
 

-- 
2.50.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
