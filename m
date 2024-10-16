Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF83D20682
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 00:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CyqDAmdTyJtdUiYMa9M9NIhx0NSgdpaijIPKQ3LciiM=; b=ft6TJIL1cfiDUn
	D0K6IjU8azCCa/oXfvUIk7BwyuIYJTeAvk8VquWiGROzt06dp35ehyHhDumQ6n0TzWAT2l0ffRk7I
	FFA2ase5+zhTlEHV/CNGtk5StpwCTfybBSmL0R4rxlGyaSZvTYJFSOgGYetKwuFNMdjrPQ8ybrqmn
	C/dFztTdOAXECmuJSN8igW4lyvwBYLzdJXHTqrVr0kGBdZziHJ14nKBv7YVxzn2dWklYziOdVch2H
	NZnMKDrf8e7yh3kxmcG7W4WhVNhVP/bQWDKhQsF6jzaIN43zg9JwzV5FreWuBxH2EepdUVcxjRLJs
	Zx54DWzy4YoeOUWi9AMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0rmA-00000009ztF-2kbH;
	Wed, 16 Oct 2024 00:20:30 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0rm8-00000009zsc-3QZ8
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 00:20:30 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5e7ff0d4681so2213321eaf.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Oct 2024 17:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729038027; x=1729642827; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=92VubGYyXALAVnQRA8GVr+urTCCGJBZXT1C9yLWdrMo=;
        b=elAOTtsPZ/OSmBVXftwBGwDYXkfwycKLBd7dLRyLRa9uGRFLwRHeUqh8wbdyhgJUYp
         ewfPC0LmIdbftgTbGk5ZScOZi3/xlUiGfrKCNOGX2C0DgiPib0jDZVt3/2I9xnHn0T1b
         0BFMK3yBYFxwaaP0Ddb7C1gQdL+syvICVjahS+r3BaiGx5owDRnDJZo/dNzq+gcdD2h6
         mftLbULO0qWEg11MrnEyqd0AQVqubHfvohOds8YYfUSEnwIJPu4E0yx13X8EZDAvYstO
         aHpPTpIqkZyd/Y5qMw5eMeAiy/7QD/fGTa2WNCcJp5rTSF05S4zumFAQZro1/Q+/Iwlt
         SYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729038027; x=1729642827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=92VubGYyXALAVnQRA8GVr+urTCCGJBZXT1C9yLWdrMo=;
        b=TYYbovBUsIKJSoh3sj+EObbWLwqFz4Gh64KKbM6a0knneV2PwShNLoLBPtTgXgxf96
         OpaL1sTijnaOjRYmgaWFqgbmH44MhBHrQQdLFI1bEc5TtF8KgvNA5VmDfnYoRnyo2ONZ
         8PLa2mQgO5entcxvdS75tNNRrAnCXRWoe9feDZC5wzhNAGG3hvETT4iVfYDdiXp1xMIe
         pP5ZyldkmFq6pHOAonB5BX5zABBml6o202ELUp5UzybTDk9RRTM65dCiD+SjcUxnsrGc
         5NR/dXi0jD3yW+xruIXKTEqv0wpo50PB5P+r60yJDBo1TZm2P6eawy5woz6BbBZEiTL0
         cReQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcOHET3WjYXdVmD3VQEaQNEXeeLwwSzXrcF0mAmxE2wsUIYXejDRjsFDJdWeWEp0HIpHrNCFJHS9ramw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUYH5YlvMMGQDWSsCLQTFhz82C/fhnfWQhlrXlx1+bleSaQXiB
	lAhutmxmudXeRINnVImiroDc07lq6kp1mHdsbcjSBtLAIaQPSMal
