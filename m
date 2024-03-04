Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67785C54E41
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 09:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6GbNDpYtAXpSN43BEP+yM8LIeqZnk8aXREPBXn7XvRM=; b=hq2DBWDgyt3gTi
	evvI2G9eJOL+oBeiRZk7936qGv2bz4/9vpY0Hd8Vmd/g64Z81Wtxc+PMY7CcqMcg4G7gzc0Xk8Q+U
	PzX5pTiU95Vxyq7NtNvXiPMoYHNPMyi3ZRb2do2Ishpuu0Mdp7MxNl6fT9yoOw1t9kSsPgbBQHjDc
	rrocPJ63gZLUzAx7U++zwdOvEdKrTlSvfrm85dLamaeZhFLBcKl60uqJ7thN+rM6OkS3w/eZ3zwk6
	fmuB5f4RoutDh9mAxiLsEvUb9afcRQq/N5uqEvh0uaEwvnTJ6pXXaEw9ljkt0IluErQJxurRq0a7B
	6W2ywpmsfHKNvsH2oheQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh4Dq-00000008GJA-0WKx;
	Mon, 04 Mar 2024 09:02:58 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh4Dn-00000008GIY-38Ur
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 09:02:57 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1dd0d46ecc3so5338235ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Mar 2024 01:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709542974; x=1710147774; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cOSSzXWtg7hPNVxlQJgzsSWMxiBRgskIg49mArSAU2Q=;
        b=JohNBhJePVho57Mzh4pA27FbOBdhYECISJjjMAqOz3FGQSq26kmrpexX5CDGPLvjgo
         LSMeQkI+FnRY4qyCD/i6Yzhz7ugGxBKsiR5X4wgIlGThUOPdMr1wXvuaDAn1Pbt9rdsb
         P4NShVKMxnriShDM+ysHgGCm9F4MLV2OfFXpU6t8+D9YISXV36DJ7Qd7Xh2ryZWfm/V+
         dVzCdP01srA8dU0w66sVPC6PMkeybU/iXw0RP48B/Z/8tDjdgba7djXDnh1b7JdKA8/t
         l2AFLIfoHHLlLMaN0KKRYsBpFhQeQHXM99vlVScBumZaX0BI6O7FQFEcUpEHczJ2ZjPr
         BXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709542974; x=1710147774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cOSSzXWtg7hPNVxlQJgzsSWMxiBRgskIg49mArSAU2Q=;
        b=ukmvMWRIGJmSpVsbnQPYVMF2UnabmrMdAOcvobcI7bkraFQECEXZe0cXtoexY2iArp
         BG2Gv2m2q/21dHfgmP3oeHJI5qzDNdLxWGSx/w8+7L4AnqBweYxw6SEZghdW8rbG8GBT
         dZqFzxHE3kqXbjI1Q0ilGFv1cVx2JkgXyOMzLUQKuNhLlI8I7L9qZyv2Il9mFgBkAW2T
         QRIh7tlTAYXrHNib4Z1Yzx4fQ7Mh8zMKaR9v64tY1k32liuEAdT9Kl5CN5PPdZ9ygYdJ
         xCJB/ehupuePAtkeqyS4BDbkNvRlXevWSL2ncCwE5Jo/pwBXiosf0q2XPplmWCyBRdIm
         D/eQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7FQbg18p7iUqriOMD+HwTiMA/zlowbP1MllghfFLPkV5mXlRBSLOFdMBu5XQW7LrAb8lvYANNtcZzj2EB1wUdOdUOrV81ra4IczuHYHzx
X-Gm-Message-State: AOJu0YzA4mcsSLdTvJvHugHUH7/kmJcmmQ5p5RX5pD6K4/3fEaC8xa7z
	06iLudxV2ETmj2hr7ilNVkkYlFsEuTEKeOj6sIX0dGI0YP0Fgxjo
