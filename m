Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EDFC43334
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 22:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SwELFbamGRjy0NwVZx9Dj6vwmL4z6zO7yBOaut0WJTc=; b=gVHvvS8AeBNR1Y
	cflOhenaLn9WDXfxy80PWnn7iSFAyHVe94hoF2V9k/lmUY3y/MU5+R77c9B93uj1loOGGCccv5Gp6
	mIDrGOsZbcnplwFjOn1hswEKe3rfgVnEa+azDIA7XHSudKvRLjClaiNquy83jpcpDJYRuR90rgi4O
	+x7PBX41rESsuCGLo0e2rWNXL5NI1eFU4/+2rT2BtwcFghJWTpG2kRkWO8gMheWSpHjdi8f0vO9VI
	pXZfTpHA7sbeIQshqQYBAlq6kyGZcg6JEWPnBGe4cgzx2UNg91H9O3zJDWefTFxL9LiL/GyKwIWq5
	Lgr6q5BOMS4Znxr3TeDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBkdP-008XD7-Tc; Wed, 13 Jul 2022 22:15:07 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBkdL-008X89-MJ
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 22:15:05 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-31bf3656517so126857727b3.12
        for <linux-riscv@lists.infradead.org>; Wed, 13 Jul 2022 15:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lX7k/axtDRxzgIi4P0RLXUpMp7jh1OeNazvCuzYxTm8=;
        b=buxyNclJkzDaDQmBMmX+cdNC2uQlC/SYJrbRkk5OpDiJ3b1RT91rskkzWprVhaerfD
         DXLUl8w1Ga1h6x2iGYBgSKkRd2BfyEaWnHbyc0+NSsPu+c+nJh3Mc7VkME174OkIqsiW
         R0UF3SB8R2nQVUsagBJWJJMOvG79Zj0B3F1eJmpqGEXWzN/9lY93xQJd324DoYY6XL8F
         hypWXuBcTjLhRFSers4+b/cMJ21FfqBCitzmUDMQGq5VNxSE8fBOH8pLPE/N/Nf9Bmt7
         7BDeZzR5VVsgaJyi16/YNQ5CPCPDq0rPTsUdFRCM9SBgN3EbQwVVrnfAYUs/FWeT/3qA
         Pp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lX7k/axtDRxzgIi4P0RLXUpMp7jh1OeNazvCuzYxTm8=;
        b=CqSry8ylt73nw/vZTt5X2T9zdPFrzOY5gT94m5xbFasvvtLibB2OxklfRu2pQ51+xs
         qjBs7gTIwnrS0C/pyLJ2L5RcTFZY7+uPaJkFG3O1Mijc8jZQLjzJVs42++dlFnYBsL5s
         z7aCPI22x/Gw+VIErWvpoXQtt1OnFCzFlCobM+/0wEuvRoA8mbMObTM5tWTOwktD80fO
         ArS0UuWf874BN+l1hg982ndM6tLomcjU+Ge25hGSZRGE1Ep9z8NkvOU2YDw97b5zhIJ1
         VSsZMAEISWvI8FgIRP0DiWt77hgueV9wYOkwwvIANo9XAHt/tDbsKM6x5mWktHNceV2U
         tLWw==
X-Gm-Message-State: AJIora+KNVtaSc8Ag1PO3QaZGkYjJoN2T1R/4i84alwusaDWBssWInqt
	goBR8uU+krKBg5306UvrXG/jvTN4EDP05iPshOC94M6hgpbbZg==
X-Google-Smtp-Source: AGRyM1vd//RCXP39iX9dVoexAOOcjKn30pTDRU1fUa0SdZOmCe9lU/VCLrmBrclJF0+8dMBysQ845jMQ2WSn2YvEZgg=
X-Received: by 2002:a81:72c4:0:b0:31c:b309:c4e8 with SMTP id
 n187-20020a8172c4000000b0031cb309c4e8mr6692569ywc.520.1657750501924; Wed, 13
 Jul 2022 15:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220713105910.931983-1-lewis.hanly@microchip.com>
 <20220713105910.931983-2-lewis.hanly@microchip.com> <CAHp75VfGTd02jKYsFq94BF_Gqro2trk3iyyALBatS1Bps3HYhw@mail.gmail.com>
 <abdf389cfd049f60b951447c047bbd186fa19469.camel@microchip.com>
