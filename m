Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46BEC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 10:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bJjGRkQO2SJbgsZEMlOJx9rjUz9z5RkgsScZbuIBrsw=; b=bqz9WDU0wDqrGG
	YqgZ9185zRltFY+rvsuU0sItbsh9P+KPDOs/isyWva0tB54bgOk8c+RbxS6N9SHUOVeowrdCzkX1k
	b9WwBZ4pgA78gKTiiNlwrtav8CibQmPIoN86ucsoNFcFo4Yul4AAihh7vtqvTDyQ2xaAcNwdD8d3c
	19H/BWALf4Y4ewzkwCcPcHmLGfPgIQYYF21BqjmpN0GHhPjsm8AfP1TBGP2ZCDQhnKFeMfCJtty66
	3w0S324znyjBesoFUi+wNf0YNwVYL9q/lgbg3jtcH73gRJCjhf94u2Jcch3STKzrxvWLnWbwhOaf8
	NZj25tJU9pIKEto2P91Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrzn8-00Brih-Li; Fri, 20 May 2022 10:23:30 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrzn5-00Brf2-It
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 10:23:29 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:cdaa:735b:3efc:39fe])
 by baptiste.telenet-ops.be with bizsmtp
 id YyPL2700E38adXi01yPL1G; Fri, 20 May 2022 12:23:21 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nrzmx-000zvD-Su; Fri, 20 May 2022 12:23:19 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nrzmx-003vIE-Bo; Fri, 20 May 2022 12:23:19 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Hoan Tran <hoan@os.amperecomputing.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Damien Le Moal <damien.lemoal@wdc.com>, Marc Zyngier <maz@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] gpio: dwapb: Make the irqchip immutable
Date: Fri, 20 May 2022 12:23:18 +0200
Message-Id: <01f7a990654697ca7ec8b2d0025f41403462c8d9.1653042121.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_032327_802494_DA17EC6E 
X-CRM114-Status: GOOD (  12.34  )
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
now observed for the dwapb driver:

    gpio gpiochip0: (50200000.gpio): not an immutable chip, please consider fixing it!

Fix this by making the irqchip in the dwapb driver immutable.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Against gpio/for-next.
Boot-tested on SiPEED MAiXBiT (Canaan K210).

v2:
  - Factor out hwirq using preferred helper.
---
 drivers/gpio/gpio-dwapb.c | 38 ++++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 7130195da48d75dd..04afe728e18748df 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -95,7 +95,6 @@ struct dwapb_context {
 #endif
 
 struct dwapb_gpio_port_irqchip {
-	struct irq_chip		irqchip;
 	unsigned int		nr_irqs;
 	unsigned int		irq[DWAPB_MAX_GPIOS];
 };
@@ -252,24 +251,30 @@ static void dwapb_irq_mask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	unsigned long flags;
 	u32 val;
 
 	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
-	val = dwapb_read(gpio, GPIO_INTMASK) | BIT(irqd_to_hwirq(d));
+	val = dwapb_read(gpio, GPIO_INTMASK) | BIT(hwirq);
 	dwapb_write(gpio, GPIO_INTMASK, val);
 	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+
+	gpiochip_disable_irq(gc, hwirq);
 }
 
 static void dwapb_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	unsigned long flags;
 	u32 val;
 
+	gpiochip_enable_irq(gc, hwirq);
+
 	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
-	val = dwapb_read(gpio, GPIO_INTMASK) & ~BIT(irqd_to_hwirq(d));
+	val = dwapb_read(gpio, GPIO_INTMASK) & ~BIT(hwirq);
 	dwapb_write(gpio, GPIO_INTMASK, val);
 	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 }
@@ -364,8 +369,23 @@ static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
 
 	return 0;
 }
+#else
+#define dwapb_irq_set_wake	NULL
 #endif
 
+static const struct irq_chip dwapb_irq_chip = {
+	.name		= DWAPB_DRIVER_NAME,
+	.irq_ack	= dwapb_irq_ack,
+	.irq_mask	= dwapb_irq_mask,
+	.irq_unmask	= dwapb_irq_unmask,
+	.irq_set_type	= dwapb_irq_set_type,
+	.irq_enable	= dwapb_irq_enable,
+	.irq_disable	= dwapb_irq_disable,
+	.irq_set_wake	= dwapb_irq_set_wake,
+	.flags		= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int dwapb_gpio_set_debounce(struct gpio_chip *gc,
 				   unsigned offset, unsigned debounce)
 {
@@ -439,16 +459,6 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 	girq->default_type = IRQ_TYPE_NONE;
 
 	port->pirq = pirq;
-	pirq->irqchip.name = DWAPB_DRIVER_NAME;
-	pirq->irqchip.irq_ack = dwapb_irq_ack;
-	pirq->irqchip.irq_mask = dwapb_irq_mask;
-	pirq->irqchip.irq_unmask = dwapb_irq_unmask;
-	pirq->irqchip.irq_set_type = dwapb_irq_set_type;
-	pirq->irqchip.irq_enable = dwapb_irq_enable;
-	pirq->irqchip.irq_disable = dwapb_irq_disable;
-#ifdef CONFIG_PM_SLEEP
-	pirq->irqchip.irq_set_wake = dwapb_irq_set_wake;
-#endif
 
 	/*
 	 * Intel ACPI-based platforms mostly have the DesignWare APB GPIO
@@ -475,7 +485,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 		girq->parent_handler = dwapb_irq_handler;
 	}
 
-	girq->chip = &pirq->irqchip;
+	gpio_irq_chip_set_chip(girq, &dwapb_irq_chip);
 
 	return;
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
