Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4CEC2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 10:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OIiDyBWdlpR1A9e9wnvsK5KcTbL4yNJdS0T83d6oq9M=; b=YVn81V/C8BmilU
	rUn8gQpZUpJlQ6rrqiUUa7beuzMvc1v7939IAsZ38G1vbkMv78SRdrWayVydz8VVuEFFAjfur2XkJ
	kC6BHJ6zOfVe6OBcy8YeoWdzCJDXdbg2MN5nBuqKVLFbzgveBCOFJ0LZhVYIBn+KGS2G2cJHtQs61
	VfNpj+eeiBzBi+gY4t1de10RRUYdjIx66XfB+5I0jhVTCU96qtMY/5Q5ULQp99inPyKWRo3Wq0M+3
	aLrPPRV8lECgbJ02d50jt5oj6XXqEcaIofKyo8gloJV0n6qcjVKC3H66DqeRMPPZWyhtTs+ZAtoNn
	nvabVL2umXjo/csFVBhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxOJ-00000009pIn-1PDZ;
	Wed, 03 Jul 2024 10:39:11 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxNf-00000009ooe-3Icr;
	Wed, 03 Jul 2024 10:38:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4CB84000B;
	Wed,  3 Jul 2024 10:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720003109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=imP4H/ERPSE6KZ0W7q22wukZU6P/ZNa1h2LRRg5LPSE=;
	b=QHZuw6OixcFOf1fmX7hr0vv6C5X6qtVBD6nwyc/mtaoJV27PNoTaRYDMr1H7OzlZvi4/bT
	2YGle6Qhcx2ekS2M2kUmkbY0YflInP7/4aNiheGiNRTI+kIj4ZyHOjuT/iuTTvGttyFTx1
	mZHEZour3jCbqjqEbH0udwlKJ7YcYpKFsxC1x6/Ze7kdpU8CZ7qKJxBxWkszlyEzzb6j4u
	TDWInmuOi4dYzH/pOWH5Nb7Zq+N9j0N0VkB88X9GYj6xQIDu5zvSqSLb0dXuBDfyBQLOey
	Yp9zkmm43vokpDk/jIF2hByFQDKg4eXCJ84Gqy+i39DwtK9oDiqQ5v8gutjCrg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 03 Jul 2024 12:37:00 +0200
Subject: [PATCH 16/20] mfd: ti_am335x_tscadc: convert to
 of_property_for_each_u32_new()
MIME-Version: 1.0
Message-Id: <20240703-of_property_for_each_u32-v1-16-42c1fc0b82aa@bootlin.com>
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
X-CRM114-CacheID: sfid-20240703_033832_526718_54C80081 
X-CRM114-Status: GOOD (  12.53  )
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
 drivers/mfd/ti_am335x_tscadc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mfd/ti_am335x_tscadc.c b/drivers/mfd/ti_am335x_tscadc.c
index 4bbd542d753e..a2e6112f885f 100644
--- a/drivers/mfd/ti_am335x_tscadc.c
+++ b/drivers/mfd/ti_am335x_tscadc.c
@@ -119,8 +119,6 @@ static	int ti_tscadc_probe(struct platform_device *pdev)
 	struct clk *clk;
 	struct device_node *node;
 	struct mfd_cell *cell;
-	struct property *prop;
-	const __be32 *cur;
 	bool use_tsc = false, use_mag = false;
 	u32 val;
 	int err;
@@ -167,7 +165,7 @@ static	int ti_tscadc_probe(struct platform_device *pdev)
 	}
 
 	node = of_get_child_by_name(pdev->dev.of_node, "adc");
-	of_property_for_each_u32(node, "ti,adc-channels", prop, cur, val) {
+	of_property_for_each_u32_new(node, "ti,adc-channels", val) {
 		adc_channels++;
 		if (val > 7) {
 			dev_err(&pdev->dev, " PIN numbers are 0..7 (not %d)\n",

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
