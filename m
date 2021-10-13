Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B618C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 17:50:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4E5660FDA
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 17:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4E5660FDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=89ZcWIzSGoUWjiefJPaSB+2KjV0LofVW+soy+Z02mQs=; b=j4SIpUkw6oUyjx
	RTYQ3K7RU0AgsGF/qgEYO7skri5R994ttQjRJpBQJV0/jZhF1HeAbnvuwAEJxzKVM/vQ+UFTQaF3c
	XqSkAhY1A91INLN4DNfmYyDe2Tv38Y6JnM1qQFq6CntlMfl2Jn+0WDYzOtBDf1uvbiGBzO5ZGGobA
	vdWgsCL+8t+h77qAZhcrURn2efuXFfPSoM4uA2P1ngrmsfw1pTdx+M+r79me282Pti+Tq2x55rOjI
	EXP0qbmfo8kFFNCDyLBkSOgoIwHwZkiiXLX9vUPscMga0McE2XmYofiwQA3z80N+ARqH5x7/H4YC9
	FPnfvYKe3dOGJgKEGY2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maiOQ-000Did-Jt; Wed, 13 Oct 2021 17:50:18 +0000
Received: from mail-ua1-f43.google.com ([209.85.222.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maiON-000DiE-U4
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 17:50:17 +0000
Received: by mail-ua1-f43.google.com with SMTP id h19so6171123uax.5
 for <linux-riscv@lists.infradead.org>; Wed, 13 Oct 2021 10:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tIi5T5N2/yaJwmSaNVNNDL3lEJSP+D3EZbhPxV9bN7g=;
 b=pW2J0Abu4pDcb9K9mz3HYOwt9SlVfuqqrs0k22aWVq5pQTyZpzlGPlckGyBA6oYGZL
 fRpI1mK6CqI6XoVf+scbKmw+IpK+nruDX3HxGAgrhQEIpTn8eLEr0LIyhNRiq3nhRjkr
 TFHESZMbov2ayYqkTMR0xZjXBsmQ7pJE9Asxe0i5cNdgW+H60tFe5AZ9UjcpHF2WOk4O
 9dnDh388lZ7uL7nRpGkWFaRX8oFfm3gHHUoOzZ9LxrMtiWc15/Qchbr31/bs/in2BYeM
 LHExam29e1sQ8ylTiI5zNfCAKUbrPXqI/SmtVOB0e1idyLFsQqk53e88mxH2KU4MDsMe
 I1jA==
X-Gm-Message-State: AOAM5338BzQ8xDqe3pOSA4D2/VR5b1eqnvvmSx09qED7hJaF+mUE5vsW
 ytTAo1nb09RBPhSr2eKEYHIS85E5erOkQiwnx+0=
X-Google-Smtp-Source: ABdhPJzI98rys3rSOTMBc774JLZNtowDx6KeQUTWoK/w1LLQIcU7V1QbgCRSZxN5x/TbAcms2qoGM52BOpUZIUalKpI=
X-Received: by 2002:a67:d583:: with SMTP id m3mr967150vsj.41.1634147413827;
 Wed, 13 Oct 2021 10:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk>
 <20211012134027.684712-13-kernel@esmil.dk>
 <CAHp75Vep+i+iyJi0LAOKuer-cUZoUoB_ZrWKcmT=EB_4hOgFGw@mail.gmail.com>
 <CANBLGczDZh+kLWM017mPenY8WO5OovH2DFUSS-shRD-aZVKa0A@mail.gmail.com>
 <YWc5zq0Moz3asWEa@smile.fi.intel.com>
In-Reply-To: <YWc5zq0Moz3asWEa@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Oct 2021 19:50:02 +0200
Message-ID: <CAMuHMdUBwUcs9GPWyrVqu=H1+VnXRzyTzT3XU2jASB+-VQ6axg@mail.gmail.com>
Subject: Re: [PATCH v1 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
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
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Huan Feng <huan.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_105015_992114_89B78DCD 
X-CRM114-Status: GOOD (  29.38  )
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

On Wed, Oct 13, 2021 at 6:58 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Oct 13, 2021 at 06:38:14PM +0200, Emil Renner Berthing wrote:
> > On Tue, 12 Oct 2021 at 19:03, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > On Tue, Oct 12, 2021 at 4:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

> > > > +               v = pinmux[i];
> > > > +               dout = ((v & BIT(7)) << (31 - 7)) | ((v >> 24) & 0xffU);
> > > > +               doen = ((v & BIT(6)) << (31 - 6)) | ((v >> 16) & 0xffU);
> > > > +               din  = (v >> 8) & 0xffU;
> > >
> > > What is this voodoo for?
> >
> > In order to do pinmux we need the following pieces of information from
> > the device tree for each pin ("GPIO" they call it):
> >
> > output signal: 0-133 + 1bit reverse flag
> > output enable signal: 0-133 + 1bit reverse flag
> > optional input signal: 0-74 + special "none" value, right now 0xff
> > gpio number: 0-63
> >
> > As the code is now all that info is packed into a u32 for each pin
> > using the GPIOMUX macro defined in the dt-binding header added in
> > patch 10. There is also a diagram for how this packing is done. The
> > above voodoo is for unpacking that.
> >
> > I'd very much like to hear if you have a better solution for how to
> > convey that information from the device tree to here.
>
> At very least this code should have something like above in the comment.

And perhaps introduce some helper macros to access the fields?

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
