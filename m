Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A91C02197
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 07:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cGMSCuJixoaexuBBTQp0zqbWDCTPIp4ONLXOPCjUuvE=; b=n1CvB/PgViuxw4
	upbVxN45+U7u288uG/IPuCePyknG8NiAzwTiLl1/0Ni2nv2Wvg5G4hwv9Yc/UklN4Xjz/L/CIYNyK
	ggeQ9pzl20+PCaNLz5Zms5wNdPdHY3n6jukfiNu6RPZq3F7QrI8JCs9NP0/4WR6/DGlYccob2/i2H
	DP2Ko1Sia/ukrx1Z63Lbr/VGJbVfdswm8suhm0UC+IGkDOZ79pGhY+mPWApORuzCoweWb36NQvquL
	TOH5jBSqrEs635X4AHEBJoFklN2U0uTsKeLOXDlLhG2HIvdSWAsnvF+u27ORAZpyuKuIN9Qe/74zo
	HGj2O5vrD8n9piNdh7Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfZR5-00000002TWq-3xru;
	Wed, 05 Feb 2025 07:02:59 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfZPZ-00000002TFS-1Ks1
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 07:01:26 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3eba559611aso1823535b6e.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 23:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738738884; x=1739343684; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SwBabY2Dif2qU+HHNZ8N8GiCs/b5gFtvrv0DgcVk+kU=;
        b=SOyxaytilN9FvlgiIK3cYE8SlkfLo5BHhTQMjJdtFFknCPgVYSHjzc+nY9kDRLR1+Q
         Qe/Lx72mQJfWMxF+vlXt9csEOMcVdIEI/0HpCs3Vu8qlDjLVIJ1GU82zxxrIEsJVhs/z
         JLPaxMxbQiNw+U8zLX7wylyovIYwUMrbJ/ZeIJL19xbvsYuF5PhZe8GfYJq0awS22qhh
         Dr5mKMWkqgjK+1R62+ebreVOleEjx1WgSzUbBN6xL6KMmeGUWwKSP5w8LtIVpDi4k6Vd
         yRg/hV4m3wyIPjiQtLckS2Cyug/sRMInNWD0ZNXwXB9/gOKRDnh9ra6COSLq87EME83R
         M1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738738884; x=1739343684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SwBabY2Dif2qU+HHNZ8N8GiCs/b5gFtvrv0DgcVk+kU=;
        b=arTT9fzcIdBE0HhbrzxCuWYcDfZX3ZFewCXhrXQi+QtwCKaggAt75BfzfFGzdBNNod
         MRuW3GYlPi+2fkCY+uQb7IJRd6/t0nBUOwhphPxZQZquK3J2YnyGXUE95V9S78weEXgs
         3wfCFyXfZ49Mq3Rja3gB9paFGvt2SzFxISuLKWeO0zC4CqFQxrWw2GGPUTNv7OZ+6ZyV
         6jvVHz/N/QV6ClSM2Oot4FtfchA2bgsf8UfhZTGen3QkXsEy7dS+aBmdz8E/1YhSvBhV
         cehnWV+lNnD23leEEyxsWEsy3NCk0vo9QncyDyCO0M52wOuJj0F+1UqT3jUZpV1jggBH
         uGTg==
X-Forwarded-Encrypted: i=1; AJvYcCXmEhis2ymu+TfIBq+3yWFQYm0NWYaA7sjx1IqdgptbPzD/iScdPUmY7hh5dOXJ4PPuL5rjLJ5WPBpNnA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf/RWE2w/lOxANqzpPl1aw0QBmZODkpv94HX0xkCC9u7zUMTCr
	dw+s3p5KrLINccytBEsjLSCTtzFpaPKeD7ETc0VXsJh7XCAfSZv9
X-Gm-Gg: ASbGncs/WtoZ7LJVdR+ZJ+u8+bosDv8sAlLyrl0Lv3JL3Al8GsZfiYLXxjd+nBRGZWh
	S1k3QlA9qynHr9V5yEKQpwm1w7T+8CtaFDxydNukWPM5PrPbWBLsz7WsJRIrulWcuPXzyCCcvBn
	4WI1LSKwyn3Ph3/KNRf2HeNWI+8PMzLJwsHeHsCkmErcSIcBBAyK+0AhAECwfahL5p3LcNu/fJ5
	zVpte3vWkny17/X9kD/+BOTN916ODNLRjBybcJRHDUeB7lijLdilzyfmkHUGTTkVxx7SrrV5ZJM
	cux/YgwRV/RFEHg6poy7mPoezA==
X-Google-Smtp-Source: AGHT+IFOKv7NvEPObj+ABlljhF58GKcG3uAwtk/8J4W/YhXzERpVBCwZPgxh2nYVVtiLK17dNr+teQ==
X-Received: by 2002:a05:6808:3204:b0:3e6:5761:af3 with SMTP id 5614622812f47-3f37c10d334mr1158689b6e.9.1738738882752;
        Tue, 04 Feb 2025 23:01:22 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f33367f6c6sm3441203b6e.42.2025.02.04.23.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 23:01:21 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	chunzhi.lin@sophgo.com
