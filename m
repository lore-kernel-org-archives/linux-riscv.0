Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED227C3DA6F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 08:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fRi9wRRzzyaTxmCmMc4zNzgDA7uDwQXwf5080uSK4bw=; b=dswdF3uQwSEU74
	kZ5FpFQiNwEzIY9J5FMl61wz7vPr+AuS6YyNgVLIsvHTn68yadOzVW2htXm3GeFQ5/f44nZ2L9u6Z
	B/W2akVOU9JuYo5ANmwycndmyih+L4TjT9IADixzbWJ1jnXdFbhcc0VXOG1fpcpizBzjQOFUOeQxw
	m69DPbhW4WNdMk2t4skGUkTMGexwXUICJKyy7D8PE/1K/nQQzx5qNwvpq2OxAZ2ArAb3VcR86krhq
	CW0j6Wnw8hvR4Mh7EVHlon2kUY1HgNkhrPQwewaSOfrW7xC8VuN1ArMlqvC9j470X9Hb2FKpEfjWj
	rVn980PI+6SSXEaxjVcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZRxK-004boY-0C;
	Fri, 25 Aug 2023 08:14:10 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZRxF-004blT-1I
	for linux-riscv@lists.infradead.org;
	Fri, 25 Aug 2023 08:14:08 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id A641E24DBC0;
	Fri, 25 Aug 2023 16:13:31 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 25 Aug
 2023 16:13:31 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 25 Aug 2023 16:13:30 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pwm@vger.kernel.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Thierry Reding
	<thierry.reding@gmail.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Paul Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal Feng
	<hal.feng@starfivetech.com>, William Qiu <william.qiu@starfivetech.com>
Subject: [RFC v4 2/4] pwm: starfive: Add PWM driver support
Date: Fri, 25 Aug 2023 16:13:26 +0800
Message-ID: <20230825081328.204442-3-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825081328.204442-1-william.qiu@starfivetech.com>
References: <20230825081328.204442-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_011405_769855_A5CA4306 
X-CRM114-Status: GOOD (  22.91  )
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

Add Pulse Width Modulation driver support for StarFive
JH7100 and JH7110 SoC.

Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
Signed-off-by: William Qiu <william.qiu@starfivetech.com>
---
 MAINTAINERS                    |   7 ++
 drivers/pwm/Kconfig            |   9 ++
 drivers/pwm/Makefile           |   1 +
 drivers/pwm/pwm-starfive-ptc.c | 192 +++++++++++++++++++++++++++++++++
 4 files changed, 209 insertions(+)
 create mode 100644 drivers/pwm/pwm-starfive-ptc.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d590ce31aa72..0e47818c6f64 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20299,6 +20299,13 @@ F:	drivers/pinctrl/starfive/pinctrl-starfive-jh71*
 F:	include/dt-bindings/pinctrl/pinctrl-starfive-jh7100.h
 F:	include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h

+STARFIVE JH71X0 PWM DRIVERS
+M:	William Qiu <william.qiu@starfivetech.com>
+M:	Hal Feng <hal.feng@starfivetech.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/pwm/starfive,jh7100-pwm.yaml
+F:	drivers/pwm/pwm-starfive-ptc.c
+
 STARFIVE JH71X0 RESET CONTROLLER DRIVERS
 M:	Emil Renner Berthing <kernel@esmil.dk>
 M:	Hal Feng <hal.feng@starfivetech.com>
diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 6210babb0741..48800f33b5c1 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -569,6 +569,15 @@ config PWM_SPRD
 	  To compile this driver as a module, choose M here: the module
 	  will be called pwm-sprd.

+config PWM_STARFIVE_PTC
+	tristate "StarFive PWM PTC support"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	help
+	  Generic PWM framework driver for StarFive SoCs.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called pwm-starfive-ptc.
+
 config PWM_STI
 	tristate "STiH4xx PWM support"
 	depends on ARCH_STI || COMPILE_TEST
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index c822389c2a24..d2b2a3aeea22 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -52,6 +52,7 @@ obj-$(CONFIG_PWM_SIFIVE)	+= pwm-sifive.o
 obj-$(CONFIG_PWM_SL28CPLD)	+= pwm-sl28cpld.o
 obj-$(CONFIG_PWM_SPEAR)		+= pwm-spear.o
 obj-$(CONFIG_PWM_SPRD)		+= pwm-sprd.o
