Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F4DBC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 15:36:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81B156124A
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 15:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81B156124A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EpgPpuzLdfnNpvN+vo3zlX3I9mfULDRz4pY8CFuqcaE=; b=PMRS6RxStvck7O
	02YQKp51ZOenzswbxJByq53XrRev6qJdZ2C/Bo2SbLU+aMkvOWnV98l7Rf4Xa9CZi2Obx9wLnBhvb
	dtmS0BhTCmj3X5QwH1rpl6oRbsiMJ0/bYAyq4PmPPZJxtIObygqVQTfOIeaK70Qadd53EZ8TM6Y8I
	EtpAVdCjxRm4Cn854M2fP4KdmDiTc2N0xgh/TNlbCwcxcSCCjzItZYOV0gKdOUBtm/KmEykcKMhaZ
	8tNPooUa0ZZA6RarvSZ89Gy0Jbc2DOYDWrRhK0AeSl0xFF6AEcJ7o+bNbC8Ee0VMLPfkDlY4nJMkX
	8WZwFRyMci6kJc7d/S8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdwaz-00BQy8-JX; Fri, 22 Oct 2021 15:36:37 +0000
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdwaw-00BQw7-Aq
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 15:36:36 +0000
Received: by mail-pj1-f45.google.com with SMTP id om14so3237163pjb.5
 for <linux-riscv@lists.infradead.org>; Fri, 22 Oct 2021 08:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uc+CptoK4CgF4ldWzulgeZP99XuQqA9dacbA2WJ+66A=;
 b=sIF1+Y8T1jviOdhLSyAts3Si8A7ab+qRuIyCdwNM3U5gNvsOIsF9eq+Na5Jr1y1M4h
 1kPO80nMguHVe2TqavfZ/o42dHBnSmwPjrb5z2jhnx0Ur9CT2yzKfT/rn8i2BDO1llbC
 5SxVF2mLutgzafgjD8C/ubAY4DW17eo3bM9eKrI+b2ukC9m12RN6m6rxnXQhctrIvoVz
 tIUrWtVPwNQgGmFmgstZ7n7FVJhy6CBfetbCOLtScamX6zcip6KOEFkfPLHUmOJhcqAY
 CkjpKVWrYsnKaL2tTY6s14LArH9v/Pa1U9FGLOoiKQsYoJFPSR9B7hUga7R14aaIp6sd
 yz/g==
X-Gm-Message-State: AOAM530Uk4CrNAw6dje4crgb0RGkv8cN1QqGSVcExrsob+ds62d4rp+H
 RnGALOu+PduuJfNVfSBhEBZPM1u6jMxb1/YfRS4=
X-Google-Smtp-Source: ABdhPJwHDTxa4dCWQm1cgcpbHpLrGKYplB+GwvTwZZOODB2ZaW4AXitDmRyAhOnm9r5bKQ+Czw+ekExtq8CteP1Wahw=
X-Received: by 2002:a17:902:b102:b0:134:a329:c2f8 with SMTP id
 q2-20020a170902b10200b00134a329c2f8mr505153plr.71.1634916992946; Fri, 22 Oct
 2021 08:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-10-kernel@esmil.dk>
 <CAHp75VcUv6WH0--FANpRExCdEOJNVo8KCtJ2Go090=FZq-Y0UQ@mail.gmail.com>
 <CANBLGcysKdqo+FioSkhd1PZRLzPF=fRJrCTsUGR7vXcn2WpYHg@mail.gmail.com>
 <CAHp75VditKnEcPKgqxz7NfG3ZWLZCu=pW=8qw7HS_iWePTj5Qw@mail.gmail.com>
 <CANBLGcyaSgbOgA4u_QivUQicyZ0MuUmrSsPq56OAANsav8R=VQ@mail.gmail.com>
 <CAHp75Vf=fGn33JFa-8UwCzv7A6AgHdnvfoabKnCcuKZxOyWX2Q@mail.gmail.com>
 <CANBLGcwZG-HpMuyw0LTGY2fwOJTgcMW7V_6kb=CFhX-Y5RjQSA@mail.gmail.com>
 <CAHp75VfwmSfeUPvUXT3TTf0ZYGMfBZ0qaPoB0_SCzyR=Fb_Emw@mail.gmail.com>
