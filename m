Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C1CCA101F
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 07:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ahm/+cKujvUWI9Y3bAcoZmGIYfDUo0ofZtU3QF8VQuY=; b=28o3T3CqTxxVtG
	1+ITug/vBMJt74Juo/CX6l4hksvGfShPx7q1eMoL+vXn+yMPN6v0smk7lyghd3qXq9oUF91kHDOVK
	eV1+2YLYNK0tLav4Q2IOJUgomllAeohzya8CspkOO5A4Ylr6J1QKjorcXQQ8xEvh1iY2FlE2Ryxm4
	MPOOaN85cafhWBgAewdsmoJd9ljI2+tyv0UEqKxuq7VriXwCWyUYI3pJje6mFSmdDV9hc/0uaqmqr
	k4BE4TF+4jwIZc/CTbmVeVqSlMXkzzVKGYK5ZxgXhD9XyHPTrITUaF5zd2vvAshbdBm03MhZmqXzw
	Tr0OG4q64YHyIKzwtvqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF18-0000000CRoy-3gvF;
	Wed, 10 Sep 2025 07:13:22 +0000
Received: from mail-wr1-f47.google.com ([209.85.221.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF0q-0000000CRI8-1LGr
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 07:13:08 +0000
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3e7512c8669so1145531f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Sep 2025 00:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488382; x=1758093182; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BzNPyHa0jkPlsSLca9eNkS1K/hrYwY5/Vqpdrab2tXM=;
        b=PikZ3PWuwHot9Nl5Pwz8MzRn8kYx8LtQLCVUYMw6kqkYmVj11sPYXuG2/+JNTg31OE
         BkiYPSgZ4Xf0lyA4KigTJGlyZV1zP6Lz/80alYym0BxRnnWthXx6fn5CP62AZgHZ57fk
         A0BdMgqjO7KU5yGR7HN9Q91kmjGBkHgXpIC5Qly1fT0MXo0otNu3alaZkb6dpNZ21tDO
         E4ShWO2WbaOQQFLpgxnn+55VEmHWMJqJdO2neMSb/PuB5oOcilSyOR8xqReDnGpgX4PF
         n45K/xuB6nYwl8oDlE0GWi3d081vsuafCy8y0FAqWGPO2etUDjKoU095BjIyxoqjHzMt
         AIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488382; x=1758093182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BzNPyHa0jkPlsSLca9eNkS1K/hrYwY5/Vqpdrab2tXM=;
        b=QG2QAolkMR+EUhwS/9IXwL/0qx1qqu0hCMGS+q9NsUsjWqOXU2GcEXJVMsMPOQw1wJ
         PoBDHT2pHBm28Vv/UplzEJFYYkKfwvOq6q1lDrDvfYY4XoCpbj2easiDT2BRNcz8PpdM
         PhAJHt2zAo+OCvtqu/5FTcQ3BPWG0LEY3XI57TSQdNBzuHOmEx8VjXY/gpKWIa+hpQ1/
         HdbsCBEEVdoH0bGLExOzKdhf4so95VDKKX4HQ7Wo352TtOFT/wRpQEgAIC+tCJZPd/f1
         IcVfQnJ+1w8fTNfoBG8WzA3zJrK0rpBiEOt7du0DcCGa9VfNFw/4TSfZEx6dEZVfxuRG
         tgrw==
X-Forwarded-Encrypted: i=1; AJvYcCUNl4LxgSr9wZ2uFumE20UshWWPbGMhu76ylwnOkF8qbq5G94WoyEawAFYcXePF42sr+8HQjPaQ4LDMAA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywal8MIhslaikv7R+5SzHwOHp4v7NyrYSJRptrjtL7SHrVoECVN
	iCwvMNDDQ+0nUy0GG5+JTDLt8/UNWdjruXB9P5IgZxWgQnzA0XhSsohm8hea/sN4sjLl4O9/vNA
	zBkfctGw=
X-Gm-Gg: ASbGnctShS4O94MOlSRV5PBrWq64Yq6EgXyZR5xCGtea1RQD1YdAmc25cqFxmGLN4fQ
	0kSDcB39VTGTJiwUNPWvDl2+kbKdU1Sd+OQcv+MKOZhbeOtdnjIm+IRNvhBxxyPCTCZuGK6rPgI
	kqN7htQeQ4VCdwFN+AnXwQrlkk4TpWhyJ+KnDW+zk0uuxM5CmHEsZDyg0uG+z/8quXIppSpxm6y
	xvtxzp2h7+BVmEAgn3a4RVyYkZUsiLAxSZsjpMhNZATJ9c2VRGVFSmTsRnkeA82P0mcuZrYv/uH
	rC3ROy/0QAc5DclfYJk46qNLEMiy7z3zrR2Y/0h4TdZRR2+7DjTUi3WCEdmyYuO6xKo8Dy0w9q5
	Of66RpaftXQEQM6dM
X-Google-Smtp-Source: AGHT+IH6hj6uL/adzcwKrLLe4SA0GP0maj4DqTWBN5z6e8LLiMSPzaBwq9uelePGdX1azVmM5KUbVg==
X-Received: by 2002:a05:6000:2f81:b0:3dc:2136:7523 with SMTP id ffacd0b85a97d-3e629f21c5dmr11589105f8f.0.1757488381592;
        Wed, 10 Sep 2025 00:13:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:13:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:41 +0200
Subject: [PATCH v2 05/15] gpio: ath79: use the generic GPIO chip lock for
 IRQ handling
MIME-Version: 1.0
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-5-f3d1a4c57124@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5449;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=bcHa6lqKQlw7+hlZUmJRaNL+C5C3+oP8WjaKrSR1XW4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTt+hUw+YSEHliKosRX9vqPf9bG62Dyu8TzD
 yDJbauawyWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7QAKCRARpy6gFHHX
 cgjbD/9evJ0NuXZ91q3iNSwAVaZeenZlTP+DRb8KXEVzA2NnFZkT8ryykyinuTQapB3BEeeZGR3
 qxtXZA/6Aa4pDEelgXa3R5Slud4ALMe3DBM2spLa9bMNR8bEc+SkzdweAWVg/5/HuIQlCRvjrzp
 1W+XtLhnlMW90K6N9Vo7rfBPUFPDHdkAtTU0zU+qkQ4zruXg3namoxd3duYVJukP0PHgF24QdAU
 sUIGaZkYHl/kZmbqBezIwHIU9zUYkc27WL7u7NHH6gaSyHYtfoJ86ZfpeZHailkQI2Hg5t1ekWU
 FEgLpZlBHffK7Oz+Wbfy5ZaOzxfGz/bAVBv/IpWxF/enn41DCxojgDhZaHMMopQuZ4m58poNP5b
 bWxCKbkNkwmgAZqEPQUlBfwbx9A2hNsURzqbTZsQLJl90GJVMBc+UsgapW8778L1eSjrlvBUw09
 uS6iEOz10vOAEnW5CVSnDkHqzfQzLQGAl0T+Nq/U+Q8Irt89ovsJB8H9IuoZUtY2bISv5Y88Ggo
 MAiLkIze3BVts7D6rhT4QJ98299QoJZWiIzzBaOej0VZwhe6ybHA1JnYn2Fk8j6ZCxq/k1K3mPs
 ptZnktOpsHmeKaArfUTO6Vgs4M735+b1qARrHUwJr0JPIjP3dyooIOyZqfxNk9l39E44JYFp4D+
 6kAWi8aO6delpRg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_001304_540129_CE833CB5 
X-CRM114-Status: GOOD (  16.89  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver uses its own raw spinlock in interrupt routines while the
generic GPIO chip callbacks use a separate one. This is, of course, racy
so use the fact that the lock in generic GPIO chip is also a raw
spinlock and convert the interrupt handling functions in this module to
using the provided generic GPIO chip locking API.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ath79.c | 51 ++++++++++++++++++-----------------------------
 1 file changed, 19 insertions(+), 32 deletions(-)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index 8879f23f1871ed323513082f4d2ebb2c40544cde..2ad9f6ac66362fba8cdab152a2b2c782dddf427c 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -31,7 +31,6 @@
 struct ath79_gpio_ctrl {
 	struct gpio_generic_chip chip;
 	void __iomem *base;
-	raw_spinlock_t lock;
 	unsigned long both_edges;
 };
 
@@ -72,23 +71,22 @@ static void ath79_gpio_irq_unmask(struct irq_data *data)
 {
 	struct ath79_gpio_ctrl *ctrl = irq_data_to_ath79_gpio(data);
 	u32 mask = BIT(irqd_to_hwirq(data));
-	unsigned long flags;
 
 	gpiochip_enable_irq(&ctrl->chip.gc, irqd_to_hwirq(data));
-	raw_spin_lock_irqsave(&ctrl->lock, flags);
+
+	guard(gpio_generic_lock_irqsave)(&ctrl->chip);
+
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, mask);
-	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
 }
 
 static void ath79_gpio_irq_mask(struct irq_data *data)
 {
 	struct ath79_gpio_ctrl *ctrl = irq_data_to_ath79_gpio(data);
 	u32 mask = BIT(irqd_to_hwirq(data));
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&ctrl->lock, flags);
-	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, 0);
-	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
+	scoped_guard(gpio_generic_lock_irqsave, &ctrl->chip)
+		ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, 0);
+
 	gpiochip_disable_irq(&ctrl->chip.gc, irqd_to_hwirq(data));
 }
 
