Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF1CC2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 10:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ESeGyM93e5TXw190nDZ20DheCOv9HEoZtcshZmpeV8I=; b=Ltf2y1jkFzd6Zn
	oJi2dqnXjbKWSr/Wac2F3ouRd3eUCtJIvYzV18Pfhw/jU77vGNP3EHhW3JKnwCdBCOEgd3+85a+fw
	U9MZPhQcL+PaiqMS39QewvJNstAFAIfb7rcmweu6FLwYZiclfAGjwQAPWHUEvCxy6vOiF9aecF2zJ
	WdN55lybaGwrklxMdenIM+rgQNssy5H47TzticIrLDv6xcMiXCGuLLeQ6ilP44ThA5hTbN1pOdY9a
	sIbMGS5P36EJvxUdBImrw+lWzKk8izm4rBZJeue8nPpZlK4dKYLMMPgeUfgiKYOIWUF4559fqvHCp
	ynoIVZ49E2k1MbD8u8zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxO8-00000009pBK-0yTX;
	Wed, 03 Jul 2024 10:39:00 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxNX-00000009ogS-3lzu;
	Wed, 03 Jul 2024 10:38:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E28834000D;
	Wed,  3 Jul 2024 10:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720003101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=78C35tW4lsYFlY1YR8UtHYwhkc3TnVCBtcNefWaJVZc=;
	b=oXUa31ODiP9nVQgcAJYvkSJjw3Nl2xFkxoaUzbjkYfoZy0WqW3XM09Ra2i4md0DVO/df0t
	uzTPi9Mn7rVmhdGD7Y1I3UmO0z3XeaklUDL1qX4csSZO2ZrOFbBlsG9UPGLp+QmqkV+Hoc
	TRCec4TuUqXAgW/qR2UGILaYaPYt4+pBAtb/OP9thxJesMbY+DSuiw7MnpCGOmmB4MmI3b
	Km2dkMTd/9bCebKT2xBVzdPVNVEg86RF7Y/XtEw8Yg2UwoWQu7+Z12VU1X/ofhPrafsSC0
	0RKAGKrDYJ4h9dTCEnLg/BUsSSq/9f/jPdbkRxLFapx2puNRwIHp/UMj7smt6Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 03 Jul 2024 12:36:58 +0200
Subject: [PATCH 14/20] tty: sysrq: convert to
 of_property_for_each_u32_new()
MIME-Version: 1.0
Message-Id: <20240703-of_property_for_each_u32-v1-14-42c1fc0b82aa@bootlin.com>
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
X-CRM114-CacheID: sfid-20240703_033824_715973_A5550171 
X-CRM114-Status: GOOD (  12.17  )
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
 drivers/tty/sysrq.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index e5974b8239c9..719376dda5c1 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -770,8 +770,6 @@ static void sysrq_of_get_keyreset_config(void)
 {
 	u32 key;
 	struct device_node *np;
-	struct property *prop;
-	const __be32 *p;
 
 	np = of_find_node_by_path("/chosen/linux,sysrq-reset-seq");
 	if (!np) {
@@ -782,7 +780,7 @@ static void sysrq_of_get_keyreset_config(void)
 	/* Reset in case a __weak definition was present */
 	sysrq_reset_seq_len = 0;
 
-	of_property_for_each_u32(np, "keyset", prop, p, key) {
+	of_property_for_each_u32_new(np, "keyset", key) {
 		if (key == KEY_RESERVED || key > KEY_MAX ||
 		    sysrq_reset_seq_len == SYSRQ_KEY_RESET_MAX)
 			break;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
