Return-Path: <SRS0=I72s=P5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA390C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 08:05:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A797161152
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 08:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A797161152
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6vfuCtfJUaMov2N8RxcqUCewg6GFqm1gJf/VuYpNCmc=; b=EPZYL3UWW2BTVI
	Mj3tZzdVea/BapmTIDZAvPfanzyidJHRyoVv1O51eiNxxR3LLEn64cdyvJQoDbmGWnZfMhCgaV2xn
	YMiOmuWEvzg4OKuQW99OXDQ5a53tj5U0znyTmwvsg1dBkNVNDpy68b8PcPYNYkH5KDm121sHX77df
	zql5RN6Erx7Ok+aaVzutJ59gJHSd8fWerBIehmWy7bdqvDN4M+wpECUGlqEbzpQPQaQOj8HYkRCSE
	jyxq7mn8yigdP64MiKKn6sze45w/Kprbgm5W6/Cla/WnxGrn4W4cLKhF77KySmM3sDKaF0XnVjoLh
	9Qw6cC1lPFwZ/1ug1EWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkibd-004js8-BF; Wed, 10 Nov 2021 08:05:17 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkibb-004jrD-I8
 for linux-riscv@lists.infradead.org; Wed, 10 Nov 2021 08:05:16 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="293454452"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="293454452"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 00:05:14 -0800
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="545915896"
Received: from smile.fi.intel.com ([10.237.72.184])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 00:05:05 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andy.shevchenko@gmail.com>) id 1mkibE-005LVR-8K;
 Wed, 10 Nov 2021 10:04:52 +0200
Date: Wed, 10 Nov 2021 10:04:51 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
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
Message-ID: <YYt9I7hfugtpeALs@smile.fi.intel.com>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANBLGcxT_a3J+uaaKazRkfJQoBjGGGiz9agAZUzMEmfJiVXXbw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_000515_670875_B9E61600 
X-CRM114-Status: GOOD (  12.15  )
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

On Tue, Nov 09, 2021 at 10:04:24PM +0100, Emil Renner Berthing wrote:
> On Tue, 9 Nov 2021 at 21:29, Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Tue, Nov 9, 2021 at 10:40 AM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> No, I agree. I think it's only that Andy wasn't sure if these interim
> states might be meaningful/useful.

Exactly. Because HW could behave differently.

> > And if it is possible
> > to write DTS files that have states and sequence requirements,
> > these should be caught in validation. Should be.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
