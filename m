Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D546FFEFB56
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 14:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ciuXVt7aStvcrany+AhU+yfs3L1Y816OLwNqlhAysA=; b=NoohcM7K/7OdHo
	8dSkQomYyxcjyzLHKJgBKwGkh5khPzldBwLH7VqEvKandDEEjZmypWbJxWL83czTS4XvvnlEDU42T
	n2L5eVwAy9ituPRLMm8ywjU6u8vpQmORFIMqh1o9sN/TJBtmXV+N42yRSROhOk4jP2jU3nTS7ny/3
	BDEnMJVC3a9uZL/IkkIe2iZbaxVcAJnWFDcRBpkMPML3bHukt14OynwG0BbY0wNIKcxHrJd5IWUUR
	pUPXrYospESuZH5rTciylMhtlPeC5YaRgI1QFRnKbEyqNZj4cDtbyUjGdUZUIThgEfOH6B/t7e+2u
	sZY6IHyWO9CXoRQzSMmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzDP-00000008WV9-1BAD;
	Fri, 27 Feb 2026 14:53:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzDM-00000008WU5-31ox
	for linux-riscv@lists.infradead.org;
	Fri, 27 Feb 2026 14:53:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 71D3A44394;
	Fri, 27 Feb 2026 14:53:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F774C19425;
	Fri, 27 Feb 2026 14:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772203992;
	bh=qVSLQnLG5A+yKQVcbZ9DrwfKJxXAwmi1lys8R9yVnVo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WNcchrZblbHZeZR99ZYYvGYyY9tDySULUCGowO47AXwin8stfyQ/pN3EQXfCUBEiP
	 j/tANGjCEnNHAShq6TRGD7SqbyfcSqOleFqfLItJN45/klADZa+EPYoDyHelr/218C
	 t2aGCHOR4je7gZwaZFNZ0DthzeBULjEjERUvYhSsXjJ4YrI+Qr56yIQJa7L1FE9hKJ
	 /1ig3cZmR7YTFRQcfGPCarVWRzNnVLHMg5UmMki1XqHLVuaUyRnUcmOzB7qN/BaOht
	 PmDO18ZjbNaS8Fhz9dyMmuqPTI5yfApWatpUOJoMbvOVs07qj3/uPWb4PN/6Ey91kX
	 F+FKcXx4TmIDw==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC v11 1/4] gpio: mpfs: Add interrupt support
Date: Fri, 27 Feb 2026 14:52:27 +0000
Message-ID: <20260227-divinely-drift-93307c6763d8@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260227-ajar-wolverine-7ce1ebd79821@spud>
References: <20260227-ajar-wolverine-7ce1ebd79821@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6554; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=tNrkXf9xRpJXldW5xByY8fgxiUqGJhd3Q94/091zx8s=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkL16/ZoqSUv3PV9yn10bFLch9ztYr+2PQr7in7n0sfW 7elhce/6ihlYRDjYpAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBE+iwY/nt9eyk1+810g07W SczSLT+/8ifZxL3yULx0L2TJyYTrtZsY/ops/ffr8b5H82f5sZmnayo3Pj210PPCvwdKz4/qvZp 8wJIBAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_065312_801856_6221DC61 
X-CRM114-Status: GOOD (  21.59  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Add support for interrupts to the PolarFire SoC GPIO driver. Each GPIO
has an independent interrupt that is wired to an interrupt mux that sits
between the controllers and the PLIC. The SoC has more GPIO lines than
connections from the mux to the PLIC, so some GPIOs must share PLIC
interrupts. The configuration is not static and is set at runtime,
conventionally by the platform's firmware. CoreGPIO, the version
intended for use in the FPGA fabric has two interrupt output ports, one
is IO_NUM bits wide, as is used in the hardened cores, and the other is
a single bit with all lines ORed together.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Doing the chained thing kinda covers all the bases at the expense of the
"direct" mode interrupts that have a dedicated connection to the PLIC.
---
 drivers/gpio/Kconfig     |   1 +
 drivers/gpio/gpio-mpfs.c | 125 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 123 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b45fb799e36c1..1d1239323f615 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -572,6 +572,7 @@ config GPIO_PL061
 config GPIO_POLARFIRE_SOC
 	bool "Microchip FPGA GPIO support"
 	select REGMAP_MMIO
+	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to support the GPIO controllers on Microchip FPGAs.
 
diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
index 9468795b96348..d19249dd0c87d 100644
--- a/drivers/gpio/gpio-mpfs.c
+++ b/drivers/gpio/gpio-mpfs.c
@@ -9,8 +9,9 @@
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/gpio/driver.h>
-#include <linux/init.h>
+#include <linux/interrupt.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
@@ -18,7 +19,7 @@
 
 #define MPFS_GPIO_CTRL(i)		(0x4 * (i))
 #define MPFS_MAX_NUM_GPIO		32
-#define MPFS_GPIO_EN_INT		3
+#define MPFS_GPIO_EN_INT		BIT(3)
 #define MPFS_GPIO_EN_OUT_BUF		BIT(2)
 #define MPFS_GPIO_EN_IN			BIT(1)
 #define MPFS_GPIO_EN_OUT		BIT(0)
@@ -52,6 +53,7 @@ static const struct regmap_config mpfs_gpio_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
+	.use_raw_spinlock = true,
 };
 
 static int mpfs_gpio_direction_input(struct gpio_chip *gc, unsigned int gpio_index)
