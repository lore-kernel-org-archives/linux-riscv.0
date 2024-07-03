Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F05C2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 10:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FZc8t6gApxge/NyF/GFte67hBf/LRE9bLurHRfqJsNA=; b=kl1RXhl5Mb75kj
	JE+bOhLpiIoOzWW7801I2l6AImcP0WctVTvxC9fktF6ZmQdauk47p7PLIqr534w+ycNTQShbfEyi8
	X9XnmhLglzLfqK2qvigCBWyfvyzq5bwX92NmXF9ZfkHGJqRjkPcr1xwqaNmt35FjaG65kWcZ3VzYy
	McJlxpJDPEE0daPnyWlHsrG4hpm4xLJl1J9eJw8lJSL8NC1khOwujTNxxTnfWhfQ/zdbzz70gFBGF
	+kQrMX0u+VDW4ehWbCS1p2F3r92S4FKNz3oOX6/cwYqICfEJi53L5kYSsTK3GJ0ppPzFR4Z48wV8C
	OQiQNIgT7l3u1g366O5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxOR-00000009pPp-3bgx;
	Wed, 03 Jul 2024 10:39:19 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxNj-00000009orn-2zGH;
	Wed, 03 Jul 2024 10:38:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B34140007;
	Wed,  3 Jul 2024 10:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720003113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RU3pzYG6bF53Hk2/xb6Gkld3bSr1k5kQ8wZC1imwq1g=;
	b=cPZSrbgY1uyHHUyxN4ire6Mmb4TO2Vu4T16Cw0ijX9WtOdQxRVHvR8xZ+jgMpz5IE44inL
	vII6SqG0BXZ0XbJVzXjYjxMz8zquGtkc7ojMGbf+/xzpe9vPjARGlOsl4Kt/bELXixFXbH
	5T4k5i2pHjA7qYSjwFIN2biRcDna40ZV3h1eAQappwyEIKEtCUiI5XdvuyfwdrmtIeJjgC
	EmXxc3JWVdEIgSVbA2I6p8eyD4T5kYYxryDYm4ngJCNcK71xw65khBJRmgNBswdV/gvQA8
	WY/WU4scw62nCs+t+3Qq4YDu8vQayuKSd07TBXf+564kOUKkT1WLhWlM6A8vaQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 03 Jul 2024 12:37:01 +0200
Subject: [PATCH 17/20] ASoC: arizona: convert to
 of_property_for_each_u32_new()
MIME-Version: 1.0
Message-Id: <20240703-of_property_for_each_u32-v1-17-42c1fc0b82aa@bootlin.com>
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
X-CRM114-CacheID: sfid-20240703_033836_411856_CC91999F 
X-CRM114-Status: GOOD (  11.53  )
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
 sound/soc/codecs/arizona.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index 7434aeeda292..1a64b9815809 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -2786,15 +2786,13 @@ int arizona_of_get_audio_pdata(struct arizona *arizona)
 {
 	struct arizona_pdata *pdata = &arizona->pdata;
 	struct device_node *np = arizona->dev->of_node;
-	struct property *prop;
-	const __be32 *cur;
 	u32 val;
 	u32 pdm_val[ARIZONA_MAX_PDM_SPK];
 	int ret;
 	int count = 0;
 
 	count = 0;
-	of_property_for_each_u32(np, "wlf,inmode", prop, cur, val) {
+	of_property_for_each_u32_new(np, "wlf,inmode", val) {
 		if (count == ARRAY_SIZE(pdata->inmode))
 			break;
 
@@ -2803,7 +2801,7 @@ int arizona_of_get_audio_pdata(struct arizona *arizona)
 	}
 
 	count = 0;
-	of_property_for_each_u32(np, "wlf,dmic-ref", prop, cur, val) {
+	of_property_for_each_u32_new(np, "wlf,dmic-ref", val) {
 		if (count == ARRAY_SIZE(pdata->dmic_ref))
 			break;
 
@@ -2812,7 +2810,7 @@ int arizona_of_get_audio_pdata(struct arizona *arizona)
 	}
 
 	count = 0;
-	of_property_for_each_u32(np, "wlf,out-mono", prop, cur, val) {
+	of_property_for_each_u32_new(np, "wlf,out-mono", val) {
 		if (count == ARRAY_SIZE(pdata->out_mono))
 			break;
 
@@ -2821,7 +2819,7 @@ int arizona_of_get_audio_pdata(struct arizona *arizona)
 	}
 
 	count = 0;
-	of_property_for_each_u32(np, "wlf,max-channels-clocked", prop, cur, val) {
+	of_property_for_each_u32_new(np, "wlf,max-channels-clocked", val) {
 		if (count == ARRAY_SIZE(pdata->max_channels_clocked))
 			break;
 
@@ -2830,7 +2828,7 @@ int arizona_of_get_audio_pdata(struct arizona *arizona)
 	}
 
 	count = 0;
-	of_property_for_each_u32(np, "wlf,out-volume-limit", prop, cur, val) {
+	of_property_for_each_u32_new(np, "wlf,out-volume-limit", val) {
 		if (count == ARRAY_SIZE(pdata->out_vol_limit))
 			break;
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
