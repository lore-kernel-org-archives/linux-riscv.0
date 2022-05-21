Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20849C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 21 May 2022 17:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WUd+Ze0eiCLiKRLKIifnWHA9Tkl/u19GN9P2w0R9CJU=; b=pj+VFIpd5QIsMV
	JlJwFMCj0h8P5fisLufglsCCahd8zK01uxNP0/9NB6X5YhG0wQ2MboBGoqC4/NZeTsKXSkJhjzt8B
	PhkeW7FSKXHcZSXNiXQz+LszEsLdRsSAvGC0ANAjCBm2vlkp8YcKtSRJG3hA0f5M6Vm0Du4Wnck0W
	tTsb1D7DAJcR+CWmWjDLx4C/IRa8FK+aNqt14E77DfjBfLm4oMfdhBykwV6f9Hgvn1sjjCQyA15aj
	RkdVOsuG+CZRBXhzuAjOb5Us/S/OsqSd+o3Ojr7AZ7Ze02YcaDyeSgM5urOOLAYSWj18LLX5NfHn7
	+SacOr67VNlUfi+phoKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsSvJ-00H9rk-FP; Sat, 21 May 2022 17:29:53 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsSvG-00H9rN-Rx
 for linux-riscv@lists.infradead.org; Sat, 21 May 2022 17:29:52 +0000
Received: by mail-ed1-x52c.google.com with SMTP id g12so14184192edq.4
 for <linux-riscv@lists.infradead.org>; Sat, 21 May 2022 10:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yyt58Bbb4TJz2iKeRefj+uX1+zTItw+dgWZZ3Lksl3s=;
 b=YvkuyGbFHbaQIL1JJDUqXWD3G0/VeV1+VVIHJBm5eZv73zo2Qhfi9DY8fwEWxdrL6w
 19RnODTHh0A7IXvma1poSilGXW5QMo0Upnk6BTxd4F6awuEjlOYqSVUloz6ao8Cxwq6w
 z2ibiqwaIAkhlnUCiAtHK6GxZW7F8OeAYuYg0naYVUorbaD+JzXgH5zBT//xhJTTKADR
 rhHLTqoUAG672HhhBJ/Te1l9aZLqFYzwd8sOX/2CB+I3hedE9Ndcg9cO09P4HmUitAcW
 SDP367somfQAGyoc0tRCkrqq2FgEWpU4pxmWV1/yWY0Jv+kPSxM41DQCVoquGV3MSntj
 Q1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yyt58Bbb4TJz2iKeRefj+uX1+zTItw+dgWZZ3Lksl3s=;
 b=1c647sP2pKskV6NkM+L5EVRQc5uHNtqgpUA4PHbhDrLpTo0cHY+Mhn0KR891bTJzkV
 IaT+ZeKMc0fl1Ntq6PWHGRm9osRxcUAy7Xis2KRCCcGFvu5tKTBjllqWMwLKeLZ/a/a+
 XiuevXn3dLK66+5eGj2u7/ZxUND57a6c4AjRSIucDfK0o6t9OFjZzNRhuyA8ues/k3yN
 RXrDb2S5rwdBhn6RZxbgEmnWzn9uEyAzP1K5qiJqaTtrbyCKKSmdul6uGjwEWSRqCmGb
 HtRndpv+Tai4oe0zegh08lHQvf0PxERjkrXL5LePZKC8WFVlCTInfVt6JFsNBf0RJw2+
 /3pg==
X-Gm-Message-State: AOAM531zxSSd7rcYmVNwfh7z8HZzcyHF7UFFiOqK6irwpK9JzCkdD4dT
 ecz43AyfFU9slEJHRh+BPuhLTVkfTuC1bVxvt7c=
X-Google-Smtp-Source: ABdhPJzvvUZAXLPk6eetUOLJGlimOZPu1t2mvFHm12dvSncjmvWXtPUP8ooRC0BptgJv3jz5+naTyLHKqxAXAHKKk3Y=
X-Received: by 2002:a05:6402:4394:b0:42a:e84c:2cfb with SMTP id
 o20-20020a056402439400b0042ae84c2cfbmr16826711edc.97.1653154185457; Sat, 21
 May 2022 10:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <01f7a990654697ca7ec8b2d0025f41403462c8d9.1653042121.git.geert+renesas@glider.be>
In-Reply-To: <01f7a990654697ca7ec8b2d0025f41403462c8d9.1653042121.git.geert+renesas@glider.be>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 21 May 2022 19:29:09 +0200
Message-ID: <CAHp75VfVR9z=nT_F7Uw1+OaZn_tag42UPR7_KWjL74wK5Oq-yw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: dwapb: Make the irqchip immutable
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
 Serge Semin <fancer.lancer@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Damien Le Moal <damien.lemoal@wdc.com>, Marc Zyngier <maz@kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220521_102950_940909_BE1A261E 
