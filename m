Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E788CC3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 11:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=roEn6qBwR+ILw4AkmtTjyxQC53hgtp3QvCsd4UKlxw4=; b=qvyintDDB8leW1
	9xTIYD6QZh+J5E3yHyqU99oey5yN2OqDahX7OTvRhRycpuOPV+TXVnOsnVsizckRnnQ4g8Cm5dB+p
	87KW+/vb7N87rD1y0BJN0dIo+C3OJSjqQ77X6RHoaZlXgx3Pf2CCxNnp31nPal17hb7R5Urotzt6b
	bTP1Gc2ZlBNijTIXeyLORmm3zOdBjitC32dwFqCIfwBpmxRv0BVioa9VDWgZ9rSJ8ROT5PAhCKEgJ
	X2om4cOos+LUyCTJRjt76808baDrCeKBK9zxhqwoI2lQXa5Q7lK8wy+f6r2ttiPeJdqtSQ9bDJTtl
	cTBfeVdL7RBMcwwEATAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWDhB-0000000CGmY-3QL4;
	Tue, 23 Jul 2024 11:28:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWDh8-0000000CGkM-3nGh
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jul 2024 11:28:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721734118; x=1753270118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ucm8XGSvUldvd/bc2uyFIRcCiSr1Ximdbh0xRa+hE+Q=;
  b=owlVCThXRKdKKvA3I9zjjWiTgCQC9O1gEFrsvohntHKW9tljsSDWbtTQ
   lM5E688c3bkPeGox3b9NzrsP+YPjl1tGu1PQbakUCCiM5sm2m6CxAj4Xn
   jihnWpSck37h5XvUhSeFH/Q0vCD81cUb+p74NRE7VlwfmeXDZDPDmN5y1
   93skZDRBN9Zgzih7okWpEWQi0Zi4kHXTlcKDU9Grd0O34lL+JrUqHxNiG
   dWzhC45hZs9QNkfZoHjH4ndMBw/eMJ1/PqJKjumTzBuAKvj34h06hFau/
   LOq5Nhr8CU9xSt8lIsvinj5Bjgu46momqImH9+g8McA1JgneFHu+QI5OD
   g==;
X-CSE-ConnectionGUID: urgFf+kjT1Coy3E8dV+nGA==
X-CSE-MsgGUID: NdOsJdXTT0q1UVuWrE8VRg==
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="32335706"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Jul 2024 04:28:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jul 2024 04:28:20 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 23 Jul 2024 04:28:17 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-kernel@vger.kernel.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Marc Zyngier
	<maz@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	"Rob Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Thomas Gleixner" <tglx@linutronix.de>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [RFC v7 5/6] gpio: mpfs: pass gpio line number as irq data
Date: Tue, 23 Jul 2024 12:27:14 +0100
Message-ID: <20240723-handoff-race-33160609553f@wendy>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240723-supervise-drown-d5d3b303e7fd@wendy>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6470; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Ucm8XGSvUldvd/bc2uyFIRcCiSr1Ximdbh0xRa+hE+Q=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGnzJ0+YukcmPfZuz4P/5Vu65G/3V+9aXPHx6unjGh/ebMs0 1V1a11HKwiDGwSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJGHMxMtzhkZ83zzDnwR3pvaeZvs m+uhDCftMndUVD27G855Gyhc8Z/kepmi0xObLx8d1Fa9ZX7bx0OF1W7SbfD3+PqXa1Jzo7TfkA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_042838_998745_17F7442A 
X-CRM114-Status: GOOD (  20.26  )
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

Since the interrupt mux is going to provide us a 1:1 mapping for
interrupts, and it is no longer correct to hit all of the set bits in
the interrupt handler, store the GPIO that "owns" an interrupt in its
data pointer, so that we can determine which bit to clear.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
This patch will need to be squashed, I've kept it apart for illustrative
purposes.
---
 drivers/gpio/gpio-mpfs.c | 85 +++++++++++++++++++++++++++-------------
 1 file changed, 57 insertions(+), 28 deletions(-)

diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
index 1ac0526ba1029..b92f094964822 100644
--- a/drivers/gpio/gpio-mpfs.c
+++ b/drivers/gpio/gpio-mpfs.c
@@ -43,6 +43,7 @@ struct mpfs_gpio_chip {
 	struct clk *clk;
 	raw_spinlock_t	lock;
 	struct gpio_chip gc;
+	u8 irq_data[MAX_NUM_GPIO];
 };
 
 static void mpfs_gpio_assign_bit(void __iomem *addr, unsigned int bit_offset, bool value)
@@ -129,7 +130,7 @@ static int mpfs_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
-	int gpio_index = irqd_to_hwirq(data);
+	int gpio_index = irqd_to_hwirq(data) % 32;
 	u32 interrupt_type;
 	u32 gpio_cfg;
 	unsigned long flags;
@@ -168,11 +169,10 @@ static void mpfs_gpio_irq_unmask(struct irq_data *data)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
-	int gpio_index = irqd_to_hwirq(data);
+	int gpio_index = irqd_to_hwirq(data) % 32;
 
 	gpiochip_enable_irq(gc, gpio_index);
 	mpfs_gpio_direction_input(gc, gpio_index);
-	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
 	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index),
 			     MPFS_GPIO_EN_INT, 1);
 }
@@ -181,19 +181,18 @@ static void mpfs_gpio_irq_mask(struct irq_data *data)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
-	int gpio_index = irqd_to_hwirq(data);
+	int gpio_index = irqd_to_hwirq(data) % 32;
 
