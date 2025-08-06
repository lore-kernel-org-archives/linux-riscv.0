Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFC2C87FD3
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 12:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=awKRaiGOvGYRw9qVKyHH+5WocC6BjqjfIHy0jigkwGc=; b=JwMnkh+TzE4tg8
	jVJ74LdfodjVmswy2Mfi/kRtE0Y2R/+IRUOU4crBz6qN+9K3O93bdII1eMy/R6KR44R0upKgVNP1K
	WLIcude8SzrD7XQrAQeHM7mJFJ8L4e+e912+ZwbHaQmyag1RWMYir+g0upPvNpRofStTB69B0SUhD
	UZCG5348Y4bW04hmcbeurIUIw/bzP02NHyp8SfOPHtoJ2z41bXN/f3uLfQeOlIIMEH27dPcNGZFua
	X2pnad7+GdyBnM37IWHfkLs9n9KIIO0oNY6gSP3tqK7u5DxNjtqSzNx6ndBN2b588Lkm99OCDZvf2
	okXNL5fB2kkIolT3m6QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujdd6-0000000FDjr-2Q2H;
	Wed, 06 Aug 2025 12:52:28 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujdd3-0000000FDjO-1zGj
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 12:52:26 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754484743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0CKuWwc8CcpCiwTOGLaSnMeZDqSZ/wmtXkBLoQP2sYc=;
	b=sseoPFcmkbJ2G8RRqBxtnK8D3MNOOdYheUVEPitt71mNv+Qx2K3wdNqjCv9xC2hM+ADLN5
	mVS4Vd1MCKKy5F24+qeSGqIc/Dl3Mu9vJP8QAS91fl7XGInqoVF1H3AKnqopDJz+E49Nxp
	x1KrE0BP+8VfiNiBjEJs7oSf3v6VaA0FUXikYoDKXg3s28N4zPagKILNz+8ersDLlZtxGq
	3IQy30EMEWtN4AarHuFGhPMdsZbFysaFx+6SYjzMbZQ16p+f2s9gu1715ycreGUwJD8X5O
	D+r3LlP0POjQThXJ/Q6AYNWgM5iU1oyLGOV+6NbfjxgR803AOSf0MTZyf/3/XQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754484743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0CKuWwc8CcpCiwTOGLaSnMeZDqSZ/wmtXkBLoQP2sYc=;
	b=ri+P72jvs7QNehwNlK37VH6ihStxWlQgEN4D+EAxsflPMoQPYJjVe/iTOuNTyxUzH9Plet
	rUsSeLXXlQ+D2iAw==
To: Nick Hu <nick.hu@sifive.com>, anup@brainfault.org, Alexandre Ghiti
 <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Nick Hu <nick.hu@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v2 2/2] irqchip/riscv-aplic: Save and restore APLIC
 registers
In-Reply-To: <20250806082726.8835-3-nick.hu@sifive.com>
References: <20250806082726.8835-1-nick.hu@sifive.com>
 <20250806082726.8835-3-nick.hu@sifive.com>
Date: Wed, 06 Aug 2025 14:52:23 +0200
Message-ID: <875xf0eho8.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_055225_658377_4B4EDDD4 
X-CRM114-Status: GOOD (  25.42  )
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

On Wed, Aug 06 2025 at 16:27, Nick Hu wrote:
> The APLIC may be powered down when the CPUs enter a deep sleep state.
> Therefore adding the APLIC save and restore functions to save and
> restore the states of APLIC.

Same comments vs. subject and change log.

