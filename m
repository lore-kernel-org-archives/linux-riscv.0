Return-Path: <SRS0=WjcT=PM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E6DFC433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Oct 2021 01:33:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE94660F35
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Oct 2021 01:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE94660F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+V6LwlMh89rl70Nd0cUzfX2I6NlesbwwgOwx8bRT8Lo=; b=mIWVgH8an3y1fK
	imTpvNR23lpRKA9JYVSSTgD38X7BKkj3lnziLYD7LbONPWxfI3VD7b2zCbStXpn6VWuhYEpT80/9p
	DEjFiH5u+hqpYCDhqBsUPbmgnr0n2FKitCFvrLXTjJrasjoaY4x5SItgCKYN1Gu7IPkKcKLxksUNI
	TJPsOyzq8BbJTNfixUpwqIBuud9LYLZQBikg99B3cKx9YzhLvy+iENYK+x029QBzt8V86LB/uzUi7
	Kh08TRkaNPKtMLNJthzoG9uSDPiO5IRO7XSlSlc6kstgLoVmWpaiGcUVuZT6YF8222jqStkVthcKQ
	kUaZfYZnWcSVADGtjMVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meSO6-00Dba1-4M; Sun, 24 Oct 2021 01:33:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meSO2-00DbZ8-Q6
 for linux-riscv@lists.infradead.org; Sun, 24 Oct 2021 01:33:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA66860F45;
 Sun, 24 Oct 2021 01:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635039202;
 bh=xmfvtK/CuwhoFGDjQWSolRKBpu9P5drS44pisoY6tdU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YHUbMw3h9egpCxV0WhyjAc3Z0RqMu5SxIq6xOuzFbODDzaA4Sur+sigff2KOEnxF1
 LQb+DHhrbX1w8YuLwy0JInjcenvaf4jQ+fTEDARnrmx7jz76wg2tCc7y99qPJrowFn
 jCNki+0N23uzoC6FFYMcVz29gxlokXGFe12aJ1ZppqkrwACueHKGJwTVRTapQl/1Lb
 f4NfjzBSp/Y8HL+x4/iIZM83AsIrIlAq03oA+NpUTyow6DLKUYoJ7KyE2U4hOh/xCV
 +coHfrtKZn/X+vcMV8/gS5V/xDYl5dULvCcT2ShOaFn/TW5QTpedLGN5DYLVbwIGVl
 75OPGxKSQT4sg==
From: guoren@kernel.org
To: guoren@kernel.org, anup@brainfault.org, atish.patra@wdc.com,
 maz@kernel.org, tglx@linutronix.de, palmer@dabbelt.com, heiko@sntech.de,
 robh@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V5 3/3] irqchip/sifive-plic: Fixup thead,
 c900-plic request_threaded_irq with ONESHOT
Date: Sun, 24 Oct 2021 09:33:03 +0800
Message-Id: <20211024013303.3499461-4-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211024013303.3499461-1-guoren@kernel.org>
References: <20211024013303.3499461-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211023_183322_920607_B919BD3D 
X-CRM114-Status: GOOD (  20.96  )
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

When using "devm_request_threaded_irq(,,,,IRQF_ONESHOT,,)" in the driver,
only the first interrupt could be handled, and continue irq is blocked by
hw. Because the thead,c900-plic couldn't complete masked irq source which
has been disabled in enable register. Add thead_plic_chip which fix up
c906-plic irq source completion problem by unmask/mask wrapper.

Here is the description of Interrupt Completion in PLIC spec [1]:

The PLIC signals it has completed executing an interrupt handler by
writing the interrupt ID it received from the claim to the claim/complete
register. The PLIC does not check whether the completion ID is the same
as the last claim ID for that target. If the completion ID does not match
an interrupt source that is currently enabled for the target, the
                         ^^ ^^^^^^^^^ ^^^^^^^
completion is silently ignored.

[1] https://github.com/riscv/riscv-plic-spec/blob/8bc15a35d07c9edf7b5d23fec9728302595ffc4d/riscv-plic.adoc

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Anup Patel <anup@brainfault.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Atish Patra <atish.patra@wdc.com>

---

Changes since V5:
 - Move back to mask/unmask
 - Fixup the problem in eoi callback
 - Remove allwinner,sun20i-d1 IRQCHIP_DECLARE
 - Rewrite comment log

Changes since V4:
 - Update comment by Anup

Changes since V3:
 - Rename "c9xx" to "c900"
 - Add sifive_plic_chip and thead_plic_chip for difference

Changes since V2:
 - Add a separate compatible string "thead,c9xx-plic"
 - set irq_mask/unmask of "plic_chip" to NULL and point
   irq_enable/disable of "plic_chip" to plic_irq_mask/unmask
 - Add a detailed comment block in plic_init() about the
   differences in Claim/Completion process of RISC-V PLIC and C9xx
   PLIC.
---
 drivers/irqchip/irq-sifive-plic.c | 44 +++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index cf74cfa82045..7c64a7ab56f3 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -166,7 +166,7 @@ static void plic_irq_eoi(struct irq_data *d)
 	writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
 }
 
-static struct irq_chip plic_chip = {
+static struct irq_chip sifive_plic_chip = {
 	.name		= "SiFive PLIC",
 	.irq_mask	= plic_irq_mask,
 	.irq_unmask	= plic_irq_unmask,
@@ -176,12 +176,43 @@ static struct irq_chip plic_chip = {
 #endif
 };
 
+/*
+ * Current C9xx PLIC can't complete interrupt when the interrupt
+ * source is currently disabled for the target. Re-enable the
+ * interrupt source by unmasking to let hw irq source completion
+ * succeed.
+ */
+static void plic_thead_irq_eoi(struct irq_data *d)
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
+static struct irq_chip thead_plic_chip = {
+	.name		= "T-Head PLIC",
+	.irq_mask	= plic_irq_mask,
+	.irq_unmask	= plic_irq_unmask,
+	.irq_eoi	= plic_thead_irq_eoi,
+#ifdef CONFIG_SMP
+	.irq_set_affinity = plic_set_affinity,
+#endif
+};
+
+static struct irq_chip *def_plic_chip = &sifive_plic_chip;
+
 static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
 			      irq_hw_number_t hwirq)
 {
 	struct plic_priv *priv = d->host_data;
 
-	irq_domain_set_info(d, irq, hwirq, &plic_chip, d->host_data,
+	irq_domain_set_info(d, irq, hwirq, def_plic_chip, d->host_data,
 			    handle_fasteoi_irq, NULL, NULL);
 	irq_set_noprobe(irq);
 	irq_set_affinity(irq, &priv->lmask);
@@ -390,5 +421,14 @@ static int __init plic_init(struct device_node *node,
 	return error;
 }
 
+static int __init thead_c900_plic_init(struct device_node *node,
+		struct device_node *parent)
+{
+	def_plic_chip = &thead_plic_chip;
+
+	return plic_init(node, parent);
+}
+
 IRQCHIP_DECLARE(sifive_plic, "sifive,plic-1.0.0", plic_init);
 IRQCHIP_DECLARE(riscv_plic0, "riscv,plic0", plic_init); /* for legacy systems */
+IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", thead_c900_plic_init);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