@@ -114,13 +116,97 @@ static int mpfs_gpio_set(struct gpio_chip *gc, unsigned int gpio_index, int valu
 	return ret;
 }
 
+static int mpfs_gpio_irq_set_type(struct irq_data *data, unsigned int type)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	int gpio_index = irqd_to_hwirq(data) % 32;
+	u32 interrupt_type;
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
+	regmap_update_bits(mpfs_gpio->regs, MPFS_GPIO_CTRL(gpio_index),
+			   MPFS_GPIO_TYPE_INT_MASK, interrupt_type);
+
+	return 0;
+}
+
+static void mpfs_gpio_irq_unmask(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	int gpio_index = irqd_to_hwirq(data) % 32;
+
+	gpiochip_enable_irq(gc, gpio_index);
+	mpfs_gpio_direction_input(gc, gpio_index);
+	regmap_update_bits(mpfs_gpio->regs, MPFS_GPIO_CTRL(gpio_index),
+			     MPFS_GPIO_EN_INT, MPFS_GPIO_EN_INT);
+}
+
+static void mpfs_gpio_irq_mask(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	int gpio_index = irqd_to_hwirq(data) % 32;
+
+	regmap_update_bits(mpfs_gpio->regs, MPFS_GPIO_CTRL(gpio_index),
+			   MPFS_GPIO_EN_INT, 0);
+	gpiochip_disable_irq(gc, gpio_index);
+}
+
+static const struct irq_chip mpfs_gpio_irqchip = {
+	.name = "MPFS GPIO",
+	.irq_set_type = mpfs_gpio_irq_set_type,
+	.irq_mask = mpfs_gpio_irq_mask,
+	.irq_unmask = mpfs_gpio_irq_unmask,
+	.flags = IRQCHIP_IMMUTABLE | IRQCHIP_MASK_ON_SUSPEND,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static irqreturn_t mpfs_gpio_irq_handler(int irq, void *data)
+{
+	struct mpfs_gpio_chip *mpfs_gpio = data;
+	unsigned int handled = 0;
+	unsigned long status;
+	u32 val;
+	int i;
+
+	regmap_read(mpfs_gpio->regs, MPFS_IRQ_REG, &val);
+	status = val;
+	for_each_set_bit(i, &status, MPFS_MAX_NUM_GPIO) {
+		regmap_write(mpfs_gpio->regs, MPFS_IRQ_REG, BIT(i));
+		generic_handle_domain_irq(mpfs_gpio->gc.irq.domain, i);
+		handled++;
+	}
+
+	return handled ? IRQ_HANDLED : IRQ_NONE;
+}
+
 static int mpfs_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *node = pdev->dev.of_node;
 	struct mpfs_gpio_chip *mpfs_gpio;
+	struct gpio_irq_chip *girq;
 	struct clk *clk;
 	void __iomem *base;
-	int ngpios;
+	int ngpios, nirqs, ret;
 
 	mpfs_gpio = devm_kzalloc(dev, sizeof(*mpfs_gpio), GFP_KERNEL);
 	if (!mpfs_gpio)
@@ -157,6 +243,39 @@ static int mpfs_gpio_probe(struct platform_device *pdev)
 	mpfs_gpio->gc.parent = dev;
 	mpfs_gpio->gc.owner = THIS_MODULE;
 
+	nirqs = of_irq_count(node);
+	if (nirqs > MPFS_MAX_NUM_GPIO)
+		return -ENXIO;
+
+	girq = &mpfs_gpio->gc.irq;
+	girq->num_parents = nirqs;
+
+	if (girq->num_parents) {
+		gpio_irq_chip_set_chip(girq, &mpfs_gpio_irqchip);
+
+		girq->parents = devm_kcalloc(&pdev->dev, girq->num_parents,
+					     sizeof(*girq->parents), GFP_KERNEL);
+		if (!girq->parents)
+			return -ENOMEM;
+
+		for (int i = 0; i < girq->num_parents; i++) {
+			ret = platform_get_irq(pdev, i);
+			if (ret < 0)
+				return ret;
+
+			girq->parents[i] = ret;
+			ret = devm_request_irq(dev, girq->parents[i], mpfs_gpio_irq_handler,
+					       IRQF_SHARED, NULL, mpfs_gpio);
+			if (ret)
+				return dev_err_probe(dev, ret,
+						     "failed to request irq for line %u\n",
+						     i);
+		}
+
+		girq->handler = handle_level_irq;
+		girq->default_type = IRQ_TYPE_NONE;
+	}
+
 	return devm_gpiochip_add_data(dev, &mpfs_gpio->gc, mpfs_gpio);
 }
 
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
