Return-Path: <SRS0=TVEx=RE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2D3C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2019 10:54:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E06E92087E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2019 10:53:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J9jK4YqO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="cxJ6/v+Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E06E92087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZeZ/0ftFWwhSfeiMIGTwTYiyPd+EQkfVj9IME6o2oGc=; b=J9jK4YqOND3uDqN6GP90krQv3d
	j62A78Xbabd/VJo+6gbk28t6ZWXIPw7eX/hUD0qdbHQqTHb1AeLGVjKWwkHMUg9MuwXdNfz2/odQg
	gJ7lmKzf2SoHbHj++ZYOgMKaLAXcxNJ2hTaLpF2STlEiMlIS1mAVDqp7QMqKhe7ACJ1j5mFNBKv0Q
	0CGkbXiZY5w8goRkq/F74gG8uZCjLbpfRiaqhpCRm3yfOG7bryySH/WoHvNXXv6QvLuL8mxjG6ljK
	COWe0Na+ysl752eEOgwCIN7S5DSBXAzGnrsfV3dEhLm7xnKjIacr5LO+gJ4LAvq4kKEEZiJgRcJDJ
	ui3b57IA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzfnh-0004Er-9L; Fri, 01 Mar 2019 10:53:57 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzfnd-0004E2-Ae
 for linux-riscv@lists.infradead.org; Fri, 01 Mar 2019 10:53:55 +0000
Received: by mail-pg1-x541.google.com with SMTP id i130so11289128pgd.1
 for <linux-riscv@lists.infradead.org>; Fri, 01 Mar 2019 02:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Tsiu9KQkvZ4uo0MAQ1yDmevA0SGjXWfeBdDjS512Uow=;
 b=cxJ6/v+QJZIED8IyBuhP8qy9p/Q4u/DJSz7ZPOcrvaVtybgxfnIpTkfJq12BfIH3LX
 XhgthmiDwS86PR1Di2pTk0JOht8Zuamhbb49U0/f8y1HvHsduMiW3kOgHrq41EcMOgsR
 wk2NU86wfLmCc9nh5xGn6vr3ACs+wmIUDs9RHcvn7GLnvKacD4Ex0xaerc2gtG48gkGV
 CFpJdWZyFZR8XwLlwX3re0baxU2I/h8MZgB4KkmMFfB8Dm8MYDu5LDwI4MaTQ3uEErlW
 liomi82DrqfWBnZJKB192GQXLnO2Xq28He2St7uNtRaFIOnQhrTht/XNZ+10lNcEbJyx
 l4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Tsiu9KQkvZ4uo0MAQ1yDmevA0SGjXWfeBdDjS512Uow=;
 b=gZ3gUQLrPQC3goTigQt0RpubJVs+D2XDar6ATp/vc6xGFH9h8xmX3wqlELhYlnQR6u
 3asgit8PsvgmYiJA2a/sga6MxopRrimMdxuLwei7uYNmc9Ovr06wsVG9qjf5x4y6ZpTN
 RYM1P1dbl3A8hHZo8v4HJwTWgR0V0rMLRR09cZ14+midcB3+iNu7IujIs5hURLmmEPsT
 87YnQ4XT6B44WKHB+POBkhPrTWAC4osi3dkY8LGmF4Ie/+TXKyTNJB9OlSi6PXQejYiZ
 P+9EQcv7CAGjd8F5tSJw0mApQKuFLlU71uMqCjfBwcJ9LF3rotqSRL0b+IMkE08ZdeGq
 BJ4Q==
X-Gm-Message-State: APjAAAXRSJ5DsVB68ezQNncqSSaNoLTRTPejJahjhkUG3vQSxWOjJn/o
 XmRDs0L3oTwsePPwl7+vitufjQ==
X-Google-Smtp-Source: AHgI3IaWyoWJSYrXT8pR/ch9L+NP5rrn467AvJIlSjhVsVumP30F+xB0W5ZHDu9SYUBfScqRiTpWRw==
X-Received: by 2002:a62:4793:: with SMTP id p19mr5031190pfi.76.1551437632558; 
 Fri, 01 Mar 2019 02:53:52 -0800 (PST)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id
 k74sm49239164pfb.172.2019.03.01.02.53.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 01 Mar 2019 02:53:51 -0800 (PST)
