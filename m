Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6464CC43334
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Jun 2022 00:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KNYof7Jz4Pr05WD8mXDud/LG5Jt74RPdTZgBzmWkYqw=; b=2PIU1xjCd3mksb
	rwpkHStqqXV3zYLGqze44jMLMsUB0u95+GMZfgDyXx+lLKkgucxW9rKZvNp/RGGhcRegv+vezVMpo
	BgIIclnKhrp9t1B0vf/SO4cbHS+vMua9GTy67ntSDmrNSYb8oIWMKDiYbSnt6zOfiH7TdKByzMH8d
	iPMKLqqV2BiR6rP6H9Rib9/VCqLbu15XEcJgKQ9EZyz3y8vLvkmPxbrzmWzqwNk4v7b5SLsTE7XZJ
	Kr3PDMAFKsS301ep1kw97XIW5orjwc8PYSwiljfWVDsllsgG6pcKKL0XnrfPddgemOxXF6XIShojt
	tc1p1IkRpOIJnRniTJiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5GO3-008jdM-Pb; Sun, 26 Jun 2022 00:44:27 +0000
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5GO0-008jcN-Ts
	for linux-riscv@lists.infradead.org; Sun, 26 Jun 2022 00:44:26 +0000
X-IronPort-AV: E=Sophos;i="5.92,222,1650898800"; 
   d="scan'208";a="125658112"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Jun 2022 09:44:24 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id CBA9A40078B9;
	Sun, 26 Jun 2022 09:44:19 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/2] irqchip/sifive-plic: Add support for Renesas RZ/Five SoC
Date: Sun, 26 Jun 2022 01:43:26 +0100
Message-Id: <20220626004326.8548-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220626004326.8548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220626004326.8548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220625_174425_116467_F93A727D 
X-CRM114-Status: GOOD (  24.55  )
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
v1->v2:
* Implemented IRQ flow as suggested by Marc

RFC-->v1:
* Fixed review comments pointed by Geert
* Dropped handle_fasteoi_ack_irq support as for the PLIC we need to
claim the interrupt by reading the register and then acknowledge it.
* Add a new chained handler for RZ/Five SoC.
---
 drivers/irqchip/Kconfig           |  1 +
 drivers/irqchip/irq-sifive-plic.c | 73 ++++++++++++++++++++++++++++++-
 2 files changed, 72 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 4ab1038b5482..0245dcabe3e9 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -530,6 +530,7 @@ config SIFIVE_PLIC
 	bool "SiFive Platform-Level Interrupt Controller"
 	depends on RISCV
 	select IRQ_DOMAIN_HIERARCHY
+	select IRQ_FASTEOI_HIERARCHY_HANDLERS
 	help
 	   This enables support for the PLIC chip found in SiFive (and
 	   potentially other) RISC-V systems.  The PLIC controls devices
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index bb87e4c3b88e..9fb9f62afb6a 100644
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
@@ -81,6 +84,8 @@ static int plic_parent_irq __ro_after_init;
 static bool plic_cpuhp_setup_done __ro_after_init;
 static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
 
+static int plic_irq_set_type(struct irq_data *d, unsigned int type);
+
 static void __plic_toggle(void __iomem *enable_base, int hwirq, int enable)
 {
 	u32 __iomem *reg = enable_base + (hwirq / 32) * sizeof(u32);
@@ -176,16 +181,61 @@ static void plic_irq_eoi(struct irq_data *d)
 	}
 }
 
+static void renesas_rzfive_plic_edge_irq_eoi(struct irq_data *data)
+{
+	/* We have nothing to do here */
+}
+
 static struct irq_chip plic_chip = {
 	.name		= "SiFive PLIC",
 	.irq_mask	= plic_irq_mask,
 	.irq_unmask	= plic_irq_unmask,
 	.irq_eoi	= plic_irq_eoi,
+	.irq_set_type	= plic_irq_set_type,
+#ifdef CONFIG_SMP
+	.irq_set_affinity = plic_set_affinity,
+#endif
+};
+
+static struct irq_chip renesas_rzfive_edge_plic_chip = {
+	.name		= "Renesas RZ/Five PLIC",
+	.irq_mask	= plic_irq_mask,
+	.irq_unmask	= plic_irq_unmask,
+	.irq_ack	= plic_irq_eoi,
+	.irq_eoi	= renesas_rzfive_plic_edge_irq_eoi,
+	.irq_set_type	= plic_irq_set_type,
 #ifdef CONFIG_SMP
 	.irq_set_affinity = plic_set_affinity,
 #endif
 };
 
+static int plic_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
+
+	if (handler->priv->of_data != RENESAS_R9A07G043_PLIC)
+		return 0;
+
+	switch (type) {
+	case IRQ_TYPE_LEVEL_HIGH:
+		irq_set_chip_handler_name_locked(d, &renesas_rzfive_edge_plic_chip,
+						 handle_fasteoi_ack_irq,
+						 "Edge");
+		break;
+
+	case IRQ_TYPE_EDGE_RISING:
+		irq_set_chip_handler_name_locked(d, &plic_chip,
+						 handle_fasteoi_irq,
+						 "Level");
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
 			      irq_hw_number_t hwirq)
 {
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
@@ -293,6 +356,11 @@ static int __init plic_init(struct device_node *node,
 	if (!priv)
 		return -ENOMEM;
 
+	if (of_device_is_compatible(node, "renesas,r9a07g043-plic")) {
+		priv->of_data = RENESAS_R9A07G043_PLIC;
+		plic_chip.name = "Renesas RZ/Five PLIC";
+	}
+
 	priv->regs = of_iomap(node, 0);
 	if (WARN_ON(!priv->regs)) {
 		error = -EIO;
@@ -411,5 +479,6 @@ static int __init plic_init(struct device_node *node,
 }
 
 IRQCHIP_DECLARE(sifive_plic, "sifive,plic-1.0.0", plic_init);
+IRQCHIP_DECLARE(renesas_r9a07g043_plic, "renesas,r9a07g043-plic", plic_init);
 IRQCHIP_DECLARE(riscv_plic0, "riscv,plic0", plic_init); /* for legacy systems */
 IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", plic_init); /* for firmware driver */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
