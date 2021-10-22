Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C639C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 02:06:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C289761163
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 02:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C289761163
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RT9/jNAiNpqAPtiDEiuYmlnwfPl/9EZGNpmlIvag5kE=; b=i1Y8fPhPZnRooz
	J9QkX8Ply4d5oUotjflKJ8aOABxVAusD0zgOx/q2bAoVKs7SaDakVzqvONhtwRFrlAEku2Gs0ojqO
	od2AiCJ1YGVVP0luhPsQqm3KWi6HudxXN/MBWVkvrWRO51P+vktPa6YoB1dxE/lsBtEmsVKaMX7xX
	nqSA1Mwp7x5NTKeK/6u0Z0S3IwI7HdlWflnmRsUE+ww1V02C0+xgvaqd0yZeZiE1CzjyDJjo/5oM2
	cKPlRHsTuhg/qjgzxB9rgL5aYXHNkOZNI6gFnpd/dC3zrJ+l5tFbypA+7ztVrzDfyL43W1P5FbChO
	4J9YyBsI5U39FRA+P/5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdjx5-009TeZ-6P; Fri, 22 Oct 2021 02:06:35 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdjx1-009TdY-8p
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 02:06:33 +0000
Received: by mail-pl1-x62d.google.com with SMTP id s1so1660292plg.12
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 19:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ic/jkXaDMCMZefIM+INQtLKGqHBF+RCyVHH3h2YGrKw=;
 b=lOYDkrAgkjTYYjAVXORDOxu+X2oWJ4E99fQkCZASDeb6Bxv82OEj1GN5FK0PImm5Km
 1ndDDD5m1+pbmgSn1SBOKkTkmI7jOGTmPdscGaAxvuyV0qv9zrNHSWWjIacTclp7IP8m
 blwJCsF1Eav/gdde5L8blmmtrqSfTEaSWkVhkGUJlXUKR5GLx7C9pNVdNuQpKo0hWD5q
 r1DrR3i3eTnq/y4cVofFTn7yizNn9/14ZJ233lM7YtM+F0dJDENsEyExx68GpuYIW9j3
 V12+w1OEyyGSREogPhp1ezeuWIo0c7S25MveUfLpDoYgyADV8XIlq8q5tptjCMaone7i
 fdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ic/jkXaDMCMZefIM+INQtLKGqHBF+RCyVHH3h2YGrKw=;
 b=5UwDyGYCu7VeAHJmHGInE2KGr9+6mp33kk7kpt7VJizXpQiN2PB96mKWmwQOa5XWyn
 c+MlCnXRbKr1yLxjf520DgTns9X0Df9mr6ZOb5nMDTnMzlkLZiWfK6FcD527AEs3wwdn
 wfLB4A1qbDDKC06pYUwnvKafXB5NZFnnFmQmd2g5qr+oj7QF3DezA7IkE2aMCEq3bqQV
 irhSl4O18ICm5BxnBDF3gj/lfg2A9CF82Eend1OyeVbE6HsX8Fxs2FlkCs8V4V/wFCbO
 a/jnsQZHBh4AkfQVHt7+2RQFuTiFC86PLxh3SloNMKglhHuM4OFfmMHSfmNgf06XLdv3
 0OWg==
X-Gm-Message-State: AOAM5305n2c2oNKyFtx2LkcraaD9TAxef2SkCF2KEqsnkEHsgJxTY3C3
 /l3gpOnUxRkUx+n/BQmGXy38Ig==
X-Google-Smtp-Source: ABdhPJyaepizqaQ/UmIrCDVyrV4BTCHFvghNob7aEx2InsVkBVoe5WCokUrJgYwitOuJP7tHnLeG1Q==
X-Received: by 2002:a17:903:310c:b0:13f:f70e:6e8f with SMTP id
 w12-20020a170903310c00b0013ff70e6e8fmr7335147plc.82.1634868390409; 
 Thu, 21 Oct 2021 19:06:30 -0700 (PDT)
Received: from x1 ([2601:1c2:1080:1950:7c59:380a:adf8:4f49])
 by smtp.gmail.com with ESMTPSA id p4sm6260957pgc.15.2021.10.21.19.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 19:06:29 -0700 (PDT)
