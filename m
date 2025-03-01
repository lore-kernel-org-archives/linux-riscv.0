Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C00C282C6
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Mar 2025 23:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+qHDqWsVcaoC2gw7Hg1gDZh0K4a6VCmkaVdBss7WfxI=; b=eCY65QOwxVRgrh
	jKdxR5E0WG403UITCCS/vdHwvh+plYNoKToQTUTc3r9lhxCFqu2CxePQUECzNz6Ufs0jPenPMhaHU
	wEIuI3c6USAq1aIszy7GVGilqwGEBvpPo7w13sTxaBjx4fwTjE2zhrYCXjprpao9sGAUCfXY5lXsT
	OxyqSLF0egp8OfIjILer8/ZK0WkSDXcKomZ43KpdjYDbzGecxD4kveyjujnJVE/eO2fWsCtH4Q9le
	mKB3o0FJJ72937inX5WXZQsQyNouIk1oPW/hBYZLyJMZ7DypzckBwempm80h3yRQrp71PDBcuywYb
	6HTay7AuYpeKMb36hCXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toW41-0000000F42q-2NR7;
	Sat, 01 Mar 2025 23:16:09 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toW3y-0000000F41u-1Bp5
	for linux-riscv@lists.infradead.org;
	Sat, 01 Mar 2025 23:16:07 +0000
