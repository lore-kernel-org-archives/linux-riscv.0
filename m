Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BF6C38150
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 13:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=07EAv9Ftl8VJ1ZgPaowDYiIDAEdXxub/D8C1oadWLDE=; b=sy6N9+Kf7LpXki
	g8oz+wvjpLUJnSouy/96gk1DFrWTFVzlVmK44ZnIIbWDAs9+DvzYz8G0TVBVKlb8zNrFUDURsnUYI
	/Y0QIUUA/VUEdGnDDg434b381UEPb68f59e2DCA+kWQLkLtNPhqGiZx5BfIXgZOR8uaQhPxXyziCH
	6qrU+gH6uIEY0zfvPZ1FniJLn6FQRuXjGEyrEwgkBuq1xwcl1aHhibj+KbgEtWElK/tAgQXmA6RKC
	gY1LeZFiF8w8gMc8Z8ab43FReazysWAdRdKCcGNFNg7EdT1wiJiGazAv8TW3fKBlShuzaZUnDGjXr
	aXuvPz9K19888Dn+tB3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPjD1-0000000G5nb-0zY7;
	Fri, 05 Jul 2024 13:42:43 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPjCu-0000000G5jl-18QC
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jul 2024 13:42:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6EE56240004;
	Fri,  5 Jul 2024 13:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720186953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8opSpDQ51mRmczar3YcnEwHG514tMoc1SR4IVLVTgKQ=;
	b=kTU5hJXKrnTlWrdPeuDhJYclr1rk5hNRQ+GLH5uKT5JHGf9bBUMk+0UtG8iuzNQmRziLWr
	of1xvswBArd3vEE++kzmYosL0Wa2TJSxVw2ZJVxYr/I+jerzVCvYHrSKqPt5lJoJhrJ5gF
	kLq/62DVCAgRli+D17uyZI9KPLqlsSRm2Cy4zIXN53bPgtC1GbTtpkLyyuc9mYWt2CVw/s
	qEy+eS6IJe6iJ+8XfWWeQ5Lgq7FAGOhmOVlwp4wqBc4EXSCpCwb//CAo4uP1RO/4FDxw1t
	w45j1FZPeDzykCzFZHy69OGOhTLtPYqPAIMlV6Qq3sSdyVubnMedRxGPOlgj5w==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Fri, 05 Jul 2024 15:42:24 +0200
Subject: [PATCH v2 2/3] iio: adc: sophgo-saradc: Add driver for Sophgo
 SARADC
MIME-Version: 1.0
Message-Id: <20240705-sg2002-adc-v2-2-83428c20a9b2@bootlin.com>
References: <20240705-sg2002-adc-v2-0-83428c20a9b2@bootlin.com>
In-Reply-To: <20240705-sg2002-adc-v2-0-83428c20a9b2@bootlin.com>
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
X-CRM114-CacheID: sfid-20240705_064237_681882_89343A8C 
X-CRM114-Status: GOOD (  23.19  )
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
 drivers/iio/adc/Kconfig             |  10 ++
 drivers/iio/adc/Makefile            |   1 +
 drivers/iio/adc/sophgo-cv18xx-adc.c | 195 ++++++++++++++++++++++++++++++++++++
 3 files changed, 206 insertions(+)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 8db68b80b391..e48d8f7f2873 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1122,6 +1122,16 @@ config SC27XX_ADC
 	  This driver can also be built as a module. If so, the module
 	  will be called sc27xx_adc.
 
+config SOPHGO_CV18XX_ADC
+	tristate "Sophgo CV18XX series SARADC"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	help
+	  Say yes here to build support for the SARADC integrated inside
+	  the Sophgo CV18XX series SoCs.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called sophgo_adc.
+
 config SPEAR_ADC
 	tristate "ST SPEAr ADC"
 	depends on PLAT_SPEAR || COMPILE_TEST
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index edb32ce2af02..3967d3953349 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -102,6 +102,7 @@ obj-$(CONFIG_ROCKCHIP_SARADC) += rockchip_saradc.o
 obj-$(CONFIG_RICHTEK_RTQ6056) += rtq6056.o
 obj-$(CONFIG_RZG2L_ADC) += rzg2l_adc.o
 obj-$(CONFIG_SC27XX_ADC) += sc27xx_adc.o
+obj-$(CONFIG_SOPHGO_CV18XX_ADC) += sophgo-cv18xx-adc.o
 obj-$(CONFIG_SPEAR_ADC) += spear_adc.o
 obj-$(CONFIG_SUN4I_GPADC) += sun4i-gpadc-iio.o
 obj-$(CONFIG_SUN20I_GPADC) += sun20i-gpadc-iio.o
