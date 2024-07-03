Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831C1C31D97
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 10:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6lbKLQqK9fxMV0YO4uO26u6vR6B2WoTuLArK1O6ttS8=; b=XkupGiANPc3jvo
	FjZZcrrrdPl+inDIC1F2CbRqCnrhiR55PrwtciQRH4bchdyOcO+SACh0dUZVjKIGmIh/GcgfVl4E+
	g7CQ2/0kZ6YkGDHzJoRkfm1j4S/Ory9Bo88LGp+DpdQRuoHdqTdywPYca5tiwJ07FI/09wViS8jp2
	Zp/UrkpqxOe0AlISy+oHtuQlFPwdYQMwSCWgWouSR6WGHUiyWvO8mduWgScUILLwnPtK+C/kxXexY
	octimxjvA2EWbBbyzMIt/PyP/jNgOn4Dky7DBvfCRbDahnkCnu0mV4RwqC/LQDVakbCG/ogWtQzCK
	gyW7MWVleTTGFPsrmSsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxMt-00000009oB0-3VPZ;
	Wed, 03 Jul 2024 10:37:43 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxMo-00000009o6o-3wOQ;
	Wed, 03 Jul 2024 10:37:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 714AB40007;
	Wed,  3 Jul 2024 10:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720003057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rx4+azxs/nr6UN4dbsJ4ODf9UYt0TlbIW0kWebCuftU=;
	b=CGb70O0LKHcH8JXuy55spACA4E8LSU1InmxWYOYScMS2hs1YLLU2skVvLnutVN2WF1NPHL
	RPN6+r3bLqcWXGEDa9iqym02HcVIQUVd6Hu7IFw22ugx7l1Bi+ewm0r0FibgVh8trCF9Sz
	I+dCgIbVyvn9KpMbwFtzeM8VuYEJgEe3RF5/rZLE9v/ga2IcN+OW1Y6MUwT0RGI9MinjsN
	INdiY7a/ahocLBOYh10W1sqtY6WtH7LnqN1n79lCm4l8vjxreVupuDYNO7cyq4imKsqrAE
	3zWphVZXKmEAHYJt7dn1p50FPaTRVrJPzlrkk5D+KbVEeqsvoKIeHs0lE5lDEg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 03 Jul 2024 12:36:47 +0200
Subject: [PATCH 03/20] clk: qcom: convert to of_property_for_each_u32_new()
MIME-Version: 1.0
Message-Id: <20240703-of_property_for_each_u32-v1-3-42c1fc0b82aa@bootlin.com>
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
X-CRM114-CacheID: sfid-20240703_033739_329476_4F4A9388 
X-CRM114-Status: GOOD (  11.30  )
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
 drivers/clk/qcom/common.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 48f81e3a5e80..43e4918dc4e9 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -226,11 +226,9 @@ EXPORT_SYMBOL_GPL(qcom_cc_register_sleep_clk);
 static void qcom_cc_drop_protected(struct device *dev, struct qcom_cc *cc)
 {
 	struct device_node *np = dev->of_node;
-	struct property *prop;
-	const __be32 *p;
 	u32 i;
 
-	of_property_for_each_u32(np, "protected-clocks", prop, p, i) {
+	of_property_for_each_u32_new(np, "protected-clocks", i) {
 		if (i >= cc->num_rclks)
 			continue;
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
