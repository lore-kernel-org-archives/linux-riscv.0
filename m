Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192DFCA0EDA
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 18:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1jAGGq6bpbHv5hnkAhg2u8b3Ysc9MXlXFK5/K2+lvBU=; b=Nxzf26GCee/c4W
	eFsmC3WTC+lL9+1uNO95jWEnfQqP/gFkyL6aylgx3idVjkCsMsoFeB+07akS6Z226y62y7Y3RGRkH
	wfWlCohINX8kVki71LMOB/w+8bqNv5/61wRYJtbVKN0MKUxA6kSCMy0z5IngsyXgY+mRphuHG/oPw
	jizSEe9dD4xOq4f88EhExxmbbkhVvokTmN7eDo96QpJTKHHs+XX2Eeh9mYfgJupAs8YdI390tz5zA
	UKCI0LG9G3IAdlUfi1MT6hCYDBacLbSwfi+/CrfR7yyfDb9/6qED1EzZLTRfwjnK5BgMAN0NR923n
	jd05w6kBouIPk8yWisqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWwv-00000008gIi-14ti;
	Mon, 11 Aug 2025 18:08:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUIH-00000008AYp-3RZV;
	Mon, 11 Aug 2025 15:18:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F18561471;
	Mon, 11 Aug 2025 15:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6C19C4AF0D;
	Mon, 11 Aug 2025 15:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925509;
	bh=Apc2qzNpfS9aAHI8h/9ad7fvCKlHY8Hm4ds5yDJuMxY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Pc2y+ckBwV6Rdu49pgbnKxX8piZe7F+BV9WP5MLfbHVH9rYb3qLklc2ucy3MxIrpo
	 Ez8CA8oE1fk0yFR1LgKKedg8trPwICBnZsEhl2IgwFt234xrsj49yEv5hX56Iq1uD1
	 F2o0UQ7o1zBc6v8INWCZvtQ4emAbXpiDRhX9cRER0+VfVSzRPLc8fgP+psn+W1O5OP
	 xuv8nMzO7ym+lDgJBQe8UIVtUgf9PigsaNLs3f8EGfEy5+l7gT5a8aJr51mKVmN3wG
	 2SraZuhAlNj+AcxdWycxr/btBCZOM7mY2+5QhqPP7xDxbBR01mOk2938UL41QbFmXh
	 KgiaTMhfUfQzQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9657DC87FDA;
	Mon, 11 Aug 2025 15:18:29 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:18:35 -0400
Subject: [PATCH 043/114] clk: si5341: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250811-clk-for-stephen-round-rate-v1-43-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=1946;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=VSclFs7R89Y+Lsm61Wi5Kzy/FJb3iOqfzn5aANhegPc=;
 b=flWSSXi6CEENtdFwyXcyp3r9Kub5eRxDOAYKZ/Npi1LtbV7xxzxgOYvzm2I3AsyOaNwIt8AHw
 esev6EsAl3zCadBDavASsob5DvzObWhBdDc6yl/uXR7h9oJCiYxZi60
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
 drivers/clk/clk-si5341.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index 5004888c7eca5f85a444ec6de684b8dd79635622..2499b771cd83e313eafd83cb0519b1b94da73a61 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -663,8 +663,8 @@ static unsigned long si5341_synth_clk_recalc_rate(struct clk_hw *hw,
 	return f;
 }
 
-static long si5341_synth_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-		unsigned long *parent_rate)
+static int si5341_synth_clk_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct clk_si5341_synth *synth = to_clk_si5341_synth(hw);
 	u64 f;
@@ -672,15 +672,21 @@ static long si5341_synth_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	/* The synthesizer accuracy is such that anything in range will work */
 	f = synth->data->freq_vco;
 	do_div(f, SI5341_SYNTH_N_MAX);
-	if (rate < f)
-		return f;
+	if (req->rate < f) {
+		req->rate = f;
+
+		return 0;
+	}
 
 	f = synth->data->freq_vco;
 	do_div(f, SI5341_SYNTH_N_MIN);
-	if (rate > f)
-		return f;
+	if (req->rate > f) {
+		req->rate = f;
 
-	return rate;
+		return 0;
+	}
+
+	return 0;
 }
 
 static int si5341_synth_program(struct clk_si5341_synth *synth,
@@ -741,7 +747,7 @@ static const struct clk_ops si5341_synth_clk_ops = {
 	.prepare = si5341_synth_clk_prepare,
 	.unprepare = si5341_synth_clk_unprepare,
 	.recalc_rate = si5341_synth_clk_recalc_rate,
-	.round_rate = si5341_synth_clk_round_rate,
+	.determine_rate = si5341_synth_clk_determine_rate,
 	.set_rate = si5341_synth_clk_set_rate,
 };
 

-- 
2.50.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
