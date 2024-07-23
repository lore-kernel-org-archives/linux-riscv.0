Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF20C3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 11:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o5eEzR4v5bMrp79c9mOJa/5uicpxLCoRBYtLEDgotOE=; b=U0hdfJ/OKtguOl
	eZoH1AVpsDwlNPOewI+VV6UV/aqTcAxO08Fj+j5Lk5Hs/zNB9mxIyrDljCL4Ql1WGBvz37AjKeOkp
	XqX4W4ykRb05DloTw2gR1zD3SdONkJVGuobu4jHhIUx9STkAWVC1zOtmeIl2vu5i++vn+XUv/t96K
	6EJt4KcrevxrLxyBJGhubHW8FPr2UkfKtI5TA2M+QlwVSksnfKXOXfIN5s3ElXbeyYJN/UK0u8Fnk
	Z30cJ7L6JFaD9ne+hwilIsWJZWobT3CyTNzuRENw3gypt+mxUcW6uOCi5BS3outJWrqB5mAvwddrk
	jkczyGD8tAouIjEpn62w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWDgu-0000000CGfZ-0W5G;
	Tue, 23 Jul 2024 11:28:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWDgq-0000000CGeF-3srk
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jul 2024 11:28:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721734101; x=1753270101;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mwLzMK344LrlkXY++0l/Gj9MNq2rK0oWALq4fCAT0Wc=;
  b=17ghRJk4vTfwcSMdZE2x/RrN94LiqFPfbF3SFhwjZbZbSq4vmBmCFt+g
   OLhhIEKc9sKIDYuC0aPQopamCqH9X87lEjYdKcIMrP7KSpO9eKSMZR2Wa
   NEnWfHmZY0o+Yyh+ZgUr5atU6SYY73cQ31qE6w4jOdaXUKv1TmtLAPW8N
   dJeMhqyZXqi8XslgnjXgc9tVpYvAtSveBjVqM2jI0xzj9h2iAjQRC0AUC
   xG0a3KfZJT4C9teOg2uRqoy/Eicuosf0xiqjnu+tpUhM31eVHM97QFhMH
   plQLjtOCmIgANI5mN05VgJFwOjqQLZihoUQVILDbSKkkbeSfyjcCnyL/8
   A==;
X-CSE-ConnectionGUID: Bzp89j1bQnG7Qha2jIBWKQ==
X-CSE-MsgGUID: 9Xz4Jg1zS/eGyBpnXKYMhQ==
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="260469138"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Jul 2024 04:28:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jul 2024 04:28:16 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 23 Jul 2024 04:28:14 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-kernel@vger.kernel.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Marc Zyngier
	<maz@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	"Rob Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Thomas Gleixner" <tglx@linutronix.de>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Lewis Hanly <lewis.hanly@microchip.com>
Subject: [RFC v7 4/6] gpio: mpfs: add polarfire soc gpio support
Date: Tue, 23 Jul 2024 12:27:13 +0100
Message-ID: <20240723-underage-wheat-7dd65c2158e7@wendy>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240723-supervise-drown-d5d3b303e7fd@wendy>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11480; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=oRvlKxILF3owTWo7rBvagSB5lR8hjMzfhJvA3BN3F3o=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGnzJ09odPZe6X9rlmqfj8APvQbZhn2Fz1ZPF429MLFs7bnr u4OiO0pZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRB22MDG33FgjbiGk8k56vsGrNJp Y/6QFvzk2cmZrM8y450liDKZ7hv6caf391p3jw85Mfd3G6BllcWxDdraKxv0EvJaBT6NcJNgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_042821_010606_43F93E96 
X-CRM114-Status: GOOD (  24.93  )
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

From: Lewis Hanly <lewis.hanly@microchip.com>

Add a driver to support the Polarfire SoC gpio controller

