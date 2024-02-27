Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F211FC54798
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 13:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lktGuomb2UMp93+4llN9J37i5hOCCRNzfZsgwvQb9c0=; b=EM+i4ocbfX7CAY
	6PYwl7OEHuiXfMkS//nQi6DjhtbK9UaPvVY9u9XYQ8boYdxIe2j8+juJDeHTKAF1tcXr1XtdE+3R9
	TutQaihXjkfdLlYujXRq2YgtGshRWxNc6z9UNQwBPDJuIOfv6Mruti1kCVlSWt5Rr/e1QJe9jojWq
	8v9dJWYyeggUECcnFr63MdisvcfqcAs72nlDhHDb3ldDJKHadkOYj3LGQqkIhOiEPqBglFnjZnrX6
	pLFrAL0EuQicgAkY4Y2LATVQoHj9rjUOacjJND13F48JR+nWSSNfsKg+QxQ0UfTF1Mg+5u9uYWF/u
	RppAkTPe1ozARllSjjsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rexdx-00000005PTL-470T;
	Tue, 27 Feb 2024 13:37:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rexdv-00000005PSs-0dO5
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 13:37:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8490461298;
	Tue, 27 Feb 2024 13:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA02EC43394;
	Tue, 27 Feb 2024 13:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709041030;
	bh=SneoRjlM6zUV40W9zc/OoFWLTf9jOV3p2OMdqL65wOc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UFMgQd/1MoX9Oas83jiu6xeCkJJddUGeETaTVfY2ylNS42MatSt0hyDiXEuuB6zA+
	 oQZTZ3oyUq060UObSRUqAkgymHSJ674UfEy1oaYj/alNogwO7GGO/G/LoS2qKDxcpV
	 co5N1cRKIhqDbFJrCQVQcZ8/V+XlEDFcjoMOtQG8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Nam Cao <namcao@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel@sholland.org>,
	Marc Zyngier <maz@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 6.7 195/334] irqchip/sifive-plic: Enable interrupt if needed before EOI
Date: Tue, 27 Feb 2024 14:20:53 +0100
Message-ID: <20240227131636.995384543@linuxfoundation.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227131630.636392135@linuxfoundation.org>
References: <20240227131630.636392135@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_053711_295164_4CA10FAB 
X-CRM114-Status: GOOD (  17.37  )
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

6.7-stable review patch.  If anyone has any objections, please let me know.

------------------

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



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
