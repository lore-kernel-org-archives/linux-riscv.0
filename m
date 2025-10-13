Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE5BCCD185
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 21:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=81SnxNfZt//HC0mJP3oKFH4eFmf6V60ExgoDcR62/Hk=; b=EXAB6h8mo9MV/2
	SywnPBwW9/iUTpHRlZg4pr3e0aoSfsUw8VjIDwTN916t3vQ7+L7ADFd0EScHxXnN1XLfQMILM5qPj
	NUuwiK8ekIpIO26aY0XE4p7zuMMjGHUjlL8X633w2V2XIFhK58inzuXptBRWqob+f46KZGHgWOVKP
	G03xUnVEmB4VYdzrk9OhS+3G7YvQhy0pZhTTBFGCBR5PRYGU0k+tVv+Oiw+0B1NucdBMsoXseXzd+
	8cJn1EonbJK4wHdZUl+v89vOHE2bzpfx/fBrbmrMLYOGYKsGS1Nh2neGOGAs9FnAWgWPtRx4Ca0tZ
	+PJaPVLcM2GwAJR+5KdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Phk-0000000EWQs-3KHc;
	Mon, 13 Oct 2025 21:03:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Phh-0000000EWQY-1ez2
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 21:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760389415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z3hHUglpb4HrBk8ZJl5EP6S3/ReBmZLynJKTWiihJ0E=;
	b=DHAyMNla1JtltZNCpDbdsEyYCX4Q3CfvQdoqhANKi0PYfz+0jsIDaBreDYu49ikhBK4pz4
	pOo7/n5jJyBQkhm2BNiuvDcy2yCjGfvGZR29ZMVYtjuXTh4/RQgUndERVISwJLMZN4a56H
	c7yvTbVitZlvbSH8TaPwgupAnsS4bzE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-356-a809Im8BMqa-7r6Z4o_WkA-1; Mon,
 13 Oct 2025 17:03:31 -0400
X-MC-Unique: a809Im8BMqa-7r6Z4o_WkA-1
X-Mimecast-MFC-AGG-ID: a809Im8BMqa-7r6Z4o_WkA_1760389410
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4B6351800452;
	Mon, 13 Oct 2025 21:03:29 +0000 (UTC)
Received: from cmirabil.redhat.com (unknown [10.22.65.154])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4B28C1800447;
	Mon, 13 Oct 2025 21:03:26 +0000 (UTC)
From: Charles Mirabile <cmirabil@redhat.com>
To: samuel.holland@sifive.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	cmirabil@redhat.com,
	dramforever@live.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	lzampier@redhat.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	tglx@linutronix.de,
	zhangxincheng@ultrarisc.com
Subject: Re: [PATCH v2 3/3] irqchip/plic: add support for UltraRISC DP1000 PLIC
Date: Mon, 13 Oct 2025 17:03:18 -0400
Message-ID: <20251013210318.3879203-1-cmirabil@redhat.com>
In-Reply-To: <1ecbd61e-6b3f-42e8-86cd-e1c589a45262@sifive.com>
References: <1ecbd61e-6b3f-42e8-86cd-e1c589a45262@sifive.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_140337_528509_57CB0F24 
X-CRM114-Status: GOOD (  54.17  )
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

Hi Samuel - 

