Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582C3C02182
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 03:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7RoLVu6qmMNj2/GiLvOL1lJ4GKBRxWGlbOtjZJN8Zk8=; b=zn/0lsq87ZesWt
	IvPrtmyOI8VTMV6+yWfIjM9MQt5rBaR3prAVl/ZtE77b62teKW5GMYzYZ9DxXshXmx6fy6U8FhIGc
	5FCS2hsQfg+aej3z3BRjssaCof/RQsEFKAhCivYg26Gs8ClblfUME21EWyQnEbq0O9Xqa8YANqY40
	3jJA3NfpDv/qgG0YjFX9q8aJsiTWhrmMH9c1/JRivsmWjxCe8caqgjoS1w3gFKoFxP6QULM3JABL9
	q2wUcRHrbFMf050XtDjFpDrOkezY3xJDZ0oP90MBNeOgcWvhzwAbEMGuoe9z2OeAK1TXQNVoKUfP1
	w7kiHYol/Ez3VbVXL1Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta56k-00000006pDj-0N64;
	Tue, 21 Jan 2025 03:39:18 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta56h-00000006pCc-3fqk
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 03:39:17 +0000
Received: from [127.0.0.1] (unknown [116.227.99.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 5963A342F65;
	Tue, 21 Jan 2025 03:39:09 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 21 Jan 2025 11:38:12 +0800
Subject: [PATCH v4 2/4] gpio: spacemit: add support for K1 SoC
MIME-Version: 1.0
Message-Id: <20250121-03-k1-gpio-v4-2-4641c95c0194@gentoo.org>
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
In-Reply-To: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=9892; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=N8IJwP3kwmT6kUH99xSQJkJrhj3UoktTmDVOh8HG1og=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnjxbGfJZu7Axu8wkfMydud4E9LRxEuZdlR2rzA
 HMWei8yyvSJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ48Wxl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277cJ7D/0b0dS8JLKHwSKvUv
 78O+LOwosmTh/eo5tye1HQS7kz4wxCMVHuych6wzyKSbg7sJRBb00sXW4jy8wmxSy5wKQ6AgKpR
 LRef9fWKGaW4B840Jo7CkXm8bFIzI+GlYc+z2fXZydgq2KZi7TdoAbTPUg7eMrLcrHtCu+UTOHx
 oQoAGvt0zyxBM25n6A8s0vYTTBOF07r4oOHY1l0qJlAt/2JLQXA60CBYkYOmqqdaIIM+T4/HoWx
 xlAcapj0ELc7mDJJEbRpZbXlZEu8TxhqJjCpxJXxJ3wg3i/Hveqd4JDgykXe57j4mAvHDFMAoPU
 pU/zAy8vrJTH+8qZnrxUNFQJXLii9qRcxZmldY1z2YknjmwLRcdEavRT1hbN+FFluoqhS26SIHo
 CdpMlE0fDMJVaW6HdXJwUxi1rzzWpasSQzS1rMh9NFIoz7USvdrRL7qi1RN6QuDFZNA/OFqnP9j
 2NMt8fKFQ71PfQC9RlOdq3g7pI8o+Ei+hFJde136hzUK5VrepDebEC0PikFedo50DhiBYBEc/dC
 LNKuZaNCDDrquNx5FqhbB/AhFeCIJz/b/gVw1NdEE07f/8B63mdsfn0Dc7VarbdR3aOc30X6W1c
 SnKvSPDI8DM8zRwjSiVQRlmhq5aZ5XekdbKJTqgY3HUAmHTAF64Ntnvu7YO810UvMjKA==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_193915_949353_A75400EA 
X-CRM114-Status: GOOD (  23.07  )
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
Cc: devicetree@vger.kernel.org, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Implement GPIO functionality which capable of setting pin as
input, output. Also, each pin can be used as interrupt which
support rising, failing, or both edge type trigger.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/gpio/Kconfig            |   7 +
 drivers/gpio/Makefile           |   1 +
 drivers/gpio/gpio-spacemit-k1.c | 295 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 303 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 56fee58e281e7cac7f287eb04e4c17a17f75ed04..c153f5439649da020ee42c38e88cb8df31a8e307 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -654,6 +654,13 @@ config GPIO_SNPS_CREG
 	  where only several fields in register belong to GPIO lines and
 	  each GPIO line owns a field with different length and on/off value.
 
+config GPIO_SPACEMIT_K1
+	bool "SPACEMIT K1 GPIO support"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	select GPIOLIB_IRQCHIP
+	help
+	  Say yes here to support the SpacemiT's K1 GPIO device.
+
 config GPIO_SPEAR_SPICS
 	bool "ST SPEAr13xx SPI Chip Select as GPIO support"
 	depends on PLAT_SPEAR
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index af3ba4d81b583842893ea69e677fbe2abf31bc7b..6709ce511a0cf10310a94521c85a2d382dcfa696 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -156,6 +156,7 @@ obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
 obj-$(CONFIG_GPIO_SL28CPLD)		+= gpio-sl28cpld.o
 obj-$(CONFIG_GPIO_SLOPPY_LOGIC_ANALYZER) += gpio-sloppy-logic-analyzer.o
 obj-$(CONFIG_GPIO_SODAVILLE)		+= gpio-sodaville.o
+obj-$(CONFIG_GPIO_SPACEMIT_K1)		+= gpio-spacemit-k1.o
 obj-$(CONFIG_GPIO_SPEAR_SPICS)		+= gpio-spear-spics.o
 obj-$(CONFIG_GPIO_SPRD)			+= gpio-sprd.o
 obj-$(CONFIG_GPIO_STMPE)		+= gpio-stmpe.o
diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
new file mode 100644
index 0000000000000000000000000000000000000000..de0491af494c10f528095efee9b3a140bdcc0b0d
--- /dev/null
+++ b/drivers/gpio/gpio-spacemit-k1.c
@@ -0,0 +1,295 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2023-2025 SpacemiT (Hangzhou) Technology Co. Ltd
+ * Copyright (c) 2025 Yixun Lan <dlan@gentoo.org>
+ */
+
+#include <linux/io.h>
+#include <linux/init.h>
+#include <linux/irq.h>
+#include <linux/interrupt.h>
+#include <linux/gpio/driver.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/seq_file.h>
+#include <linux/module.h>
+
+/* register offset */
+#define GPLR		0x00
+#define GPDR		0x0c
+#define GPSR		0x18
+#define GPCR		0x24
+#define GRER		0x30
+#define GFER		0x3c
+#define GEDR		0x48
+#define GSDR		0x54
+#define GCDR		0x60
+#define GSRER		0x6c
+#define GCRER		0x78
+#define GSFER		0x84
+#define GCFER		0x90
+#define GAPMASK		0x9c
+#define GCPMASK		0xa8
+
+#define K1_BANK_GPIO_NUMBER	(32)
+
+#define to_spacemit_gpio_port(x) container_of((x), struct spacemit_gpio_port, gc)
+
+struct spacemit_gpio;
+
+struct spacemit_gpio_port {
+	struct gpio_chip		gc;
+	struct spacemit_gpio		*gpio;
+	struct fwnode_handle		*fwnode;
+	void __iomem			*base;
+	int				irq;
+	u32				irq_mask;
+	u32				irq_rising_edge;
+	u32				irq_falling_edge;
+	u32				index;
+};
+
+struct spacemit_gpio {
+	struct	device			*dev;
+	struct spacemit_gpio_port	*ports;
+	u32				nr_ports;
+};
+
+static inline void spacemit_clear_edge_detection(struct spacemit_gpio_port *port, u32 bit)
+{
+	writel(bit, port->base + GCRER);
+	writel(bit, port->base + GCFER);
+}
+
+static inline void spacemit_set_edge_detection(struct spacemit_gpio_port *port, u32 bit)
+{
+	writel(bit & port->irq_rising_edge,  port->base + GSRER);
+	writel(bit & port->irq_falling_edge, port->base + GSFER);
+}
+
+static inline void spacemit_reset_edge_detection(struct spacemit_gpio_port *port)
+{
+	writel(0xffffffff, port->base + GCFER);
+	writel(0xffffffff, port->base + GCRER);
+	writel(0xffffffff, port->base + GAPMASK);
+}
+
+static int spacemit_gpio_irq_type(struct irq_data *d, unsigned int type)
+{
+	struct spacemit_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 bit = BIT(irqd_to_hwirq(d));
+
+	if (type & IRQ_TYPE_EDGE_RISING) {
+		port->irq_rising_edge |= bit;
+		writel(bit, port->base + GSRER);
+	} else {
+		port->irq_rising_edge &= ~bit;
+		writel(bit, port->base + GCRER);
+	}
+
+	if (type & IRQ_TYPE_EDGE_FALLING) {
+		port->irq_falling_edge |= bit;
+		writel(bit, port->base + GSFER);
+	} else {
+		port->irq_falling_edge &= ~bit;
+		writel(bit, port->base + GCFER);
+	}
+
+	return 0;
+}
+
+static irqreturn_t spacemit_gpio_irq_handler(int irq, void *dev_id)
+{
+	struct spacemit_gpio_port *port = dev_id;
+	unsigned long pending;
+	u32 n, gedr;
+
+	gedr = readl(port->base + GEDR);
+	if (!gedr)
+		return IRQ_NONE;
+
+	writel(gedr, port->base + GEDR);
+	gedr = gedr & port->irq_mask;
+
+	if (!gedr)
+		return IRQ_NONE;
+
+	pending = gedr;
+
+	for_each_set_bit(n, &pending, BITS_PER_LONG)
+		handle_nested_irq(irq_find_mapping(port->gc.irq.domain, n));
+
+	return IRQ_HANDLED;
+}
+
+static void spacemit_ack_muxed_gpio(struct irq_data *d)
+{
+	struct spacemit_gpio_port *port = irq_data_get_irq_chip_data(d);
+
+	writel(BIT(irqd_to_hwirq(d)), port->base + GEDR);
+}
+
+static void spacemit_mask_muxed_gpio(struct irq_data *d)
+{
+	struct spacemit_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 bit = BIT(irqd_to_hwirq(d));
+
+	port->irq_mask &= ~bit;
+
+	spacemit_clear_edge_detection(port, bit);
+}
+
+static void spacemit_unmask_muxed_gpio(struct irq_data *d)
+{
+	struct spacemit_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 bit = BIT(irqd_to_hwirq(d));
+
+	port->irq_mask |= bit;
+
+	spacemit_set_edge_detection(port, bit);
+}
+
+static void spacemit_irq_print_chip(struct irq_data *data, struct seq_file *p)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct spacemit_gpio_port *port = to_spacemit_gpio_port(gc);
+
+	seq_printf(p, "%s-%d", dev_name(gc->parent), port->index);
+}
+
+static struct irq_chip spacemit_muxed_gpio_chip = {
+	.name		= "k1-gpio-irqchip",
+	.irq_ack	= spacemit_ack_muxed_gpio,
+	.irq_mask	= spacemit_mask_muxed_gpio,
+	.irq_unmask	= spacemit_unmask_muxed_gpio,
+	.irq_set_type	= spacemit_gpio_irq_type,
+	.irq_print_chip	= spacemit_irq_print_chip,
+	.flags		= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static int spacemit_gpio_get_ports(struct device *dev, struct spacemit_gpio *gpio,
+				   void __iomem *regs)
+{
+	struct spacemit_gpio_port *port;
+	u32 i = 0, offset;
+
+	gpio->nr_ports = device_get_child_node_count(dev);
+	if (gpio->nr_ports == 0)
+		return -ENODEV;
+
+	gpio->ports = devm_kcalloc(dev, gpio->nr_ports, sizeof(*gpio->ports), GFP_KERNEL);
+	if (!gpio->ports)
+		return -ENOMEM;
+
+	device_for_each_child_node_scoped(dev, fwnode)  {
+		port		= &gpio->ports[i];
+		port->fwnode	= fwnode;
+		port->index	= i++;
+
+		if (fwnode_property_read_u32(fwnode, "reg", &offset))
+			return -EINVAL;
+
+		port->base	= regs + offset;
+		port->irq	= fwnode_irq_get(fwnode, 0);
+	}
+
+	return 0;
+}
+
+static int spacemit_gpio_add_port(struct spacemit_gpio *gpio, int index)
+{
+	struct spacemit_gpio_port *port;
+	struct device *dev = gpio->dev;
+	struct gpio_irq_chip *girq;
+	void __iomem *dat, *set, *clr, *dirin, *dirout;
+	int ret;
+
+	port = &gpio->ports[index];
+	port->gpio = gpio;
+
+	dat	= port->base + GPLR;
+	set	= port->base + GPSR;
+	clr	= port->base + GPCR;
+	dirin	= port->base + GCDR;
+	dirout	= port->base + GSDR;
+
+	/* This registers 32 GPIO lines per port */
+	ret = bgpio_init(&port->gc, dev, 4, dat, set, clr, dirout, dirin,
+			 BGPIOF_UNREADABLE_REG_SET | BGPIOF_UNREADABLE_REG_DIR);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to init gpio chip for port\n");
+
+	port->gc.label		= dev_name(dev);
+	port->gc.fwnode		= port->fwnode;
+	port->gc.request	= gpiochip_generic_request;
+	port->gc.free		= gpiochip_generic_free;
+	port->gc.ngpio		= K1_BANK_GPIO_NUMBER;
+	port->gc.base		= -1;
+
+	girq			= &port->gc.irq;
+	girq->threaded		= true;
+	girq->handler		= handle_simple_irq;
+
+	gpio_irq_chip_set_chip(girq, &spacemit_muxed_gpio_chip);
+
+	spacemit_reset_edge_detection(port);
+
+	ret = devm_request_threaded_irq(dev, port->irq, NULL,
+					spacemit_gpio_irq_handler,
+					IRQF_ONESHOT | IRQF_SHARED,
+					port->gc.label, port);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to request IRQ\n");
+
+	return devm_gpiochip_add_data(dev, &port->gc, port);
+}
+
+static int spacemit_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct spacemit_gpio *gpio;
+	struct resource *res;
+	void __iomem *regs;
+	int i, ret;
+
+	gpio = devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+
+	gpio->dev = dev;
+
+	regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	ret = spacemit_gpio_get_ports(dev, gpio, regs);
+	if (ret)
+		return dev_err_probe(dev, ret, "fail to get gpio ports\n");
+
+	for (i = 0; i < gpio->nr_ports; i++) {
+		ret = spacemit_gpio_add_port(gpio, i);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id spacemit_gpio_dt_ids[] = {
+	{ .compatible = "spacemit,k1-gpio" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver spacemit_gpio_driver = {
+	.probe		= spacemit_gpio_probe,
+	.driver		= {
+		.name	= "k1-gpio",
+		.of_match_table = spacemit_gpio_dt_ids,
+	},
+};
+module_platform_driver(spacemit_gpio_driver);
+
+MODULE_AUTHOR("Yixun Lan <dlan@gentoo.org>");
+MODULE_DESCRIPTION("GPIO driver for SpacemiT K1 SoC");
+MODULE_LICENSE("GPL");

-- 
2.48.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