Received: from [127.0.0.1] (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C1FB5342FE4;
	Sat, 01 Mar 2025 23:16:02 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sun, 02 Mar 2025 07:15:33 +0800
Subject: [PATCH v2 2/2] gpiolib: support parsing gpio three-cell interrupts
 scheme
MIME-Version: 1.0
Message-Id: <20250302-04-gpio-irq-threecell-v2-2-34f13ad37ea4@gentoo.org>
References: <20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org>
In-Reply-To: <20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3986; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=hyZqVR03EhL39rF1NmzjFOxT29nNBXH9JZ/Nl44J5dw=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnw5UoVznx9yFnmZyWsDdwM23YTeLoSM+HCHRLH
 aCSZ0EAzPmJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ8OVKF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277Vh6D/9xRzzWCqG8JpGYAy
 2gMH3Q7ngDnqrpP94VNrrDdpnt3L5R4rhZNqlBMB1dYBaWJGOIEkcPs6Ir1k3/gL8QW31FIEqJ5
 BsHHyd2WA6QSWrIJEfcSCwDaWSsoA8dze2ZxB6Zf590wmqB7M8cCSFqfSW83pTlWxuwpcQrinq7
 geY5osBXav0wsfHBlIHVtk2qVRhE7gZShF6xfyrjSpSCylAKz41ogpgUdyUpk21SMlhGiSqy4Pd
 gaIlasnEh3N6f2tBZnM9r/Djtq8ll/iNA4bLnF0g5ePX2+NSmz8QrAXHdBpekyqePKiezLxQRq1
 r9ASGYDj0PWX20lLupaEFCr08HCgNQWZ4ssuyhDyTOazJjqUNH/PgNrp5pxdXqBki+GktRZw2aY
 AWRTq8MC/nvWoO357TfIRqjy+pDp8veDR/etuppG25uQcWnpWCzZPCtCMsgTrWiM9NMNPFPqJTc
 09s/vd5TY/BgQKoEt11JeoDNbvfH6NehyfHOUjCinPlS0BJRnzxbFtoHJYo3Lkh9VUmXwh23JSf
 bndbvh1MSR8Ol/ZxTs/IIhtVleIrQWrhGanXjr2aVrjVrNzXCGTnX6jegzC2i/RoeTFAOWoneKb
 nnsKOgy1+9BVBF9Z8d9JDEYWhMDTKkZoeAt0pAmd74oy01quE3Z3qzFgz4KZt646qsGg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_151606_417248_BB05FE70 
X-CRM114-Status: GOOD (  16.58  )
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

gpio irq which using three-cell scheme should always call
instance_match() function to find the correct irqdomain.

The select() function will be called with !DOMAIN_BUS_ANY,
so for specific gpio irq driver, it need to set bus token
explicitly, something like:
  irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/gpio/gpiolib-of.c |  8 ++++++++
 drivers/gpio/gpiolib-of.h |  6 ++++++
 drivers/gpio/gpiolib.c    | 23 +++++++++++++++++++----
 3 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 2e537ee979f3e2b6e8d5f86f3e121a66f2a8e083..e19904569fb1b71c1fff237132d17050ef02b074 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -1187,3 +1187,11 @@ void of_gpiochip_remove(struct gpio_chip *chip)
 {
 	of_node_put(dev_of_node(&chip->gpiodev->dev));
 }
+
+bool of_gpiochip_instance_match(struct gpio_chip *gc, unsigned int index)
+{
+	if (gc->of_node_instance_match)
+		return gc->of_node_instance_match(gc, index);
+
+	return false;
+}
diff --git a/drivers/gpio/gpiolib-of.h b/drivers/gpio/gpiolib-of.h
index 16d6ac8cb156c02232ea868b755bbdc46c78e3c7..3eebfac290c571e3b90e4437295db8eaacb021a3 100644
--- a/drivers/gpio/gpiolib-of.h
+++ b/drivers/gpio/gpiolib-of.h
@@ -22,6 +22,7 @@ struct gpio_desc *of_find_gpio(struct device_node *np,
 			       unsigned long *lookupflags);
 int of_gpiochip_add(struct gpio_chip *gc);
 void of_gpiochip_remove(struct gpio_chip *gc);
+bool of_gpiochip_instance_match(struct gpio_chip *gc, unsigned int index);
 int of_gpio_count(const struct fwnode_handle *fwnode, const char *con_id);
 #else
 static inline struct gpio_desc *of_find_gpio(struct device_node *np,
@@ -33,6 +34,11 @@ static inline struct gpio_desc *of_find_gpio(struct device_node *np,
 }
 static inline int of_gpiochip_add(struct gpio_chip *gc) { return 0; }
 static inline void of_gpiochip_remove(struct gpio_chip *gc) { }
+static inline bool of_gpiochip_instance_match(struct gpio_chip *gc,
+					      unsigned int index)
+{
+	return false;
+}
 static inline int of_gpio_count(const struct fwnode_handle *fwnode,
 				const char *con_id)
 {
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 679ed764cb143c4b3357106de1570e8d38441372..266be465b9103c17861a0d76f2dfbf1f1de3a073 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1449,10 +1449,9 @@ static int gpiochip_hierarchy_irq_domain_translate(struct irq_domain *d,
 						   unsigned long *hwirq,
 						   unsigned int *type)
 {
-	/* We support standard DT translation */
-	if (is_of_node(fwspec->fwnode) && fwspec->param_count == 2) {
-		return irq_domain_translate_twocell(d, fwspec, hwirq, type);
-	}
+	/* We support standard DT translation up to three cells */
+	if (is_of_node(fwspec->fwnode))
+		return irq_domain_translate_cells(d, fwspec, hwirq, type);
 
 	/* This is for board files and others not using DT */
 	if (is_fwnode_irqchip(fwspec->fwnode)) {
@@ -1754,9 +1753,25 @@ static void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
 	irq_set_chip_data(irq, NULL);
 }
 
+static int gpiochip_irq_select(struct irq_domain *d, struct irq_fwspec *fwspec,
+			enum irq_domain_bus_token bus_token)
+{
+	struct fwnode_handle *fwnode = fwspec->fwnode;
+	struct gpio_chip *gc = d->host_data;
+	unsigned int index = fwspec->param[0];
+
+	if (fwspec->param_count == 3 && is_of_node(fwnode))
+		return of_gpiochip_instance_match(gc, index);
+
+	/* Fallback for twocells */
+	return ((fwnode != NULL) && (d->fwnode == fwnode) &&
+		(d->bus_token == bus_token));
+}
+
 static const struct irq_domain_ops gpiochip_domain_ops = {
 	.map	= gpiochip_irq_map,
 	.unmap	= gpiochip_irq_unmap,
+	.select	= gpiochip_irq_select,
 	/* Virtually all GPIO irqchips are twocell:ed */
 	.xlate	= irq_domain_xlate_twocell,
 };

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