On Mon, Oct 13, 2025 at 02:00:29PM -0500, Samuel Holland wrote:
> Hi Lucas,
> 
> On 2025-10-13 6:15 AM, Lucas Zampieri wrote:
> > From: Charles Mirabile <cmirabil@redhat.com>
> > 
> > Add a new compatible for the plic found in UltraRISC DP1000 with a quirk to
> > work around a known hardware bug with IRQ claiming.
> > 
> > When claiming an interrupt on the DP1000 PLIC all other interrupts must be
> > disabled before the claim register is accessed to prevent incorrect
> > handling of the interrupt.
> > 
> > When the PLIC_QUIRK_CLAIM_REGISTER is present, during plic_handle_irq
> > the enable state of all interrupts is saved and then all interrupts
> > except for the first pending one are disabled before reading the claim
> > register. The interrupts are then restored before further processing of
> > the claimed interrupt continues.
> 
> Since the workaround requires scanning the pending bits for each interrupt
> anyway, it would be simpler and more efficient to ignore the claim register
> entirely. Call generic_handle_domain_irq() for each interrupt that is (enabled
> AND pending), then clear the pending bit. Then you would not need to save and
> restore the enable registers.
> 
> > The driver matches on "ultrarisc,cp100-plic" to apply the quirk to all
> > SoCs using UR-CP100 cores, regardless of the specific SoC implementation.
> > This has no impact on other platforms.
> > 
> > Co-developed-by: Zhang Xincheng <zhangxincheng@ultrarisc.com>
> > Signed-off-by: Zhang Xincheng <zhangxincheng@ultrarisc.com>
> > Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
> > Signed-off-by: Lucas Zampieri <lzampier@redhat.com>
> > ---
> >  drivers/irqchip/irq-sifive-plic.c | 83 ++++++++++++++++++++++++++++++-
> >  1 file changed, 82 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> > index 9c4af7d58846..a7b51a925e96 100644
> > --- a/drivers/irqchip/irq-sifive-plic.c
> > +++ b/drivers/irqchip/irq-sifive-plic.c
> > @@ -49,6 +49,8 @@
> >  #define CONTEXT_ENABLE_BASE		0x2000
> >  #define     CONTEXT_ENABLE_SIZE		0x80
> > 
> > +#define PENDING_BASE                    0x1000
> > +
> >  /*
> >   * Each hart context has a set of control registers associated with it.  Right
> >   * now there's only two: a source priority threshold over which the hart will
> > @@ -63,6 +65,7 @@
> >  #define	PLIC_ENABLE_THRESHOLD		0
> > 
> >  #define PLIC_QUIRK_EDGE_INTERRUPT	0
> > +#define PLIC_QUIRK_CLAIM_REGISTER	1
> > 
> >  struct plic_priv {
> >  	struct fwnode_handle *fwnode;
> > @@ -367,6 +370,82 @@ static const struct irq_domain_ops plic_irqdomain_ops = {
> >  	.free		= irq_domain_free_irqs_top,
> >  };
> > 
> > +static bool dp1000_isolate_pending_irq(int nr_irq_groups, u32 ie[],
> > +				       void __iomem *pending,
> > +				       void __iomem *enable)
> > +{
> > +	u32 pending_irqs = 0;
> > +	int i, j;
> > +
> > +	/* Look for first pending interrupt */
> > +	for (i = 0; i < nr_irq_groups; i++) {
> > +		pending_irqs = ie[i] & readl(pending + i * sizeof(u32));
> > +		if (pending_irqs)
> > +			break;
> > +	}
> > +
> > +	if (!pending_irqs)
> > +		return false;
> > +
> > +	/* Disable all interrupts but the first pending one */
> > +	for (j = 0; j < nr_irq_groups; j++) {
> > +		u32 new_mask = 0;
> > +
> > +		if (j == i)
> > +			/* Extract mask with lowest set bit */
> > +			new_mask = (pending_irqs & -pending_irqs);
> > +
> > +		writel(new_mask, enable + j * sizeof(u32));
> > +	}
> > +
> > +	return true;
> > +}
> > +
> > +static irq_hw_number_t dp1000_get_hwirq(struct plic_handler *handler,
> > +					void __iomem *claim)
> > +{
> > +	void __iomem *enable = handler->enable_base;
> > +	void __iomem *pending = handler->priv->regs + PENDING_BASE;
> > +	int nr_irqs = handler->priv->nr_irqs;
> > +	int nr_irq_groups = DIV_ROUND_UP(nr_irqs, 32);
> > +	int i;
> > +	u32 ie[32] = { 0 };
> > +	irq_hw_number_t hwirq = 0;
> > +
> > +	raw_spin_lock(&handler->enable_lock);
> > +
> > +	/* Save current interrupt enable state */
> > +	for (i = 0; i < nr_irq_groups; i++)
> > +		ie[i] = readl(enable + i * sizeof(u32));
> > +
> > +	if (!dp1000_isolate_pending_irq(nr_irq_groups, ie, pending, enable))
> > +		goto out;
> > +
> > +	hwirq = readl(claim);
> > +
> > +	/* Restore previous state */
> > +	for (i = 0; i < nr_irq_groups; i++)
> > +		writel(ie[i], enable + i * sizeof(u32));
> > +out:
> > +	raw_spin_unlock(&handler->enable_lock);
> > +	return hwirq;
> > +}
> > +
> > +static irq_hw_number_t plic_get_hwirq(struct plic_handler *handler,
> > +				      void __iomem *claim)
> > +{
> > +	/*
> > +	 * Due to a hardware bug in the implementation of the claim register
> > +	 * in the UltraRISC DP1000 platform, other interrupts must be disabled
> > +	 * before reading the claim register and restored afterwards.
> > +	 */
> > +
> > +	if (test_bit(PLIC_QUIRK_CLAIM_REGISTER, &handler->priv->plic_quirks))
> > +		return dp1000_get_hwirq(handler, claim);
> > +
> > +	return readl(claim);
> > +}
> > +
> >  /*
> >   * Handling an interrupt is a two-step process: first you claim the interrupt
> >   * by reading the claim register, then you complete the interrupt by writing
> > @@ -384,7 +463,7 @@ static void plic_handle_irq(struct irq_desc *desc)
> > 
> >  	chained_irq_enter(chip, desc);
> > 
> > -	while ((hwirq = readl(claim))) {
> > +	while ((hwirq = plic_get_hwirq(handler, claim))) {
> 
> This is the hot path for interrupt handling. Instead of checking for the quirk
> on every interrupt, please create a new function that you conditionally pass to
> irq_set_chained_handler(), so the quirk check only happens once at boot.
> 
> Regards,
> Samuel
> 
> >  		int err = generic_handle_domain_irq(handler->priv->irqdomain,
> >  						    hwirq);
> >  		if (unlikely(err)) {
> > @@ -432,6 +511,8 @@ static const struct of_device_id plic_match[] = {
> >  	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
> >  	{ .compatible = "thead,c900-plic",
> >  	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
> > +	{ .compatible = "ultrarisc,cp100-plic",
> > +	  .data = (const void *)BIT(PLIC_QUIRK_CLAIM_REGISTER) },
> >  	{}
> >  };
> > 
> > --
> > 2.51.0
> > 
> 

Is something like this closer to what you had in mind? I tried it on the
dp1000 and it doesn't work. Obviously it is concievable that I messed up
the logic here, but it also might be the case that reading the claim
register is integral to the proper functioning of the pending bits.

I can confirm that a more minimal change that just moves the quirk check
out of the hot path is fine. Would that be acceptable even if it is not
the most efficient? (in essense take the hunk with new functions from
the original patch but revert the change to `plic_handle_irq` and then add
the hunk that changes probe from this proposed patch and then create
the `plic_handle_irq_dp1000` function as a copy of `plic_handle_irq` where
`dp1000_get_hwirq` is in the loop instead of `readl(claim)`).

Best - Charlie

---
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 9c4af7d58846..fcf520ed33fd 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -49,6 +49,8 @@
 #define CONTEXT_ENABLE_BASE		0x2000
 #define     CONTEXT_ENABLE_SIZE		0x80
 
+#define PENDING_BASE                    0x1000
+
 /*
  * Each hart context has a set of control registers associated with it.  Right
  * now there's only two: a source priority threshold over which the hart will
@@ -63,6 +65,7 @@
 #define	PLIC_ENABLE_THRESHOLD		0
 
 #define PLIC_QUIRK_EDGE_INTERRUPT	0
+#define PLIC_QUIRK_CLAIM_REGISTER	1
 
 struct plic_priv {
 	struct fwnode_handle *fwnode;
@@ -367,6 +370,53 @@ static const struct irq_domain_ops plic_irqdomain_ops = {
 	.free		= irq_domain_free_irqs_top,
 };
 
+static int dp1000_find_pending_irq(struct plic_handler *handler, void __iomem *pending)
+{
+	void __iomem *enable = handler->enable_base;
+	int nr_irqs = handler->priv->nr_irqs;
+	int nr_irq_groups = DIV_ROUND_UP(nr_irqs, 32);
+	u32 pending_irqs = 0;
+	int i;
+
+	raw_spin_lock(&handler->enable_lock);
+	for (i = 0; i < nr_irq_groups; i++) {
+		u32 enable_mask = readl(enable + i * sizeof(u32));
+		u32 pending_mask = readl(pending + i * sizeof(u32));
+		if ((pending_irqs = enable_mask & pending_mask))
+			break;
+	}
+	raw_spin_unlock(&handler->enable_lock);
+
+	if (!pending_irqs)
+		return 0;
+
+	return 32 * i + __ffs(pending_irqs);
+}
+
+static void plic_handle_irq_dp1000(struct irq_desc *desc)
+{
+	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
+	void __iomem *pending = handler->priv->regs + PENDING_BASE;
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	irq_hw_number_t hwirq;
+
+	WARN_ON_ONCE(!handler->present);
+
+	chained_irq_enter(chip, desc);
+
+	while ((hwirq = dp1000_find_pending_irq(handler, pending))) {
+		int err = generic_handle_domain_irq(handler->priv->irqdomain,
+						    hwirq);
+		__plic_toggle(pending, hwirq, 0);
+		if (unlikely(err)) {
+			pr_warn_ratelimited("%pfwP: can't find mapping for hwirq %lu\n",
+					    handler->priv->fwnode, hwirq);
+		}
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
 /*
  * Handling an interrupt is a two-step process: first you claim the interrupt
  * by reading the claim register, then you complete the interrupt by writing
@@ -432,6 +482,8 @@ static const struct of_device_id plic_match[] = {
 	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
 	{ .compatible = "thead,c900-plic",
 	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
+	{ .compatible = "ultrarisc,dp1000-plic",
+	  .data = (const void *)BIT(PLIC_QUIRK_CLAIM_REGISTER) },
 	{}
 };
 
@@ -666,12 +718,16 @@ static int plic_probe(struct fwnode_handle *fwnode)
 		}
 
 		if (global_setup) {
+			void (*handler_fn)(struct irq_desc *) = plic_handle_irq;
+			if (test_bit(PLIC_QUIRK_CLAIM_REGISTER, &handler->priv->plic_quirks))
+				handler_fn = plic_handle_irq_dp1000;
+
 			/* Find parent domain and register chained handler */
 			domain = irq_find_matching_fwnode(riscv_get_intc_hwnode(), DOMAIN_BUS_ANY);
 			if (domain)
 				plic_parent_irq = irq_create_mapping(domain, RV_IRQ_EXT);
 			if (plic_parent_irq)
-				irq_set_chained_handler(plic_parent_irq, plic_handle_irq);
+				irq_set_chained_handler(plic_parent_irq, handler_fn);
 
 			cpuhp_setup_state(CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING,
 					  "irqchip/sifive/plic:starting",
-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