Signed-off-by: Lewis Hanly <lewis.hanly@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Unchanged from last list submission, I'm looking for comments on the
other patches in the series at the moment.
---
 drivers/gpio/Kconfig     |   7 +
 drivers/gpio/Makefile    |   1 +
 drivers/gpio/gpio-mpfs.c | 320 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 328 insertions(+)
 create mode 100644 drivers/gpio/gpio-mpfs.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 3dbddec070281..78fe494e3722c 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -549,6 +549,13 @@ config GPIO_PL061
 	help
 	  Say yes here to support the PrimeCell PL061 GPIO device.
 
+config GPIO_POLARFIRE_SOC
+	bool "Microchip FPGA GPIO support"
+	depends on OF_GPIO
+	select GPIOLIB_IRQCHIP
+	help
+	  Say yes here to support the GPIO device on Microchip FPGAs.
+
 config GPIO_PXA
 	bool "PXA GPIO support"
 	depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index e2a53013780e5..dd6ba21bce76e 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -132,6 +132,7 @@ obj-$(CONFIG_GPIO_PCI_IDIO_16)		+= gpio-pci-idio-16.o
 obj-$(CONFIG_GPIO_PISOSR)		+= gpio-pisosr.o
 obj-$(CONFIG_GPIO_PL061)		+= gpio-pl061.o
 obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)	+= gpio-pmic-eic-sprd.o
+obj-$(CONFIG_GPIO_POLARFIRE_SOC)	+= gpio-mpfs.o
 obj-$(CONFIG_GPIO_PXA)			+= gpio-pxa.o
 obj-$(CONFIG_GPIO_RASPBERRYPI_EXP)	+= gpio-raspberrypi-exp.o
 obj-$(CONFIG_GPIO_RC5T583)		+= gpio-rc5t583.o
diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
new file mode 100644
index 0000000000000..1ac0526ba1029
--- /dev/null
+++ b/drivers/gpio/gpio-mpfs.c
@@ -0,0 +1,320 @@
+// SPDX-License-Identifier: (GPL-2.0)
+/*
+ * Microchip PolarFire SoC (MPFS) GPIO controller driver
+ *
+ * Copyright (c) 2018-2022 Microchip Technology Inc. and its subsidiaries
+ *
+ * Author: Lewis Hanly <lewis.hanly@microchip.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
+#include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+
+#define MPFS_GPIO_CTRL(i)		(0x4 * (i))
+#define MAX_NUM_GPIO			32
+#define MPFS_GPIO_EN_INT		3
+#define MPFS_GPIO_EN_OUT_BUF		BIT(2)
+#define MPFS_GPIO_EN_IN			BIT(1)
+#define MPFS_GPIO_EN_OUT		BIT(0)
+
+#define MPFS_GPIO_TYPE_INT_EDGE_BOTH	0x80
+#define MPFS_GPIO_TYPE_INT_EDGE_NEG	0x60
+#define MPFS_GPIO_TYPE_INT_EDGE_POS	0x40
+#define MPFS_GPIO_TYPE_INT_LEVEL_LOW	0x20
+#define MPFS_GPIO_TYPE_INT_LEVEL_HIGH	0x00
+#define MPFS_GPIO_TYPE_INT_MASK		GENMASK(7, 5)
+#define MPFS_IRQ_REG			0x80
+#define MPFS_INP_REG			0x84
+#define MPFS_OUTP_REG			0x88
+
+struct mpfs_gpio_chip {
+	void __iomem *base;
+	struct clk *clk;
+	raw_spinlock_t	lock;
+	struct gpio_chip gc;
+};
+
+static void mpfs_gpio_assign_bit(void __iomem *addr, unsigned int bit_offset, bool value)
+{
+	unsigned long reg = readl(addr);
+
+	__assign_bit(bit_offset, &reg, value);
+	writel(reg, addr);
+}
+
+static int mpfs_gpio_direction_input(struct gpio_chip *gc, unsigned int gpio_index)
+{
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	u32 gpio_cfg;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&mpfs_gpio->lock, flags);
+
+	gpio_cfg = readl(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index));
+	gpio_cfg |= MPFS_GPIO_EN_IN;
+	gpio_cfg &= ~(MPFS_GPIO_EN_OUT | MPFS_GPIO_EN_OUT_BUF);
+	writel(gpio_cfg, mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index));
+
+	raw_spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
+
+	return 0;
+}
+
+static int mpfs_gpio_direction_output(struct gpio_chip *gc, unsigned int gpio_index, int value)
+{
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	u32 gpio_cfg;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&mpfs_gpio->lock, flags);
+
+	gpio_cfg = readl(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index));
+	gpio_cfg |= MPFS_GPIO_EN_OUT | MPFS_GPIO_EN_OUT_BUF;
+	gpio_cfg &= ~MPFS_GPIO_EN_IN;
+	writel(gpio_cfg, mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index));
+
+	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_OUTP_REG, gpio_index, value);
+
+	raw_spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
+
+	return 0;
+}
+
+static int mpfs_gpio_get_direction(struct gpio_chip *gc,
+				   unsigned int gpio_index)
+{
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	u32 gpio_cfg;
+
+	gpio_cfg = readl(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index));
+	if (gpio_cfg & MPFS_GPIO_EN_IN)
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+static int mpfs_gpio_get(struct gpio_chip *gc,
+			 unsigned int gpio_index)
+{
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+
+	return !!(readl(mpfs_gpio->base + MPFS_INP_REG) & BIT(gpio_index));
+}
+
+static void mpfs_gpio_set(struct gpio_chip *gc, unsigned int gpio_index, int value)
+{
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&mpfs_gpio->lock, flags);
+
+	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_OUTP_REG,
+			     gpio_index, value);
+
+	raw_spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
+}
+
+static int mpfs_gpio_irq_set_type(struct irq_data *data, unsigned int type)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	int gpio_index = irqd_to_hwirq(data);
+	u32 interrupt_type;
+	u32 gpio_cfg;
+	unsigned long flags;
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_BOTH:
+		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_BOTH;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_NEG;
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_POS;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		interrupt_type = MPFS_GPIO_TYPE_INT_LEVEL_HIGH;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		interrupt_type = MPFS_GPIO_TYPE_INT_LEVEL_LOW;
+		break;
+	}
+
+	raw_spin_lock_irqsave(&mpfs_gpio->lock, flags);
+
+	gpio_cfg = readl(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index));
+	gpio_cfg &= ~MPFS_GPIO_TYPE_INT_MASK;
+	gpio_cfg |= interrupt_type;
+	writel(gpio_cfg, mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index));
+
+	raw_spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
+
+	return 0;
+}
+
+static void mpfs_gpio_irq_unmask(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	int gpio_index = irqd_to_hwirq(data);
+
+	gpiochip_enable_irq(gc, gpio_index);
+	mpfs_gpio_direction_input(gc, gpio_index);
+	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
+	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index),
+			     MPFS_GPIO_EN_INT, 1);
+}
+
+static void mpfs_gpio_irq_mask(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	int gpio_index = irqd_to_hwirq(data);
+
+	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
+	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index),
+			     MPFS_GPIO_EN_INT, 0);
+	gpiochip_disable_irq(gc, gpio_index);
+}
+
+static const struct irq_chip mpfs_gpio_irqchip = {
+	.name = "mpfs",
+	.irq_set_type = mpfs_gpio_irq_set_type,
+	.irq_mask	= mpfs_gpio_irq_mask,
+	.irq_unmask	= mpfs_gpio_irq_unmask,
+	.flags = IRQCHIP_IMMUTABLE | IRQCHIP_MASK_ON_SUSPEND,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static void mpfs_gpio_irq_handler(struct irq_desc *desc)
+{
+	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	struct mpfs_gpio_chip *mpfs_gpio =
+		gpiochip_get_data(irq_desc_get_handler_data(desc));
+	unsigned long status;
+	int offset;
+
+	chained_irq_enter(irqchip, desc);
+
+	status = readl(mpfs_gpio->base + MPFS_IRQ_REG);
+	for_each_set_bit(offset, &status, mpfs_gpio->gc.ngpio) {
+		mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, offset, 1);
+		generic_handle_irq(irq_find_mapping(mpfs_gpio->gc.irq.domain, offset));
+	}
+
+	chained_irq_exit(irqchip, desc);
+}
+
+static int mpfs_gpio_probe(struct platform_device *pdev)
+{
+	struct clk *clk;
+	struct device *dev = &pdev->dev;
+	struct device_node *node = pdev->dev.of_node;
+	struct mpfs_gpio_chip *mpfs_gpio;
+	struct gpio_irq_chip *girq;
+	int i, ret, ngpios, nirqs;
+
+	mpfs_gpio = devm_kzalloc(dev, sizeof(*mpfs_gpio), GFP_KERNEL);
+	if (!mpfs_gpio)
+		return -ENOMEM;
+
+	mpfs_gpio->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(mpfs_gpio->base))
+		return dev_err_probe(dev, PTR_ERR(mpfs_gpio->base), "failed to ioremap memory resource\n");
+
+	clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "devm_clk_get failed\n");
+
+	ret = clk_prepare_enable(clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable clock\n");
+
+	mpfs_gpio->clk = clk;
+
+	ngpios = MAX_NUM_GPIO;
+	device_property_read_u32(dev, "ngpios", &ngpios);
+	if (ngpios > MAX_NUM_GPIO)
+		ngpios = MAX_NUM_GPIO;
+
+	raw_spin_lock_init(&mpfs_gpio->lock);
+	mpfs_gpio->gc.direction_input = mpfs_gpio_direction_input;
+	mpfs_gpio->gc.direction_output = mpfs_gpio_direction_output;
+	mpfs_gpio->gc.get_direction = mpfs_gpio_get_direction;
+	mpfs_gpio->gc.get = mpfs_gpio_get;
+	mpfs_gpio->gc.set = mpfs_gpio_set;
+	mpfs_gpio->gc.base = -1;
+	mpfs_gpio->gc.ngpio = ngpios;
+	mpfs_gpio->gc.label = dev_name(dev);
+	mpfs_gpio->gc.parent = dev;
+	mpfs_gpio->gc.owner = THIS_MODULE;
+
+	nirqs = of_irq_count(node);
+	if (nirqs > MAX_NUM_GPIO) {
+		ret = -ENXIO;
+		goto cleanup_clock;
+	}
+	girq = &mpfs_gpio->gc.irq;
+	gpio_irq_chip_set_chip(girq, &mpfs_gpio_irqchip);
+	girq->handler = handle_simple_irq;
+	girq->parent_handler = mpfs_gpio_irq_handler;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->num_parents = nirqs;
+	girq->parents = devm_kcalloc(&pdev->dev, nirqs,
+				     sizeof(*girq->parents), GFP_KERNEL);
+	if (!girq->parents) {
+		ret = -ENOMEM;
+		goto cleanup_clock;
+	}
+	for (i = 0; i < nirqs; i++)
+		girq->parents[i] = platform_get_irq(pdev, i);
+
+	ret = gpiochip_add_data(&mpfs_gpio->gc, mpfs_gpio);
+	if (ret)
+		goto cleanup_clock;
+
+	platform_set_drvdata(pdev, mpfs_gpio);
+
+	return 0;
+
+cleanup_clock:
+	clk_disable_unprepare(mpfs_gpio->clk);
+	return ret;
+}
+
+static int mpfs_gpio_remove(struct platform_device *pdev)
+{
+	struct mpfs_gpio_chip *mpfs_gpio = platform_get_drvdata(pdev);
+
+	gpiochip_remove(&mpfs_gpio->gc);
+	clk_disable_unprepare(mpfs_gpio->clk);
+
+	return 0;
+}
+
+static const struct of_device_id mpfs_gpio_of_ids[] = {
+	{ .compatible = "microchip,mpfs-gpio", },
+	{ /* end of list */ }
+};
+
+static struct platform_driver mpfs_gpio_driver = {
+	.probe = mpfs_gpio_probe,
+	.driver = {
+		.name = "microchip,mpfs-gpio",
+		.of_match_table = mpfs_gpio_of_ids,
+	},
+	.remove = mpfs_gpio_remove,
+};
+builtin_platform_driver(mpfs_gpio_driver);
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
