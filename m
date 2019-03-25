Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B839C10F06
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 10:13:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39A6320989
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 10:13:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gAGJQwJ+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="bdfhX6yO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39A6320989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=P9bgj8+W+UCABP5Y8mL0lteOH66RPRE2FhJzRMzF/qM=; b=gAGJQwJ+XEYCUoQEOB8YsDO/nJ
	ibTgqTD8vrFBKkqM7EjyvI3r/AA4QUB7+v3jOB1CHNVo9lqmzlA3K1oJCwzC8BhA9n5OFxLY9AyG+
	BYsLMz/cC84EAmi8T7bn5IoFyxJpvDtgf+GGP/v29BDg6ZLELy50s1tyO323JKh9fn7QvRFQB4BW6
	KgOa5h56nbz71mFb9paIlGwGdOa0yWNzSDOxlfLp5x2f9m98X2l0NLFttCHB3/qbyhVqtipUbqsCq
	8XtDhfoh//tb1rYe76EP4YSX/FMZ2z7Vzk07bxsFrC8v9bElFcrZvpHVW082DE+Vh+bUxQtnLuXMq
	l68HkGKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8Mbn-0000JL-EF; Mon, 25 Mar 2019 10:13:35 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8Mbk-0000Ij-2w
 for linux-riscv@lists.infradead.org; Mon, 25 Mar 2019 10:13:34 +0000
Received: by mail-pf1-x444.google.com with SMTP id 10so6074751pfo.5
 for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2019 03:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RdU0HXcdNPeRJH0qDIHvqh6U/3Vd325g1P7G8YSBZL0=;
 b=bdfhX6yO9yWDvYsshVaUqT01Gf1QzM9QyF5wkzB0+vc52bDXNbV5cBDMaB2qWnvHod
 34Ql6V4FiwYYeqIjvTJWDatot4/wLApwjwQWSkX/mR3j+uLQA7M88gd2UbPiCN5s7SKF
 dND9MgGyblzdm/CCaELF4M0SATfnFynnKKMDAkw0We9hqOgbAeCnj5ClDIMvcnFR5vo5
 n5BPQagi2mGGymNyYSqT1MIBRRg2ER8bceTg+afnXuHxq0nDrTLJb07W2+TM2VTKGb1M
 fhMg7OzukA6+MiweLL/TaWzY7Cpa+Y50MLa5YKXoUPFPnpZRRBbN5rT4GcS/XbqZQ8tY
 /b8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RdU0HXcdNPeRJH0qDIHvqh6U/3Vd325g1P7G8YSBZL0=;
 b=kb23Vb1lj4uYAatxGMgQhi3aSMv63YJ0jFDCa3r0bGoW2g+NXkz0ZHb2u/ncslVDgl
 TkBxtL/bdd7x+4fEggmAHkS9LYu9O24xacCYCgfW/AeMZYxQ6E0zDXhFXT0ZBQToGY6O
 DqVjo4CdRW29XrHWWl31iw0kt4qxoKVxK4PXkTrZ+uzCg9v0gwr3PVv65eI4lvOB6RAD
 l9UYbaKl3y2v8Nw9QCI7ql/3efYWwHe/ytjzrCuXNCZU9wTTfnNIeyqEaSQasQYMFHFX
 eAI6dNxnSGplecWns78CzhLAhF+PaKxakWCdRclS9TF2ivZM7ZFc5oeimsGlpIdP8KQY
 Wz8Q==
X-Gm-Message-State: APjAAAWbXacxnfD/cHbl3S5xN8aszhF+jz/OXSCx6mYNTrpv/Ht0exZ5
 OnUu+38JjSBs1I7KR8bPXRehkA==
X-Google-Smtp-Source: APXvYqwg7Lqdgoj4HVrlDCutw4/Rl7GxACjHdnfoSr3nPhwTGWn8e3GJjiDI89Mi4gZK6pZ6buLoUQ==
X-Received: by 2002:a63:6ac1:: with SMTP id f184mr3271371pgc.25.1553508810560; 
 Mon, 25 Mar 2019 03:13:30 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id
 v82sm30151298pfa.170.2019.03.25.03.13.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 03:13:29 -0700 (PDT)
