Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A743CD5BB7
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2024 12:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kEgwAVwD3/pZyWEgZkREWBQxilc/7Lbm1NYOf4QjpdE=; b=ifRuEk6+x8edLR
	l65vjJg8cFrVwqNzsY9sio9M+AJ4oE9wDz4nk4lM+NBH+2PxFGw2OGZ/3XzQwN8KfsntgyvPIJg5x
	bfAx+mfmeQHIAobYcXRT34dUnymfgfI+8yscotE853mkufftAcR4E4B+xY83IisUTcKiOJp4giF5Y
	IfDVVvyjMI3pfMP7mwwcFnb+uXNavJ/OVm/a6QDW1Y+U6DynZC/fUupCmzLCpAORRgSeJe5tpX0xE
	ziIwgIRiA7twOIp6h6iCVhlrrUSw/giN9s45fJfJtW3WmIHizW/Mp1Y9ayfIndSfzmnx0N4g5ieEd
	2+fL9uF588w3E01aPlJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smBKB-00000008FLS-0EcI;
	Thu, 05 Sep 2024 12:10:55 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smBK7-00000008FJ8-1GD8
	for linux-riscv@lists.infradead.org;
	Thu, 05 Sep 2024 12:10:53 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-70f782d6ba8so355543a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Sep 2024 05:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725538250; x=1726143050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LK3IHackpoEuMNjncuXg3SKL/wNGnWCmIAq0L0PIah4=;
        b=UFNQTp5cX1CpMOpNzScYGBu0cczpjC39qHwszyKEvWfUYodbA1XqDfu7vF+jCkFQXP
         j8c/owZS3UigPEWTJZRH6FkO+I2RF6poam1279ey/rYEAmzMj6/x9d3znTVK4QPUIKV+
         b6F3W4ohrLkSkwzF6Y6YmaIcqACacZAtGYFrm2mvzBJGGUGJOyuWekHiXH97qBD9CC6D
         Gr49fOF/fY1l2ios42P6ud4m9E69qIsulmgCevFwZoAnMdzxAy6/135fHxeYb0qMECjv
         uCD95LqfnMoaajrW4eAesgvBFyt0G4vQmckd1ccAo8lnR9NOP3+msEZIVf1qBSFVVU20
         ZVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725538250; x=1726143050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LK3IHackpoEuMNjncuXg3SKL/wNGnWCmIAq0L0PIah4=;
        b=p8tAm6K5duWch3yVa2Nlql5dp5ifpSxViFjgetiyoGWb5u7XNSWb6tZImyM2znm5s6
         FFdzNHih1Dr6vw1dOYDpc+QSpAKDlDvrPDWe5fGMt/qkniT0rKT8mw6O7RHrovuB85rD
         WQRPfufyIGSyKHDShpTgGCuSq58QQoAY95s5olFzscgyKqstJ1245yZyCIX9h3NyGYrI
         qL70Xch+t407CFuECP+n4lvGwvlWE/jhnBdebDJtrhaIO9o7cFot2Gf+AohuEQpJ6uVA
         xR/5K8NPH+lfGV4j+/H2lxVSkE5JOWjHil0RyjmPgit+VhvJM0E/zkqlWwsAIwxx9Ac6
         EHfA==
X-Forwarded-Encrypted: i=1; AJvYcCXIvmArkh6FkoBPl9qIHCNfTigXkE71agrHu4FSXk8VVBx+r2b7jkzf+eZzki31sWcFY4PZI2WGxXrLMg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwu6Xi6E3TynPaiooPCELu+D3N/u/VUT//KGOt7xnLuPnGV6a/
	93LdF+bMk4eYdpvrZwtDXTKS55Bc9+SylZflom/r8IJntm0eC6vj
X-Google-Smtp-Source: AGHT+IHh+BOXyYZhMqca+Gp9Z6ku4LYrEw/r5Gi1ZCkkbWzyDTxWRs1YU+MyFQM7QKIs4EIKe1PY/w==
X-Received: by 2002:a05:6830:d02:b0:70f:331e:90f6 with SMTP id 46e09a7af769-70f5c466677mr33305848a34.23.1725538249874;
        Thu, 05 Sep 2024 05:10:49 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70f671cf763sm3248566a34.80.2024.09.05.05.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 05:10:49 -0700 (PDT)
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
Subject: [PATCH 2/2] pwm: sophgo: add driver for Sophgo SG2042 PWM
Date: Thu,  5 Sep 2024 20:10:42 +0800
Message-Id: <3985690b29340982a45314bdcc914c554621e909.1725536870.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725536870.git.unicorn_wang@outlook.com>
References: <cover.1725536870.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_051051_375846_6D664768 
X-CRM114-Status: GOOD (  23.06  )
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
 drivers/pwm/Kconfig             |   9 ++
 drivers/pwm/Makefile            |   1 +
 drivers/pwm/pwm-sophgo-sg2042.c | 148 ++++++++++++++++++++++++++++++++
 3 files changed, 158 insertions(+)
 create mode 100644 drivers/pwm/pwm-sophgo-sg2042.c

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 3e53838990f5..6287d63a84fd 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -577,6 +577,15 @@ config PWM_SL28CPLD
 	  To compile this driver as a module, choose M here: the module
 	  will be called pwm-sl28cpld.
 
