Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402C4C43334
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 20:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dDJZd6oW7/jNToOLIa73pzc1CF70asfml9alUkXJi7g=; b=X45M/Obk3/gNgm
	R25weA31xEo/FM8f+fK6AcExicfxkYLE0xT2HyCDNZIlBQuk0zdhZ+bFSyy4gBAGM8Den5GTFIAN5
	CvA9qevNQYPZnlA1KBhn/nb97g+YPUv+E4tjuubz7AY+/2AMZnw3P6lgdjvE745YWYFuVb7IRA90d
	LtnlIGIiX/YulxTAYqlzM27MaQeu0vlhX9NschLwbTnbPe6nDsWvslkaJI5w4xGRvh1iqG8RFZ2Kp
	dhiVy2ECYVBm8YD6NTBvnEXQaw76RWdp/863j72S8QFsvfOJXGR3J3D/QzLZ6mc4/gn4CFJbDcA69
	UMIwDFIVKjxjmeSGr3Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7NC7-006n82-R5; Fri, 01 Jul 2022 20:24:51 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7NC0-006n5e-RA
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 20:24:50 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 3883E5C0107;
	Fri,  1 Jul 2022 16:24:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 01 Jul 2022 16:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1656707084; x=1656793484; bh=Hn
	/E8vVGaFtGaghheTN4YnxSeKObXSrHI8YMyykgXHU=; b=PmcsZb/petEK860oe6
	B8pyMIXIBSw1U700oYzXcKQ1g+3DFomvbFIPE3FyW+ps7S1caLkegnKiloB4aKAu
	5q4qu1vFslrTkahDlsNKFeNuOj73Iy2XcIVJtzaetcLCovxiF6zoCCFidFvTgLsL
	JIwVaGP16XZavxOnfb49CQOYOF0FfTBcSmQ64FAE87x9ROpywLNp4GnVAZUdhyt6
	U2INn8AQzrofEwDQmA4k4WqHEk7on9eUu8KyIo/otOgMG/IhDAYp6xmHMUrhsSre
	jsCgxh8T5/QyijbK6a2sm6QoYZXowY0mOF1ooY47Jq/Oy4HuQ+o2lqAvsl6GonB4
	057A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1656707084; x=1656793484; bh=Hn/E8vVGaFtGa
	ghheTN4YnxSeKObXSrHI8YMyykgXHU=; b=hI78zdRGP/1OCUyIqcQXd2k6kbA/X
	6S1QymStfx2AlsAjmGixkKApUSBF5i96livtljAXnvgM1MbHrC17FqGhZDcSS+0O
	r4P4WeLRbwHzw6uvhAwYWNgGGUCpvienXmrQ78WD5NrGP9SjQ0lzVAmnqGrErR+Q
	jlO3UcWUJZGp//oJ9n7Uk4/lzy6/yQoxejLrdWRsQtDNnpIZxWR1HSC9QD+koI2P
	oNSaluCCIl6YHQ1Inz7BwBKhiSSbA4A6CnJTVU8Zesf3B5nxFUK+ZG4fnjV3qa90
	j0jc98W5pCyS0QHYKKt5uYDJXv///eWoG5E6zviC5YIvGmGKoSpX2fIiQ==
X-ME-Sender: <xms:DFi_YtXJae-UVbyH82iwnb7JBY-bUMetRmN0Ck1vOyaFefnmNfoWPg>
    <xme:DFi_YtlpsgncaC0HQIHtyQcnOdoUNDrP9EAc2-gUXLANzmT-Vm-uHn8xz33I8A3ZC
    WpAb1UZuB-3IuJtHA>
X-ME-Received: <xmr:DFi_YpZffCW04rtR1j2VUKW7_BlyBrZjcSddiRQr9IpZusGKGfKmCkqppEhqrk8kOwxK2ioWPJchR27fPTnKhw_arGKfOLETxADONiqVfxflZyc2VdQjWz8y99p0DQ5FQkxr_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehfedgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeeh
    gfdufeeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:DFi_YgXjACsgcM_ldmHX3T9Z_iET-spNkdld8ErKpBaFOLjb05UNNg>
    <xmx:DFi_YnnrNvZ-YDYUKxWevQL7U_TXA2v14O-D5a35gPeR_u93MQtrmg>
    <xmx:DFi_YteUY6_QUYtPbmgwFb_hi-VEshuTjxcp3SFZ0VGIeLmDkBCTLQ>
    <xmx:DFi_YlZOYZ0WcduY-gaK0HcdPldmH_aTrPTrRwiwzguEZKZ5yMD5sA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Jul 2022 16:24:43 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Samuel Holland <samuel@sholland.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 2/2] irqchip/sifive-plic: Separate the enable and mask operations
Date: Fri,  1 Jul 2022 15:24:40 -0500
Message-Id: <20220701202440.59059-3-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220701202440.59059-1-samuel@sholland.org>
References: <20220701202440.59059-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_132444_998501_E9EDCB4C 
X-CRM114-Status: GOOD (  17.24  )
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

