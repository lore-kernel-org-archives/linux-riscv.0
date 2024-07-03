Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B308C30653
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 10:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ucG3H/EDfCGVhbDcAGVWynDTd+bze8Ko5RAi1xZwERM=; b=nsn3C41EWit3sr
	1IIjaKEfK+carKLIfERJgT2dDIgwizDcbtJgNF4gH2dT8HZ70CH8MbyBOn5keD2fJrlaJxX7Cvl5q
	DEm7McHpCNDyUqiG8ry6QPd6wZ3FUuryVCPxonTCl1WfEYQIDsC0o4qBEZtoTsRW+DN3AHhyP0iXk
	wmmc2N2GZN2yIclcg79eXDd9anWW68sMuDtLXzMT9sf5J32IX6RX6GPXiiPwEY/T3HiBILBxf16pk
	WRuL/XzqS1BfLysFJbk7ecD5hIFSVrwVSRYDJQOqZq5ybou0cP0i8b3l0OWSkzNK9IUhEklbac0NU
	qALvbGeDn3bP83HIIWfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxO1-00000009p5M-2AB5;
	Wed, 03 Jul 2024 10:38:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxNb-00000009okk-2K68;
	Wed, 03 Jul 2024 10:38:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=dZPPBHSyI/+YbF/9TI9GwF+CUzeEA2RsST6wsDA28Y0=; b=F/2jPwoWu9SveqG6ghj8Dh7CFz
	oJUtRy5SZPuo/2zQLeULqlSOQ/sIK0DLzB+lN7Jfj4gSszLJu0mqDJwpioVj51LgkhsYmI+BOklTK
	FGF4DyVibWtC3v8PH4+IHxqbmq1lAdjbIifFo8qTW67M/tb6DYV7KTNjdbZKRVonYTQtB5Cm862NV
	keD+G1rSjtHQeWOYjiE6SOfe1OI4+dNJMeaFWhohzCe8YZbcaAIhCJWMwaVCoqAdCLBn3Ez8tfTwf
	OluqZZ5E53lrIlqeUJyvK+qmmcxMUj8J2LWZqBnnp5Z9lhvizDYHsU8YhaXBMZC02wuN7fdRaebf4
	5I/YZ4Jg==;
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxNV-00000009xXq-3cJr;
	Wed, 03 Jul 2024 10:38:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D49E740006;
	Wed,  3 Jul 2024 10:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720003097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dZPPBHSyI/+YbF/9TI9GwF+CUzeEA2RsST6wsDA28Y0=;
	b=Ib/PFCUFguJgExTJzeLBH/xgT815E4W6OuByXZJoKzK1jTZ0BKQ6yzzGZ+tFwqfA+nCZYT
	Nmi154RSR+0y3gE4okF0tI41PAeQtJ50AXcE2FBzGNCKJm0u904u7dys+Dc3UYYescC8Zz
	az7DlTYiLVXAhIJX13CFLr5t+nXUAObbnbENT/513x1OxOrNGXGFixyBZdKaOaECjwQu88
	JWAT+gu9maylMym9RKrd330DygX8qEP5aYKWm9bqPbP2r2J/O6+BKDQiocvcfc0vyNX3JR
	0Loom3v5nYdkLj1K0iaDilqc1db8vDYfnvgGOk0A6qwaJtrYHrYDqx3ld+tbwA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 03 Jul 2024 12:36:57 +0200
Subject: [PATCH 13/20] pwm: samsung: convert to
 of_property_for_each_u32_new()
MIME-Version: 1.0
Message-Id: <20240703-of_property_for_each_u32-v1-13-42c1fc0b82aa@bootlin.com>
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
X-CRM114-CacheID: sfid-20240703_113823_156875_7969FF64 
X-CRM114-Status: GOOD (  11.72  )
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
 drivers/pwm/pwm-samsung.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-samsung.c b/drivers/pwm/pwm-samsung.c
index efb60c9f0cb3..fef02a0b023e 100644
--- a/drivers/pwm/pwm-samsung.c
+++ b/drivers/pwm/pwm-samsung.c
@@ -510,8 +510,6 @@ static int pwm_samsung_parse_dt(struct pwm_chip *chip)
 	struct samsung_pwm_chip *our_chip = to_samsung_pwm_chip(chip);
 	struct device_node *np = pwmchip_parent(chip)->of_node;
 	const struct of_device_id *match;
-	struct property *prop;
-	const __be32 *cur;
 	u32 val;
 
 	match = of_match_node(samsung_pwm_matches, np);
@@ -520,7 +518,7 @@ static int pwm_samsung_parse_dt(struct pwm_chip *chip)
 
 	memcpy(&our_chip->variant, match->data, sizeof(our_chip->variant));
 
-	of_property_for_each_u32(np, "samsung,pwm-outputs", prop, cur, val) {
+	of_property_for_each_u32_new(np, "samsung,pwm-outputs", val) {
 		if (val >= SAMSUNG_PWM_NUM) {
 			dev_err(pwmchip_parent(chip),
 				"%s: invalid channel index in samsung,pwm-outputs property\n",

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
