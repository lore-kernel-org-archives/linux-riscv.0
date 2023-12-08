Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C56C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 09:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ijN4OA4mP9Au3+XGPQUGpVG4bXYceR74vc/uGJU9h6s=; b=13snSKtV0FrmFH
	+KpqXmjO60UkC9PPJHkOm/3O11IPLlzPW2fWDVu1ts+94ThuXt0oFgwIOvWZxTTz5rfpdx9qakMaw
	8ZfFQ83U/1OIuTjj5ejve7+qDuAd5E79Iz+/W5UUjC/lXXNMVyYem0sb57CcFqkjWE13zSllDryih
	QE4+jphwoZ2mdWrXmzHx4ZMnJd7FcUKY6qyuVTZVvUwB3IkzM0io5EJqdwmwFlLVuFr9N6YgG0Ot/
	TZfic5WAXO3/IFdID131IFLKtOcDQhTc1YOwRK8Y/phSDuazECADU8MXALx6GaJ2oGBpayLFzpQVE
	oygkbdSCo5EN9gD/a9tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBXNz-00F9M9-0w;
	Fri, 08 Dec 2023 09:43:07 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBXNv-00F9I3-2k
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 09:43:06 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 0A55424DCA6;
	Fri,  8 Dec 2023 17:42:13 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 8 Dec
 2023 17:42:12 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX068.cuchost.com (172.16.6.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 8 Dec 2023 17:42:11 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pwm@vger.kernel.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "Hal
 Feng" <hal.feng@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	William Qiu <william.qiu@starfivetech.com>
Subject: [PATCH v9 2/4] pwm: opencores: Add PWM driver support
Date: Fri, 8 Dec 2023 17:42:07 +0800
Message-ID: <20231208094209.1910934-3-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208094209.1910934-1-william.qiu@starfivetech.com>
References: <20231208094209.1910934-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_014304_176515_F5196AA3 
X-CRM114-Status: GOOD (  22.38  )
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

Add driver for OpenCores PWM Controller. And add compatibility code
which based on StarFive SoC.

Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
Signed-off-by: William Qiu <william.qiu@starfivetech.com>
---
 MAINTAINERS              |   7 ++
 drivers/pwm/Kconfig      |  12 ++
 drivers/pwm/Makefile     |   1 +
 drivers/pwm/pwm-ocores.c | 229 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 249 insertions(+)
 create mode 100644 drivers/pwm/pwm-ocores.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 788be9ab5b73..7a11a22da09e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16204,6 +16204,13 @@ F:	Documentation/i2c/busses/i2c-ocores.rst
 F:	drivers/i2c/busses/i2c-ocores.c
 F:	include/linux/platform_data/i2c-ocores.h
 
+OPENCORES PWM DRIVER
+M:	William Qiu <william.qiu@starfivetech.com>
+M:	Hal Feng <hal.feng@starfivetech.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
+F:	drivers/pwm/pwm-ocores.c
+
 OPENRISC ARCHITECTURE
 M:	Jonas Bonn <jonas@southpole.se>
 M:	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 4b956d661755..d87e1bb350ba 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -444,6 +444,18 @@ config PWM_NTXEC
 	  controller found in certain e-book readers designed by the original
 	  design manufacturer Netronix.
 
+config PWM_OCORES
+	tristate "OpenCores PWM support"
+	depends on HAS_IOMEM && OF
+	depends on COMMON_CLK && RESET_CONTROLLER
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	help
+	  If you say yes to this option, support will be included for the
+	  OpenCores PWM. For details see https://opencores.org/projects/ptc.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called pwm-ocores.
+
 config PWM_OMAP_DMTIMER
 	tristate "OMAP Dual-Mode Timer PWM support"
 	depends on OF
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index c5ec9e168ee7..517c4f643058 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -40,6 +40,7 @@ obj-$(CONFIG_PWM_MICROCHIP_CORE)	+= pwm-microchip-core.o
 obj-$(CONFIG_PWM_MTK_DISP)	+= pwm-mtk-disp.o
 obj-$(CONFIG_PWM_MXS)		+= pwm-mxs.o
 obj-$(CONFIG_PWM_NTXEC)		+= pwm-ntxec.o
+obj-$(CONFIG_PWM_OCORES)	+= pwm-ocores.o
 obj-$(CONFIG_PWM_OMAP_DMTIMER)	+= pwm-omap-dmtimer.o
 obj-$(CONFIG_PWM_PCA9685)	+= pwm-pca9685.o
 obj-$(CONFIG_PWM_PXA)		+= pwm-pxa.o
diff --git a/drivers/pwm/pwm-ocores.c b/drivers/pwm/pwm-ocores.c
new file mode 100644
index 000000000000..996ca3805901
--- /dev/null
+++ b/drivers/pwm/pwm-ocores.c
@@ -0,0 +1,229 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * OpenCores PWM Driver
+ *
+ * https://opencores.org/projects/ptc
+ *
+ * Copyright (C) 2018-2023 StarFive Technology Co., Ltd.
+ *
+ * Limitations:
+ * - The hardware only do inverted polarity.
+ * - The hardware minimum period / duty_cycle is (1 / pwm_apb clock frequency) ns.
+ * - The hardware maximum period / duty_cycle is (U32_MAX / pwm_apb clock frequency) ns.
+ */
+
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+
+/* OCPWM_CTRL register bits*/
+#define REG_OCPWM_EN      BIT(0)
+#define REG_OCPWM_ECLK    BIT(1)
+#define REG_OCPWM_NEC     BIT(2)
+#define REG_OCPWM_OE      BIT(3)
+#define REG_OCPWM_SIGNLE  BIT(4)
+#define REG_OCPWM_INTE    BIT(5)
+#define REG_OCPWM_INT     BIT(6)
+#define REG_OCPWM_CNTRRST BIT(7)
+#define REG_OCPWM_CAPTE   BIT(8)
+
+struct ocores_pwm_device {
+	struct pwm_chip chip;
+	struct clk *clk;
+	struct reset_control *rst;
+	const struct ocores_pwm_data *data;
+	void __iomem *regs;
+	u32 clk_rate; /* PWM APB clock frequency */
+};
+
+struct ocores_pwm_data {
+	void __iomem *(*get_ch_base)(void __iomem *base, unsigned int channel);
+};
+
+static inline u32 ocores_readl(struct ocores_pwm_device *ddata,
+			       unsigned int channel,
+			       unsigned int offset)
+{
+	void __iomem *base = ddata->data->get_ch_base ?
+			     ddata->data->get_ch_base(ddata->regs, channel) : ddata->regs;
+
+	return readl(base + offset);
+}
+
+static inline void ocores_writel(struct ocores_pwm_device *ddata,
+				 unsigned int channel,
+				 unsigned int offset, u32 val)
+{
+	void __iomem *base = ddata->data->get_ch_base ?
+			     ddata->data->get_ch_base(ddata->regs, channel) : ddata->regs;
+
+	writel(val, base + offset);
+}
+
+static inline struct ocores_pwm_device *chip_to_ocores(struct pwm_chip *chip)
+{
+	return container_of(chip, struct ocores_pwm_device, chip);
+}
+
+static void __iomem *starfive_jh71x0_get_ch_base(void __iomem *base,
+						 unsigned int channel)
+{
+	unsigned int offset = (channel > 3 ? 1 << 15 : 0) + (channel & 3) * 0x10;
+
+	return base + offset;
+}
+
+static int ocores_pwm_get_state(struct pwm_chip *chip,
+				struct pwm_device *pwm,
+				struct pwm_state *state)
+{
+	struct ocores_pwm_device *ddata = chip_to_ocores(chip);
+	u32 period_data, duty_data, ctrl_data;
+
+	period_data = ocores_readl(ddata, pwm->hwpwm, 0x8);
+	duty_data = ocores_readl(ddata, pwm->hwpwm, 0x4);
+	ctrl_data = ocores_readl(ddata, pwm->hwpwm, 0xC);
+
+	state->period = DIV_ROUND_UP_ULL((u64)period_data * NSEC_PER_SEC, ddata->clk_rate);
+	state->duty_cycle = DIV_ROUND_UP_ULL((u64)duty_data * NSEC_PER_SEC, ddata->clk_rate);
+	state->polarity = PWM_POLARITY_INVERSED;
+	state->enabled = (ctrl_data & REG_OCPWM_EN) ? true : false;
+
+	return 0;
+}
+
+static int ocores_pwm_apply(struct pwm_chip *chip,
+			    struct pwm_device *pwm,
+			    const struct pwm_state *state)
+{
+	struct ocores_pwm_device *ddata = chip_to_ocores(chip);
+	u32 ctrl_data = 0;
+	u64 period_data, duty_data;
+
+	if (state->polarity != PWM_POLARITY_INVERSED)
+		return -EINVAL;
+
+	ctrl_data = ocores_readl(ddata, pwm->hwpwm, 0xC);
+	ocores_writel(ddata, pwm->hwpwm, 0xC, 0);
+
+	period_data = DIV_ROUND_DOWN_ULL(state->period * ddata->clk_rate, NSEC_PER_SEC);
+	if (period_data <= U32_MAX)
+		ocores_writel(ddata, pwm->hwpwm, 0x8, (u32)period_data);
+	else
+		return -EINVAL;
+
+	duty_data = DIV_ROUND_DOWN_ULL(state->duty_cycle * ddata->clk_rate, NSEC_PER_SEC);
+	if (duty_data <= U32_MAX)
+		ocores_writel(ddata, pwm->hwpwm, 0x4, (u32)duty_data);
+	else
+		return -EINVAL;
+
+	ocores_writel(ddata, pwm->hwpwm, 0xC, 0);
+
+	if (state->enabled) {
+		ctrl_data = ocores_readl(ddata, pwm->hwpwm, 0xC);
+		ocores_writel(ddata, pwm->hwpwm, 0xC, ctrl_data | REG_OCPWM_EN | REG_OCPWM_OE);
+	}
+
+	return 0;
+}
+
+static const struct pwm_ops ocores_pwm_ops = {
+	.get_state	= ocores_pwm_get_state,
+	.apply		= ocores_pwm_apply,
+};
+
+static const struct ocores_pwm_data jh7100_pwm_data = {
+	.get_ch_base = starfive_jh71x0_get_ch_base,
+};
+
+static const struct ocores_pwm_data jh7110_pwm_data = {
+	.get_ch_base = starfive_jh71x0_get_ch_base,
+};
+
+static const struct of_device_id ocores_pwm_of_match[] = {
+	{ .compatible = "opencores,pwm-v1" },
+	{ .compatible = "starfive,jh7100-pwm", .data = &jh7100_pwm_data},
+	{ .compatible = "starfive,jh7110-pwm", .data = &jh7110_pwm_data},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ocores_pwm_of_match);
+
+static void ocores_reset_control_assert(void *data)
+{
+	reset_control_assert(data);
+}
+
+static int ocores_pwm_probe(struct platform_device *pdev)
+{
+	const struct of_device_id *id;
+	struct device *dev = &pdev->dev;
+	struct ocores_pwm_device *ddata;
+	struct pwm_chip *chip;
+	int ret;
+
+	id = of_match_device(ocores_pwm_of_match, dev);
+	if (!id)
+		return -EINVAL;
+
+	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	ddata->data = id->data;
+	chip = &ddata->chip;
+	chip->dev = dev;
+	chip->ops = &ocores_pwm_ops;
+	chip->npwm = 8;
+	chip->of_pwm_n_cells = 3;
+
+	ddata->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ddata->regs))
+		return dev_err_probe(dev, PTR_ERR(ddata->regs),
+				     "Unable to map IO resources\n");
+
+	ddata->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(ddata->clk))
+		return dev_err_probe(dev, PTR_ERR(ddata->clk),
+				     "Unable to get pwm's clock\n");
+
+	ddata->rst = devm_reset_control_get_optional_exclusive(dev, NULL);
+	reset_control_deassert(ddata->rst);
+
+	ret = devm_add_action_or_reset(dev, ocores_reset_control_assert, ddata->rst);
+	if (ret)
+		return ret;
+
+	ddata->clk_rate = clk_get_rate(ddata->clk);
+	if (ddata->clk_rate <= 0)
+		return dev_err_probe(dev, ddata->clk_rate,
+				     "Unable to get clock's rate\n");
+
+	ret = devm_pwmchip_add(dev, chip);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Could not register PWM chip\n");
+
+	platform_set_drvdata(pdev, ddata);
+
+	return ret;
+}
+
+static struct platform_driver ocores_pwm_driver = {
+	.probe = ocores_pwm_probe,
+	.driver = {
+		.name = "ocores-pwm",
+		.of_match_table = ocores_pwm_of_match,
+	},
+};
+module_platform_driver(ocores_pwm_driver);
+
+MODULE_AUTHOR("Jieqin Chen");
+MODULE_AUTHOR("Hal Feng <hal.feng@starfivetech.com>");
+MODULE_DESCRIPTION("OpenCores PWM PTC driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
