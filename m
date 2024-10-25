Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929CFD1171E
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 08:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9kV2eILOxusTAyH8gNS5wbcJJ6haZoPdj2RhLU3Dexk=; b=JcuJbhq0nekhbY
	BARuYKfqiuW99Y+BLazn+ECcn/gRddJhbbzohAzt56YzeJgV1TBEZwdHhV01kQsvTfahG43UVGuuO
	rHoXxvDh1+51fW38KAwt0gjLhgxLqAEuj0PLRR4Jd1YtLhPqqnbt+yMa9bvVlaElecyzBS1Fik2AK
	aEFGh24uVO+/jHmgP5TeFxPyVUOO01D7xAXAYj/mpXEmRdSrgb327Jj8BpmTNnQen+5NMdfZERb6C
	/Mmrz7ccHxh+UXQ1ylh47tjlqBcaMlpfOTOWLgCWdGOS0+k5aY3qLLm54uMyeGGtRs9RY0tTnvLFk
	Np/2Mu8PcYgXNm9Szu6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FU0-00000002wwi-1sie;
	Fri, 25 Oct 2024 08:15:44 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FMG-00000002vTn-3b9n
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 08:07:46 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7181eb9ad46so1093633a34.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Oct 2024 01:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729843663; x=1730448463; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qk4+oNf4uw3HZrJG9g8mUMeRJ62EgsnaH5WrBFOGN5k=;
        b=PNpwOCny4L6Q+BDq/xY5tqU2wn2KVhlMgYAv8QOiy5pexP1uGiAx/X2PNl+59ZqNH5
         cU2VYEwxmVVW6LSSugZMTk5NuJaPYjhRbzDmdpZVsUKgBwzXjTfDH3vxBM5mGnKusjJO
         DQ+cqYi3EQ3bzQ3SN5haRS+7qOfu+ZODDMMtaOZK4mA88f9ax88M5jcBuXchYaU59KEP
         XKCFf/XX97nNB+Oq6gNnMcE0FqTD9lMm7ciPIS94YFwFY3JXfpEe3+DpyTKLdurCWVz4
         GcV5rMQgxLcbGrWk+AcW24Qa8SJUcAjzkm7sKpuMManAKBlsNNT56ec4HizdqGDsPh1c
         l6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729843663; x=1730448463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qk4+oNf4uw3HZrJG9g8mUMeRJ62EgsnaH5WrBFOGN5k=;
        b=SFrlfpN4nmLghSYU9ZkZzZBCmetU9He9fuMn/U2HYOuMRwMvIF8j/1aSvfrgJ4RQ15
         e//GGpKqypbdBfHnmqAilGhjw0iEhDMqzIpByc4FMOGfjlz/QQmA6UAU9FWAk6LXDrT5
         Wg7Ndz5a/PQNRjMdsAS1UzbjIFfAzQ8vGAWZYyp7hd9Nhu9/mTwjFuYJuyW52WIo8nDY
         fo1LiE5SolCp7Tdm7i/+vW9Jn5NoGfW0XvQIb6cDsEcUNi79/344ECnSGmdreNBNANeQ
         IbqQOnCk5IZcISet3MZ4MtvZmMxUghZEg2yIckC5l2MxCg09X2PvzLryEbi9izHE2AEY
         ZX/w==
X-Forwarded-Encrypted: i=1; AJvYcCVpZa7rD/t+JYb9mT2U6H5jadTvXgztCpB8A5/0QvFgqT5XkiQ54xERIvvIZAS4EYljti24gaXYpYnY2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZruNlzy3XYpOPLNQb8DulQwlkGAiHdnt4L/LHiga/NF0TDd4Q
	lXKjxQbtliM9URJRcx1dQ2RxMPHjlYwcZemgBbbhn6UD/3xT+4LM
X-Google-Smtp-Source: AGHT+IH+vWSdxMkvCKRIZuC2GKv3UoSnKoKHfkLlI5WyuqKh6iHekjEfItWsFw9Z8d1tzw+HTP9T7A==
X-Received: by 2002:a05:6830:6d15:b0:718:119:ee15 with SMTP id 46e09a7af769-718594231cdmr4563701a34.10.1729843663506;
        Fri, 25 Oct 2024 01:07:43 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5ec187386a2sm154702eaf.46.2024.10.25.01.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 01:07:42 -0700 (PDT)
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
Subject: [PATCH v5 2/3] pwm: sophgo: add driver for Sophgo SG2042 PWM
Date: Fri, 25 Oct 2024 16:07:35 +0800
Message-Id: <4abe3cd4a870fc15b5e54a48eb4554a7419a4ef8.1729843087.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729843087.git.unicorn_wang@outlook.com>
References: <cover.1729843087.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_010744_946185_A1544AA2 
X-CRM114-Status: GOOD (  26.79  )
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
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/pwm/Kconfig             |  10 ++
 drivers/pwm/Makefile            |   1 +
 drivers/pwm/pwm-sophgo-sg2042.c | 194 ++++++++++++++++++++++++++++++++
 3 files changed, 205 insertions(+)
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
index 000000000000..a3d12505e4aa
--- /dev/null
+++ b/drivers/pwm/pwm-sophgo-sg2042.c
@@ -0,0 +1,194 @@
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
+#include <linux/reset.h>
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
+	rst = devm_reset_control_get_optional_shared(dev, NULL);
+	if (IS_ERR(rst))
+		return dev_err_probe(dev, PTR_ERR(rst), "failed to get reset\n");
+
+	/* Deassert reset */
+	ret = reset_control_deassert(rst);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to deassert\n");
+
+	chip->ops = &pwm_sg2042_ops;
+	chip->atomic = true;
+
+	ret = devm_pwmchip_add(dev, chip);
+	if (ret < 0) {
+		reset_control_assert(rst);
+		return dev_err_probe(dev, ret, "failed to register PWM chip\n");
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
