Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF90C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 09:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zGZ4Xr2z+aIAvoTHqRTzhCq+D/n1I4lgIPXktEADA2s=; b=2Px9jnPLzVmsHX
	dpOtWX0UjhBffUvxTfg/m3FiDXvNG/1xmWnPf5oKErzEtpvGWQ9Q+dWRgN8WYIFMiuu6Y/dh83woU
	34hxFKyxukVpJViIkqSfNlzoxBOwxHXDzVTCUx8bDdkaBmAC3tZ7f6JgoCTk8I2X5aUPUTKBrL0n7
	FZDTvP7P+RrHEVVXXhD+7RCu50kvQ0KhyqRxI8/I1O6LwdXRQHXhj3c8JSO0YOXZzZqbKjRoMiSZe
	d2dfV4f9YdUpaGkP4MQ0ad2c5yIzaZhsKWLS+TGgIteeB/DJ/BpqsShS/2N6YUEHOQuJouH+31Xni
	BD1y1p0z0IJxfDf0QoOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofe7Z-0096T0-9m; Tue, 04 Oct 2022 09:21:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofe7W-0096ST-7l
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 09:21:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664875306; x=1696411306;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KSstq/GCDUme5uuX6zJ9Gh7FdRRSeg4CqrX1gghhPcA=;
  b=ZW6cE/Ar6wiDWj5o5XZpB7xpePzTsiXwJ6KSW0JA9ZlXsdtuzrVvQ5M0
   t/JKJyiUThAv7K6yr2L4HQarxjkX3ciayFojV2pmskUTP89Dn6vmC5gU8
   lIVdjopf6zCrMv3np1/B5arjA07H6ecEiV2JQ4zaWjiiVzoIQLokU8YuN
   daZY/fEi9VQLWJQOdDi/w3FAE4f4qb8GluBDzBH3kuyc4qe8e+eAlnk3t
   W3TWCwjiVSlFi2C7fE18VhXxDkio9sEnc9FNSfbslClHaE7EoWX5RWm/v
   3VbVMgcK9FwLgaQ5TuG6hZGT4UGpf+KVS+HmxjlDI2GuQ6943SVRgmJwQ
   w==;
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200"; 
   d="scan'208";a="176914034"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Oct 2022 02:21:44 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 4 Oct 2022 02:21:43 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 4 Oct 2022 02:21:40 -0700
Date: Tue, 4 Oct 2022 10:21:18 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: Rob Herring <robh@kernel.org>, Hal Feng <hal.feng@linux.starfivetech.com>,
	Rob Herring <robh+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Philipp Zabel <p.zabel@pengutronix.de>, <devicetree@vger.kernel.org>, Albert
 Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, <linux-riscv@lists.infradead.org>,
	<linux-gpio@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v1 23/30] pinctrl: starfive: Rename "pinctrl-starfive" to
 "pinctrl-starfive-jh7100"
Message-ID: <Yzv7Dmc0/IbAystL@wendy>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220930061404.5418-1-hal.feng@linux.starfivetech.com>
 <166457324093.1075476.18009315584754055366.robh@kernel.org>
 <CACRpkdZmmMjVwpHxkJP+Ui0XJgrdZx8kpVybifbwkRB1_uMhAg@mail.gmail.com>
 <Yzv1uJbGMuFmRsRL@wendy>
 <CACRpkdZYXhc7phDmHrVwNzWWvjiQZHEsaQgdsbPF8JK-Yse_QQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdZYXhc7phDmHrVwNzWWvjiQZHEsaQgdsbPF8JK-Yse_QQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_022146_360155_2225744A 
X-CRM114-Status: GOOD (  26.90  )
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

On Tue, Oct 04, 2022 at 11:13:37AM +0200, Linus Walleij wrote:
> On Tue, Oct 4, 2022 at 10:59 AM Conor Dooley <conor.dooley@microchip.com> wrote:
> > On Tue, Oct 04, 2022 at 10:48:38AM +0200, Linus Walleij wrote:
> > > On Fri, Sep 30, 2022 at 11:28 PM Rob Herring <robh@kernel.org> wrote:
> > > > On Fri, 30 Sep 2022 14:14:04 +0800, Hal Feng wrote:
> > > > > From: Jianlong Huang <jianlong.huang@starfivetech.com>
> > > > >
> > > > > Add the SoC name to make it more clear. Also the next generation StarFive
> > > > > SoCs will use "pinctrl-starfive" as the core of StarFive pinctrl driver.
> > > > > No functional change.
> > > > >
> > > > > Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> > > > > Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> > > > > ---
> > > > >  .../bindings/pinctrl/starfive,jh7100-pinctrl.yaml           | 2 +-
> > > > >  arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts   | 2 +-
> > > > >  drivers/pinctrl/starfive/Kconfig                            | 2 +-
> > > > >  drivers/pinctrl/starfive/Makefile                           | 2 +-
> > > > >  .../{pinctrl-starfive.c => pinctrl-starfive-jh7100.c}       | 2 +-
> > > > >  .../{pinctrl-starfive.h => pinctrl-starfive-jh7100.h}       | 6 +++---
> > > > >  6 files changed, 8 insertions(+), 8 deletions(-)
> > > > >  rename drivers/pinctrl/starfive/{pinctrl-starfive.c => pinctrl-starfive-jh7100.c} (99%)
> > > > >  rename include/dt-bindings/pinctrl/{pinctrl-starfive.h => pinctrl-starfive-jh7100.h} (98%)
> > > > >
> > > >
> > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > >
> > > > Would be good to pull this out separately and apply for 6.1. It's kind
> > > > of messy with cross tree dependencies.
> > >
> > > OK I applied this for V6.1.
> >
> > Will this need to be done immutably so it can be pulled into the riscv
> > tree in case this gets applied as a late change for 6.1:
> > https://lore.kernel.org/linux-riscv/c5169131-486e-9808-ba48-b7abe1be6a99@collabora.com/
> 
> Always one finger on the fast-forward button have we? ;)

Dunno what you mean by that mate, sorry!

I just saw the mail wanted to have the decency to reply to that fellow
& tell him to rebase after rc1 to avoid a conflict.

> Rob's point was that I should apply this for v6.1 so that exactly
> that kind of cross-dependencies and immutable branches could
> be avoided for the v6.2 development cycle.
> 
> The merge window is already open, it's a bit late for completely
> new stuff I think.

History suggests otherwise, but I'd be lying if I said I disagreed.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
