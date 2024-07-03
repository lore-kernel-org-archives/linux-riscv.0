Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C926EC31D97
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 10:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDGv/hV5JWGCv8kGtWtpSsOAeumKKRsY4uFDARC7YVI=; b=TuPEVRy1tm3SI1
	QFE1YijhaBWiCpxOlCFGXzFGGAytqVpO2vm2M73NR9FcGzJtXy3YUNYDS5Kuwy1Dj2SKzq+5apvBa
	t6yAy/rj3in9xvFQWg/GIXkaNreJoPM6/L03ZSn+4fuqvaOJGKMtiZGaiqpxXtMfgPI290Gk8Oqd4
	yB93fcnmL7dAyijlKcNW3VN26SFoFHL15m5zk2FvI+w/RtYi6z+wkrIWUW/CqnL6sW2+RYgV2gtcy
	qwHom4F8ZefURKgA0EYJItZlZH4xOOsrGHZTGqlmU1AJIqX+17+/5bt5BjKsU/wIeyn043X8KkrgU
	CVUTlOwWHurG+2H/UwFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxPM-00000009q4b-2ukT;
	Wed, 03 Jul 2024 10:40:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxPI-00000009q0y-1IxH;
	Wed, 03 Jul 2024 10:40:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=8hUMVYtBkjPdiTzE0TuzO7cuagNMWqN2g5DCdgBLSEk=; b=f7zBCCuWdX/bg62dbGoVvKdcHc
	c0J9p7r/cbNCb9+K4UQaCbH6KzLo1rWYACg8Y0OmtKp2nOy15BSa+ifG1E6KDwLgFUKnZ0w88vu1n
	7MELDRhU8dTLOoHnXdgEhsS8kHsRwSqz+hTpm9aIZqnAgUvKKqLmXxjEq5FrrLQiyHQ7+kLTBkpwl
	vh3XoQZZlXclA5WyB/4ONRmiOL2UovO+teFLGZzTLp5GJS9aaasxquniuTQQEIaYRamfK/R1c9rax
	NA8qcZ2UtqEQY0cLxLcikvyorDb9UsrlSdSIfq9P0vo0BYfV3g1pTlHZCWRukRhwCB7Tl2KPyD1X6
	e79yvWkg==;
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxNv-00000009xYm-42lD;
	Wed, 03 Jul 2024 10:40:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41D1340003;
	Wed,  3 Jul 2024 10:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720003122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8hUMVYtBkjPdiTzE0TuzO7cuagNMWqN2g5DCdgBLSEk=;
	b=krq9F3d5fBd6bfy6FrrQ002RWueFPpkeVNZCRwuTg00aWfcsCAo+TqJP4lQX1lNb1wnXx8
	8EFt540AMIJBMaxeUFLkQZT4IJffE+hEjvm/KC8c7bvRPvQNpTIO2EjrMZkQXl6020l+ii
	3JJCVUB6s9ma44O0w2gRu+DYyEwnCB7wKWEP232QtvdGIGUIWZVUgNnTWwPDH9ook3kbME
	D1peSErXCT5Jkj8vWWwbbj3NsFjOLFQHq2H5LTJRhcGEPUiywAMdZa3b2WOwjNwo07rHbL
	UCHQQH7s337h9dfyUpfbcNeOaTH9uKaERBtKoDjD94zwX+pk5NZ396JKb9qCGQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 03 Jul 2024 12:37:03 +0200
Subject: [PATCH 19/20] powerpc/xive: convert to
 of_property_for_each_u32_new()
MIME-Version: 1.0
Message-Id: <20240703-of_property_for_each_u32-v1-19-42c1fc0b82aa@bootlin.com>
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
X-CRM114-CacheID: sfid-20240703_113849_846119_33FD4248 
X-CRM114-Status: GOOD (  13.46  )
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

In this case only the 'prop' variable can be removed and not 'reg',
because 'reg' is used in _previous_ lines of the same function. There
is no side effect because the of_property_for_each_u32() macro being
removed would anyway write 'reg' bwfore reading its value, and 'reg'
is not used in _following_ lines.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 arch/powerpc/sysdev/xive/spapr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
index e45419264391..ffa6ca5db183 100644
--- a/arch/powerpc/sysdev/xive/spapr.c
+++ b/arch/powerpc/sysdev/xive/spapr.c
@@ -814,7 +814,6 @@ bool __init xive_spapr_init(void)
 	struct device_node *np;
 	struct resource r;
 	void __iomem *tima;
-	struct property *prop;
 	u8 max_prio;
 	u32 val;
 	u32 len;
@@ -866,7 +865,7 @@ bool __init xive_spapr_init(void)
 	}
 
 	/* Iterate the EQ sizes and pick one */
-	of_property_for_each_u32(np, "ibm,xive-eq-sizes", prop, reg, val) {
+	of_property_for_each_u32_new(np, "ibm,xive-eq-sizes", val) {
 		xive_queue_shift = val;
 		if (val == PAGE_SHIFT)
 			break;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
