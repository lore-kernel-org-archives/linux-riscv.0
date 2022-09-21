Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABEAECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 10:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IP4PgAOE+4WU1bpX0Of2helEpGf7gMm8j3SJ6XYBEwM=; b=lemdwMrRxRGJEs
	30sOPB7CDPBKcpl7qHhqYA970zV9MzELv/uVYjkC5gyUXrba7L4FjBTVctYT6n8Si4/CHjjvEnWk5
	KRKGItiiJiyKH7EfJT2hVVhUolmUSinqwP5ukR/F9vrB19+PIIjAxKsCEnueyecWG5EI8viAzHo21
	Z4mHI0OEQYkaggpVP6s8BOQwV2DFjdOZw3XfGN9BZo4ZUOmNOE+MXYFe/5UaZ8ECtJslA2YbiMktY
	EcmCJOI2FAKOehS/y/cS0euLCWS/1F509ksdgwVOWIHbwfs5+7II+bCEbcpgCqJy0kSZa85NJEGtN
	B7XsCk7vTDQzg0aKqxEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oawoT-00AnBK-T0; Wed, 21 Sep 2022 10:18:41 +0000
Received: from mail-vs1-f53.google.com ([209.85.217.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oawoQ-00An8z-TM; Wed, 21 Sep 2022 10:18:40 +0000
Received: by mail-vs1-f53.google.com with SMTP id j17so6163094vsp.5;
        Wed, 21 Sep 2022 03:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=9A/p6ZkdEYO1vNEWi1IhugiWPSS0Lp7RP7GaNC2clvU=;
        b=ggTNsXJLqL6ZvhPh5ETyj0purZcDDSFPk2snMhI432+mfgxF3SFdWO5LNiKc6XJ+iD
         85ww/nPl+vdaY+2rU7C/HeW6ptbkBSsneNODnPGfmciaBN4fw1dg+siJUer200V3csy+
         oRxC9Puo2kPKT+2jq31IbACKSomArzb0XaHzA2SSGRH1xiOucqfPime2QG5kRhWm0FLP
         R9Zz1+7LYTJUfHF9rYSEusRCKjv0BHJFpnb62nJqAyww5HuK2ztgYeZz3H+FmZ80Wd5S
         OfxDYHqFuTSxa1A7eQdKDK2FrcGz3steX2iuqyCWRHWonei00fU1Svb/eL8pLkL7ISB0
         TrEw==
X-Gm-Message-State: ACrzQf1IFYH4CXEOwvRUNeBIpbh7igPKutjSre9Cw+Zy/4N96JOx0h3v
	dOsu7Di+OafhCf3xdkOXpoepiWxqhPncaXPZ
X-Google-Smtp-Source: AMsMyM5kxclUY1TLPYx0n4k+RfEuqcKh7ZG4aZEurI5IQ64Pl6rpzwznHiDOK6Mtr6pTkpw4Nq54Og==
X-Received: by 2002:a67:bc16:0:b0:397:85f0:5196 with SMTP id t22-20020a67bc16000000b0039785f05196mr10181097vsn.51.1663755515925;
        Wed, 21 Sep 2022 03:18:35 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id u3-20020a67ae43000000b0039ae99e4723sm340442vsh.17.2022.09.21.03.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 03:18:35 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id e1so2184070uaa.1;
        Wed, 21 Sep 2022 03:18:35 -0700 (PDT)
X-Received: by 2002:a25:3746:0:b0:6b1:4a12:b2d5 with SMTP id
 e67-20020a253746000000b006b14a12b2d5mr20690282yba.89.1663755208456; Wed, 21
 Sep 2022 03:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdUPm36RsxHdVwspR3NCAR3C507AyB6R65W42N2gXWq0ag@mail.gmail.com>
 <45d2e6c2-3b4b-5720-0431-002c74b1f9cc@arm.com>
In-Reply-To: <45d2e6c2-3b4b-5720-0431-002c74b1f9cc@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Sep 2022 12:13:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWd5cmxgG8jdpDw3nrfrdSX6ecb+XwuJTLkkRgP5LbcHQ@mail.gmail.com>
Message-ID: <CAMuHMdWd5cmxgG8jdpDw3nrfrdSX6ecb+XwuJTLkkRgP5LbcHQ@mail.gmail.com>
Subject: Re: Similar SoCs with different CPUs and interrupt bindings
To: Robin Murphy <robin.murphy@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andre Przywara <andre.przywara@arm.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel@sholland.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Atish Patra <atishp@atishpatra.org>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_031838_986624_3B1BFE5F 
X-CRM114-Status: GOOD (  32.31  )
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

Hi Robin,

On Wed, Sep 21, 2022 at 11:20 AM Robin Murphy <robin.murphy@arm.com> wrote:
> On 2022-09-21 08:46, Geert Uytterhoeven wrote:
> > This is a topic that came up at the RISC-V BoF at Plumbers, and it was
> > suggested to bring it up with you.
> >
> > The same SoC may be available with either RISC-V or other (e.g. ARM) CPU
> > cores (an example of this are the Renesas RZ/Five and RZ/G2UL SoCs).
> > To avoid duplication, we would like to have:
> >    - <riscv-soc>.dtsi includes <base-soc>.dtsi,
> >    - <arm-soc>.dtsi includes <base-soc>.dtsi.
> >
> > Unfortunately RISC-V and ARM typically use different types of interrupt
> > controllers, using different bindings (e.g. 2-cell vs. 3-cell), and
> > possibly using different interrupt numbers.  Hence the interrupt-parent
> > and interrupts{-extended} properties should be different, too.
> >
> > Possible solutions[1]:
> >    1. interrupt-map
> >
> >    2. Use a SOC_PERIPHERAL_IRQ() macro in interrupts properties in
> >       <base-soc>.dtsi, with
> >         - #define SOC_PERIPHERAL_IRQ(nr, na) nr          // RISC-V
> >         - #define SOC_PERIPHERAL_IRQ(nr, na) GIC_SPI na  // ARM
> >       Note that the cpp/dtc combo does not support arithmetic, so even
> >       the simple case where nr = 32 + na cannot be simplified.
> >
> >    3. Wrap inside RISCV() and ARM() macros, e.g.:
> >
> >          RISCV(interrupts = <412 IRQ_TYPE_LEVEL_HIGH>;)
> >          ARM(interrupts = <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>;)
> >
> >       Cfr. ARM() and THUMB() in arch/arm/include/asm/unified.h, as used
> >       to express the same operation using plain ARM or ARM Thumb
> >       instructions.
>
> 4. Put all the "interrupts" properties in the SoC-specific DTSI at the
> same level as the interrupt controller to which they correspond. Works
> out of the box with no horrible mystery macros, and is really no more or
> less error-prone than any other approach. Yes, it means replicating a
> bit of structure and/or having labels for everything (many of which may
> be wanted anyway), but that's not necessarily a bad thing for
> readability anyway. Hierarchical definitions are standard FDT practice
> and should be well understood, so this is arguably the simplest and
> least surprising approach :)

Thanks for the suggestion!

It does mean we have to update 3 .dtsi files when adding support
for a new device. As long as all DT changes go through the same (soc)
tree, we can easily manage the dependencies.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
