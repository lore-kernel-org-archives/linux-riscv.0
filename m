Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98A3C54EBE
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 09:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l4HakBd0LVDzQ6goo0fIKfQfbS6lGf5mxTjvlP318l0=; b=NWgy6n4dAVQMNZ
	k5oG9fW6dCAGXrBdyVWDx2sjjhI0mvhKCd+jAwxq+6YPjUT2QPlqhEbmHWaPFlKN8ugf1eULUSHNW
	kaJNC80boeX/wH9h4ahjSN2bVollEDwXX+BAggiNPoar+GMP42oWGTT3oAL3J89UisnN+4zc82CrP
	qA8BrytqMPgMa7onPQb22BkSG7Q9pVBeTf+38wsUmnLpTnPxVnnMJrCNpVDdo0wa8bcf2VcO8ZE6X
	HT2nYjM7hLidjHhYf+bJXv7b1iDYOZwdrTzp5+fGbP0a3vfD2gTsnNiB6Q8eaCcDE2pRfHDIQzO0K
	aah6S1hjBxR/3YBr7zpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGGax-001XSb-0A; Fri, 13 Jan 2023 09:43:31 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGGat-001XNI-A9
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 09:43:30 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 7F88D24DDB2;
	Fri, 13 Jan 2023 17:42:21 +0800 (CST)
Received: from EXMBX067.cuchost.com (172.16.6.67) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 13 Jan
 2023 17:42:19 +0800
Received: from ubuntu.localdomain (113.72.144.207) by EXMBX067.cuchost.com
 (172.16.6.67) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 13 Jan
 2023 17:42:18 +0800
From: Mason Huo <mason.huo@starfivetech.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
CC: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Mason
 Huo" <mason.huo@starfivetech.com>, Ley Foon Tan
	<leyfoon.tan@starfivetech.com>, Sia Jee Heng <jeeheng.sia@starfivetech.com>
Subject: [PATCH v1] irqchip/irq-sifive-plic: Add syscore callbacks for hibernation
Date: Fri, 13 Jan 2023 17:42:16 +0800
Message-ID: <20230113094216.116036-1-mason.huo@starfivetech.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Originating-IP: [113.72.144.207]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX067.cuchost.com
 (172.16.6.67)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_014327_707923_23AFC200 
X-CRM114-Status: GOOD (  18.61  )
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

The priority and enable registers of plic will be reset
during hibernation power cycle in poweroff mode,
add the syscore callbacks to save/restore those registers.

Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Reviewed-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
---
 drivers/irqchip/irq-sifive-plic.c | 93 ++++++++++++++++++++++++++++++-
 1 file changed, 91 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index ff47bd0dec45..80306de45d2b 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -17,6 +17,7 @@
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
+#include <linux/syscore_ops.h>
 #include <asm/smp.h>
 
 /*
@@ -67,6 +68,8 @@ struct plic_priv {
 	struct irq_domain *irqdomain;
 	void __iomem *regs;
 	unsigned long plic_quirks;
+	unsigned int nr_irqs;
+	u32 *priority_reg;
 };
 
 struct plic_handler {
@@ -79,10 +82,13 @@ struct plic_handler {
 	raw_spinlock_t		enable_lock;
 	void __iomem		*enable_base;
 	struct plic_priv	*priv;
+	/* To record interrupts that are enabled before suspend. */
+	u32 enable_reg[MAX_DEVICES / 32];
 };
 static int plic_parent_irq __ro_after_init;
 static bool plic_cpuhp_setup_done __ro_after_init;
 static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
+static struct plic_priv *priv_data;
 
 static int plic_irq_set_type(struct irq_data *d, unsigned int type);
 
@@ -229,6 +235,78 @@ static int plic_irq_set_type(struct irq_data *d, unsigned int type)
 	return IRQ_SET_MASK_OK;
 }
 
