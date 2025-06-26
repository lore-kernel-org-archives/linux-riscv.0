Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5388C7EE30
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 15:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0oq1rHr+k98CD4L0pAbNLf3JFPqzlsayr7DwTvMxP2Y=; b=l9QYZnpUnWtg39
	8zblYoqFZkpEuuW4+S928Zhs75B49uHfJt40sJhQJmhWFqQ4GA+UpYLa/bVZ/fWAslC7gEkvdSf6r
	sXnhZfC++U9ltbUfp5w4ff46XtvgGXXNYe+Xm3Lv0Hb7d+P9iPzTCqMrXJ5BaU7LCuQi4aEEl09Dw
	4GhmOLNlCW/6l3Vml2lLusYTycSh88+O9asa+o/PYh7NefzIM80wca08bIJLQGlXf7tCiy/YhGxpd
	6e23iovgZIsDKaFduc8bkIXwdUNLeOGf8qhinAqGFNnC4W+095VLyvefdTlfMjaTRXI861vFpACrV
	swxBRyg59IXTAE743reQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUoje-0000000CATC-0thZ;
	Thu, 26 Jun 2025 15:41:58 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnuy-0000000BzzF-3rlm;
	Thu, 26 Jun 2025 14:49:38 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pKzcREMF/JSs7xXlqj/sW2W9jbHL2lsx1h1l0bkVD/k=;
	b=mknJkKZ3dsxzRYSiFcfJAu8ZW0SvTtRoiLXI+AItcOAmWaNPgnHkjQSUezF9K1TXydwAiY
	SperwGoSIVLi++KTIn3bMYSZ2lOnCiBj0Ts3LIrZs2tKAiv+UFGDjfzbYQd1FyQ69rKg0N
	K0cxzDk8398RDbeMhu1rFKyUt3eBaXaI6sP6ghQjlbMq0OYu2KR5U9U86ZXStAKt068mjY
	W7MhZ3WIaBMp8pq7UWxlS/lcdV6R60bVqg4IQIl2WbC790qDBWAAO2F+thAsz8Ui88ZydK
	xALxRwiZe5MoA68JoVqyhBrwozvsxggJsWbA30nfBR4Gqo+9JkGxB3liXIediQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pKzcREMF/JSs7xXlqj/sW2W9jbHL2lsx1h1l0bkVD/k=;
	b=zh/sN6K5PYvw9e+ovearVI0kjX5nowPlZtz10Zu4nVjSVwP16igkDrKBXczXR3H3H4b0LD
	Yo36rnD4pBvjeiAA==
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Antoine Tenart <atenart@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 07/12] irqchip/alpine-msi: Clean up whitespace style
Date: Thu, 26 Jun 2025 16:49:04 +0200
Message-Id: <3bbf719fcd974b0f52a832552b986116bdc70203.1750860131.git.namcao@linutronix.de>
In-Reply-To: <cover.1750860131.git.namcao@linutronix.de>
References: <cover.1750860131.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_074937_122491_E1A19371 
X-CRM114-Status: GOOD (  11.35  )
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

From: Thomas Gleixner <tglx@linutronix.de>

Tidy up the code style. Whitespace changes only.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
Cc: Antoine Tenart <atenart@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/irqchip/irq-alpine-msi.c | 37 +++++++++++---------------------
 1 file changed, 13 insertions(+), 24 deletions(-)

diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-msi.c
index a5289dc26dca0..7e379a6985a6a 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -29,11 +29,11 @@
 #define ALPINE_MSIX_SPI_TARGET_CLUSTER0		BIT(16)
 
 struct alpine_msix_data {
-	spinlock_t msi_map_lock;
-	phys_addr_t addr;
-	u32 spi_first;		/* The SGI number that MSIs start */
-	u32 num_spis;		/* The number of SGIs for MSIs */
-	unsigned long *msi_map;
+	spinlock_t	msi_map_lock;
+	phys_addr_t	addr;
+	u32		spi_first;	/* The SGI number that MSIs start */
+	u32		num_spis;	/* The number of SGIs for MSIs */
+	unsigned long	*msi_map;
 };
 
 static void alpine_msix_mask_msi_irq(struct irq_data *d)
@@ -76,8 +76,7 @@ static int alpine_msix_allocate_sgi(struct alpine_msix_data *priv, int num_req)
 	return priv->spi_first + first;
 }
 