X-Google-Smtp-Source: AGHT+IEBWcpVB0ZIpXk7KFK3wsCpjgqPsqySMI7qTdKSbsKXYn5LQpOJ1cIRP6GjSNXX6+rvyCu+0w==
X-Received: by 2002:a17:902:ecc4:b0:1dd:2e6:b951 with SMTP id a4-20020a170902ecc400b001dd02e6b951mr7815406plh.12.1709542974417;
        Mon, 04 Mar 2024 01:02:54 -0800 (PST)
Received: from localhost ([46.3.240.107])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902650600b001dbb0348733sm8134714plk.67.2024.03.04.01.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 01:02:54 -0800 (PST)
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
To: u.kleine-koenig@pengutronix.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dlan@gentoo.org,
	inochiama@outlook.com,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Subject: [PATCH v4 2/2] pwm: sophgo: add pwm support for Sophgo CV1800 SoC
Date: Mon,  4 Mar 2024 17:02:48 +0800
Message-Id: <20240304090248.1247215-1-qiujingbao.dlmu@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240304085933.1246964-1-qiujingbao.dlmu@gmail.com>
References: <20240304085933.1246964-1-qiujingbao.dlmu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_010255_823903_839DA5FD 
X-CRM114-Status: GOOD (  30.67  )
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

Implement the PWM driver for CV1800.

Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
---
 drivers/pwm/Kconfig      |  10 ++
 drivers/pwm/Makefile     |   1 +
 drivers/pwm/pwm-cv1800.c | 314 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 325 insertions(+)
 create mode 100644 drivers/pwm/pwm-cv1800.c

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 4b956d661755..455f07af94f7 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -186,6 +186,16 @@ config PWM_CROS_EC
 	  PWM driver for exposing a PWM attached to the ChromeOS Embedded
 	  Controller.
 
+config PWM_CV1800
+	tristate "Sophgo CV1800 PWM driver"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	help
+	  Generic PWM framework driver for the Sophgo CV1800 series
+	  SoCs.
+
+	  To compile this driver as a module, build the dependecies
+	  as modules, this will be called pwm-cv1800.
+
 config PWM_DWC_CORE
 	tristate
 	depends on HAS_IOMEM
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index c5ec9e168ee7..6c3c4a07a316 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_PWM_CLK)		+= pwm-clk.o
 obj-$(CONFIG_PWM_CLPS711X)	+= pwm-clps711x.o
 obj-$(CONFIG_PWM_CRC)		+= pwm-crc.o
 obj-$(CONFIG_PWM_CROS_EC)	+= pwm-cros-ec.o
+obj-$(CONFIG_PWM_CV1800)	+= pwm-cv1800.o
 obj-$(CONFIG_PWM_DWC_CORE)	+= pwm-dwc-core.o
 obj-$(CONFIG_PWM_DWC)		+= pwm-dwc.o
 obj-$(CONFIG_PWM_EP93XX)	+= pwm-ep93xx.o
