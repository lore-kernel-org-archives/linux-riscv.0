Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B49C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 18 May 2022 14:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NJBYprrwdart/c6Op/BR4rPnWa+SMEQfvl3oMyXike4=; b=q/ls8rxoHCwCSH
	bbeoGcD5SWTYcxCsvVJCYCe5qkMCiWHyR5LzIX2wkGYHvivRhJM2Y1AnAyX/MiSgfA7kHLYm46N8H
	OFEv6koWHAdDPMzIxWenQ702zBUPF6rsQbuqEnSfMu/18hlBuaeVIOd/LmcTurE6jYM/LOy7IxTFL
	JkvZUYlwsxF1A8M7HqUKCNFwa90RDZfh0D7wIbYARQXGThmnVBlzROB1X3mYmMsr2rknZSmsFWL2X
	74ok0UQt+rjjnVNkLgOjlsgM2/k0mwMDZJqMrKvh0+YBmo5m4E7I2fGaHRv1V4gY/N4JWBBwFowxn
	CCz8UJKuMjk2sSeWdTfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrKrC-002ZUo-1d; Wed, 18 May 2022 14:40:58 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrKr8-002ZT9-HY
 for linux-riscv@lists.infradead.org; Wed, 18 May 2022 14:40:56 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:1425:89ca:2e9e:5fc1])
 by andre.telenet-ops.be with bizsmtp
 id YEgp2700J10zdRX01Egp1A; Wed, 18 May 2022 16:40:49 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nrKr2-000qwB-Ou; Wed, 18 May 2022 16:40:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nrKr2-00BtJk-8G; Wed, 18 May 2022 16:40:48 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, Marc Zyngier <maz@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: sifive: Make the irqchip immutable
Date: Wed, 18 May 2022 16:40:46 +0200
Message-Id: <73c75a67d1c87b049d633057c0e765e708ee02a2.1652884788.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_074054_756625_D06436E8 
X-CRM114-Status: GOOD (  12.56  )
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
Against linux-next.
Boot-tested on SiPEED MAiXBiT (Canaan K210).
---
 drivers/gpio/gpio-sifive.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index 03b8c4de2e91e3c4..a48f62780e099040 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -79,6 +79,7 @@ static void sifive_gpio_irq_enable(struct irq_data *d)
 	u32 bit = BIT(offset);
 	unsigned long flags;
 
+	gpiochip_enable_irq(gc, d->hwirq);
 	irq_chip_enable_parent(d);
 
 	/* Switch to input */
@@ -106,6 +107,7 @@ static void sifive_gpio_irq_disable(struct irq_data *d)
 	assign_bit(offset, &chip->irq_state, 0);
 	sifive_gpio_set_ie(chip, offset);
 	irq_chip_disable_parent(d);
+	gpiochip_disable_irq(gc, d->hwirq);
 }
 
 static void sifive_gpio_irq_eoi(struct irq_data *d)
@@ -137,7 +139,7 @@ static int sifive_gpio_irq_set_affinity(struct irq_data *data,
 	return -EINVAL;
 }
 
-static struct irq_chip sifive_gpio_irqchip = {
+static const struct irq_chip sifive_gpio_irqchip = {
 	.name		= "sifive-gpio",
 	.irq_set_type	= sifive_gpio_irq_set_type,
 	.irq_mask	= irq_chip_mask_parent,
@@ -146,6 +148,8 @@ static struct irq_chip sifive_gpio_irqchip = {
 	.irq_disable	= sifive_gpio_irq_disable,
 	.irq_eoi	= sifive_gpio_irq_eoi,
 	.irq_set_affinity = sifive_gpio_irq_set_affinity,
+	.flags		= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int sifive_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
@@ -242,7 +246,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
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
