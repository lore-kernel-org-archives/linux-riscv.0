Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E84CEC43217
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 10:52:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7B4560EE9
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 10:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7B4560EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79LDLgbOz1/au5qdPDo8KRcPNkUMTz62k+rjzvd4TLU=; b=CI40qxEjdCs2zR
	EK6jwdzR/PmG84Qk+ybxWCjVKV+vQSvgmrfX254Qv+fEBb9iPSZTykBEXXKy8SKpJuhw4PC4ApVtq
	0PtbjCkShY0mk3nA+kvQmt2T3x2+GEn+Xk0yiMuiW5JWqieVy9Js53kTQYVdwpfOouuipLhF2ec+2
	y87r297I/vceGw8WjSrgQwQa1Oiooc52ODti1JaZl10ajZHbYyoGQUzMU7+JWhXRMjqKyIMVMXDIY
	+oRgwU1rkBdScDBWC6DyWiW0cMS2nhxsXCgHAajXySID5e3C8ln46wBFyPKo0VS2ONU36U/HQ8uiJ
	1TyFvmeJ5QNWCT0lJmnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mexaP-00G81p-Pq; Mon, 25 Oct 2021 10:52:13 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mexaM-00G80P-R6
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 10:52:12 +0000
Received: by mail-ed1-x52c.google.com with SMTP id s1so15513222edd.3
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 03:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NjHry8Fv5zzV/JAApPjcefE7M+AQEl6U+mJvNnu7wyQ=;
 b=dFzeI9cZ5SddbIq480bmLmsT5M6Xll/8SFcq3UuBf1wdp8GUojw8+x0SEbwRukMVUh
 ALRnhxIHX6VZSIVB1copUjNOho/p5Ovbb96iZ5MA1o7ObzxZmg/a9bURhISSEIglU+A0
 myBzjtbmqWBKgZ3GGZdGmM/t3fOS33lyUvrVU9nboK7WJq0gKRSQKbGsxeaAWKez2iqt
 FyQuG147gFRbdne++zH7gwQT0kCgQYRLYqMGivJBFk23QcMQRdvVhT2ZeTSXMlsADgaW
 w+te6n8Dr/kp2kro+JMpnjcjrvvPcJLuWGPj1JUo1LSfsADYHTUEfwBXz4XS7UDs7V8q
 mIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NjHry8Fv5zzV/JAApPjcefE7M+AQEl6U+mJvNnu7wyQ=;
 b=vPu04iXFW2VUnTt+GXKoL5dIfVVrDgMFr8JefrO2xbjwTNPVKPPEEJVu0z8GaIWNeZ
 owBE3cWUlAADPK9JmteGoiubNzxgVDkBP0dEUVB2M+t5mNalzbIi8/0rvknW4jBb75yr
 2MtV4bgtI3caJVpF0efVA5flZs8stHV+Aw6XG3iGyMoPX4CT7QsUjcrAOcO30jxXmjDW
 nsgKbwNN3yEDJtL2+atIhsds5rDyVitdwH8O1O5oLWF+x8cCnthAw7ZNN/cZJaKo7Kiz
 GCipB6cDrhsxfw9TwOjqvU0yNCyFHCC7D+q7hT/b2jStgw9flpJKGAAhy/3BFSAiWX61
 Zltg==
X-Gm-Message-State: AOAM531FTueUsg+GSHQRHYxBQLucqIreAXSQiRNtlIdGWBuFsWDcMWnn
 gMPdu7tsphfcY0opre2H1QxZU1HjadA2ieHDJEVT3XV0K2BAaQ==
