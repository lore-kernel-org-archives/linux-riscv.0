Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D150C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 15:25:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 612D16112F
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 15:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 612D16112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=so4thVxgQu0/453ztwtxjfhwPlGed03k73oBTTKsM0g=; b=P3WbPpW2hdsdEH
	cnOrdY7TyQYacGIFhgTfWMc65XzcP02oahSvzFuA0mSELkcasho1ZlEAerk3B/a+ZAFofPyOuvuoq
	JYurhdLbFnp70J1SS1fKhdvK6iYNqwgHeSGxIEFBDLqXw+TjAa3pHWRciqgdv4pDcS+MgELDipafD
	82rioxhjlLBIxhQRAUgXQtpZJeI9O97m0zgKEyfNJgxmQ0y66aJ7REWDp2+RWvWs6NRgg4JXjgqF2
	GrfYw46Rl07z5N623DHZfhld4mJXvbCRKgtSyfMMJS5XqLp6fzZYhPqYbtt/iIAkHVPT+z21wKsnN
	1OTBjXSunV302OoEPmww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdwQ5-00BPfi-H4; Fri, 22 Oct 2021 15:25:21 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdwQ2-00BPea-JW
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 15:25:20 +0000
Received: by mail-ed1-x532.google.com with SMTP id u13so220075edy.10
 for <linux-riscv@lists.infradead.org>; Fri, 22 Oct 2021 08:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kgqxWvGntkbiXk1ztGJLZLwojodbAYgPdM6m7PSmewA=;
 b=WdVC29wguinmC3yuoVUr5ML6+H+CS6ZdeRR/YJeyz0O/ZQo45d8T9XdWhomfnjSVHd
 g3CJy6Nb9uiF/XGvjiN66mba5qCdBkqEstdLIlA5mrZYtzHVIJLvKck4OTuIxKhv+hy/
 dblks/vOB4eLhuwBr6oI5p/CXr+xSl6OSzKu3H43964vdf8hW3biLDa/NgCJHzsrjfGp
 6KAEky8qLzFsCHVc3KJTae2k/jIPB1myunH0C7WztFrMIMLZizaa7vIkPCMOoxpTma5Q
 pSB8OvYKauGBYkVQlMHML+/V0vENhcFHQ1rZeUbDd70KSH0cQMuoQIojhTt9Zl5QRC5l
 Td+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kgqxWvGntkbiXk1ztGJLZLwojodbAYgPdM6m7PSmewA=;
 b=tQT1dXxibqFaZq9ObMdZRd+eKWcb57YaVb6esEUaN8jP9L5LTCE6ItBpp01hqR+ddB
 gfw7RwhrI1Fj6/tfE1RcERCywGxckrvDI8+hBEfnMiFI1AsPHLXY7aIRRPQyFAANDCiH
 c1DuiPaMv1HPpoydHARxu66YLlwvnyGtqaDInfL4eFx+/FBwrElqSJwE7sxrJgodN+Dy
 OAvwjX67J9pSYuCqAUBe4qQZg/Y/NoP7+m6qQ1IRkN1bdOzEoxeEX2gLvBbJVTTriKp3
 wElbVxysp4EHzNwXEQJ7D2wBsdkJf+nMnkCzbRKCLvYBzbP0MwDTwoqOOGd+DZckVS9/
 f5Og==
X-Gm-Message-State: AOAM5311zj1XUmFa2E+lPFkbzMZH8YyaeZTo3p82zIvXvyl97Ufn/kbE
 8g8olg0VGxuoH57Lf0jGw1BL/H6LToeEKGJSCQI=
