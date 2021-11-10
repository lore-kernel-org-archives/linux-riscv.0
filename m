Return-Path: <SRS0=I72s=P5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A12C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 16:35:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FC9161058
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 16:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4FC9161058
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mCfyGo0HPdiewuZojxyj+qhtvhHI3zI8hQFCAYvXNgA=; b=RjIAOoY0LgLi+c
	wGheHUJitaMlCmVlywyKX3t6Pw8jKkGAHNgF+odE1Aji5mTrxFE62trUm7bw1V8kW1FY4Yrjp7PN1
	bZyaEEOPK/dbjk3KCJiMKE6gIICfXWwpue20V6ooiMl1wAMVW/ygTfIB0NYjybSCoszprNnz9LmE5
	Rm7S0XeSvYGMXcy+x8WssBxhfsvqKUva8RQK9qTRrgXjWIK8Q4bolc7QKmG0yza38Gd6Dm0E7xs0V
	YSldfgYVDGwUsxpAcv0asPp5i7abCalDhRCVJugC4cSNJg7Ipfl/R/LIFYCGtjWTqro9NC+Qw68ZZ
	UUAZLYLl2VLYMmofNgpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkqYx-005pbZ-5f; Wed, 10 Nov 2021 16:35:03 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkqYu-005paq-Gt
 for linux-riscv@lists.infradead.org; Wed, 10 Nov 2021 16:35:01 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 o6-20020a17090a0a0600b001a64b9a11aeso2208010pjo.3
 for <linux-riscv@lists.infradead.org>; Wed, 10 Nov 2021 08:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6DXVckl0RrIJ/A6i//8yhDMUzs3xEaGmxwAICuDmaY0=;
 b=cOPRQjNEGKQEPMy7//mD6f0tLDX24Mm8d5rNJDt+2a1opUtQHC+gw5B4le5/lOGbn4
 BCJj7Wk2BFBWQ1TDTxYCCRzi5Oh0r289EtA+Brubs1f5mk8MmqLpWcnGEPV19DZ0FPs2
 9ehH94vXiWImscpTc6A9TXvfiE7RYihGjQwJa2OoG8XZzYfk7Fl5ii0TnRVkl8zaSCgD
 1dNSJUK2cvCbOHV1B6Dl4EmipGaAJhnI4tJ1AV2LTe0BG6uBW/R8vGQBgDcdyzCV8PmG
 ZjUc+qlVWqfBLU4x+rG4ukIxOHy7GbUxZPRIyhoTgcAKdfyX7gVywQQCakz1uYbseXc9
 QNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6DXVckl0RrIJ/A6i//8yhDMUzs3xEaGmxwAICuDmaY0=;
 b=4vhj97Ci4R1kfuguw9NF16pv30dh5xAaL/ppqOO8qGzPelrk5yP+O71O0DvJVm8JL1
 23ECNQ19udAO+Glg5f5lxVheO9VM3u4Q4Ul9KOmQvlP8f55ShfUbWUUTIX9YD582ZEIc
 +RzDAjJHI1CRyS44nTRsRxTKmVg6+BqaTsA7/GXJD3M+YOwC+qDbsN6w/RD+CAIuM+9M
 2MDn1NZliGi1OvwSV7B0pY7pQvt38yaPidDIcEG4zECjuRbHgnhMSFUjw3hgnigj6CSR
 Z8LPmsDrZ/sG+KL4r+7gJX+T5S1oR/GwFA/KFHZQHmcejzxip8gN82xBaSe/apc5vRfg
 bReA==
X-Gm-Message-State: AOAM531WlJZJ44YSD1DqXidGENfYmwYVeiA+6ST10QKbXQH/dmpJoEjr
 3NembUW0f3WheJO2D7AbRbXZ7F9Wo6cmhe5gYhU=
X-Google-Smtp-Source: ABdhPJzQElKEF1R8wngUwIrsIjZJx9wwapxQuwAsvGzxvSSMRC2g4PylICdvEBrOVH7f25UGO7UscPcqgvHGA3V9Js0=
X-Received: by 2002:a17:902:bd98:b0:13f:9ae7:54d1 with SMTP id
 q24-20020a170902bd9800b0013f9ae754d1mr407705pls.15.1636562098638; Wed, 10 Nov
 2021 08:34:58 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-10-kernel@esmil.dk>
 <CAHp75Ve-P8DR00mtRP_NkrXgB4nsZ+qBkgBen94iTcPqxQYUOg@mail.gmail.com>
 <CANBLGcyb=TAP0h2WuxBAjRvpN9n7Dt1Hvh5yE8NMOwm3ixZWuA@mail.gmail.com>
 <CAAH8bW-J6Ai+KZFkZ4ELOzD-u7BceZrBqwnCuPH6F-fNQNm3XQ@mail.gmail.com>
