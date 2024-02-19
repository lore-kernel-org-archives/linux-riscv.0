Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A792CC5478C
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 19:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	References:In-Reply-To:Cc:Subject:To:From:Date:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VDBtB8xxVSHJDEQzqOmHr9AE8T+YdsbyWGzv51Z046I=; b=aBY9Or8bGQmhIN
	bImiPWFE13gMEJZcVCrIixrOoOPBSGCRPDRrFvdzoCSZmjk+GrZY0x7nJthAy4hd7PfSEJ2rJi+B3
	rLV1B1FimW3/ovVV6VPWcCFVLVJJVCrZTawpWJINtKkuAEIrdpiK0tDg7zkB3NSRmUjvWElmoR9QY
	KKHQw+60yXxKt9tEAJHtxzJFQB8FLSksLlP5CL1EJKVW6dNHmtQGmge8y+bWWlljyCAcA1F4OpGNA
	KeIAhtPrPjyRTMx7MglScCOEZz+/3bsZ9EJJiho83VYGa8t7t3dwaGV7Elu+TwXZel+9/fFNocUAJ
	TObaYBwagHrgo+ddEScg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdb8L-0000000Ayc2-3tTv;
	Fri, 23 Feb 2024 19:22:57 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc4Ji-0000000AmHM-3q4O
	for linux-riscv@lists.infradead.org;
	Mon, 19 Feb 2024 14:08:25 +0000
Date: Mon, 19 Feb 2024 14:08:17 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708351698;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LJ15QQb5lo2AdR2SG9y6GMsXz1qi6IFa/UGCYP+exNg=;
	b=FZfwf83ypHWycWhnl4ZxH7XYiUmcCenQUZR9KawYT32E8UjI+XWSlkK8pKC72dN2w5EJQq
	Mt9G0rQueYHfNnh4ZXHCHRXihwkq0sH9lJNLnGXCdf6NH4Jgta84ZI4RICFR3Fzct3ex9M
	F8uKn9K9V0sK/rJi6ZpnStCScTzfrEWZRmHU+26OCbZ/MVqaHANMacx2GMWB0JfLjs3DJz
	M6U2boMSWtVD/EKeT11hryFWEjdMxc/pQClA4eY3xeq83e1lSajp2/2mLYRZig16bOlHrx
	DnFIBnznLFiC+GyCi6VT3PoypMzqk6si1MdssFko7IRIK57gPxLxEHZ85FvQWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708351698;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LJ15QQb5lo2AdR2SG9y6GMsXz1qi6IFa/UGCYP+exNg=;
	b=FLn437WbpgpmXhCwoGJ3NCl1iPy98mW0NLwsqiJPr3q79WUfGDT4avqYpn95+XXhQLNimV
	eT1nOG6ukxTkekBg==
From: "tip-bot2 for Nam Cao" <tip-bot2@linutronix.de>
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/urgent] irqchip/sifive-plic: Enable interrupt if needed before EOI
Cc: Nam Cao <namcao@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>,
 Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
  <stable@vger.kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240131081933.144512-1-namcao@linutronix.de>
References: <20240131081933.144512-1-namcao@linutronix.de>
MIME-Version: 1.0
Message-ID: <170835169709.398.11515115809265577283.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from these emails
Precedence: bulk
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_060823_133966_2B4D41FD 
X-CRM114-Status: GOOD (  16.15  )
X-Mailman-Approved-At: Fri, 23 Feb 2024 11:22:56 -0800
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following commit has been merged into the irq/urgent branch of tip:

Commit-ID:     9c92006b896c767218aabe8947b62026a571cfd0
Gitweb:        https://git.kernel.org/tip/9c92006b896c767218aabe8947b62026a571cfd0
Author:        Nam Cao <namcao@linutronix.de>
AuthorDate:    Wed, 31 Jan 2024 09:19:33 +01:00
Committer:     Thomas Gleixner <tglx@linutronix.de>
CommitterDate: Mon, 19 Feb 2024 15:05:18 +01:00

irqchip/sifive-plic: Enable interrupt if needed before EOI

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
---
 drivers/irqchip/irq-sifive-plic.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 5b7bc4f..bf0b40b 100644
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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
