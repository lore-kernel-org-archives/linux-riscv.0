Return-Path: <SRS0=mni0=O7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 412D3C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Oct 2021 13:25:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF40060F35
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Oct 2021 13:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF40060F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/6fJ3gUR4OIxPeBdJOJBoGj3Samj2Kp+iRlBugVHygo=; b=Q+uxUV4Wm5JAei
	mFNU1j1BlFrweeiTHIk0gRftxqWC9EELK4S7/ZTX5U/38+ctZlG/0scxStBLlOusJTeD0N4u/Pr90
	aPMkBko0cN7ng/CWLOlm162jBq5+X+vj5Qj7dNz3W1hK78Y7aGd05nNTQpjZj3DRoS7LQSG/4CPx3
	O7LdBwUzm1bVBwCSTBB/JUdZqzxejjm/5yn8ELxxtItLbjDGm850a7DhW799/XK3T4rCcF707qsrg
	tABv3KUim7ftgvXy4NpwFd5b/8OVsBDUWiShAf0EUgl1g8Oc2+PYQNafFcdYG9UXju0nMFiWUNY9g
	ulOSxjxCgQR6IAw5XhXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZvIW-009Vlj-1C; Mon, 11 Oct 2021 13:24:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZvIT-009Vks-PG
 for linux-riscv@lists.infradead.org; Mon, 11 Oct 2021 13:24:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9184360F4B;
 Mon, 11 Oct 2021 13:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633958693;
 bh=9m+DpA2gtePLN7XyZpxzMA7snyaATDs0wGR8pRq60OM=;
 h=From:To:Cc:Subject:Date:From;
 b=OknVS/UUtvpIldUY9L+Z5/8DtV814XWzm+/jNAeRChjsxzyMUQ0RYU60pVl4RwFx/
 eBe1v/X5SNCXq7gTbsewcqr5rmZw+8E9C/ssUtkl7X4UN6Jqrlvy8tsgJaNDqnbyqu
 ovpckISFNQ9lAKSg0UZDCuxDcmCWkVY615NTXVDdg0wFN4QWr5wPpu62fEJMesu9T2
 k6RuyB3LVKcmGfR60gbAZkemvQVGs59TkLCCrIKbgmNAvW3ajWqdxPcw4TyhHe4nVb
 0el3/hwHYEV6ZH06dmcUFGp9GnkgjlPvXBs7MpvaiWFfHv3Z8ezaZA93i+vUEkD5nK
 AoiLvYQRROjcA==
From: guoren@kernel.org
To: guoren@kernel.org, anup@brainfault.org, atish.patra@wdc.com,
 maz@kernel.org, tglx@linutronix.de, palmer@dabbelt.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 1/2] irqchip/sifive-plic: Fix duplicate mask/unmask for
 claim/complete
Date: Mon, 11 Oct 2021 21:24:30 +0800
Message-Id: <20211011132431.2792797-1-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_062453_878535_B0A8F747 
X-CRM114-Status: GOOD (  12.89  )
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

From: Guo Ren <guoren@linux.alibaba.com>

PLIC only has enable-registers not mask/unmask registers. Mixing
mask/unmask with irq_eoi is wrong, because readl(claim) could mask
irq by hardware. We only need mask/unmask to fixup the hardware
which couldn't claim + mask correctly.

If hardware supports claim + mask, it would cause unnecessary
mask/umak operations.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@wdc.com>
---
 drivers/irqchip/irq-sifive-plic.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index cf74cfa82045..0fa46912f452 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -64,6 +64,7 @@ struct plic_priv {
 	struct cpumask lmask;
 	struct irq_domain *irqdomain;
 	void __iomem *regs;
+	bool claim_mask_support;
 };
 
 struct plic_handler {
@@ -111,7 +112,7 @@ static inline void plic_irq_toggle(const struct cpumask *mask,
 	}
 }
 
-static void plic_irq_unmask(struct irq_data *d)
+static void plic_irq_enable(struct irq_data *d)
 {
 	struct cpumask amask;
 	unsigned int cpu;
@@ -125,7 +126,7 @@ static void plic_irq_unmask(struct irq_data *d)
 	plic_irq_toggle(cpumask_of(cpu), d, 1);
 }
 
-static void plic_irq_mask(struct irq_data *d)
+static void plic_irq_disable(struct irq_data *d)
 {
 	struct plic_priv *priv = irq_data_get_irq_chip_data(d);
 
@@ -168,8 +169,8 @@ static void plic_irq_eoi(struct irq_data *d)
 
 static struct irq_chip plic_chip = {
 	.name		= "SiFive PLIC",
-	.irq_mask	= plic_irq_mask,
-	.irq_unmask	= plic_irq_unmask,
+	.irq_enable	= plic_irq_enable,
+	.irq_disable	= plic_irq_disable,
 	.irq_eoi	= plic_irq_eoi,
 #ifdef CONFIG_SMP
 	.irq_set_affinity = plic_set_affinity,
@@ -181,6 +182,11 @@ static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
 {
 	struct plic_priv *priv = d->host_data;
 
+	if (!priv->claim_mask_support) {
+		plic_chip.irq_mask	= plic_irq_disable;
+		plic_chip.irq_unmask	= plic_irq_enable;
+	}
+
 	irq_domain_set_info(d, irq, hwirq, &plic_chip, d->host_data,
 			    handle_fasteoi_irq, NULL, NULL);
 	irq_set_noprobe(irq);
@@ -298,6 +304,8 @@ static int __init plic_init(struct device_node *node,
 	if (WARN_ON(!nr_contexts))
 		goto out_iounmap;
 
+	priv->claim_mask_support = of_property_read_bool(node, "claim-mask-support");
+
 	error = -ENOMEM;
 	priv->irqdomain = irq_domain_add_linear(node, nr_irqs + 1,
 			&plic_irqdomain_ops, priv);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
