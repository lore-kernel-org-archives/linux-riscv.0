Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B874C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 24 May 2022 17:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wSET1pZSLjFV9mQAPeXVfb3hTOVcR7CZbGBYSXrQWAM=; b=GWEXnc/+7PwT1Q
	ixUzywr5DYdxozlYHtXy0Xb7jpB9jzN3psCF+NI8+0bHmKamAc30pyDjuIAq1W5mMNOalEr/vsB3V
	KIxmQSWkmzbpCafJ9yL8MCPQQREOuTR+Xj5DaNN6hcFcjaWnuv4t9FjUsX5hyMS8CLXuuuu0MQ8WV
	iQ+wTTrCZBVOVadJVpkBTNO8eUhv+ic9RapWP9M5OHZtUO4QODl6N2mKNeLJecWCbF4xFpA8uVKl5
	2VfPFqKs9mI7yAlUXOtxUBqt4Xc+GDKvAuEp5KSvYVAW8FVIaySaHWXbrX5Q0y+ns3CHhhY3P5V7A
	YGFKvNecrU45sVEEb7HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntYFE-008kpS-DJ; Tue, 24 May 2022 17:22:56 +0000
Received: from relmlor2.renesas.com ([210.160.252.172]
 helo=relmlie6.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntYFB-008knx-2i
 for linux-riscv@lists.infradead.org; Tue, 24 May 2022 17:22:54 +0000
X-IronPort-AV: E=Sophos;i="5.91,248,1647270000"; d="scan'208";a="122108004"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 25 May 2022 02:22:50 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 35404400A8AA;
 Wed, 25 May 2022 02:22:44 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RFC 2/2] irqchip/sifive-plic: Add support for Renesas RZ/Five
 SoC
