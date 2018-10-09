Return-Path: <SRS0=n4Ll=MV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1217BECDE3A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Oct 2018 18:51:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE29E214C4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Oct 2018 18:51:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mVGq2sQC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="qufLU9Uu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE29E214C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=C/h55kO6HYd/GfloK34/2+K1e0msiBcuAH+BClkZNzk=; b=mVGq2sQC/uGxPppBX0q6OS/0Um
	v2uXtxB54E4fKut90Kya7LGxk4Ul1PnySMG466mzSGE8EZOg/b0DfHCQC7pCKtECvUX+McTYQTabX
	xxXBix2q0vABER3LAoDvXUuhRbgPUTKbSyX1Khg71TifdL06c4OmLmXn7if7+M7Sia4ZDVocj7OPj
	4VyShlQicMs96dUjoAs1uatNEiB6CvB+zqiUo1i2p9JvLV4GU1ONXFU+CWQD7JEbgnYOpab93T+sO
	6kkprviwvekMVwQzOEACTME763drApa1/Gy6cCTLKBZQOw7GKoLnJB5otBMcqVPd86VyQFiwmmQfA
	UHh2a74Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g9x6o-0000Le-9l; Tue, 09 Oct 2018 18:51:54 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9x6a-0000Da-Cr
 for linux-riscv@lists.infradead.org; Tue, 09 Oct 2018 18:51:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1539111100; x=1570647100;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=ZCsXdpWFIii6ThOSa4DBjpjO+85+A3BePvg+RFDxO1c=;
 b=qufLU9Uu7vj0C7i7noMHdy7HnKg48EwxfWkplGzzQjD04Le+yS/JC7Fp
 gUkTI06FVjbV0q4bNTOSZ3yLYZ/XmBe18j+xMwEf1XfZsJ9wgk4r1tG6Z
 yL22HatdqafTp6WiWM95uhdv0uJmTdSY0iAtGTlGNAyOTMzkvofXoqzzM
 5tRDlT4XIFxEZjfWtTJZrfpUK0f+RQu3mcbt97723twmrUFDXXpRincJK
 5Ejdh/aiYnpZspKFnVgl77OMStTzzfuh5FqSg7f8nd4hqRBo2JzX6a3Em
 WEAO50saYu5BX+FwcVpF4/6T/jZI7tBCEkdaYeDMTh0VBaXSVH70Jxil0 Q==;
