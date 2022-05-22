Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411FDC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 23 May 2022 08:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6DwRsK3WF8Mqh7wVth0cYw35pGiI/Ul6L+ghK43Hva0=; b=cyWqZ0vqScuMqf
	pzitisBMRmiynYOizUoitJYaEy06/H6zNbPsk6ZJ/4KVB9QcUrZDd2SsgKIauucyEDZ+I0vjnsXCO
	qTRrJjAluZvT8qpwvl6QyYnouf++1VfqOmOoix8PkLa1t+sYXckglNZVmy9fwEWTFX/URhSCu9BpO
	bNNtmudrpLM4J8985yqDBc4fDtFn7ClOM1If1Rb0K5Je3pe8IfULEWafu9piis8de2d4CXz3kh9KS
	0d+ouxGkQzrBNF5tLBkqKwx70BcHEuzpMnZtCemjR7gZfJEljYX3Yq9GDCy4YDhNd8Rbsr6vXjO1F
	D0UHA+3jlXJovykj55Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt3ZB-002UcX-Es; Mon, 23 May 2022 08:37:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt32c-002GHj-TT
 for linux-riscv@bombadil.infradead.org; Mon, 23 May 2022 08:03:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=lWll2HLJ8E68D1ZMX24mVL0ZYsDnBwKFL3FZwiDRl5I=; b=EjFmVpbggZwt4+nfFgJEwkdYeQ
 TEnuQJeGpWey4PnFq+kvtlEcCMKef2adHpl7W3i+DsZ/0ar2ihjBpDCakyMDnAssd2MTYIKLpCV4j
 lRIhIY25zpOA4aXLiNGbLn5nUVF5SQywKHmC48lVLfr51D1iKKQmOtPqatmc/Je8x6y1I+PS7iila
 Pyh0REFe4CbdK6WAfe4R4C2MYOXMEQDuWIyDe5oEtgHEVibbnXbvi+seLo8eRmRp0N8q+EUAe+JNQ
 QvWkhZy1tx4uwTTi26jNvOThZwdKTHSvsYnhKXxrHpiv8jsHRCC303uQ8HfskokeEI/cwUae6/sfB
 5q+9ttBg==;
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsssj-000dZz-5m
 for linux-riscv@lists.infradead.org; Sun, 22 May 2022 21:12:59 +0000
Received: by mail-lf1-x136.google.com with SMTP id u23so22544651lfc.1
 for <linux-riscv@lists.infradead.org>; Sun, 22 May 2022 14:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lWll2HLJ8E68D1ZMX24mVL0ZYsDnBwKFL3FZwiDRl5I=;
 b=RVNnRi2/vL4kT9h+O5Ks7YXx5CHonP28XnBAAbZHgJSFCAYfgKVjUZFaL3HR5fCBMQ
 9uoxssTTnrUpus8vID/3wZvX94ZtdEZmeVuvUDjemriAmEEa2n3QCtTlt25Aefmakxvd
 QVldtkE6hVA4DCPyz499bUU+p/7TwJWA6fnG8Y2Pe7x5cO74pSUFy1kwfIXbKxvkjfaZ
 bWejnQdVsJu/7/V5T0c6A4ptNXs+nKpk2QI+ihO0JIUVZRocj1SbBOCCLh9yDK099U7L
 h9YuBlAdNs3US+54oBDvse//kjUA9oUmiFS5UeBQmwn9IVU+Mr1xMlZ4YAE0HPDCWQMQ
 Tr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lWll2HLJ8E68D1ZMX24mVL0ZYsDnBwKFL3FZwiDRl5I=;
 b=XcTD//9GIqM5fPTznQBY6jg7nVDI4kpsmmqY8f9Jy/N6kwZwoZhoMdlfjPT1AbnOjP
 ZiitRsk8gMqXIzyF3tT56N2RWNOgfVMYkBmnH9Z+Qj+AOIUeZ4s+ppFpyRvdjODAGEMS
 HGvqlr8/4dJ037ji5Lc/v6EeietsJK92oPEJs4pgEUJGErBEuPdd3uM1CiXEBVwWrn4U
 eH46Vy7a/Yh4sWNQBVubWvsLSxDl0a9SEah3QvisK5ldaPHD/FkU39+l2hXFiMpqGJaZ
 CPNGaGADQ+gkBCrIKIbIfYR+4S5vnHgmPI2v7zFAkdW1n2fCyIkiqmoJntNMs8Ea+AT9
 ZX/w==
X-Gm-Message-State: AOAM53364Zis50rLJ6fdiht7SyZLraarBM3Vxm6RaxR57Qko/6zRXcuW
 S1S6bB0vmTK6yMFlg4YKOL0=
X-Google-Smtp-Source: ABdhPJyQxgk2BvbT3VAUTOg3igZViSIE0BxoU3BthOrwHuJ7qyArITVch0GigjRPaBmiP7PAg3Uk6Q==
X-Received: by 2002:a05:6512:230f:b0:478:6c52:1646 with SMTP id
 o15-20020a056512230f00b004786c521646mr2661025lfu.494.1653253851025; 
 Sun, 22 May 2022 14:10:51 -0700 (PDT)
