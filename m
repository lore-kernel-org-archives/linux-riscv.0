Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7B8C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 16:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1bGNsUIEFeVF8Dy5XyVGBtrB48OcvIb30r0uq1cQqy4=; b=teMN6fdr6pE0tu
	5wGljK3gM6w6ooQ/TC2ss7bCS2nX9zOFybhdJyZ1r8JUSN9hINCag/4dRe1uHf4aK3E8+jFtKGJXY
	0wfhUXVhEM6IgDhLaJLflbg7b1RoGu3SoC6lLg9cYCRA5txoBbhzIZ3Ol9EoMp3Umew/XwZdvgE0V
	cGFgWTDhl2TVsMRnBq3uI/WfDUWqHWoQUUHHMdcPmPDUAQc/nSfrr6tsdCwDCdbhBRxhX7QrmhHNS
	1wE1chml8YdjhzfBR8dzis9QlHpaCZA7FXNdK0oashJHfiB/1rMSKel2F+NdGRPSVfMc52PWgb8lQ
	RZkDjQCWSqBleEUyCXlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p03OZ-00A55z-A5; Tue, 29 Nov 2022 16:23:43 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p03OV-00A4ws-4p
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 16:23:41 +0000
Received: from ramsan.of.borg ([84.195.186.194])
	by albert.telenet-ops.be with bizsmtp
	id qGPT2802r4C55Sk06GPTuz; Tue, 29 Nov 2022 17:23:28 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1p03OJ-0023Kq-56; Tue, 29 Nov 2022 17:23:27 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1p03OI-003Lee-OO; Tue, 29 Nov 2022 17:23:26 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: mpfs: Make the irqchip immutable
Date: Tue, 29 Nov 2022 17:23:22 +0100
Message-Id: <4ee1a396acc34871dbae73a5b032915f745795ec.1669738949.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_082339_417309_9279AFA7 
X-CRM114-Status: GOOD (  12.72  )
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
now observed for the gpio-mpfs driver:

    gpio gpiochip0: (20122000.gpio): not an immutable chip, please consider fixing it!

Fix this by making the irqchip in the gpio-mpfs driver immutable.

While at it, drop of the unneeded masking of the hwirq number, as it is
always smaller than the number of GPIOs/interrupts handled by the
controller.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not tested with interrupts, as there are no inputs described in the
Icicle DTS yet.
---
 drivers/gpio/gpio-mpfs.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
index 168be0b90cf8c656..fd294b581ae77369 100644
--- a/drivers/gpio/gpio-mpfs.c
+++ b/drivers/gpio/gpio-mpfs.c
@@ -168,8 +168,9 @@ static void mpfs_gpio_irq_unmask(struct irq_data *data)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
-	int gpio_index = irqd_to_hwirq(data) % MAX_NUM_GPIO;
+	int gpio_index = irqd_to_hwirq(data);
 
+	gpiochip_enable_irq(gc, gpio_index);
 	mpfs_gpio_direction_input(gc, gpio_index);
 	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
 	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index),
@@ -180,11 +181,12 @@ static void mpfs_gpio_irq_mask(struct irq_data *data)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
-	int gpio_index = irqd_to_hwirq(data) % MAX_NUM_GPIO;
+	int gpio_index = irqd_to_hwirq(data);
 
 	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
 	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index),
 			     MPFS_GPIO_EN_INT, 0);
+	gpiochip_disable_irq(gc, gpio_index);
 }
 
 static const struct irq_chip mpfs_gpio_irqchip = {
@@ -192,7 +194,8 @@ static const struct irq_chip mpfs_gpio_irqchip = {
 	.irq_set_type = mpfs_gpio_irq_set_type,
 	.irq_mask	= mpfs_gpio_irq_mask,
 	.irq_unmask	= mpfs_gpio_irq_unmask,
-	.flags = IRQCHIP_MASK_ON_SUSPEND,
+	.flags = IRQCHIP_IMMUTABLE | IRQCHIP_MASK_ON_SUSPEND,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static void mpfs_gpio_irq_handler(struct irq_desc *desc)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