X-Google-Smtp-Source: AGHT+IGggwTQpU/fZt9x3V9eDWYPhRnofWhHB5l7vHyW3i3HG/9uWe1jwPwJPpk0YM/IQBBQqcKLgA==
X-Received: by 2002:a05:6808:1a02:b0:3e4:d683:c242 with SMTP id 5614622812f47-3e5d220de87mr9263719b6e.15.1729038027519;
        Tue, 15 Oct 2024 17:20:27 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e5e85e1c7fsm591950b6e.39.2024.10.15.17.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 17:20:26 -0700 (PDT)
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
Subject: [PATCH v4 2/3] pwm: sophgo: add driver for Sophgo SG2042 PWM
Date: Wed, 16 Oct 2024 08:20:18 +0800
Message-Id: <cc69b47d068ff339db4c93d3103ed80d10a172d0.1729037302.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729037302.git.unicorn_wang@outlook.com>
References: <cover.1729037302.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_172028_889945_F59A505B 
X-CRM114-Status: GOOD (  26.39  )
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

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/pwm/Kconfig             |  10 ++
 drivers/pwm/Makefile            |   1 +
 drivers/pwm/pwm-sophgo-sg2042.c | 181 ++++++++++++++++++++++++++++++++
 3 files changed, 192 insertions(+)
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
index 000000000000..bed753877851
--- /dev/null
+++ b/drivers/pwm/pwm-sophgo-sg2042.c
@@ -0,0 +1,181 @@
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
+ */
+
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+
+#include <asm/div64.h>
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
+#define SG2042_HLPERIOD(chan) ((chan) * 8 + 0)
+#define SG2042_PERIOD(chan) ((chan) * 8 + 4)
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
+static void pwm_sg2042_config(void __iomem *base, unsigned int chan, u32 period, u32 hlperiod)
+{
+	writel(period, base + SG2042_PERIOD(chan));
+	writel(hlperiod, base + SG2042_HLPERIOD(chan));
+}
+
+static int pwm_sg2042_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			    const struct pwm_state *state)
+{
+	struct sg2042_pwm_ddata *ddata = pwmchip_get_drvdata(chip);
+	u32 hlperiod;
+	u32 period;
+
+	if (state->polarity == PWM_POLARITY_INVERSED)
+		return -EINVAL;
+
+	if (!state->enabled) {
+		pwm_sg2042_config(ddata->base, pwm->hwpwm, 0, 0);
+		return 0;
+	}
+
+	/*
+	 * Period of High level (duty_cycle) = HLPERIOD x Period_clk
+	 * Period of One Cycle (period) = PERIOD x Period_clk
+	 */
+	period = min(mul_u64_u64_div_u64(ddata->clk_rate_hz, state->period, NSEC_PER_SEC), U32_MAX);
+	hlperiod = min(mul_u64_u64_div_u64(ddata->clk_rate_hz, state->duty_cycle, NSEC_PER_SEC), U32_MAX);
+
+	if (hlperiod > period) {
+		dev_err(pwmchip_parent(chip), "period < hlperiod, failed to apply current setting\n");
+		return -EINVAL;
+	}
+
+	dev_dbg(pwmchip_parent(chip), "chan[%u]: period=%u, hlperiod=%u\n",
+		pwm->hwpwm, period, hlperiod);
+
+	pwm_sg2042_config(ddata->base, pwm->hwpwm, period, hlperiod);
+
+	return 0;
+}
+
+static int pwm_sg2042_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+				struct pwm_state *state)
+{
+	struct sg2042_pwm_ddata *ddata = pwmchip_get_drvdata(chip);
+	unsigned int chan = pwm->hwpwm;
+	u32 hlperiod;
+	u32 period;
+
+	period = readl(ddata->base + SG2042_PERIOD(chan));
+	hlperiod = readl(ddata->base + SG2042_HLPERIOD(chan));
+
+	if (!period && !hlperiod)
+		state->enabled = false;
+	else
+		state->enabled = true;
+
+	state->period = DIV_ROUND_UP_ULL((u64)period * NSEC_PER_SEC, ddata->clk_rate_hz);
+	state->duty_cycle = DIV_ROUND_UP_ULL((u64)hlperiod * NSEC_PER_SEC, ddata->clk_rate_hz);
+
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
+		return dev_err_probe(dev, PTR_ERR(clk), "failed to get base clk\n");
+
+	ret = devm_clk_rate_exclusive_get(dev, clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get exclusive rate\n");
+
+	ddata->clk_rate_hz = clk_get_rate(clk);
+	if (!ddata->clk_rate_hz || ddata->clk_rate_hz > NSEC_PER_SEC)
+		return dev_err_probe(dev, -EINVAL,
+				     "Invalid clock rate: %lu\n", ddata->clk_rate_hz);
+
+	chip->ops = &pwm_sg2042_ops;
+	chip->atomic = true;
+
+	ret = devm_pwmchip_add(dev, chip);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to register PWM chip\n");
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
