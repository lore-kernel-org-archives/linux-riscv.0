Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA6AC282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 09:26:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B2C1222C0
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 09:26:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MYoxTKN8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="QWUL7AAD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B2C1222C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bT3hFbbWmKbkNeDK2Pp2whGWNyY+HJOcSQwEGXQS48g=; b=MYoxTKN8CWVc54yCQxMnBB4nvI
	4ufkMnQ6nTNJqpceUcaj9Si4fvnPZj2GQTP0haQHaxeAZc1bjY3a8M0oIVp2zb9lFveOfWiaNqa2j
	L4kAUVgpE6z7SAqzKBbIQnbS/5bPvXeQ2EuhIAjpVyJV7AWg5I6LXVce9muO86AnrWKAb/jrXWXn0
	lgvh54GAEStLUWX4CWjtuME/xc7NvgSbvWMP5jI8Y2Tx3EH06NFq35i5G7XGoT4eFkhqNWbCWIjhX
	CLiXPZucsuSrkRtePjSFVTbWG+wVGxpbZujm35wqSrDHzEFS0U/pT1QxSAylYz5wkbM0PVqzZZG1y
	A8dOWHIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtqoZ-0006YW-Gf; Wed, 13 Feb 2019 09:26:47 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtqoW-0006XU-A1
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 09:26:46 +0000
Received: by mail-pg1-x542.google.com with SMTP id i130so886615pgd.1
 for <linux-riscv@lists.infradead.org>; Wed, 13 Feb 2019 01:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pi5WomQT9OaEzy0AO2h3w+hv3sahJMlqmq58xEsHiPA=;
 b=QWUL7AADoA6rQITfvjwd9l0+S5gLg8bEQGlvwNnFO7G3CyaBiS4OVQpe2VDLxtS8Gm
 uFImRGc/cv3K0bjcaCuelbMZgIA9TZo8kFxWtXRnoJIuQSpkB3nECJ3/r3DEZDfuP7iB
 osXheysaLEsu0CFQENu8EWDAHzQDi549BB8Ts0GFZQQor4Vii2H7+Px2C+uqZlf098Dq
 iW807TycsP4/unlh0Ng44ztfL4J6N0i14op661wpT50Qcjk2lfBdWXEK77UQy+Ja4hAa
 QWsfwEP9anE603zfTd7tb4XdWw3NI4yblD0IH/9R7SAbH3t1lZK4De0Jx042Na46HP2+
 /X1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pi5WomQT9OaEzy0AO2h3w+hv3sahJMlqmq58xEsHiPA=;
 b=YnlzDYdlDDx1U4c58neU7bLPksTxKgHlEPyqrjWoJn+WRHkGQyCjVmEnmJvfPIdHzp
 jHV345qSeLeEbCovRwDlcqw8azbHVyVHRDbaKswx4wqYnyBEshM5GUcnLD+SDNSa6byV
 fkBc05ylWgECSPmf8ZzQpc4JBIQSKCjEd1Vm8CZFM9judHVKkkGFcJBk5gG14tbjE9TC
 zFFXXl5SWdkL3z03e1GE8dIf12dGo7hxNEh32JHEvI1JevfXqPJkmCacjkci6GvkcdiM
 7v13EoVAiqyBs9J6WWugmsstLAcXEamoLo4YdXuSfLAspaErsPS0SImLHvW/ABwKBQKV
 7h/w==
X-Gm-Message-State: AHQUAuasDy2oTLwJ/4uSWDTX1hUPrQQwI1Zmk5gForl4xBmXzDRiQ3PM
 DfLx/duJlGU+uSDovr6HAa2GJg==
X-Google-Smtp-Source: AHgI3IbGbK92d0qYRT0A6gdiCNlHEUNTHP0lhh/BwaRsw6/D+jGy860nzAL50gU+bAuGJFRl6x1vJA==
X-Received: by 2002:aa7:8212:: with SMTP id k18mr8714964pfi.48.1550050003555; 
 Wed, 13 Feb 2019 01:26:43 -0800 (PST)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id v75sm188875pfa.164.2019.02.13.01.26.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 13 Feb 2019 01:26:42 -0800 (PST)