diff --git a/drivers/iio/adc/sophgo-cv18xx-adc.c b/drivers/iio/adc/sophgo-cv18xx-adc.c
new file mode 100644
index 000000000000..dd1188b1923e
--- /dev/null
+++ b/drivers/iio/adc/sophgo-cv18xx-adc.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  Sophgo CV18XX series SARADC Driver
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
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+
+#define CV18XX_ADC_CTRL_REG			0x04
+#define		CV18XX_ADC_EN			BIT(0)
+#define		CV18XX_ADC_SEL(x)		BIT((x)+4)
+#define CV18XX_ADC_STATUS_REG			0x08
+#define		CV18XX_ADC_BUSY			BIT(0)
+#define CV18XX_ADC_CYC_SET_REG			0x0C
+#define		CV18XX_ADC_DEF_CYC_SETTINGS	0xF1F0F
+#define CV18XX_ADC_CH_RESULT_REG(x)		(0x10+4*(x))
+#define		CV18XX_ADC_CH_RESULT		0xfff
+#define		CV18XX_ADC_CH_VALID		BIT(15)
+#define CV18XX_ADC_INTR_EN_REG			0x20
+#define CV18XX_ADC_INTR_CLR_REG			0x24
+#define CV18XX_ADC_INTR_STA_REG			0x28
+
+#define CV18XX_ADC_CHANNEL(index)					\
+	{								\
+		.type = IIO_VOLTAGE,					\
+		.indexed = 1,						\
+		.channel = index,					\
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
+		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
+		.scan_index = index,					\
+	}
+
+struct cv18xx_adc {
+	struct completion completion;
+	void __iomem *regs;
+	struct mutex lock; /* ADC Control and Result register */
+	int irq;
+};
+
+static const struct iio_chan_spec sophgo_channels[] = {
+	CV18XX_ADC_CHANNEL(1),
+	CV18XX_ADC_CHANNEL(2),
+	CV18XX_ADC_CHANNEL(3),
+};
+
+static void cv18xx_adc_start_measurement(struct cv18xx_adc *saradc,
+					    int channel)
+{
+	writel(0, saradc->regs + CV18XX_ADC_CTRL_REG);
+	writel(CV18XX_ADC_SEL(channel) | CV18XX_ADC_EN,
+	       saradc->regs + CV18XX_ADC_CTRL_REG);
+}
+
+static int cv18xx_adc_wait(struct cv18xx_adc *saradc)
+{
+	if (saradc->irq < 0) {
+		u32 reg;
+
+		return readl_poll_timeout(saradc->regs + CV18XX_ADC_STATUS_REG,
+					  reg, !(reg & CV18XX_ADC_BUSY),
+					  500, 1000000);
+	}
+	return wait_for_completion_timeout(&saradc->completion,
+					  msecs_to_jiffies(1000)) > 0
+					  ? 0 : -ETIMEDOUT;
+}
+
+static int cv18xx_adc_read_raw(struct iio_dev *indio_dev,
+				  struct iio_chan_spec const *chan,
+				  int *val, int *val2, long mask)
+{
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		struct cv18xx_adc *saradc = iio_priv(indio_dev);
+		u32 sample;
+		int ret;
+
+		scoped_guard(mutex, &saradc->lock) {
+			cv18xx_adc_start_measurement(saradc, chan->scan_index);
+			ret = cv18xx_adc_wait(saradc);
+			if (ret < 0)
+				return ret;
+
+			sample = readl(saradc->regs + CV18XX_ADC_CH_RESULT_REG(chan->scan_index));
+		}
+		if (!(sample & CV18XX_ADC_CH_VALID))
+			return -ENODATA;
+
+		*val = sample & CV18XX_ADC_CH_RESULT;
+		return IIO_VAL_INT;
+	case IIO_CHAN_INFO_SCALE:
+		*val = 3300;
+		*val2 = 12;
+		return IIO_VAL_FRACTIONAL_LOG2;
+	default:
+		return -EINVAL;
+	}
+}
+
+static irqreturn_t cv18xx_adc_interrupt_handler(int irq, void *private)
+{
+	struct cv18xx_adc *saradc = private;
+
+	if (!(readl(saradc->regs + CV18XX_ADC_INTR_STA_REG) & BIT(0)))
+		return IRQ_NONE;
+
+	writel(1, saradc->regs + CV18XX_ADC_INTR_CLR_REG);
+	complete(&saradc->completion);
+	return IRQ_HANDLED;
+}
+
+static const struct iio_info cv18xx_adc_info = {
+	.read_raw = &cv18xx_adc_read_raw,
+};
+
+static int cv18xx_adc_probe(struct platform_device *pdev)
+{
+	struct cv18xx_adc *saradc;
+	struct iio_dev *indio_dev;
+	int ret;
+
+	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*saradc));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	saradc = iio_priv(indio_dev);
+	indio_dev->name = "sophgo-cv18xx-adc";
+	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->info = &cv18xx_adc_info;
+	indio_dev->num_channels = ARRAY_SIZE(sophgo_channels);
+	indio_dev->channels = sophgo_channels;
+
+
+	if (IS_ERR(devm_clk_get_optional_enabled(&pdev->dev, NULL)))
+		dev_dbg(&pdev->dev, "Can't get clock from device tree, using No-Die domain");
+
+	saradc->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(saradc->regs)) {
+		ret = PTR_ERR(saradc->regs);
+		return ret;
+	}
+
+	saradc->irq = platform_get_irq_optional(pdev, 0);
+	if (saradc->irq >= 0) {
+		init_completion(&saradc->completion);
+		ret = devm_request_irq(&pdev->dev, saradc->irq,
+				cv18xx_adc_interrupt_handler, 0,
+				dev_name(&pdev->dev), saradc);
+		if (ret)
+			return ret;
+
+		writel(1, saradc->regs + CV18XX_ADC_INTR_EN_REG);
+
+	}
+
+
+	mutex_init(&saradc->lock);
+	platform_set_drvdata(pdev, indio_dev);
+	writel(CV18XX_ADC_DEF_CYC_SETTINGS, saradc->regs + CV18XX_ADC_CYC_SET_REG);
+	ret = devm_iio_device_register(&pdev->dev, indio_dev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct of_device_id cv18xx_adc_match[] = {
+	{ .compatible = "sophgo,cv18xx-saradc", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, cv18xx_adc_match);
+
+static struct platform_driver cv18xx_adc_driver = {
+	.driver	= {
+		.name		= "sophgo-saradc",
+		.of_match_table	= cv18xx_adc_match,
+	},
+	.probe = cv18xx_adc_probe,
+};
+module_platform_driver(cv18xx_adc_driver);
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