Cc: Sean Young <sean@mess.org>
Subject: [PATCH v7 2/3] pwm: sophgo: add driver for Sophgo SG2042 PWM
Date: Wed,  5 Feb 2025 15:01:13 +0800
Message-Id: <ae8ea1bf0bb0a09336cd8b7f627a994630524bba.1738737617.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1738737617.git.unicorn_wang@outlook.com>
References: <cover.1738737617.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_230125_361038_6DE02AB7 
X-CRM114-Status: GOOD (  27.05  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add a PWM driver for PWM controller in Sophgo SG2042 SoC.

Signed-off-by: Sean Young <sean@mess.org>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/pwm/Kconfig             |  10 ++
 drivers/pwm/Makefile            |   1 +
 drivers/pwm/pwm-sophgo-sg2042.c | 196 ++++++++++++++++++++++++++++++++
 3 files changed, 207 insertions(+)
 create mode 100644 drivers/pwm/pwm-sophgo-sg2042.c

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 0915c1e7df16..ec85f3895936 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -584,6 +584,16 @@ config PWM_SL28CPLD
 	  To compile this driver as a module, choose M here: the module
 	  will be called pwm-sl28cpld.
 
+config PWM_SOPHGO_SG2042
+	tristate "Sophgo SG2042 PWM support"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	help
+	  PWM driver for the PWM controller on Sophgo SG2042 SoC. The PWM
+	  controller supports outputing 4 channels of PWM waveforms.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called pwm_sophgo_sg2042.
+
 config PWM_SPEAR
 	tristate "STMicroelectronics SPEAr PWM support"
 	depends on PLAT_SPEAR || COMPILE_TEST
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index 9081e0c0e9e0..539e0def3f82 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -53,6 +53,7 @@ obj-$(CONFIG_PWM_RZ_MTU3)	+= pwm-rz-mtu3.o
 obj-$(CONFIG_PWM_SAMSUNG)	+= pwm-samsung.o
 obj-$(CONFIG_PWM_SIFIVE)	+= pwm-sifive.o
 obj-$(CONFIG_PWM_SL28CPLD)	+= pwm-sl28cpld.o
+obj-$(CONFIG_PWM_SOPHGO_SG2042)	+= pwm-sophgo-sg2042.o
 obj-$(CONFIG_PWM_SPEAR)		+= pwm-spear.o
 obj-$(CONFIG_PWM_SPRD)		+= pwm-sprd.o
 obj-$(CONFIG_PWM_STI)		+= pwm-sti.o
diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-sg2042.c
new file mode 100644
index 000000000000..ce8cf8af3402
--- /dev/null
+++ b/drivers/pwm/pwm-sophgo-sg2042.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Sophgo SG2042 PWM Controller Driver
+ *
+ * Copyright (C) 2024 Sophgo Technology Inc.
+ * Copyright (C) 2024 Chen Wang <unicorn_wang@outlook.com>
+ *
+ * Limitations:
+ * - After reset, the output of the PWM channel is always high.
+ *   The value of HLPERIOD/PERIOD is 0.
+ * - When HLPERIOD or PERIOD is reconfigured, PWM will start to
+ *   output waveforms with the new configuration after completing
+ *   the running period.
+ * - When PERIOD and HLPERIOD is set to 0, the PWM wave output will
+ *   be stopped and the output is pulled to high.
+ * See the datasheet [1] for more details.
+ * [1]:https://github.com/sophgo/sophgo-doc/tree/main/SG2042/TRM
+ */
+
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+#include <linux/reset.h>
+
+/*
+ * Offset RegisterName
+ * 0x0000 HLPERIOD0
+ * 0x0004 PERIOD0
+ * 0x0008 HLPERIOD1
+ * 0x000C PERIOD1
+ * 0x0010 HLPERIOD2
+ * 0x0014 PERIOD2
+ * 0x0018 HLPERIOD3
+ * 0x001C PERIOD3
+ * Four groups and every group is composed of HLPERIOD & PERIOD
+ */
+#define SG2042_PWM_HLPERIOD(chan) ((chan) * 8 + 0)
+#define SG2042_PWM_PERIOD(chan) ((chan) * 8 + 4)
+
+#define SG2042_PWM_CHANNELNUM	4
+
+/**
+ * struct sg2042_pwm_ddata - private driver data
+ * @base:		base address of mapped PWM registers
+ * @clk_rate_hz:	rate of base clock in HZ
+ */
+struct sg2042_pwm_ddata {
+	void __iomem *base;
+	unsigned long clk_rate_hz;
+};
+
+/*
+ * period_ticks: PERIOD
+ * hlperiod_ticks: HLPERIOD
+ */
+static void pwm_sg2042_config(struct sg2042_pwm_ddata *ddata, unsigned int chan,
+			      u32 period_ticks, u32 hlperiod_ticks)
+{
+	void __iomem *base = ddata->base;
+
+	writel(period_ticks, base + SG2042_PWM_PERIOD(chan));
+	writel(hlperiod_ticks, base + SG2042_PWM_HLPERIOD(chan));
+}
+
+static int pwm_sg2042_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			    const struct pwm_state *state)
+{
+	struct sg2042_pwm_ddata *ddata = pwmchip_get_drvdata(chip);
+	u32 hlperiod_ticks;
+	u32 period_ticks;
+
+	if (state->polarity == PWM_POLARITY_INVERSED)
+		return -EINVAL;
+
+	if (!state->enabled) {
+		pwm_sg2042_config(ddata, pwm->hwpwm, 0, 0);
+		return 0;
+	}
+
+	/*
+	 * Duration of High level (duty_cycle) = HLPERIOD x Period_of_input_clk
+	 * Duration of One Cycle (period) = PERIOD x Period_of_input_clk
+	 */
+	period_ticks = min(mul_u64_u64_div_u64(ddata->clk_rate_hz, state->period, NSEC_PER_SEC), U32_MAX);
+	hlperiod_ticks = min(mul_u64_u64_div_u64(ddata->clk_rate_hz, state->duty_cycle, NSEC_PER_SEC), U32_MAX);
+
+	dev_dbg(pwmchip_parent(chip), "chan[%u]: PERIOD=%u, HLPERIOD=%u\n",
+		pwm->hwpwm, period_ticks, hlperiod_ticks);
+
+	pwm_sg2042_config(ddata, pwm->hwpwm, period_ticks, hlperiod_ticks);
+
+	return 0;
+}
+
+static int pwm_sg2042_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+				struct pwm_state *state)
+{
+	struct sg2042_pwm_ddata *ddata = pwmchip_get_drvdata(chip);
+	unsigned int chan = pwm->hwpwm;
+	u32 hlperiod_ticks;
+	u32 period_ticks;
+
+	period_ticks = readl(ddata->base + SG2042_PWM_PERIOD(chan));
+	hlperiod_ticks = readl(ddata->base + SG2042_PWM_HLPERIOD(chan));
+
+	if (!period_ticks) {
+		state->enabled = false;
+		return 0;
+	}
+
+	if (hlperiod_ticks > period_ticks)
+		hlperiod_ticks = period_ticks;
+
+	state->enabled = true;
+	state->period = DIV_ROUND_UP_ULL((u64)period_ticks * NSEC_PER_SEC, ddata->clk_rate_hz);
+	state->duty_cycle = DIV_ROUND_UP_ULL((u64)hlperiod_ticks * NSEC_PER_SEC, ddata->clk_rate_hz);
+	state->polarity = PWM_POLARITY_NORMAL;
+
+	return 0;
+}
+
+static const struct pwm_ops pwm_sg2042_ops = {
+	.apply = pwm_sg2042_apply,
+	.get_state = pwm_sg2042_get_state,
+};
+
+static const struct of_device_id sg2042_pwm_ids[] = {
+	{ .compatible = "sophgo,sg2042-pwm" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sg2042_pwm_ids);
+
+static int pwm_sg2042_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sg2042_pwm_ddata *ddata;
+	struct reset_control *rst;
+	struct pwm_chip *chip;
+	struct clk *clk;
+	int ret;
+
+	chip = devm_pwmchip_alloc(dev, SG2042_PWM_CHANNELNUM, sizeof(*ddata));
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
+	ddata = pwmchip_get_drvdata(chip);
+
+	ddata->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ddata->base))
+		return PTR_ERR(ddata->base);
+
+	clk = devm_clk_get_enabled(dev, "apb");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "Failed to get base clk\n");
+
+	ret = devm_clk_rate_exclusive_get(dev, clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get exclusive rate\n");
+
+	ddata->clk_rate_hz = clk_get_rate(clk);
+	/* period = PERIOD * NSEC_PER_SEC / clk_rate_hz */
+	if (!ddata->clk_rate_hz || ddata->clk_rate_hz > NSEC_PER_SEC)
+		return dev_err_probe(dev, -EINVAL,
+				     "Invalid clock rate: %lu\n", ddata->clk_rate_hz);
+
+	rst = devm_reset_control_get_optional_shared_deasserted(dev, NULL);
+	if (IS_ERR(rst))
+		return dev_err_probe(dev, PTR_ERR(rst), "Failed to get reset\n");
+
+	chip->ops = &pwm_sg2042_ops;
+	chip->atomic = true;
+
+	ret = devm_pwmchip_add(dev, chip);
+	if (ret < 0) {
+		reset_control_assert(rst);
+		return dev_err_probe(dev, ret, "Failed to register PWM chip\n");
+	}
+
+	return 0;
+}
+
+static struct platform_driver pwm_sg2042_driver = {
+	.driver	= {
+		.name = "sg2042-pwm",
+		.of_match_table = sg2042_pwm_ids,
+	},
+	.probe = pwm_sg2042_probe,
+};
+module_platform_driver(pwm_sg2042_driver);
+
+MODULE_AUTHOR("Chen Wang");
+MODULE_DESCRIPTION("Sophgo SG2042 PWM driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