X-Google-Smtp-Source: ABdhPJzr/m0IXbfrBpHO+bWETekwH+mW5UDrGhdzAB/d5gzJ6NqY7h/m5pCFxn3ZIU5LNm2oLXH1TnyiqSFFdtv5ff0=
X-Received: by 2002:a17:907:7601:: with SMTP id
 jx1mr21787575ejc.69.1635159129379; 
 Mon, 25 Oct 2021 03:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-13-kernel@esmil.dk>
 <CAHp75Vf3yNoKxguHP3EPcRV_3tG++Fd=FVM0MXqW4_SmLA6HEw@mail.gmail.com>
 <CANBLGcxEwkcZn2CC69zLaVqL8ocS6r6HDaaoUF09gg1mpDxFzg@mail.gmail.com>
 <CAHp75Vc5-Sg-0kKN=OMs_2iJbtc+D9=f0-Sp+SpY5O3roU3XdA@mail.gmail.com>
 <CANBLGcxnmt4Ki4EHAXeoJX5mJMyeioZXhGaDsKm_wk86D4js3Q@mail.gmail.com>
 <CANBLGcyOfo3r0Viidf9kyW0Q9yD4uqTLm90+7O=T49v7ZHurfA@mail.gmail.com>
 <CAHp75Vc1EES8c7XD-MbQNdtCJA3YvvEYd3_e378rVCe6=AmhvQ@mail.gmail.com>
 <CANBLGczXN4JV1Xrym_YGiAvrOFwkd4-PDjfvL93ZMgePb7wFVA@mail.gmail.com>
In-Reply-To: <CANBLGczXN4JV1Xrym_YGiAvrOFwkd4-PDjfvL93ZMgePb7wFVA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Oct 2021 13:51:15 +0300
Message-ID: <CAHp75VdufyQpMVqhXK_UmOmsHSd8v2aDA-hKQNeQQfQF2-gJFA@mail.gmail.com>
Subject: Re: [PATCH v2 12/16] pinctrl: starfive: Add pinctrl driver for
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
 Michael Zhu <michael.zhu@starfivetech.com>, Fu Wei <tekkamanninja@gmail.com>, 
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Huan Feng <huan.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_035210_906325_15EF8675 
X-CRM114-Status: GOOD (  33.13  )
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

On Mon, Oct 25, 2021 at 1:24 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Mon, 25 Oct 2021 at 12:16, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Sun, Oct 24, 2021 at 12:29 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > On Sat, 23 Oct 2021 at 23:02, Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > > On Sat, 23 Oct 2021 at 22:29, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > > On Sat, Oct 23, 2021 at 9:46 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > > > > > I such cases where you get conflicting PIN_CONFIG_BIAS_* settings I
> > > > > > don't see why it's better to do the rmw on the padctl register for the
> > > > > > first bias setting only to then change the bits again a few
> > > > > > microseconds later when the loop encounters the second bias setting.
> > > > > > After the loop is done the end result would still be just the last
> > > > > > bias setting.
> > > > >
> > > > > It could be bias X followed by something else followed by bias Y. You
> > > > > will write something else with bias Y. I admit I don't know this
> > > > > hardware and you and maintainers are supposed to decide what's better,
> > > > > but my guts are telling me that current algo is buggy.
> > > >
> > > > So there is only one padctl register pr. pin. I don't see why first
> > > > setting the bias bits to X, then setting some other bits, and then
> > > > setting the bias bits to Y would be different from just setting all
> > > > the bits in one go. Except for during that little microsecond window
> > > > during the loop that I actually think it's better to avoid.
> > >
> > > Maybe an example is in order. Suppose we get strong pull-up, drive
> > > strength 3 and pull-down config flags (the strong pull-up and pull
> > > down flags conflict) and the padctl value is 0x0c0 (pull-up, input and
> > > schmitt trigger enabled). With your solution of just altering the
> > > padctl bits immediately we'd call starfive_padctl_rmw 3 times in rapid
> > > succession like this:
> > >
> > > starfive_padctl_rmw(pin, 0x130, 0x100);
> > > starfive_padctl_rmw(pin, 0x007, 0x003);
> > > starfive_padctl_rmw(pin, 0x130, 0x010);
> > >
> > > ..and the end result would be 0x0d3, although the strong pull-up would
> > > be enabled for the microseconds between the 1st and 3nd call.
> > > As the code is now it'd just directly do
> > >
> > > starfive_padctl_rmw(pin, 0x137, 0x013)
> > >
> > > ..which again results in 0x0d3, only without the microsecond blink of
> > > the strong pull-up.
> >
> > You missed the point. Hardware on the other end may behave well
> > differently in these two cases.
>
> Right, but that can never be an intended behaviour. Which of the
> conflicting bias settings comes first and is blipped before the 2nd
> remains entirely depends on how the pinctrl framework parses the
> devicetree. I'd much rather have it cleanly go to just one of the
> states, which might be the wrong one, but the conflicting bias
> settings are wrong to begin with.

That's why I said that is up to you and maintainers and people who
know hardware better than me.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
