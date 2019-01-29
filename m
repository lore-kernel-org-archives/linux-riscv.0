Return-Path: <SRS0=xvkM=QF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23271C169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 29 Jan 2019 11:43:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2BC62086C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 29 Jan 2019 11:43:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OKbK7UEh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="R7jDvlbF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2BC62086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=M/UkyhtZTXz0cO2Or49Gvfr8g2NFFckCsCzeVYzWyts=; b=OKbK7UEheDtDHR+csrJfYMIczX
	NUkKK+be13GnuN7zjUNKmloQh+tcHEuVsAQkigxtUBMGZB2teUTY5nwkAzbkTGkiPk14l8wpyiIZ1
	p8SbyY1H8vDp7Kj3o4z5I5uc7acfIbX7DPkP5E85JFaZaXdkAdCcG8FCHJDlYLA6nE2uaHGIT9v72
	hpoWmWi/KvvqMnIGAzI9hSpN7QgzvK2efiTWC3L31/KbPcjOeqi33TsHvECv7+U1zOoxvfaERahqN
	cC1vdO9UY3tWrBuY1aqnguwpRGmRaJXs20teVNb1x3iEomvuoJECMsFQ/cBUPj/eavkxDPXFStHaP
	U44kz7uA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goRo1-00036S-Km; Tue, 29 Jan 2019 11:43:53 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goRny-00035c-C8
 for linux-riscv@lists.infradead.org; Tue, 29 Jan 2019 11:43:52 +0000
Received: by mail-pf1-x442.google.com with SMTP id 64so9527414pfr.9
 for <linux-riscv@lists.infradead.org>; Tue, 29 Jan 2019 03:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OTY2BuJSQoKUfD3g6smJXjeUei0ZivPpGTG9C8k2s60=;
 b=R7jDvlbFl9hLE2f6dK/HrO6j5AMtEIVrIhPrXk1VR29aOVuXtZ5mr8KuHkb/40IN/n
 cVP0fuP/Buf9WdZZsbvG434qbN6oaGP1v7dFB2c4Ul8EfDdg1Riq/+/otWq6Jm/GrQLv
 fdH5SSlrMcTIA6wPCHAZiwbSozrYDQB6huuXuR+9vtEmT1DII7WVrXXUH1NRn64Rxqf7
 DUYi4RigB8MgMctjUGnWT52SAAYHlBSApUX+MQLx9ERIyWOnZ8704EqCI5+qghiapa93
 c6vcM+6i6jewvlb0aR2daPGnLZzHu2q2JsCcSMtsR4XTUJFWo+CavPazDHnbcDeNmT4n
 tFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OTY2BuJSQoKUfD3g6smJXjeUei0ZivPpGTG9C8k2s60=;
 b=Q7OaA4Ejt+4+ZcxwiHDILueMKrvz+sWaAZoHL4PYpdE+cYyhCRoVt+V6aWXom3U+6U
 SH45Bzr9h6K0VBYnS9yEB/AWI+8dDoD/pi/F58WLrpv4DLNnTOZN1IQl1TWkVfj8Hj/0
 7bpGQrf4RI/g0JdbdeCRiTH0gKJg2A6CNM0ocMmJWr7rhqUM5Xbv/dzy/RH/z6Ldo5Jj
 bDloQI/4hiukDys8MfeAsdCg5VIc6KN/nfWTqtTC1qakac4nUBIka//93z7j08KCBp5L
 p2bNQwjtImSnb0wIdoizMRKKaGgqUIF4DDCt/aIJRV/h6B/Oxij1Ap0qzz+U7XWPQi/R
 0hGA==
X-Gm-Message-State: AJcUukfUH2bxYXi5X3KUgn8QZ80nXAHLtHdINJuj3lCjiRI/pc6mIdcG
 2bAPuc9YfUWeq39klaIUAdydPg==
X-Google-Smtp-Source: ALg8bN7Uk8F2yM9GpfvElQDXCJR194zrJ8z6K9iafzMNmeBHiypGtGBH92+n2CdSHXJLIfwV16DGTQ==
X-Received: by 2002:a63:d005:: with SMTP id z5mr23317265pgf.64.1548762229778; 
 Tue, 29 Jan 2019 03:43:49 -0800 (PST)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id p2sm48755717pfp.125.2019.01.29.03.43.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 29 Jan 2019 03:43:49 -0800 (PST)