>  
> +void aplic_direct_restore(struct aplic_priv *priv)
> +{
> +	struct aplic_direct *direct =
> +			container_of(priv, struct aplic_direct, priv);

No line break required.

> +	int cpu;
> +
> +	for_each_cpu(cpu, &direct->lmask)
> +		aplic_idc_set_delivery(per_cpu_ptr(&aplic_idcs, cpu), true);
> +static LIST_HEAD(aplics);
> +
> +static void aplic_restore(struct aplic_priv *priv)
> +{
> +	int i;
> +	u32 clrip;

See the documentation I linked you to and look for the chapter about
variable declarations.

> +	writel(priv->saved_domaincfg, priv->regs + APLIC_DOMAINCFG);
> +#ifdef CONFIG_RISCV_M_MODE
> +	writel(priv->saved_msiaddr, priv->regs + APLIC_xMSICFGADDR);
> +	writel(priv->saved_msiaddrh, priv->regs + APLIC_xMSICFGADDRH);
> +#endif
> +	for (i = 1; i <= priv->nr_irqs; i++) {
> +		writel(priv->saved_sourcecfg[i - 1],
> +		       priv->regs + APLIC_SOURCECFG_BASE +
> +		       (i - 1) * sizeof(u32));
> +		writel(priv->saved_target[i - 1],
> +		       priv->regs + APLIC_TARGET_BASE +
> +		       (i - 1) * sizeof(u32));

Sorry, but this is incomprehensible garbage.

Why are you starting with i = 1 when you subtract 1 from i at every
usage site?

        u32 __iomem *regs = priv->regs;
        for (i = 0; i < priv->nr_irqs; i++, regs++) {
        	writel(priv->saved_sourcecfg[i], regs + APLIC_SOURCECFG_BASE);        
        	writel(priv->saved_target[i], regs + APLIC_TARGET_BASE);        
	}

See?

> +	}
> +
> +	for (i = 0; i <= priv->nr_irqs; i += 32) {

Off by one. This needs to be i < priv->nr_irqs, no?

> +		writel(-1U, priv->regs + APLIC_CLRIE_BASE +
> +			    (i / 32) * sizeof(u32));
> +		writel(priv->saved_ie[i / 32],
> +		       priv->regs + APLIC_SETIE_BASE +
> +		       (i / 32) * sizeof(u32));
> +	}
> +
> +	if (priv->nr_idcs) {
> +		aplic_direct_restore(priv);
> +	} else {
> +		/* Re-trigger the interrupts */
> +		for (i = 0; i <= priv->nr_irqs; i += 32) {

Same here

> +			clrip = readl(priv->regs + APLIC_CLRIP_BASE +
> +				      (i / 32) * sizeof(u32));
> +			writel(clrip, priv->regs + APLIC_SETIP_BASE +
> +				      (i / 32) * sizeof(u32));
> +		}

And this can properly be combined into:

        u32 __iomem *regs = priv->regs;

        for (i = 0; i < priv->nr_irqs; i += 32, regs++) {
		writel(-1U, regs + APLIC_CLRIE_BASE);
                writel(priv->saved_ie[i / 32], regs + APLIC_SETIE_BASE);

                if (!priv->nr_idcs)
                        writel(readl(regs + APLOC_CLRIP_BASE), regs + APLIC_SETIP_BASE);
	}

        if (priv->nr_idcs)
		aplic_direct_restore(priv);

No?

> +}
> +
> +static void aplic_save(struct aplic_priv *priv)
> +{
> +	int i;
> +
> +	for (i = 1; i <= priv->nr_irqs; i++) {
> +		priv->saved_target[i - 1] = readl(priv->regs +
> +						  APLIC_TARGET_BASE +
> +						  (i - 1) * sizeof(u32));
> +	}

Oh well...

> +
> +	for (i = 0; i <= priv->nr_irqs; i += 32) {

Off by one again ...

> +		priv->saved_ie[i / 32] = readl(priv->regs +
> +					       APLIC_SETIE_BASE +
> +					       (i / 32) * sizeof(u32));
> +	}
> +}
> +
> +static int aplic_syscore_suspend(void)
> +{
> +	struct aplic_priv *priv;
> +
> +	list_for_each_entry(priv, &aplics, head) {
> +		aplic_save(priv);
> +	}

Superflous brackets

> +
> +	return 0;
> +}
> +
> +static void aplic_syscore_resume(void)
> +{
> +	struct aplic_priv *priv;
> +
> +	list_for_each_entry(priv, &aplics, head) {
> +		aplic_restore(priv);
> +	}

Ditto

> +}
> +
> +static struct syscore_ops aplic_syscore_ops = {
> +	.suspend = aplic_syscore_suspend,
> +	.resume = aplic_syscore_resume,

See documentation about struct definitions and initializers

> +};
> +
> +static int aplic_pm_notifier(struct notifier_block *nb, unsigned long action, void *data)
> +{
> +	struct aplic_priv *priv = container_of(nb, struct aplic_priv, genpd_nb);
> +
> +	switch (action) {
> +	case GENPD_NOTIFY_PRE_OFF:
> +		aplic_save(priv);
> +		break;
> +	case GENPD_NOTIFY_ON:
> +		aplic_restore(priv);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static void aplic_remove(void *data)
> +{
> +	struct aplic_priv *priv = data;
> +
> +	list_del(&priv->head);

How is this list operation serialized?

> +	dev_pm_genpd_remove_notifier(priv->dev);
> +}
> +
> +static int aplic_add(struct device *dev, struct aplic_priv *priv)
> +{
> +	int ret;
> +
> +	list_add(&priv->head, &aplics);
> +	/* Add genpd notifier */
> +	priv->genpd_nb.notifier_call = aplic_pm_notifier;
> +	ret = dev_pm_genpd_add_notifier(dev, &priv->genpd_nb);
> +	if (ret && ret != -ENODEV && ret != -EOPNOTSUPP) {

What is this magic about? Lacks explanation and rationale.

> +		list_del(&priv->head);
> +		return ret;

...

> +	/* For power management */
> +	priv->saved_target = devm_kzalloc(dev, priv->nr_irqs * sizeof(u32),
> +					  GFP_KERNEL);
> +	if (!priv->saved_target)
> +		return -ENOMEM;
> +
> +	priv->saved_sourcecfg = devm_kzalloc(dev, priv->nr_irqs * sizeof(u32),
> +					     GFP_KERNEL);
> +	if (!priv->saved_sourcecfg)
> +		return -ENOMEM;
> +
> +	priv->saved_ie = devm_kzalloc(dev,
> +				      DIV_ROUND_UP(priv->nr_irqs, 32) * sizeof(u32),
> +				      GFP_KERNEL);
> +	if (!priv->saved_ie)
> +		return -ENOMEM;

Seriously? You allocate all of this seperately? Ever heard about the
concept of data structures?

struct savedregs {
	u32	target;
        u32	source;
        u32	ie;
};

        priv->savedregs = devm_kcalloc(dev, priv->nr_irqs, sizeof(*priv->savedregs, GFP_KERNEL);
    
Yes, I know you don't need as many ie registers, but that's not a
problem at all. You just need to write/read to/from index 0, 32, 64 ...

And your restore muck boils down to a single loop:

        u32 __iomem *regs = priv->regs;
        for (i = 0; i < priv->nr_irqs; i++, regs++) {
        	writel(priv->savedregs->source[i], regs + APLIC_SOURCECFG_BASE);        
        	writel(priv->savedregs->target[i], regs + APLIC_TARGET_BASE);

                if (i % 32)
                	continue;

		writel(-1U, regs + APLIC_CLRIE_BASE);
                writel(priv->saved_ie[i], regs + APLIC_SETIE_BASE);
                if (!priv->nr_idcs)
                        writel(readl(regs + APLOC_CLRIP_BASE), regs + APLIC_SETIP_BASE);
	}

That's too comprehensible, right?

>  struct aplic_priv {
> +	struct list_head	head;

Why needs this to be at the top?

There is no reason at all. Not that it matters much as this data
structure is a trainwreck vs. cacheline efficiency anyway.

>  	struct device		*dev;
>  	u32			gsi_base;
>  	u32			nr_irqs;
> @@ -31,6 +32,15 @@ struct aplic_priv {
>  	u32			acpi_aplic_id;
>  	void __iomem		*regs;
>  	struct aplic_msicfg	msicfg;
> +	struct notifier_block	genpd_nb;
> +	u32 *saved_target;

So you aligned @head and @genpd_nb, but then you use random formatting
to turn this into visual clutter.

I'm amazed that this lot has received three Reviewed-by tags and nobody
found even the slightest issue with it. Oh well.

Thanks,

        tglx


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
