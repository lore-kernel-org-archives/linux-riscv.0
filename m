Return-Path: <SRS0=9VPL=M2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A661AC4338F
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Aug 2021 01:13:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6257360F9C
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Aug 2021 01:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6257360F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Df4LRz6m/aHZ7DYIYbRaDUcu1rItPhZYe9NWeIDcGxw=; b=3Qis9/R2AhL9Eg
	FbP0+/wv01yllPREjuVJ4qOZnZ412DGajhD+tO+LJXIpHHNlkDL5z4OQT9yGBhawy5GyB6ASb8jT7
	OegXWJehnfzctBm+Oor6++joPF2YqmG8SMD9/GFRdDCIojYbGvvQ7v7Qhd11qcGcqz171Uk8IGHro
	hIWFZxucYI+WLsc8yYtDhHQK0HeYv9ibo1qjhNWF0BANe17RgSzybWnlJbsY/9s/bJGpK8U3hyOU/
	2fU5kOaiLJoMODa8q+Xhp7Jw+9L64Zg1UmjkwQIiENT3qrrXTqhJeZ9hiIK3YiLpbWx/qcf3J0i+u
	dAUUYMQo9aFewwV7AwzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAiz5-000hiD-CI; Tue, 03 Aug 2021 01:12:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAiz2-000hhg-IE
 for linux-riscv@lists.infradead.org; Tue, 03 Aug 2021 01:12:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 490FF60C41;
 Tue,  3 Aug 2021 01:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627953159;
 bh=LHJKX9XXkfazkD196dtxTgqloRW9uHOklZKJq1umYDM=;
 h=From:To:Cc:Subject:Date:From;
 b=UlYnk+D+6hE1ZBh4pSLkaOqbIJps8rFPMKb/ksqD9l1pqTKca+X9PoRZaAB8QiSId
 ncKaqEeRmp9+IRV5Wx3HSnVtwoFVMylG0fk3dL6F5Up6KGFP9d+lvYFBlxU8l1cAzj
 IHk48X8jhrWm8DepGQXocLIvPozujp7IHsR6pmnoWxC+S+9EQXlalT1z7UTRRdCJGH
 KKTYoTUqHfqLPVyS+27K/Fqn9US8YzLqFGUE8CmGHjjILwaKP+WScg1zCmYXhLTNDG
 AzF2SSp6ZmEEd/KorXxqZXyw/LrIx68Mt/0dhnGWYjzXMC0C4YsNTQP+EzQtQ3iD0v
 vwhcmW8XnzhuQ==
From: guoren@kernel.org
To: anup.patel@wdc.com, atish.patra@wdc.com, palmerdabbelt@google.com,
 tglx@linutronix.de, maz@kernel.org, guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>, Anup Patel <anup@brainfault.org>,
 Greentime Hu <greentime.hu@sifive.com>
Subject: [PATCH 1/2] irqchip/sifive-plic: Fix PLIC crash on touching offline
 CPU context
Date: Tue,  3 Aug 2021 09:12:02 +0800
Message-Id: <1627953123-24248-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_181240_678839_15E06324 
X-CRM114-Status: GOOD (  15.01  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The current plic driver would touch offline CPU context and cause
bus error in some chip when in CPU hotplug scenario.

This patch fixes up the problem and prevents plic access offline
CPU context in plic_init() & plic_set_affinity().

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@wdc.com>
Cc: Greentime Hu <greentime.hu@sifive.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-sifive-plic.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index cf74cfa..9c9bb20 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -64,6 +64,7 @@ struct plic_priv {
 	struct cpumask lmask;
 	struct irq_domain *irqdomain;
 	void __iomem *regs;
+	unsigned int nr_irqs;
 };
 
 struct plic_handler {
@@ -150,7 +151,7 @@ static int plic_set_affinity(struct irq_data *d,
 	if (cpu >= nr_cpu_ids)
 		return -EINVAL;
 
-	plic_irq_toggle(&priv->lmask, d, 0);
+	plic_irq_toggle(cpu_online_mask, d, 0);
 	plic_irq_toggle(cpumask_of(cpu), d, !irqd_irq_masked(d));
 
 	irq_data_update_effective_affinity(d, cpumask_of(cpu));
@@ -251,15 +252,25 @@ static void plic_set_threshold(struct plic_handler *handler, u32 threshold)
 
 static int plic_dying_cpu(unsigned int cpu)
 {
+	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
+
 	if (plic_parent_irq)
 		disable_percpu_irq(plic_parent_irq);
 
+	handler->present = false;
+
 	return 0;
 }
 
 static int plic_starting_cpu(unsigned int cpu)
 {
 	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
+	irq_hw_number_t hwirq;
+
+	handler->present = true;
+
+	for (hwirq = 1; hwirq <= handler->priv->nr_irqs; hwirq++)
+		plic_toggle(handler, hwirq, 0);
 
 	if (plic_parent_irq)
 		enable_percpu_irq(plic_parent_irq,
@@ -275,7 +286,6 @@ static int __init plic_init(struct device_node *node,
 		struct device_node *parent)
 {
 	int error = 0, nr_contexts, nr_handlers = 0, i;
-	u32 nr_irqs;
 	struct plic_priv *priv;
 	struct plic_handler *handler;
 
@@ -290,8 +300,8 @@ static int __init plic_init(struct device_node *node,
 	}
 
 	error = -EINVAL;
-	of_property_read_u32(node, "riscv,ndev", &nr_irqs);
-	if (WARN_ON(!nr_irqs))
+	of_property_read_u32(node, "riscv,ndev", &priv->nr_irqs);
+	if (WARN_ON(!priv->nr_irqs))
 		goto out_iounmap;
 
 	nr_contexts = of_irq_count(node);
@@ -299,14 +309,13 @@ static int __init plic_init(struct device_node *node,
 		goto out_iounmap;
 
 	error = -ENOMEM;
-	priv->irqdomain = irq_domain_add_linear(node, nr_irqs + 1,
+	priv->irqdomain = irq_domain_add_linear(node, priv->nr_irqs + 1,
 			&plic_irqdomain_ops, priv);
 	if (WARN_ON(!priv->irqdomain))
 		goto out_iounmap;
 
 	for (i = 0; i < nr_contexts; i++) {
 		struct of_phandle_args parent;
-		irq_hw_number_t hwirq;
 		int cpu, hartid;
 
 		if (of_irq_parse_one(node, i, &parent)) {
@@ -354,7 +363,8 @@ static int __init plic_init(struct device_node *node,
 		}
 
 		cpumask_set_cpu(cpu, &priv->lmask);
-		handler->present = true;
+		if (cpu == smp_processor_id())
+			handler->present = true;
 		handler->hart_base =
 			priv->regs + CONTEXT_BASE + i * CONTEXT_PER_HART;
 		raw_spin_lock_init(&handler->enable_lock);
@@ -362,8 +372,6 @@ static int __init plic_init(struct device_node *node,
 			priv->regs + ENABLE_BASE + i * ENABLE_PER_HART;
 		handler->priv = priv;
 done:
-		for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
-			plic_toggle(handler, hwirq, 0);
 		nr_handlers++;
 	}
 
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
