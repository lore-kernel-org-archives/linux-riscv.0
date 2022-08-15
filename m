Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EF4C25B0E
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 12:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eUuTb9bXsxbRBekB4YnXzeKCzr3Dye8zYXRW6Ds1zFc=; b=xU+Lg+hztMD8u2
	wqf3yG5JgxOlTKpC320XCYmlAFTj2UKX7r2B0Cu8ZDceRWne1M7YBoVpKtqtea+RzvZMBm4tErtRW
	M/qCIaX++xS0KEP8ADbOoqjHNI4VMrLYGKYm+NPWf6hLtgK/bFZ9wwjThqJ6e/LUvtlpZ0WW3GkcG
	0XQzqkmn99HPZS0Ki0KdVczHZowzdqJs0jWuTvWj/2R6iaCug+O96do/RtYQDxfYwzhLqUkYHuEoa
	zwCXvf+BKhMOlxtQ/sX5L1wJ3vYdemv5uk5NvYcjrGqp8Gb9znFSx0cjywRby/zzCrZZtevWvYSKD
	f8Tbx+njEgHftOczbfjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNYtw-00Fttm-1F; Mon, 15 Aug 2022 12:09:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNYtq-00Ftk5-WA
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 12:08:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660565334; x=1692101334;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jGEeOwTey8JnO79Z98Mi56v0OxvowSVPOtNNwgS/sQo=;
  b=WOEpaoAfsw+W88J+h0VE1sItnc9oOIFoYd+iARemxEiKlEw12ggFpFeg
   oPzEW7DcwI/IjrvBin3fYdYvmQ+4GRpWQ8JqUzGpII71dga696FFw0XXq
   +/Ze69c00UGIKgJXPXPl+YLtnKfHkYiPwpaE3wRIOdedFVqtCaG7uxmPq
   2vBRwFIwzuSgu7HnkoOA2kxb3Fnj18oREEfWthaoJFpyRCzVwg0Oz87NB
   qEOJqFREP7kzWhUdkcVUOazcwkpbfv2zcZi1DZKs+QUGUNY/DwjTveR7K
   35OizqPOF4hAWy6bUuF/IGZv9ZWI0A79A6eesua0tbhWGQcrtZI/mGhzi
   g==;
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; 
   d="scan'208";a="176401245"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Aug 2022 05:08:42 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 15 Aug 2022 05:08:42 -0700
Received: from dev-powerhorse.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Mon, 15 Aug 2022 05:08:40 -0700
From: <lewis.hanly@microchip.com>
To: <linux-gpio@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linus.walleij@linaro.org>, <brgl@bgdev.pl>, <linux-kernel@vger.kernel.org>,
	<palmer@dabbelt.com>, <maz@kernel.org>
CC: <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<lewis.hanly@microchip.com>
Subject: [PATCH v6 1/1] gpio: mpfs: add polarfire soc gpio support
Date: Mon, 15 Aug 2022 13:08:34 +0100
Message-ID: <20220815120834.1562544-2-lewis.hanly@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815120834.1562544-1-lewis.hanly@microchip.com>
References: <20220815120834.1562544-1-lewis.hanly@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_050855_099910_D9D6018D 
X-CRM114-Status: GOOD (  22.26  )
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
---
 drivers/gpio/Kconfig     |   7 +
 drivers/gpio/Makefile    |   1 +
 drivers/gpio/gpio-mpfs.c | 317 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 325 insertions(+)
 create mode 100644 drivers/gpio/gpio-mpfs.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 0642f579196f..303ea7f6f7bc 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -490,6 +490,13 @@ config GPIO_PMIC_EIC_SPRD
 	help
 	  Say yes here to support Spreadtrum PMIC EIC device.
 
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
index a0985d30f51b..e04061ac5a28 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -120,6 +120,7 @@ obj-$(CONFIG_GPIO_PCI_IDIO_16)		+= gpio-pci-idio-16.o
 obj-$(CONFIG_GPIO_PISOSR)		+= gpio-pisosr.o
 obj-$(CONFIG_GPIO_PL061)		+= gpio-pl061.o
 obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)	+= gpio-pmic-eic-sprd.o
+obj-$(CONFIG_GPIO_POLARFIRE_SOC)	+= gpio-mpfs.o
 obj-$(CONFIG_GPIO_PXA)			+= gpio-pxa.o
 obj-$(CONFIG_GPIO_RASPBERRYPI_EXP)	+= gpio-raspberrypi-exp.o
 obj-$(CONFIG_GPIO_RC5T583)		+= gpio-rc5t583.o
diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
new file mode 100644
index 000000000000..00e68a8b891d
--- /dev/null
+++ b/drivers/gpio/gpio-mpfs.c
@@ -0,0 +1,317 @@
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
+	int gpio_index = irqd_to_hwirq(data) % MAX_NUM_GPIO;
+
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
+	int gpio_index = irqd_to_hwirq(data) % MAX_NUM_GPIO;
+
+	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
+	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index),
+			     MPFS_GPIO_EN_INT, 0);
+}
+
+static const struct irq_chip mpfs_gpio_irqchip = {
+	.name = "mpfs",
+	.irq_set_type = mpfs_gpio_irq_set_type,
+	.irq_mask	= mpfs_gpio_irq_mask,
+	.irq_unmask	= mpfs_gpio_irq_unmask,
+	.flags = IRQCHIP_MASK_ON_SUSPEND,
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
+static const struct of_device_id mpfs_of_ids[] = {
+	{ .compatible = "microchip,mpfs-gpio", },
+	{ /* end of list */ }
+};
+
+static struct platform_driver mpfs_gpio_driver = {
+	.probe = mpfs_gpio_probe,
+	.driver = {
+		.name = "microchip,mpfs-gpio",
+		.of_match_table = mpfs_of_ids,
+	},
+	.remove = mpfs_gpio_remove,
+};
+builtin_platform_driver(mpfs_gpio_driver);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