X-CRM114-Status: GOOD (  22.01  )
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

On Sat, May 21, 2022 at 1:24 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning to indicate if the gpiolib is altering the
> internals of irqchips.  Following this change the following warning is
> now observed for the dwapb driver:
>
>     gpio gpiochip0: (50200000.gpio): not an immutable chip, please consider fixing it!
>
> Fix this by making the irqchip in the dwapb driver immutable.


> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Against gpio/for-next.
> Boot-tested on SiPEED MAiXBiT (Canaan K210).
>
> v2:
>   - Factor out hwirq using preferred helper.
> ---
>  drivers/gpio/gpio-dwapb.c | 38 ++++++++++++++++++++++++--------------
>  1 file changed, 24 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 7130195da48d75dd..04afe728e18748df 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -95,7 +95,6 @@ struct dwapb_context {
>  #endif
>
>  struct dwapb_gpio_port_irqchip {
> -       struct irq_chip         irqchip;
>         unsigned int            nr_irqs;
>         unsigned int            irq[DWAPB_MAX_GPIOS];
>  };
> @@ -252,24 +251,30 @@ static void dwapb_irq_mask(struct irq_data *d)
>  {
>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>         struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
> +       irq_hw_number_t hwirq = irqd_to_hwirq(d);
>         unsigned long flags;
>         u32 val;
>
>         raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
> -       val = dwapb_read(gpio, GPIO_INTMASK) | BIT(irqd_to_hwirq(d));
> +       val = dwapb_read(gpio, GPIO_INTMASK) | BIT(hwirq);
>         dwapb_write(gpio, GPIO_INTMASK, val);
>         raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +
> +       gpiochip_disable_irq(gc, hwirq);
>  }
>
>  static void dwapb_irq_unmask(struct irq_data *d)
>  {
>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>         struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
> +       irq_hw_number_t hwirq = irqd_to_hwirq(d);
>         unsigned long flags;
>         u32 val;
>
> +       gpiochip_enable_irq(gc, hwirq);
> +
>         raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
> -       val = dwapb_read(gpio, GPIO_INTMASK) & ~BIT(irqd_to_hwirq(d));
> +       val = dwapb_read(gpio, GPIO_INTMASK) & ~BIT(hwirq);
>         dwapb_write(gpio, GPIO_INTMASK, val);
>         raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>  }
> @@ -364,8 +369,23 @@ static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
>
>         return 0;
>  }
> +#else
> +#define dwapb_irq_set_wake     NULL
>  #endif
>
> +static const struct irq_chip dwapb_irq_chip = {
> +       .name           = DWAPB_DRIVER_NAME,
> +       .irq_ack        = dwapb_irq_ack,
> +       .irq_mask       = dwapb_irq_mask,
> +       .irq_unmask     = dwapb_irq_unmask,
> +       .irq_set_type   = dwapb_irq_set_type,
> +       .irq_enable     = dwapb_irq_enable,
> +       .irq_disable    = dwapb_irq_disable,
> +       .irq_set_wake   = dwapb_irq_set_wake,
> +       .flags          = IRQCHIP_IMMUTABLE,
> +       GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};
> +
>  static int dwapb_gpio_set_debounce(struct gpio_chip *gc,
>                                    unsigned offset, unsigned debounce)
>  {
> @@ -439,16 +459,6 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>         girq->default_type = IRQ_TYPE_NONE;
>
>         port->pirq = pirq;
> -       pirq->irqchip.name = DWAPB_DRIVER_NAME;
> -       pirq->irqchip.irq_ack = dwapb_irq_ack;
> -       pirq->irqchip.irq_mask = dwapb_irq_mask;
> -       pirq->irqchip.irq_unmask = dwapb_irq_unmask;
> -       pirq->irqchip.irq_set_type = dwapb_irq_set_type;
> -       pirq->irqchip.irq_enable = dwapb_irq_enable;
> -       pirq->irqchip.irq_disable = dwapb_irq_disable;
> -#ifdef CONFIG_PM_SLEEP
> -       pirq->irqchip.irq_set_wake = dwapb_irq_set_wake;
> -#endif
>
>         /*
>          * Intel ACPI-based platforms mostly have the DesignWare APB GPIO
> @@ -475,7 +485,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>                 girq->parent_handler = dwapb_irq_handler;
>         }
>
> -       girq->chip = &pirq->irqchip;
> +       gpio_irq_chip_set_chip(girq, &dwapb_irq_chip);
>
>         return;
>
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