@@ -96,24 +94,20 @@ static void ath79_gpio_irq_enable(struct irq_data *data)
 {
 	struct ath79_gpio_ctrl *ctrl = irq_data_to_ath79_gpio(data);
 	u32 mask = BIT(irqd_to_hwirq(data));
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&ctrl->lock, flags);
+	guard(gpio_generic_lock_irqsave)(&ctrl->chip);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_ENABLE, mask, mask);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, mask);
-	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
 }
 
 static void ath79_gpio_irq_disable(struct irq_data *data)
 {
 	struct ath79_gpio_ctrl *ctrl = irq_data_to_ath79_gpio(data);
 	u32 mask = BIT(irqd_to_hwirq(data));
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&ctrl->lock, flags);
+	guard(gpio_generic_lock_irqsave)(&ctrl->chip);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, 0);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_ENABLE, mask, 0);
-	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
 }
 
 static int ath79_gpio_irq_set_type(struct irq_data *data,
@@ -122,7 +116,6 @@ static int ath79_gpio_irq_set_type(struct irq_data *data,
 	struct ath79_gpio_ctrl *ctrl = irq_data_to_ath79_gpio(data);
 	u32 mask = BIT(irqd_to_hwirq(data));
 	u32 type = 0, polarity = 0;
-	unsigned long flags;
 	bool disabled;
 
 	switch (flow_type) {
@@ -144,7 +137,7 @@ static int ath79_gpio_irq_set_type(struct irq_data *data,
 		return -EINVAL;
 	}
 
-	raw_spin_lock_irqsave(&ctrl->lock, flags);
+	guard(gpio_generic_lock_irqsave)(&ctrl->chip);
 
 	if (flow_type == IRQ_TYPE_EDGE_BOTH) {
 		ctrl->both_edges |= mask;
@@ -169,8 +162,6 @@ static int ath79_gpio_irq_set_type(struct irq_data *data,
 		ath79_gpio_update_bits(
 			ctrl, AR71XX_GPIO_REG_INT_ENABLE, mask, mask);
 
-	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
-
 	return 0;
 }
 
@@ -192,26 +183,24 @@ static void ath79_gpio_irq_handler(struct irq_desc *desc)
 	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(gc);
 	struct ath79_gpio_ctrl *ctrl =
 		container_of(gen_gc, struct ath79_gpio_ctrl, chip);
-	unsigned long flags, pending;
+	unsigned long pending;
 	u32 both_edges, state;
 	int irq;
 
 	chained_irq_enter(irqchip, desc);
 
-	raw_spin_lock_irqsave(&ctrl->lock, flags);
+	scoped_guard(gpio_generic_lock_irqsave, &ctrl->chip) {
+		pending = ath79_gpio_read(ctrl, AR71XX_GPIO_REG_INT_PENDING);
 
-	pending = ath79_gpio_read(ctrl, AR71XX_GPIO_REG_INT_PENDING);
-
-	/* Update the polarity of the both edges irqs */
-	both_edges = ctrl->both_edges & pending;
-	if (both_edges) {
-		state = ath79_gpio_read(ctrl, AR71XX_GPIO_REG_IN);
-		ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_POLARITY,
-				both_edges, ~state);
+		/* Update the polarity of the both edges irqs */
+		both_edges = ctrl->both_edges & pending;
+		if (both_edges) {
+			state = ath79_gpio_read(ctrl, AR71XX_GPIO_REG_IN);
+			ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_POLARITY,
+					       both_edges, ~state);
+		}
 	}
 
-	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
-
 	for_each_set_bit(irq, &pending, gc->ngpio)
 		generic_handle_domain_irq(gc->irq.domain, irq);
 
@@ -256,8 +245,6 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(ctrl->base))
 		return PTR_ERR(ctrl->base);
 
-	raw_spin_lock_init(&ctrl->lock);
-
 	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
 		.sz = 4,

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
