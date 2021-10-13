Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DC5C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 01:22:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92A8C60F21
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 01:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92A8C60F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YTsrr7J6NTQz8mk34InvTieZwkOPj1gBKL0N3rl/2vQ=; b=JGNELySuoGgcna
	xMlyWAg7hrtXgAKR4QkoVQTCgfPETIN5zvz5VfVcjRLFzOjZ2YxrfveRnMVMKBSzFvIR+42bQnrZc
	CDBAeKPOMGtOS5iwU/IhvuQeTE9yZqVEbY8PrJr4BePoHvt1e5JchCIH8kcA9J8Cgh2sdlZZOmRzM
	T7xglt1dKMoKKM0SPCvWkxJshjH5XNZu70MfUOcxFtr5eQTkdc2KdCofGwvNm+YdahTNuB3uqq8gf
	eTbV68zF57NmWvMG6B5+5u3yRSkcjxkz1gM+DnM7fljScLY2USWu+uaYT41uaDpUNRKIeQuzzUhQf
	SGfdJ6l7/6CRxKds//UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maSyT-00EZRY-4h; Wed, 13 Oct 2021 01:22:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maSyQ-00EZQi-Hg
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 01:22:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AAE0B60EB4;
 Wed, 13 Oct 2021 01:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634088146;
 bh=xdFNRaKIEdOX1bCHR9Iw6lKDctOEN+PWB8DJ4TThBAM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q7IiouUErlVyHM+hyiR6VanPykrLzMfMN7syy4EUw1IV2c6V0TrZwGN6sHZS6AGIe
 Nns5db+s436hWHPhGH0RA0X+QdzN//pIa1dwz6d+OH/8tMdzeOr5i+qaA5Rpx32vaj
 ZUlh2kvgXlTtRGp+oii1olqJrknjh+to7+pWxc0bbZcwijZDvQHwIyXVZqGO6DwsXj
 lwTgq9anG2TKjNEfbVELy3gx1ps0DKOav1rpHx6B+Y9i9gDvl2134D9rRM9HgXbr9L
 6bj/MMirpjCiqmjKHDYm+i2sBJeUOnjbQJUS04QsuEjEWBFgmTJMtk35ya0RKQd50i
 CemJc4sRFXi3w==
From: guoren@kernel.org
To: guoren@kernel.org, anup@brainfault.org, atish.patra@wdc.com,
 maz@kernel.org, tglx@linutronix.de, palmer@dabbelt.com, heiko@sntech.de
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V3 2/2] irqchip/sifive-plic: Add thead,c900-plic support
Date: Wed, 13 Oct 2021 09:21:49 +0800
Message-Id: <20211013012149.2834212-2-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013012149.2834212-1-guoren@kernel.org>
References: <20211013012149.2834212-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_182226_652240_A40760AA 
X-CRM114-Status: GOOD (  14.78  )
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

thead,c900-plic would mask IRQ with readl(claim), so it needn't
mask/unmask which needed in RISC-V PLIC.

When in IRQS_ONESHOT & IRQCHIP_EOI_THREADED path, unnecessary mask
operation would cause a blocking irq bug in thead,c900-plic. Because
when IRQ is disabled in c900, writel(hwirq, claim) would be invalid.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Anup Patel <anup@brainfault.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Atish Patra <atish.patra@wdc.com>

---

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
 drivers/irqchip/irq-sifive-plic.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index cf74cfa82045..5b806d823df7 100644
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
@@ -176,12 +176,24 @@ static struct irq_chip plic_chip = {
 #endif
 };
 
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
@@ -390,5 +402,14 @@ static int __init plic_init(struct device_node *node,
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
