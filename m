Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BE6C47422
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jan 2024 22:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pJmmB7a1T2orLzR/+fj3/RvE4Ey2yTGz/GJ6Zsq5xKM=; b=STZyPa6iJscKmV
	SCZGaA0Yk4xQvnFBjCm2yAJMbjWmd7lvWxO3wsdzbeGyVv1tji4aB7a4SYciHKpgx70WDlJicgPu5
	/Y9Y2olSFa5WIvwHvgp9Hen4wwyRoQbcLxg5J1rh0we4/AscPoP9g0loaeU6zG9OvRnhs4E3qute3
	lYcAvRwBW+ekvq5TY+O1pAy+i6jXfoMWjdBAvJVEns7tTJAQGuR5z/DPlid/q0McF5qhPvCb9LK+b
	OrKabZR+DUypwzVRQOxfkEGeMxSiuAVvN4Ij7W5QcB23ATTiLdUf+lpWWlGyHqxFyWSKJbTxGty+T
	p7iTFut67qHQjvDPl2hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTUqj-00000005epa-0goF;
	Fri, 26 Jan 2024 22:39:01 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTUqX-00000005efh-0pfJ
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jan 2024 22:38:56 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1706308724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OSY4AA+ERuahWut+3rNr0L68f8wAh2tNR3brI8MYRrg=;
	b=1sr8VWzT31KeAk/uxoLKrfRKmZYe7u1SQ2lRSdKhorNCv8KuQb2ac+WiA+rU640ICqiHVz
	MT9Guulw72qEjtqkIj59AMaBGQI3SNlz7QEBWSWIv3MsVB/uZgEixpj5wGfIBF6lsizh48
	NJFxBLhROuxlA1jdLxcZlBc7rXEVGRPvNtly5Hr6RgPkWNHRrSi8+kEXGSUBQ1sOqIh/l2
	w3/Kb+RaT0mf+FDBy4Rnm46U5iU1oQEcq+nwi1uwciWbwpNn9jY23/roTwmGvri8BbQzCE
	zNW1CK278k3vLEQsES8FSF97ayjNN0JdBKBZ48ZOiSQQzfm3xZIhDSrP1PqlNQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1706308724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OSY4AA+ERuahWut+3rNr0L68f8wAh2tNR3brI8MYRrg=;
	b=l9KmcghkgmsXMiSYrpdPPTa025ZNvFZoX4I8GVfWpFJMzjE0wzCv9aH+u7puAYNVVVNjAU
	JqC+GlJvjpaRqvCA==
To: Thomas Gleixner <tglx@linutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel@sholland.org>,
	Marc Zyngier <maz@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>
Cc: Nam Cao <namcao@linutronix.de>,
	stable@vger.kernel.org
Subject: [PATCH] irqchip/sifive-plic: enable interrupt if needed before EOI
Date: Fri, 26 Jan 2024 23:38:36 +0100
Message-Id: <20240126223836.202321-1-namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_143849_429194_1A80843A 
X-CRM114-Status: GOOD (  13.91  )
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

RISC-V PLIC cannot EOI disabled interrupts, as explained in the
description of Interrupt Completion in the PLIC spec:

"The PLIC signals it has completed executing an interrupt handler by
writing the interrupt ID it received from the claim to the claim/complete
register. The PLIC does not check whether the completion ID is the same
as the last claim ID for that target. If the completion ID does not match
an interrupt source that *is currently enabled* for the target, the
completion is silently ignored."

Commit 69ea463021be ("irqchip/sifive-plic: Fixup EOI failed when masked")
ensured that by enabling the interrupt if needed before EOI.

Commit a1706a1c5062 ("irqchip/sifive-plic: Separate the enable and mask
operations") removed the interrupt enabling code from the previous
commit, because it assumes that interrupt should be enabled at the point
of EOI. However, this is incorrect: there is a small window after a hart
claiming an interrupt and before irq_desc->lock getting acquired,
interrupt can be disabled during this window. Thus, EOI can be invoked
while the interrupt is disabled, effectively nullify this EOI.

Make sure that interrupt is really enabled before EOI.

Fixes: a1706a1c5062 ("irqchip/sifive-plic: Separate the enable and mask operations")
Cc: <stable@vger.kernel.org>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 drivers/irqchip/irq-sifive-plic.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 5b7bc4fd9517..0857a516c35b 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -148,7 +148,13 @@ static void plic_irq_eoi(struct irq_data *d)
 {
 	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
 
-	writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
+	if (irqd_irq_disabled(d)) {
+		plic_toggle(handler, d->hwirq, 1);
+		writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
+		plic_toggle(handler, d->hwirq, 0);
+	} else {
+		writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
+	}
 }
 
 #ifdef CONFIG_SMP
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
