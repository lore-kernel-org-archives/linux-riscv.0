Return-Path: <SRS0=v6lb=PE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F43C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Oct 2021 03:22:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B404C60F9D
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Oct 2021 03:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B404C60F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RmG2+2aGAZolbkLO10wcAdlCztgR0PjiAsnQywaqgnA=; b=lb+lbSybYWbBr2
	2BAVMM5YEiZplWa2i+2x40yNvci3H+/mNixeU/mSjIg1rgRXz1mPVSoZLL6OSYnD/0wRAIEij+9Kv
	Ev3rflcGmutGyhHQtCeqra5xwr6w++uXi51PoXlNVRD35c86E+37dHr2rSUMXS++R5Bflf8fhCyOd
	GEAQVFLSSEK7yA3VqkY+BJj8Ci9PtV6/LaDkFlPOxa/VxdEQRXKWv/qzs3RT7iWsJp5raqc3wql5K
	jpa2EXx4ntwWawmbBOP1ABtRTQx790x8vRgYyytX0UB0Xc4jIgRM0SKew/OMkLYey/8BSPw2j8DAq
	ik9/9ywAy/9WidPwEtoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbaH5-009df2-Qd; Sat, 16 Oct 2021 03:22:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbaH3-009deQ-Gr
 for linux-riscv@lists.infradead.org; Sat, 16 Oct 2021 03:22:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 30EAF61152;
 Sat, 16 Oct 2021 03:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634354537;
 bh=g0Z1DAJuKWrr2LBtNixnHCE9ToQiLilpVHL/S0gpHRs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fspSGS1ju4paK8moQbmaH0af8r4KkMbt9VV4NtouyY4R/K7FxhafIar3DpUS0fiHo
 O5nfhfVKTVEx07achdRqGPBXtP+mK3FFH4KLYhtTv5R3ltZYB/q1rXZMr8EvqJbY7B
 dxTDb1euG1kYyd7Uv8MGBORVc6UAotlcs06WdRa1OfsatyyPfsuCDVd6WiCkigJCsL
 SrCAKGY5krnZM+vTiIjiaN1bIdPVWDhRVJqrR6MrrQUsqiOgaB5i/dIZ7vmNeePFJg
 7AI+lymXtfbrSyItc2dT9ykzk0RKoNhWrFW+Apdj7rpHLvMZHaEqbTrMqR2ZQ4UZIq
 /fkv2UId4FqLQ==
From: guoren@kernel.org
To: guoren@kernel.org, anup@brainfault.org, atish.patra@wdc.com,
 maz@kernel.org, tglx@linutronix.de, palmer@dabbelt.com, heiko@sntech.de,
 robh@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V4 1/3] irqchip/sifive-plic: Add thead,c900-plic support
Date: Sat, 16 Oct 2021 11:21:58 +0800
Message-Id: <20211016032200.2869998-2-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016032200.2869998-1-guoren@kernel.org>
References: <20211016032200.2869998-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_202217_632243_0921A0FA 
X-CRM114-Status: GOOD (  19.50  )
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

1) The irq_mask/unmask() is used by handle_fasteoi_irq() is mostly
for ONESHOT irqs and there is no limitation in the RISC-V PLIC driver
due to use of irq_mask/unmask() callbacks. In fact, a lot of irqchip
drivers using handle_fasteoi_irq() also implement irq_mask/unmask().

2) The C9xx PLIC does not comply with the interrupt claim/completion
process defined by the RISC-V PLIC specification because C9xx PLIC
will mask an IRQ when it is claimed by PLIC driver (i.e. readl(claim)
and the IRQ will be unmasked upon completion by PLIC driver (i.e.
writel(claim). This behaviour breaks the handling of IRQS_ONESHOT by
the generic handle_fasteoi_irq() used in the PLIC driver.

3) This patch adds an errata fix for IRQS_ONESHOT handling on
C9xx PLIC by using irq_enable/disable() callbacks instead of
irq_mask/unmask().

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Anup Patel <anup@brainfault.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Atish Patra <atish.patra@wdc.com>

---

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
 drivers/irqchip/irq-sifive-plic.c | 34 +++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index cf74cfa82045..960b29d02070 100644
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
@@ -176,12 +176,32 @@ static struct irq_chip plic_chip = {
 #endif
 };
 
+/*
+ * The C9xx PLIC does not comply with the interrupt claim/completion
+ * process defined by the RISC-V PLIC specification because C9xx PLIC
+ * will mask an IRQ when it is claimed by PLIC driver (i.e. readl(claim)
+ * and the IRQ will be unmasked upon completion by PLIC driver (i.e.
+ * writel(claim). This behaviour breaks the handling of IRQS_ONESHOT by
+ * the generic handle_fasteoi_irq() used in the PLIC driver.
+ */
+static struct irq_chip thead_plic_chip = {
+	.name		= "T-Head PLIC",
+	.irq_disable	= plic_irq_mask,
+	.irq_enable	= plic_irq_unmask,
+	.irq_eoi	= plic_irq_eoi,
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
@@ -390,5 +410,15 @@ static int __init plic_init(struct device_node *node,
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
+IRQCHIP_DECLARE(allwinner_sun20i_d1_plic, "allwinner,sun20i-d1-plic", thead_c900_plic_init);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
