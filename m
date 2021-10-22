Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54200C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 15:54:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A2F260EBD
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 15:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A2F260EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eNfxIaH7hmMJoamuALgM2xwd58hwWkqTOhCuZtlsEsk=; b=Dto1eH8D7qJs0G
	N1Bm7b+U5VkytMcX0EhXTBqtnvro3S6KJt2Bh+WJfLEvCjtZOqGH5c0Lz9/o3Y736Jx9d/y6uDPhI
	29/lxULcMOyT0YoxeL/1/DL8IYRqvh+G2fa3P6a237Ou2/TgTzYRg3eICx152REWp+aJn4AX0s93x
	4HVGsaVtzl4oTaZ8D9lzdU+uVcetUF5hT2dPHySfrmbM+nWrNzf8XhO7upNBSIXPwIEqjSYqRaHmy
	AA+l225ahKfeRP6Q+cHs4c3ca23ZHOOYCyVg5sug2mW42+KWApjJjW2gouiKJeF7bOUlkZo9VoSvB
	PrJ2+gszuyLwvDx0SlzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdwsU-00BT81-Dj; Fri, 22 Oct 2021 15:54:42 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdwsR-00BT7G-1A
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 15:54:40 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10145"; a="216242445"
X-IronPort-AV: E=Sophos;i="5.87,173,1631602800"; d="scan'208";a="216242445"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 08:54:34 -0700
X-IronPort-AV: E=Sophos;i="5.87,173,1631602800"; d="scan'208";a="534971271"
Received: from smile.fi.intel.com ([10.237.72.184])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 08:54:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andy.shevchenko@gmail.com>) id 1mdwrs-00099C-P1;
 Fri, 22 Oct 2021 18:54:04 +0300
Date: Fri, 22 Oct 2021 18:54:04 +0300
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
Message-ID: <YXLenBb21jTZlGu0@smile.fi.intel.com>
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-10-kernel@esmil.dk>
 <CAHp75VcUv6WH0--FANpRExCdEOJNVo8KCtJ2Go090=FZq-Y0UQ@mail.gmail.com>
 <CANBLGcysKdqo+FioSkhd1PZRLzPF=fRJrCTsUGR7vXcn2WpYHg@mail.gmail.com>
 <CAHp75VditKnEcPKgqxz7NfG3ZWLZCu=pW=8qw7HS_iWePTj5Qw@mail.gmail.com>
 <CANBLGcyaSgbOgA4u_QivUQicyZ0MuUmrSsPq56OAANsav8R=VQ@mail.gmail.com>
 <CAHp75Vf=fGn33JFa-8UwCzv7A6AgHdnvfoabKnCcuKZxOyWX2Q@mail.gmail.com>
 <CANBLGcwZG-HpMuyw0LTGY2fwOJTgcMW7V_6kb=CFhX-Y5RjQSA@mail.gmail.com>
 <CAHp75VfwmSfeUPvUXT3TTf0ZYGMfBZ0qaPoB0_SCzyR=Fb_Emw@mail.gmail.com>
 <CANBLGcwz7s5OJer-37mQC2r_H0trec04S69ovYdU2_LbiVrtYw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANBLGcwz7s5OJer-37mQC2r_H0trec04S69ovYdU2_LbiVrtYw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_085439_142197_DA210226 
X-CRM114-Status: GOOD (  29.42  )
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

On Fri, Oct 22, 2021 at 05:36:21PM +0200, Emil Renner Berthing wrote:
> On Fri, 22 Oct 2021 at 17:25, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Fri, Oct 22, 2021 at 5:56 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > On Fri, 22 Oct 2021 at 16:50, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > On Fri, Oct 22, 2021 at 5:25 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > > > AFAICS they are sequential 4 32-bit registers.
> > >
> > > That's right, but we're on a 64bit machine, so DECLARE_BITMAP will
> > > give us an unsigned long array that doesn't match that.
> >
> > I didn't get it, sorry.
> > You will have a bitmap array which you will split to 32-bit values.
> > What you will probably need is to move  xgpio_get_value32() and void
> > xgpio_set_value32() to the one of bitmap related headers (look for
> > bitmap_get_value8() and friends).
> >
> > > > So bitmap is exactly what is suitable here, you are right!
> > > > See gpio-xilinx and gpio-pca953x on how to use bitmaps in the GPIO drivers.
> > >
> > > None of them has a pre-initialized const DECLARE_BITMAP, so they don't
> > > have to deal with the 4 vs. 2 commas problem.
> >
> > I believe it's well possible to refactor this to look much better with
> > bitmaps (as it represents the hardware very well).
> 
> Right, but how exactly? This works on on 64bit, but not with 32bit COMPILE_TEST:
> 
> static const DECLARE_BITMAP(jh7100_reset_asserted, JH7100_RSTN_END) = {
>         /* STATUS0 register */
>         BIT_MASK(JH7100_RST_U74) |
>         BIT_MASK(JH7100_RST_VP6_DRESET) |
>         BIT_MASK(JH7100_RST_VP6_BRESET) |
>         /* STATUS1 register */
>         BIT_MASK(JH7100_RST_HIFI4_DRESET) |
>         BIT_MASK(JH7100_RST_HIFI4_BRESET),
>         /* STATUS2 register */
>         BIT_MASK(JH7100_RST_E24) |
>         /* STATUS3 register */
>         0,
> };

BITMAP_FROM_U64() ?

> > > > > Also is there a macro for handling that we'd then need 4 commas on
> > > > > 32bit COMPILE_TEST and 2 commas on 64bit?
> > > > > If you have some other way in mind you'll have to be a lot more explicit again.
> > > > >
> > > > > The point of the jh7100_reset_asserted array is that it exactly
> > > > > mirrors the values of the status registers when the lines are
> > > > > asserted.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
