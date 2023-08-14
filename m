Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF9BC001DB
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 13:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t1wVYxqljo+EpxaJtOyXyy+ZgQxHUm8PT3N1OwMIzo4=; b=cut6A7KoEPDsxB
	YUEkhCkC2Z5md4doid3i1tPaKKOmM9O1V/rsnfAe3Sn3p/eK58w0vXcT6y+OW0aHTwHmvscicX4Z2
	gwYRn3skjGFCdAU2n5GD4jUD9S8baOB6iHvzqPV6ejt8zQWw+W3egjfqtPE2s4YpUcVOQGJZowItG
	JfKcmJ/3FAlvC+GTAr+TTXRKByZXf2Vpad886jcLbJMPSXSETuts0AjMd+ZeOR2JdJS48CLBXGrf9
	nHIoVucqDou2pq1mtTpMD18Wk56HDa6pQwBytI/OLJRn+hMzHIUVsuoHRBbmSg77pGeNM25djv3Hk
	+K6mZyzNEcpakDCqlllA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVXhZ-00HAXj-30;
	Mon, 14 Aug 2023 13:33:45 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVXhW-00HATu-1K;
	Mon, 14 Aug 2023 13:33:44 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fe82ac3ab4so6387561e87.1;
        Mon, 14 Aug 2023 06:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692020018; x=1692624818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g67w4O0sdp9v9YWMwUveyDXqr8a/H/Dq9cs3twzAmmc=;
        b=ORwFlFy/BfuHs1Ge3rnil7cmwKuHXtdpY3lQ7rZ/MYrVz7kAlaiQ6kpFGy0SFVLSNS
         0Wf0BYVI0Xh9E8obhbV9qttt/m72ATa0LDxmNbSx0J0m/Budcz+IBEEgVCvLgDGs82LQ
         NxqvE5VoN6gLQ1yJegMWl52/4iehkI0bEopY7CGJhvgnzpKGMSHTmU5o9Ip7BwZBe+LC
         4D1aHj2DmYC+dj2RkTbRdbeFY8cu+Poo0ds3zaydT7J/0eR1ebEeYKI3ijuVuvJuECXD
         zLoe7uJPIijdZ+YPY2fPXX1J0krV6SqDmcf9bK8nHBY72lOnQWK7BxY/+xliRpkBw78b
         2GnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692020018; x=1692624818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g67w4O0sdp9v9YWMwUveyDXqr8a/H/Dq9cs3twzAmmc=;
        b=es/WQXpv+kaJI6Ho2zCVlFIfmtB33bkn5sijwcAe4Enc6EJqHWrqSoT2wPyYPB7+dw
         Mk7nN4A3o7z1HPc3OckRMSo0T8/Ksy30vxrBMI8/vwSADcurZtnYoYgx3Wyx2pehox4E
         wPk1CwBH43dpRF+WqMgeCe8bea40iKjMr2fl7vAeULj352+flsZJZdgJgBbOKlrxwwmF
         Snyp/MbGm3yvHtQUgZU+GHG5u6NfhdPZOkICT4USvWzeCLi+pwqyX2O+jNLIaw27Spk0
         G2bk0ocGguAIWAUxssTd4YUrLgCDrGFn/BhWmW9h3zUrWiDKywuP5F68I34cIzVZGQ5F
         hUtw==
X-Gm-Message-State: AOJu0YyIT1QM8mWVaQdA0lPxfhIZrUKCh2d8bwegRxZcu7ipU8MEsnYS
	c0N0P46sfG17BYk6NFJ3Ag==
X-Google-Smtp-Source: AGHT+IGLPWyZg8AYPU3r7SVbMHJoxBSRyvoqHjsQRcFHHzmyynxJcainaxpCyY9lMZ65s+R3kcS1Qg==
X-Received: by 2002:a05:6512:31c7:b0:4fd:f80d:f6a3 with SMTP id j7-20020a05651231c700b004fdf80df6a3mr6886135lfe.43.1692020017594;
        Mon, 14 Aug 2023 06:33:37 -0700 (PDT)
