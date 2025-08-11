Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137EECA0ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 18:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7vY5joIgIzotw43UwE9uz+d2af9YHyJxaxfTXNG2kbQ=; b=TMQbGTVJ+wOvjo
	ZD8jDvsyszNlcir7o33Tbv0aQTwALiC+Qkd3ao9GquzHUORwR6T2OWksczX7zDN9gd9IAr5+BVKxU
	HkQnaHTIIPLl55ffa7eHTw/008rDJ5nUpR7J85wcFBlHcRtUV42OWVZH4sU9Wg9cciAz6lMWDIb+t
	XcQ0F86elEJjuSdQ3jviowVlQAvR2jabkX/5XDEbILOSAvfE97D+0JM6NdCARFa8qjGKDi0dGG8Jj
	VS38nVJ+Qcwi5DEUsBE/gPQuAW5qC4KbejRnAbFaKSC52FjAoutgUds2voXVdcNJdAdP4toGxHOLG
	2L6sO9tbMtej83ISd2Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWyR-00000008ijA-3A9d;
	Mon, 11 Aug 2025 18:10:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUIi-00000008BFu-2St8;
	Mon, 11 Aug 2025 15:19:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 56ADA668B9;
	Mon, 11 Aug 2025 15:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41B2DC4DE16;
	Mon, 11 Aug 2025 15:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925514;
	bh=ODXrWGK8yZS7iMRmtiXT5t45U1KEmnxUjzcglLQNDZk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UoCLDVmdTYjiGpxtC98IKLX/+M0rkeZWyO4nxOlZCxjVbJfPWbLeVzjEuq5T2bq1A
	 ngix+/6O+i0j4vNeGxkuXdKBJzC6BXJGrg8UwE0/5igkwgP9tr5Oq4HDeSL9+Lk0Gd
	 H+r0gIAfBbOjRqrukpyaaRPiqHs4Wtzq0oULjRng2IIXgE8c+q/1LBFCCn/rldo5q2
	 nu1kdPWvXhsPbtBP7COlpuk7wZXffsK9QPlAOsKtrTDkcN8OyB16XcmkIdrDtt7/iA
	 rK4R3hSkzmcbxZkHdjalYXamf0TY1bmhz/WXX9NQh1zUQc+IgI53Q9vOyIkGL3IFGB
	 gWJ2SRmFPBPPg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15924CA0EC8;
	Mon, 11 Aug 2025 15:18:34 +0000 (UTC)
From: Brian Masney via B4 Relay <devnull+bmasney.redhat.com@kernel.org>
Date: Mon, 11 Aug 2025 11:19:20 -0400
Subject: [PATCH 088/114] clk: mvebu: cpu: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250811-clk-for-stephen-round-rate-v1-88-b3bf97b038dc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754925498; l=1588;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=OokNVgkRjbnKoQ5w/W5Ca7W4UGOMZKX1UYUaStmr/DY=;
 b=vAC+dhO0kijuJtanVnu+ohRpU9KsfSjVpkI97ouYggo3T3ugsJgM4O7SXkUCLs0VbV70HQ9NO
 jlxyYltDx3gAJhRYmSE8yYRmyBaTVjWje72NEJG9gqk1vPOp5tF7Ni6
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
 drivers/clk/mvebu/clk-cpu.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mvebu/clk-cpu.c b/drivers/clk/mvebu/clk-cpu.c
index db2b38c21304ecb8cc0bad0ff7de5a0a3c868516..0de7660e73d20b5e2fba349544001f200d859b2d 100644
--- a/drivers/clk/mvebu/clk-cpu.c
+++ b/drivers/clk/mvebu/clk-cpu.c
@@ -56,19 +56,21 @@ static unsigned long clk_cpu_recalc_rate(struct clk_hw *hwclk,
 	return parent_rate / div;
 }
 
-static long clk_cpu_round_rate(struct clk_hw *hwclk, unsigned long rate,
-			       unsigned long *parent_rate)
+static int clk_cpu_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	/* Valid ratio are 1:1, 1:2 and 1:3 */
 	u32 div;
 
-	div = *parent_rate / rate;
+	div = req->best_parent_rate / req->rate;
 	if (div == 0)
 		div = 1;
 	else if (div > 3)
 		div = 3;
 
-	return *parent_rate / div;
+	req->rate = req->best_parent_rate / div;
+
+	return 0;
 }
 
 static int clk_cpu_off_set_rate(struct clk_hw *hwclk, unsigned long rate,
@@ -159,7 +161,7 @@ static int clk_cpu_set_rate(struct clk_hw *hwclk, unsigned long rate,
 
 static const struct clk_ops cpu_ops = {
 	.recalc_rate = clk_cpu_recalc_rate,
-	.round_rate = clk_cpu_round_rate,
+	.determine_rate = clk_cpu_determine_rate,
 	.set_rate = clk_cpu_set_rate,
 };
 

-- 
2.50.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
