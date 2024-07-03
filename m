Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE6EC2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 10:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RvGatGWj1LykRDfE0F2h8oUtNc8m9AbYAIS3ueJLE8Q=; b=f+Bwd5o8vHH3hu
	PYOlPg3BffYT6nEhqP4Ld5sxSfK3aQclHTdOP/+IW4uUSfbeFTqM5D8tIdcrSa4g8g97J8QB8ccyI
	S/UxNQIE/4NtUQB243zwK3yxE93q+WIqEBg9JL4cIhd7eb5zlaQgToLGtwY/Mz7nF+5JAEmLcqoIb
	Gho+JW48IMbcPee78MBDUYdWs75J9yf3kkiF4Gn+5fKJrLytEY8Yhbi2gJN5g2RuXxZYkDRpG5yvp
	B1ps9DmOTHg8w8c4fJPmx5kvKtSVU46ztVSVqAUmQ+l+BYyCrtNH1RuhGPmUSbEtVE96Tmb+3PON5
	Kmpqt2CJFEliJ5dekZig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxMm-00000009o6A-3e7G;
	Wed, 03 Jul 2024 10:37:36 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxMh-00000009o2p-0O9K;
	Wed, 03 Jul 2024 10:37:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73EE740003;
	Wed,  3 Jul 2024 10:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720003049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=moEPnxiSi/c1D9xrX6V2cKPTilxyr+PMhbb8iCAH8yw=;
	b=SnP12D1wMBqz1K2C4ZP0DkuGcdvpvaSCHDwQRfHVaIbo9cTSIG+C3GanMB3Dz8GR1iRJrd
	qnT046Tf39IN3CmQhaX95SRGYP2nBDEAM5tGTOWFgBSFQDsTd3m/dsrpRU3zhAPEsF5Fl3
	jkrXFwskrz4Gh0DqUXLrMHFmuKCKCVO7or2fBHpusUScb+WZVc0lnSMePPEIldt+2+ATel
	APU1p+k00hbC0js5s0PaqwB0P2+9N6XB0yVYAx/ctq0jtZTiTZeWeHTIt6iQc8ScOmGN8+
	/UnjLPcOgpoVK2LpsDsZC2GBUe7tZlqLk8QzpQNhH6KoJ167npVDF16CAtqTyQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 03 Jul 2024 12:36:45 +0200
Subject: [PATCH 01/20] of: add of_property_for_each_u32_new()
MIME-Version: 1.0
Message-Id: <20240703-of_property_for_each_u32-v1-1-42c1fc0b82aa@bootlin.com>
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
X-CRM114-CacheID: sfid-20240703_033732_139159_CE5B6013 
X-CRM114-Status: GOOD (  16.51  )
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

The of_property_for_each_u32() macro needs five parameters, two of which
are often only used internally by the macro itself (in the for()
clause).

Now that the kernel uses C11 to build these two parameters can be avoided
by declaring them internally. Add a new macro for that, which is meant to
eventually replace the existing one.

Since two variables cannot be declared in the for clause, declare one
struct that contain the two variables we actually need. Since the variables
inside this struct are not meant to be used by users of this macro, give
the struct instance the noticeable name "_it" so it is visible during code
reviews, helping to avoid new code to use it directly.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 .clang-format      |  1 +
 include/linux/of.h | 11 ++++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/.clang-format b/.clang-format
index ccc9b93972a9..db25cde2651a 100644
--- a/.clang-format
+++ b/.clang-format
@@ -570,6 +570,7 @@ ForEachMacros:
   - 'of_for_each_phandle'
   - 'of_property_for_each_string'
   - 'of_property_for_each_u32'
+  - 'of_property_for_each_u32_new'
   - 'pci_bus_for_each_resource'
   - 'pci_dev_for_each_resource'
   - 'pcl_for_each_chunk'
diff --git a/include/linux/of.h b/include/linux/of.h
index a0bedd038a05..756847539384 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -430,11 +430,9 @@ extern int of_detach_node(struct device_node *);
 #define of_match_ptr(_ptr)	(_ptr)
 
 /*
- * struct property *prop;
- * const __be32 *p;
  * u32 u;
  *
- * of_property_for_each_u32(np, "propname", prop, p, u)
+ * of_property_for_each_u32_new(np, "propname", u)
  *         printk("U32 value: %x\n", u);
  */
 const __be32 *of_prop_next_u32(struct property *prop, const __be32 *cur,
@@ -1437,6 +1435,13 @@ static inline int of_property_read_s32(const struct device_node *np,
 		p;						\
 		p = of_prop_next_u32(prop, p, &u))
 
+#define of_property_for_each_u32_new(np, propname, u)			\
+	for (struct {struct property *prop; const __be32 *item; } _it =	\
+		{of_find_property(np, propname, NULL),			\
+		 of_prop_next_u32(_it.prop, NULL, &u)};			\
+	     _it.item;							\
+	     _it.item = of_prop_next_u32(_it.prop, _it.item, &u))
+
 #define of_property_for_each_string(np, propname, prop, s)	\
 	for (prop = of_find_property(np, propname, NULL),	\
 		s = of_prop_next_string(prop, NULL);		\

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
