Return-Path: <SRS0=I72s=P5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBC1C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 11:15:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CF8661055
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 11:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8CF8661055
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3IoJVZOYfg1khEpjOFZK/XugE/D34W63h3BQqUudMPY=; b=PED9qkMKsxErhg
	u2ms7UXw5h+0CYztkIe5RDvHo996PWXtSVZhLHOKBo5sv96UkvGSWKc3hCXLh12Vm8ekQUyakx5vZ
	SGHBEZlJhvdKK3p2NBQrd2GwUBDBy8+F1NdjzVxymgocpTUR9ulBw9Uud+TWTcVFl9Z+TCK55wyAa
	JUu5JGCYxkNFhkT4v0SxU5bumd734Z6AgTDie9OfQBRafujzDb+hh6mSRur6hjw0Gl+YLSA0wQBND
	Nw7UO/UPorlAsEDzvcENDQmxZxmKIKuC0VEdrPZdOc9pRj+HXO6KHYlrsbdKRRxJ4ZQ8EbyHp9IZK
	iB3b6UDd1V4s8ojWA87Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mklZh-005GdZ-HR; Wed, 10 Nov 2021 11:15:29 +0000
Received: from mail-pg1-f174.google.com ([209.85.215.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mklZd-005Gcs-IF
 for linux-riscv@lists.infradead.org; Wed, 10 Nov 2021 11:15:27 +0000
Received: by mail-pg1-f174.google.com with SMTP id p17so1974977pgj.2
 for <linux-riscv@lists.infradead.org>; Wed, 10 Nov 2021 03:15:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ClY6fmDoOxt9WGtpyKfVteeYzW6rEuh6CcP1PbPjKLs=;
 b=2HK7d7ka52YeIY7PASapJ/VDc6eKduvb40zrIMHCrFj/PP+uW7deRbK1ChbE0MRYdI
 oTmjsFO16Q4defX2AduhVhuxvkn9YDtrvkH7UYr5bGG6DVA0WshoWAO52n4/cevtHHQq
 WfeMBgMe4nnvRA2VP58EjA5C2Z1Eomc0L2zwuAeLF6kji65m5feHSeoH0DQ2y2SpqXPV
 xPXC+uIT8BWXVTY5XKqpwBb5w8mQctcbfqWoMI6/1VYOtyhs2qx0hZO2Z/c+wUtNt7cJ
 dw+u7RL+wGPAS+L4wMlcHAcx8gAIb7U+O3EzIq05u/ntrUuqC/HRcU1+ajRXn3Im6v7h
 b9TQ==
X-Gm-Message-State: AOAM531wwhCQxur31wgubzpoqKdb131x1L3rEr7I2qZthy4Bl9R7g5Gy
 UyYsoJzX8w/04K4jNIdH7amCMNm7WHNPeetLS40=
X-Google-Smtp-Source: ABdhPJytXP1IZu85W3D1n2+CMyE8syz896fxWd4se2sx5oabHakMgfHn+iJX8mmbMFqlgMuJ/UaEDepThBex+/NV1Mg=
X-Received: by 2002:aa7:91c5:0:b0:49f:a400:9771 with SMTP id
 z5-20020aa791c5000000b0049fa4009771mr15317197pfa.79.1636542923673; Wed, 10
 Nov 2021 03:15:23 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-13-kernel@esmil.dk>
 <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
 <CAHp75VcuGdaq_TjjRS0S8R5y-nryLABZSp7ehrXz-fUS2W3vfA@mail.gmail.com>
 <CACRpkdYe-tW2K2eOQa+FYb-ZXzrA95+pPc6kkLB8ZJLAT8G_eA@mail.gmail.com>
 <CANBLGcyo3YjygkjDmdjt4C_H=MZdHQwqumsxnatuObeP2LADAg@mail.gmail.com>
 <CAHp75VdBaKZVeA7dasHWP4E3c8F2phaGz-90FErj3bB8FJOS9w@mail.gmail.com>
 <CANBLGcw7X9SY3_=A7ZXW60646vconjCbYBsvb=D2a0BPcyn75A@mail.gmail.com>
 <CACRpkda7b+j1=X9rUrqwEFhxvp2zVTvFkxanjh3hL7AksqCX1g@mail.gmail.com>
 <CANBLGcxT_a3J+uaaKazRkfJQoBjGGGiz9agAZUzMEmfJiVXXbw@mail.gmail.com>
 <YYt9I7hfugtpeALs@smile.fi.intel.com>
In-Reply-To: <YYt9I7hfugtpeALs@smile.fi.intel.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Wed, 10 Nov 2021 12:15:12 +0100
Message-ID: <CANBLGcwA8q5JRizzaSQKyMAMLmC1eF8tL=z5EJ2PK89488NJFg@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jiri Slaby <jirislaby@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Drew Fustini <drew@beagleboard.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>, Fu Wei <tekkamanninja@gmail.com>, 
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Huan Feng <huan.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_031525_623758_E8CA3B17 
X-CRM114-Status: GOOD (  20.74  )
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

On Wed, 10 Nov 2021 at 09:05, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Tue, Nov 09, 2021 at 10:04:24PM +0100, Emil Renner Berthing wrote:
> > On Tue, 9 Nov 2021 at 21:29, Linus Walleij <linus.walleij@linaro.org> wrote:
> > > On Tue, Nov 9, 2021 at 10:40 AM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> ...
>
> > No, I agree. I think it's only that Andy wasn't sure if these interim
> > states might be meaningful/useful.
>
> Exactly. Because HW could behave differently.

Right. But I think we've now established that what is described in the
device tree is the state the pins should be in after the function has
been called, eg. only the reduction matters, and any interim states
would just be a byproduct of storing the state in the configs list.

> > > And if it is possible
> > > to write DTS files that have states and sequence requirements,
> > > these should be caught in validation. Should be.
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
