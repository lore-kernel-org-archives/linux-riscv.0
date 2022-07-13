Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F680C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 11:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lzekr47xgRs5s8xWh6Cnk+hARPw3jeEk9/xhPC8Q7UM=; b=O9MlPP8O3KYEvm
	wUxliyMefS+i9ZTGjnOVNd5Z3AZTTEb8nOfpD81S4+mJdTTDIgzU1IFBBpzfo2Y3aSq8DWS6mCgqB
	+VVm17hYJeQRGnjmCVI1A12MRbR+Ng39GBqoy/bIgQ0wFAL6copbBOPkcnsMhZMj5lKC0v/uTZYeu
	rVii3ACiDEFdwMjkB6BTy/wYFb8dDISHjwPhPRTXsCr2ivEg1HesSNZULjPk1wspUeS8Dv3G6LHv9
	GS2DnPlvYS/l2wfqeA5tuKXrMgq+N4k06NTQ+0ntoNumW7UK7e6DZSi7jfaKQYOtH0ExF5+A3UrKK
	xBguDcQBcCQH+gVYSDRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBa6C-002shE-7l; Wed, 13 Jul 2022 11:00:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBa5s-002sQl-4o
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 10:59:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657709988; x=1689245988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oSYsOPfZMoigSP2H0A0eZeabJWNryj/ppmrEjwDGK3o=;
  b=aW3lVI1IB+mEZrss2ShonyKHNySYMve2R/YIb6i/cpx0OxUX53iRj5iI
   IZZPXbrpOe/jO1r7MORHI+1Ws70ujG1ecu6NQ/luLELdK0LOV8QmboPcv
   zImZJ1ih7HacTEKeQSuA3aWUqmYPa58dO8GOxMybZOFbG6VrLWF0xapjA
   ikrsY98Zsles6+18v6iwWgBl9wmVljQQ4+QycxFR7nxs4I36Ze/rojxE5
   6pTbxkw6yvbvMoFq0EcURXUZiuv3KkXL6DxXL2+4PjHitMwT/tol7ah75
   l3EzY6dlDbEdpvN05NEVTFumnySlnV2k0j8tncmqVEel6Y/X2zYFPzSgC
   g==;
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; 
   d="scan'208";a="164527558"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jul 2022 03:59:38 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 13 Jul 2022 03:59:35 -0700
Received: from dev-powerhorse.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 13 Jul 2022 03:59:33 -0700
From: <lewis.hanly@microchip.com>
To: <linux-gpio@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linus.walleij@linaro.org>, <brgl@bgdev.pl>, <linux-kernel@vger.kernel.org>,
	<palmer@dabbelt.com>, <maz@kernel.org>
CC: <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<lewis.hanly@microchip.com>
Subject: [PATCH v2 1/1] gpio: mpfs: add polarfire soc gpio support
Date: Wed, 13 Jul 2022 11:59:10 +0100
Message-ID: <20220713105910.931983-2-lewis.hanly@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220713105910.931983-1-lewis.hanly@microchip.com>
References: <20220713105910.931983-1-lewis.hanly@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_035948_360217_73DEE625 
X-CRM114-Status: GOOD (  24.20  )
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

Add a driver to support the Polarfire SoC gpio controller.

Signed-off-by: Lewis Hanly <lewis.hanly@microchip.com>
---
 drivers/gpio/Kconfig     |   9 +
 drivers/gpio/Makefile    |   1 +
 drivers/gpio/gpio-mpfs.c | 379 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 389 insertions(+)
 create mode 100644 drivers/gpio/gpio-mpfs.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b01961999ced..004b377b73f6 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -490,6 +490,15 @@ config GPIO_PMIC_EIC_SPRD
 	help
 	  Say yes here to support Spreadtrum PMIC EIC device.
 
+config GPIO_POLARFIRE_SOC
+	bool "Microchip FPGA GPIO support"
+	depends on OF_GPIO
+	select GPIOLIB_IRQCHIP
+	select IRQ_DOMAIN_HIERARCHY
+	select GPIO_GENERIC
+	help
+	  Say yes here to support the GPIO device on Microchip FPGAs.
+
 config GPIO_PXA
 	bool "PXA GPIO support"
 	depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 14352f6dfe8e..3b8b6703e593 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -119,6 +119,7 @@ obj-$(CONFIG_GPIO_PCI_IDIO_16)		+= gpio-pci-idio-16.o
 obj-$(CONFIG_GPIO_PISOSR)		+= gpio-pisosr.o
 obj-$(CONFIG_GPIO_PL061)		+= gpio-pl061.o
 obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)	+= gpio-pmic-eic-sprd.o
+obj-$(CONFIG_GPIO_POLARFIRE_SOC)	+= gpio-mpfs.o
 obj-$(CONFIG_GPIO_PXA)			+= gpio-pxa.o
 obj-$(CONFIG_GPIO_RASPBERRYPI_EXP)	+= gpio-raspberrypi-exp.o
 obj-$(CONFIG_GPIO_RC5T583)		+= gpio-rc5t583.o
diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
new file mode 100644
index 000000000000..1b342f307d85
--- /dev/null
+++ b/drivers/gpio/gpio-mpfs.c
@@ -0,0 +1,379 @@
+// SPDX-License-Identifier: (GPL-2.0)
+/*
+ * Microchip PolarFire SoC (MPFS) GPIO controller driver
+ *
+ * Copyright (c) 2018-2022 Microchip Technology Inc. and its subsidiaries
+ *
+ * Author: Lewis Hanly <lewis.hanly@microchip.com>
+ *
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
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+
+#define NUM_GPIO			32
+#define BYTE_BOUNDARY			0x04
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
+	void __iomem	*base;
+	struct clk	*clk;
+	raw_spinlock_t	lock;
+	struct gpio_chip gc;
+	unsigned int	irq_number[NUM_GPIO];
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
+	gpio_cfg = readl(mpfs_gpio->base + (gpio_index * BYTE_BOUNDARY));
+	gpio_cfg |= MPFS_GPIO_EN_IN;
+	gpio_cfg &= ~(MPFS_GPIO_EN_OUT | MPFS_GPIO_EN_OUT_BUF);
+	writel(gpio_cfg, mpfs_gpio->base + (gpio_index * BYTE_BOUNDARY));
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
+	gpio_cfg = readl(mpfs_gpio->base + (gpio_index * BYTE_BOUNDARY));
+	gpio_cfg |= MPFS_GPIO_EN_OUT | MPFS_GPIO_EN_OUT_BUF;
+	gpio_cfg &= ~MPFS_GPIO_EN_IN;
+	writel(gpio_cfg, mpfs_gpio->base + (gpio_index * BYTE_BOUNDARY));
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
+	gpio_cfg = readl(mpfs_gpio->base + (gpio_index * BYTE_BOUNDARY));
+
+	if (gpio_cfg & MPFS_GPIO_EN_IN)
+		return 1;
+
+	return 0;
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
+	int gpio_index = irqd_to_hwirq(data);
+	u32 interrupt_type;
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	u32 gpio_cfg;
+	unsigned long flags;
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_BOTH:
+		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_BOTH;
+		break;
+
+	case IRQ_TYPE_EDGE_FALLING:
+		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_NEG;
+		break;
+
+	case IRQ_TYPE_EDGE_RISING:
+		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_POS;
+		break;
+
+	case IRQ_TYPE_LEVEL_HIGH:
+		interrupt_type = MPFS_GPIO_TYPE_INT_LEVEL_HIGH;
+		break;
+
+	case IRQ_TYPE_LEVEL_LOW:
+		interrupt_type = MPFS_GPIO_TYPE_INT_LEVEL_LOW;
+		break;
+	}
+
+	raw_spin_lock_irqsave(&mpfs_gpio->lock, flags);
+
+	gpio_cfg = readl(mpfs_gpio->base + (gpio_index * BYTE_BOUNDARY));
+	gpio_cfg &= ~MPFS_GPIO_TYPE_INT_MASK;
+	gpio_cfg |= interrupt_type;
+	writel(gpio_cfg, mpfs_gpio->base + (gpio_index * BYTE_BOUNDARY));
+
+	raw_spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
+
+	return 0;
+}
+
+static void mpfs_gpio_irq_enable(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+	int gpio_index = hwirq % NUM_GPIO;
+
+	gpiochip_enable_irq(gc, hwirq);
+	irq_chip_enable_parent(data);
+
+	mpfs_gpio_direction_input(gc, gpio_index);
+	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
+	mpfs_gpio_assign_bit(mpfs_gpio->base + (gpio_index * BYTE_BOUNDARY),
+			     MPFS_GPIO_EN_INT, 1);
+}
+
+static void mpfs_gpio_irq_disable(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+	int gpio_index = hwirq % NUM_GPIO;
+
+	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
+	mpfs_gpio_assign_bit(mpfs_gpio->base + (gpio_index * BYTE_BOUNDARY),
+			     MPFS_GPIO_EN_INT, 0);
+
+	irq_chip_disable_parent(data);
+	gpiochip_disable_irq(gc, hwirq);
+}
+
+static void mpfs_gpio_irq_eoi(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	int offset = irqd_to_hwirq(data) % NUM_GPIO;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&mpfs_gpio->lock, flags);
+	/* Clear pending interrupt */
+	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, offset, 1);
+	raw_spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
+
+	irq_chip_eoi_parent(data);
+}
+
+static int mpfs_gpio_irq_set_affinity(struct irq_data *data,
+				      const struct cpumask *dest,
+				      bool force)
+{
+	if (data->parent_data)
+		return irq_chip_set_affinity_parent(data, dest, force);
+
+	return -EINVAL;
+}
+
+static const struct irq_chip mpfs_gpio_irqchip = {
+	.name		= "mpfs",
+	.irq_set_type	= mpfs_gpio_irq_set_type,
+	.irq_mask	= irq_chip_mask_parent,
+	.irq_unmask	= irq_chip_unmask_parent,
+	.irq_enable	= mpfs_gpio_irq_enable,
+	.irq_disable	= mpfs_gpio_irq_disable,
+	.irq_eoi	= mpfs_gpio_irq_eoi,
+	.irq_set_affinity = mpfs_gpio_irq_set_affinity,
+	.flags		= IRQCHIP_IMMUTABLE,
+	 GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static int mpfs_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
+					   unsigned int child,
+					   unsigned int child_type,
+					   unsigned int *parent,
+					   unsigned int *parent_type)
+{
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	struct irq_data *d = irq_get_irq_data(mpfs_gpio->irq_number[child]);
+	*parent_type = IRQ_TYPE_NONE;
+	*parent = irqd_to_hwirq(d);
+
+	return 0;
+}
+
+static int mpfs_gpio_probe(struct platform_device *pdev)
+{
+	struct clk *clk;
+	struct device *dev = &pdev->dev;
+	struct device_node *node = pdev->dev.of_node;
+	struct device_node *irq_parent;
+	struct gpio_irq_chip *girq;
+	struct irq_domain *parent;
+	struct mpfs_gpio_chip *mpfs_gpio;
+	int i, ret, ngpio;
+
+	mpfs_gpio = devm_kzalloc(dev, sizeof(*mpfs_gpio), GFP_KERNEL);
+	if (!mpfs_gpio)
+		return -ENOMEM;
+
+	mpfs_gpio->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(mpfs_gpio->base))
+		return PTR_ERR(mpfs_gpio->base);
+
+	clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(clk)) {
+		dev_err(&pdev->dev, "devm_clk_get failed\n");
+		return PTR_ERR(clk);
+	}
+
+	ret = clk_prepare_enable(clk);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to enable clock\n");
+		return ret;
+	}
+
+	mpfs_gpio->clk = clk;
+
+	ngpio = of_irq_count(node);
+	if (ngpio > NUM_GPIO) {
+		dev_err(dev, "Too many GPIO interrupts (max=%d)\n",
+			NUM_GPIO);
+		ret = -ENXIO;
+		goto cleanup_clock;
+	}
+
+	irq_parent = of_irq_find_parent(node);
+	if (!irq_parent) {
+		dev_err(dev, "no IRQ parent node\n");
+		ret = -ENODEV;
+		goto cleanup_clock;
+	}
+	parent = irq_find_host(irq_parent);
+	if (!parent) {
+		dev_err(dev, "no IRQ parent domain\n");
+		ret = -ENODEV;
+		goto cleanup_clock;
+	}
+
+	/* Get the interrupt numbers.
+	 * Clear/Disable All interrupts before enabling parent interrupts.
+	 */
+	for (i = 0; i < ngpio; i++) {
+		mpfs_gpio->irq_number[i] = platform_get_irq(pdev, i);
+		mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, i, 1);
+		mpfs_gpio_assign_bit(mpfs_gpio->base + (i * BYTE_BOUNDARY),
+				     MPFS_GPIO_EN_INT, 0);
+	}
+
+	raw_spin_lock_init(&mpfs_gpio->lock);
+
+	mpfs_gpio->gc.direction_input = mpfs_gpio_direction_input;
+	mpfs_gpio->gc.direction_output = mpfs_gpio_direction_output;
+	mpfs_gpio->gc.get_direction = mpfs_gpio_get_direction;
+	mpfs_gpio->gc.get = mpfs_gpio_get;
+	mpfs_gpio->gc.set = mpfs_gpio_set;
+	mpfs_gpio->gc.base = -1;
+	mpfs_gpio->gc.ngpio = ngpio;
+	mpfs_gpio->gc.label = dev_name(dev);
+	mpfs_gpio->gc.parent = dev;
+	mpfs_gpio->gc.owner = THIS_MODULE;
+
+	/* Get a pointer to the gpio_irq_chip */
+	girq = &mpfs_gpio->gc.irq;
+	gpio_irq_chip_set_chip(girq, &mpfs_gpio_irqchip);
+	girq->fwnode = of_node_to_fwnode(node);
+	girq->parent_domain = parent;
+	girq->child_to_parent_hwirq = mpfs_gpio_child_to_parent_hwirq;
+	girq->handler = handle_bad_irq;
+	girq->default_type = IRQ_TYPE_NONE;
+
+	ret = gpiochip_add_data(&mpfs_gpio->gc, mpfs_gpio);
+	if (ret)
+		goto cleanup_clock;
+
+	platform_set_drvdata(pdev, mpfs_gpio);
+	dev_info(dev, "Microchip MPFS GPIO registered, ngpio=%d\n", ngpio);
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
+static const struct of_device_id mpfs_gpio_match[] = {
+	{ .compatible = "microchip,mpfs-gpio", },
+	{ /* end of list */ },
+};
+
+static struct platform_driver mpfs_gpio_driver = {
+	.probe = mpfs_gpio_probe,
+	.driver = {
+		.name = "microchip,mpfs-gpio",
+		.of_match_table = of_match_ptr(mpfs_gpio_match),
+	},
+	.remove = mpfs_gpio_remove,
+};
+builtin_platform_driver(mpfs_gpio_driver)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
