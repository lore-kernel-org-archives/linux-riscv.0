Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76C3C54E49
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 13:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:From:Cc:To
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3w+njFYXLovOu9bKItxuaxLmLxDQuLDZLpzxsC0gyDk=; b=EKlt3bnh6mVKGP
	UpNabBSLnw7IUX/nwUxbI27uoEqjXvbIAMp+9iIc04MTI4QYHkmuX9aBThDJZF+9bZnK6J9fj4S0j
	Q8RqpCFLZm/dzvZV4cqfrzyWINi8V9r52NmsiQv3NNeNgu24dksRrHVG+16B2aPsQl3X33QSM/7s+
	HceWJSC4cY/3cRW2TnuOawtlgcCqiRjVZ402q9EGhkgyXUIPDFJ/dXkDATgs4qxEwPBxmS9YvgeQd
	q8J0s+BGg8jiVL+RH5+HKaJKHKmB/AXdm1CH/XswYstA4KlNi2ZeA5IYxapPqplYA/gpf3S3MDt0r
	0jYUJ215hiVtdG8bWJYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reaoY-00000000mWH-2cTi;
	Mon, 26 Feb 2024 13:14:38 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reaoV-00000000mUt-1GLX
	for linux-riscv@lists.infradead.org;
	Mon, 26 Feb 2024 13:14:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 95614CE17ED;
	Mon, 26 Feb 2024 13:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81701C433C7;
	Mon, 26 Feb 2024 13:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708953271;
	bh=QMn84hOJLB+qyDGoqeXwTRhkyMub1a0bp/BC9B7nbL8=;
	h=Subject:To:Cc:From:Date:From;
	b=f+uF8dCrrHVP4lP4EC5n1cTO8Ljdr8qBbNsqKvAzEfdaymddKPjDoxfNzyizILQ0f
	 ise0iO6+NRbLtzgyq+FlwfkciMqogFnbdl88l18rz1AamnO3aKjT+mUX/jk04nMqjl
	 FkOIvgKTMw+SLnlOR/mDXFyEt7jyH3EZQ1BJHab0=
Subject: Patch "irqchip/sifive-plic: Enable interrupt if needed before EOI" has been added to the 6.6-stable tree
To: gregkh@linuxfoundation.org,guoren@kernel.org,linux-riscv@lists.infradead.org,maz@kernel.org,namcao@linutronix.de,palmer@dabbelt.com,paul.walmsley@sifive.com,samuel@sholland.org,tglx@linutronix.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 26 Feb 2024 14:14:06 +0100
Message-ID: <2024022605-sixteen-spinster-02d2@gregkh>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_051435_800357_47C3870F 
X-CRM114-Status: GOOD (  20.19  )
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


This is a note to let you know that I've just added the patch titled

    irqchip/sifive-plic: Enable interrupt if needed before EOI

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     irqchip-sifive-plic-enable-interrupt-if-needed-before-eoi.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 9c92006b896c767218aabe8947b62026a571cfd0 Mon Sep 17 00:00:00 2001
From: Nam Cao <namcao@linutronix.de>
Date: Wed, 31 Jan 2024 09:19:33 +0100
Subject: irqchip/sifive-plic: Enable interrupt if needed before EOI

From: Nam Cao <namcao@linutronix.de>

commit 9c92006b896c767218aabe8947b62026a571cfd0 upstream.

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
point of EOI.

However, this is incorrect: there is a window after a hart claiming an
interrupt and before irq_desc->lock getting acquired, interrupt can be
disabled during this window. Thus, EOI can be invoked while the interrupt
is disabled, effectively nullify this EOI. This results in the interrupt
never gets asserted again, and the device who uses this interrupt appears
frozen.

Make sure that interrupt is really enabled before EOI.

Fixes: a1706a1c5062 ("irqchip/sifive-plic: Separate the enable and mask operations")
Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/20240131081933.144512-1-namcao@linutronix.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/irqchip/irq-sifive-plic.c |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -148,7 +148,13 @@ static void plic_irq_eoi(struct irq_data
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


Patches currently in stable-queue which might be from namcao@linutronix.de are

queue-6.6/irqchip-sifive-plic-enable-interrupt-if-needed-before-eoi.patch

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
