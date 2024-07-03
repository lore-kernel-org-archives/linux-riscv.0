Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADC6C30653
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 10:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2oZaj00vniDq4phTaJe6mqX5h+EHz5GTftZAka/Sk4A=; b=YnjE8lt8kXHRHe
	XnMPcFbvkGAsV2vRptzPMOQfefKOCiXQKhSFceJrtKXg4S/yoGJP7dE/ytpuFV8dNa6t8WgptaIQK
	7qN18AmRWSu5n4PCfm8gYZo4Wf1jrPI/X8Lihgj4OzxWyJ0rHLsGCWebWDLd5JiYwiWG5ZcmueAAe
	ZhW2QMfT82qPOxqKQq51Lcg1KHT2M/En9V7oCi2m58bP2ANytxPB4uTal9pW5f5H4cxu5mh+lOTDC
	vWPS49Rl7NKQFAvU6Fe+IuKiwY1mt1/6H9j4EFVBo9lkuzRY0YJYP7c0Dtn3PUEQmlsZYv2dHAaoT
	psDyFNcJzkqy0BZ9QznQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxMx-00000009oEI-48bP;
	Wed, 03 Jul 2024 10:37:48 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxMs-00000009o9l-3sPn;
	Wed, 03 Jul 2024 10:37:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63F4940008;
	Wed,  3 Jul 2024 10:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720003061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rSl3CDHUnEkCbFzcda9N1h+bslENch8LOeZ/5QfMN+g=;
	b=hQT95D3u1VMRIY9xcB1E834k+wK1UnCHPD1+uqs62UJ0G281n+vVWCbTnLIcL5tDXrSGX0
	ukrOE06tTmXg6wVVic1Yf1zGDJvxZxPI2cs/Vh2G9Whgnc+CbuHfCZ5r1Y+IfJI3YN9GYH
	8eFlmQvV3foLOCuokJlfWVdnjsf2ov4KcybfiiUGmEnTLUhWoxIkSD4AU2A3WdQ0JdEhNU
	Yw4iTB7EVnyoDn5NNwCxQEsljM1j1WbYUIrPAE0OAYdx5VIF+fs/XKQl2qXueJGuZ497uO
	xs/dP5ikFWEjtBAsz65ywcc5sPmTSSy+n884HlDWWF6SwE8fKJHq3xSlkJEWLQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 03 Jul 2024 12:36:48 +0200
Subject: [PATCH 04/20] clk: sunxi: clk-simple-gates: convert to
 of_property_for_each_u32_new()
MIME-Version: 1.0
Message-Id: <20240703-of_property_for_each_u32-v1-4-42c1fc0b82aa@bootlin.com>
References: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
In-Reply-To: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
To: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Cameron <jic23@kernel.org>, 
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Richard Leitner <richard.leitner@linux.dev>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
 Damien Le Moal <dlemoal@kernel.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 llvm@lists.linux.dev, linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-usb@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_033743_302869_BEDDDCFE 
X-CRM114-Status: GOOD (  11.76  )
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

Simplify code using of_property_for_each_u32_new() as the two additional
parameters in of_property_for_each_u32() are not used here.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/clk/sunxi/clk-simple-gates.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi/clk-simple-gates.c b/drivers/clk/sunxi/clk-simple-gates.c
index 0399627c226a..a30d14937e0b 100644
--- a/drivers/clk/sunxi/clk-simple-gates.c
+++ b/drivers/clk/sunxi/clk-simple-gates.c
@@ -21,11 +21,9 @@ static void __init sunxi_simple_gates_setup(struct device_node *node,
 {
 	struct clk_onecell_data *clk_data;
 	const char *clk_parent, *clk_name;
-	struct property *prop;
 	struct resource res;
 	void __iomem *clk_reg;
 	void __iomem *reg;
-	const __be32 *p;
 	int number, i = 0, j;
 	u8 clk_bit;
 	u32 index;
@@ -47,7 +45,7 @@ static void __init sunxi_simple_gates_setup(struct device_node *node,
 	if (!clk_data->clks)
 		goto err_free_data;
 
-	of_property_for_each_u32(node, "clock-indices", prop, p, index) {
+	of_property_for_each_u32_new(node, "clock-indices", index) {
 		of_property_read_string_index(node, "clock-output-names",
 					      i, &clk_name);
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
