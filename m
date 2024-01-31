Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CA0C48285
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 08:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PDBglWXGCwJvxC7imJ/fgNSYfnD5huLMgQiEqNNnR5M=; b=udERNoSjS2IOBu
	UY8ssFg09op4kuyCwgJKC2r+7BvwoaD88CXiuqcHxThpmA+svdv6y6XAwQ4B/hmfYJri5bzPT+UuR
	JebJhENHwFrgFReAfBdi57z5D7bMrozxYafAy1KRMb6/qJJSU6w2Hi7CcNpgNni1J4DwW02+WJuRb
	tYGMVoGR1s+ehpX9w4sBqQl2dK02MR8zRi4c3xDUT0GoaiUaS1ywZvZlfs80i2d4xi6Lv/Z6befmH
	14bLTwF28p8GsJiZaSLdcHA7VdpqnWE8xLAu1cQn1vyMT1jWRPl/68L7qcxPFLVV6sT4B62FkdogL
	lI4R7WZnpoYSiEuDFttw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV5pi-0000000242y-007d;
	Wed, 31 Jan 2024 08:20:34 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV5pd-000000023zm-2shr
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 08:20:32 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1706689224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w8HpHV0x1fENAzE/fQpwHsbHa7p7cxsO49CTT+C0rLw=;
	b=BF39uFbjNsmkux2PvO6mYxHtzNyyH1IobjCeqy+pT88EE4kYmF/uj2F6wNtsfNvuDXme94
	MFOoi2nFs/dZsB0b8H4+arNJ9qWwirkF2xZGxPgkgih5NhkgLQ5BFgzsES4xsVrvXGP7jI
	zWDM3gu9LaTJbpAR4Y+EA9IEEoPQJa7KPiUP0pRiGdD/+kEGRh4SNjdkt7Vonj58BFxYYH
	WcVrZbUuBOmtQMb6dDWq1eOd269vzAvxi/VDp2Q0aPwcCZdDhrLyBP6Jyga8H2gRN+5O5x
	A88RBpmMtRjd3LFB/nnD0NhcPKtnUFKq0k7zOXnuFtvXW50HUCqCUQz/cH+I+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1706689224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w8HpHV0x1fENAzE/fQpwHsbHa7p7cxsO49CTT+C0rLw=;
	b=+szjX1SI5t1MyKsWanFvac6dZS4L+0EVLC1N3HAKrYGepum1PrI36nKXIG5xYU90olsKy3
	gGtmx59GsHAqH0Ag==
To: Thomas Gleixner <tglx@linutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel@sholland.org>,
	Marc Zyngier <maz@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Nam Cao <namcao@linutronix.de>,
	stable@vger.kernel.org
Subject: [PATCH v2] irqchip/sifive-plic: enable interrupt if needed before EOI
Date: Wed, 31 Jan 2024 09:19:33 +0100
Message-Id: <20240131081933.144512-1-namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_002029_892430_AB52ED5B 
X-CRM114-Status: GOOD (  14.58  )
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

Commit 69ea463021be ("irqchip/sifive-plic: Fixup EOI failed when masked")
ensured that EOI is successful by enabling interrupt first, before EOI.

Commit a1706a1c5062 ("irqchip/sifive-plic: Separate the enable and mask
operations") removed the interrupt enabling code from the previous
commit, because it assumes that interrupt should already be enabled at the
point of EOI. However, this is incorrect: there is a window after a hart
claiming an interrupt and before irq_desc->lock getting acquired,
interrupt can be disabled during this window. Thus, EOI can be invoked
while the interrupt is disabled, effectively nullify this EOI. This
results in the interrupt never gets asserted again, and the device who
uses this interrupt appears frozen.

Make sure that interrupt is really enabled before EOI.

Fixes: a1706a1c5062 ("irqchip/sifive-plic: Separate the enable and mask operations")
Cc: <stable@vger.kernel.org>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
v2:
  - add unlikely() for optimization
  - re-word commit message to make it clearer

 drivers/irqchip/irq-sifive-plic.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index e1484905b7bd..0a233e9d9607 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -148,7 +148,13 @@ static void plic_irq_eoi(struct irq_data *d)
 {
 	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
 
-	writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
+	if (unlikely(irqd_irq_disabled(d))) {
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
