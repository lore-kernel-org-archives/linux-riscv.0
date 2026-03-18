Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9726C103E160
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 11:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7CHAPa2jOdO7Vu+vGn/tmhxCvtZ2889cDr0rBPOs/WI=; b=5Db5GWlqvxfV6N
	Hd0aLM0zgPhoeXu3PBv/Jn2+i8UIPnD7DdnqR2SmF7g4VfqixIRtBFvYK+SZF/y2dgSYWJvmqxnIl
	hz0Le+z2/UQYBkyHjNtH9Z5YJUcjBfQeFNE1LH3c59bmyWAogkLjmOEjDZGbTamU6989hMQiJNqkP
	zNXyLQgA9QKg7KX1XePPCqdhWjyEoPfrxsJZvUly8J9FtJt2ticUSfAIIFLTtRZV+CbhT5iRai/WD
	68gm26JsK1R+WHPVZQBcqDf0qvFPAozI1GxxZLFEMimqFeiU14cDFtpcXz4Xk1Y4x/spnSz3KsE10
	7K5+tJDAhP+4SZ899eng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ohq-00000008GZw-23aL;
	Wed, 18 Mar 2026 11:04:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oho-00000008GZO-2Fre
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 11:04:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B650860132;
	Wed, 18 Mar 2026 11:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44017C19424;
	Wed, 18 Mar 2026 11:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773831891;
	bh=w/TqdJ1/e8z6rDle+tXTjAYr3suHi59fEhhlrloGrFY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qQKnFWuh9UnmhLyeTrExtfzSyxRSpHsXJ19zfTRSdwpbs1ONFoYYw0/+0wTe0L3Mu
	 8uAkikK8y689EEg/Bn1eurLNbomn2hI/YL9b/Oghj4+0lkT9shyqH6EFeLAJmzKPZE
	 n2+xgOIPy8mjaBPFWv2d2YJctmWmR4ajYEn/PnXALLTBWsnuMkIDUeNOF2ycKHKdPk
	 96v6xT4oTVnqCUSV2P6YHklnhTn3Nu9wa6TPXo+Ann1oJaHy11pwDR75go0VIowEAl
	 U0KUAhm0egBxSy6+2+k2DkJE+oytE7dtg3FuvBCA/JbAQth0LXWMQTD53psTroz3lQ
	 gGVrSHIlaCU0Q==
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
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v13 2/5] gpio: mpfs: Add interrupt support
Date: Wed, 18 Mar 2026 11:04:33 +0000
Message-ID: <20260318-siamese-twirl-ba045ad446f9@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260318-gift-nearest-fd3ef3e4819b@spud>
References: <20260318-gift-nearest-fd3ef3e4819b@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6415; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=qZAxon0cLWKPAGU5V9eYU2gifbxZBOUs+2bM9g63Uso=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJm72o6E/KhMu9YioWc2b9KflzLCESWuby9rJ209nrX46 6o1Pz91d5SyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiWqKMDK8O3t9h/aOgu0JZ LUlfPO5TSO+LwwGmuVYhhwotpjQudmL47xL3x8+9T7LA/si7b3zx0TLRL778vrR5RdulH3388mU unAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/gpio/Kconfig     |   1 +
 drivers/gpio/gpio-mpfs.c | 122 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 120 insertions(+), 3 deletions(-)

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
index 9468795b96348..1a4cf213c723c 100644
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
@@ -114,13 +116,98 @@ static int mpfs_gpio_set(struct gpio_chip *gc, unsigned int gpio_index, int valu
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
+static void mpfs_gpio_irq_handler(struct irq_desc *desc)
+{
+	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	struct mpfs_gpio_chip *mpfs_gpio = irq_desc_get_handler_data(desc);
+	unsigned long status;
+	u32 val;
+	int i;
+
+	chained_irq_enter(irqchip, desc);
+
+	regmap_read(mpfs_gpio->regs, MPFS_IRQ_REG, &val);
+	status = val;
+	for_each_set_bit(i, &status, MPFS_MAX_NUM_GPIO) {
+		regmap_write(mpfs_gpio->regs, MPFS_IRQ_REG, BIT(i));
+		generic_handle_domain_irq(mpfs_gpio->gc.irq.domain, i);
+	}
+
+	chained_irq_exit(irqchip, desc);
+}
+
 static int mpfs_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
 	struct mpfs_gpio_chip *mpfs_gpio;
+	struct gpio_irq_chip *girq;
 	struct clk *clk;
 	void __iomem *base;
-	int ngpios;
+	int ngpios, nirqs, ret;
 
 	mpfs_gpio = devm_kzalloc(dev, sizeof(*mpfs_gpio), GFP_KERNEL);
 	if (!mpfs_gpio)
@@ -157,6 +244,35 @@ static int mpfs_gpio_probe(struct platform_device *pdev)
 	mpfs_gpio->gc.parent = dev;
 	mpfs_gpio->gc.owner = THIS_MODULE;
 
+	nirqs = of_irq_count(node);
+	if (nirqs > MPFS_MAX_NUM_GPIO)
+		return -ENXIO;
+
+	if (nirqs) {
+		girq = &mpfs_gpio->gc.irq;
+
+		gpio_irq_chip_set_chip(girq, &mpfs_gpio_irqchip);
+
+		girq->num_parents = nirqs;
+		girq->parents = devm_kcalloc(&pdev->dev, girq->num_parents,
+					     sizeof(*girq->parents), GFP_KERNEL);
+		if (!girq->parents)
+			return -ENOMEM;
+
+		for (int i = 0; i < nirqs; i++) {
+			ret = platform_get_irq(pdev, i);
+			if (ret < 0)
+				return ret;
+
+			girq->parents[i] = ret;
+			girq->parent_handler_data = mpfs_gpio;
+			girq->parent_handler = mpfs_gpio_irq_handler;
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
