Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4DC2C021B8
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Mar 2025 23:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MUqe84SnJD5ejKPOkSyJjDa/UOIwzWcdJCMe7ttBZ1I=; b=3X4sAwJy4Fi6Zh
	Y6OaaYKA7r/WCX647phrr5WL2Ep2LEk3B2h4eFYTnAuRvlI9gB/4jm/QK0fuZFPVZPXToFobdgxbM
	p3n6LVWGpork5pkBdQX9jCNfAIrEpuAxu/3IgyXo6QOxbtABKQ9Isn1pifV7sCkhm8JenGZPZSa0h
	IHBPo/vpBsRJVqv0a4LiNo73OUPY27fam6/j+mQyf7SuV0ag6ZXOBj3VbWJMdDG+MHKyOdDtwcsvG
	30WKZ3Bf+ls2j1RoxNoVihEyIFcrruycG0MGYM0beIz/JQBg2wO92r7ygxBEiISULlHd7f4KQa5qv
	OF1R7Patu8ZnxBdRrYAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toWHH-0000000F5B5-3VGH;
	Sat, 01 Mar 2025 23:29:51 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toWHF-0000000F5Ak-37pI
	for linux-riscv@lists.infradead.org;
	Sat, 01 Mar 2025 23:29:51 +0000
Received: from localhost (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 8A58A343152;
	Sat, 01 Mar 2025 23:29:48 +0000 (UTC)
Date: Sat, 1 Mar 2025 23:29:44 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 2/2] gpiolib: support parsing gpio three-cell
 interrupts scheme
Message-ID: <20250301232944-GYA55471@gentoo>
References: <20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org>
 <20250302-04-gpio-irq-threecell-v2-2-34f13ad37ea4@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250302-04-gpio-irq-threecell-v2-2-34f13ad37ea4@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_152949_948758_47D95B48 
X-CRM114-Status: GOOD (  26.85  )
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

Hi Linus, Thomas:

On 07:15 Sun 02 Mar     , Yixun Lan wrote:
> gpio irq which using three-cell scheme should always call
> instance_match() function to find the correct irqdomain.
> 
> The select() function will be called with !DOMAIN_BUS_ANY,
> so for specific gpio irq driver, it need to set bus token
> explicitly, something like:
>   irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/gpio/gpiolib-of.c |  8 ++++++++
>  drivers/gpio/gpiolib-of.h |  6 ++++++
>  drivers/gpio/gpiolib.c    | 23 +++++++++++++++++++----
>  3 files changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 2e537ee979f3e2b6e8d5f86f3e121a66f2a8e083..e19904569fb1b71c1fff237132d17050ef02b074 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -1187,3 +1187,11 @@ void of_gpiochip_remove(struct gpio_chip *chip)
>  {
>  	of_node_put(dev_of_node(&chip->gpiodev->dev));
>  }
> +
> +bool of_gpiochip_instance_match(struct gpio_chip *gc, unsigned int index)
> +{
> +	if (gc->of_node_instance_match)
> +		return gc->of_node_instance_match(gc, index);
> +
> +	return false;
> +}
> diff --git a/drivers/gpio/gpiolib-of.h b/drivers/gpio/gpiolib-of.h
> index 16d6ac8cb156c02232ea868b755bbdc46c78e3c7..3eebfac290c571e3b90e4437295db8eaacb021a3 100644
> --- a/drivers/gpio/gpiolib-of.h
> +++ b/drivers/gpio/gpiolib-of.h
> @@ -22,6 +22,7 @@ struct gpio_desc *of_find_gpio(struct device_node *np,
>  			       unsigned long *lookupflags);
>  int of_gpiochip_add(struct gpio_chip *gc);
>  void of_gpiochip_remove(struct gpio_chip *gc);
> +bool of_gpiochip_instance_match(struct gpio_chip *gc, unsigned int index);
>  int of_gpio_count(const struct fwnode_handle *fwnode, const char *con_id);
>  #else
>  static inline struct gpio_desc *of_find_gpio(struct device_node *np,
> @@ -33,6 +34,11 @@ static inline struct gpio_desc *of_find_gpio(struct device_node *np,
>  }
>  static inline int of_gpiochip_add(struct gpio_chip *gc) { return 0; }
>  static inline void of_gpiochip_remove(struct gpio_chip *gc) { }
> +static inline bool of_gpiochip_instance_match(struct gpio_chip *gc,
> +					      unsigned int index)
> +{
> +	return false;
> +}
>  static inline int of_gpio_count(const struct fwnode_handle *fwnode,
>  				const char *con_id)
>  {
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 679ed764cb143c4b3357106de1570e8d38441372..266be465b9103c17861a0d76f2dfbf1f1de3a073 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1449,10 +1449,9 @@ static int gpiochip_hierarchy_irq_domain_translate(struct irq_domain *d,
>  						   unsigned long *hwirq,
>  						   unsigned int *type)
>  {
> -	/* We support standard DT translation */
> -	if (is_of_node(fwspec->fwnode) && fwspec->param_count == 2) {
> -		return irq_domain_translate_twocell(d, fwspec, hwirq, type);
> -	}
> +	/* We support standard DT translation up to three cells */
> +	if (is_of_node(fwspec->fwnode))
> +		return irq_domain_translate_cells(d, fwspec, hwirq, type);

I'm not sure if you like this way for calling generic cells parser here,
as it should work for 1, 2, 3 cells model, which save a few lines meanwhile

otherwise we end something like

	if (is_of_node(fwspec->fwnode) {
		if (fwspec->param_count == 2) {
			return irq_domain_translate_twocell(d, fwspec, hwirq, type);
		if (fwspec->param_count == 3) {
			return irq_domain_translate_threecell(d, fwspec, hwirq, type);
	}
>  
>  	/* This is for board files and others not using DT */
>  	if (is_fwnode_irqchip(fwspec->fwnode)) {
> @@ -1754,9 +1753,25 @@ static void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
>  	irq_set_chip_data(irq, NULL);
>  }
>  
> +static int gpiochip_irq_select(struct irq_domain *d, struct irq_fwspec *fwspec,
> +			enum irq_domain_bus_token bus_token)
> +{
> +	struct fwnode_handle *fwnode = fwspec->fwnode;
> +	struct gpio_chip *gc = d->host_data;
> +	unsigned int index = fwspec->param[0];
> +
> +	if (fwspec->param_count == 3 && is_of_node(fwnode))
> +		return of_gpiochip_instance_match(gc, index);
> +
> +	/* Fallback for twocells */
> +	return ((fwnode != NULL) && (d->fwnode == fwnode) &&
> +		(d->bus_token == bus_token));
> +}
> +
>  static const struct irq_domain_ops gpiochip_domain_ops = {
>  	.map	= gpiochip_irq_map,
>  	.unmap	= gpiochip_irq_unmap,
> +	.select	= gpiochip_irq_select,
>  	/* Virtually all GPIO irqchips are twocell:ed */
>  	.xlate	= irq_domain_xlate_twocell,
>  };
> 
> -- 
> 2.48.1
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
