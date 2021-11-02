Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6538C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 21:17:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A296760D07
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 21:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A296760D07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t3O0RMkb3yWyeBT+f0/mFHFEBR8l2vi42ilR/eknHa0=; b=02GC9x/CcwstFQ
	sOz0TovF2RMH4F4egvyRMqBDhhzqucenADugK589yWifuK4bqw2Dtp97WGbTdCq87qERRy34jGLis
	XCutBpMNdjhdyrdPEo8a7qoDU1Rha3I/itH/lum7Ohp0ourLB80GvljlfaxXNUimb4POprDoZKU5r
	sgncgO5zXzWuHtJO26K7gPCsGRyq4GPR8F2WvsIesgI2eLhWUAYpUGK56+V10D9+zC35wNtwe7gYX
	2eaElzpVJmdf7D4pmLE1fA3S1eU/pa1VB3nmW31RWRwGJ1bs1aM56kKGoPZUqtvUlrI821Cqv/lnA
	S5WzQNTIC0AkUQQIWqIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi19j-0031DG-II; Tue, 02 Nov 2021 21:17:19 +0000
Received: from mail-pl1-f178.google.com ([209.85.214.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi19g-0031CP-CA
 for linux-riscv@lists.infradead.org; Tue, 02 Nov 2021 21:17:18 +0000
Received: by mail-pl1-f178.google.com with SMTP id b13so870469plg.2
 for <linux-riscv@lists.infradead.org>; Tue, 02 Nov 2021 14:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q3y5UxeQSpLyKQPZY321rv/0ZITkGbCXJhzW/7YHXdo=;
 b=2wTykBRWqYU9REo0mfVzPZY13PzGfFAq7x4apCX2SJvH73F+mU+/TM0ghInG7w1Cuw
 ICSOt6Gu0B4NAfjucxeMx63txcNYlz+b0VjR6k3qQjSmAeGGH9r+FTO+ZjT6Qf8a95LM
 2b1sSG+G/YzwXYb2gI15+j5fp/gZUQ8XGWumMlUkzG8kCdVqLRholbKR9DgsfpeSMsg+
 x2FisE1f6VUoEbJNaKvnrzrlwhIpPzoZnYgtNyHu8QaELMWRUNFcgTJPv8AEScFRybVG
 K0Z69v0wUR5fDKsbOfW185gvG0lY+O4VfGp0oIxPmIgl9oi1+PrIoePDbMhaSEJj81ne
 5uxw==
X-Gm-Message-State: AOAM530zxVqrpk+JjOtP72kPC2O9WpOmlOkl28U1fTPLY9597VejoGLC
 fod3stl/ExtcqdioGWB8MU4pBLSOmsNULpxJCwU=
X-Google-Smtp-Source: ABdhPJz8vya8Pc9vfyjBBnOdrocjtFOk+W75BUtZYClkn8GG2bJFYZJzRCxnG9uqRIRWqGnV1fANTmhWO6L01upvC1k=
X-Received: by 2002:a17:90a:5b0c:: with SMTP id
 o12mr9978948pji.194.1635887835692; 
 Tue, 02 Nov 2021 14:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-10-kernel@esmil.dk>
 <CAHp75Ve-P8DR00mtRP_NkrXgB4nsZ+qBkgBen94iTcPqxQYUOg@mail.gmail.com>
 <CANBLGcyb=TAP0h2WuxBAjRvpN9n7Dt1Hvh5yE8NMOwm3ixZWuA@mail.gmail.com>
 <CAHp75Vcg3En=xH+kz0GgAMGUoo5FABo2HwGoHd=7QgGVrYkYXg@mail.gmail.com>
In-Reply-To: <CAHp75Vcg3En=xH+kz0GgAMGUoo5FABo2HwGoHd=7QgGVrYkYXg@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Tue, 2 Nov 2021 22:17:04 +0100
Message-ID: <CANBLGczrGwexRGvGxa9C+yzaSHZF_d5+AaebeLUX5BXFxipr=A@mail.gmail.com>
Subject: Re: [PATCH v3 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
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
X-CRM114-CacheID: sfid-20211102_141716_442733_64F2A8DF 
X-CRM114-Status: GOOD (  34.97  )
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

On Tue, 2 Nov 2021 at 21:14, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Tue, Nov 2, 2021 at 9:59 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Tue, 2 Nov 2021 at 20:43, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > On Tue, Nov 2, 2021 at 6:50 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> ...
>
> > > > +/*
> > > > + * the registers work like a 32bit bitmap, so writing a 1 to the m'th bit of
> > > > + * the n'th ASSERT register asserts line 32n + m, and writing a 0 deasserts the
> > > > + * same line.
> > > > + * most reset lines have their status inverted so a 0 in the STATUS register
> > > > + * means the line is asserted and a 1 means it's deasserted. a few lines don't
> > > > + * though, so store the expected value of the status registers when all lines
> > > > + * are asserted.
> > > > + */
> > >
> > > Besides missing capitalization,
> >
> > I'm confused. it was you who wanted all comments to capitalized the same..
>
> Yes and there are two types of the comments, one-liners and
> multi-line. In multi-line you usually use proper English grammar,
> where capitalization means what it means. For the one-liners just
> choose either small letters or capital letters to start them with.

That sounds reasonable, it was just that you complained about
inconsistent comments in the pinctrl driver that follows the above.

> > if it sounds like bitmap, use bitmap.
> > > I have checked DT definitions and it seems you don't even need the
> > > BIT_MASK() macro,
> > >
> > > > +static const u32 jh7100_reset_asserted[4] = {
> > > > +       /* STATUS0 register */
> > > > +       BIT_MASK32(JH7100_RST_U74) |
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
> >
> > The problem is, that even if we could initialize this without the
> > monstrosity in our last conversation a 64bit bitmap would still
> > produce worse code. As it is now it's simply a 32bit load and mask
> > with index and mask already calculated for the registers. In the
> > status callback the mask can even be folded into the register read
> > mask. With a 64bit bitmap you'd need to calculate new 64bit index and
> > masks, and then conditionally shift the bits into position.
>
> Why? You may use 8 byte IO (writeq() / readq() or their relaxed versions), no?
>
> ...
>
> > If this reflection of the 32bit registers bothers you that much
>
> What bothers me is hidden endianess issues (yeah, here it might be
> theoretical, but consider that somebody will look at your code and use
> it as the best example ever).

Wouldn't endian issues be a reason to make sure we read 32bit
registers with 32bit reads? Or do you expect a hypothetical big-endian
StarFive SoC to also change the order of the registers?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
