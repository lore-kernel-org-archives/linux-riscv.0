Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D1FC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 09:40:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 756E460E95
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 09:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 756E460E95
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xexE6Jnmtn5mW25eAlZh3F7XyF0j+W/SF5Kk+pGcItQ=; b=Sac48xsP3km5Rm
	RYd3myHjC3MVHwJ+77a4x8zkFdn2s2sGVk1BHHLK6l/MXow7ZDQ1yFhAIucTPf8lbeSJB17+vmQsH
	dJn8R6QsnwCT3UmFHpq1UXRL5ZBowuRVeXDHzlm2ftgLwCBIn8cOSJXPs/vNoN27EyBcUx7pM6SEN
	V3QJE6DznIZYcnlkyIHefFyg5dCrPSQZQn5ccarjuzkKJlpngKldxDA6Ic6hPAcd/yLKc6bjiSmZt
	/iJkTcDP8FjKw4SA6c24wrCg44OW7svrA2NZQRqm6EAEP+DRlofizkM9GzXp7uG45bry860oA33uZ
	wMhFJimfHWV8mkTy02kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdr2C-00AQGs-Uu; Fri, 22 Oct 2021 09:40:20 +0000
Received: from mail-pf1-f173.google.com ([209.85.210.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdr29-00AQFj-NI
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 09:40:19 +0000
Received: by mail-pf1-f173.google.com with SMTP id f11so3092833pfc.12
 for <linux-riscv@lists.infradead.org>; Fri, 22 Oct 2021 02:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2DRet2N5HhCm6h5wynnS1gaOYbkbGXzOrerbjjC0E3g=;
 b=UyeDJStXUS30lWu6RsVZ64cLubM5SkOapG3qaeMtmM0oayCxzoNGvoxq8UXqcYQyey
 7ZdYTAfpvrHJxO3bHpKo5xai6XKgJPxsuZLSd141JyUJHyVz+cB8cAqOOl90TLqz7DjP
 Be5F9a6v9+RucAQZXcQxsc3XSTTYykuHz+zNqtkYowlaEBZnoiguPyuh5WRELY1mZK1D
 GG5t1c0a9N7egV+N09Npb9PRiYbYbqcptfe4XinGrs+c+wkxXBCXT3jZIDEuCUUrEmFt
 iV92aX/Vr/6iAJjCJwHrf9SdvlwID5jWgEjGejCpN/8W0CQOMq6UxzLJ86pNkfSRnZZ8
 cWRg==
X-Gm-Message-State: AOAM531HRIJ2ZirUA9bJjmtv45/uL4ajz0qZpRFv4HekO+p1kqOO9aAa
 cGG4P92gW5K6VajPAvCe4X6OEvhkyer8qWb5YGk=
X-Google-Smtp-Source: ABdhPJyblyCb0CC4y8acTqNncuSqdbB5QocuyXB3xV6V6A5/kNsqxhKmEJEGhcR1xInlPyJlLfr9PFvQz/JeTr9ws8o=
X-Received: by 2002:a62:5257:0:b0:44c:ed84:350a with SMTP id
 g84-20020a625257000000b0044ced84350amr11091780pfb.79.1634895616438; Fri, 22
 Oct 2021 02:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-2-kernel@esmil.dk>
 <CAHp75VfD73Nsrp-3hMzFtuEAfka+rRc=2m0ZZYddhWBAzg=QAw@mail.gmail.com>
In-Reply-To: <CAHp75VfD73Nsrp-3hMzFtuEAfka+rRc=2m0ZZYddhWBAzg=QAw@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Fri, 22 Oct 2021 11:40:05 +0200
Message-ID: <CANBLGcxJGgi9nuT6LpjGgPj1bg0aW-ELRCAO0Csv3xi82gTCnQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] RISC-V: Add StarFive SoC Kconfig option
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_024017_802078_26981951 
X-CRM114-Status: GOOD (  19.92  )
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

On Fri, 22 Oct 2021 at 10:51, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Thu, Oct 21, 2021 at 8:42 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> >
> > Add StarFive Kconfig option to select SoC specific and common drivers
> > required for these SoCs.
>
> ...
>
> > +config SOC_STARFIVE
> > +       bool "StarFive SoCs"
> > +       select PINCTRL
> > +       select RESET_CONTROLLER
>
> > +       select SIFIVE_PLIC
>
> If this is well understood and platform related the above two are too
> generic. Why have you selected them?

From your last comments the criterion seemed to be to only add it here
if it would otherwise fail to boot. Well it does fail to boot without
the reset and pinctrl drivers. The clock driver too, but RISCV already
selects COMMON_CLK. Once PINCTRL and RESET_CONTROLLER is selected the
specific drivers defaults to SOC_STARFIVE.

Alternatively we'd select the drivers too, but I can't promise that
future StarFive chips will need the same JH7100 clock and reset
drivers. Doing it this way means that selecting SOC_STARFIVE by
default gives you a kernel that will boot on all StarFive SoCs, but
you can still customise it further to your particular chip. It seems
like SOC_SIFIVE is doing the same.

> > +       help
> > +         This enables support for StarFive SoC platform hardware.
>
> Not too much to read here. What is the point of this help?
> I would elaborate what kind of platform it may support, what kind of
> drivers it selects due to necessity of the accomplishing the boot
> process, etc.

This is exactly as the other descriptions in this file. I don't know
why SOC_STARFIVE should be special.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