From: Yash Shah <yash.shah@sifive.com>
To: palmer@sifive.com, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v5 2/2] pwm: sifive: Add a driver for SiFive SoC PWM
Date: Tue, 29 Jan 2019 17:13:19 +0530
Message-Id: <1548762199-7065-3-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1548762199-7065-1-git-send-email-yash.shah@sifive.com>
References: <1548762199-7065-1-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_034350_421693_0CB90467 
X-CRM114-Status: GOOD (  21.81  )
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
 drivers/pwm/pwm-sifive.c | 261 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 273 insertions(+)
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
index 0000000..2b516f7
--- /dev/null
+++ b/drivers/pwm/pwm-sifive.c
@@ -0,0 +1,261 @@
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
+/* SIZE_PWMCMP is used to calculate the offset for pwmcmpX registers */
+#define SIZE_PWMCMP		4
+#define CMPWIDTH		16
+
+struct pwm_sifive_ddata {
+	struct pwm_chip	chip;
+	struct notifier_block notifier;
+	struct clk *clk;
+	void __iomem *regs;
+	unsigned int approx_period;
+	unsigned int real_period;
+};
+
+static inline struct pwm_sifive_ddata *to_pwm_sifive_chip(struct pwm_chip *c)
+{
+	return container_of(c, struct pwm_sifive_ddata, chip);
+}
+
+static void pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_device *dev,
+				 struct pwm_state *state)
+{
+	struct pwm_sifive_ddata *pwm = to_pwm_sifive_chip(chip);
+	u32 duty;
+
+	duty = readl(pwm->regs + PWM_SIFIVE_PWMCMP0 + dev->hwpwm * SIZE_PWMCMP);
+
+	state->period = pwm->real_period;
+	state->duty_cycle = ((u64)duty * pwm->real_period) >> CMPWIDTH;
+	state->polarity = PWM_POLARITY_INVERSED;
+	state->enabled = duty > 0;
+}
+
+static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *dev,
+			    struct pwm_state *state)
+{
+	struct pwm_sifive_ddata *pwm = to_pwm_sifive_chip(chip);
+	unsigned int duty_cycle;
+	u32 frac, val;
+
+	if (state->polarity != PWM_POLARITY_INVERSED)
+		return -EINVAL;
+
+	if (state->period != pwm->real_period)
+		return -EINVAL;
+
+	duty_cycle = state->duty_cycle;
+	if (!state->enabled)
+		duty_cycle = 0;
+
+	frac = div_u64((u64)duty_cycle * 0xFFFF, state->period);
+	frac = min(frac, 0xFFFFU);
+
+	val = readl(pwm->regs + PWM_SIFIVE_PWMCFG);
+	val |= (1 << PWM_SIFIVE_PWMCFG_DEGLITCH);
+	writel(val, pwm->regs + PWM_SIFIVE_PWMCFG);
+
+	writel(frac, pwm->regs + PWM_SIFIVE_PWMCMP0 + dev->hwpwm * SIZE_PWMCMP);
+
+	val &= ~(1 << PWM_SIFIVE_PWMCFG_DEGLITCH);
+	writel(val, pwm->regs + PWM_SIFIVE_PWMCFG);
+
+	pwm_sifive_get_state(chip, dev, state);
+
+	return 0;
+}
+
+static const struct pwm_ops pwm_sifive_ops = {
+	.get_state = pwm_sifive_get_state,
+	.apply = pwm_sifive_apply,
+	.owner = THIS_MODULE,
+};
+
+static struct pwm_device *pwm_sifive_xlate(struct pwm_chip *chip,
+					   const struct of_phandle_args *args)
+{
+	struct pwm_sifive_ddata *pwm = to_pwm_sifive_chip(chip);
+	struct pwm_device *dev;
+
+	if (args->args[0] >= chip->npwm)
+		return ERR_PTR(-EINVAL);
+
+	dev = pwm_request_from_chip(chip, args->args[0], NULL);
+	if (IS_ERR(dev))
+		return dev;
+
+	/* The period cannot be changed on a per-PWM basis */
+	dev->args.period = pwm->real_period;
+	dev->args.polarity = PWM_POLARITY_NORMAL;
+	if (args->args[1] & PWM_POLARITY_INVERSED)
+		dev->args.polarity = PWM_POLARITY_INVERSED;
+
+	return dev;
+}
+
+static void pwm_sifive_update_clock(struct pwm_sifive_ddata *pwm,
+				    unsigned long rate)
+{
+	/* (1 << (16+scale)) * 10^9/rate = real_period */
+	unsigned long scale_pow =
+			(pwm->approx_period * (u64)rate) / NSEC_PER_SEC;
+	int scale = clamp(ilog2(scale_pow) - 16, 0, 0xf);
+
+	writel((1 << PWM_SIFIVE_PWMCFG_EN_ALWAYS) | (scale <<
+	       PWM_SIFIVE_PWMCFG_SCALE), pwm->regs + PWM_SIFIVE_PWMCFG);
+
+	/* As scale <= 15 the shift operation cannot overflow. */
+	pwm->real_period = div64_ul(1000000000ULL << (16 + scale), rate);
+	dev_dbg(pwm->chip.dev, "New real_period = %u ns\n", pwm->real_period);
+}
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
+	struct device_node *node = pdev->dev.of_node;
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
+	chip->of_xlate = pwm_sifive_xlate;
+	chip->of_pwm_n_cells = 2;
+	chip->base = -1;
+	chip->npwm = 4;
+
+	ret = of_property_read_u32(node, "sifive,period-ns",
+				   &pwm->approx_period);
+
+	if (ret < 0) {
+		dev_err(dev, "Unable to read sifive,period-ns from DTS\n");
+		return ret;
+	}
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
+	/* Initialize PWM config */
+	pwm_sifive_update_clock(pwm, clk_get_rate(pwm->clk));
+
+	ret = pwmchip_add(chip);
+	if (ret < 0) {
+		dev_err(dev, "cannot register PWM: %d\n", ret);
+		goto unregister_clk;
+	}
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
+	clk_disable_unprepare(pwm->clk);
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
