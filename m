Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89304C36008
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 22:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1gpiRQ4LoHCZNWo7g97l4gozqcBUUwMtv+W7N0N2csE=; b=CDc006hFyNKsrT
	fJ5+Br/mieckBb+0K+PHuVwi4Rh6F+UzsaXgcDlZ0nfSwl4ELZp8xX5LIWd9ljJJFcCH6xceef+qi
	tXHxmsf6jgMXaEeLTQGxrQsuf/MVG6U5B1pCa3YYkR3j5a4EKBJD0mivB/KFg8Y3SGkoE6rKRlnTy
	Mb1GYlVXNCWbOpLkwFmyB2auA1wFcAF/j3I43pP/8zhTm+EiAbsRZQEpS7Uy0/K48yiy37aYiF5MD
	0HB2ypYl2zek0f+e1uQOK97wj1xVJnv0uhgFXg6cNAViDMc0UdEh6zNVINfbUARDII6/pOvuLwop+
	yg2CBMWQUd3nH7djH0nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txCRI-000000078LR-3jXd;
	Tue, 25 Mar 2025 22:08:04 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txCRG-000000078Kl-0NkT
	for linux-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 22:08:03 +0000
Received: from [127.0.0.1] (unknown [116.232.48.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A41253433E3;
	Tue, 25 Mar 2025 22:07:58 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 26 Mar 2025 06:06:20 +0800
Subject: [PATCH v3 2/2] gpiolib: support parsing gpio three-cell interrupts
 scheme
MIME-Version: 1.0
Message-Id: <20250326-04-gpio-irq-threecell-v3-2-aab006ab0e00@gentoo.org>
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
In-Reply-To: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4016; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=6XcMNqeJ8eep/iU0w+JlcRRBRJJGw1Yh+Cs/jq0Nd2k=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBn4yk0AgqmRiWboZyz7EYEDeW5RDk0cbVXsk323
 72PtEDHltOJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ+MpNF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277XQTD/4ubq2QKcTlkAFLx0
 3u5LxCupZ/f1nbBiUDxY3RQ0bbfrFfe4Zs/ygBp8Dsl29IS8BE6hP2gWMWKusC2ipw2h0kDKBtf
 AKRp130ztq6a8tLF5jQVW1+gDbmRRbk+VFHHgSn2k6NUKAYkESFDPDCJkv6xMtyAz9001uISB9+
 wVLbRK3uCkc8ln4tpuEK5bXP5R93GkiGxbcGkjERQiMYXMUI7KKadGFhtZJTdqCc3FWJR3Dr4au
 fcwOuXEeUdjtQn0o8Zevjfxl/DzgnhSFxtnIDTGTYgND6QkkqbZ2J4WF75wGYjVKguz5MIC6qLz
 pHo+gcKbmxNHnhFd13soI6MR8/JOMxiwL+6+x/8g/IcpMcVilT7PBhsvgwmVR2MLX2P2tV6Q2Vf
 w/x5s4qKfg1/PD/CPJyRPDrTaFcMDI78Ef6Z8HD8lDFp/SlQsa4wqFKm5RUdm+UWS5cDESz2Xwz
 qWTz2RM2AuZ/+DgMFWK6ceIehsoNEz8ZD1ZPGHG3l21AtvNUryNPLzzn51paDnMb6iNE7XvIdVI
 dgZ4E/Y5sFioAJh2usJHYToYT1nINBdnhhVRSKCGqIy2/i+FIxXpIuLGzhQXPaCPkNIqJXNC0kC
 jx4gJcwTHcx6k+S5VfaNnMFkS2joNzg6wPrvZBI9doeE5OrFy25wAJifRm7vGh6+wqKQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_150802_165632_254A6CED 
X-CRM114-Status: GOOD (  16.49  )
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
 drivers/gpio/gpiolib.c    | 22 ++++++++++++++++++----
 3 files changed, 32 insertions(+), 4 deletions(-)

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
index 679ed764cb143c4b3357106de1570e8d38441372..0729d951ef1fb8431f80f98d09cfbb383c7dffab 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1450,9 +1450,8 @@ static int gpiochip_hierarchy_irq_domain_translate(struct irq_domain *d,
 						   unsigned int *type)
 {
 	/* We support standard DT translation */
-	if (is_of_node(fwspec->fwnode) && fwspec->param_count == 2) {
-		return irq_domain_translate_twocell(d, fwspec, hwirq, type);
-	}
+	if (is_of_node(fwspec->fwnode))
+		return irq_domain_translate_twothreecell(d, fwspec, hwirq, type);
 
 	/* This is for board files and others not using DT */
 	if (is_fwnode_irqchip(fwspec->fwnode)) {
@@ -1754,11 +1753,26 @@ static void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
 	irq_set_chip_data(irq, NULL);
 }
 
+static int gpiochip_irq_select(struct irq_domain *d, struct irq_fwspec *fwspec,
+			       enum irq_domain_bus_token bus_token)
+{
+	struct fwnode_handle *fwnode = fwspec->fwnode;
+	struct gpio_chip *gc = d->host_data;
+	unsigned int index = fwspec->param[0];
+
+	if (fwspec->param_count == 3 && is_of_node(fwnode))
+		return of_gpiochip_instance_match(gc, index);
+
+	/* Fallback for twocells */
+	return (fwnode && (d->fwnode == fwnode) && (d->bus_token == bus_token));
+}
+
 static const struct irq_domain_ops gpiochip_domain_ops = {
 	.map	= gpiochip_irq_map,
 	.unmap	= gpiochip_irq_unmap,
+	.select	= gpiochip_irq_select,
 	/* Virtually all GPIO irqchips are twocell:ed */
-	.xlate	= irq_domain_xlate_twocell,
+	.xlate	= irq_domain_xlate_twothreecell,
 };
 
 static struct irq_domain *gpiochip_simple_create_domain(struct gpio_chip *gc)

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
