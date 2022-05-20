Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968B6C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 11:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LyqLlqxV6EcZO4s0HVyQdh667Wj5hLZMJv1Ro6wmsy0=; b=OKEJPLKU3x2jK0
	6QFBqGCMgw7gZWFncfZmRSp4OCS4vcs586zHhhMI8/+lDusLCyHwa4K44JCLrP1aSzgVJTyN3gsPP
	L0ze/IJ74e63XRcvfIvT2dcYeDaF8VZLnn0xz6/a7XiyVlDdYR7dQ3nv+DkI0JZQOBmF3N7wP2aUj
	rj49hQ6T9SIRo6QfIe/hNld5XnExqgHTet5SNeXLwoIIUzj5ljCyPA/hIiOsnIVZIhIE4cbl+SbGc
	lJyjZBrncnsK1wLyVss/QDYFWYhrX2V/N5+34q7lQQwxA7+8MAltjPuF7ZhE+o7sVmvJAQOy4L+Xa
	d3nptuv9UmpwI8EHZbUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns0qI-00C5gH-I5; Fri, 20 May 2022 11:30:50 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrzo0-00Bs4K-Db
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 10:24:26 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:cdaa:735b:3efc:39fe])
 by michel.telenet-ops.be with bizsmtp
 id YyQK2700638adXi06yQKuV; Fri, 20 May 2022 12:24:20 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nrznu-000zvt-JF; Fri, 20 May 2022 12:24:18 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nrznu-003vKC-4K; Fri, 20 May 2022 12:24:18 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, Marc Zyngier <maz@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] gpio: sifive: Make the irqchip immutable
Date: Fri, 20 May 2022 12:24:16 +0200
Message-Id: <26519be2a2fdd4c6741658144e3a8d78cf4d000b.1653042202.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_032424_647600_5AFFE4DE 
X-CRM114-Status: GOOD (  12.33  )
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

Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
immutable") added a warning to indicate if the gpiolib is altering the
internals of irqchips.  Following this change the following warning is
now observed for the sifive driver:

    gpio gpiochip1: (38001000.gpio-controller): not an immutable chip, please consider fixing it!

Fix this by making the irqchip in the sifive driver immutable.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Against gpio/for-next.
Boot-tested on SiPEED MAiXBiT (Canaan K210).

v2:
  - Factor out hwirq using preferred helper.
---
 drivers/gpio/gpio-sifive.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index 03b8c4de2e91e3c4..238f3210970cfa0e 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -75,10 +75,12 @@ static void sifive_gpio_irq_enable(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct sifive_gpio *chip = gpiochip_get_data(gc);
-	int offset = irqd_to_hwirq(d) % SIFIVE_GPIO_MAX;
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	int offset = hwirq % SIFIVE_GPIO_MAX;
 	u32 bit = BIT(offset);
 	unsigned long flags;
 
+	gpiochip_enable_irq(gc, hwirq);
 	irq_chip_enable_parent(d);
 
 	/* Switch to input */
@@ -101,11 +103,13 @@ static void sifive_gpio_irq_disable(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct sifive_gpio *chip = gpiochip_get_data(gc);
-	int offset = irqd_to_hwirq(d) % SIFIVE_GPIO_MAX;
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	int offset = hwirq % SIFIVE_GPIO_MAX;
 
 	assign_bit(offset, &chip->irq_state, 0);
 	sifive_gpio_set_ie(chip, offset);
 	irq_chip_disable_parent(d);
+	gpiochip_disable_irq(gc, hwirq);
 }
 
 static void sifive_gpio_irq_eoi(struct irq_data *d)
@@ -137,7 +141,7 @@ static int sifive_gpio_irq_set_affinity(struct irq_data *data,
 	return -EINVAL;
 }
 
-static struct irq_chip sifive_gpio_irqchip = {
+static const struct irq_chip sifive_gpio_irqchip = {
 	.name		= "sifive-gpio",
 	.irq_set_type	= sifive_gpio_irq_set_type,
 	.irq_mask	= irq_chip_mask_parent,
@@ -146,6 +150,8 @@ static struct irq_chip sifive_gpio_irqchip = {
 	.irq_disable	= sifive_gpio_irq_disable,
 	.irq_eoi	= sifive_gpio_irq_eoi,
 	.irq_set_affinity = sifive_gpio_irq_set_affinity,
+	.flags		= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int sifive_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
@@ -242,7 +248,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 	chip->gc.parent = dev;
 	chip->gc.owner = THIS_MODULE;
 	girq = &chip->gc.irq;
-	girq->chip = &sifive_gpio_irqchip;
+	gpio_irq_chip_set_chip(girq, &sifive_gpio_irqchip);
 	girq->fwnode = of_node_to_fwnode(node);
 	girq->parent_domain = parent;
 	girq->child_to_parent_hwirq = sifive_gpio_child_to_parent_hwirq;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
