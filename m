Return-Path: <SRS0=1+LQ=PW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A16C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Nov 2021 12:35:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39E8761101
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Nov 2021 12:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39E8761101
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uScjFqzB6tg3QidZB9vDct/mvdT1N1fVDfXbd8xnwW8=; b=FhiVG7YIV6AErV
	PE8R69cZHOP52cbhQZhHfrGQksiVJpIIp81j8HobzMClx334aiF/1yHyPNTPLK5RyFrokOmmllRJ7
	L0Ooa8sTH4241C8GpUvWFAbISo7zsG4akt1jm5+ansg/UJwRSAb+QO3XuwloL0j9W34OrlPsZra/V
	MtgzNf8XanVUYKX9xehFNBDngviQW+uznJvPhWwK8a74MdPUJIA4weLGSK7+TVhwt5fi9pBcRO8Tk
	DFXLaIROizAmAw7eo0iKBEyYuVFyzFQUfQT9gBuYixVaKkK7HowN6Q1OYimWc3i5+B7OabWnungY7
	5ozFtqrgIKj0w4UDx30A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miFUS-005BHp-AC; Wed, 03 Nov 2021 12:35:40 +0000
Received: from mail-pf1-f182.google.com ([209.85.210.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miFUN-005BGP-HP
 for linux-riscv@lists.infradead.org; Wed, 03 Nov 2021 12:35:37 +0000
Received: by mail-pf1-f182.google.com with SMTP id l3so229934pfu.13
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 05:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JE/2edLy6usLclELy9HdQo+SFIip3f5Fv/danfH38Us=;
 b=QQySHu8a11kCQZaodKHVxy5GAeZ1aMIW+yBjGvTlNMbrCOxtoWhAWsk+EuVT3QannO
 QUkkvieGvjWj9V1notrUKOqt6HGajBsjKUKdnY84Smd/O6rXbbtSTsNnor7lwIZFZ9b2
 UuYoQ+C3/9iXYHPtjeeFVUmJoRHW49RolZ60n3/SANnQFqHNb3k7LtNV4FcGyc1c65kC
 TCJdlvx/wniAxozRBAmYw7BrvZb0TGtVCOqYTQwcilxiUURbZQnpf7+W5kNEO6yfR/lx
 jiu74pa1/IZlnU1Lhlj0QHRy6Cq53B//72DJb8K/qgo6o43w6AA9Mqw8xphrxQhAUjZ9
 fjkg==
X-Gm-Message-State: AOAM533VhLm0ViNXXFAqiKTGNtg0xr14UL9VQGgBeWwUEoeeJBY8mbtv
 6qJPUcG1/b1rasgxjJSMO5MPukUFoDxLdUPG0pOJy4wF8fg=
X-Google-Smtp-Source: ABdhPJxYbn79vSJ2NRtioaA8LqjYkpfmXUk5eC68C/FQfgWNHpS1VH42PtOSnEicWrsOvNwI2un3ZgJ4IhQvUwx3oI0=
X-Received: by 2002:a63:2d46:: with SMTP id t67mr32735713pgt.15.1635942934696; 
 Wed, 03 Nov 2021 05:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-13-kernel@esmil.dk>
 <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
 <CANBLGczn8+po09wF_uEvvU8tLCn0ahY+Gkj9JJLxOcj1LC1aLA@mail.gmail.com>
 <CAHp75VetDHt9G+PT77_py8N4Z06j7oytnXgQq8zss_xZBBeEng@mail.gmail.com>
In-Reply-To: <CAHp75VetDHt9G+PT77_py8N4Z06j7oytnXgQq8zss_xZBBeEng@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Wed, 3 Nov 2021 13:35:23 +0100
Message-ID: <CANBLGczTnf1UrRt=d-czaG-CE=Rwb1x6MV4c97ia+P3u5Mt8Jg@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
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
X-CRM114-CacheID: sfid-20211103_053535_620633_D62121BE 
X-CRM114-Status: GOOD (  33.15  )
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

On Wed, 3 Nov 2021 at 10:13, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Tue, Nov 2, 2021 at 10:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Tue, 2 Nov 2021 at 21:02, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > On Tue, Nov 2, 2021 at 6:50 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> > > > +       switch (trigger) {
>
> > > > +       default:
> > >
> > > > +               irq_set_handler_locked(d, handle_bad_irq);
> > >
> > > Why? You have it already in ->probe(), what's the point?
> >
> > So last time you asked about this, I explained a situation where
> > userspace first grabs a GPIO, set the interrupt to edge triggered, and
> > then later loads a driver that requests an unsupported IRQ type.
>
> I didn't get this scenario. Is it real?

No, it's totally made up, but I mean we even have tools like fuzzing
to help us find bugs that would never happen in real use cases.

> > Then
> > I'd like to set the handler back to handle_bad_irq so we don't get
> > weird interrupts, but maybe now you know a reason why that doesn't
> > matter or can't happen?
>
> In ->probe() you set _default_ handler to bad(), what do you mean by
> 'set the handler back to bad()'? How is it otherwise if you free an
> interrupt?

It might not be, but when not sure I thought it better to error on the
safe side.

> So, please elaborate with call traces what the scenario / use case you
> are talking about. If it's true what you are saying, we have a
> situation (plenty of GPIO drivers don't do what you are suggesting
> here).
>
> > > > +               return -EINVAL;
> > > > +       }
>
> ...
>
> > > > +       ret = reset_control_deassert(rst);
> > > > +       if (ret)
> > > > +               return dev_err_probe(dev, ret, "could not deassert resetd\n");
> > >
> > > > +       ret = devm_pinctrl_register_and_init(dev, &starfive_desc, sfp, &sfp->pctl);
> > > > +       if (ret)
> > >
> > > I don't see who will assert reset here.
> >
> > No, so originally this driver would first assert and then deassert
> > reset. I decided against that because in all likelyhood earlier boot
> > stages would have set pinmux up for a serial port, and we don't want
> > to interrupt the serial debug output. The only reason I make sure the
> > reset line is deasserted is in case someone makes a really minimal
> > bootloader that just does the absolute minimal to load a Linux kernel
> > and doesn't even log any anything.
> >
> > By the same token we also don't want to assert reset on error in case
> > it resets pin muxing for the the serial line that was supposed to log
> > the error.
>
> Perhaps comment in the code explaining this?

Sure.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