Received: from localhost.localdomain (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.gmail.com with ESMTPSA id eo12-20020a056512480c00b004f858249932sm1990566lfb.90.2023.08.14.06.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 06:33:37 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/3] pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
Date: Mon, 14 Aug 2023 16:32:17 +0300
Message-Id: <20230814133238.741950-3-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230814133238.741950-1-privatesub2@gmail.com>
References: <20230814133238.741950-1-privatesub2@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_063342_455352_D4523C3E 
X-CRM114-Status: GOOD (  33.18  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Aleksandr Shubin <privatesub2@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Allwinner's D1, T113-S3 and R329 SoCs have a quite different PWM
controllers with ones supported by pwm-sun4i driver.

This patch adds a PWM controller driver for Allwinner's D1,
T113-S3 and R329 SoCs. The main difference between these SoCs
is the number of channels defined by the DT property.

Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 drivers/pwm/Kconfig      |  10 ++
 drivers/pwm/Makefile     |   1 +
 drivers/pwm/pwm-sun20i.c | 323 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 334 insertions(+)
 create mode 100644 drivers/pwm/pwm-sun20i.c

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 8df861b1f4a3..05c48a36969e 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -594,6 +594,16 @@ config PWM_SUN4I
 	  To compile this driver as a module, choose M here: the module
 	  will be called pwm-sun4i.
 
+config PWM_SUN20I
+	tristate "Allwinner D1/T113s/R329 PWM support"
+	depends on ARCH_SUNXI || COMPILE_TEST
+	depends on COMMON_CLK
+	help
+	  Generic PWM framework driver for Allwinner D1/T113s/R329 SoCs.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called pwm-sun20i.
+
 config PWM_SUNPLUS
 	tristate "Sunplus PWM support"
 	depends on ARCH_SUNPLUS || COMPILE_TEST
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index 19899b912e00..cea872e22c78 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -55,6 +55,7 @@ obj-$(CONFIG_PWM_STM32)		+= pwm-stm32.o
 obj-$(CONFIG_PWM_STM32_LP)	+= pwm-stm32-lp.o
 obj-$(CONFIG_PWM_STMPE)		+= pwm-stmpe.o
 obj-$(CONFIG_PWM_SUN4I)		+= pwm-sun4i.o
+obj-$(CONFIG_PWM_SUN20I)	+= pwm-sun20i.o
 obj-$(CONFIG_PWM_SUNPLUS)	+= pwm-sunplus.o
 obj-$(CONFIG_PWM_TEGRA)		+= pwm-tegra.o
 obj-$(CONFIG_PWM_TIECAP)	+= pwm-tiecap.o
diff --git a/drivers/pwm/pwm-sun20i.c b/drivers/pwm/pwm-sun20i.c
new file mode 100644
index 000000000000..0475bb30e01d
--- /dev/null
+++ b/drivers/pwm/pwm-sun20i.c
@@ -0,0 +1,323 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PWM Controller Driver for sunxi platforms (D1, T113-S3 and R329)
+ *
+ * Limitations:
+ * - When the parameters change, current running period will not be completed
+ *   and run new settings immediately.
+ * - It output HIGH-Z state when PWM channel disabled.
+ *
+ * Copyright (c) 2023 Aleksandr Shubin <privatesub2@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/pwm.h>
+#include <linux/reset.h>
+
+#define PWM_CLK_CFG(chan)		(0x20 + (((chan) >> 1) * 0x4))
+#define PWM_CLK_CFG_SRC			GENMASK(8, 7)
+#define PWM_CLK_CFG_DIV_M		GENMASK(3, 0)
+
+#define PWM_CLK_GATE			0x40
+#define PWM_CLK_GATE_BYPASS(chan)	BIT((chan) - 16)
+#define PWM_CLK_GATE_GATING(chan)	BIT(chan)
+
+#define PWM_ENABLE			0x80
+#define PWM_ENABLE_EN(chan)		BIT(chan)
+
+#define PWM_CTL(chan)			(0x100 + (chan) * 0x20)
+#define PWM_CTL_ACT_STA			BIT(8)
+#define PWM_CTL_PRESCAL_K		GENMASK(7, 0)
+
+#define PWM_PERIOD(chan)		(0x104 + (chan) * 0x20)
+#define PWM_PERIOD_ENTIRE_CYCLE		GENMASK(31, 16)
+#define PWM_PERIOD_ACT_CYCLE		GENMASK(15, 0)
+
+#define PWM_MAGIC			(255 * 65535 + 2 * 65534 + 1)
+
+struct sun20i_pwm_chip {
+	struct clk *clk_bus, *clk_hosc;
+	struct reset_control *rst;
+	struct pwm_chip chip;
+	void __iomem *base;
+	/* Mutex to protect pwm apply state */
+	struct mutex mutex;
+};
+
+static inline struct sun20i_pwm_chip *to_sun20i_pwm_chip(struct pwm_chip *chip)
+{
+	return container_of(chip, struct sun20i_pwm_chip, chip);
+}
+
+static inline u32 sun20i_pwm_readl(struct sun20i_pwm_chip *chip,
+				   unsigned long offset)
+{
+	return readl(chip->base + offset);
+}
+
+static inline void sun20i_pwm_writel(struct sun20i_pwm_chip *chip,
+				     u32 val, unsigned long offset)
+{
+	writel(val, chip->base + offset);
+}
+
+static int sun20i_pwm_get_state(struct pwm_chip *chip,
+				struct pwm_device *pwm,
+				struct pwm_state *state)
+{
+	struct sun20i_pwm_chip *sun20i_chip = to_sun20i_pwm_chip(chip);
+	u16 ent_cycle, act_cycle, prescal;
+	u64 clk_rate, tmp;
+	u8 div_id;
+	u32 val;
+
+	mutex_lock(&sun20i_chip->mutex);
+
+	val = sun20i_pwm_readl(sun20i_chip, PWM_CLK_CFG(pwm->hwpwm));
+	div_id = FIELD_GET(PWM_CLK_CFG_DIV_M, val);
+	if (FIELD_GET(PWM_CLK_CFG_SRC, val) == 0)
+		clk_rate = clk_get_rate(sun20i_chip->clk_hosc);
+	else
+		clk_rate = clk_get_rate(sun20i_chip->clk_bus);
+
+	val = sun20i_pwm_readl(sun20i_chip, PWM_CTL(pwm->hwpwm));
+	state->polarity = (PWM_CTL_ACT_STA & val) ? PWM_POLARITY_NORMAL : PWM_POLARITY_INVERSED;
+
+	prescal = FIELD_GET(PWM_CTL_PRESCAL_K, val) + 1;
+
+	val = sun20i_pwm_readl(sun20i_chip, PWM_ENABLE);
+	state->enabled = (PWM_ENABLE_EN(pwm->hwpwm) & val) ? true : false;
+
+	val = sun20i_pwm_readl(sun20i_chip, PWM_PERIOD(pwm->hwpwm));
+	act_cycle = FIELD_GET(PWM_PERIOD_ACT_CYCLE, val);
+	ent_cycle = FIELD_GET(PWM_PERIOD_ENTIRE_CYCLE, val);
+
+	/*
+	 * The duration of the active phase should not be longer
+	 * than the duration of the period
+	 */
+	if (act_cycle > ent_cycle)
+		act_cycle = ent_cycle;
+
+	tmp = ((u64)(act_cycle) * prescal << div_id) * NSEC_PER_SEC;
+	state->duty_cycle = DIV_ROUND_UP_ULL(tmp, clk_rate);
+	tmp = ((u64)(ent_cycle) * prescal << div_id) * NSEC_PER_SEC;
+	state->period = DIV_ROUND_UP_ULL(tmp, clk_rate);
+	mutex_unlock(&sun20i_chip->mutex);
+
+	return 0;
+}
+
+static int sun20i_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			    const struct pwm_state *state)
+{
+	struct sun20i_pwm_chip *sun20i_chip = to_sun20i_pwm_chip(chip);
+	u32 clk_gate, clk_cfg, pwm_en, ctl, period;
+	u64 bus_rate, hosc_rate, clk_div, val;
+	u32 prescaler, div_m;
+	bool use_bus_clk;
+	int ret = 0;
+
+	mutex_lock(&sun20i_chip->mutex);
+
+	pwm_en = sun20i_pwm_readl(sun20i_chip, PWM_ENABLE);
+
+	if (state->enabled != pwm->state.enabled)
+		clk_gate = sun20i_pwm_readl(sun20i_chip, PWM_CLK_GATE);
+
+	if (state->enabled != pwm->state.enabled && !state->enabled) {
+		clk_gate &= ~PWM_CLK_GATE_GATING(pwm->hwpwm);
+		pwm_en &= ~PWM_ENABLE_EN(pwm->hwpwm);
+		sun20i_pwm_writel(sun20i_chip, pwm_en, PWM_ENABLE);
+		sun20i_pwm_writel(sun20i_chip, clk_gate, PWM_CLK_GATE);
+	}
+
+	if (state->polarity != pwm->state.polarity ||
+	    state->duty_cycle != pwm->state.duty_cycle ||
+	    state->period != pwm->state.period) {
+		ctl = sun20i_pwm_readl(sun20i_chip, PWM_CTL(pwm->hwpwm));
+		clk_cfg = sun20i_pwm_readl(sun20i_chip, PWM_CLK_CFG(pwm->hwpwm));
+		hosc_rate = clk_get_rate(sun20i_chip->clk_hosc);
+		bus_rate = clk_get_rate(sun20i_chip->clk_bus);
+		if (pwm_en & PWM_ENABLE_EN(pwm->hwpwm ^ 1)) {
+			/* if the neighbor channel is enable, check period only */
+			use_bus_clk = FIELD_GET(PWM_CLK_CFG_SRC, clk_cfg) != 0;
+			val = state->period * (use_bus_clk ? bus_rate : hosc_rate);
+			do_div(val, NSEC_PER_SEC);
+
+			div_m = FIELD_GET(PWM_CLK_CFG_DIV_M, clk_cfg);
+		} else {
+			/* check period and select clock source */
+			use_bus_clk = false;
+			val = state->period * hosc_rate;
+			do_div(val, NSEC_PER_SEC);
+			if (val <= 1) {
+				use_bus_clk = true;
+				val = state->period * bus_rate;
+				do_div(val, NSEC_PER_SEC);
+				if (val <= 1) {
+					ret = -EINVAL;
+					goto unlock_mutex;
+				}
+			}
+			div_m = fls(DIV_ROUND_DOWN_ULL(val, PWM_MAGIC));
+			if (div_m >= 9) {
+				ret = -EINVAL;
+				goto unlock_mutex;
+			}
+
+			/* set up the CLK_DIV_M and clock CLK_SRC */
+			clk_cfg = FIELD_PREP(PWM_CLK_CFG_DIV_M, div_m);
+			clk_cfg |= FIELD_PREP(PWM_CLK_CFG_SRC, use_bus_clk);
+
+			sun20i_pwm_writel(sun20i_chip, clk_cfg, PWM_CLK_CFG(pwm->hwpwm));
+		}
+
+		/* calculate prescaler, PWM entire cycle */
+		clk_div = val >> div_m;
+		if (clk_div <= 65534) {
+			prescaler = 0;
+		} else {
+			prescaler = DIV_ROUND_UP_ULL(clk_div - 65534, 65535);
+			if (prescaler >= 256) {
+				ret = -EINVAL;
+				goto unlock_mutex;
+			}
+			do_div(clk_div, prescaler + 1);
+		}
+
+		period = FIELD_PREP(PWM_PERIOD_ENTIRE_CYCLE, clk_div);
+
+		/* set duty cycle */
+		val = state->duty_cycle * (use_bus_clk ? bus_rate : hosc_rate);
+		do_div(val, NSEC_PER_SEC);
+		clk_div = val >> div_m;
+		do_div(clk_div, prescaler + 1);
+
+		/*
+		 * The formula of the output period and the duty-cycle for PWM are as follows.
+		 * T period = (PWM01_CLK / PWM0_PRESCALE_K)^-1 * (PPR0.PWM_ENTIRE_CYCLE + 1)
+		 * T high-level = (PWM01_CLK / PWM0_PRESCALE_K)^-1 * PPR0.PWM_ACT_CYCLE
+		 * Duty-cycle = T high-level / T period
+		 * In accordance with this formula, in order to set the duty-cycle to 100%,
+		 * it is necessary that PWM_ACT_CYCLE >= PWM_ENTIRE_CYCLE + 1
+		 */
+		if (state->duty_cycle == state->period)
+			clk_div++;
+		period |= FIELD_PREP(PWM_PERIOD_ACT_CYCLE, clk_div);
+		sun20i_pwm_writel(sun20i_chip, period, PWM_PERIOD(pwm->hwpwm));
+
+		ctl = FIELD_PREP(PWM_CTL_PRESCAL_K, prescaler);
+		if (state->polarity == PWM_POLARITY_NORMAL)
+			ctl |= PWM_CTL_ACT_STA;
+
+		sun20i_pwm_writel(sun20i_chip, ctl, PWM_CTL(pwm->hwpwm));
+	}
+
+	if (state->enabled != pwm->state.enabled && state->enabled) {
+		clk_gate &= ~PWM_CLK_GATE_BYPASS(pwm->hwpwm);
+		clk_gate |= PWM_CLK_GATE_GATING(pwm->hwpwm);
+		pwm_en |= PWM_ENABLE_EN(pwm->hwpwm);
+		sun20i_pwm_writel(sun20i_chip, pwm_en, PWM_ENABLE);
+		sun20i_pwm_writel(sun20i_chip, clk_gate, PWM_CLK_GATE);
+	}
+
+unlock_mutex:
+	mutex_unlock(&sun20i_chip->mutex);
+
+	return ret;
+}
+
+static const struct pwm_ops sun20i_pwm_ops = {
+	.get_state = sun20i_pwm_get_state,
+	.apply = sun20i_pwm_apply,
+	.owner = THIS_MODULE,
+};
+
+static const struct of_device_id sun20i_pwm_dt_ids[] = {
+	{ .compatible = "allwinner,sun20i-d1-pwm" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, sun20i_pwm_dt_ids);
+
+static int sun20i_pwm_probe(struct platform_device *pdev)
+{
+	struct sun20i_pwm_chip *sun20i_chip;
+	int ret;
+
+	sun20i_chip = devm_kzalloc(&pdev->dev, sizeof(*sun20i_chip), GFP_KERNEL);
+	if (!sun20i_chip)
+		return -ENOMEM;
+
+	sun20i_chip->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(sun20i_chip->base))
+		return PTR_ERR(sun20i_chip->base);
+
+	sun20i_chip->clk_bus = devm_clk_get_enabled(&pdev->dev, "bus");
+	if (IS_ERR(sun20i_chip->clk_bus))
+		return dev_err_probe(&pdev->dev, PTR_ERR(sun20i_chip->clk_bus),
+				     "failed to get bus clock\n");
+
+	sun20i_chip->clk_hosc = devm_clk_get_enabled(&pdev->dev, "hosc");
+	if (IS_ERR(sun20i_chip->clk_hosc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(sun20i_chip->clk_hosc),
+				     "failed to get hosc clock\n");
+
+	sun20i_chip->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(sun20i_chip->rst))
+		return dev_err_probe(&pdev->dev, PTR_ERR(sun20i_chip->rst),
+				     "failed to get bus reset\n");
+
+	ret = of_property_read_u32(pdev->dev.of_node, "allwinner,pwm-channels",
+				   &sun20i_chip->chip.npwm);
+	if (ret)
+		sun20i_chip->chip.npwm = 8;
+
+	/* Deassert reset */
+	ret = reset_control_deassert(sun20i_chip->rst);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to deassert reset\n");
+
+	sun20i_chip->chip.dev = &pdev->dev;
+	sun20i_chip->chip.ops = &sun20i_pwm_ops;
+
+	mutex_init(&sun20i_chip->mutex);
+
+	ret = pwmchip_add(&sun20i_chip->chip);
+	if (ret < 0) {
+		reset_control_assert(sun20i_chip->rst);
+		return dev_err_probe(&pdev->dev, ret, "failed to add PWM chip\n");
+	}
+
+	platform_set_drvdata(pdev, sun20i_chip);
+
+	return 0;
+}
+
+static void sun20i_pwm_remove(struct platform_device *pdev)
+{
+	struct sun20i_pwm_chip *sun20i_chip = platform_get_drvdata(pdev);
+
+	pwmchip_remove(&sun20i_chip->chip);
+
+	reset_control_assert(sun20i_chip->rst);
+}
+
+static struct platform_driver sun20i_pwm_driver = {
+	.driver = {
+		.name = "sun20i-pwm",
+		.of_match_table = sun20i_pwm_dt_ids,
+	},
+	.probe = sun20i_pwm_probe,
+	.remove_new = sun20i_pwm_remove,
+};
+module_platform_driver(sun20i_pwm_driver);
+
+MODULE_AUTHOR("Aleksandr Shubin <privatesub2@gmail.com>");
+MODULE_DESCRIPTION("Allwinner sun20i PWM driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
