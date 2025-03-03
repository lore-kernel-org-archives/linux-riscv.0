Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988F0C282D1
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 12:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iJw4Q2Zcnbkv31gnuzRbYZMU8hxwL7THpQfnQgZt62g=; b=kL2bkyPrao3gjv
	WOxS8MNOYfg/0zxCmnE5KX13Wb6UkLvCdddrdo1QaV1ajRYVyc5g2FoAH6GUs2jXRLuAmdWLYTW2h
	OtAtvp8I2nrYPEO8g2fifyo7nGAKrc5vtrVGChJXm1Jp/NOs38yyvGpEvlMz6HR2x9lOmY2A4xWJh
	M9kpOiVVmUxD9NbnjpXB2vSXgXNnI87iC+FL+ee2+qZdlNrQWGTvRMb0KnK8BOKFLo3SZys80fYF8
	yXNpGNEkD6PZGf7XghQi/uT0Q4mQDV7iyyYUcUSLsQccuPkuZMecAYMhgXrfQl7/40QCf3WRDCaxM
	Kxc6+wAiIzwIGna5CBbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5Cl-00000000njs-1F8f;
	Mon, 03 Mar 2025 12:47:31 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp55l-00000000m69-2UNx
	for linux-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 12:40:18 +0000
Received: from localhost (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 46A66342FEA;
	Mon, 03 Mar 2025 12:40:15 +0000 (UTC)
Date: Mon, 3 Mar 2025 12:40:11 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] irqdomain: support three-cell scheme interrupts
Message-ID: <20250303124011-GYA59067@gentoo>
References: <20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org>
 <20250302-04-gpio-irq-threecell-v2-1-34f13ad37ea4@gentoo.org>
 <87jz97cml1.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87jz97cml1.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_044017_673240_187CEC03 
X-CRM114-Status: GOOD (  31.56  )
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

Hello, Thomas Gleixner:

On 19:30 Sun 02 Mar     , Thomas Gleixner wrote:
> On Sun, Mar 02 2025 at 07:15, Yixun Lan wrote:
> > The is a prerequisite patch to support parsing three-cell
> > interrupts which encoded as <instance hwirq irqflag>,
> > the translate function will always retrieve irq number and
> > flag from last two cells.
> >
> > In this patch, we introduce a generic interrupt cells translation
> > function, others functions will be inline version.
> 
> Please read:
> 
>   https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#changelog
>   https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-changes
> 
> > +int irq_domain_translate_cells(struct irq_domain *d,
> > +			       struct irq_fwspec *fwspec,
> > +			       unsigned long *out_hwirq,
> > +			       unsigned int *out_type);
> 
> Please get rid of the extra line breaks. You have 100 (99) characters available.
> 
> > +static inline int irq_domain_translate_onecell(struct irq_domain *d,
> > +					       struct irq_fwspec *fwspec,
> > +					       unsigned long *out_hwirq,
> > +					       unsigned int *out_type)
> > +{
> > +	return irq_domain_translate_cells(d, fwspec, out_hwirq, out_type);
> > +}
> > +
> > +static inline int irq_domain_translate_twocell(struct irq_domain *d,
> > +					       struct irq_fwspec *fwspec,
> > +					       unsigned long *out_hwirq,
> > +					       unsigned int *out_type)
> > +{
> > +	return irq_domain_translate_cells(d, fwspec, out_hwirq, out_type);
> > +}
> > +
> > +static inline int irq_domain_translate_threecell(struct irq_domain *d,
> > +						 struct irq_fwspec *fwspec,
> > +						 unsigned long *out_hwirq,
> > +						 unsigned int *out_type)
> > +{
> > +	return irq_domain_translate_cells(d, fwspec, out_hwirq, out_type);
> > +}
> 
> What's this for? It's not used. The onecell/twocell wrappers are just
> there to keep the current code working.
>   
> > +int irq_domain_translate_cells(struct irq_domain *d,
> > +			       struct irq_fwspec *fwspec,
> > +			       unsigned long *out_hwirq,
> > +			       unsigned int *out_type)
> 
> Please remove the extra line breaks.
> 
> int irq_domain_translate_cells(struct irq_domain *d, struct irq_fwspec *fwspec,
> 			       unsigned long *out_hwirq, unsigned int *out_type)
> 
> is perfectly fine.
> 
> >  {
> > -	if (WARN_ON(fwspec->param_count < 1))
> > -		return -EINVAL;
> > -	*out_hwirq = fwspec->param[0];
> > -	*out_type = IRQ_TYPE_NONE;
> > -	return 0;
> > -}
> > -EXPORT_SYMBOL_GPL(irq_domain_translate_onecell);
> > +	unsigned int cells = fwspec->param_count;
> >  
> > -/**
> > - * irq_domain_translate_twocell() - Generic translate for direct two cell
> > - * bindings
> > - * @d:		Interrupt domain involved in the translation
> > - * @fwspec:	The firmware interrupt specifier to translate
> > - * @out_hwirq:	Pointer to storage for the hardware interrupt number
> > - * @out_type:	Pointer to storage for the interrupt type
> > - *
> > - * Device Tree IRQ specifier translation function which works with two cell
> > - * bindings where the cell values map directly to the hwirq number
> > - * and linux irq flags.
> > - */
> > -int irq_domain_translate_twocell(struct irq_domain *d,
> > -				 struct irq_fwspec *fwspec,
> > -				 unsigned long *out_hwirq,
> > -				 unsigned int *out_type)
> > -{
> > -	if (WARN_ON(fwspec->param_count < 2))
> > +	switch (cells) {
> > +	case 1:
> > +		*out_hwirq = fwspec->param[0];
> > +		*out_type = IRQ_TYPE_NONE;
> > +		return 0;
> > +	case 2 ... 3:
> 
> I have second thoughts about this when looking deeper.
> 
> The current one/two cell implementations validate that param_count is at
> least the number of parameters. Which means that the parameter count
> could be larger, but only evaluates the first one or the first two.
> 
> I have no idea whether this matters or not, but arguably a two cell
> fwspec could be successfully fed into translate_onecell(), no?
> 
> And that triggers a related question.
> 
> Why is the three cell translation not following the one/two cell scheme
> and has the parameters at the same place (index 0,1), i.e. adding the
> extra information at the end? That makes sense to me as the extra cell
> is obviously not directly related to the interrupt mapping.

this from gpio DT
 gpios = <&gpio instance offset flags>;

I think we currently just following the scheme with gpio cells order
scheme, which is (index(instance) offset flag..), the index and offset
are parameters to locate the irq which can easily derive from global
gpio pin number, so I thought it's more intuitive to group them 
orderly together..

But you really raise a good suggestion here, if we follow appending extra
information at the end, then it will make threecell translate scheme
compatible with twocell, which mean we don't really need extra function
to prase, and can eventually drop this patch, I personally like this direction.

hi, Linus Walleij, what do you think on this?

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
