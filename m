Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BC6EB490D
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Feb 2026 11:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FWy2QImsaPfzSGVChvvaAy7Gz+Uit1s5+xnoZoM1oG0=; b=zU/Tf4ZpHH9mFx
	dgCBNtQqTcv2gC6+N3qbgqa89vZS6yK8Y77LpPi2jqaHrXkz7T8+sLj9yzeCM9mdVwXKKCFADxYtT
	rMBjJ+gNhg9RHtrFS7dhZNvGor0J5HOL2nIdmI1eXI/S6ArfYOVjKAnEx/WXzhqzh57bDXJRZ8Utr
	74Rbz2lHtSd7Pepzz336tKJzephQlIYuvaaK7uW4iR6RqfPzfCZFT70STxswPNsb1KF/x/o8fUSYQ
	jD5/K+BVEeqTLI7dxgppEAVBc0Fm6e5JASe2TSQVgTbWY53LLCzMUCSkbp0EOPoUOQlEAHz9yjr8w
	7JNgqUqadGfbrYYypajQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqV4n-000000020zN-2kpv;
	Thu, 12 Feb 2026 11:41:41 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqV4l-000000020xg-1EV6
	for linux-riscv@lists.infradead.org;
	Thu, 12 Feb 2026 11:41:40 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770896496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1xbsh6Z18XgLpEVhl943YbQBKoHtlngksvhjy78Lq7A=;
	b=E7WTjDT/+RLI5EYNgw9AIIF/f0sDGk/+olMBrAdyKzMIMibJ9Mhg3QKcWyuBaE9NKahORF
	DousRcOROnp3X9LMKs2sz1lYO9F409dKAEUJwCNFXe4iepUfhImz96F1pJmg+LDJEOopdU
	ZO4tNxH6SOWcUrXZA6tibZzuPsq8Qexm2bZZ/AaD/IZ6ZbYlcI+RPVpxmPcAhQ36vaK/W5
	s2es1aSajp1BJavEFk4KQjycFyjdDU9QMDQT9e0fnXrpPc6Ltqjb+QBscbpjLr3uwNlcYc
	QVh+N07Qbti2d2IvfsIjxvf4PprsRK9PYf0d8D6OaAl7vOWLJFa0WjtLZKjahQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770896496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1xbsh6Z18XgLpEVhl943YbQBKoHtlngksvhjy78Lq7A=;
	b=0voUlkdguKHaSNq5HfWeenUIIkeRaeVyOsrDZ4CBjZVNz8kI6QjNfkxth3pB2jo9V8R2As
	XUKdzQUGzd/jaUCw==
To: Thomas Gleixner <tglx@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Marc Zyngier <maz@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH] irqchip/sifive-plic: Fix frozen interrupt due to affinity setting
Date: Thu, 12 Feb 2026 12:41:25 +0100
Message-ID: <20260212114125.3148067-1-namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_034139_511731_B884F27C 
X-CRM114-Status: GOOD (  14.53  )
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

PLIC ignores interrupt completion message for disabled interrupt, explained
by the specification:

    The PLIC signals it has completed executing an interrupt handler by
    writing the interrupt ID it received from the claim to the
    claim/complete register. The PLIC does not check whether the completion
    ID is the same as the last claim ID for that target. If the completion
    ID does not match an interrupt source that is currently enabled for
    the target, the completion is silently ignored.

This caused problem in the past, because an interrupt can be disabled while
still being handled and plic_irq_eoi() had no effect. That was fixed by
checking if the interrupt is disabled, and if so enable it, before sending
the completion message. That check is done with irqd_irq_disabled().

However, that is not sufficient because the enable bit for the handling
hart can be zero despite irqd_irq_disabled(d) being false. This can happen
when affinity setting is changed while a hart is still handling the
interrupt.

This problem is easily reproducible by dumping a large file to uart (which
generates lots of interrupts) and at the same time keep changing the uart
interrupt's affinity setting. The uart port becomes frozen almost
jnstantly.

Fix by checking PLIC's enable bit instead of irqd_irq_disabled().

Fixes: cc9f04f9a84f ("irqchip/sifive-plic: Implement irq_set_affinity() for SMP host")
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 drivers/irqchip/irq-sifive-plic.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 210a57959637..1565aab895bc 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -164,8 +164,13 @@ static void plic_irq_disable(struct irq_data *d)
 static void plic_irq_eoi(struct irq_data *d)
 {
 	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
+	u32 __iomem *reg;
+	bool enabled;
+
+	reg = handler->enable_base + (d->hwirq / 32) * sizeof(u32);
+	enabled = readl(reg) & BIT(d->hwirq % 32);
 
-	if (unlikely(irqd_irq_disabled(d))) {
+	if (unlikely(!enabled)) {
 		plic_toggle(handler, d->hwirq, 1);
 		writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
 		plic_toggle(handler, d->hwirq, 0);
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
