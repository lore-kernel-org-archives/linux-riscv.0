Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D40C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 18 May 2022 14:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kccg2OU8om133b+TUIZ+en7IXYAU4Tl2arN0B78B8GU=; b=qxN3LqpvOmryma
	AE0ZCwpeXJ5F34zxEKlfuozYbVUActKvDCH0XjdTSpEIjkifHvgK9M4SQ+tcJs92vUj1AOCRHRxnj
	VLr8XseL9cE8j5JaBMoi5u9pSb6kgko13VJNjuKAt4YLMCGvk9OrMoO772BFAvnjmIakkEXXfwfdU
	hv4SettFhR0WdOa/Cs5sSD7U/2LkBDycNU+a285JGKkmhQedK407tIYfZtWefI1uscQj+t5SaQwT3
	ICH2Ot9RQRwSbrKHwGqK8P3EQGgdhvLRtsz1YU8GPgtP66qga4g8envh7quu6ef/gInz4SErKLL6N
	EEf7kZ1kzxHDR0WQDt4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrKqC-002ZHx-4j; Wed, 18 May 2022 14:39:56 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrKq9-002ZGv-4j
 for linux-riscv@lists.infradead.org; Wed, 18 May 2022 14:39:54 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:1425:89ca:2e9e:5fc1])
 by xavier.telenet-ops.be with bizsmtp
 id YEfl2700H10zdRX01EflEG; Wed, 18 May 2022 16:39:46 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nrKq1-000qvo-7f; Wed, 18 May 2022 16:39:45 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nrKq0-00BtH0-NK; Wed, 18 May 2022 16:39:44 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Hoan Tran <hoan@os.amperecomputing.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Damien Le Moal <damien.lemoal@wdc.com>, Marc Zyngier <maz@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: dwapb: Make the irqchip immutable
Date: Wed, 18 May 2022 16:39:42 +0200
Message-Id: <e6380b316db23ee03a9adbf0a7d1ad83538f9961.1652884676.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_073953_360759_A815F3D2 
X-CRM114-Status: GOOD (  12.45  )
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
Against linux-next.
Boot-tested on SiPEED MAiXBiT (Canaan K210).
---
 drivers/gpio/gpio-dwapb.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 7130195da48d75dd..29b9395548151992 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -95,7 +95,6 @@ struct dwapb_context {
 #endif
 
 struct dwapb_gpio_port_irqchip {
-	struct irq_chip		irqchip;
 	unsigned int		nr_irqs;
 	unsigned int		irq[DWAPB_MAX_GPIOS];
 };
@@ -259,6 +258,8 @@ static void dwapb_irq_mask(struct irq_data *d)
 	val = dwapb_read(gpio, GPIO_INTMASK) | BIT(irqd_to_hwirq(d));
 	dwapb_write(gpio, GPIO_INTMASK, val);
 	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+
+	gpiochip_disable_irq(gc, d->hwirq);
 }
 
 static void dwapb_irq_unmask(struct irq_data *d)
@@ -268,6 +269,8 @@ static void dwapb_irq_unmask(struct irq_data *d)
 	unsigned long flags;
 	u32 val;
 
+	gpiochip_enable_irq(gc, d->hwirq);
+
 	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
 	val = dwapb_read(gpio, GPIO_INTMASK) & ~BIT(irqd_to_hwirq(d));
 	dwapb_write(gpio, GPIO_INTMASK, val);
@@ -364,8 +367,23 @@ static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
 
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
@@ -439,16 +457,6 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
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
@@ -475,7 +483,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
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
