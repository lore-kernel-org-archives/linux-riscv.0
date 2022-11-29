Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547EAC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 16:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MuG+BUoccgqyP4Lm0Sr46WJl/dQSDup2vS6PfVSokWY=; b=iiSlCpS70ahUYB
	EDDHtKdNVKyRrczNRMwK27D2u5bjSoJ50kWEOFKe07qZ7Q3TMD6u5hNTsm+KO4v0RI2X1Pr9EiZ0T
	nNDZlsPdVB1JD8d7qCyQ4+BTZk8XfoMegikgecjEUcRpmO0irTugM0g/KQhIC+aG42aGHDqQjro8l
	WVPBLQ45gjUNMsgCo4q+GL1uzRfrOafTSfB2aIO2sa8EqfYV+p9JHJAOoGrHUGuanEFz0qvTehNB0
	yUC5UJgMudJCHvPLaMz/r3zXMCK8SGJa4NeqTL+aaA8zRL9gJhhknOBYdrq52lSIx7W9qdEjG8+gf
	GZo7bNEaewPNU81uC65g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p03Zj-00A9yn-73; Tue, 29 Nov 2022 16:35:15 +0000
Received: from mail-qt1-f182.google.com ([209.85.160.182])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p03Zg-00A9xL-Np
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 16:35:14 +0000
Received: by mail-qt1-f182.google.com with SMTP id w9so9259609qtv.13
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 08:35:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4f3MH+lMogUACYGlj31f9V1BiT8ZZFJNj/XqOwmMz0c=;
        b=QgPIxNNyffuAsuj3rxTgp2PqI/md6VYA0QsWfqOh07mHbYAUsF1nItP0VLeEREamTT
         UhPamHU0bqgHUDLIdN3uBkgnPa1IhLcH+gFRdE4fynQHevJ2M1oV+E4etcuNDeVFpFlq
         WlbXW6ve8GnMjamWvSdgmpwokNtgpEcG/c6JYnelX/7xHa8tvPS+mMH5NLm9Es8Zgawv
         pEo+tIy6Bo8Ekd8oiPXyTwV18O9NMNU3SQY8YVLgxHrKjpjW6qZ3HEmDZccalcEG0+Mn
         9j72uOCLXnxJp5evUbWH7dLcjzQg3mBMn5YItNh9CXk6ckroZ9U0FXdDjVzCbapdSYtw
         3QWg==
X-Gm-Message-State: ANoB5pnoyeCC6H5cuAKhpNL/RJHybu6wvYfeL0KHt5MSYdFiuClZI7am
	5AWHdTtcywxOSYgIr+WSGddeFzcNgC1pQQ==
X-Google-Smtp-Source: AA0mqf7RTixFpvZcMiQ29uEsG49oiRZAlJvdhIQSNt/eQ7QEN3NNIhXgGn+gsXNGnUP95donaEstxg==
X-Received: by 2002:ac8:5ed4:0:b0:3a6:6ced:c61 with SMTP id s20-20020ac85ed4000000b003a66ced0c61mr19349761qtx.682.1669739710456;
        Tue, 29 Nov 2022 08:35:10 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id u8-20020a05620a454800b006ecf030ef15sm11057631qkp.65.2022.11.29.08.35.08
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 08:35:09 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id d128so18156722ybf.10
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 08:35:08 -0800 (PST)
X-Received: by 2002:a25:9e84:0:b0:6de:6183:c5c3 with SMTP id
 p4-20020a259e84000000b006de6183c5c3mr36992059ybq.89.1669739708665; Tue, 29
 Nov 2022 08:35:08 -0800 (PST)
MIME-Version: 1.0
References: <4ee1a396acc34871dbae73a5b032915f745795ec.1669738949.git.geert+renesas@glider.be>
 <Y4Yzw4Oq8lUEHdcC@spud>
In-Reply-To: <Y4Yzw4Oq8lUEHdcC@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Nov 2022 17:34:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXyAv9xD0WGCMKYvBSAjJ0auXc-JGfcgu-xxc-P1PPg8A@mail.gmail.com>
Message-ID: <CAMuHMdXyAv9xD0WGCMKYvBSAjJ0auXc-JGfcgu-xxc-P1PPg8A@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpfs: Make the irqchip immutable
To: Conor Dooley <conor@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Marc Zyngier <maz@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lewis Hanly <lewis.hanly@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_083512_804335_0425E230 
X-CRM114-Status: GOOD (  34.79  )
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

Hi Conor,

CC Lewis

On Tue, Nov 29, 2022 at 5:31 PM Conor Dooley <conor@kernel.org> wrote:
> On Tue, Nov 29, 2022 at 05:23:22PM +0100, Geert Uytterhoeven wrote:
> > Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> > immutable") added a warning to indicate if the gpiolib is altering the
> > internals of irqchips.  Following this change the following warning is
> > now observed for the gpio-mpfs driver:
> >
> >     gpio gpiochip0: (20122000.gpio): not an immutable chip, please consider fixing it!
> >
> > Fix this by making the irqchip in the gpio-mpfs driver immutable.
> >
> > While at it, drop of the unneeded masking of the hwirq number, as it is
> > always smaller than the number of GPIOs/interrupts handled by the
> > controller.
>
> Huh, I didn't think this was upstream yet?
> Lewis should be working on an updated version of it at the moment, last
> I heard he was looking into using regmap stuff as pointed out in a
> review.

Oh right, this is still a local patch.
Sorry, I thought it was already upstream...

>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Not tested with interrupts, as there are no inputs described in the
> > Icicle DTS yet.
> > ---
> >  drivers/gpio/gpio-mpfs.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
> > index 168be0b90cf8c656..fd294b581ae77369 100644
> > --- a/drivers/gpio/gpio-mpfs.c
> > +++ b/drivers/gpio/gpio-mpfs.c
> > @@ -168,8 +168,9 @@ static void mpfs_gpio_irq_unmask(struct irq_data *data)
> >  {
> >       struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> >       struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> > -     int gpio_index = irqd_to_hwirq(data) % MAX_NUM_GPIO;
> > +     int gpio_index = irqd_to_hwirq(data);
> >
> > +     gpiochip_enable_irq(gc, gpio_index);
> >       mpfs_gpio_direction_input(gc, gpio_index);
> >       mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
> >       mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index),
> > @@ -180,11 +181,12 @@ static void mpfs_gpio_irq_mask(struct irq_data *data)
> >  {
> >       struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> >       struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> > -     int gpio_index = irqd_to_hwirq(data) % MAX_NUM_GPIO;
> > +     int gpio_index = irqd_to_hwirq(data);
> >
> >       mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
> >       mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index),
> >                            MPFS_GPIO_EN_INT, 0);
> > +     gpiochip_disable_irq(gc, gpio_index);
> >  }
> >
> >  static const struct irq_chip mpfs_gpio_irqchip = {
> > @@ -192,7 +194,8 @@ static const struct irq_chip mpfs_gpio_irqchip = {
> >       .irq_set_type = mpfs_gpio_irq_set_type,
> >       .irq_mask       = mpfs_gpio_irq_mask,
> >       .irq_unmask     = mpfs_gpio_irq_unmask,
> > -     .flags = IRQCHIP_MASK_ON_SUSPEND,
> > +     .flags = IRQCHIP_IMMUTABLE | IRQCHIP_MASK_ON_SUSPEND,
> > +     GPIOCHIP_IRQ_RESOURCE_HELPERS,
> >  };
> >
> >  static void mpfs_gpio_irq_handler(struct irq_desc *desc)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