+obj-$(CONFIG_PWM_STARFIVE_PTC)	+= pwm-starfive-ptc.o
 obj-$(CONFIG_PWM_STI)		+= pwm-sti.o
 obj-$(CONFIG_PWM_STM32)		+= pwm-stm32.o
 obj-$(CONFIG_PWM_STM32_LP)	+= pwm-stm32-lp.o
diff --git a/drivers/pwm/pwm-starfive-ptc.c b/drivers/pwm/pwm-starfive-ptc.c
new file mode 100644
index 000000000000..57b5736f6732
--- /dev/null
+++ b/drivers/pwm/pwm-starfive-ptc.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PWM driver for the StarFive JH71x0 SoC
+ *
+ * Copyright (C) 2018-2023 StarFive Technology Co., Ltd.
+ */
+
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+
+/* Access PTC register (CNTR, HRC, LRC and CTRL) */
+#define REG_PTC_BASE_ADDR_SUB(base, N)	\
+((base) + (((N) > 3) ? (((N) % 4) * 0x10 + (1 << 15)) : ((N) * 0x10)))
+#define REG_PTC_RPTC_CNTR(base, N)	(REG_PTC_BASE_ADDR_SUB(base, N))
+#define REG_PTC_RPTC_HRC(base, N)	(REG_PTC_BASE_ADDR_SUB(base, N) + 0x4)
+#define REG_PTC_RPTC_LRC(base, N)	(REG_PTC_BASE_ADDR_SUB(base, N) + 0x8)
+#define REG_PTC_RPTC_CTRL(base, N)	(REG_PTC_BASE_ADDR_SUB(base, N) + 0xC)
+
+/* PTC_RPTC_CTRL register bits*/
+#define PTC_EN      BIT(0)
+#define PTC_ECLK    BIT(1)
+#define PTC_NEC     BIT(2)
+#define PTC_OE      BIT(3)
+#define PTC_SIGNLE  BIT(4)
+#define PTC_INTE    BIT(5)
+#define PTC_INT     BIT(6)
+#define PTC_CNTRRST BIT(7)
+#define PTC_CAPTE   BIT(8)
+
+struct starfive_pwm_ptc_device {
+	struct pwm_chip chip;
+	struct clk *clk;
+	struct reset_control *rst;
+	void __iomem *regs;
+	u32 clk_rate; /* PWM APB clock frequency */
+};
+
+static inline
+struct starfive_pwm_ptc_device *chip_to_starfive_ptc(struct pwm_chip *c)
+{
+	return container_of(c, struct starfive_pwm_ptc_device, chip);
+}
+
+static int starfive_pwm_ptc_get_state(struct pwm_chip *chip,
+				      struct pwm_device *dev,
+				      struct pwm_state *state)
+{
+	struct starfive_pwm_ptc_device *pwm = chip_to_starfive_ptc(chip);
+	u32 period_data, duty_data, ctrl_data;
+
+	period_data = readl(REG_PTC_RPTC_LRC(pwm->regs, dev->hwpwm));
+	duty_data = readl(REG_PTC_RPTC_HRC(pwm->regs, dev->hwpwm));
+	ctrl_data = readl(REG_PTC_RPTC_CTRL(pwm->regs, dev->hwpwm));
+
+	state->period = DIV_ROUND_CLOSEST_ULL((u64)period_data * NSEC_PER_SEC, pwm->clk_rate);
+	state->duty_cycle = DIV_ROUND_CLOSEST_ULL((u64)duty_data * NSEC_PER_SEC, pwm->clk_rate);
+	state->polarity = PWM_POLARITY_INVERSED;
+	state->enabled = (ctrl_data & PTC_EN) ? true : false;
+
+	return 0;
+}
+
+static int starfive_pwm_ptc_apply(struct pwm_chip *chip,
+				  struct pwm_device *dev,
+				  const struct pwm_state *state)
+{
+	struct starfive_pwm_ptc_device *pwm = chip_to_starfive_ptc(chip);
+	u32 period_data, duty_data, ctrl_data = 0;
+
+	if (state->polarity != PWM_POLARITY_INVERSED)
+		return -EINVAL;
+
+	period_data = DIV_ROUND_CLOSEST_ULL(state->period * pwm->clk_rate,
+					    NSEC_PER_SEC);
+	duty_data = DIV_ROUND_CLOSEST_ULL(state->duty_cycle * pwm->clk_rate,
+					  NSEC_PER_SEC);
+
+	writel(period_data, REG_PTC_RPTC_LRC(pwm->regs, dev->hwpwm));
+	writel(duty_data, REG_PTC_RPTC_HRC(pwm->regs, dev->hwpwm));
+	writel(0,  REG_PTC_RPTC_CNTR(pwm->regs, dev->hwpwm));
+
+	ctrl_data = readl(REG_PTC_RPTC_CTRL(pwm->regs, dev->hwpwm));
+	if (state->enabled)
+		writel(ctrl_data | PTC_EN | PTC_OE, REG_PTC_RPTC_CTRL(pwm->regs, dev->hwpwm));
+	else
+		writel(ctrl_data & ~(PTC_EN | PTC_OE), REG_PTC_RPTC_CTRL(pwm->regs, dev->hwpwm));
+
+	return 0;
+}
+
+static const struct pwm_ops starfive_pwm_ptc_ops = {
+	.get_state	= starfive_pwm_ptc_get_state,
+	.apply		= starfive_pwm_ptc_apply,
+	.owner		= THIS_MODULE,
+};
+
+static int starfive_pwm_ptc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct starfive_pwm_ptc_device *pwm;
+	struct pwm_chip *chip;
+	int ret;
+
+	pwm = devm_kzalloc(dev, sizeof(*pwm), GFP_KERNEL);
+	if (!pwm)
+		return -ENOMEM;
+
+	chip = &pwm->chip;
+	chip->dev = dev;
+	chip->ops = &starfive_pwm_ptc_ops;
+	chip->npwm = 8;
+	chip->of_pwm_n_cells = 3;
+
+	pwm->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pwm->regs))
+		return dev_err_probe(dev, PTR_ERR(pwm->regs),
+				     "Unable to map IO resources\n");
+
+	pwm->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(pwm->clk))
+		return dev_err_probe(dev, PTR_ERR(pwm->clk),
+				     "Unable to get pwm's clock\n");
+
+	pwm->rst = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(pwm->rst))
+		return dev_err_probe(dev, PTR_ERR(pwm->rst),
+				     "Unable to get pwm's reset\n");
+
+	ret = clk_prepare_enable(pwm->clk);
+	if (ret) {
+		dev_err(dev,
+			"Failed to enable clock for pwm: %d\n", ret);
+		return ret;
+	}
+
+	reset_control_deassert(pwm->rst);
+
+	pwm->clk_rate = clk_get_rate(pwm->clk);
+	if (pwm->clk_rate <= 0) {
+		dev_warn(dev, "Failed to get APB clock rate\n");
+		return -EINVAL;
+	}
+
+	ret = devm_pwmchip_add(dev, chip);
+	if (ret < 0) {
+		dev_err(dev, "Cannot register PTC: %d\n", ret);
+		clk_disable_unprepare(pwm->clk);
+		reset_control_assert(pwm->rst);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, pwm);
+
+	return 0;
+}
+
+static int starfive_pwm_ptc_remove(struct platform_device *dev)
+{
+	struct starfive_pwm_ptc_device *pwm = platform_get_drvdata(dev);
+
+	reset_control_assert(pwm->rst);
+	clk_disable_unprepare(pwm->clk);
+
+	return 0;
+}
+
+static const struct of_device_id starfive_pwm_ptc_of_match[] = {
+	{ .compatible = "starfive,jh7100-pwm" },
+	{ .compatible = "starfive,jh7110-pwm" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, starfive_pwm_ptc_of_match);
+
+static struct platform_driver starfive_pwm_ptc_driver = {
+	.probe = starfive_pwm_ptc_probe,
+	.remove = starfive_pwm_ptc_remove,
+	.driver = {
+		.name = "pwm-starfive-ptc",
+		.of_match_table = starfive_pwm_ptc_of_match,
+	},
+};
+module_platform_driver(starfive_pwm_ptc_driver);
+
+MODULE_AUTHOR("Jieqin Chen");
+MODULE_AUTHOR("Hal Feng <hal.feng@starfivetech.com>");
+MODULE_DESCRIPTION("StarFive PWM PTC driver");
+MODULE_LICENSE("GPL");
--
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
