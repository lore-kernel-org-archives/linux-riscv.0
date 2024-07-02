Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D74EC3064D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 11:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ffCO/Y7MhXzGEeCKnwrrEXjAdH6EIK4fezgmePIGQE=; b=iFs99pjIY5xawn
	9HqO3/Mv3ZH0hIpSKjcVbrxhzQggQbAKwFmi3divFyIv2+MPvxCIgixfYi/WxRJFhptESmmwh8UF/
	WqoD0XYd5QxVsuFqhmDDuMJlYYckstl1MPTSljYhJlZJaBCzzZIcHzNTZeOEoaiaECVPjOoxucFYJ
	36dSOgVOMc3GGA6JcOtWYJzknxNyP3mQsvBhWlyYbnfyKwKFe2S7WUqCOJcPYLFcI5u3hlfTQG34W
	HrAKcJWPuS3BbhSxwdkU5PVgzpkO1X8oqVzUWaj1QAHXLitv2mxAfltqchVffZbNlPZefGpsjx9Ge
	eIlOQI/LMPH3oX+TeeLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOc4Y-00000006ZWM-3Ebq;
	Tue, 02 Jul 2024 11:53:22 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOc4U-00000006ZTy-2rVT
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 11:53:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF4DC1BF21A;
	Tue,  2 Jul 2024 11:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719921195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R7PTkBTYPRxelml7dxpKzT9BRoWlZnwphX7r3tcmlrM=;
	b=CKMnjkL3948aHbKIupSSv1qjNXNa+h3aojriUDHMAJJTD3rMjxOz5a3v600sf/ey6vsi4u
	ybtR7aG8sQVzkFinCwp+LCSkbRkgy15GdOQ9LQpCHoolyacM/VAU7IP/RbQZFtvNYbpY3Y
	255mmU48yL3row2oQDY36UGVuAcEVBZW1P2fejX3922iI7GXiu+xF1wD1rYZ+LRi4n9/zV
	TXWqZnwxRc1qUzqaFWRnkgMB69u2N1+VPyFhdbheavcedgmyrDkMR/oUsDnRrz3qTa6rzV
	HsgrVD3X7xl2KgbIajclRpkgT2x0rqILQizXR3BEWdaITiY9V+eNJlXaM35WQw==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Tue, 02 Jul 2024 13:52:22 +0200
Subject: [PATCH 2/3] iio: adc: sophgo-saradc: Add driver for Sophgo SARADC
MIME-Version: 1.0
Message-Id: <20240702-sg2002-adc-v1-2-ac66e076a756@bootlin.com>
References: <20240702-sg2002-adc-v1-0-ac66e076a756@bootlin.com>
In-Reply-To: <20240702-sg2002-adc-v1-0-ac66e076a756@bootlin.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@outlook.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.0
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_045319_147340_66412A31 
X-CRM114-Status: GOOD (  24.23  )
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

This adds a driver for the common Sophgo SARADC.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 MAINTAINERS                  |   1 +
 drivers/iio/adc/Kconfig      |   9 ++
 drivers/iio/adc/Makefile     |   1 +
 drivers/iio/adc/sophgo-adc.c | 223 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 234 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dc87898c518c..fc74eeaf5678 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20905,6 +20905,7 @@ SOPHGO SARADC DEVICE DRIVER
 M:	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml
+F:	drivers/iio/adc/sophgo-adc.c
 
 SOUND
 M:	Jaroslav Kysela <perex@perex.cz>
diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 8db68b80b391..826871a2e61a 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1122,6 +1122,15 @@ config SC27XX_ADC
 	  This driver can also be built as a module. If so, the module
 	  will be called sc27xx_adc.
 
+config SOPHGO_ADC
+	tristate "Sophgo ADC"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	help
+	  Say yes here to build support for the ADC integrated in Sophgo SoCs.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called sophgo_adc.
+
 config SPEAR_ADC
 	tristate "ST SPEAr ADC"
 	depends on PLAT_SPEAR || COMPILE_TEST
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index edb32ce2af02..106a83d50d01 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -102,6 +102,7 @@ obj-$(CONFIG_ROCKCHIP_SARADC) += rockchip_saradc.o
 obj-$(CONFIG_RICHTEK_RTQ6056) += rtq6056.o
 obj-$(CONFIG_RZG2L_ADC) += rzg2l_adc.o
 obj-$(CONFIG_SC27XX_ADC) += sc27xx_adc.o