X-Google-Smtp-Source: ABdhPJwutL0TpkILUaJQpT9WTYSqqjzAMw3LFuNwxPeej7qk+YCVJ8tGy2Wz/Dne2ys3IkY8MRAys3VYHZ2n+YrKIm4=
X-Received: by 2002:a17:906:eb86:: with SMTP id
 mh6mr254287ejb.141.1634916316641; 
 Fri, 22 Oct 2021 08:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-10-kernel@esmil.dk>
 <CAHp75VcUv6WH0--FANpRExCdEOJNVo8KCtJ2Go090=FZq-Y0UQ@mail.gmail.com>
 <CANBLGcysKdqo+FioSkhd1PZRLzPF=fRJrCTsUGR7vXcn2WpYHg@mail.gmail.com>
 <CAHp75VditKnEcPKgqxz7NfG3ZWLZCu=pW=8qw7HS_iWePTj5Qw@mail.gmail.com>
 <CANBLGcyaSgbOgA4u_QivUQicyZ0MuUmrSsPq56OAANsav8R=VQ@mail.gmail.com>
 <CAHp75Vf=fGn33JFa-8UwCzv7A6AgHdnvfoabKnCcuKZxOyWX2Q@mail.gmail.com>
 <CANBLGcwZG-HpMuyw0LTGY2fwOJTgcMW7V_6kb=CFhX-Y5RjQSA@mail.gmail.com>
In-Reply-To: <CANBLGcwZG-HpMuyw0LTGY2fwOJTgcMW7V_6kb=CFhX-Y5RjQSA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 22 Oct 2021 18:24:20 +0300
Message-ID: <CAHp75VfwmSfeUPvUXT3TTf0ZYGMfBZ0qaPoB0_SCzyR=Fb_Emw@mail.gmail.com>
Subject: Re: [PATCH v2 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
To: Emil Renner Berthing <kernel@esmil.dk>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_082518_687919_0F3A0B9E 
X-CRM114-Status: GOOD (  28.04  )
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

On Fri, Oct 22, 2021 at 5:56 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Fri, 22 Oct 2021 at 16:50, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Fri, Oct 22, 2021 at 5:25 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > On Fri, 22 Oct 2021 at 15:39, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > On Fri, Oct 22, 2021 at 4:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > > > On Fri, 22 Oct 2021 at 14:56, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > > > On Thu, Oct 21, 2021 at 8:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > > > > > Why all these ugly % 32 against constants?
> > > > >
> > > > > Because the JH7100_RST_ values goes higher than 31. There is a
> > > > > BIT_MASK macro, but that does % BITS_PER_LONG and this is a 64bit
> > > > > machine.
> > > >
> > > > And? It's exactly what you have to use!
> > >
> > > So you want me to use an unsigned long array or DECLARE_BITMAP and
> > > juggle two different index and bit offsets?
> >
> > What are the offsets of those status registers?
> > AFAICS they are sequential 4 32-bit registers.
>
> That's right, but we're on a 64bit machine, so DECLARE_BITMAP will
> give us an unsigned long array that doesn't match that.

I didn't get it, sorry.
You will have a bitmap array which you will split to 32-bit values.
What you will probably need is to move  xgpio_get_value32() and void
xgpio_set_value32() to the one of bitmap related headers (look for
bitmap_get_value8() and friends).

> > So bitmap is exactly what is suitable here, you are right!
> > See gpio-xilinx and gpio-pca953x on how to use bitmaps in the GPIO drivers.
>
> None of them has a pre-initialized const DECLARE_BITMAP, so they don't
> have to deal with the 4 vs. 2 commas problem.

I believe it's well possible to refactor this to look much better with
bitmaps (as it represents the hardware very well).

> > > Also is there a macro for handling that we'd then need 4 commas on
> > > 32bit COMPILE_TEST and 2 commas on 64bit?
> > > If you have some other way in mind you'll have to be a lot more explicit again.
> > >
> > > The point of the jh7100_reset_asserted array is that it exactly
> > > mirrors the values of the status registers when the lines are
> > > asserted. Maybe writing it like this would be more explicit:
> > >
> > > static const u32 jh7100_reset_asserted[4] = {
> > >         /* STATUS0 register */
> > >         BIT(JH7100_RST_U74 % 32) |
> > >         BIT(JH7100_RST_VP6_DRESET % 32) |
> > >         BIT(JH7100_RST_VP6_BRESET % 32),
> > >         /* STATUS1 register */
> > >         BIT(JH7100_RST_HIFI4_DRESET % 32) |
> > >         BIT(JH7100_RST_HIFI4_BRESET % 32),
> > >         /* STATUS2 register */
> > >         BIT(JH7100_RST_E24 % 32),
> > >         /* STATUS3 register */
> > >         0,
> > > };

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