-	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
 	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index),
 			     MPFS_GPIO_EN_INT, 0);
 	gpiochip_disable_irq(gc, gpio_index);
 }
 
 static const struct irq_chip mpfs_gpio_irqchip = {
-	.name = "mpfs",
+	.name = "MPFS GPIO",
 	.irq_set_type = mpfs_gpio_irq_set_type,
-	.irq_mask	= mpfs_gpio_irq_mask,
-	.irq_unmask	= mpfs_gpio_irq_unmask,
+	.irq_mask = mpfs_gpio_irq_mask,
+	.irq_unmask = mpfs_gpio_irq_unmask,
 	.flags = IRQCHIP_IMMUTABLE | IRQCHIP_MASK_ON_SUSPEND,
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
@@ -201,18 +200,24 @@ static const struct irq_chip mpfs_gpio_irqchip = {
 static void mpfs_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct irq_chip *irqchip = irq_desc_get_chip(desc);
-	struct mpfs_gpio_chip *mpfs_gpio =
-		gpiochip_get_data(irq_desc_get_handler_data(desc));
+	void *handler_data = irq_desc_get_handler_data(desc);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(&desc->irq_data);
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	u8 gpio_index = *((u8 *)handler_data);
 	unsigned long status;
-	int offset;
+
+	/*
+	 * Since the parent may be a muxed/"non-direct" interrupt, this
+	 * interrupt may not be for us.
+	 */
+	status = readl(mpfs_gpio->base + MPFS_IRQ_REG);
+	if (!(status & BIT(gpio_index)))
+		return;
 
 	chained_irq_enter(irqchip, desc);
 
-	status = readl(mpfs_gpio->base + MPFS_IRQ_REG);
-	for_each_set_bit(offset, &status, mpfs_gpio->gc.ngpio) {
-		mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, offset, 1);
-		generic_handle_irq(irq_find_mapping(mpfs_gpio->gc.irq.domain, offset));
-	}
+	generic_handle_irq(irq_find_mapping(mpfs_gpio->gc.irq.domain, gpio_index));
+	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
 
 	chained_irq_exit(irqchip, desc);
 }
@@ -222,6 +227,7 @@ static int mpfs_gpio_probe(struct platform_device *pdev)
 	struct clk *clk;
 	struct device *dev = &pdev->dev;
 	struct device_node *node = pdev->dev.of_node;
+	void **irq_data = NULL;
 	struct mpfs_gpio_chip *mpfs_gpio;
 	struct gpio_irq_chip *girq;
 	int i, ret, ngpios, nirqs;
@@ -232,7 +238,8 @@ static int mpfs_gpio_probe(struct platform_device *pdev)
 
 	mpfs_gpio->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mpfs_gpio->base))
-		return dev_err_probe(dev, PTR_ERR(mpfs_gpio->base), "failed to ioremap memory resource\n");
+		return dev_err_probe(dev, PTR_ERR(mpfs_gpio->base),
+				     "failed to ioremap memory resource\n");
 
 	clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(clk))
@@ -266,20 +273,42 @@ static int mpfs_gpio_probe(struct platform_device *pdev)
 		ret = -ENXIO;
 		goto cleanup_clock;
 	}
+
 	girq = &mpfs_gpio->gc.irq;
-	gpio_irq_chip_set_chip(girq, &mpfs_gpio_irqchip);
-	girq->handler = handle_simple_irq;
-	girq->parent_handler = mpfs_gpio_irq_handler;
-	girq->default_type = IRQ_TYPE_NONE;
 	girq->num_parents = nirqs;
-	girq->parents = devm_kcalloc(&pdev->dev, nirqs,
-				     sizeof(*girq->parents), GFP_KERNEL);
-	if (!girq->parents) {
-		ret = -ENOMEM;
-		goto cleanup_clock;
+
+	if (girq->num_parents) {
+		gpio_irq_chip_set_chip(girq, &mpfs_gpio_irqchip);
+		girq->parent_handler = mpfs_gpio_irq_handler;
+
+		girq->parents = devm_kcalloc(&pdev->dev, girq->num_parents,
+					     sizeof(*girq->parents), GFP_KERNEL);
+		irq_data = devm_kmalloc_array(&pdev->dev, girq->num_parents,
+					      sizeof(*irq_data), GFP_KERNEL);
+
+		if (!girq->parents || !irq_data) {
+			ret = -ENOMEM;
+			goto cleanup_clock;
+		}
+
+		for (i = 0; i < girq->num_parents; i++) {
+			ret = platform_get_irq(pdev, i);
+			if (ret < 0)
+				goto cleanup_clock;
+
+			girq->parents[i] = ret;
+			mpfs_gpio->irq_data[i] = i;
+			irq_data[i] = &mpfs_gpio->irq_data[i];
+
+			irq_set_chip_data(ret, &mpfs_gpio->gc);
+			irq_set_handler(ret, handle_simple_irq);
+		}
+
+		girq->parent_handler_data_array = irq_data;
+		girq->per_parent_data = true;
+		girq->handler = handle_simple_irq;
+		girq->default_type = IRQ_TYPE_NONE;
 	}
-	for (i = 0; i < nirqs; i++)
-		girq->parents[i] = platform_get_irq(pdev, i);
 
 	ret = gpiochip_add_data(&mpfs_gpio->gc, mpfs_gpio);
 	if (ret)
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