+config PWM_SOPHGO_SG2042
+	tristate "Sophgo SG2042 PWM support"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	help
+	  PWM driver for Sophgo SG2042 PWM controller.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called pwm_sophgo_sg2042.
+
 config PWM_SPEAR
 	tristate "STMicroelectronics SPEAr PWM support"
 	depends on PLAT_SPEAR || COMPILE_TEST
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index 0be4f3e6dd43..ef2555e83183 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -52,6 +52,7 @@ obj-$(CONFIG_PWM_RZ_MTU3)	+= pwm-rz-mtu3.o
 obj-$(CONFIG_PWM_SAMSUNG)	+= pwm-samsung.o
 obj-$(CONFIG_PWM_SIFIVE)	+= pwm-sifive.o
 obj-$(CONFIG_PWM_SL28CPLD)	+= pwm-sl28cpld.o
+obj-$(CONFIG_PWM_SOPHGO_SG2042)	+= pwm-sophgo-sg2042.o
 obj-$(CONFIG_PWM_SPEAR)		+= pwm-spear.o
 obj-$(CONFIG_PWM_SPRD)		+= pwm-sprd.o
 obj-$(CONFIG_PWM_STI)		+= pwm-sti.o
diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-sg2042.c
new file mode 100644
index 000000000000..cf11ad54b4de
--- /dev/null
+++ b/drivers/pwm/pwm-sophgo-sg2042.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Sophgo SG2042 PWM Controller Driver
+ *
+ * Copyright (C) 2024 Sophgo Technology Inc.
+ * Copyright (C) 2024 Chen Wang <unicorn_wang@outlook.com>
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
+#define REG_HLPERIOD	0x0
+#define REG_PERIOD	0x4
+
+#define REG_GROUP	0x8
+
+#define SG2042_PWM_CHANNELNUM	4
+
+/**
+ * struct sg2042_pwm_chip - private data of PWM chip
+ * @base:		base address of mapped PWM registers
+ * @base_clk:		base clock used to drive the pwm controller
+ */
+struct sg2042_pwm_chip {
+	void __iomem *base;
+	struct clk *base_clk;
+};
+
+static inline
+struct sg2042_pwm_chip *to_sg2042_pwm_chip(struct pwm_chip *chip)
+{
+	return pwmchip_get_drvdata(chip);
+}
+
+static void pwm_sg2042_config(void __iomem *base, unsigned int channo, u32 period, u32 hlperiod)
+{
+	writel(period, base + REG_GROUP * channo + REG_PERIOD);
+	writel(hlperiod, base + REG_GROUP * channo + REG_HLPERIOD);
+}
+
+static int pwm_sg2042_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			    const struct pwm_state *state)
+{
+	struct sg2042_pwm_chip *sg2042_pwm = to_sg2042_pwm_chip(chip);
+	u32 hlperiod;
+	u32 period;
+	u64 f_clk;
+	u64 p;
+
+	if (!state->enabled) {
+		pwm_sg2042_config(sg2042_pwm->base, pwm->hwpwm, 0, 0);
+		return 0;
+	}
+
+	/*
+	 * Period of High level (duty_cycle) = HLPERIOD x Period_clk
+	 * Period of One Cycle (period) = PERIOD x Period_clk
+	 */
+	f_clk = clk_get_rate(sg2042_pwm->base_clk);
+
+	p = f_clk * state->period;
+	do_div(p, NSEC_PER_SEC);
+	period = (u32)p;
+
+	p = f_clk * state->duty_cycle;
+	do_div(p, NSEC_PER_SEC);
+	hlperiod = (u32)p;
+
+	dev_dbg(pwmchip_parent(chip), "chan[%d]: period=%u, hlperiod=%u\n",
+		pwm->hwpwm, period, hlperiod);
+
+	pwm_sg2042_config(sg2042_pwm->base, pwm->hwpwm, period, hlperiod);
+
+	return 0;
+}
+
+static const struct pwm_ops pwm_sg2042_ops = {
+	.apply		= pwm_sg2042_apply,
+};
+
+static const struct of_device_id sg2042_pwm_match[] = {
+	{ .compatible = "sophgo,sg2042-pwm" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, sg2042_pwm_match);
+
+static int pwm_sg2042_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sg2042_pwm_chip *sg2042_pwm;
+	struct pwm_chip *chip;
+	int ret;
+
+	chip = devm_pwmchip_alloc(&pdev->dev, SG2042_PWM_CHANNELNUM, sizeof(*sg2042_pwm));
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
+	sg2042_pwm = to_sg2042_pwm_chip(chip);
+
+	chip->ops = &pwm_sg2042_ops;
+
+	sg2042_pwm->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(sg2042_pwm->base))
+		return PTR_ERR(sg2042_pwm->base);
+
+	sg2042_pwm->base_clk = devm_clk_get_enabled(&pdev->dev, "apb");
+	if (IS_ERR(sg2042_pwm->base_clk))
+		return dev_err_probe(dev, PTR_ERR(sg2042_pwm->base_clk),
+				     "failed to get base clk\n");
+
+	ret = devm_pwmchip_add(&pdev->dev, chip);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to register PWM chip\n");
+
+	platform_set_drvdata(pdev, chip);
+
+	return 0;
+}
+
+static struct platform_driver pwm_sg2042_driver = {
+	.driver	= {
+		.name	= "sg2042-pwm",
+		.of_match_table = of_match_ptr(sg2042_pwm_match),
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
