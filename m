Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C6DC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 13:16:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25799610D0
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 13:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25799610D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7uFRwMg65u7UcSUExJ1IIAT5PXpB08lhNvQyASSKq1I=; b=MH0HEO+3DUlLjk
	zIrNEiSQrOUUjw9NFjTD1uC9UNqrfDGoCzZ6ilIfsJzU6zP/RzSWyFRTkM8HXbtFd27meH0kG5iX4
	JWHBykJHrMiTxYIRxItuV794X3wIpktSubb2zHbTKO7IvUc79XgXMd1uHnQuqU2ZzGHkZUHf9vKBc
	Fs8lYSdtksfOUKb4N5BFUD0X3oFDsA43jdEKhVlbK5C5YERhMdMm0++5V0j58uY4x3bKdJM4Mj/bu
	dQ60CiBPRxZrx1nT3+eMtg8xoI4Ep0Pms49yMBEbb7vCHZHKJb0GeqcZqS0McBRtElfBVU+cboldw
	VE7jUG04EVh8WbYF2M8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mduPA-00B47U-9I; Fri, 22 Oct 2021 13:16:16 +0000
Received: from mail-pj1-f51.google.com ([209.85.216.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mduMu-00B3XO-I8
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 13:13:58 +0000
Received: by mail-pj1-f51.google.com with SMTP id om14so2922335pjb.5
 for <linux-riscv@lists.infradead.org>; Fri, 22 Oct 2021 06:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3OEFGu3enLvj4SiHrgtW22LytEptjzZQ2XovqUzzJxs=;
 b=E5mNl/lQeH15s3C+/1tC8Rdji9aPfFMeeXwTR6irQfS44S22jJ1jsp78YD431Ilx1V
 BMJ3lCJ7iTkSUIf+M77ElIXqqJraZYVhNTuy/EuDeFbncxVPZj3BXOSUSWg07KDSj4+h
 JS8UkIzlhQBtF/2rn2kTb0QOKTehC+dLN7fkm2X6HedCO7CCiPy23TuqW3GQUd6dATat
 YKdniWIgqTQSSSnbdxFZz+JZ1pIpfj9NYnHXA503Dqx/Aqbfnjyw95eP5f4unCjCrO9v
 7+ToZr5nTBQNy1Cv25tI6Fm4n/nUuQ6piBPyTRlo9iscehu1K2g1c0QkYtJ2qpm1F5Qz
 bDbg==
X-Gm-Message-State: AOAM530D8NgP6DJUnPy8F3Pjyyop6/FC3NEvw+bKsbih6zbkk5ZNbGI8
 krG/anEzIgzRiMCcHt7gPxdOCt+orCT13OFMSW8=
X-Google-Smtp-Source: ABdhPJwdNKuFIRy3q4FG0qUqRpoxDObQ291Tb2SMDa/9Z3I5rVsMLHdpaoevze0fIUT7jxHb62MFoZMSVTU8r0ulBHA=
X-Received: by 2002:a17:90b:98:: with SMTP id
 bb24mr4342124pjb.194.1634908435520; 
 Fri, 22 Oct 2021 06:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-7-kernel@esmil.dk>
 <CAHp75VcS7ZZCciAgBH2QU7u8CiHzveAOsvSdv2DQBvpBn_6opQ@mail.gmail.com>
In-Reply-To: <CAHp75VcS7ZZCciAgBH2QU7u8CiHzveAOsvSdv2DQBvpBn_6opQ@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Fri, 22 Oct 2021 15:13:44 +0200
Message-ID: <CANBLGcyHpxuT9N+H8Lk=5CjMb1=-17_sH3dBzALCMYpAEZfeuw@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] clk: starfive: Add JH7100 clock generator driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Drew Fustini <drew@beagleboard.org>, Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_061356_643780_0681E279 
X-CRM114-Status: GOOD (  19.66  )
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

On Fri, 22 Oct 2021 at 14:34, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Thu, Oct 21, 2021 at 8:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> ...
>
> > +static struct clk_hw *clk_starfive_jh7100_get(struct of_phandle_args *clkspec, void *data)
> > +{
> > +       struct clk_starfive_jh7100_priv *priv = data;
> > +       unsigned int idx = clkspec->args[0];
> > +
> > +       if (idx >= JH7100_CLK_END) {
> > +               dev_err(priv->dev, "invalid clock index %u\n", idx);
> > +               return ERR_PTR(-EINVAL);
>
> After this
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?h=driver-core-next&id=7065f92255bb2468dbb9aa0537ff186ef64d5a02
> It's okay to use
>
> > +       }
>
>        if (idx >= JH7100_CLK_END)
>                return dev_err_probe(priv->dev, -EINVAL, "invalid clock
> index %u\n", idx);
>
> Ditto for other similar cases.

Hmm.. this function doesn't return int, but struct clk_hw *, hence the ERR_PTR.
Also I don't see any other similar cases in this driver.

> > +       if (idx >= JH7100_CLK_PLL0_OUT)
> > +               return priv->pll[idx - JH7100_CLK_PLL0_OUT];
> > +
> > +       return &priv->reg[idx].hw;
> > +}
>
> ...
>
> > +       while (idx)
> > +               clk_hw_unregister(&priv->reg[--idx].hw);
>
> I still consider that usual pattern, i.e.
>
>        while (idx--)
>                clk_hw_unregister(&priv->reg[idx].hw);
>
> but since you are pushing hard for your variant I'll leave it to the
> maintainers and author.
>
> --
> With Best Regards,
> Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
