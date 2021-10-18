Return-Path: <SRS0=TYB+=PG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3CCFC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 15:48:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE7C660F9F
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 15:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE7C660F9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mDSxTly04VjkOqdElq8pswm9grZJvcODaq+yftRt3Mc=; b=E2D6J+sbFasbaG
	5vQJz1a9x7Ql0McTRB/sGTygPA31L4C89WefzE839f67vocpA9eDDMT9za3KcpFDK2IeBoUCG+oR0
	ePgaKp1H5SPvYP0W3LdVSL0s1Tdmp7WgU5z0dv0rkyMh1HPOv2vCY2fKaDVcw4B5OBdXXspcuX6N2
	27kK2Yf7oh8E5ElpD78rb69VIxHLRjn7y6I+yKZrsbX84HFBfDTMh6EFUJ/uP1LM+Skr4IOsOCVoO
	on5Yw1bFOFBAQFNOF6dziUwmQkQcd8/tDdthkC4IfTwjEO+AAoZvVDjWXrksEHftrTQJKFBsMgET7
	/NHimg5CRrvJ6jU536JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcUs3-00GOcw-Js; Mon, 18 Oct 2021 15:48:15 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcUs1-00GOcI-Cf
 for linux-riscv@lists.infradead.org; Mon, 18 Oct 2021 15:48:14 +0000
Received: by mail-ed1-x530.google.com with SMTP id r18so900354edv.12
 for <linux-riscv@lists.infradead.org>; Mon, 18 Oct 2021 08:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v1PYM9PWLM/0wgTMMikzXAP/o0bC3fPRJxSFK9OzpC8=;
 b=bvoVUSzWgSETBCvh833uiGY27G23tFSf/9WrtIVPLQBgwK6Rj56yHcDtEdcQXJK7Hs
 luhJp0KZGQrxsbfoNkE5RJfauKWl2uWHDlCAiyzsGQSKxcfMUeJGY9OaCPv+uJHOiL+m
 wQAZH9S7oAwhLLA5wx0RUsVDSPnzETI4ObrFTk5aI1/w1NhbWB9qM3MgSHEzB3Ax34jC
 350PxSaiPWENuf/mGCHu/PNN6KbitZl5hauVjU1yPwIwyC2ocMIKVnqOwAyJMPw0zy6B
 PvHK7ZEIoSQUR5ab1xWb+E2xpIJ7jAiZ+3Tn/RUsB66/PcXaznkyvxejJlc+6kqYxjsi
 Ntow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v1PYM9PWLM/0wgTMMikzXAP/o0bC3fPRJxSFK9OzpC8=;
 b=B7T+WFya18yA2ZHvrYyMEeUSR6U1xOaU+llXcF42Fiydy/0nGg1lt67Pfr5Bjq1kbL
 hEf9iMUCuy8qlI52HRzSU28ZxcUfWDk5B75AGJnkwjSdlPCdWEuc2uXodKPiNPPCHeQa
 Ph126p26+eK5JrvElyJ5HaszcjSssFzELcvFtj0277N+fqQ2WbUonLkaew1P45cIP3jy
 E/kCb30+GQ/vL/SZoKr6aLpPqrVLQZINAp3VTBHzr+na/kArfrq/rUx0MdFF30Gvxf+k
 GY5oXILwTbYPiASk+k1NbhtIa0AbvoGXjYcDzksmEZYDh1UGVW/9NhfaZ29+XQd+/IGT
 f40g==
X-Gm-Message-State: AOAM532O4YSjXf5fble5uMsmz5AEhhtj9SXiKukBGKiliUEMKK6wRx0v
 nR/Z0vFDT5MhnG1HO0fhbRuiguAE0emHW3CFYTVHgM96T+H5fAntzco=
X-Google-Smtp-Source: ABdhPJz+JM3f/n/l/fo/vo7/jjTcnbAe1364W/IPs8Uv1VZE0XQpGmrpDB6SZ/1RGXPV+JzGalz543On+DjMTsOZ3lw=
X-Received: by 2002:a05:6402:2787:: with SMTP id
 b7mr44842444ede.238.1634572089268; 
 Mon, 18 Oct 2021 08:48:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk>
 <20211012134027.684712-13-kernel@esmil.dk>
 <CAHp75Vep+i+iyJi0LAOKuer-cUZoUoB_ZrWKcmT=EB_4hOgFGw@mail.gmail.com>
 <CANBLGcxHD2vy0+tXYo5Pkqri9mV7aD9jikvs3ygBJRxF4ApLMA@mail.gmail.com>
In-Reply-To: <CANBLGcxHD2vy0+tXYo5Pkqri9mV7aD9jikvs3ygBJRxF4ApLMA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 18 Oct 2021 18:47:17 +0300
Message-ID: <CAHp75Vc65deoHbks-aPmnjEJzm3GdqFMfBCUqw4vVLVr=71Ncg@mail.gmail.com>
Subject: Re: [PATCH v1 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
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
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Huan Feng <huan.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_084813_472573_66C99439 
X-CRM114-Status: GOOD (  25.31  )
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

On Mon, Oct 18, 2021 at 6:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Tue, 12 Oct 2021 at 19:03, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Tue, Oct 12, 2021 at 4:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

When answering, cut down your message to the point, please! It's a bit
annoying to remove overquoting...

...

> > > +               case PIN_CONFIG_BIAS_DISABLE:
> >
> > > +                       mask |= PAD_BIAS_MASK;
> >
> > Use it...
> >
> > > +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_DISABLE;
> >
> > ...here. Ditto for the similar cases in this function and elsewhere.
>
> I don't follow. How do you want me to use mask? If I did value =
> (value & ~mask) | PAD_BIAS_DISABLE; then I'd wipe the previous
> configuration. Eg. suppose the first config is the drive strength and
> second disables bias. Then on the 2nd loop mask =
> PAD_DRIVE_STRENGTH_MASK | PAD_BIAS_MASK and the drive strength value
> would be wiped.

Collect masks and new values in temporary variables and apply them
once after the loop is done, no?

...

> > > +       ret = clk_prepare_enable(clk);
> > > +       if (ret) {
> >
> > > +               reset_control_deassert(rst);
> >
> > Use devm_add_action_or_reset().
>
> I don't see how that is better.

Pity. The rule of thumb is to either try to use devm_*() everywhere in
the probe, or don't use it at all. Above is the more-or-less standard
pattern where devn_add_action_or_reset() is being used in the entire
kernel.

> Then I'd first need to call that and
> check for errors, but just on the line below enabling the clock the
> reset line is deasserted anyway, so then the action isn't needed any
> longer. So that 3 lines of code for devm_add_action_or_reset +
> lingering unneeded action or code to remove it again vs. just the line
> above.

Then don't use devm_*() at all. What's the point?

...

> > > +       sfp->gc.of_node = dev->of_node;
> >
> > Isn't GPIO library do this for you?
>
> If it does I can't find it.

Heh... `man git grep`
Hint: `git grep -n 'of_node = .*of_node' -- drivers/gpio/gpiolib*`

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
