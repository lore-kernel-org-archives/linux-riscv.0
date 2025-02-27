Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6F6C19F2E
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 11:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XfNSNHbGXqetE/7jtYaYpDnWwfapWCQZY8Inbc1pyUc=; b=1F/7ESngkgBMbb
	jaCap/cW4UazLddC8yooF5MbR8e6aRVVi/T5ws1xqjpjbloSi1Lx0bpaC5JT9NHRFv3fcYEWbOgDn
	R9IN3aGZAp5nhYu9jKxAnpjtMK6KNIJNtb/lEww0abwoYbpsMtaNdsV/TPGlBve0CNrEgQae842qg
	6w9gS/7hPdHpw4JDJqi2R+BCXqvIlgrBFuA7ETkQOCBbc9jeo1BWtULf2KtfCLJwle2LVJZerkJGV
	YoQym3ba8ZDhFnVcdzwU8SeYvnvlCDNaaYUqnnfMTm9lrNtYekkp4RlL4MbQ8y2Y0K5qXCF/gdhVN
	Ki6TzS6Ip5zK/BMgxy1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tncYD-00000007GW6-0Kgg;
	Thu, 27 Feb 2025 11:59:37 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnc1A-00000007Ahq-0H4f
	for linux-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 11:25:29 +0000
Received: from [127.0.0.1] (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 81837342F9D;
	Thu, 27 Feb 2025 11:25:24 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 27 Feb 2025 19:25:00 +0800
Subject: [PATCH 2/2] gpiolib: support parsing gpio three-cell interrupts
 scheme
MIME-Version: 1.0
Message-Id: <20250227-04-gpio-irq-threecell-v1-2-4ae4d91baadc@gentoo.org>
References: <20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org>
In-Reply-To: <20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2230; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=j7nHUzto93z73Q7u7ZCwyv8zWNN+EcOL4GbzznozJ+U=;
 b=kA0DAAoBMarqR1lNu+0ByyZiAGfAS5mjWqgeHWp74kYrpGfOkx1UWzxnhzUJ32O/8am22gACI
 IkCkwQAAQoAfRYhBLW6uMnDG3EVZwIj3DGq6kdZTbvtBQJnwEuZXxSAAAAAAC4AKGlzc3Vlci1m
 cHJAbm90YXRpb25zLm9wZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRCNUJBQjhDOUMzMUI3MTE1Njc
 wMjIzREMzMUFBRUE0NzU5NERCQkVEAAoJEDGq6kdZTbvtAGMP/0yF9p4tvy3tTDxo8yhscZV6NF
 ei6syJ8xbHplIjOUpTHMujkO/FchhlK9QYfbOMbZosfd7GkhHfNRIU74r6PseRiC7c+B4fZ1jlR
 V52ZnrV/2jmwLfnXEEVCxvl+WHURlFvuzEzvQbSQ3zR/tXSI9qcz/i0r0OP4MX6ckce3gFRjWtS
 VfibLgzxmrl5kOgMa6Km+BUEdY5uLg/NzR12kd4F1IoMqsTUqmglsJbb45TvBNF0+o6jrILKe6q
 8QMFEQyyegzs2s4QDZQfQzlYqvHEiPiZ3H9lFjeU1HrpYIUc7p3i/LyMyeBMNxIh86pZiXibEUM
 JN8OsTacDNLY4+AK5PleMY5x4mnOFqVzROXP89qhU6qrWR1fbmE/95H3lZ9T83PdcoSVPRfATXf
 Pp5p2V8u6BPq8GlkIO83m1CRyzB+Q5YJH4Zthh1Qbfm+npG2BpnLR8Z0UpHsZ2dO4aLPcTfQ5XI
 dvxX9nEa0Yh7smVWkWJ8f/P60eSCOgmujNS7wEtkOQBKIR7PQ9moLXYdVRN3g5avbownOei5IQi
 ahu9EuA5XPZXlEBF1IQ9xjBz6xpi30pfSQb+V+3Wd7ML/iM8g4+0c4khZ0s/92TZcLTiATEf1W9
 vym3tOploadUasjB3tR6IFEW+Kk5GiEx+atnh3dvoSXTrgI+UJedv6cbZH
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_032528_129561_EE321906 
X-CRM114-Status: GOOD (  14.87  )
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

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
The select() function will be called with !DOMAIN_BUS_ANY,
kernel/irq/irqdomain.c:556: if (h->ops->select && bus_token != DOMAIN_BUS_ANY)

so vendor gpio driver need to explicitly set bus_token, something like:

drivers/gpio/gpio-spacemit-k1.c
  irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);

I hope this is a feasible way..
---
 drivers/gpio/gpiolib.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 679ed764cb143c4b3357106de1570e8d38441372..7912ae1d049d7c2574400c6ff53405d130521773 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1450,9 +1450,8 @@ static int gpiochip_hierarchy_irq_domain_translate(struct irq_domain *d,
 						   unsigned int *type)
 {
 	/* We support standard DT translation */
-	if (is_of_node(fwspec->fwnode) && fwspec->param_count == 2) {
+	if (is_of_node(fwspec->fwnode) && fwspec->param_count <= 3)
 		return irq_domain_translate_twocell(d, fwspec, hwirq, type);
-	}
 
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
+	if ((gc->of_gpio_n_cells == 3) && gc->of_node_instance_match)
+		return gc->of_node_instance_match(gc, index);
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