Date: Thu, 21 Oct 2021 19:06:27 -0700
From: Drew Fustini <dfustini@baylibre.com>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, Drew Fustini <drew@beagleboard.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Huan Feng <huan.feng@starfivetech.com>
Subject: Re: [PATCH v2 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
Message-ID: <20211022020627.GA1836770@x1>
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-13-kernel@esmil.dk>
 <20211021190118.GA1802180@x1>
 <CANBLGcy2WR2L_CE2FbLPBnDaHWaNgUySxyB4WyPYA1z8zsQAPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANBLGcy2WR2L_CE2FbLPBnDaHWaNgUySxyB4WyPYA1z8zsQAPQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_190631_394538_5F92D427 
X-CRM114-Status: GOOD (  32.60  )
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

On Thu, Oct 21, 2021 at 09:50:42PM +0200, Emil Renner Berthing wrote:
> On Thu, 21 Oct 2021 at 21:01, Drew Fustini <dfustini@baylibre.com> wrote:
> > On Thu, Oct 21, 2021 at 07:42:19PM +0200, Emil Renner Berthing wrote:
> > > +/*
> > > + * Interrupt Trigger Polarity. If set to 1 the interrupt is triggered on a
> > > + * rising edge (edge-triggered) or high level (level-triggered). If set to 0 the
> > > + * interrupt is triggered on a falling edge (edge-triggered) or low level
> > > + * (level-triggered).
> > > + */
> > > +#define GPIOIEV              0x020
> > > +
> > > +/*
> > > + * Interrupt Mask. If set to 1 the interrupt is disabled (masked). If set to 0
> > > + * the interrupt is enabled (unmasked).
> > > + */
> > > +#define GPIOIE               0x028
> >
> > It bothered me that the datasheet used the term GPIOIE for the interrupt
> > mask register. I had used a more verbose #define name because I worried
> > someone reading GPIOIE in functions might mistake it for an interrupt
> > enable register. This happened to me when I was originally working with
> > the gpio driver.
> >
> > However I suppose the best solution would have been to get the datasheet
> > updated as I can see how it is best to have #define names in the driver
> > match the datasheet.
> >
> > > +static void starfive_irq_mask(struct irq_data *d)
> > > +{
> > > +     struct starfive_pinctrl *sfp = starfive_from_irq_data(d);
> > > +     irq_hw_number_t gpio = irqd_to_hwirq(d);
> > > +     void __iomem *ie = sfp->base + GPIOIE + 4 * (gpio / 32);
> > > +     u32 mask = BIT(gpio % 32);
> > > +     unsigned long flags;
> > > +     u32 value;
> > > +
> > > +     raw_spin_lock_irqsave(&sfp->lock, flags);
> > > +     value = readl_relaxed(ie) & ~mask;
> > > +     writel_relaxed(value, ie);
> > > +     raw_spin_unlock_irqrestore(&sfp->lock, flags);
> > > +}
> > > +
> > > +static void starfive_irq_mask_ack(struct irq_data *d)
> > > +{
> > > +     struct starfive_pinctrl *sfp = starfive_from_irq_data(d);
> > > +     irq_hw_number_t gpio = irqd_to_hwirq(d);
> > > +     void __iomem *ie = sfp->base + GPIOIE + 4 * (gpio / 32);
> > > +     void __iomem *ic = sfp->base + GPIOIC + 4 * (gpio / 32);
> > > +     u32 mask = BIT(gpio % 32);
> > > +     unsigned long flags;
> > > +     u32 value;
> > > +
> > > +     raw_spin_lock_irqsave(&sfp->lock, flags);
> > > +     value = readl_relaxed(ie) & ~mask;
> > > +     writel_relaxed(value, ie);
> > > +     writel_relaxed(mask, ic);
> > > +     raw_spin_unlock_irqrestore(&sfp->lock, flags);
> > > +}
> > > +
> > > +static void starfive_irq_unmask(struct irq_data *d)
> > > +{
> > > +     struct starfive_pinctrl *sfp = starfive_from_irq_data(d);
> > > +     irq_hw_number_t gpio = irqd_to_hwirq(d);
> > > +     void __iomem *ie = sfp->base + GPIOIE + 4 * (gpio / 32);
> > > +     u32 mask = BIT(gpio % 32);
> > > +     unsigned long flags;
> > > +     u32 value;
> > > +
> > > +     raw_spin_lock_irqsave(&sfp->lock, flags);
> > > +     value = readl_relaxed(ie) | mask;
> > > +     writel_relaxed(value, ie);
> > > +     raw_spin_unlock_irqrestore(&sfp->lock, flags);
> > > +}
> > > +
> 
> ...
> 
> > > +static int starfive_gpio_init_hw(struct gpio_chip *gc)
> > > +{
> > > +     struct starfive_pinctrl *sfp = starfive_from_gc(gc);
> > > +
> > > +     /* mask all GPIO interrupts */
> > > +     writel(0, sfp->base + GPIOIE + 0);
> > > +     writel(0, sfp->base + GPIOIE + 4);
> >
> > Woudln't 0 in GPIOIE mean mask is disabled for all interrupts?
> >
> > In other words, wouldn't this enable all the interrupts?
> 
> Heh, you're right. The code does the exact opposite of what the
> documentation says it should be doing. However I just tried and with
> the code as it is now GPIO interrupts work fine, but with the logic
> flipped the kernel fails to boot. I'm guessing because an interrupt
> storm. So it seems to me the documentation might be wrong and GPIOIE
> is actually a good name.

Ah, it seems I once knew this back in July [1] but never got the
documentation changed:

NOTE: Table 12-9 in the JH7100 datasheet is incorrect regarding fields
GPIOIE_0 and GPIOIE_1. An interrupt is enabled (unmasked) when the bit
is   set to 1 and it is disabled (masked) when set to 0. The datasheet
incorrectly states the opposite. I think this is due to the datasheet
author thinking of it as mask field which it is not, it is an enable
field. I will raise an issue on the documentation repo.


> 
> Michael Zhu: Can you confirm if a 1 or 0 enables the interrupt in the
> GPIOIE registers?
> 
> /Emil

[1] https://github.com/esmil/linux/pull/34/commits/e247a259e40312d0202cdbdd686dbba09afc7813

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
