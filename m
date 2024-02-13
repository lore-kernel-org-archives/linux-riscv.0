Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663E6C48260
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 10:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dc4RHBSp43WpVTAImZX0/3W/nAeKGix1Iw7rhoyY0ho=; b=W7lfP6LZVB9hab
	5KL0EbcwF2MzSIClcuezF5QTh5b94xErysjJVc7uw3uwWPa6icJMnnhYQLHHyaCMitkUdlXZLl/XS
	3nHsa0iCjybxu82fHB2DNJHqm/7bCvlaslw274qttMLoIzasxuleoBhEo6a5MtjWowhHGpeFyJjm4
	1kLZfgIN24Qt586G5SP36UP/9DLAX3idtabdSfLKGFOZMetBWuawwn64c2yN8S2Kk77iOEfR7bof6
	6b45iZA26iegaBdbzFF8Dpo56yfNs1Lmez89pFQYnEnvEH8AyGrjf3RjcSBqEc3gYcBUC7cwmYqxO
	J5/JxC2mPr/BLEbo/wGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZpzz-00000008ovt-0KSc;
	Tue, 13 Feb 2024 10:26:47 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZpzu-00000008oti-2Naq
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 10:26:45 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1707820001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OirENwRVffLhqg4vLQeXmmc6qTeG6AWtBgzm4/Fep7o=;
	b=GwkPBvLE/NQAAT43xtyROcGSWgUiucZZB2ec2g3VMikr5ObnhcXmo+RS5IDSmyM1OUGiEd
	7xS8uBH10ljyxTHAf0TgsO0vUhc8J3cUumyVjdF+tArJNZ5Cb6qbN81/2L4SUuNb1n+xeM
	lTUKLPRc+bLsZCgPNl5jfAbi8uQEAR9a7o0M/zk8iHPMQOA0sGKzpV8m4ycyLpvhMqIrTG
	BzH2/fE2hX0EICezQmdB7T4kOaTHuSMg8g41lIojVhpEATsMu34Fr+weMIBkrFDgJ1m7zJ
	smGA9OsZA5tjREuhcauzD90erNoGucb+l9Ok3++FJGDwNXwNBXF9bmy5HX/vxA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1707820001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OirENwRVffLhqg4vLQeXmmc6qTeG6AWtBgzm4/Fep7o=;
	b=FTIkVehmdBJJQ8PbMU0GBBiXWHp+VmaePW7Fc9q0HvKZTnjeSpYgSUQrZkAOitKr3WDpHK
	rs9WULSDRQ3oSFCA==
To: Nam Cao <namcao@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland
 <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Nam Cao <namcao@linutronix.de>, stable@vger.kernel.org
Subject: Re: [PATCH v2] irqchip/sifive-plic: enable interrupt if needed
 before EOI
In-Reply-To: <20240131081933.144512-1-namcao@linutronix.de>
References: <20240131081933.144512-1-namcao@linutronix.de>
Date: Tue, 13 Feb 2024 11:26:40 +0100
Message-ID: <87wmr8hd7j.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_022642_775773_9447C8D3 
X-CRM114-Status: GOOD (  26.96  )
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

Nam!

On Wed, Jan 31 2024 at 09:19, Nam Cao wrote:
> RISC-V PLIC cannot "end-of-interrupt" (EOI) disabled interrupts, as
> explained in the description of Interrupt Completion in the PLIC spec:
>
> "The PLIC signals it has completed executing an interrupt handler by
> writing the interrupt ID it received from the claim to the claim/complete
> register. The PLIC does not check whether the completion ID is the same
> as the last claim ID for that target. If the completion ID does not match
> an interrupt source that *is currently enabled* for the target, the
> completion is silently ignored."
>
> Commit 69ea463021be ("irqchip/sifive-plic: Fixup EOI failed when masked")
> ensured that EOI is successful by enabling interrupt first, before EOI.
>
> Commit a1706a1c5062 ("irqchip/sifive-plic: Separate the enable and mask
> operations") removed the interrupt enabling code from the previous
> commit, because it assumes that interrupt should already be enabled at the
> point of EOI. However, this is incorrect: there is a window after a hart
> claiming an interrupt and before irq_desc->lock getting acquired,
> interrupt can be disabled during this window. Thus, EOI can be invoked
> while the interrupt is disabled, effectively nullify this EOI. This
> results in the interrupt never gets asserted again, and the device who
> uses this interrupt appears frozen.

Nice detective work!

> Make sure that interrupt is really enabled before EOI.
>
> Fixes: a1706a1c5062 ("irqchip/sifive-plic: Separate the enable and mask operations")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
> v2:
>   - add unlikely() for optimization
>   - re-word commit message to make it clearer
>
>  drivers/irqchip/irq-sifive-plic.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index e1484905b7bd..0a233e9d9607 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -148,7 +148,13 @@ static void plic_irq_eoi(struct irq_data *d)
>  {
>  	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
>  
> -	writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> +	if (unlikely(irqd_irq_disabled(d))) {
> +		plic_toggle(handler, d->hwirq, 1);
> +		writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> +		plic_toggle(handler, d->hwirq, 0);

It's unfortunate to have this condition in the hotpath, though it should
be cache hot, easy to predict and compared to the writel() completely in
the noise.

> +	} else {
> +		writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> +	}
>  }

Can the RISCV folks please have a look at this?

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