The PLIC has two per-IRQ checks before sending an IRQ to a hart context.
First, it checks that the IRQ's priority is nonzero. Then, it checks
that the enable bit is set for that combination of IRQ and context.

Currently, the PLIC driver sets both the priority value and the enable
bit in its (un)mask operations. However, modifying the enable bit is
problematic for two reasons:
  1) The enable bits are packed, so changes are not atomic and require
     taking a spinlock.
  2) The following requirement from the PLIC spec, which explains the
     racy (un)mask operations in plic_irq_eoi():

       If the completion ID does not match an interrupt source
       that is currently enabled for the target, the completion
       is silently ignored.

Both of these problems are solved by using the priority value to mask
IRQs. Each IRQ has a separate priority register, so writing the priority
value is atomic. And since the enable bit remains set while an IRQ is
masked, the EOI operation works normally. The enable bits are still used
to control the IRQ's affinity.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v3:
 - Rebased on top of irqchip-next

 drivers/irqchip/irq-sifive-plic.c | 55 +++++++++++++++++++------------
 1 file changed, 34 insertions(+), 21 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 46595e607b0e..ba4938188570 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -108,9 +108,7 @@ static inline void plic_irq_toggle(const struct cpumask *mask,
 				   struct irq_data *d, int enable)
 {
 	int cpu;
-	struct plic_priv *priv = irq_data_get_irq_chip_data(d);
 
-	writel(enable, priv->regs + PRIORITY_BASE + d->hwirq * PRIORITY_PER_ID);
 	for_each_cpu(cpu, mask) {
 		struct plic_handler *handler = per_cpu_ptr(&plic_handlers, cpu);
 
@@ -118,16 +116,37 @@ static inline void plic_irq_toggle(const struct cpumask *mask,
 	}
 }
 
-static void plic_irq_unmask(struct irq_data *d)
+static void plic_irq_enable(struct irq_data *d)
 {
 	plic_irq_toggle(irq_data_get_effective_affinity_mask(d), d, 1);
 }
 
-static void plic_irq_mask(struct irq_data *d)
+static void plic_irq_disable(struct irq_data *d)
 {
 	plic_irq_toggle(irq_data_get_effective_affinity_mask(d), d, 0);
 }
 
+static void plic_irq_unmask(struct irq_data *d)
+{
+	struct plic_priv *priv = irq_data_get_irq_chip_data(d);
+
+	writel(1, priv->regs + PRIORITY_BASE + d->hwirq * PRIORITY_PER_ID);
+}
+
+static void plic_irq_mask(struct irq_data *d)
+{
+	struct plic_priv *priv = irq_data_get_irq_chip_data(d);
+
+	writel(0, priv->regs + PRIORITY_BASE + d->hwirq * PRIORITY_PER_ID);
+}
+
+static void plic_irq_eoi(struct irq_data *d)
+{
+	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
+
+	writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
+}
+
 #ifdef CONFIG_SMP
 static int plic_set_affinity(struct irq_data *d,
 			     const struct cpumask *mask_val, bool force)
@@ -146,32 +165,21 @@ static int plic_set_affinity(struct irq_data *d,
 	if (cpu >= nr_cpu_ids)
 		return -EINVAL;
 
-	plic_irq_mask(d);
+	plic_irq_disable(d);
 
 	irq_data_update_effective_affinity(d, cpumask_of(cpu));
 
-	if (!irqd_irq_masked(d))
-		plic_irq_unmask(d);
+	if (!irqd_irq_disabled(d))
+		plic_irq_enable(d);
 
 	return IRQ_SET_MASK_OK_DONE;
 }
 #endif
 
-static void plic_irq_eoi(struct irq_data *d)
-{
-	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
-
-	if (irqd_irq_masked(d)) {
-		plic_irq_unmask(d);
-		writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
-		plic_irq_mask(d);
-	} else {
-		writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
-	}
-}
-
 static struct irq_chip plic_edge_chip = {
 	.name		= "SiFive PLIC",
+	.irq_enable	= plic_irq_enable,
+	.irq_disable	= plic_irq_disable,
 	.irq_ack	= plic_irq_eoi,
 	.irq_mask	= plic_irq_mask,
 	.irq_unmask	= plic_irq_unmask,
@@ -184,6 +192,8 @@ static struct irq_chip plic_edge_chip = {
 
 static struct irq_chip plic_chip = {
 	.name		= "SiFive PLIC",
+	.irq_enable	= plic_irq_enable,
+	.irq_disable	= plic_irq_disable,
 	.irq_mask	= plic_irq_mask,
 	.irq_unmask	= plic_irq_unmask,
 	.irq_eoi	= plic_irq_eoi,
@@ -429,8 +439,11 @@ static int __init __plic_init(struct device_node *node,
 			i * CONTEXT_ENABLE_SIZE;
 		handler->priv = priv;
 done:
-		for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
+		for (hwirq = 1; hwirq <= nr_irqs; hwirq++) {
 			plic_toggle(handler, hwirq, 0);
+			writel(1, priv->regs + PRIORITY_BASE +
+				  hwirq * PRIORITY_PER_ID);
+		}
 		nr_handlers++;
 	}
 
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
