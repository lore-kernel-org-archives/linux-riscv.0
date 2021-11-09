Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17DD7C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 20:29:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C485D6112F
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 20:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C485D6112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sWKX2UoAwRUbePrtCGZGyRH1cnUoQBcQKveq6aMyi84=; b=qbW74kmcRFzXmK
	A4WPardBim1NZPzRHF6LyN4YT35evNEW3zXv6zqO7fbkwF1vrMpiAc9ATfWO6XVg777AvrJ7OBw26
	DHB9Eh/iTs8e84dQCLf3JkloXrv5AyLZ0MkKjNb7OIDDJJDrRM8wjDCAL3pMhhL1n1cIEcOr9Fssz
	+O+e9slOobFYPusiviut0uP/wCCwd5W+MwM5j70qc1llMk/uSNJL52HttKP8Orc4I/n4FczYUEPwr
	l79ee0jhr2IySkqZyc2Kywst7ZmewA1wpCyrw6XFSdn1/w8VVVYXCTlbCqzN3yuX3mvN9g+ycuzbt
	qziLoWRHEwwp0Ccj/7ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkXkU-003DTi-MV; Tue, 09 Nov 2021 20:29:42 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkXkR-003DT1-HX
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 20:29:40 +0000
Received: by mail-ot1-x332.google.com with SMTP id
 q33-20020a056830442100b0055abeab1e9aso486452otv.7
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 12:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mcjMHcwYzwBgvUlsJJw9+Jv9JVC62owaRPJ/yUM6y5U=;
 b=OweV8gSNpr/wemLfT5r5RqLdeNQQkyD/5uhlgtWeguJV2kW4kusfjz5uEepsm35Uhz
 zxR38DUI8/IDIgxkpQz0Tr9dwCnxanyqiqv/JOp8GMlFop+gP+rMEs9Mhbm8m9bOx212
 6oyJhJb6BNDTip5qNk1mjb8MZbGv7koOtqGXg1JXtimY92OdEVIub6loTlg0f4f4g9Mp
 U9khgkYKVjZK/5/igWUFPJBklDaIWAgtGhHPLcTG0hS0KLbmatF62yQe54EL0uzApfg7
 x8JIp4TmUBJP4w/9BfWDl1KDTkR5EAu60nNT8PYwktSPJrYlp4yUEqClTkbZC2OlPz8j
 yE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mcjMHcwYzwBgvUlsJJw9+Jv9JVC62owaRPJ/yUM6y5U=;
 b=2ks0Iqjov1Ehoy2znKwyhKgtctTo000aD6Zjn8caXC+XdLxf2xzBNK21SbCXfB099w
 Crv23/0X6q5JLYuY2+tBtjtudUiOi+iSKUbjR69kGGL4s/+GyV0zJ1ggB6+m0Qouu9Rh
 V/4kEup8mNG8x/sFA1pfRnSbmOhh3I0WK5b/as4fdpvwl7IrcRw9zPMbKEPC3k3PtIFG
 m3LyyoxUYVMkbnxD8+CeYj1e4cRzJVUsRrvo1XfvFc2IRfZSzlDTcPzzXiRFZitIRenx
 y09mfKx2U3z0AW5xN3AvU1KVETyZKdos+z+pox3AQxxnDPzdWgRBAKISV4Mu1VtEd2Ut
 jVlQ==
X-Gm-Message-State: AOAM532l3733wECNA6m0ngHCm7aQTccDdvPghgm3fwpw7hFLprGauhUh
 ZjmvRiYwqYNxcSmGqG2l1fBkQIvGKuz+Sfo9GhsIDQ==
X-Google-Smtp-Source: ABdhPJx79vAz5xo21O8AcZjHZ2iz/cgsFzrU7PqDL77Snjbftb5loWoN2JiL02a01H3N9KzF4bFY81wiDaHO8sIEFIQ=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr8156814otj.35.1636489774773;
 Tue, 09 Nov 2021 12:29:34 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-13-kernel@esmil.dk>
 <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
 <CAHp75VcuGdaq_TjjRS0S8R5y-nryLABZSp7ehrXz-fUS2W3vfA@mail.gmail.com>
 <CACRpkdYe-tW2K2eOQa+FYb-ZXzrA95+pPc6kkLB8ZJLAT8G_eA@mail.gmail.com>
 <CANBLGcyo3YjygkjDmdjt4C_H=MZdHQwqumsxnatuObeP2LADAg@mail.gmail.com>
 <CAHp75VdBaKZVeA7dasHWP4E3c8F2phaGz-90FErj3bB8FJOS9w@mail.gmail.com>
 <CANBLGcw7X9SY3_=A7ZXW60646vconjCbYBsvb=D2a0BPcyn75A@mail.gmail.com>
In-Reply-To: <CANBLGcw7X9SY3_=A7ZXW60646vconjCbYBsvb=D2a0BPcyn75A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 9 Nov 2021 21:29:22 +0100
Message-ID: <CACRpkda7b+j1=X9rUrqwEFhxvp2zVTvFkxanjh3hL7AksqCX1g@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, 
 linux-clk <linux-clk@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
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
X-CRM114-CacheID: sfid-20211109_122939_613210_DE9FE94D 
X-CRM114-Status: GOOD (  19.94  )
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

On Tue, Nov 9, 2021 at 10:40 AM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Tue, 9 Nov 2021 at 10:34, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> > > The order the different states are blinked depends entirely on
> > > how the pinctrl framework parses the device tree. I still think it
> > > would be more natural to cleanly go to the end result without this
> > > blinking.
>
> Hmm.. but if going through the different states is what you want, then
> wouldn't you need the device tree to have an ordered list of the
> states rather than just a single node and also a way to tune how long
> time the different states are blinked?

In a way you are correct that the DT is a functional language and it's
a bit lite a style sheet or prolog or something in that the end reduction
is what counts.

In this case, I would say something is weird if there are interim states,
the yaml validation should not allow you to set the same thing back
and forth in your DTS file.

Alas we are not perfect as in yaml validation isn't perfect either.
I can't see what the problem is really, just write proper DTS files
and there will not be any interim states, right? And if it is possible
to write DTS files that have states and sequence requirements,
these should be caught in validation. Should be.

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
