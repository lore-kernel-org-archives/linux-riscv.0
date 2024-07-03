Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544F2C31D97
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 10:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N3xPN6KxpXuk2d2KxmNxbhOeErtNGSAvDwsgpriajow=; b=hm7G8ONjPE4RgO
	zDajQEOTqkbNbJ6VZXVVMBxVdMDoox7OXo36KcQJWDTWUcSW2p1NzRezPFrH3RNfExcWRgsCaYKp1
	pNDD/f5mqOp9MouqJ9gpH2L5DAKLuDe7T6oIJGFHVNNzt9yR8V4v3f7bl+C/HM1+e2zf5V/JkNjjh
	h8I0kn8A8iQ1FGY6pZgM0a+sGN9d9JxsjRBHAFwigx/fLU1OWI1HhSafko8U5GR0EXPGUAfgRm7MA
	nHdOdPCTgYt/fJfEn9QzDq0hcuznbbmFAJ4vrgX3TexC6F+eMrR3ewlGDC98hUBHJH9ryZjYC9TaU
	Bk1KrEqL0Qk+7lYSH6MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxMk-00000009o5I-3z7Z;
	Wed, 03 Jul 2024 10:37:34 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxMf-00000009o1H-2XYa;
	Wed, 03 Jul 2024 10:37:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3ECA340002;
	Wed,  3 Jul 2024 10:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720003045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y9dKIY8UF+nReYR3bpF9Pb7TJp7WLPLWK/B5oYjjbq8=;
	b=foJzSM9RuZQOf/VPApRW0lmUGrQblXobu0gWcMfK3rdR7fFeSllw9HZtvDHamCZSnVeAQd
	xl3StvV0X9RM6zrGGH8rKfTVgGj2rxAQ/FXj4AoPA7jwEAAykHOnYYQdsWoKj0Z5qT9EbI
	NJSgM2y4fGFlocfqLTtmMbWZcFSesBLFVfvUvMOxSvZzRHYiHre2aVkplOJXZ8APv8zjRO
	yRmCwXsRILqubrSOViPCck2qs6VXTOpPU1Zh2pkMz/CDpauRr4KYDvJCL2P3T9WnVnXRPw
	Yp49tSFnocZKud9kw1tjEbXpKeoo3s6qbV/lMc9MWdp1PkDr10Ce8YagcplEvA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 00/20] Simplify of_property_for_each_u32()
Date: Wed, 03 Jul 2024 12:36:44 +0200
Message-Id: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALwphWYC/x3MTQqEMAxA4atI1lOI9Q+8igyltKlmY0uqw4j07
 haX3+K9GzIJU4a5uUHox5njXtF+GnCb3VdS7KtBo+5xwlbFYJLERHJcJkQxZN1mzk6rfsTgUdv
 Bo4OaJ6HA/3e9fEt5ALUFP0BqAAAA
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
X-CRM114-CacheID: sfid-20240703_033730_132392_B16083C1 
X-CRM114-Status: GOOD (  14.84  )
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

[Note: to reduce the noise I have trimmed the get_maintainers list
manually. Should you want to be removed, or someone else added, to future
versions, just tell me. Sorry for the noise.]

This series aims at simplifying of_property_for_each_u32() as well as
making it more difficult to misuse it in the future.

The long-term goal is changing this pattern:

  struct property *prop;
  const __be32 *p;
  u32 val;
 
  of_property_for_each_u32(np, "xyz", prop, p, val) { ... }

to this:

  u32 val;

  of_property_for_each_u32(np, "xyz", val) { ... }

So, removing the 3rd and 4th arguments which are typically meant to be
internal. Those two parameters used to be unavoidable until the kernel
moved to building with the C11 standard unconditionally. Since then, it is
now possible to get rid of them. However a few users of
of_property_for_each_u32() do actually use those arguments, which
complicates the transition. For this reason this series does the following:

 * Add of_property_for_each_u32_new(), which does not have those two
   arguments (patch 1)
 * Convert _almost_ every usage to of_property_for_each_u32_new()
 * Rename of_property_for_each_u32() to of_property_for_each_u32_old() and
   deprecate it, as a incentive to code not (yet) in mainline to upgrade
   to the *_new() version (last patch)

The plan for the next series is to additionally:

 * Convert the few remaining of_property_for_each_u32_old() instantes to
   of_property_for_each_u32_new()
 * Remove of_property_for_each_u32_old()
 * Rename of_property_for_each_u32_new() to of_property_for_each_u32()

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (20):
      of: add of_property_for_each_u32_new()
      clk: convert to of_property_for_each_u32_new()
      clk: qcom: convert to of_property_for_each_u32_new()
      clk: sunxi: clk-simple-gates: convert to of_property_for_each_u32_new()
      clk: sunxi:  clk-sun8i-bus-gates: convert to of_property_for_each_u32_new()
      clocksource/drivers/samsung_pwm: convert to of_property_for_each_u32_new()
      bus: ti-sysc: convert to of_property_for_each_u32_new()
      lk: clk-conf: convert to of_property_for_each_u32_new()
      gpio: brcmstb: convert to of_property_for_each_u32_new()
      pinctrl: s32cc: convert to of_property_for_each_u32_new()
      irqchip/atmel-aic: convert to of_property_for_each_u32_new()
      iio: adc: ti_am335x_adc: convert to of_property_for_each_u32_new()
      pwm: samsung: convert to of_property_for_each_u32_new()
      tty: sysrq: convert to of_property_for_each_u32_new()
      usb: usb251xb: convert to of_property_for_each_u32_new()
      mfd: ti_am335x_tscadc: convert to of_property_for_each_u32_new()
      ASoC: arizona: convert to of_property_for_each_u32_new()
      powerpc/xive: convert to of_property_for_each_u32_new()
      powerpc/xive: convert to of_property_for_each_u32_new()
      of: deprecate and rename of_property_for_each_u32()

 .clang-format                           |  3 ++-
 arch/powerpc/sysdev/xive/native.c       |  4 +---
 arch/powerpc/sysdev/xive/spapr.c        |  3 +--
 drivers/bus/ti-sysc.c                   |  4 +---
 drivers/clk/clk-conf.c                  |  4 +---
 drivers/clk/clk-si5351.c                |  4 ++--
 drivers/clk/clk.c                       |  6 ++----
 drivers/clk/qcom/common.c               |  4 +---
 drivers/clk/sunxi/clk-simple-gates.c    |  4 +---
 drivers/clk/sunxi/clk-sun8i-bus-gates.c |  4 +---
 drivers/clocksource/samsung_pwm_timer.c |  4 +---
 drivers/gpio/gpio-brcmstb.c             |  5 +----
 drivers/iio/adc/ti_am335x_adc.c         |  4 +---
 drivers/irqchip/irq-atmel-aic-common.c  |  4 +---
 drivers/irqchip/irq-pic32-evic.c        |  2 +-
 drivers/mfd/ti_am335x_tscadc.c          |  4 +---
 drivers/pinctrl/nxp/pinctrl-s32cc.c     |  4 +---
 drivers/pinctrl/pinctrl-k210.c          |  2 +-
 drivers/pwm/pwm-samsung.c               |  4 +---
 drivers/tty/sysrq.c                     |  4 +---
 drivers/usb/misc/usb251xb.c             |  4 +---
 include/linux/of.h                      | 14 ++++++++++----
 sound/soc/codecs/arizona.c              | 12 +++++-------
 23 files changed, 39 insertions(+), 68 deletions(-)
---
base-commit: e937d48ed96381e9620d9c81fbc1ce666f5b7358
change-id: 20240701-of_property_for_each_u32-460fd02a5d0c

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