+obj-$(CONFIG_SOPHGO_ADC) += sophgo-adc.o
 obj-$(CONFIG_SPEAR_ADC) += spear_adc.o
 obj-$(CONFIG_SUN4I_GPADC) += sun4i-gpadc-iio.o
 obj-$(CONFIG_SUN20I_GPADC) += sun20i-gpadc-iio.o
diff --git a/drivers/iio/adc/sophgo-adc.c b/drivers/iio/adc/sophgo-adc.c
new file mode 100644
index 000000000000..a94d839d40ec
--- /dev/null
+++ b/drivers/iio/adc/sophgo-adc.c
@@ -0,0 +1,223 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  Sophgo SARADC Driver
+ *
+ *  Copyright (C) Bootlin 2024
+ *  Author: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/dev_printk.h>
+#include <linux/interrupt.h>
+#include <linux/iio/iio.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#define SOPHGO_SARADC_CTRL_REG			0x04
+#define		SOPHGO_SARADC_EN		BIT(0)
+#define		SOPHGO_SARADC_SEL(x)		BIT((x)+4)
+#define SOPHGO_SARADC_STATUS_REG		0x08
+#define		SOPHGO_SARADC_BUSY		BIT(0)
+#define SOPHGO_SARADC_CYC_SET_REG		0x0C
+#define		SOPHGO_SARADC_DEF_CYC_SETTINGS	0xF1F0F
+#define SOPHGO_SARADC_CH_RESULT_REG(x)		(0x10+4*(x))
+#define		SARADC_CH_RESULT(x)		((x) & 0xfff)
+#define		SARADC_CH_VALID(x)		((x) & BIT(15))
+#define SOPHGO_SARADC_INTR_EN_REG		0x20
+#define SOPHGO_SARADC_INTR_CLR_REG		0x24
+
+#define SOPHGO_SARADC_CHANNEL(index)					\
+	{								\
+		.type = IIO_VOLTAGE,					\
+		.indexed = 1,						\
+		.channel = index,					\
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
+		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
+		.scan_index = index,					\
+		.scan_type = {						\
+			.sign = 'u',					\
+			.realbits = 12,					\
+		},							\
+	}
+
+struct sophgo_saradc {
+	struct completion completion;
+	struct iio_info info;
+	void __iomem *regs;
+	struct mutex lock;
+	struct clk *clk;
+	int irq;
+};
+
+static const struct iio_chan_spec sophgo_channels[] = {
+	SOPHGO_SARADC_CHANNEL(1),
+	SOPHGO_SARADC_CHANNEL(2),
+	SOPHGO_SARADC_CHANNEL(3),
+};
+
+static void sophgo_saradc_start_measurement(struct sophgo_saradc *saradc,
+					    int channel)
+{
+	writel(0, saradc->regs + SOPHGO_SARADC_CTRL_REG);
+	writel(SOPHGO_SARADC_SEL(channel) | SOPHGO_SARADC_EN,
+	       saradc->regs + SOPHGO_SARADC_CTRL_REG);
+}
+
+static int sophgo_saradc_wait(struct sophgo_saradc *saradc)
+{
+	if (saradc->irq < 0) {
+		u32 reg;
+
+		return readl_poll_timeout(saradc->regs + SOPHGO_SARADC_STATUS_REG,
+					  reg, !(reg & SOPHGO_SARADC_BUSY),
+					  500, 1000000);
+	} else {
+		int ret;
+
+		ret = wait_for_completion_timeout(&saradc->completion,
+						  msecs_to_jiffies(1000)) > 0
+						  ? 0 : -ETIMEDOUT;
+		return ret;
+	}
+}
+
+static int sophgo_saradc_read_raw(struct iio_dev *indio_dev,
+				  struct iio_chan_spec const *chan,
+				  int *val, int *val2, long mask)
+{
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		struct sophgo_saradc *saradc = iio_priv(indio_dev);
+		u32 sample;
+		int ret;
+
+		mutex_lock(&saradc->lock);
+		sophgo_saradc_start_measurement(saradc, chan->scan_index);
+		ret = sophgo_saradc_wait(saradc);
+		if (ret < 0) {
+			mutex_unlock(&saradc->lock);
+			return ret;
+		}
+
+		sample = readl(saradc->regs + SOPHGO_SARADC_CH_RESULT_REG(chan->scan_index));
+		mutex_unlock(&saradc->lock);
+
+		if (SARADC_CH_VALID(sample)) {
+			*val = SARADC_CH_RESULT(sample);
+			return IIO_VAL_INT;
+		}
+		return -ENODATA;
+	case IIO_CHAN_INFO_SCALE:
+		*val = 3300;
+		*val2 = 12;
+		return IIO_VAL_FRACTIONAL_LOG2;
+	default:
+		return -EINVAL;
+	}
+}
+
+static irqreturn_t sophgo_saradc_interrupt_handler(int irq, void *dev_id)
+{
+	struct sophgo_saradc *saradc = dev_id;
+
+	writel(1, saradc->regs + SOPHGO_SARADC_INTR_CLR_REG);
+	complete(&saradc->completion);
+	return IRQ_HANDLED;
+}
+
+
+static const struct of_device_id sophgo_saradc_match[] = {
+	{ .compatible = "sophgo,cv18xx-saradc", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, sophgo_saradc_match);
+
+static int sophgo_saradc_probe(struct platform_device *pdev)
+{
+	struct sophgo_saradc *saradc;
+	struct iio_dev *indio_dev;
+	int ret;
+
+	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*saradc));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	saradc = iio_priv(indio_dev);
+	indio_dev->name = "Sophgo SARADC";
+	indio_dev->info = &saradc->info;
+	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->num_channels = 3;
+	indio_dev->channels = sophgo_channels;
+
+	saradc->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(saradc->clk)) {
+		dev_dbg(&pdev->dev, "Can't get clock from device tree, using No-Die domain");
+	} else {
+		ret = clk_prepare_enable(saradc->clk);
+		if (ret)
+			return ret;
+	}
+
+	saradc->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(saradc->regs)) {
+		ret = PTR_ERR(saradc->regs);
+		goto error_disable_clock;
+	}
+
+	saradc->irq = platform_get_irq_optional(pdev, 0);
+	if (saradc->irq >= 0) {
+		ret = devm_request_irq(&pdev->dev, saradc->irq,
+				sophgo_saradc_interrupt_handler, 0,
+				dev_name(&pdev->dev), saradc);
+		if (ret)
+			goto error_disable_clock;
+
+		writel(1, saradc->regs + SOPHGO_SARADC_INTR_EN_REG);
+
+		init_completion(&saradc->completion);
+	}
+
+	saradc->info.read_raw = &sophgo_saradc_read_raw;
+
+	mutex_init(&saradc->lock);
+	platform_set_drvdata(pdev, indio_dev);
+	writel(SOPHGO_SARADC_DEF_CYC_SETTINGS, saradc->regs + SOPHGO_SARADC_CYC_SET_REG);
+	ret = devm_iio_device_register(&pdev->dev, indio_dev);
+	if (ret)
+		goto error_disable_clock;
+
+	return 0;
+
+error_disable_clock:
+	if (!IS_ERR(saradc->clk))
+		clk_disable_unprepare(saradc->clk);
+	return ret;
+}
+
+static void sophgo_saradc_remove(struct platform_device *pdev)
+{
+	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
+	struct sophgo_saradc *saradc = iio_priv(indio_dev);
+
+	if (!IS_ERR(saradc->clk))
+		clk_disable_unprepare(saradc->clk);
+}
+
+
+static struct platform_driver sophgo_saradc_driver = {
+	.driver	= {
+		.name		= "sophgo-saradc",
+		.of_match_table	= sophgo_saradc_match,
+	},
+	.probe = sophgo_saradc_probe,
+	.remove_new = sophgo_saradc_remove,
+};
+module_platform_driver(sophgo_saradc_driver);
+
+MODULE_AUTHOR("Thomas Bonnefille <thomas.bonnefille@bootlin.com>");
+MODULE_DESCRIPTION("Sophgo SARADC driver");
+MODULE_LICENSE("GPL");

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