From: Yash Shah <yash.shah@sifive.com>
To: palmer@sifive.com, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v8 2/2] pwm: sifive: Add a driver for SiFive SoC PWM
Date: Fri,  1 Mar 2019 16:23:19 +0530
Message-Id: <1551437599-29509-3-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1551437599-29509-1-git-send-email-yash.shah@sifive.com>
References: <1551437599-29509-1-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_025353_369654_96B8D95A 
X-CRM114-Status: GOOD (  22.94  )
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
 drivers/pwm/pwm-sifive.c | 345 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 357 insertions(+)
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
index 0000000..6679ec7
--- /dev/null
+++ b/drivers/pwm/pwm-sifive.c
@@ -0,0 +1,345 @@
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
+#define PWM_SIFIVE_PWMCFG_EN_ALWAYS	BIT(12)
+#define PWM_SIFIVE_PWMCFG_EN_ONCE	13
+#define PWM_SIFIVE_PWMCFG_CENTER	16
+#define PWM_SIFIVE_PWMCFG_GANG		24
+#define PWM_SIFIVE_PWMCFG_IP		28
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
+	mutex_lock(&pwm->lock);
+	pwm->user_count++;
+	mutex_unlock(&pwm->lock);
+
+	return 0;
+}
+
+static void pwm_sifive_free(struct pwm_chip *chip, struct pwm_device *dev)
+{
+	struct pwm_sifive_ddata *pwm = pwm_sifive_chip_to_ddata(chip);
+
+	mutex_lock(&pwm->lock);
+	pwm->user_count--;
+	mutex_unlock(&pwm->lock);
+}
+
+static void pwm_sifive_update_clock(struct pwm_sifive_ddata *pwm,
+				    unsigned long rate)
+{
+	u32 val;
+	unsigned long long num;
+	/* (1 << (PWM_SIFIVE_CMPWIDTH+scale)) * 10^9/rate = real_period */
+	unsigned long scale_pow =
+			div64_ul(pwm->real_period * (u64)rate, NSEC_PER_SEC);
+	int scale = clamp(ilog2(scale_pow) - PWM_SIFIVE_CMPWIDTH, 0, 0xf);
+
+	val = PWM_SIFIVE_PWMCFG_EN_ALWAYS | (scale << PWM_SIFIVE_PWMCFG_SCALE);
+	writel(val, pwm->regs + PWM_SIFIVE_PWMCFG);
+
+	/* As scale <= 15 the shift operation cannot overflow. */
+	num = 1000000000ULL << (PWM_SIFIVE_CMPWIDTH + scale);
+	pwm->real_period = div64_ul(num, rate);
+	dev_dbg(pwm->chip.dev, "New real_period = %u ns\n", pwm->real_period);
+}
+
+static void pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_device *dev,
+				 struct pwm_state *state)
+{
+	struct pwm_sifive_ddata *pwm = pwm_sifive_chip_to_ddata(chip);
+	u32 duty, val;
+	unsigned long long num;
+	int ret;
+
+	ret = clk_enable(pwm->clk);
+	if (ret)
+		return;
+
+	duty = readl(pwm->regs + PWM_SIFIVE_PWMCMP0 +
+		     dev->hwpwm * PWM_SIFIVE_SIZE_PWMCMP);
+
+	state->enabled = duty > 0;
+
+	val = readl(pwm->regs + PWM_SIFIVE_PWMCFG);
+	val &= 0x0F;
+	num = 1000000000ULL << (PWM_SIFIVE_CMPWIDTH + val);
+	pwm->real_period = div64_ul(num, clk_get_rate(pwm->clk));
+
+	state->period = pwm->real_period;
+	state->duty_cycle =
+		(u64)duty * pwm->real_period >> PWM_SIFIVE_CMPWIDTH;
+	state->polarity = PWM_POLARITY_INVERSED;
+
+	clk_disable(pwm->clk);
+}
+
+static int pwm_sifive_enable(struct pwm_chip *chip, bool enable)
+{
+	struct pwm_sifive_ddata *pwm = pwm_sifive_chip_to_ddata(chip);
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
+	unsigned int duty_cycle, x;
+	u32 frac;
+	struct pwm_state cur_state;
+	bool enabled;
+	int ret = 0;
+	unsigned long num;
+
+	if (state->polarity != PWM_POLARITY_INVERSED)
+		return -EINVAL;
+
+	mutex_lock(&pwm->lock);
+	pwm_get_state(dev, &cur_state);
+	enabled = cur_state.enabled;
+
+	if (state->period != cur_state.period) {
+		if (pwm->user_count != 1) {
+			ret = -EINVAL;
+			goto exit;
+		}
+		pwm->real_period = state->period;
+		pwm_sifive_update_clock(pwm, clk_get_rate(pwm->clk));
+	}
+
+	duty_cycle = state->duty_cycle;
+	if (!state->enabled)
+		duty_cycle = 0;
+
+	x = 1U << PWM_SIFIVE_CMPWIDTH;
+	num = (u64)duty_cycle * x + x / 2;
+	frac = div_u64(num, state->period);
+	/* The hardware cannot generate a 100% duty cycle */
+	frac = min(frac, x - 1);
+
+	writel(frac, pwm->regs + PWM_SIFIVE_PWMCMP0 +
+	       dev->hwpwm * PWM_SIFIVE_SIZE_PWMCMP);
+
+	if (!state->enabled && enabled) {
+		ret = pwm_sifive_enable(chip, false);
+		if (ret)
+			goto exit;
+		enabled = false;
+	}
+
+	if (state->enabled && !enabled) {
+		ret = pwm_sifive_enable(chip, state->enabled);
+		if (ret)
+			goto exit;
+	}
+
+exit:
+	mutex_unlock(&pwm->lock);
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
+	int ret, ch;
+	bool is_enabled = false;
+
+	pwm = devm_kzalloc(dev, sizeof(*pwm), GFP_KERNEL);
+	if (!pwm)
+		return -ENOMEM;
+
+	mutex_init(&pwm->lock);
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
+	/* Initialize PWM */
+	pwm->real_period = PWM_SIFIVE_DEFAULT_PERIOD;
+	pwm_sifive_update_clock(pwm, clk_get_rate(pwm->clk));
+
+	for (ch = 0; ch < pwm->chip.npwm; ch++) {
+		if (pwm_is_enabled(&pwm->chip.pwms[ch])) {
+			is_enabled = true;
+			break;
+		}
+	}
+	if (!is_enabled)
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
+	int ret, ch;
+	bool is_enabled = false;
+
+	ret = pwmchip_remove(&pwm->chip);
+	clk_notifier_unregister(pwm->clk, &pwm->notifier);
+
+	for (ch = 0; ch < pwm->chip.npwm; ch++) {
+		if (pwm_is_enabled(&pwm->chip.pwms[ch])) {
+			is_enabled = true;
+			break;
+		}
+	}
+	if (is_enabled)
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
