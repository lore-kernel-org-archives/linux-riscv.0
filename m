Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A9EC369A2
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 16:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nTZ4tygXBdsmGGYO40Cm85MH9O1WA4U6aaPZ0oqQ6hE=; b=joXtv3OvoK4Sy/
	D9c+7YLxzPM0bNmcwvgvK6R5ymfZYNzOupd+oxkIGjUL97q77YrH1HEa+v0YJgaPC84z8inMxrRqD
	tuvjNhSdL1lS5vZhba3KbfN2GxysYZ0RDe5vf1KUsmwwc1BQp9+GJKWUb2O81KX9Jqbs1kAWqyN8P
	UujJHDFbqxNfmja2OSHPWWbkIUotOGtoqZm6h84iNTGCf7k9TtkS+xnTUDz10xVJE1WpbmlnfrNvF
	rKU2ypWUeQ/ZCXEGjrxL4RIekkBE7PrpnlopjfoXPf3eO01TOgnb0pjQMICcYl3DYZGlayFOX23In
	YmrN38iWKKO9iyioaReQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2BSz-00000004kFN-3dRI;
	Tue, 08 Apr 2025 16:06:25 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2BRu-00000004k1x-0DpC
	for linux-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 16:05:19 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3cfc8772469so27415715ab.3
        for <linux-riscv@lists.infradead.org>; Tue, 08 Apr 2025 09:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744128317; x=1744733117; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=asx87Qx3dDhJwSi+jaXzp4Fjsaj/1mX8qIAXGOc3zCg=;
        b=hWN7GpLestqw0oI3iNQRV1Sg9wwZOQA1zAfaZhOtb4scJ4Zt0EclTALFalBPVx+cum
         1osKOfeq5W2SB/002Qb/jvlfsDQJoG6bwc/DmkR5uaB995TQivtkMwy/gaqjqOY/+Pf2
         A9hQZgJYrA0+tVn63pu96Iiu8eVTpJBju3TvwLpzK/ocefdDjcg+kFiJBpzVu3Q3nu73
         ODhpLuyoihzaC1h6B9neroBB5ATIE4Js0swh6FP3tg73KBelvBxEv02MrB+ufq3X8L2y
         3gSvxdtkNmC7KTGcS/9bzlrZxfoANI/ozxYaG+KfMTlcBOx2nyRl58jE/aN3GumTzukL
         rFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744128317; x=1744733117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=asx87Qx3dDhJwSi+jaXzp4Fjsaj/1mX8qIAXGOc3zCg=;
        b=Arp1HMAMaYwzuXEpoTeh58kzfkUoWVKWNqFFso2dD7wSkBxARxsWr37ZI6x99c09cx
         8WKlTb1g0eUMUBYm+M/YfytZc92D54nGK19crARYb7dGPBQR5TIQ9mGpJO8RX97xJurq
         w2993Wrp0CgIGCr47JTIHT3L7FcNn6mhW/9TR/NgtwIHtF0DFIOzo7pHvOnuh4nlGx6b
         cNEEXk4otsRvsGUmpoJ3xqfHVsV7WmHoCOW+YHxHMc4YN0+DeUTdaYf11pshZyq1EYut
         d2AMuwX097uWcfvTf1Yl5EfNnCa1wSxTsqfFj9Q+KdLriaJzOU0nENH+v+5Re+F3q4ug
         BPoA==
X-Forwarded-Encrypted: i=1; AJvYcCVZe+5R9LtMNvbXbpV1u2RsQTLbLKcRYNDeF1hD9Iu2fBWmxilcTeOCY+WLKzn3BRdIequSYcoPA8g3bQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoACZeoMUwOLQDRljmhhb3nAl4Gnf46G81lVPXSNDiB7YK3RND
	Wkhf0L2xaM1H/YLvMsSU8tDnjPfpOVfQBB23I4Z71UmfPU9dTOYf2Ymi8MPW5As=