From: Yash Shah <yash.shah@sifive.com>
To: palmer@sifive.com, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v6 2/2] pwm: sifive: Add a driver for SiFive SoC PWM
Date: Wed, 13 Feb 2019 14:56:18 +0530
Message-Id: <1550049978-20705-3-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1550049978-20705-1-git-send-email-yash.shah@sifive.com>
References: <1550049978-20705-1-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_012644_357160_FB35108F 
X-CRM114-Status: GOOD (  21.49  )
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
 drivers/pwm/pwm-sifive.c | 311 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 323 insertions(+)
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
index 0000000..c0eb90e
--- /dev/null
+++ b/drivers/pwm/pwm-sifive.c
@@ -0,0 +1,311 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2017-2018 SiFive
+ * For SiFive's PWM IP block documentation please refer Chapter 14 of
+ * Reference Manual : https://static.dev.sifive.com/FU540-C000-v1.0.pdf
+ */
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+#include <linux/slab.h>
+
+/* Register offsets */
+#define PWM_SIFIVE_PWMCFG		0x0
+#define PWM_SIFIVE_PWMCOUNT		0x8
+#define PWM_SIFIVE_PWMS			0x10
+#define PWM_SIFIVE_PWMCMP0		0x20
+
+/* PWMCFG fields */
+#define PWM_SIFIVE_PWMCFG_SCALE		0
+#define PWM_SIFIVE_PWMCFG_STICKY	8
+#define PWM_SIFIVE_PWMCFG_ZERO_CMP	9
+#define PWM_SIFIVE_PWMCFG_DEGLITCH	10
+#define PWM_SIFIVE_PWMCFG_EN_ALWAYS	12
+#define PWM_SIFIVE_PWMCFG_EN_ONCE	13
+#define PWM_SIFIVE_PWMCFG_CENTER	16
+#define PWM_SIFIVE_PWMCFG_GANG		24
+#define PWM_SIFIVE_PWMCFG_IP		28
+
+/* PWM_SIFIVE_SIZE_PWMCMP is used to calculate offset for pwmcmpX registers */
+#define PWM_SIFIVE_SIZE_PWMCMP		4
+#define PWM_SIFIVE_CMPWIDTH		16
+
+struct pwm_sifive_ddata {
+	struct pwm_chip	chip;
+	struct notifier_block notifier;
+	struct clk *clk;
+	void __iomem *regs;
+	unsigned int real_period;
+	int user_count;
+};
+
+static inline
+struct pwm_sifive_ddata *pwm_sifive_chip_to_ddata(struct pwm_chip *c)
+{
+	return container_of(c, struct pwm_sifive_ddata, chip);
+}
+
+static int pwm_sifive_request(struct pwm_chip *chip, struct pwm_device *dev)
+{
+	struct pwm_sifive_ddata *pwm = pwm_sifive_chip_to_ddata(chip);
+
+	pwm->user_count++;
+
+	return 0;
+}
+
+static void pwm_sifive_free(struct pwm_chip *chip, struct pwm_device *dev)
+{
+	struct pwm_sifive_ddata *pwm = pwm_sifive_chip_to_ddata(chip);
+
+	pwm->user_count--;
+}
+
+static void pwm_sifive_update_clock(struct pwm_sifive_ddata *pwm,
+				    unsigned long rate)
+{
+	/* (1 << (16+scale)) * 10^9/rate = real_period */
+	unsigned long scale_pow =
+			div64_ul(pwm->real_period * (u64)rate, NSEC_PER_SEC);
+	int scale = clamp(ilog2(scale_pow) - PWM_SIFIVE_CMPWIDTH, 0, 0xf);
+
+	writel((1 << PWM_SIFIVE_PWMCFG_EN_ALWAYS) | (scale <<
+	       PWM_SIFIVE_PWMCFG_SCALE), pwm->regs + PWM_SIFIVE_PWMCFG);
+
+	/* As scale <= 15 the shift operation cannot overflow. */
+	pwm->real_period = div64_ul(1000000000ULL << (PWM_SIFIVE_CMPWIDTH +
+				    scale), rate);
+	dev_dbg(pwm->chip.dev, "New real_period = %u ns\n", pwm->real_period);
+}
+
+static void pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_device *dev,
+				 struct pwm_state *state)
+{
+	struct pwm_sifive_ddata *pwm = pwm_sifive_chip_to_ddata(chip);
+	u32 duty;
+	int val;
+
+	duty = readl(pwm->regs + PWM_SIFIVE_PWMCMP0 + dev->hwpwm *
+		     PWM_SIFIVE_SIZE_PWMCMP);
+
+	val = readl(pwm->regs + PWM_SIFIVE_PWMCFG);
+	state->enabled = (val & BIT(PWM_SIFIVE_PWMCFG_EN_ALWAYS)) > 0;
+
+	val &= 0x0F;
+	pwm->real_period = div64_ul(1000000000ULL << (PWM_SIFIVE_CMPWIDTH +
+				    val), clk_get_rate(pwm->clk));
+
+	state->period = pwm->real_period;
+	state->duty_cycle = ((u64)duty * pwm->real_period) >>
+			    PWM_SIFIVE_CMPWIDTH;
+	state->polarity = PWM_POLARITY_INVERSED;
+}
+
+static int pwm_sifive_enable(struct pwm_chip *chip, struct pwm_device *dev,
+			     bool enable)
+{
+	struct pwm_sifive_ddata *pwm = pwm_sifive_chip_to_ddata(chip);
+	u32 val;
+	int ret;
+
+	if (enable) {
+		ret = clk_enable(pwm->clk);
+		if (ret) {
+			dev_err(pwm->chip.dev, "Enable clk failed:%d\n", ret);
+			return ret;
+		}
+	}
+
+	val = readl(pwm->regs + PWM_SIFIVE_PWMCFG);
+
+	if (enable)
+		val |= BIT(PWM_SIFIVE_PWMCFG_EN_ALWAYS);
+	else
+		val &= ~BIT(PWM_SIFIVE_PWMCFG_EN_ALWAYS);
+
+	writel(val, pwm->regs + PWM_SIFIVE_PWMCFG);
+
+	if (!enable)
+		clk_disable(pwm->clk);
+
+	return 0;
+}
+
+static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *dev,
+			    struct pwm_state *state)
+{
+	struct pwm_sifive_ddata *pwm = pwm_sifive_chip_to_ddata(chip);
+	unsigned int duty_cycle;
+	u32 frac, val;
+	struct pwm_state cur_state;
+	bool enabled;
+	int ret;
+
+	pwm_get_state(dev, &cur_state);
+	enabled = cur_state.enabled;
+
+	if (state->polarity != PWM_POLARITY_INVERSED)
+		return -EINVAL;
+
+	if (state->period != cur_state.period) {
+		if (pwm->user_count != 1)
+			return -EINVAL;
+		pwm->real_period = state->period;
+		pwm_sifive_update_clock(pwm, clk_get_rate(pwm->clk));
+	}
+
+	if (!state->enabled && enabled) {
+		ret = pwm_sifive_enable(chip, dev, false);
+		if (ret)
+			return ret;
+		enabled = false;
+	}
+
+	duty_cycle = state->duty_cycle;
+	frac = div_u64((u64)duty_cycle * (1 << PWM_SIFIVE_CMPWIDTH) +
+		       (1 << PWM_SIFIVE_CMPWIDTH) / 2, state->period);
+	/* The hardware cannot generate a 100% duty cycle */
+	frac = min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
+
+	val = readl(pwm->regs + PWM_SIFIVE_PWMCFG);
+	val |= BIT(PWM_SIFIVE_PWMCFG_DEGLITCH);
+	writel(val, pwm->regs + PWM_SIFIVE_PWMCFG);
+
+	writel(frac, pwm->regs + PWM_SIFIVE_PWMCMP0 + dev->hwpwm *
+	       PWM_SIFIVE_SIZE_PWMCMP);
+
+	val &= ~BIT(PWM_SIFIVE_PWMCFG_DEGLITCH);
+	writel(val, pwm->regs + PWM_SIFIVE_PWMCFG);
+
+	if (state->enabled != enabled) {
+		ret = pwm_sifive_enable(chip, dev, state->enabled);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
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
+	struct pwm_sifive_ddata *pwm =
+		container_of(nb, struct pwm_sifive_ddata, notifier);
+
+	if (event == POST_RATE_CHANGE)
+		pwm_sifive_update_clock(pwm, ndata->new_rate);
+
+	return NOTIFY_OK;
+}
+
+static int pwm_sifive_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct pwm_sifive_ddata *pwm;
+	struct pwm_chip *chip;
+	struct resource *res;
+	int ret;
+
+	pwm = devm_kzalloc(dev, sizeof(*pwm), GFP_KERNEL);
+	if (!pwm)
+		return -ENOMEM;
+
+	chip = &pwm->chip;
+	chip->dev = dev;
+	chip->ops = &pwm_sifive_ops;
+	chip->of_pwm_n_cells = 3;
+	chip->base = -1;
+	chip->npwm = 4;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	pwm->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(pwm->regs)) {
+		dev_err(dev, "Unable to map IO resources\n");
+		return PTR_ERR(pwm->regs);
+	}
+
+	pwm->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(pwm->clk)) {
+		if (PTR_ERR(pwm->clk) != -EPROBE_DEFER)
+			dev_err(dev, "Unable to find controller clock\n");
+		return PTR_ERR(pwm->clk);
+	}
+
+	ret = clk_prepare_enable(pwm->clk);
+	if (ret) {
+		dev_err(dev, "failed to enable clock for pwm: %d\n", ret);
+		return ret;
+	}
+
+	/* Watch for changes to underlying clock frequency */
+	pwm->notifier.notifier_call = pwm_sifive_clock_notifier;
+	ret = clk_notifier_register(pwm->clk, &pwm->notifier);
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
+	if (!pwm_is_enabled(pwm->chip.pwms))
+		clk_disable(pwm->clk);
+
+	platform_set_drvdata(pdev, pwm);
+	dev_dbg(dev, "SiFive PWM chip registered %d PWMs\n", chip->npwm);
+
+	return 0;
+
+unregister_clk:
+	clk_notifier_unregister(pwm->clk, &pwm->notifier);
+disable_clk:
+	clk_disable_unprepare(pwm->clk);
+
+	return ret;
+}
+
+static int pwm_sifive_remove(struct platform_device *dev)
+{
+	struct pwm_sifive_ddata *pwm = platform_get_drvdata(dev);
+	int ret;
+
+	ret = pwmchip_remove(&pwm->chip);
+	clk_notifier_unregister(pwm->clk, &pwm->notifier);
+	if (!pwm_is_enabled(pwm->chip.pwms))
+		clk_disable(pwm->clk);
+	clk_unprepare(pwm->clk);
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