From: Yash Shah <yash.shah@sifive.com>
To: palmer@sifive.com, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v11 2/2] pwm: sifive: Add a driver for SiFive SoC PWM
Date: Mon, 25 Mar 2019 15:42:59 +0530
Message-Id: <1553508779-9685-3-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1553508779-9685-1-git-send-email-yash.shah@sifive.com>
References: <1553508779-9685-1-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_031332_128498_D7A4ADBA 
X-CRM114-Status: GOOD (  23.54  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, sachin.ghadi@sifive.com,
 Yash Shah <yash.shah@sifive.com>, thierry.reding@gmail.com,
 paul.walmsley@sifive.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Adds a PWM driver for PWM chip present in SiFive's HiFive Unleashed SoC.

Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
[Atish: Various fixes and code cleanup]
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 drivers/pwm/Kconfig      |  11 ++
 drivers/pwm/Makefile     |   1 +
 drivers/pwm/pwm-sifive.c | 338 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 350 insertions(+)
 create mode 100644 drivers/pwm/pwm-sifive.c

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index a8f47df..4a61d1a 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -380,6 +380,17 @@ config PWM_SAMSUNG
 	  To compile this driver as a module, choose M here: the module
 	  will be called pwm-samsung.
 
+config PWM_SIFIVE
+	tristate "SiFive PWM support"
+	depends on OF
+	depends on COMMON_CLK
+	depends on RISCV || COMPILE_TEST
+	help
+	  Generic PWM framework driver for SiFive SoCs.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called pwm-sifive.
+
 config PWM_SPEAR
 	tristate "STMicroelectronics SPEAr PWM support"
 	depends on PLAT_SPEAR
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index 9c676a0..30089ca 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -37,6 +37,7 @@ obj-$(CONFIG_PWM_RCAR)		+= pwm-rcar.o
 obj-$(CONFIG_PWM_RENESAS_TPU)	+= pwm-renesas-tpu.o
 obj-$(CONFIG_PWM_ROCKCHIP)	+= pwm-rockchip.o
 obj-$(CONFIG_PWM_SAMSUNG)	+= pwm-samsung.o
+obj-$(CONFIG_PWM_SIFIVE)	+= pwm-sifive.o
 obj-$(CONFIG_PWM_SPEAR)		+= pwm-spear.o
 obj-$(CONFIG_PWM_STI)		+= pwm-sti.o
 obj-$(CONFIG_PWM_STM32)		+= pwm-stm32.o
diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
new file mode 100644
index 0000000..1921e6ea
--- /dev/null
+++ b/drivers/pwm/pwm-sifive.c
@@ -0,0 +1,338 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2017-2018 SiFive
+ * For SiFive's PWM IP block documentation please refer Chapter 14 of
+ * Reference Manual : https://static.dev.sifive.com/FU540-C000-v1.0.pdf
+ *
+ * Limitations:
+ * - When changing both duty cycle and period, we cannot prevent in
+ *   software that the output might produce a period with mixed
+ *   settings (new period length and old duty cycle).
+ * - The hardware cannot generate a 100% duty cycle.
+ * - The hardware generates only inverted output.
+ */
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+#include <linux/slab.h>
+#include <linux/bitfield.h>
+
+/* Register offsets */
+#define PWM_SIFIVE_PWMCFG		0x0
+#define PWM_SIFIVE_PWMCOUNT		0x8
+#define PWM_SIFIVE_PWMS			0x10
+#define PWM_SIFIVE_PWMCMP0		0x20
+
+/* PWMCFG fields */
+#define PWM_SIFIVE_PWMCFG_SCALE		GENMASK(3, 0)
+#define PWM_SIFIVE_PWMCFG_STICKY	BIT(8)
+#define PWM_SIFIVE_PWMCFG_ZERO_CMP	BIT(9)
+#define PWM_SIFIVE_PWMCFG_DEGLITCH	BIT(10)
+#define PWM_SIFIVE_PWMCFG_EN_ALWAYS	BIT(12)
+#define PWM_SIFIVE_PWMCFG_EN_ONCE	BIT(13)
+#define PWM_SIFIVE_PWMCFG_CENTER	BIT(16)
+#define PWM_SIFIVE_PWMCFG_GANG		BIT(24)
+#define PWM_SIFIVE_PWMCFG_IP		BIT(28)
+
+/* PWM_SIFIVE_SIZE_PWMCMP is used to calculate offset for pwmcmpX registers */
+#define PWM_SIFIVE_SIZE_PWMCMP		4
+#define PWM_SIFIVE_CMPWIDTH		16
+#define PWM_SIFIVE_DEFAULT_PERIOD	10000000
+
+struct pwm_sifive_ddata {
+	struct pwm_chip	chip;
+	struct mutex lock; /* lock to protect user_count */
+	struct notifier_block notifier;
+	struct clk *clk;
+	void __iomem *regs;
+	unsigned int real_period;
+	unsigned int approx_period;
+	int user_count;
+};
+
+static inline
+struct pwm_sifive_ddata *pwm_sifive_chip_to_ddata(struct pwm_chip *c)
+{
+	return container_of(c, struct pwm_sifive_ddata, chip);
+}
+
+static int pwm_sifive_request(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct pwm_sifive_ddata *ddata = pwm_sifive_chip_to_ddata(chip);
+
+	mutex_lock(&ddata->lock);
+	ddata->user_count++;
+	mutex_unlock(&ddata->lock);
+
+	return 0;
+}
+
+static void pwm_sifive_free(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct pwm_sifive_ddata *ddata = pwm_sifive_chip_to_ddata(chip);
+
+	mutex_lock(&ddata->lock);
+	ddata->user_count--;
+	mutex_unlock(&ddata->lock);
+}
+
+static void pwm_sifive_update_clock(struct pwm_sifive_ddata *ddata,
+				    unsigned long rate)
+{
+	unsigned long long num;
+	unsigned long scale_pow;
+	int scale;
+	u32 val;
+	/*
+	 * The PWM unit is used with pwmzerocmp=0, so the only way to modify the
+	 * period length is using pwmscale which provides the number of bits the
+	 * counter is shifted before being feed to the comparators. A period
+	 * lasts (1 << (PWM_SIFIVE_CMPWIDTH + pwmscale)) clock ticks.
+	 * (1 << (PWM_SIFIVE_CMPWIDTH + scale)) * 10^9/rate = period
+	 */
+	scale_pow = div64_ul(ddata->approx_period * (u64)rate, NSEC_PER_SEC);
+	scale = clamp(ilog2(scale_pow) - PWM_SIFIVE_CMPWIDTH, 0, 0xf);
+
+	val = PWM_SIFIVE_PWMCFG_EN_ALWAYS |
+	      FIELD_PREP(PWM_SIFIVE_PWMCFG_SCALE, scale);
+	writel(val, ddata->regs + PWM_SIFIVE_PWMCFG);
+
+	/* As scale <= 15 the shift operation cannot overflow. */
+	num = (unsigned long long)NSEC_PER_SEC << (PWM_SIFIVE_CMPWIDTH + scale);
+	ddata->real_period = div64_ul(num, rate);
+	dev_dbg(ddata->chip.dev,
+		"New real_period = %u ns\n", ddata->real_period);
+}
+
+static void pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+				 struct pwm_state *state)
+{
+	struct pwm_sifive_ddata *ddata = pwm_sifive_chip_to_ddata(chip);
+	u32 duty, val;
+
+	duty = readl(ddata->regs + PWM_SIFIVE_PWMCMP0 +
+		     pwm->hwpwm * PWM_SIFIVE_SIZE_PWMCMP);
+
+	state->enabled = duty > 0;
+
+	val = readl(ddata->regs + PWM_SIFIVE_PWMCFG);
+	if (!(val & PWM_SIFIVE_PWMCFG_EN_ALWAYS))
+		state->enabled = false;
+
+	state->period = ddata->real_period;
+	state->duty_cycle =
+		(u64)duty * ddata->real_period >> PWM_SIFIVE_CMPWIDTH;
+	state->polarity = PWM_POLARITY_INVERSED;
+}
+
+static int pwm_sifive_enable(struct pwm_chip *chip, bool enable)
+{
+	struct pwm_sifive_ddata *ddata = pwm_sifive_chip_to_ddata(chip);
+	int ret;
+
+	if (enable) {
+		ret = clk_enable(ddata->clk);
+		if (ret) {
+			dev_err(ddata->chip.dev, "Enable clk failed\n");
+			return ret;
+		}
+	}
+
+	if (!enable)
+		clk_disable(ddata->clk);
+
+	return 0;
+}
+
+static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			    struct pwm_state *state)
+{
+	struct pwm_sifive_ddata *ddata = pwm_sifive_chip_to_ddata(chip);
+	struct pwm_state cur_state;
+	unsigned int duty_cycle;
+	unsigned long long num;
+	bool enabled;
+	int ret = 0;
+	u32 frac;
+
+	if (state->polarity != PWM_POLARITY_INVERSED)
+		return -EINVAL;
+
+	ret = clk_enable(ddata->clk);
+	if (ret) {
+		dev_err(ddata->chip.dev, "Enable clk failed\n");
+		return ret;
+	}
+
+	mutex_lock(&ddata->lock);
+	cur_state = pwm->state;
+	enabled = cur_state.enabled;
+
+	duty_cycle = state->duty_cycle;
+	if (!state->enabled)
+		duty_cycle = 0;
+
+	/*
+	 * The problem of output producing mixed setting as mentioned at top,
+	 * occurs here. To minimize the window for this problem, we are
+	 * calculating the register values first and then writing them
+	 * consecutively
+	 */
+	num = (u64)duty_cycle * (1U << PWM_SIFIVE_CMPWIDTH);
+	frac = DIV_ROUND_CLOSEST_ULL(num, state->period);
+	/* The hardware cannot generate a 100% duty cycle */
+	frac = min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
+
+	if (state->period != ddata->approx_period) {
+		if (ddata->user_count != 1) {
+			ret = -EBUSY;
+			goto exit;
+		}
+		ddata->approx_period = state->period;
+		pwm_sifive_update_clock(ddata, clk_get_rate(ddata->clk));
+	}
+
+	writel(frac, ddata->regs + PWM_SIFIVE_PWMCMP0 +
+	       pwm->hwpwm * PWM_SIFIVE_SIZE_PWMCMP);
+
+	if (state->enabled != enabled)
+		pwm_sifive_enable(chip, state->enabled);
+
+exit:
+	clk_disable(ddata->clk);
+	mutex_unlock(&ddata->lock);
+	return ret;
+}
+
+static const struct pwm_ops pwm_sifive_ops = {
+	.request = pwm_sifive_request,
+	.free = pwm_sifive_free,
+	.get_state = pwm_sifive_get_state,
+	.apply = pwm_sifive_apply,
+	.owner = THIS_MODULE,
+};
+
+static int pwm_sifive_clock_notifier(struct notifier_block *nb,
+				     unsigned long event, void *data)
+{
+	struct clk_notifier_data *ndata = data;
+	struct pwm_sifive_ddata *ddata =
+		container_of(nb, struct pwm_sifive_ddata, notifier);
+
+	if (event == POST_RATE_CHANGE)
+		pwm_sifive_update_clock(ddata, ndata->new_rate);
+
+	return NOTIFY_OK;
+}
+
+static int pwm_sifive_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct pwm_sifive_ddata *ddata;
+	struct pwm_chip *chip;
+	struct resource *res;
+	int ret;
+
+	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	mutex_init(&ddata->lock);
+	chip = &ddata->chip;
+	chip->dev = dev;
+	chip->ops = &pwm_sifive_ops;
+	chip->of_xlate = of_pwm_xlate_with_flags;
+	chip->of_pwm_n_cells = 3;
+	chip->base = -1;
+	chip->npwm = 4;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	ddata->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(ddata->regs)) {
+		dev_err(dev, "Unable to map IO resources\n");
+		return PTR_ERR(ddata->regs);
+	}
+
+	ddata->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(ddata->clk)) {
+		if (PTR_ERR(ddata->clk) != -EPROBE_DEFER)
+			dev_err(dev, "Unable to find controller clock\n");
+		return PTR_ERR(ddata->clk);
+	}
+
+	ret = clk_prepare_enable(ddata->clk);
+	if (ret) {
+		dev_err(dev, "failed to enable clock for pwm: %d\n", ret);
+		return ret;
+	}
+
+	/* Watch for changes to underlying clock frequency */
+	ddata->notifier.notifier_call = pwm_sifive_clock_notifier;
+	ret = clk_notifier_register(ddata->clk, &ddata->notifier);
+	if (ret) {
+		dev_err(dev, "failed to register clock notifier: %d\n", ret);
+		goto disable_clk;
+	}
+
+	ret = pwmchip_add(chip);
+	if (ret < 0) {
+		dev_err(dev, "cannot register PWM: %d\n", ret);
+		goto unregister_clk;
+	}
+
+	platform_set_drvdata(pdev, ddata);
+	dev_dbg(dev, "SiFive PWM chip registered %d PWMs\n", chip->npwm);
+
+	return 0;
+
+unregister_clk:
+	clk_notifier_unregister(ddata->clk, &ddata->notifier);
+disable_clk:
+	clk_disable_unprepare(ddata->clk);
+
+	return ret;
+}
+
+static int pwm_sifive_remove(struct platform_device *dev)
+{
+	struct pwm_sifive_ddata *ddata = platform_get_drvdata(dev);
+	bool is_enabled = false;
+	struct pwm_device *pwm;
+	int ret, ch;
+
+	ret = pwmchip_remove(&ddata->chip);
+	clk_notifier_unregister(ddata->clk, &ddata->notifier);
+
+	for (ch = 0; ch < ddata->chip.npwm; ch++) {
+		pwm = &ddata->chip.pwms[ch];
+		if (pwm->state.enabled) {
+			is_enabled = true;
+			break;
+		}
+	}
+	if (is_enabled)
+		clk_disable(ddata->clk);
+	clk_disable_unprepare(ddata->clk);
+	return ret;
+}
+
+static const struct of_device_id pwm_sifive_of_match[] = {
+	{ .compatible = "sifive,pwm0" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, pwm_sifive_of_match);
+
+static struct platform_driver pwm_sifive_driver = {
+	.probe = pwm_sifive_probe,
+	.remove = pwm_sifive_remove,
+	.driver = {
+		.name = "pwm-sifive",
+		.of_match_table = pwm_sifive_of_match,
+	},
+};
+module_platform_driver(pwm_sifive_driver);
+
+MODULE_DESCRIPTION("SiFive PWM driver");
+MODULE_LICENSE("GPL v2");
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