Received: from mobilestation ([95.79.189.214])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a0565123b8a00b004785abcb0e0sm992081lfv.78.2022.05.22.14.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 May 2022 14:10:50 -0700 (PDT)
Date: Mon, 23 May 2022 00:10:48 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Hoan Tran <hoan@os.amperecomputing.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Marc Zyngier <maz@kernel.org>, linux-gpio@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH] gpio: dwapb: Make the irqchip immutable
Message-ID: <20220522211048.5n6krpzgc4hzv4jg@mobilestation>
References: <e6380b316db23ee03a9adbf0a7d1ad83538f9961.1652884676.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e6380b316db23ee03a9adbf0a7d1ad83538f9961.1652884676.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220522_221257_644505_6FB59576 
X-CRM114-Status: GOOD (  20.71  )
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

On Wed, May 18, 2022 at 04:39:42PM +0200, Geert Uytterhoeven wrote:
> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning to indicate if the gpiolib is altering the
> internals of irqchips.  Following this change the following warning is
> now observed for the dwapb driver:
> 
>     gpio gpiochip0: (50200000.gpio): not an immutable chip, please consider fixing it!
> 
> Fix this by making the irqchip in the dwapb driver immutable.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

> Against linux-next.
> Boot-tested on SiPEED MAiXBiT (Canaan K210).

Currently no objection against the change. Thanks.

Acked-by: Serge Semin <fancer.lancer@gmail.com>

-Sergey

> ---
>  drivers/gpio/gpio-dwapb.c | 32 ++++++++++++++++++++------------
>  1 file changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 7130195da48d75dd..29b9395548151992 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -95,7 +95,6 @@ struct dwapb_context {
>  #endif
>  
>  struct dwapb_gpio_port_irqchip {
> -	struct irq_chip		irqchip;
>  	unsigned int		nr_irqs;
>  	unsigned int		irq[DWAPB_MAX_GPIOS];
>  };
> @@ -259,6 +258,8 @@ static void dwapb_irq_mask(struct irq_data *d)
>  	val = dwapb_read(gpio, GPIO_INTMASK) | BIT(irqd_to_hwirq(d));
>  	dwapb_write(gpio, GPIO_INTMASK, val);
>  	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +
> +	gpiochip_disable_irq(gc, d->hwirq);
>  }
>  
>  static void dwapb_irq_unmask(struct irq_data *d)
> @@ -268,6 +269,8 @@ static void dwapb_irq_unmask(struct irq_data *d)
>  	unsigned long flags;
>  	u32 val;
>  
> +	gpiochip_enable_irq(gc, d->hwirq);
> +
>  	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
>  	val = dwapb_read(gpio, GPIO_INTMASK) & ~BIT(irqd_to_hwirq(d));
>  	dwapb_write(gpio, GPIO_INTMASK, val);
> @@ -364,8 +367,23 @@ static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
>  
>  	return 0;
>  }
> +#else
> +#define dwapb_irq_set_wake	NULL
>  #endif
>  
> +static const struct irq_chip dwapb_irq_chip = {
> +	.name		= DWAPB_DRIVER_NAME,
> +	.irq_ack	= dwapb_irq_ack,
> +	.irq_mask	= dwapb_irq_mask,
> +	.irq_unmask	= dwapb_irq_unmask,
> +	.irq_set_type	= dwapb_irq_set_type,
> +	.irq_enable	= dwapb_irq_enable,
> +	.irq_disable	= dwapb_irq_disable,
> +	.irq_set_wake	= dwapb_irq_set_wake,
> +	.flags		= IRQCHIP_IMMUTABLE,
> +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};
> +
>  static int dwapb_gpio_set_debounce(struct gpio_chip *gc,
>  				   unsigned offset, unsigned debounce)
>  {
> @@ -439,16 +457,6 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>  	girq->default_type = IRQ_TYPE_NONE;
>  
>  	port->pirq = pirq;
> -	pirq->irqchip.name = DWAPB_DRIVER_NAME;
> -	pirq->irqchip.irq_ack = dwapb_irq_ack;
> -	pirq->irqchip.irq_mask = dwapb_irq_mask;
> -	pirq->irqchip.irq_unmask = dwapb_irq_unmask;
> -	pirq->irqchip.irq_set_type = dwapb_irq_set_type;
> -	pirq->irqchip.irq_enable = dwapb_irq_enable;
> -	pirq->irqchip.irq_disable = dwapb_irq_disable;
> -#ifdef CONFIG_PM_SLEEP
> -	pirq->irqchip.irq_set_wake = dwapb_irq_set_wake;
> -#endif
>  
>  	/*
>  	 * Intel ACPI-based platforms mostly have the DesignWare APB GPIO
> @@ -475,7 +483,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>  		girq->parent_handler = dwapb_irq_handler;
>  	}
>  
> -	girq->chip = &pirq->irqchip;
> +	gpio_irq_chip_set_chip(girq, &dwapb_irq_chip);
>  
>  	return;
>  
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
