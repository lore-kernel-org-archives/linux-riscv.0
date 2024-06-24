Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C00C2BD05
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 11:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ScoMvpB+VNq/2HWqBc13+hmSnYHzoBBX86CEUemIz44=; b=NH6okVjhMPuKZU
	dm23Rn7S1M3SDizfXChFra8mzbtJG1bQKzkldIbXMybB6KF6G97e4Vruow++4aqCjR0HDelzKSDFr
	Gwqm0epzDz9/Sr6NOjwzrfgmO0Y3n0X6+B67AupS44C5rXET1CrVcxpZPN10RRarfre1e0tQV3j1W
	hMUED4eBd/0u0eJKG8nIBx30dVG9XqV8PNaKrrtPD9EF48wi4pm1F20J9FeDqfIX2hE+rVnxY9mAI
	QULs2rPH5T7AN5b+5EBdSeBssoJS5R7T4z5IRn5sayXUyoeoBL76cZc7KsQcRgeI1z3N17JQoLqrM
	h6liVSZ5lrFWtowv2rmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLhz1-0000000GdDg-2ukL;
	Mon, 24 Jun 2024 11:35:39 +0000
Received: from asrmicro.com ([210.13.118.86] helo=spam.asrmicro.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLhyy-0000000GdCr-0tDH
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 11:35:38 +0000
Received: from exch01.asrmicro.com (exch01.asrmicro.com [10.1.24.121])
	by spam.asrmicro.com with ESMTPS id 45OBZQ5d092315
	(version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Mon, 24 Jun 2024 19:35:26 +0800 (GMT-8)
	(envelope-from zhengyan@asrmicro.com)
Received: from localhost (10.1.170.252) by exch01.asrmicro.com (10.1.24.121)
 with Microsoft SMTP Server (TLS) id 15.0.847.32; Mon, 24 Jun 2024 19:35:29
 +0800
From: zhengyan <zhengyan@asrmicro.com>
To: <zhengyan@asrmicro.com>
CC: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <maz@kernel.org>, <namcao@linutronix.de>, <paul.walmsley@sifive.com>,
        <qiaozhou@asrmicro.com>, <samuel.holland@sifive.com>,
        <tglx@linutronix.de>
Subject: [PATCH v2] irqchip/sifive-plic: ensure interrupt is enable before EOI
Date: Mon, 24 Jun 2024 11:35:23 +0000
Message-ID: <20240624113523.23-1-zhengyan@asrmicro.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <69174a28eff44ad1b069887aa514971e@exch03.asrmicro.com>
References: <69174a28eff44ad1b069887aa514971e@exch03.asrmicro.com>
MIME-Version: 1.0
X-Originating-IP: [10.1.170.252]
X-DNSRBL: 
X-MAIL: spam.asrmicro.com 45OBZQ5d092315
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_043537_024542_95EEFF98 
X-CRM114-Status: GOOD (  15.49  )
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

RISC-V PLIC cannot "end-of-interrupt" (EOI) disabled interrupts, as
explained in the description of Interrupt Completion in the PLIC spec:
"The PLIC signals it has completed executing an interrupt handler by
 writing the interrupt ID it received from the claim to the claim/complete
 register. The PLIC does not check whether the completion ID is the same
 as the last claim ID for that target. If the completion ID does not match
 an interrupt source that *is currently enabled* for the target, the
 completion is silently ignored."

 Commit 9c92006b896c ("irqchip/sifive-plic: Enable interrupt if needed
 before EOI")
 ensured that EOI is enable when irqd IRQD_IRQ_DISABLED is set, before
 EOI

 Commit 69ea463021be ("irqchip/sifive-plic: Fixup EOI failed when masked")
 ensured that EOI is successful by enabling interrupt first, before EOI.

 Commit a1706a1c5062 ("irqchip/sifive-plic: Separate the enable and mask
 operations") removed the interrupt enabling code from the previous
 commit, because it assumes that interrupt should already be enabled at the
 point of EOI.

However, here still miss a corner case that if SMP is enabled. When
someone needs to set affinity from a cpu to another the original cpu
when handle the EOI meanwhile the IE is disabled by plic_set_affinity

For example, broadcast tick is working,
cpu0 is about to response, cpu1 is the next.
1. cpu0 responses the timer irq, read the claim REG, do timer isr event.
2. during the timer isr it will set next event
tick_broadcast_set_event -> irq_set_affinity->xxx->
plic_set_affinity -> plic_irq_enable
3. in plic_set_affinity disable cpu0's IE and enable cpu1'IE
4. cpu0 do the write claim to finish this irq, while cpu0's IE is disabled,
left an active state in plic.

So this patch ensure that won't happened

Signed-off-by: zhengyan <zhengyan@asrmicro.com>
---
 drivers/irqchip/irq-sifive-plic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 9e22f7e378f5..815ce8aa28f1 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -149,8 +149,10 @@ static void plic_irq_mask(struct irq_data *d)
 static void plic_irq_eoi(struct irq_data *d)
 {
 	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
+	void __iomem *reg = handler->enable_base + (d->hwirq / 32) * sizeof(u32);
+	u32 hwirq_mask = 1 << (d->hwirq % 32);
 
-	if (unlikely(irqd_irq_disabled(d))) {
+	if (unlikely((readl(reg) & hwirq_mask) == 0)) {
 		plic_toggle(handler, d->hwirq, 1);
 		writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
 		plic_toggle(handler, d->hwirq, 0);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