X-Gm-Gg: ASbGnctL4M4W+x2t+Z8PEfONLSl+297kcY3cizODfTHK7L7iEvEWr+uDVZdQuJQRQKy
	g3q5yRxfaDe/TdS9XYJU2qnLpQ/C8cXi1DOk998IUr7Fx+kAxC7/ONpxgjXUgfs3Kbl+QbsMs1Y
	HaVW96tb8If4zfOs3IbPC8aAjjt2MXUyNxZzC1NxBNWh1cAxJc3bCy5CsQmWwg/A/3WaH2jajiY
	uNYmguhjN6h+F6EywsCfKcFfzhaQCb6Ex9PccWFT6alCCU72ha0DUe2jtxWr8+AJgB5HnvbIse8
	FMV3oG4URS32BgbVwLwxXOoT4WfBzE3xNGUW6MIeJSVy1V0NVhOBlDFikC8YDrAIvUE2U3dGt/D
	euoUJsBZ5
X-Google-Smtp-Source: AGHT+IHYUfycAb1D6ob++UC+uXPgjcp9fEEnsdmzaco2ksSrRMK6BkV9YVek8HqOobEA+e4eRIUalA==
X-Received: by 2002:a05:6e02:160d:b0:3d3:dd32:73d5 with SMTP id e9e14a558f8ab-3d6e52f63c8mr180807355ab.4.1744128316639;
        Tue, 08 Apr 2025 09:05:16 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d703b9970dsm5159065ab.43.2025.04.08.09.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 09:05:16 -0700 (PDT)
Message-ID: <6790f337-8578-4ecb-b879-f5a254f109e6@riscstar.com>
Date: Tue, 8 Apr 2025 11:05:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] gpiolib: support parsing gpio three-cell interrupts
 scheme
To: Yixun Lan <dlan@gentoo.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Inochi Amaoto
 <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20250408-04-gpio-irq-threecell-v4-1-fd170d5e2d2b@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250408-04-gpio-irq-threecell-v4-1-fd170d5e2d2b@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_090518_301592_41772EF6 