diff --git a/drivers/pwm/pwm-cv1800.c b/drivers/pwm/pwm-cv1800.c
new file mode 100644
index 000000000000..d5b31a2b7787
--- /dev/null
+++ b/drivers/pwm/pwm-cv1800.c
@@ -0,0 +1,314 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * pwm-cv1800.c: PWM driver for Sophgo cv1800
+ *
+ * Author: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
+ *
+ * Limitations:
+ * - It output low when PWM channel disabled.
+ * - This pwm device supports dynamic loading of PWM parameters. When PWMSTART
+ *   is written from 0 to 1, the register value (HLPERIODn, PERIODn) will be
+ *   temporarily stored inside the PWM. If you want to dynamically change the
+ *   waveform during PWM output, after writing the new value to HLPERIODn and
+ *   PERIODn, write 1 and then 0 to PWMUPDATE[n] to make the new value effective.
+ * - Supports up to Rate/2 output, and the lowest is about Rate/(2^30-1).
+ * - By setting HLPERIODn to 0, can produce 100% duty cycle.
+ * - This hardware could support inverted polarity. By default, the value of the
+ *   POLARITY register is 0x0. This means that HLPERIOD represents the number
+ *   of low level beats.
+ * - This hardware supports input mode and output mode, implemented through the
+ *   Output-Enable/OE register. However, this driver has not yet implemented
+ *   capture callback.
+ */
+
+#include <linux/clk.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+#include <linux/regmap.h>
+
+#define PWM_CV1800_HLPERIOD_BASE     0x00
+#define PWM_CV1800_PERIOD_BASE       0x04
+#define PWM_CV1800_POLARITY          0x40
+#define PWM_CV1800_START             0x44
+#define PWM_CV1800_DONE              0x48
+#define PWM_CV1800_UPDATE            0x4c
+#define PWM_CV1800_OE                0xd0
+
+#define PWM_CV1800_HLPERIOD(n)       (PWM_CV1800_HLPERIOD_BASE + ((n) * 0x08))
+#define PWM_CV1800_PERIOD(n)         (PWM_CV1800_PERIOD_BASE + ((n) * 0x08))
+
+#define PWM_CV1800_UPDATE_MASK(n)    (BIT(0) << (n))
+#define PWM_CV1800_OE_MASK(n)        (BIT(0) << (n))
+#define PWM_CV1800_START_MASK(n)     (BIT(0) << (n))
+#define PWM_CV1800_POLARITY_MASK(n)  (BIT(0) << (n))
+
+#define PWM_CV1800_OE_INPUT          0x00U
+#define PWM_CV1800_OE_OUTPUT(n)      (BIT(0) << (n))
+#define PWM_CV1800_MAXPERIOD         (BIT(30) - 1)
+#define PWM_CV1800_MINPERIOD         BIT(1)
+#define PWM_CV1800_PERIOD_RESET      BIT(1)
+#define PWM_CV1800_HLPERIOD_RESET    BIT(0)
+#define PWM_CV1800_REG_DISABLE       0x00U
+#define PWM_CV1800_REG_ENABLE(n)     (BIT(0) << (n))
+#define PWM_CV1800_CHANNELS          4
+
+struct cv1800_pwm {
+	struct regmap *map;
+	struct clk *clk;
+	unsigned long clk_rate;
+};
+
+static inline struct cv1800_pwm *to_cv1800_pwm_dev(struct pwm_chip *chip)
+{
+	return pwmchip_get_drvdata(chip);
+}
+
+static const struct regmap_config cv1800_pwm_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static int cv1800_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm,
+			     bool enable)
+{
+	struct cv1800_pwm *priv = to_cv1800_pwm_dev(chip);
+	u32 pwm_enable;
+
+	regmap_read(priv->map, PWM_CV1800_START, &pwm_enable);
+	pwm_enable &= PWM_CV1800_START_MASK(pwm->hwpwm);
+
+	/*
+	 * If the parameters are changed during runtime, Register needs
+	 * to be updated to take effect.
+	 */
+	if (pwm_enable && enable) {
+		regmap_update_bits(priv->map, PWM_CV1800_UPDATE,
+				   PWM_CV1800_UPDATE_MASK(pwm->hwpwm),
+				   PWM_CV1800_REG_ENABLE(pwm->hwpwm));
+		regmap_update_bits(priv->map, PWM_CV1800_UPDATE,
+				   PWM_CV1800_UPDATE_MASK(pwm->hwpwm),
+				   PWM_CV1800_REG_DISABLE);
+	} else if (!pwm_enable && enable) {
+		regmap_update_bits(priv->map, PWM_CV1800_START,
+				   PWM_CV1800_START_MASK(pwm->hwpwm),
+				   PWM_CV1800_REG_ENABLE(pwm->hwpwm));
+	} else if (pwm_enable && !enable) {
+		regmap_update_bits(priv->map, PWM_CV1800_START,
+				   PWM_CV1800_START_MASK(pwm->hwpwm),
+				   PWM_CV1800_REG_DISABLE);
+	}
+
+	return 0;
+}
+
+static void cv1800_pwm_set_polarity(struct pwm_chip *chip,
+				    struct pwm_device *pwm,
+				    enum pwm_polarity polarity)
+{
+	struct cv1800_pwm *priv = to_cv1800_pwm_dev(chip);
+
+	if (pwm->state.enabled)
+		cv1800_pwm_enable(chip, pwm, !pwm->state.enabled);
+
+	if (polarity == PWM_POLARITY_INVERSED)
+		regmap_update_bits(priv->map, PWM_CV1800_POLARITY,
+				   PWM_CV1800_POLARITY_MASK(pwm->hwpwm),
+				   PWM_CV1800_REG_ENABLE(pwm->hwpwm));
+	else
+		regmap_update_bits(priv->map, PWM_CV1800_POLARITY,
+				   PWM_CV1800_POLARITY_MASK(pwm->hwpwm),
+				   PWM_CV1800_REG_DISABLE);
+}
+
+static void cv1800_pwm_set_oe(struct pwm_chip *chip, struct pwm_device *pwm,
+			      u32 mode)
+{
+	struct cv1800_pwm *priv = to_cv1800_pwm_dev(chip);
+	u32 state;
+
+	regmap_read(priv->map, PWM_CV1800_OE, &state);
+	state &= PWM_CV1800_OE_MASK(pwm->hwpwm);
+
+	if (state == mode)
+		return;
+
+	cv1800_pwm_enable(chip, pwm, false);
+
+	if (mode == PWM_CV1800_OE_INPUT)
+		regmap_update_bits(priv->map, PWM_CV1800_OE,
+				   PWM_CV1800_OE_MASK(pwm->hwpwm),
+				   PWM_CV1800_REG_DISABLE);
+	else if (mode == PWM_CV1800_OE_OUTPUT(pwm->hwpwm))
+		regmap_update_bits(priv->map, PWM_CV1800_OE,
+				   PWM_CV1800_OE_MASK(pwm->hwpwm),
+				   PWM_CV1800_REG_ENABLE(pwm->hwpwm));
+}
+
+static int cv1800_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			    const struct pwm_state *state)
+{
+	struct cv1800_pwm *priv = to_cv1800_pwm_dev(chip);
+	u32 period_val, hlperiod_val;
+	u64 tem;
+
+	cv1800_pwm_set_oe(chip, pwm, PWM_CV1800_OE_OUTPUT(pwm->hwpwm));
+
+	if (state->polarity != pwm->state.polarity)
+		cv1800_pwm_set_polarity(chip, pwm, state->polarity);
+
+	/*
+	 * This hardware use PERIOD and HLPERIOD registers to represent PWM waves.
+	 *
+	 * The meaning of PERIOD is how many clock cycles (from the clock source)
+	 * are used to represent PWM waves.
+	 * PERIOD = rate(MHz) / target(MHz)
+	 * PERIOD = period(ns) * rate(Hz) / NSEC_PER_SEC
+	 */
+	tem = mul_u64_u64_div_u64(state->period, priv->clk_rate, NSEC_PER_SEC);
+	if (tem < PWM_CV1800_MINPERIOD)
+		return -EINVAL;
+
+	if (tem > PWM_CV1800_MAXPERIOD)
+		tem = PWM_CV1800_MAXPERIOD;
+
+	period_val = (u32)tem;
+
+	/*
+	 * The meaning of HLPERIOD is the number of beats in the low or high level
+	 * of the PERIOD. When the value of the POLARITY register is 0, HLPERIOD
+	 * represents a low level.
+	 * HLPERIOD = period_val - rate(MHz) / duty(MHz)
+	 * HLPERIOD = period_val - duty(ns) * rate(Hz) / NSEC_PER_SEC
+	 */
+	tem = mul_u64_u64_div_u64(state->duty_cycle, priv->clk_rate,
+				  NSEC_PER_SEC);
+	if (tem > period_val)
+		return -EINVAL;
+	hlperiod_val = period_val - (u32)tem;
+
+	regmap_write(priv->map, PWM_CV1800_PERIOD(pwm->hwpwm), period_val);
+	regmap_write(priv->map, PWM_CV1800_HLPERIOD(pwm->hwpwm), hlperiod_val);
+
+	cv1800_pwm_enable(chip, pwm, state->enabled);
+
+	return 0;
+}
+
+static int cv1800_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+				struct pwm_state *state)
+{
+	struct cv1800_pwm *priv = to_cv1800_pwm_dev(chip);
+	u32 period_val, hlperiod_val;
+	u64 period_ns = 0;
+	u64 duty_ns = 0;
+	u32 enable = 0;
+	u32 polarity = 0;
+
+	regmap_read(priv->map, PWM_CV1800_PERIOD(pwm->hwpwm), &period_val);
+	regmap_read(priv->map, PWM_CV1800_HLPERIOD(pwm->hwpwm), &hlperiod_val);
+
+	if (period_val != PWM_CV1800_PERIOD_RESET ||
+	    hlperiod_val != PWM_CV1800_HLPERIOD_RESET) {
+		period_ns = DIV_ROUND_UP_ULL(period_val * NSEC_PER_SEC,
+					     priv->clk_rate);
+		duty_ns = DIV_ROUND_UP_ULL(hlperiod_val * period_ns, period_val);
+
+		regmap_read(priv->map, PWM_CV1800_START, &enable);
+		enable &= PWM_CV1800_START_MASK(pwm->hwpwm);
+
+		regmap_read(priv->map, PWM_CV1800_POLARITY, &polarity);
+		polarity &= PWM_CV1800_POLARITY_MASK(pwm->hwpwm);
+	}
+
+	state->period = period_ns;
+	state->duty_cycle = duty_ns;
+	state->enabled = enable;
+	state->polarity = polarity ? PWM_POLARITY_INVERSED : PWM_POLARITY_NORMAL;
+
+	return 0;
+}
+
+static const struct pwm_ops cv1800_pwm_ops = {
+	.apply = cv1800_pwm_apply,
+	.get_state = cv1800_pwm_get_state,
+};
+
+static void devm_clk_rate_exclusive_put(void *data)
+{
+	struct clk *clk = data;
+
+	clk_rate_exclusive_put(clk);
+}
+
+static int cv1800_pwm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cv1800_pwm *priv;
+	struct pwm_chip *chip;
+	void __iomem *base;
+	int ret;
+
+	chip = devm_pwmchip_alloc(dev, PWM_CV1800_CHANNELS, sizeof(*priv));
+	if (!chip)
+		return PTR_ERR(chip);
+	priv = to_cv1800_pwm_dev(chip);
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	priv->map = devm_regmap_init_mmio(&pdev->dev, base,
+					  &cv1800_pwm_regmap_config);
+	if (IS_ERR(priv->map))
+		return PTR_ERR(priv->map);
+
+	priv->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->clk),
+				     "clk not found\n");
+
+	ret = clk_rate_exclusive_get(priv->clk);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to get exclusive rate\n");
+
+	ret = devm_add_action_or_reset(&pdev->dev, devm_clk_rate_exclusive_put,
+				       priv->clk);
+	if (ret) {
+		clk_rate_exclusive_put(priv->clk);
+		return ret;
+	}
+
+	priv->clk_rate = clk_get_rate(priv->clk);
+	if (!priv->clk_rate)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "Invalid clock rate: %lu\n",
+				     priv->clk_rate);
+
+	chip->ops = &cv1800_pwm_ops;
+
+	return devm_pwmchip_add(dev, chip);
+}
+
+static const struct of_device_id cv1800_pwm_dt_ids[] = {
+	{ .compatible = "sophgo,cv1800-pwm" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, cv1800_pwm_dt_ids);
+
+static struct platform_driver cv1800_pwm_driver = {
+	.probe = cv1800_pwm_probe,
+	.driver	= {
+		.name = "cv1800-pwm",
+		.of_match_table = cv1800_pwm_dt_ids,
+	},
+};
+module_platform_driver(cv1800_pwm_driver);
+
+MODULE_AUTHOR("Jingbao Qiu");
+MODULE_DESCRIPTION("Sophgo cv1800 PWM Driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