-static void alpine_msix_free_sgi(struct alpine_msix_data *priv, unsigned sgi,
-				 int num_req)
+static void alpine_msix_free_sgi(struct alpine_msix_data *priv, unsigned int sgi, int num_req)
 {
 	int first = sgi - priv->spi_first;
 
@@ -88,14 +87,12 @@ static void alpine_msix_free_sgi(struct alpine_msix_data *priv, unsigned sgi,
 	spin_unlock(&priv->msi_map_lock);
 }
 
-static void alpine_msix_compose_msi_msg(struct irq_data *data,
-					struct msi_msg *msg)
+static void alpine_msix_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 {
 	struct alpine_msix_data *priv = irq_data_get_irq_chip_data(data);
 	phys_addr_t msg_addr = priv->addr;
 
 	msg_addr |= (data->hwirq << 3);
-
 	msg->address_hi = upper_32_bits(msg_addr);
 	msg->address_lo = lower_32_bits(msg_addr);
 	msg->data = 0;
@@ -116,8 +113,7 @@ static struct irq_chip middle_irq_chip = {
 	.irq_compose_msi_msg	= alpine_msix_compose_msi_msg,
 };
 
-static int alpine_msix_gic_domain_alloc(struct irq_domain *domain,
-					unsigned int virq, int sgi)
+static int alpine_msix_gic_domain_alloc(struct irq_domain *domain, unsigned int virq, int sgi)
 {
 	struct irq_fwspec fwspec;
 	struct irq_data *d;
@@ -138,12 +134,10 @@ static int alpine_msix_gic_domain_alloc(struct irq_domain *domain,
 
 	d = irq_domain_get_irq_data(domain->parent, virq);
 	d->chip->irq_set_type(d, IRQ_TYPE_EDGE_RISING);
-
 	return 0;
 }
 
-static int alpine_msix_middle_domain_alloc(struct irq_domain *domain,
-					   unsigned int virq,
+static int alpine_msix_middle_domain_alloc(struct irq_domain *domain, unsigned int virq,
 					   unsigned int nr_irqs, void *args)
 {
 	struct alpine_msix_data *priv = domain->host_data;
@@ -161,7 +155,6 @@ static int alpine_msix_middle_domain_alloc(struct irq_domain *domain,
 		irq_domain_set_hwirq_and_chip(domain, virq + i, sgi + i,
 					      &middle_irq_chip, priv);
 	}
-
 	return 0;
 
 err_sgi:
@@ -170,8 +163,7 @@ static int alpine_msix_middle_domain_alloc(struct irq_domain *domain,
 	return err;
 }
 
-static void alpine_msix_middle_domain_free(struct irq_domain *domain,
-					   unsigned int virq,
+static void alpine_msix_middle_domain_free(struct irq_domain *domain, unsigned int virq,
 					   unsigned int nr_irqs)
 {
 	struct irq_data *d = irq_domain_get_irq_data(domain, virq);
@@ -186,8 +178,7 @@ static const struct irq_domain_ops alpine_msix_middle_domain_ops = {
 	.free	= alpine_msix_middle_domain_free,
 };
 
-static int alpine_msix_init_domains(struct alpine_msix_data *priv,
-				    struct device_node *node)
+static int alpine_msix_init_domains(struct alpine_msix_data *priv, struct device_node *node)
 {
 	struct irq_domain *middle_domain, *msi_domain, *gic_domain;
 	struct device_node *gic_node;
@@ -224,8 +215,7 @@ static int alpine_msix_init_domains(struct alpine_msix_data *priv,
 	return 0;
 }
 
-static int alpine_msix_init(struct device_node *node,
-			    struct device_node *parent)
+static int alpine_msix_init(struct device_node *node, struct device_node *parent)
 {
 	struct alpine_msix_data *priv;
 	struct resource res;
@@ -271,8 +261,7 @@ static int alpine_msix_init(struct device_node *node,
 		goto err_priv;
 	}
 
-	pr_debug("Registering %d msixs, starting at %d\n",
-		 priv->num_spis, priv->spi_first);
+	pr_debug("Registering %d msixs, starting at %d\n", priv->num_spis, priv->spi_first);
 
 	ret = alpine_msix_init_domains(priv, node);
 	if (ret)
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
