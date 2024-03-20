Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19C2C54E58
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 15:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KyCBRPZ+ogZvq83Cm1lp1qtTQfWPS7Qwzlw4E3el3Hs=; b=MD30wRoqaA6QrC
	sDgEKay3GXbUE1nc/+KJDnU66E7EAe6YJ7cYJiQnbkWDinnrpH5XL/AE98a92kR3nTTjrWz77yKgd
	7mIni0QfXadlowdm1f/uns7dJSQPPSnaBhx/QfAcC4K7cYJ1RcH3q8Sq6LnEsB0MiGtP1GEVGi9oy
	KgdEaH0VuVLvvftdlP4RDqS/kbFn+pC+VyQ/BRps93WL+rNWkQ0+8RGeCZUclo+PnHWC1Hgy7tsSw
	qXb1C7nAXpK6I2K4nwW6a2HLjw5Em+DirmjB1v6O6NAXnC2/LTJeKWpLM0huoRvbfkdzIuRMvRBVe
	PDjzKi1l9skM9ond3D9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmxcf-000000001Ak-1VKX;
	Wed, 20 Mar 2024 15:12:57 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmxcV-0000000012I-1ppt
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 15:12:53 +0000
Date: Wed, 20 Mar 2024 16:12:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1710947557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LqY42itfFZLfggmIMz0Q0EsnZ8t+OvYnRDCYFxlevL8=;
	b=hsSWeJj6TrjiUW12brMWme8K6vVyTafHuy7VucCN2pHD7oP9IzsRSDYDbMRyKKiW+rpe0K
	0lQTuaY8Gb0C0agF9+dqf19jbIktNHJdaOmSwN1z0PoH7lxCqSXYtzkONRDQr1sOv1ui1B
	zl7O3qNhZ//OQ0iXLcHOW8uJtC7szpRnetpo3uoOMhOVhnoyIGU6vhsgIhytRz2hLI+dNC
	2UWzyk8c3b+4QBNjt1fpE0ulqdZmzSEJI9E4du7A5tJEuNIZhhpzIAlHXvHZvqzWf+L71I
	zVixRX82UFTkA/TWt2vANyOu/DUYUvfha8Eq6+0gdHdqm5+WoonfcpwUTy/+jw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1710947557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LqY42itfFZLfggmIMz0Q0EsnZ8t+OvYnRDCYFxlevL8=;
	b=m0sgJUSKkUfQ2JAu2rnH2dWsfJHsEXLemQ6lVHKz3ifzzl4lFVr09Cu4Pgzt9uE+JBxc9q
	17j4Lrw6ww0J7KAg==
From: Nam Cao <namcao@linutronix.de>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: tglx@linutronix.de, Paul Walmsley <paul.walmsley@sifive.com>,
 samuel@sholland.org, Marc Zyngier <maz@kernel.org>, guoren@kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] irqchip/sifive-plic: enable interrupt if needed
 before EOI
Message-ID: <20240320161235.7e6916d9@namcao>
In-Reply-To: <mhng-2ab049d5-bab9-4d62-8d68-a7159a987f12@palmer-ri-x1c9>
References: <87wmr8hd7j.ffs@tglx>
	<mhng-2ab049d5-bab9-4d62-8d68-a7159a987f12@palmer-ri-x1c9>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_081247_919390_F4C9585F 
X-CRM114-Status: GOOD (  31.13  )
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

On 20/Mar/2024 Palmer Dabbelt wrote:
> On Tue, 13 Feb 2024 02:26:40 PST (-0800), tglx@linutronix.de wrote:
> > Nam!
> >
> > On Wed, Jan 31 2024 at 09:19, Nam Cao wrote:  
> >> RISC-V PLIC cannot "end-of-interrupt" (EOI) disabled interrupts, as
> >> explained in the description of Interrupt Completion in the PLIC spec:
> >>
> >> "The PLIC signals it has completed executing an interrupt handler by
> >> writing the interrupt ID it received from the claim to the claim/complete
> >> register. The PLIC does not check whether the completion ID is the same
> >> as the last claim ID for that target. If the completion ID does not match
> >> an interrupt source that *is currently enabled* for the target, the
> >> completion is silently ignored."
> >>
> >> Commit 69ea463021be ("irqchip/sifive-plic: Fixup EOI failed when masked")
> >> ensured that EOI is successful by enabling interrupt first, before EOI.
> >>
> >> Commit a1706a1c5062 ("irqchip/sifive-plic: Separate the enable and mask
> >> operations") removed the interrupt enabling code from the previous
> >> commit, because it assumes that interrupt should already be enabled at the
> >> point of EOI. However, this is incorrect: there is a window after a hart
> >> claiming an interrupt and before irq_desc->lock getting acquired,
> >> interrupt can be disabled during this window. Thus, EOI can be invoked
> >> while the interrupt is disabled, effectively nullify this EOI. This
> >> results in the interrupt never gets asserted again, and the device who
> >> uses this interrupt appears frozen.  
> >
> > Nice detective work!
> >  
> >> Make sure that interrupt is really enabled before EOI.
> >>
> >> Fixes: a1706a1c5062 ("irqchip/sifive-plic: Separate the enable and mask operations")
> >> Cc: <stable@vger.kernel.org>
> >> Signed-off-by: Nam Cao <namcao@linutronix.de>
> >> ---
> >> v2:
> >>   - add unlikely() for optimization
> >>   - re-word commit message to make it clearer
> >>
> >>  drivers/irqchip/irq-sifive-plic.c | 8 +++++++-
> >>  1 file changed, 7 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> >> index e1484905b7bd..0a233e9d9607 100644
> >> --- a/drivers/irqchip/irq-sifive-plic.c
> >> +++ b/drivers/irqchip/irq-sifive-plic.c
> >> @@ -148,7 +148,13 @@ static void plic_irq_eoi(struct irq_data *d)
> >>  {
> >>  	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> >>
> >> -	writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> >> +	if (unlikely(irqd_irq_disabled(d))) {
> >> +		plic_toggle(handler, d->hwirq, 1);
> >> +		writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> >> +		plic_toggle(handler, d->hwirq, 0);  
> >
> > It's unfortunate to have this condition in the hotpath, though it should
> > be cache hot, easy to predict and compared to the writel() completely in
> > the noise.  
> 
> Ya, I think it's fine.
> 
> I guess we could try and play some tricks.  Maybe hide the load latency 
> with a relaxed writel and some explict fencing, or claim interrupts when 
                                                     ^ you mean complete?
> enabling them.  Those both seem somewhat race-prone, though, so I'm not 
> even sure if they're sane.

The latter option is what I also have in mind. Just need to make sure the
interrupt is masked and we should be safe. Though there is the question of
whether it's worth the effort.

I may do that one day when I stop being lazy.

Best regards,
Nam


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
