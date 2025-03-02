Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EC8C19F32
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Mar 2025 18:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=10DwFINrzg2eYCt6BSHq16tmWQRLyRWPcR0vrGY2XqA=; b=IJwShQekvzk45f
	zBOZLydRucT4ECfT23ZUGH2LAIm9GP5a8kjBmrVpJikS9awyR0Q022lM5EhV7Gt9UKwSFBrtk8cWa
	Memxye5UkRUeC8wRfQbG0pbEfM7OU5468NnS5syqfJBDi9WghTov8NeWa6a7mnUMa6Qvfj7XJU//b
	Ft/72RGEK8n4wcImHEnsro/wgQtGG3bUSTNX7U3ZmKOCLgFcR5yCA58gV8ge/lODSyG0ii2NTc7oK
	sS5XPaqSi77z+I3D90nxtxdXuTt7EPGyYbhLauEZxE0bBys4Us5iaeRcVETAnqGGvxcTMM83jXjAv
	pl9eYT7xAwHHzlaKVk6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1too4p-0000000GVdb-0T4H;
	Sun, 02 Mar 2025 18:30:11 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1too4l-0000000GVcf-20g3
	for linux-riscv@lists.infradead.org;
	Sun, 02 Mar 2025 18:30:09 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1740940203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OggkcNn0CKOnNyjOJiAOPJdtTYiXPnknmr72FoMHxZc=;
	b=JhEE6Sy92xvRpi//F5igT/6cPmqXPmLe/QshCEQQ3REbTHsRQr4nre5lJ1WCun3DjdYG6F
	KKyg66ToZ42msupKberz8GFdM+QuLl7DrvgjQY7DV1+SiEHf4s6QbegDwAhbpuTCn53t77
	uMM9hRM4LQDfabTuG1cflmukMKaY6b+ktMTdz6iE5RlbwufQvMsh6TBM1nAVO+KR3Sm7Ta
	AkSCREWwwElbR6MwrDG9v6Unet7jv8Y95sBSmAYR6p7BV4y3pQQsafOYfGSd/I9iiTq2jA
	B4e9PNywJsvTy9RL4o9DHsaHLGd3QA+/XeMkJDaUQQoe7TSZdxotOy+sVIsfxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1740940203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OggkcNn0CKOnNyjOJiAOPJdtTYiXPnknmr72FoMHxZc=;
	b=cnsHIUzQ8LaG99IMzMzRq3TW5s/YJNrrnQrjXdu6MZqsbYBoGVwGrCgqcGvwd0dlwP1LmQ
	xSlaxbgGOJWtvdBQ==
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan
 <dlan@gentoo.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] irqdomain: support three-cell scheme interrupts
In-Reply-To: <20250302-04-gpio-irq-threecell-v2-1-34f13ad37ea4@gentoo.org>
References: <20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org>
 <20250302-04-gpio-irq-threecell-v2-1-34f13ad37ea4@gentoo.org>
Date: Sun, 02 Mar 2025 19:30:02 +0100
Message-ID: <87jz97cml1.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_103007_813851_6B3CD9CE 
X-CRM114-Status: GOOD (  21.98  )
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

On Sun, Mar 02 2025 at 07:15, Yixun Lan wrote:
> The is a prerequisite patch to support parsing three-cell
> interrupts which encoded as <instance hwirq irqflag>,
> the translate function will always retrieve irq number and
> flag from last two cells.
>
> In this patch, we introduce a generic interrupt cells translation
> function, others functions will be inline version.

Please read:

  https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#changelog
  https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-changes

> +int irq_domain_translate_cells(struct irq_domain *d,
> +			       struct irq_fwspec *fwspec,
> +			       unsigned long *out_hwirq,
> +			       unsigned int *out_type);

Please get rid of the extra line breaks. You have 100 (99) characters available.

> +static inline int irq_domain_translate_onecell(struct irq_domain *d,
> +					       struct irq_fwspec *fwspec,
> +					       unsigned long *out_hwirq,
> +					       unsigned int *out_type)
> +{
> +	return irq_domain_translate_cells(d, fwspec, out_hwirq, out_type);
> +}
> +
> +static inline int irq_domain_translate_twocell(struct irq_domain *d,
> +					       struct irq_fwspec *fwspec,
> +					       unsigned long *out_hwirq,
> +					       unsigned int *out_type)
> +{
> +	return irq_domain_translate_cells(d, fwspec, out_hwirq, out_type);
> +}
> +
> +static inline int irq_domain_translate_threecell(struct irq_domain *d,
> +						 struct irq_fwspec *fwspec,
> +						 unsigned long *out_hwirq,
> +						 unsigned int *out_type)
> +{
> +	return irq_domain_translate_cells(d, fwspec, out_hwirq, out_type);
> +}

What's this for? It's not used. The onecell/twocell wrappers are just
there to keep the current code working.
  
> +int irq_domain_translate_cells(struct irq_domain *d,
> +			       struct irq_fwspec *fwspec,
> +			       unsigned long *out_hwirq,
> +			       unsigned int *out_type)

Please remove the extra line breaks.

int irq_domain_translate_cells(struct irq_domain *d, struct irq_fwspec *fwspec,
			       unsigned long *out_hwirq, unsigned int *out_type)

is perfectly fine.

>  {
> -	if (WARN_ON(fwspec->param_count < 1))
> -		return -EINVAL;
> -	*out_hwirq = fwspec->param[0];
> -	*out_type = IRQ_TYPE_NONE;
> -	return 0;
> -}
> -EXPORT_SYMBOL_GPL(irq_domain_translate_onecell);
> +	unsigned int cells = fwspec->param_count;
>  
> -/**
> - * irq_domain_translate_twocell() - Generic translate for direct two cell
> - * bindings
> - * @d:		Interrupt domain involved in the translation
> - * @fwspec:	The firmware interrupt specifier to translate
> - * @out_hwirq:	Pointer to storage for the hardware interrupt number
> - * @out_type:	Pointer to storage for the interrupt type
> - *
> - * Device Tree IRQ specifier translation function which works with two cell
> - * bindings where the cell values map directly to the hwirq number
> - * and linux irq flags.
> - */
> -int irq_domain_translate_twocell(struct irq_domain *d,
> -				 struct irq_fwspec *fwspec,
> -				 unsigned long *out_hwirq,
> -				 unsigned int *out_type)
> -{
> -	if (WARN_ON(fwspec->param_count < 2))
> +	switch (cells) {
> +	case 1:
> +		*out_hwirq = fwspec->param[0];
> +		*out_type = IRQ_TYPE_NONE;
> +		return 0;
> +	case 2 ... 3:

I have second thoughts about this when looking deeper.

The current one/two cell implementations validate that param_count is at
least the number of parameters. Which means that the parameter count
could be larger, but only evaluates the first one or the first two.

I have no idea whether this matters or not, but arguably a two cell
fwspec could be successfully fed into translate_onecell(), no?

And that triggers a related question.

Why is the three cell translation not following the one/two cell scheme
and has the parameters at the same place (index 0,1), i.e. adding the
extra information at the end? That makes sense to me as the extra cell
is obviously not directly related to the interrupt mapping.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