In-Reply-To: <abdf389cfd049f60b951447c047bbd186fa19469.camel@microchip.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 14 Jul 2022 00:14:25 +0200
Message-ID: <CAHp75VeX8p4m7Bi=9Zvk5=MRTOb=BTmcuDbtW1ZUOr_-1mHvyQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpio: mpfs: add polarfire soc gpio support
To: Lewis.Hanly@microchip.com
Cc: linux-riscv <linux-riscv@lists.infradead.org>, Conor.Dooley@microchip.com, 
	Bartosz Golaszewski <brgl@bgdev.pl>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Marc Zyngier <maz@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Daire.McNamara@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_151503_828601_63FDA4CA 
X-CRM114-Status: GOOD (  35.23  )
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

On Wed, Jul 13, 2022 at 10:44 PM <Lewis.Hanly@microchip.com> wrote:
> On Wed, 2022-07-13 at 13:59 +0200, Andy Shevchenko wrote:
> > On Wed, Jul 13, 2022 at 1:00 PM <lewis.hanly@microchip.com> wrote:

...

> > > +config GPIO_POLARFIRE_SOC
> > > +       bool "Microchip FPGA GPIO support"
> >
> > Why not tristate?
> OK.

(1)

...

> > > +       help
> > > +         Say yes here to support the GPIO device on Microchip
> > > FPGAs.
> >
> > When allowing it to be a module, add a text that tells how the driver
> > will be called.
> Not loading as a module.

I didn't get this. Together with (1) it makes nonsense. What did you
mean by (1) _or_ by this?

...

> > Also don't forget mod_devicetable.h.
> Can't see why I need this header.

Because you are using data types from it.

...

> > > +       if (gpio_cfg & MPFS_GPIO_EN_IN)
> > > +               return 1;
> > > +
> > > +       return 0;
> >
> > Don't we have specific definitions for the directions?
> No defines in file.

We have. Please, check again.

...

> > > +       mpfs_gpio_assign_bit(mpfs_gpio->base + (gpio_index *
> > > BYTE_BOUNDARY),
> > > +                            MPFS_GPIO_EN_INT, 1);
> >
> > Too many parentheses.
> I do think it makes reading easier.

You can multiply inside mpfs_gpio_assign_bit(), no?

...

> > > +       mpfs_gpio_assign_bit(mpfs_gpio->base + (gpio_index *
> > > BYTE_BOUNDARY),
> > > +                            MPFS_GPIO_EN_INT, 0);

Ditto.

...

> > > +static int mpfs_gpio_irq_set_affinity(struct irq_data *data,
> > > +                                     const struct cpumask *dest,
> > > +                                     bool force)
> > > +{
> > > +       if (data->parent_data)
> > > +               return irq_chip_set_affinity_parent(data, dest,
> > > force);
> > > +
> > > +       return -EINVAL;
> > > +}
> >
> > Why do you need this? Isn't it taken care of by the IRQ chip core?
> Yes I believe we do/should, data->parent_data is used in
> irq_chip_set_affinity_parent(..) without checking so hence checked
> before calling.

I mean the entire function. Isn't it the default in the IRQ chip core?
Or can it be made as a default with some flags set?

...

> > > +       struct device_node *node = pdev->dev.of_node;
> > > +       struct device_node *irq_parent;
> >
> > Why do you need these?
> Yes they are needed. Both of the same type but used in different
> places. I don't think I can reuse.

This is related to the pattern of how you are enumerating IRQs. If the
pattern is changed, it would be not needed anymore.

...

> > > +       if (ngpio > NUM_GPIO) {
> > > +               dev_err(dev, "Too many GPIO interrupts (max=%d)\n",
> > > +                       NUM_GPIO);
> > > +               ret = -ENXIO;
> > > +               goto cleanup_clock;
> >
> > return dev_err_probe(...);
> I need to cleanup clock before returning, will use dev_err_probe.

Have you read what I wrote above?
I wrote that you need to wrap the clk_disable_unprepare() into devm,
so you may use as I pointed out, i.e. return dev_err_probe()
everywhere in the ->probe().

> > > +       }

...

> > Why do you need all these? Seems a copy'n'paste from gpio-sifive,
> > which is the only GPIO driver using this pattern.
> Yes I believe we do need all this information. Yes it is similiar
> implementation to sifive. Not the only driver using this pattern, check
> gpio-ixp4xxx.c

My question: why do you need this? What is so special about this driver?

...

> > > +               mpfs_gpio_assign_bit(mpfs_gpio->base + (i *
> > > BYTE_BOUNDARY),
> > > +                                    MPFS_GPIO_EN_INT, 0);
> >
> > Too many parentheses.

As per above.

...

> > > +       dev_info(dev, "Microchip MPFS GPIO registered, ngpio=%d\n",
> > > ngpio);
> >
> > Noise.
> Maybe, but useful information to know the ngpio.

Nope. Use sysfs / debugfs / etc. No need to noise the log.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
