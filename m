Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76283C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 14:57:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41469610EA
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 14:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 41469610EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jcpgL+QSYq549feHiJHIgo4GWiRZtWU1yIUDow8JvSk=; b=0fbLOQWxuC4Igm
	UXE09Z6YTJf3W9Wr7va/iCcLZ6PM2orG4sFz7oWwiQ7zFKC8ZgPnqnfMrqBaZSwcd6iXpVcAzchoX
	Qc5+NC9jQ+s/WaJ4iKMbLe5T4PqVPUVPQtnP26HtBZT2MN5YqiC1qR2jDY5Qw7qk4t+hiT0Bkv2XO
	nRbedFSaLndGqVU3mJGCGUGcJwTobxzsg/qJdM9vP1pkgfQ0djr4uu0glfB4cbSz2I4WDAKPULxUs
	bW3E8BBR6D3FIfqqyKiFqIgwwV6E07mA5cnLflblsio86IOAQvWYTqof2/1zR7fZcGhM9I0T3o3VS
	WN/g27xePqBKbGT/KI4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdvye-00BKRp-Qq; Fri, 22 Oct 2021 14:57:00 +0000
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdvyc-00BKQs-Cr
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 14:57:00 +0000
Received: by mail-pl1-f182.google.com with SMTP id n11so2877371plf.4
 for <linux-riscv@lists.infradead.org>; Fri, 22 Oct 2021 07:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bP/PBZ5dE4p5HX2+QicYK3rA0pH5Cba6d4G9S+AUf1E=;
 b=1FePXxyHSULHoWKaxN0SdUoGN9DU6XS+i0U8suVLQU0q0K4vn70I2bKeQQHYQQAbF0
 xUoCM9l3LWZdvt5Y3JdhvnkRUZ6hUBWAOwPo2qmefpgk2XQ21Un9iiUJSyhi7gE99MSg
 azQcaVASRYKE+B3oXoLN3rdV6GnO6I+0QaEepZi6DVdh7Zw4e+NIrnuBfbbSN76ByP7B
 d+0Cae+p5osiUz/Pnystjmb+D18l1mt98WxBvjc9fww+sTLSoQMFVLxg1NcUkIt0l5x8
 IFj9ixLdnnMrojdGfyjEYOZZ4HqM3Izo5XeKzhtGYnUCRS48ZUzkxPa8m80wXeS+9Jx5
 E8SA==
X-Gm-Message-State: AOAM531hFLus2y7+uy3rYPApqU3CR/m4URYZRv8vtuDC7ZVLlVJZ/DMR
 Ajr6D5jaL8KM7dk7HXeIkIuLbIuYkVn00NWrxlc=
X-Google-Smtp-Source: ABdhPJwB+UUuFlxzIiKUXd5KRD9w1J7GsVmq0SJSBFy8jKVC7XgO/aG+zbPd6g7s+pWXzJt2gXXzIfD/CsG7XKZCsEc=
X-Received: by 2002:a17:902:7783:b0:13d:fee6:8095 with SMTP id
 o3-20020a170902778300b0013dfee68095mr453870pll.7.1634914616930; Fri, 22 Oct
 2021 07:56:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-10-kernel@esmil.dk>
 <CAHp75VcUv6WH0--FANpRExCdEOJNVo8KCtJ2Go090=FZq-Y0UQ@mail.gmail.com>
 <CANBLGcysKdqo+FioSkhd1PZRLzPF=fRJrCTsUGR7vXcn2WpYHg@mail.gmail.com>
 <CAHp75VditKnEcPKgqxz7NfG3ZWLZCu=pW=8qw7HS_iWePTj5Qw@mail.gmail.com>
 <CANBLGcyaSgbOgA4u_QivUQicyZ0MuUmrSsPq56OAANsav8R=VQ@mail.gmail.com>
 <CAHp75Vf=fGn33JFa-8UwCzv7A6AgHdnvfoabKnCcuKZxOyWX2Q@mail.gmail.com>
In-Reply-To: <CAHp75Vf=fGn33JFa-8UwCzv7A6AgHdnvfoabKnCcuKZxOyWX2Q@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Fri, 22 Oct 2021 16:56:45 +0200
Message-ID: <CANBLGcwZG-HpMuyw0LTGY2fwOJTgcMW7V_6kb=CFhX-Y5RjQSA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211022_075658_462161_5259E1AC 
X-CRM114-Status: GOOD (  25.26  )
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

On Fri, 22 Oct 2021 at 16:50, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Fri, Oct 22, 2021 at 5:25 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Fri, 22 Oct 2021 at 15:39, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > On Fri, Oct 22, 2021 at 4:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > > On Fri, 22 Oct 2021 at 14:56, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > > On Thu, Oct 21, 2021 at 8:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> ...
>
> > > > > Why all these ugly % 32 against constants?
> > > >
> > > > Because the JH7100_RST_ values goes higher than 31. There is a
> > > > BIT_MASK macro, but that does % BITS_PER_LONG and this is a 64bit
> > > > machine.
> > >
> > > And? It's exactly what you have to use!
> >
> > So you want me to use an unsigned long array or DECLARE_BITMAP and
> > juggle two different index and bit offsets?
>
> What are the offsets of those status registers?
> AFAICS they are sequential 4 32-bit registers.

That's right, but we're on a 64bit machine, so DECLARE_BITMAP will
give us an unsigned long array that doesn't match that.

> So bitmap is exactly what is suitable here, you are right!
> See gpio-xilinx and gpio-pca953x on how to use bitmaps in the GPIO drivers.

None of them has a pre-initialized const DECLARE_BITMAP, so they don't
have to deal with the 4 vs. 2 commas problem.

> > Also is there a macro for handling that we'd then need 4 commas on
> > 32bit COMPILE_TEST and 2 commas on 64bit?
> > If you have some other way in mind you'll have to be a lot more explicit again.
> >
> > The point of the jh7100_reset_asserted array is that it exactly
> > mirrors the values of the status registers when the lines are
> > asserted. Maybe writing it like this would be more explicit:
> >
> > static const u32 jh7100_reset_asserted[4] = {
> >         /* STATUS0 register */
> >         BIT(JH7100_RST_U74 % 32) |
> >         BIT(JH7100_RST_VP6_DRESET % 32) |
> >         BIT(JH7100_RST_VP6_BRESET % 32),
> >         /* STATUS1 register */
> >         BIT(JH7100_RST_HIFI4_DRESET % 32) |
> >         BIT(JH7100_RST_HIFI4_BRESET % 32),
> >         /* STATUS2 register */
> >         BIT(JH7100_RST_E24 % 32),
> >         /* STATUS3 register */
> >         0,
> > };
>
> --
> With Best Regards,
> Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
