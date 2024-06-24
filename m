Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C35C41513
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 09:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WyyrMVVBEQaQxMsUJ8YzTyQ2shqhu1qXXRMVotnodSo=; b=0Y2XndeC5u0h7k
	JG4QalD0N/Q4nv+egk9c9oBdIPQ/1HxYbW10mX5wN5FiGclnRwYAcHMIchWthBJI/8Xkxs4mI/XF3
	IDSd8hgbGT95OfTBhP2zWJQCHHkrVTLxvMEnipVqaDhfG5gsdRWmyHNFjm/icUeo/qcKLNvK4ZXjR
	XeRzh8vb8Dj/NJ9rZgXlzdFvDDxLaN1ww885wSymAKyYsnlQKQvCSvXj9TIE4xGPw4BJoo9VY5Ak4
	meUSmx7o08FqEWMBIU6UkW6CtKPT8WsKZGygxUyipRkkkczjQFMne0jFYtekly0GxtOLjV0rwTcKa
	BrMNaVxydw0qF/NxVFQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLg7O-0000000GHUw-0Suh;
	Mon, 24 Jun 2024 09:36:10 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLg7J-0000000GHTX-0Nso
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 09:36:08 +0000
Date: Mon, 24 Jun 2024 11:35:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1719221761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lexuk++UGQy+LV2MaJjmecp6me8bsRDaxD2ODTFKJLg=;
	b=cCVdnP2KtpLESxd1di9/V+qQhOA3a/s6D4CEespGvdx0RBlY1iA51qDvoRU+0LszgGptpN
	1sxoytVAOeVpAFuIRPa6ft+24r7rs4nZK3iaH1fvKhktAwwanU9LzvvCdoHJc72iGzlzDb
	ZlAXxE2YOB0jWqLuRt92Cy9AGXvu72nndloKxdVOg1ZJJQX32RyUeP3nhkOF9LBqMvO62f
	7WwmPkXNzTvuPyhV6Wktrd1mpRuH+M5QzTBTRcafhF9DCJfOxVpcN0UiXQuV+nWZkPvLPq
	S9vLnRsmahW5G2toJpsWD/F1W8/+ZHKujch9HNtw6bATuhJWVsCo1alTJuPFEA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1719221761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lexuk++UGQy+LV2MaJjmecp6me8bsRDaxD2ODTFKJLg=;
	b=p5aeRWzXqA26JkmodL3pFeF9lLRKLOna7p2PmxdrvSLWtxr2mQVt/c9/+sR0hMNZBhA2iD
	zmezS89HUjMkKwCw==
From: Nam Cao <namcao@linutronix.de>
To: zhengyan <zhengyan@asrmicro.com>
Cc: tglx@linutronix.de, maz@kernel.org, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, samuel.holland@sifive.com,
	linux-riscv@lists.infradead.org, qiaozhou@asrmicro.com
Subject: Re: [PATCH] irqchip/sifive-plic: ensure interrupt is enable before
 EOI
Message-ID: <20240624093556.ZcZgu2GF@linutronix.de>
References: <20240624085341.3935-1-zhengyan@asrmicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240624085341.3935-1-zhengyan@asrmicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_023605_514040_57E3EA7C 
X-CRM114-Status: GOOD (  29.20  )
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

On Mon, Jun 24, 2024 at 08:53:41AM +0000, zhengyan wrote:
> RISC-V PLIC cannot "end-of-interrupt" (EOI) disabled interrupts, as
> explained in the description of Interrupt Completion in the PLIC spec:
> "The PLIC signals it has completed executing an interrupt handler by
> writing the interrupt ID it received from the claim to the claim/complete
> register. The PLIC does not check whether the completion ID is the same
> as the last claim ID for that target. If the completion ID does not match
> an interrupt source that *is currently enabled* for the target, the
> completion is silently ignored."
> 
> Commit 9c92006b896c ("irqchip/sifive-plic: Enable interrupt if needed
> before EOI")
> ensured that EOI is enable when irqd IRQD_IRQ_DISABLED is set, before
> EOI
> 
> Commit 69ea463021be ("irqchip/sifive-plic: Fixup EOI failed when masked")
> ensured that EOI is successful by enabling interrupt first, before EOI.
> 
> Commit a1706a1c5062 ("irqchip/sifive-plic: Separate the enable and mask
> operations") removed the interrupt enabling code from the previous
> commit, because it assumes that interrupt should already be enabled at the
> point of EOI.
> 
> However, here still miss a corner case that if SMP is enabled. When
> someone need to set affinity from a cpu to another (Maybe like
> boardcast-tick) the original cpu when handle the EOI meanwhile the IE is
> disabled by plic_set_affinity
> 
> So this patch ensure that won't happened
> 
> Signed-off-by: zhengyan <zhengyan@asrmicro.com>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index 9e22f7e378f5..e6acd134a691 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -149,8 +149,10 @@ static void plic_irq_mask(struct irq_data *d)
>  static void plic_irq_eoi(struct irq_data *d)
>  {
>  	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> +	void __iomem *reg = handler->enable_base + (d->hwirq / 32) * sizeof(u32);
> +	u32 hwirq_mask = 1 << (d->hwirq % 32);
>  
> -	if (unlikely(irqd_irq_disabled(d))) {
> +	if (unlikely(irqd_irq_disabled(d)) || (readl(reg) & hwirq_mask) == 0) {

If we read interrupt enable state from hardware, then reading the
software state (irqd_irq_disabled) is redundant.

>  		plic_toggle(handler, d->hwirq, 1);
>  		writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
>  		plic_toggle(handler, d->hwirq, 0);

I have no knowledge about affinity stuff, so I don't really understand this
patch. But there is another idea regarding this "ignored EOI" problem:
always "complete" the interrupt while enabling. That would move this extra
complication out of the hot path, and also looks simpler in my opinion.

Something like the patch below. Would this solve this "affinity problem"
too?

Best regards,
Nam

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 0a233e9d9607..63f2111ced4a 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -122,7 +122,15 @@ static inline void plic_irq_toggle(const struct cpumask *mask,
 
 static void plic_irq_enable(struct irq_data *d)
 {
+	struct plic_priv *priv = irq_data_get_irq_chip_data(d);
+
+	writel(0, priv->regs + PRIORITY_BASE + d->hwirq * PRIORITY_PER_ID);
+
+	writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
+
 	plic_irq_toggle(irq_data_get_effective_affinity_mask(d), d, 1);
+
+	writel(1, priv->regs + PRIORITY_BASE + d->hwirq * PRIORITY_PER_ID);
 }
 
 static void plic_irq_disable(struct irq_data *d)
@@ -148,13 +156,7 @@ static void plic_irq_eoi(struct irq_data *d)
 {
 	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
 
-	if (unlikely(irqd_irq_disabled(d))) {
-		plic_toggle(handler, d->hwirq, 1);
-		writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
-		plic_toggle(handler, d->hwirq, 0);
-	} else {
-		writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
-	}
+	writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
 }
 
 #ifdef CONFIG_SMP

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