X-CRM114-Status: GOOD (  32.98  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/8/25 10:11 AM, Yixun Lan wrote:
> gpio irq which using three-cell scheme should always call
> instance_match() function to find the correct irqdomain.
> 
> The select() function will be called with !DOMAIN_BUS_ANY,
> so for specific gpio irq driver, it need to set bus token
> explicitly, something like:
>    irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> In this patch [1], the GPIO controller add support for describing
> hardware with a three-cell scheme:
> 
>      gpios = <&gpio instance offset flags>;
> 
> It also result describing interrupts in three-cell as this in DT:
> 
>      node {
>              interrupt-parent = <&gpio>;
>              interrupts = <instance hwirq irqflag>;
>      }
> 
> This series try to extend describing interrupts with three-cell scheme.
> 
> The first patch will add capability for parsing irq number and flag
> from last two cells which eventually will support the three-cells
> interrupt, the second patch support finding irqdomain according to
> interrupt instance index.

Did you intend to send more than just one patch?	-Alex

> 
> Link: https://lore.kernel.org/all/20250225-gpio-ranges-fourcell-v3-0-860382ba4713@linaro.org [1]
> ---
> Changes in v4:
> - rebase patch [2/2] to gpio's for-next branch, no changes
> - drop [1/2] of patch v3 which merged into irq tree
> - Link to v3: https://lore.kernel.org/r/20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org
> 
> Changes in v3:
> - explicitly introduce *_twothreecell() to support 3 cell interrupt
> - Link to v2: https://lore.kernel.org/r/20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org
> 
> Changes in v2:
> - introduce generic irq_domain_translate_cells(), other inline cells function
> - hide the OF-specific things into gpiolib-of.c|h
> - Link to v1: https://lore.kernel.org/r/20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org
> ---
>   drivers/gpio/gpiolib-of.c |  8 ++++++++
>   drivers/gpio/gpiolib-of.h |  6 ++++++
>   drivers/gpio/gpiolib.c    | 22 ++++++++++++++++++----
>   3 files changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index f29143c71e9db61a6ad6d45d64e88a3f3f2d4fa7..3651c4178b81a1346809ec43b91a532e9f48af2b 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -1285,3 +1285,11 @@ void of_gpiochip_remove(struct gpio_chip *chip)
>   {
>   	of_node_put(dev_of_node(&chip->gpiodev->dev));
>   }
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
>   			       unsigned long *lookupflags);
>   int of_gpiochip_add(struct gpio_chip *gc);
>   void of_gpiochip_remove(struct gpio_chip *gc);
> +bool of_gpiochip_instance_match(struct gpio_chip *gc, unsigned int index);
>   int of_gpio_count(const struct fwnode_handle *fwnode, const char *con_id);
>   #else
>   static inline struct gpio_desc *of_find_gpio(struct device_node *np,
> @@ -33,6 +34,11 @@ static inline struct gpio_desc *of_find_gpio(struct device_node *np,
>   }
>   static inline int of_gpiochip_add(struct gpio_chip *gc) { return 0; }
>   static inline void of_gpiochip_remove(struct gpio_chip *gc) { }
> +static inline bool of_gpiochip_instance_match(struct gpio_chip *gc,
> +					      unsigned int index)
> +{
> +	return false;
> +}
>   static inline int of_gpio_count(const struct fwnode_handle *fwnode,
>   				const char *con_id)
>   {
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 8252a671d7208105a315bdc914acb092d5f95e79..ed8397a88dea1d92c3d4cb3cc9a6b30be29d31f6 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1507,9 +1507,8 @@ static int gpiochip_hierarchy_irq_domain_translate(struct irq_domain *d,
>   						   unsigned int *type)
>   {
>   	/* We support standard DT translation */
> -	if (is_of_node(fwspec->fwnode) && fwspec->param_count == 2) {
> -		return irq_domain_translate_twocell(d, fwspec, hwirq, type);
> -	}
> +	if (is_of_node(fwspec->fwnode))
> +		return irq_domain_translate_twothreecell(d, fwspec, hwirq, type);
>   
>   	/* This is for board files and others not using DT */
>   	if (is_fwnode_irqchip(fwspec->fwnode)) {
> @@ -1811,11 +1810,26 @@ static void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
>   	irq_set_chip_data(irq, NULL);
>   }
>   
> +static int gpiochip_irq_select(struct irq_domain *d, struct irq_fwspec *fwspec,
> +			       enum irq_domain_bus_token bus_token)
> +{
> +	struct fwnode_handle *fwnode = fwspec->fwnode;
> +	struct gpio_chip *gc = d->host_data;
> +	unsigned int index = fwspec->param[0];
> +
> +	if (fwspec->param_count == 3 && is_of_node(fwnode))
> +		return of_gpiochip_instance_match(gc, index);
> +
> +	/* Fallback for twocells */
> +	return (fwnode && (d->fwnode == fwnode) && (d->bus_token == bus_token));
> +}
> +
>   static const struct irq_domain_ops gpiochip_domain_ops = {
>   	.map	= gpiochip_irq_map,
>   	.unmap	= gpiochip_irq_unmap,
> +	.select	= gpiochip_irq_select,
>   	/* Virtually all GPIO irqchips are twocell:ed */
> -	.xlate	= irq_domain_xlate_twocell,
> +	.xlate	= irq_domain_xlate_twothreecell,
>   };
>   
>   static struct irq_domain *gpiochip_simple_create_domain(struct gpio_chip *gc)
> 
> ---
> base-commit: 9ed74dfa0822ba58eacaec61fb16bd4feb34a5a6
> change-id: 20250227-04-gpio-irq-threecell-66e1e073c806
> 
> Best regards,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