+static void plic_irq_resume(void)
+{
+	unsigned int i, cpu;
+	u32 __iomem *reg;
+
+	for (i = 0; i < priv_data->nr_irqs; i++)
+		writel(priv_data->priority_reg[i],
+				priv_data->regs + PRIORITY_BASE + i * PRIORITY_PER_ID);
+
+	for_each_cpu(cpu, cpu_present_mask) {
+		struct plic_handler *handler = per_cpu_ptr(&plic_handlers, cpu);
+
+		if (!handler->present)
+			continue;
+
+		for (i = 0; i < DIV_ROUND_UP(priv_data->nr_irqs, 32); i++) {
+			reg = handler->enable_base + i * sizeof(u32);
+			raw_spin_lock(&handler->enable_lock);
+			writel(handler->enable_reg[i], reg);
+			raw_spin_unlock(&handler->enable_lock);
+		}
+	}
+}
+
+static int plic_irq_suspend(void)
+{
+	unsigned int i, cpu;
+	u32 __iomem *reg;
+
+	for (i = 0; i < priv_data->nr_irqs; i++)
+		priv_data->priority_reg[i] =
+			readl(priv_data->regs + PRIORITY_BASE + i * PRIORITY_PER_ID);
+
+	for_each_cpu(cpu, cpu_present_mask) {
+		struct plic_handler *handler = per_cpu_ptr(&plic_handlers, cpu);
+
+		if (!handler->present)
+			continue;
+
+		for (i = 0; i < DIV_ROUND_UP(priv_data->nr_irqs, 32); i++) {
+			reg = handler->enable_base + i * sizeof(u32);
+			raw_spin_lock(&handler->enable_lock);
+			handler->enable_reg[i] = readl(reg);
+			raw_spin_unlock(&handler->enable_lock);
+		}
+	}
+
+	return 0;
+}
+
+static struct syscore_ops plic_irq_syscore_ops = {
+	.suspend	= plic_irq_suspend,
+	.resume		= plic_irq_resume,
+};
+
+static void plic_irq_pm_init(void)
+{
+	unsigned int cpu;
+
+	for_each_cpu(cpu, cpu_present_mask) {
+		struct plic_handler *handler = per_cpu_ptr(&plic_handlers, cpu);
+
+		if (!handler->present)
+			continue;
+
+		memset(&handler->enable_reg[0], 0,
+			sizeof(handler->enable_reg));
+	}
+
+	register_syscore_ops(&plic_irq_syscore_ops);
+}
+
 static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
 			      irq_hw_number_t hwirq)
 {
@@ -351,6 +429,7 @@ static int __init __plic_init(struct device_node *node,
 		return -ENOMEM;
 
 	priv->plic_quirks = plic_quirks;
+	priv_data = priv;
 
 	priv->regs = of_iomap(node, 0);
 	if (WARN_ON(!priv->regs)) {
@@ -363,15 +442,21 @@ static int __init __plic_init(struct device_node *node,
 	if (WARN_ON(!nr_irqs))
 		goto out_iounmap;
 
+	priv->nr_irqs = nr_irqs;
+
+	priv->priority_reg = kcalloc(nr_irqs, sizeof(u32), GFP_KERNEL);
+	if (!priv->priority_reg)
+		goto out_free_priority_reg;
+
 	nr_contexts = of_irq_count(node);
 	if (WARN_ON(!nr_contexts))
-		goto out_iounmap;
+		goto out_free_priority_reg;
 
 	error = -ENOMEM;
 	priv->irqdomain = irq_domain_add_linear(node, nr_irqs + 1,
 			&plic_irqdomain_ops, priv);
 	if (WARN_ON(!priv->irqdomain))
-		goto out_iounmap;
+		goto out_free_priority_reg;
 
 	for (i = 0; i < nr_contexts; i++) {
 		struct of_phandle_args parent;
@@ -461,11 +546,15 @@ static int __init __plic_init(struct device_node *node,
 				  plic_starting_cpu, plic_dying_cpu);
 		plic_cpuhp_setup_done = true;
 	}
+	plic_irq_pm_init();
 
 	pr_info("%pOFP: mapped %d interrupts with %d handlers for"
 		" %d contexts.\n", node, nr_irqs, nr_handlers, nr_contexts);
 	return 0;
 
+out_free_priority_reg:
+	kfree(priv->priority_reg);
+
 out_iounmap:
 	iounmap(priv->regs);
 out_free_priv:
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
