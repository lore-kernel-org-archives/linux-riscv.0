Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9D2C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 18 May 2022 14:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EVccSFCKpPPqTAp6EwbKILw7xATIEcfEkT8GSe7THE4=; b=YJbC9KwCQkS3nY
	v+0LOZDtBMwUEpdWQGYcOxeIPG4u1i+O11OYAzUPCm6oGdOW7yABFFX1jn1GozjjoLMx0GBRkJNAX
	VQseSWMJIIBiBXNR+Q1KZ8oaG1YCtetBEVn7jFeyMksGTF52E1FeEIIB99E3wKR3cus7Iub5mLPeP
	1Xo9i0pLkGYqgN0Q003kWaKhRysYhSFbvvN6hfVOf5p3r5t+T/vZTNr0DqgQYkTwqRmyZRG68C4Ho
	tDabdE6z3rtVNSLtjpJM2I3UUUpjsqAmQCFgIyaCggFbrI347CJ6ukmpHj8ehV9PMs1m1oMAS/IMW
	vnJJQ0RsNp0+dXYRCu8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrKrz-002Zlx-FG; Wed, 18 May 2022 14:41:47 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrKrw-002ZT9-RJ
 for linux-riscv@lists.infradead.org; Wed, 18 May 2022 14:41:46 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:1425:89ca:2e9e:5fc1])
 by andre.telenet-ops.be with bizsmtp
 id YEhk2700110zdRX01EhkZc; Wed, 18 May 2022 16:41:44 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nrKrv-000qwT-Gh; Wed, 18 May 2022 16:41:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nrKrv-00BtLm-3X; Wed, 18 May 2022 16:41:43 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Emil Renner Berthing <kernel@esmil.dk>,
 Linus Walleij <linus.walleij@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: starfive: Make the irqchip immutable
Date: Wed, 18 May 2022 16:41:42 +0200
Message-Id: <5eb66be34356afd5eb0ea9027329e0939d03d3a0.1652884852.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_074145_045039_4B42DF2C 
X-CRM114-Status: GOOD (  12.11  )
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
now observed for the starfive driver:

    gpio gpiochip0: (11910000.pinctrl): not an immutable chip, please consider fixing it!

Fix this by making the irqchip in the starfive driver immutable.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Against linux-next.
Boot-tested on BeagleV Starlight Beta.
---
 drivers/pinctrl/pinctrl-starfive.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-starfive.c b/drivers/pinctrl/pinctrl-starfive.c
index f2b7d002ccb17900..f82a72f8016f59cc 100644
--- a/drivers/pinctrl/pinctrl-starfive.c
+++ b/drivers/pinctrl/pinctrl-starfive.c
@@ -1078,6 +1078,8 @@ static void starfive_irq_mask(struct irq_data *d)
 	value = readl_relaxed(ie) & ~mask;
 	writel_relaxed(value, ie);
 	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+
+	gpiochip_disable_irq(&sfp->gc, d->hwirq);
 }
 
 static void starfive_irq_mask_ack(struct irq_data *d)
@@ -1106,6 +1108,8 @@ static void starfive_irq_unmask(struct irq_data *d)
 	unsigned long flags;
 	u32 value;
 
+	gpiochip_enable_irq(&sfp->gc, d->hwirq);
+
 	raw_spin_lock_irqsave(&sfp->lock, flags);
 	value = readl_relaxed(ie) | mask;
 	writel_relaxed(value, ie);
@@ -1167,14 +1171,15 @@ static int starfive_irq_set_type(struct irq_data *d, unsigned int trigger)
 	return 0;
 }
 
-static struct irq_chip starfive_irq_chip = {
+static const struct irq_chip starfive_irq_chip = {
 	.name = "StarFive GPIO",
 	.irq_ack = starfive_irq_ack,
 	.irq_mask = starfive_irq_mask,
 	.irq_mask_ack = starfive_irq_mask_ack,
 	.irq_unmask = starfive_irq_unmask,
 	.irq_set_type = starfive_irq_set_type,
-	.flags = IRQCHIP_SET_TYPE_MASKED,
+	.flags = IRQCHIP_IMMUTABLE | IRQCHIP_SET_TYPE_MASKED,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static void starfive_gpio_irq_handler(struct irq_desc *desc)
@@ -1374,7 +1379,7 @@ static int starfive_probe(struct platform_device *pdev)
 	sfp->gc.base = -1;
 	sfp->gc.ngpio = NR_GPIOS;
 
-	sfp->gc.irq.chip = &starfive_irq_chip;
+	gpio_irq_chip_set_chip(&sfp->gc.irq, &starfive_irq_chip);
 	sfp->gc.irq.parent_handler = starfive_gpio_irq_handler;
 	sfp->gc.irq.num_parents = 1;
 	sfp->gc.irq.parents = devm_kcalloc(dev, sfp->gc.irq.num_parents,
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