Date: Tue, 24 May 2022 18:22:14 +0100
Message-Id: <20220524172214.5104-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220524172214.5104-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220524172214.5104-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_102253_276786_04DA5F12 
X-CRM114-Status: GOOD (  24.87  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The Renesas RZ/Five SoC has a RISC-V AX45MP AndesCore with NCEPLIC100. The
NCEPLIC100 supports both edge-triggered and level-triggered interrupts. In
case of edge-triggered interrupts NCEPLIC100 ignores the next interrupt
edge until the previous completion message has been received and
NCEPLIC100 doesn't support pending interrupt counter, hence losing the
interrupts if not acknowledged in time.

So the workaround for edge-triggered interrupts to be handled correctly
and without losing is that it needs to be acknowledged first and then
handler must be run so that we don't miss on the next edge-triggered
interrupt.

This patch adds a new compatible string for Renesas RZ/Five SoC and adds
support to change interrupt flow based on the interrupt type. It also
implements irq_ack and irq_set_type callbacks.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/irqchip/Kconfig           |  1 +
 drivers/irqchip/irq-sifive-plic.c | 71 ++++++++++++++++++++++++++++++-
 2 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index f3d071422f3b..aea0e4e7e547 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -537,6 +537,7 @@ config SIFIVE_PLIC
 	bool "SiFive Platform-Level Interrupt Controller"
 	depends on RISCV
 	select IRQ_DOMAIN_HIERARCHY
+	select IRQ_FASTEOI_HIERARCHY_HANDLERS
 	help
 	   This enables support for the PLIC chip found in SiFive (and
 	   potentially other) RISC-V systems.  The PLIC controls devices
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index bb87e4c3b88e..abffce48e69c 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -60,10 +60,13 @@
 #define	PLIC_DISABLE_THRESHOLD		0x7
 #define	PLIC_ENABLE_THRESHOLD		0
 
+#define RENESAS_R9A07G043_PLIC		1
+
 struct plic_priv {
 	struct cpumask lmask;
 	struct irq_domain *irqdomain;
 	void __iomem *regs;
+	u8 of_data;
 };
 
 struct plic_handler {
@@ -163,10 +166,31 @@ static int plic_set_affinity(struct irq_data *d,
 }
 #endif
 
+static void plic_irq_ack(struct irq_data *d)
+{
+	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
+
+	if (irqd_irq_masked(d)) {
+		plic_irq_unmask(d);
+		writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
+		plic_irq_mask(d);
+	} else {
+		writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
+	}
+}
+
 static void plic_irq_eoi(struct irq_data *d)
 {
 	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
 
+	/*
+	 * For Renesas R9A07G043 SoC if the interrupt type is EDGE
+	 * we have already acknowledged it in ack callback.
+	 */
+	if (handler->priv->of_data == RENESAS_R9A07G043_PLIC &&
+	    !irqd_is_level_type(d))
+		return;
+
 	if (irqd_irq_masked(d)) {
 		plic_irq_unmask(d);
 		writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
@@ -176,11 +200,37 @@ static void plic_irq_eoi(struct irq_data *d)
 	}
 }
 
+static int plic_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
+
+	if (handler->priv->of_data != RENESAS_R9A07G043_PLIC)
+		return 0;
+
+	switch (type) {
+	case IRQ_TYPE_LEVEL_HIGH:
+		irq_set_handler_locked(d, handle_fasteoi_irq);
+		break;
+
+	case IRQ_TYPE_EDGE_RISING:
+		irq_set_handler_locked(d, handle_fasteoi_ack_irq);
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static struct irq_chip plic_chip = {
 	.name		= "SiFive PLIC",
 	.irq_mask	= plic_irq_mask,
 	.irq_unmask	= plic_irq_unmask,
+	.irq_ack	= plic_irq_ack,
 	.irq_eoi	= plic_irq_eoi,
+	.irq_set_type	= plic_irq_set_type,
+
 #ifdef CONFIG_SMP
 	.irq_set_affinity = plic_set_affinity,
 #endif
@@ -198,6 +248,19 @@ static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
 	return 0;
 }
 
+static int plic_irq_domain_translate(struct irq_domain *d,
+				     struct irq_fwspec *fwspec,
+				     unsigned long *hwirq,
+				     unsigned int *type)
+{
+	struct plic_priv *priv = d->host_data;
+
+	if (priv->of_data == RENESAS_R9A07G043_PLIC)
+		return irq_domain_translate_twocell(d, fwspec, hwirq, type);
+
+	return irq_domain_translate_onecell(d, fwspec, hwirq, type);
+}
+
 static int plic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 				 unsigned int nr_irqs, void *arg)
 {
@@ -206,7 +269,7 @@ static int plic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 	unsigned int type;
 	struct irq_fwspec *fwspec = arg;
 
-	ret = irq_domain_translate_onecell(domain, fwspec, &hwirq, &type);
+	ret = plic_irq_domain_translate(domain, fwspec, &hwirq, &type);
 	if (ret)
 		return ret;
 
@@ -220,7 +283,7 @@ static int plic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 }
 
 static const struct irq_domain_ops plic_irqdomain_ops = {
-	.translate	= irq_domain_translate_onecell,
+	.translate	= plic_irq_domain_translate,
 	.alloc		= plic_irq_domain_alloc,
 	.free		= irq_domain_free_irqs_top,
 };
@@ -293,6 +356,9 @@ static int __init plic_init(struct device_node *node,
 	if (!priv)
 		return -ENOMEM;
 
+	if (of_device_is_compatible(node, "renesas-r9a07g043-plic"))
+		priv->of_data = RENESAS_R9A07G043_PLIC;
+
 	priv->regs = of_iomap(node, 0);
 	if (WARN_ON(!priv->regs)) {
 		error = -EIO;
@@ -411,5 +477,6 @@ static int __init plic_init(struct device_node *node,
 }
 
 IRQCHIP_DECLARE(sifive_plic, "sifive,plic-1.0.0", plic_init);
+IRQCHIP_DECLARE(renesas_r9a07g043_plic, "renesas-r9a07g043-plic", plic_init);
 IRQCHIP_DECLARE(riscv_plic0, "riscv,plic0", plic_init); /* for legacy systems */
 IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", plic_init); /* for firmware driver */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
