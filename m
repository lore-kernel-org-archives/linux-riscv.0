Return-Path: <SRS0=1+LQ=PW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CB3C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Nov 2021 14:14:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 570BD6109F
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Nov 2021 14:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 570BD6109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u+bFxYPjh0FTS4eWxy3F+3Fe7KRo1ZVMNt2bmqiqdSo=; b=V9krrM7IGXQtLR
	GtaPx4JxJfZZLY3q3Sx/BrBcmds4+136MScI9QfmW96O4KMtnE5sf52rA47MeHMpsm8+DCUI3LX8j
	m2IWABeYyBhhYxG+BWSR1iEdyoXN+fveHSWcOcIkXw6TzUFGobOssphLIgSOm9BzQwWOYq+g6IFdj
	Vf9YfxV67KJRmaBkXVS0TyUuBoKAp+svVf+Bus7k2P/zgl/VttulL+iNm/cdSslIrBuqiXQw4ryhs
	nUuSUleGGtPyJjj2O5POHbUo458Mt6OqXHlbLHzf+6muTlq23qt7b9h50tuohwjtndg900wGRHXMp
	b96ajdUzS3NAsmoIi2rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miH25-005PDH-Mp; Wed, 03 Nov 2021 14:14:29 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miH22-005PCL-8a
 for linux-riscv@lists.infradead.org; Wed, 03 Nov 2021 14:14:27 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="292336321"
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; d="scan'208";a="292336321"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 07:14:21 -0700
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; d="scan'208";a="497603969"
Received: from smile.fi.intel.com ([10.237.72.184])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 07:14:15 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andy.shevchenko@gmail.com>) id 1miH1a-003HPW-Km;
 Wed, 03 Nov 2021 16:13:58 +0200
Date: Wed, 3 Nov 2021 16:13:58 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, Drew Fustini <drew@beagleboard.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Huan Feng <huan.feng@starfivetech.com>
Subject: Re: [PATCH v3 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
Message-ID: <YYKZJiv4SMQxrx7R@smile.fi.intel.com>
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-13-kernel@esmil.dk>
 <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
 <CANBLGczn8+po09wF_uEvvU8tLCn0ahY+Gkj9JJLxOcj1LC1aLA@mail.gmail.com>
 <CAHp75VetDHt9G+PT77_py8N4Z06j7oytnXgQq8zss_xZBBeEng@mail.gmail.com>
 <CANBLGczTnf1UrRt=d-czaG-CE=Rwb1x6MV4c97ia+P3u5Mt8Jg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANBLGczTnf1UrRt=d-czaG-CE=Rwb1x6MV4c97ia+P3u5Mt8Jg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_071426_393392_035274CA 
X-CRM114-Status: GOOD (  26.11  )
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

On Wed, Nov 03, 2021 at 01:35:23PM +0100, Emil Renner Berthing wrote:
> On Wed, 3 Nov 2021 at 10:13, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Tue, Nov 2, 2021 at 10:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > On Tue, 2 Nov 2021 at 21:02, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > On Tue, Nov 2, 2021 at 6:50 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > > > > +               irq_set_handler_locked(d, handle_bad_irq);
> > > >
> > > > Why? You have it already in ->probe(), what's the point?
> > >
> > > So last time you asked about this, I explained a situation where
> > > userspace first grabs a GPIO, set the interrupt to edge triggered, and
> > > then later loads a driver that requests an unsupported IRQ type.
> >
> > I didn't get this scenario. Is it real?
> 
> No, it's totally made up, but I mean we even have tools like fuzzing
> to help us find bugs that would never happen in real use cases.
> 
> > > Then
> > > I'd like to set the handler back to handle_bad_irq so we don't get
> > > weird interrupts, but maybe now you know a reason why that doesn't
> > > matter or can't happen?
> >
> > In ->probe() you set _default_ handler to bad(), what do you mean by
> > 'set the handler back to bad()'? How is it otherwise if you free an
> > interrupt?
> 
> It might not be, but when not sure I thought it better to error on the
> safe side.

With a dead code?

I do not believe there is an issue since. like I said, there are plenty drivers
that don't do what you are suggesting here --> 99.99% you added a dead code.

> > So, please elaborate with call traces what the scenario / use case you
> > are talking about. If it's true what you are saying, we have a
> > situation (plenty of GPIO drivers don't do what you are suggesting
> > here).

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