In-Reply-To: <CAAH8bW-J6Ai+KZFkZ4ELOzD-u7BceZrBqwnCuPH6F-fNQNm3XQ@mail.gmail.com>
From: Yury Norov <yury.norov@gmail.com>
Date: Wed, 10 Nov 2021 08:34:39 -0800
Message-ID: <CAAH8bW8=o2ZTWEL8NUHvPE5COZJJ7VnNBKp_rumyXOe6m2q1Jg@mail.gmail.com>
Subject: Re: [PATCH v3 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
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
X-CRM114-CacheID: sfid-20211110_083500_585346_A5C16F07 
X-CRM114-Status: GOOD (  27.31  )
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

On Tue, Nov 2, 2021 at 1:55 PM Yury Norov <yury.norov@gmail.com> wrote:
>
> On Tue, Nov 2, 2021 at 12:59 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> >
> > On Tue, 2 Nov 2021 at 20:43, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > +Cc: Yury (bitmap expert)
> > >
> > > On Tue, Nov 2, 2021 at 6:50 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > >
> > > > Add a driver for the StarFive JH7100 reset controller.
> > >
> > > ...
> > >
> > > > +#define BIT_MASK32(x) BIT((x) % 32)
> > >
> > > Possible namespace collision.
> > >
> > > ...
> > >
> > > > +/*
> > > > + * the registers work like a 32bit bitmap, so writing a 1 to the m'th bit of
> > > > + * the n'th ASSERT register asserts line 32n + m, and writing a 0 deasserts the
> > > > + * same line.
>
> We don't have 32-bit bitmaps. Bitmaps are always arrays of unsigned longs. On a
> 64-bit system this '32-bit bitmap' may be broken due to endianness issues.
>
> > > > + * most reset lines have their status inverted so a 0 in the STATUS register
> > > > + * means the line is asserted and a 1 means it's deasserted. a few lines don't
> > > > + * though, so store the expected value of the status registers when all lines
> > > > + * are asserted.
> > > > + */
> > >
> > > Besides missing capitalization,
> >
> > I'm confused. it was you who wanted all comments to capitalized the same..
> > 64bi
> > if it sounds like bitmap, use bitmap.
> > > I have checked DT definitions and it seems you don't even need the
> > > BIT_MASK() macro,
> > >
> > > > +static const u32 jh7100_reset_asserted[4] = {
> > > > +       /* STATUS0 register */
> > > > +       BIT_MASK32(JH7100_RST_U74) |
>
> I think we have no BIT_MASK32() for a good reason. Natural alignment is
> always preferable.
>
> > > > +       BIT_MASK32(JH7100_RST_VP6_DRESET) |
> > > > +       BIT_MASK32(JH7100_RST_VP6_BRESET),
> > > > +       /* STATUS1 register */
> > > > +       BIT_MASK32(JH7100_RST_HIFI4_DRESET) |
> > > > +       BIT_MASK32(JH7100_RST_HIFI4_BRESET),
> > > > +       /* STATUS2 register */
> > > > +       BIT_MASK32(JH7100_RST_E24),
> > > > +       /* STATUS3 register */
> > > > +       0,
> > > > +};
> > >
> > > Yury, do we have any clever (clean) way to initialize a bitmap with
> > > particular bits so that it will be a constant from the beginning? If
> > > no, any suggestion what we can provide to such users?
>
> If you want your array to be a true bitmap, ie, all bitmap functions should
> work with it correctly, you'd initialize it like this:
>
> static const unsigned long jh7100_reset_asserted[] = {
>         BITMAP_FROM_U64(BIT_MASK(JH7100_RST_VP6_DRESET) |
>                           BIT_MASK(JH7100_RST_VP6_BRESET) |
>                           BIT_MASK(JH7100_RST_HIFI4_DRESET) |
>                           BIT_MASK(JH7100_RST_HIFI4_BRESET)),
>         BITMAP_FROM_U64(BIT_MASK(JH7100_RST_E24)),
> }

My bad, it should be BIT_ULL_MASK.

Thanks,
Yury

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
