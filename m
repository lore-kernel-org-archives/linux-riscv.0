Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E9B8C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 19:51:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D9F7610CB
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 19:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D9F7610CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LbtKZakmmakEplqk7X//f5qvcR0DaJD4ex0JBTHdils=; b=o+rYm3x2FP2tGt
	DXEnD6UNVFKGJ48kPOsk/4xaM2xXE6S3zgnD9QO7K0mY64SaHGH7bnbmbf2oJkuUxO5B3vo+aJpjz
	sPrlLTZkjyDApd332q43QR2wWphJdHQ74lVHUcIiI7Ao1L6r1LVZ/XF6ZmiMGIooH1ymXm8RxJe7S
	eO2l+0k2hmzaF7IEceNO6z2IiVei/J8f7XUyDhZ0z7/k8ZU0gTtPWPpHim3c/G1VxcN2aKAyn+Rhl
	1mLrxzxO8V9WY6p6aoLPCOjZZwY97y2Ny/YiGFIA3XmXXcbN/Yt6cObGK7hvclponRcYqJOd4GuJV
	Mucwp9gUSXNV3sWMSvyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mde5Z-0091Jb-Qb; Thu, 21 Oct 2021 19:50:57 +0000
Received: from mail-pg1-f169.google.com ([209.85.215.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mde5W-0091IW-17
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 19:50:56 +0000
Received: by mail-pg1-f169.google.com with SMTP id r2so1234767pgl.10
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 12:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5qcBk3DeZv7+MBr+DGak5KmAIKq22H5/grJVeSCeLaw=;
 b=fy6/iEzyI3AckET5tk74se0VzYoou8m3q0JoQSAqf+fR/16ZINoype7DV3um4vTFLT
 Ss2JSQjo5opDOWC2GGi/IZhTBxfzJMVxYrFq0QHRqR2DVwXLC1Zgc+zZDCo7XUDJ75m2
 1WCdrhlnHeqWcDuTarhm0/eRkQAvJ0bdKxYbnQNy+Wr6PJzVq1X31Xnkz4nLxUvX26aq
 Pcdh4OhdBjr0odFEosgdZJfmdLxxfu0eupAj9dmC5CNnC4nflcON6cHRnRR3gB4WvgTS
 zv88iRo0NKNsitF3RVLeYkdGUGlwkcjamrYlylPquuMu26wSeZTzFk8FlUPbZmTnAPve
 0LNw==
X-Gm-Message-State: AOAM5322zwdJR/5hIQFwUK84l1AbUXsFf8YwzDOt3i8hHpZy5zAjxO17
 afEPQo9hsmeCqZ1b0tiRmlianySpRv/UktZdbOg=
X-Google-Smtp-Source: ABdhPJz2g45HVrm92zsQSGHVasZJ2oUSDzMsKNKTjLhfF9aY5UDp7p3S+/XUucIuf3UBNmD9xTaAgYYNmpQ1XqNUueI=
X-Received: by 2002:a63:2d46:: with SMTP id t67mr5876914pgt.15.1634845853245; 
 Thu, 21 Oct 2021 12:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-13-kernel@esmil.dk>
 <20211021190118.GA1802180@x1>
In-Reply-To: <20211021190118.GA1802180@x1>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Thu, 21 Oct 2021 21:50:42 +0200
Message-ID: <CANBLGcy2WR2L_CE2FbLPBnDaHWaNgUySxyB4WyPYA1z8zsQAPQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
To: Drew Fustini <dfustini@baylibre.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Drew Fustini <drew@beagleboard.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>, Fu Wei <tekkamanninja@gmail.com>, 
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Huan Feng <huan.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_125054_099292_8B9F644E 
X-CRM114-Status: GOOD (  27.19  )
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

On Thu, 21 Oct 2021 at 21:01, Drew Fustini <dfustini@baylibre.com> wrote:
> On Thu, Oct 21, 2021 at 07:42:19PM +0200, Emil Renner Berthing wrote:
> > +/*
> > + * Interrupt Trigger Polarity. If set to 1 the interrupt is triggered on a
> > + * rising edge (edge-triggered) or high level (level-triggered). If set to 0 the
> > + * interrupt is triggered on a falling edge (edge-triggered) or low level
> > + * (level-triggered).
> > + */
> > +#define GPIOIEV              0x020
> > +
> > +/*
> > + * Interrupt Mask. If set to 1 the interrupt is disabled (masked). If set to 0
> > + * the interrupt is enabled (unmasked).
> > + */
> > +#define GPIOIE               0x028
>
> It bothered me that the datasheet used the term GPIOIE for the interrupt
> mask register. I had used a more verbose #define name because I worried
> someone reading GPIOIE in functions might mistake it for an interrupt
> enable register. This happened to me when I was originally working with
> the gpio driver.
>
> However I suppose the best solution would have been to get the datasheet
> updated as I can see how it is best to have #define names in the driver
> match the datasheet.
>
> > +static void starfive_irq_mask(struct irq_data *d)
> > +{
> > +     struct starfive_pinctrl *sfp = starfive_from_irq_data(d);
> > +     irq_hw_number_t gpio = irqd_to_hwirq(d);
> > +     void __iomem *ie = sfp->base + GPIOIE + 4 * (gpio / 32);
> > +     u32 mask = BIT(gpio % 32);
> > +     unsigned long flags;
> > +     u32 value;
> > +
> > +     raw_spin_lock_irqsave(&sfp->lock, flags);
> > +     value = readl_relaxed(ie) & ~mask;
> > +     writel_relaxed(value, ie);
> > +     raw_spin_unlock_irqrestore(&sfp->lock, flags);
> > +}
> > +
> > +static void starfive_irq_mask_ack(struct irq_data *d)
> > +{
> > +     struct starfive_pinctrl *sfp = starfive_from_irq_data(d);
> > +     irq_hw_number_t gpio = irqd_to_hwirq(d);
> > +     void __iomem *ie = sfp->base + GPIOIE + 4 * (gpio / 32);
> > +     void __iomem *ic = sfp->base + GPIOIC + 4 * (gpio / 32);
> > +     u32 mask = BIT(gpio % 32);
> > +     unsigned long flags;
> > +     u32 value;
> > +
> > +     raw_spin_lock_irqsave(&sfp->lock, flags);
> > +     value = readl_relaxed(ie) & ~mask;
> > +     writel_relaxed(value, ie);
> > +     writel_relaxed(mask, ic);
> > +     raw_spin_unlock_irqrestore(&sfp->lock, flags);
> > +}
> > +
> > +static void starfive_irq_unmask(struct irq_data *d)
> > +{
> > +     struct starfive_pinctrl *sfp = starfive_from_irq_data(d);
> > +     irq_hw_number_t gpio = irqd_to_hwirq(d);
> > +     void __iomem *ie = sfp->base + GPIOIE + 4 * (gpio / 32);
> > +     u32 mask = BIT(gpio % 32);
> > +     unsigned long flags;
> > +     u32 value;
> > +
> > +     raw_spin_lock_irqsave(&sfp->lock, flags);
> > +     value = readl_relaxed(ie) | mask;
> > +     writel_relaxed(value, ie);
> > +     raw_spin_unlock_irqrestore(&sfp->lock, flags);
> > +}
> > +

...

> > +static int starfive_gpio_init_hw(struct gpio_chip *gc)
> > +{
> > +     struct starfive_pinctrl *sfp = starfive_from_gc(gc);
> > +
> > +     /* mask all GPIO interrupts */
> > +     writel(0, sfp->base + GPIOIE + 0);
> > +     writel(0, sfp->base + GPIOIE + 4);
>
> Woudln't 0 in GPIOIE mean mask is disabled for all interrupts?
>
> In other words, wouldn't this enable all the interrupts?

Heh, you're right. The code does the exact opposite of what the
documentation says it should be doing. However I just tried and with
the code as it is now GPIO interrupts work fine, but with the logic
flipped the kernel fails to boot. I'm guessing because an interrupt
storm. So it seems to me the documentation might be wrong and GPIOIE
is actually a good name.

Michael Zhu: Can you confirm if a 1 or 0 enables the interrupt in the
GPIOIE registers?

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
