Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64268C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 16:00:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBEA960F50
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 15:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EBEA960F50
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=31b+9wlDpwAlaPO6nstksJj5nXP355l54L6CmXEPDb0=; b=rUx1qLhcDwod9Y
	rd/ArkQJfW6wbKaWlS9mcPuJTBwgMmqK5dcm47HE5AZdA9IkNswFwdhSKNwO7bkNEMscGsMp7VJAd
	W8fNH2q38ZjeZVAxVHco7Hn3EKNLEiQbnUPoLtuFGE44+D33M+SYbTrNwa/zZEN8sdivrnQBSUJlI
	3muOlT2QgmeDtZ/smIxjvvBFtiy7YfdY50FitakFnrdeKOZV7eUgPUul/IYOEaiZVWQoZI+vGspvD
	7JJ9y4pNtVcdIxZwxSp6WPmjLxSiwym0NXtZWdNifOhIopsA69pJ1wSYG/hynx9lXdpSShr1d90UI
	QLpNWfplPe/8HtkfFpxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdwxR-00BTfH-HE; Fri, 22 Oct 2021 15:59:49 +0000
Received: from mail-pf1-f170.google.com ([209.85.210.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdwxO-00BTeT-8q
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 15:59:48 +0000
Received: by mail-pf1-f170.google.com with SMTP id m14so4015077pfc.9
 for <linux-riscv@lists.infradead.org>; Fri, 22 Oct 2021 08:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ve3WMv+ekDk2TdI4V72WJsoDE4qRPggIm2D4MYgIa/s=;
 b=is+D0r68gJnLmjkxA4aMiByrdRNevFhJlROpFVNoiwePg4k5gZBx8K9NthyUEttv5A
 4tPCskrF0gbFL3YSts4YcSBwq++UDPQCW7H5vrSEnYX4Eq34ffS2UA8Z6y2aTHxTBUgV
 FJ1N+HZlWpcZI64YmmDwUW6Z39dZx87aMHXYRB808A7Fxn58o/j1+64gabB2xavCtydv
 zrYVXVZ3kW/ZN1GeHG7+xnjOLOB+4/WBai7WPiTsm9TusAqMcGKRyMs+JUZITYpedsR8
 QDk192kvnOkXEU05fExV2OaZLtHT3Ngbhei31bh0E5Dv3ogBRIpFcDUNFWWCIGEHoaoc
 Sr0w==
X-Gm-Message-State: AOAM533ylBGwOvUreuGskTVGwKPLi/oYcsVLpUiWnX+W48LHrKc0N8hZ
 PlYiqBhFz3pcH9U8TBxlQoaZ7gFozYG3I5q/dCM=
X-Google-Smtp-Source: ABdhPJytmeUKXJ3sdL/RoZcFfoUxkwHNf715Lzot8ru5O13Qs3evLOYJia2m3U02KPExB+40zvfLAu1iZcMn5ibdDp4=
X-Received: by 2002:a63:2d46:: with SMTP id t67mr414276pgt.15.1634918385517;
 Fri, 22 Oct 2021 08:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-10-kernel@esmil.dk>
 <CAHp75VcUv6WH0--FANpRExCdEOJNVo8KCtJ2Go090=FZq-Y0UQ@mail.gmail.com>
 <CANBLGcysKdqo+FioSkhd1PZRLzPF=fRJrCTsUGR7vXcn2WpYHg@mail.gmail.com>
 <CAHp75VditKnEcPKgqxz7NfG3ZWLZCu=pW=8qw7HS_iWePTj5Qw@mail.gmail.com>
 <CANBLGcyaSgbOgA4u_QivUQicyZ0MuUmrSsPq56OAANsav8R=VQ@mail.gmail.com>
 <CAHp75Vf=fGn33JFa-8UwCzv7A6AgHdnvfoabKnCcuKZxOyWX2Q@mail.gmail.com>
 <CANBLGcwZG-HpMuyw0LTGY2fwOJTgcMW7V_6kb=CFhX-Y5RjQSA@mail.gmail.com>
 <CAHp75VfwmSfeUPvUXT3TTf0ZYGMfBZ0qaPoB0_SCzyR=Fb_Emw@mail.gmail.com>
 <CANBLGcwz7s5OJer-37mQC2r_H0trec04S69ovYdU2_LbiVrtYw@mail.gmail.com>
 <YXLenBb21jTZlGu0@smile.fi.intel.com>
In-Reply-To: <YXLenBb21jTZlGu0@smile.fi.intel.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Fri, 22 Oct 2021 17:59:34 +0200
Message-ID: <CANBLGcyOiOCeSg0ZHxHjOcpHT9HQ0X3_8Ovff4u2qOnB7BWOsw@mail.gmail.com>
Subject: Re: [PATCH v2 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
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
 Jiri Slaby <jirislaby@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, 
 Sagar Kadam <sagar.kadam@sifive.com>, Drew Fustini <drew@beagleboard.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>, 
 Fu Wei <tekkamanninja@gmail.com>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_085946_337651_566B642B 
X-CRM114-Status: GOOD (  32.01  )
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

On Fri, 22 Oct 2021 at 17:55, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Fri, Oct 22, 2021 at 05:36:21PM +0200, Emil Renner Berthing wrote:
> > On Fri, 22 Oct 2021 at 17:25, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > On Fri, Oct 22, 2021 at 5:56 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > > On Fri, 22 Oct 2021 at 16:50, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > > On Fri, Oct 22, 2021 at 5:25 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> ...
>
> > > > > AFAICS they are sequential 4 32-bit registers.
> > > >
> > > > That's right, but we're on a 64bit machine, so DECLARE_BITMAP will
> > > > give us an unsigned long array that doesn't match that.
> > >
> > > I didn't get it, sorry.
> > > You will have a bitmap array which you will split to 32-bit values.
> > > What you will probably need is to move  xgpio_get_value32() and void
> > > xgpio_set_value32() to the one of bitmap related headers (look for
> > > bitmap_get_value8() and friends).
> > >
> > > > > So bitmap is exactly what is suitable here, you are right!
> > > > > See gpio-xilinx and gpio-pca953x on how to use bitmaps in the GPIO drivers.
> > > >
> > > > None of them has a pre-initialized const DECLARE_BITMAP, so they don't
> > > > have to deal with the 4 vs. 2 commas problem.
> > >
> > > I believe it's well possible to refactor this to look much better with
> > > bitmaps (as it represents the hardware very well).
> >
> > Right, but how exactly? This works on on 64bit, but not with 32bit COMPILE_TEST:
> >
> > static const DECLARE_BITMAP(jh7100_reset_asserted, JH7100_RSTN_END) = {
> >         /* STATUS0 register */
> >         BIT_MASK(JH7100_RST_U74) |
> >         BIT_MASK(JH7100_RST_VP6_DRESET) |
> >         BIT_MASK(JH7100_RST_VP6_BRESET) |
> >         /* STATUS1 register */
> >         BIT_MASK(JH7100_RST_HIFI4_DRESET) |
> >         BIT_MASK(JH7100_RST_HIFI4_BRESET),
> >         /* STATUS2 register */
> >         BIT_MASK(JH7100_RST_E24) |
> >         /* STATUS3 register */
> >         0,
> > };
>
> BITMAP_FROM_U64() ?

So you think this is better?

static const DECLARE_BITMAP(jh7100_reset_asserted, JH7100_RSTN_END) = {
        BITMAP_FROM_U64(
                /* STATUS0 register */
                BIT_MASK(JH7100_RST_U74) |
                BIT_MASK(JH7100_RST_VP6_DRESET) |
                BIT_MASK(JH7100_RST_VP6_BRESET) |
                /* STATUS1 register */
                BIT_MASK(JH7100_RST_HIFI4_DRESET) |
                BIT_MASK(JH7100_RST_HIFI4_BRESET)
        ),
        BITMAP_FROM_U64(
                /* STATUS2 register */
                BIT_MASK(JH7100_RST_E24) |
                /* STATUS3 register */
                0
        ),
};

> > > > > > Also is there a macro for handling that we'd then need 4 commas on
> > > > > > 32bit COMPILE_TEST and 2 commas on 64bit?
> > > > > > If you have some other way in mind you'll have to be a lot more explicit again.
> > > > > >
> > > > > > The point of the jh7100_reset_asserted array is that it exactly
> > > > > > mirrors the values of the status registers when the lines are
> > > > > > asserted.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