In-Reply-To: <CAHp75VfwmSfeUPvUXT3TTf0ZYGMfBZ0qaPoB0_SCzyR=Fb_Emw@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Fri, 22 Oct 2021 17:36:21 +0200
Message-ID: <CANBLGcwz7s5OJer-37mQC2r_H0trec04S69ovYdU2_LbiVrtYw@mail.gmail.com>
Subject: Re: [PATCH v2 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
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
X-CRM114-CacheID: sfid-20211022_083634_402221_ED70322C 
X-CRM114-Status: GOOD (  32.46  )
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

On Fri, 22 Oct 2021 at 17:25, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Fri, Oct 22, 2021 at 5:56 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Fri, 22 Oct 2021 at 16:50, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > On Fri, Oct 22, 2021 at 5:25 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > > On Fri, 22 Oct 2021 at 15:39, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > > On Fri, Oct 22, 2021 at 4:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > > > > On Fri, 22 Oct 2021 at 14:56, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > > > > On Thu, Oct 21, 2021 at 8:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> ...
>
> > > > > > > Why all these ugly % 32 against constants?
> > > > > >
> > > > > > Because the JH7100_RST_ values goes higher than 31. There is a
> > > > > > BIT_MASK macro, but that does % BITS_PER_LONG and this is a 64bit
> > > > > > machine.
> > > > >
> > > > > And? It's exactly what you have to use!
> > > >
> > > > So you want me to use an unsigned long array or DECLARE_BITMAP and
> > > > juggle two different index and bit offsets?
> > >
> > > What are the offsets of those status registers?
> > > AFAICS they are sequential 4 32-bit registers.
> >
> > That's right, but we're on a 64bit machine, so DECLARE_BITMAP will
> > give us an unsigned long array that doesn't match that.
>
> I didn't get it, sorry.
> You will have a bitmap array which you will split to 32-bit values.
> What you will probably need is to move  xgpio_get_value32() and void
> xgpio_set_value32() to the one of bitmap related headers (look for
> bitmap_get_value8() and friends).
>
> > > So bitmap is exactly what is suitable here, you are right!
> > > See gpio-xilinx and gpio-pca953x on how to use bitmaps in the GPIO drivers.
> >
> > None of them has a pre-initialized const DECLARE_BITMAP, so they don't
> > have to deal with the 4 vs. 2 commas problem.
>
> I believe it's well possible to refactor this to look much better with
> bitmaps (as it represents the hardware very well).

Right, but how exactly? This works on on 64bit, but not with 32bit COMPILE_TEST:

static const DECLARE_BITMAP(jh7100_reset_asserted, JH7100_RSTN_END) = {
        /* STATUS0 register */
        BIT_MASK(JH7100_RST_U74) |
        BIT_MASK(JH7100_RST_VP6_DRESET) |
        BIT_MASK(JH7100_RST_VP6_BRESET) |
        /* STATUS1 register */
        BIT_MASK(JH7100_RST_HIFI4_DRESET) |
        BIT_MASK(JH7100_RST_HIFI4_BRESET),
        /* STATUS2 register */
        BIT_MASK(JH7100_RST_E24) |
        /* STATUS3 register */
        0,
};


> > > > Also is there a macro for handling that we'd then need 4 commas on
> > > > 32bit COMPILE_TEST and 2 commas on 64bit?
> > > > If you have some other way in mind you'll have to be a lot more explicit again.
> > > >
> > > > The point of the jh7100_reset_asserted array is that it exactly
> > > > mirrors the values of the status registers when the lines are
> > > > asserted. Maybe writing it like this would be more explicit:
> > > >
> > > > static const u32 jh7100_reset_asserted[4] = {
> > > >         /* STATUS0 register */
> > > >         BIT(JH7100_RST_U74 % 32) |
> > > >         BIT(JH7100_RST_VP6_DRESET % 32) |
> > > >         BIT(JH7100_RST_VP6_BRESET % 32),
> > > >         /* STATUS1 register */
> > > >         BIT(JH7100_RST_HIFI4_DRESET % 32) |
> > > >         BIT(JH7100_RST_HIFI4_BRESET % 32),
> > > >         /* STATUS2 register */
> > > >         BIT(JH7100_RST_E24 % 32),
> > > >         /* STATUS3 register */
> > > >         0,
> > > > };
>
> --
> With Best Regards,
> Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