X-IronPort-AV: E=Sophos;i="5.54,361,1534780800"; d="scan'208";a="92668399"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Oct 2018 02:51:27 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 09 Oct 2018 11:36:53 -0700
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Oct 2018 11:51:27 -0700
From: Atish Patra <atish.patra@wdc.com>
To: palmer@sifive.com, linux-riscv@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [RFC 4/4] gpio: sifive: Add GPIO driver for SiFive SoCs
Date: Tue,  9 Oct 2018 11:51:25 -0700
Message-Id: <1539111085-25502-5-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181009_115140_601203_A64541A4 
X-CRM114-Status: GOOD (  20.32  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, hch@infradead.org, atish.patra@wdc.com,
 robh+dt@kernel.org, thierry.reding@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181009185125.XfPfZVeKCCeSxIuDuO3pUgNw9ymEoZb9TuRcn1_TvtE@z>

From: "Wesley W. Terpstra" <wesley@sifive.com>

Adds the GPIO driver for SiFive RISC-V SoCs.

Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
[Atish: Various fixes and code cleanup]
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 drivers/gpio/Kconfig       |   7 +
 drivers/gpio/Makefile      |   1 +
 drivers/gpio/gpio-sifive.c | 326 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 334 insertions(+)
 create mode 100644 drivers/gpio/gpio-sifive.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 4f52c3a8..7755f49e 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -439,6 +439,13 @@ config GPIO_REG
 	  A 32-bit single register GPIO fixed in/out implementation.  This
 	  can be used to represent any register as a set of GPIO signals.
 
+config GPIO_SIFIVE
+	bool "SiFive GPIO support"
+	depends on OF_GPIO
+	select GPIOLIB_IRQCHIP
+	help
+	  Say yes here to support the GPIO device on SiFive SoCs.
+
 config GPIO_SPEAR_SPICS
 	bool "ST SPEAr13xx SPI Chip Select as GPIO support"
 	depends on PLAT_SPEAR
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index c256aff6..244a3696 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -111,6 +111,7 @@ obj-$(CONFIG_GPIO_REG)		+= gpio-reg.o
 obj-$(CONFIG_ARCH_SA1100)	+= gpio-sa1100.o
 obj-$(CONFIG_GPIO_SCH)		+= gpio-sch.o
 obj-$(CONFIG_GPIO_SCH311X)	+= gpio-sch311x.o
+obj-$(CONFIG_GPIO_SIFIVE)	+= gpio-sifive.o
 obj-$(CONFIG_GPIO_SODAVILLE)	+= gpio-sodaville.o
 obj-$(CONFIG_GPIO_SPEAR_SPICS)	+= gpio-spear-spics.o
 obj-$(CONFIG_GPIO_SPRD)		+= gpio-sprd.o
diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
new file mode 100644
index 00000000..5af2b405
--- /dev/null
+++ b/drivers/gpio/gpio-sifive.c
@@ -0,0 +1,326 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2017 SiFive
+ */
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/of_irq.h>
+#include <linux/gpio/driver.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/init.h>
+#include <linux/of.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+#define GPIO_INPUT_VAL	0x00
+#define GPIO_INPUT_EN	0x04
+#define GPIO_OUTPUT_EN	0x08
+#define GPIO_OUTPUT_VAL	0x0C
+#define GPIO_RISE_IE	0x18
+#define GPIO_RISE_IP	0x1C
+#define GPIO_FALL_IE	0x20
+#define GPIO_FALL_IP	0x24
+#define GPIO_HIGH_IE	0x28
+#define GPIO_HIGH_IP	0x2C
+#define GPIO_LOW_IE	0x30
+#define GPIO_LOW_IP	0x34
+#define GPIO_OUTPUT_XOR	0x40
+
+#define MAX_GPIO	32
+
+struct sifive_gpio {
+	raw_spinlock_t		lock;
+	void __iomem		*base;
+	struct gpio_chip	gc;
+	unsigned long		enabled;
+	unsigned int		trigger[MAX_GPIO];
+	unsigned int		irq_parent[MAX_GPIO];
+	struct sifive_gpio	*self_ptr[MAX_GPIO];
+};
+
+static void sifive_assign_bit(void __iomem *ptr, unsigned int offset, int value)
+{
+	/*
+	 * It's frustrating that we are not allowed to use the device atomics
+	 * which are GUARANTEED to be supported by this device on RISC-V
+	 */
+	u32 bit = BIT(offset), old = ioread32(ptr);
+
+	if (value)
+		iowrite32(old | bit, ptr);
+	else
+		iowrite32(old & ~bit, ptr);
+}
+
+static int sifive_direction_input(struct gpio_chip *gc, unsigned int offset)
+{
+	struct sifive_gpio *chip = gpiochip_get_data(gc);
+	unsigned long flags;
+
+	if (offset >= gc->ngpio)
+		return -EINVAL;
+
+	raw_spin_lock_irqsave(&chip->lock, flags);
+	sifive_assign_bit(chip->base + GPIO_OUTPUT_EN, offset, 0);
+	sifive_assign_bit(chip->base + GPIO_INPUT_EN,  offset, 1);
+	raw_spin_unlock_irqrestore(&chip->lock, flags);
+
+	return 0;
+}
+
+static int sifive_direction_output(struct gpio_chip *gc, unsigned int offset,
+				   int value)
+{
+	struct sifive_gpio *chip = gpiochip_get_data(gc);
+	unsigned long flags;
+
+	if (offset >= gc->ngpio)
+		return -EINVAL;
+
+	raw_spin_lock_irqsave(&chip->lock, flags);
+	sifive_assign_bit(chip->base + GPIO_INPUT_EN, offset, 0);
+	sifive_assign_bit(chip->base + GPIO_OUTPUT_VAL, offset, value);
+	sifive_assign_bit(chip->base + GPIO_OUTPUT_EN, offset, 1);
+	raw_spin_unlock_irqrestore(&chip->lock, flags);
+
+	return 0;
+}
+
+static int sifive_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct sifive_gpio *chip = gpiochip_get_data(gc);
+
+	if (offset >= gc->ngpio)
+		return -EINVAL;
+
+	return !(ioread32(chip->base + GPIO_OUTPUT_EN) & BIT(offset));
+}
+
+static int sifive_get_value(struct gpio_chip *gc, unsigned int offset)
+{
+	struct sifive_gpio *chip = gpiochip_get_data(gc);
+
+	if (offset >= gc->ngpio)
+		return -EINVAL;
+
+	return !!(ioread32(chip->base + GPIO_INPUT_VAL) & BIT(offset));
+}
+
+static void sifive_set_value(struct gpio_chip *gc, unsigned int offset,
+			     int value)
+{
+	struct sifive_gpio *chip = gpiochip_get_data(gc);
+	unsigned long flags;
+
+	if (offset >= gc->ngpio)
+		return;
+
+	raw_spin_lock_irqsave(&chip->lock, flags);
+	sifive_assign_bit(chip->base + GPIO_OUTPUT_VAL, offset, value);
+	raw_spin_unlock_irqrestore(&chip->lock, flags);
+}
+
+static void sifive_set_ie(struct sifive_gpio *chip, unsigned int offset)
+{
+	unsigned long flags;
+	unsigned int trigger;
+
+	raw_spin_lock_irqsave(&chip->lock, flags);
+	trigger = (chip->enabled & BIT(offset)) ? chip->trigger[offset] : 0;
+	sifive_assign_bit(chip->base + GPIO_RISE_IE, offset,
+			  trigger & IRQ_TYPE_EDGE_RISING);
+	sifive_assign_bit(chip->base + GPIO_FALL_IE, offset,
+			  trigger & IRQ_TYPE_EDGE_FALLING);
+	sifive_assign_bit(chip->base + GPIO_HIGH_IE, offset,
+			  trigger & IRQ_TYPE_LEVEL_HIGH);
+	sifive_assign_bit(chip->base + GPIO_LOW_IE, offset,
+			  trigger & IRQ_TYPE_LEVEL_LOW);
+	raw_spin_unlock_irqrestore(&chip->lock, flags);
+}
+
+static int sifive_irq_set_type(struct irq_data *d, unsigned int trigger)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct sifive_gpio *chip = gpiochip_get_data(gc);
+	int offset = irqd_to_hwirq(d);
+
+	if (offset < 0 || offset >= gc->ngpio)
+		return -EINVAL;
+
+	chip->trigger[offset] = trigger;
+	sifive_set_ie(chip, offset);
+	return 0;
+}
+
+/* chained_irq_{enter,exit} already mask the parent */
+static void sifive_irq_mask(struct irq_data *d) { }
+static void sifive_irq_unmask(struct irq_data *d) { }
+
+static void sifive_irq_enable(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct sifive_gpio *chip = gpiochip_get_data(gc);
+	int offset = irqd_to_hwirq(d) % MAX_GPIO; // must not fail
+	u32 bit = BIT(offset);
+
+	/* Switch to input */
+	sifive_direction_input(gc, offset);
+
+	/* Clear any sticky pending interrupts */
+	iowrite32(bit, chip->base + GPIO_RISE_IP);
+	iowrite32(bit, chip->base + GPIO_FALL_IP);
+	iowrite32(bit, chip->base + GPIO_HIGH_IP);
+	iowrite32(bit, chip->base + GPIO_LOW_IP);
+
+	/* Enable interrupts */
+	assign_bit(offset, &chip->enabled, 1);
+	sifive_set_ie(chip, offset);
+}
+
+static void sifive_irq_disable(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct sifive_gpio *chip = gpiochip_get_data(gc);
+	int offset = irqd_to_hwirq(d) % MAX_GPIO; // must not fail
+
+	assign_bit(offset, &chip->enabled, 0);
+	sifive_set_ie(chip, offset);
+}
+
+static struct irq_chip sifive_irqchip = {
+	.name		= "sifive-gpio",
+	.irq_set_type	= sifive_irq_set_type,
+	.irq_mask	= sifive_irq_mask,
+	.irq_unmask	= sifive_irq_unmask,
+	.irq_enable	= sifive_irq_enable,
+	.irq_disable	= sifive_irq_disable,
+};
+
+static void sifive_irq_handler(struct irq_desc *desc)
+{
+	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	struct sifive_gpio **self_ptr = irq_desc_get_handler_data(desc);
+	struct sifive_gpio *chip = *self_ptr;
+	int offset = self_ptr - &chip->self_ptr[0];
+	u32 bit = BIT(offset);
+
+	chained_irq_enter(irqchip, desc);
+
+	/* Re-arm the edge triggers so don't miss the next one */
+	iowrite32(bit, chip->base + GPIO_RISE_IP);
+	iowrite32(bit, chip->base + GPIO_FALL_IP);
+
+	generic_handle_irq(irq_find_mapping(chip->gc.irq.domain, offset));
+
+	/* Re-arm the level triggers after handling to prevent spurious refire */
+	iowrite32(bit, chip->base + GPIO_HIGH_IP);
+	iowrite32(bit, chip->base + GPIO_LOW_IP);
+
+	chained_irq_exit(irqchip, desc);
+}
+
+static int sifive_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = pdev->dev.of_node;
+	struct sifive_gpio *chip;
+	struct resource *res;
+	int gpio, irq, ret, ngpio;
+
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	chip->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(chip->base)) {
+		dev_err(dev, "failed to allocate device memory\n");
+		return PTR_ERR(chip->base);
+	}
+
+	ngpio = of_irq_count(node);
+	if (ngpio >= MAX_GPIO) {
+		dev_err(dev, "Too many GPIO interrupts (max=%d)\n", MAX_GPIO);
+		return -ENXIO;
+	}
+
+	raw_spin_lock_init(&chip->lock);
+	chip->gc.direction_input = sifive_direction_input;
+	chip->gc.direction_output = sifive_direction_output;
+	chip->gc.get_direction = sifive_get_direction;
+	chip->gc.get = sifive_get_value;
+	chip->gc.set = sifive_set_value;
+	chip->gc.base = -1;
+	chip->gc.ngpio = ngpio;
+	chip->gc.label = dev_name(dev);
+	chip->gc.parent = dev;
+	chip->gc.owner = THIS_MODULE;
+
+	ret = gpiochip_add_data(&chip->gc, chip);
+	if (ret)
+		return ret;
+
+	/* Disable all GPIO interrupts before enabling parent interrupts */
+	iowrite32(0, chip->base + GPIO_RISE_IE);
+	iowrite32(0, chip->base + GPIO_FALL_IE);
+	iowrite32(0, chip->base + GPIO_HIGH_IE);
+	iowrite32(0, chip->base + GPIO_LOW_IE);
+	chip->enabled = 0;
+
+	ret = gpiochip_irqchip_add(&chip->gc, &sifive_irqchip, 0,
+				   handle_simple_irq, IRQ_TYPE_NONE);
+	if (ret) {
+		dev_err(dev, "could not add irqchip\n");
+		gpiochip_remove(&chip->gc);
+		return ret;
+	}
+
+	chip->gc.irq.num_parents = ngpio;
+	chip->gc.irq.parents = &chip->irq_parent[0];
+	chip->gc.irq.map = &chip->irq_parent[0];
+
+	for (gpio = 0; gpio < ngpio; ++gpio) {
+		irq = platform_get_irq(pdev, gpio);
+		if (irq < 0) {
+			dev_err(dev, "invalid IRQ\n");
+			gpiochip_remove(&chip->gc);
+			return -ENODEV;
+		}
+
+		chip->irq_parent[gpio] = irq;
+		chip->self_ptr[gpio] = chip;
+		chip->trigger[gpio] = IRQ_TYPE_LEVEL_HIGH;
+	}
+
+	for (gpio = 0; gpio < ngpio; ++gpio) {
+		irq = chip->irq_parent[gpio];
+		irq_set_chained_handler_and_data(irq, sifive_irq_handler,
+						 &chip->self_ptr[gpio]);
+		irq_set_parent(irq_find_mapping(chip->gc.irq.domain, gpio),
+			       irq);
+	}
+
+	platform_set_drvdata(pdev, chip);
+	dev_info(dev, "SiFive GPIO chip registered %d GPIOs\n", ngpio);
+
+	return 0;
+}
+
+static const struct of_device_id sifive_gpio_match[] = {
+	{ .compatible = "sifive,gpio0" },
+	{ .compatible = "sifive,fu540-c000-gpio0" },
+	{ },
+};
+
+static struct platform_driver sifive_gpio_driver = {
+	.probe		= sifive_gpio_probe,
+	.driver = {
+		.name	= "sifive_gpio",
+		.of_match_table = of_match_ptr(sifive_gpio_match),
+	},
+};
+builtin_platform_driver(sifive_gpio_driver)
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
