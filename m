Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B7AC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 13:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bFgzUylfqJYvrojEF124RIg6m3kfe8cXmwfM9dCJAE8=; b=MAInTmjdKZa9N5
	IPwJaS7JuADOI7TDzR4eG1R5TJEiSedjqsW10KIHiFaBweW6UitL7jConLX6c33Fc8bEt/Kfpem/f
	/duwRxfCZUquIVnjQHAL81vFleaSjvfo93S96zEPCY+oI3tNhdTyhTqWlcdqUkyHcIDD1S4EBJuYq
	VwOWrNvxBFZ+ZxR68wdUscumTvWSPMJI7z+su3sODvGy9FVHxf38RhoXD3c/1lcnrcl/IjzZ7Cqa4
	WFyCTUC7nWdBxQZbDNubnyOKXn2iIcHtskSkmZDxiIifMPVMaKHvON4R5+r8HG3X/8HsHy96bHsN5
	vCNJ+pKN4wrKWZLa+mcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbiwX-0014q7-Rp; Tue, 05 Apr 2022 13:09:57 +0000
Received: from mail-qt1-f179.google.com ([209.85.160.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbiwS-0014mF-22
 for linux-riscv@lists.infradead.org; Tue, 05 Apr 2022 13:09:55 +0000
Received: by mail-qt1-f179.google.com with SMTP id z19so10879110qtw.2
 for <linux-riscv@lists.infradead.org>; Tue, 05 Apr 2022 06:09:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EGI2XlMb81S56rKwRy0xEXUSzTZk2s0w4gj7pjWv3DM=;
 b=6MF7a+7fzk6BCH6uPFvkNY1kPjLaKuHyzqHP9nobfiSbdEiWTcvP/jWxr0ta5Tq5w0
 GsDAcAOlZiJCHsuQYFi0EnM6Ybg6N6+K6pD5z/EgJqG8Y2/fxbAid5tdkMqVzN5GW3+N
 UVhVdOUzbS4A4G0X4lHl2V/PK1fnvZLez0zxQ0++HrUSoHldjL73p8SjYySx18bNzZha
 V6FDDMy+bXe6zNq3HBVexzzSMi36Z1uiCzrfa/J/4/5SCeP0fl00zCgHb0jpFlYD2Voq
 3uRADVNXJjJve3rW8z4jkdxbvD7wdvgoHv+cZSUTQZRTkZq3Jvk2bw1VwgcjPXkq62YP
 G9Xg==
X-Gm-Message-State: AOAM530/1auCyQ260O6SBKlhRnFvXV6hjJcYPscI4uChGWmPRAiWDcV8
 teyjYMMpKGVQ5IG8RhBxLMo1R3A2eaMaCA==
X-Google-Smtp-Source: ABdhPJx8zZ9BHzIhG1iOrVxWJUGiS0u7pKq8gbxWktVTxdfwkrNRgKAArYHPln7odg9W4Z1awdyLCA==
X-Received: by 2002:ac8:59d2:0:b0:2e1:f86d:b3d3 with SMTP id
 f18-20020ac859d2000000b002e1f86db3d3mr2864030qtf.276.1649164188050; 
 Tue, 05 Apr 2022 06:09:48 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175]) by smtp.gmail.com with ESMTPSA id
 x19-20020a05620a14b300b0067e09a47e39sm7990799qkj.34.2022.04.05.06.09.47
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 06:09:47 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id g9so13587714ybj.9
 for <linux-riscv@lists.infradead.org>; Tue, 05 Apr 2022 06:09:47 -0700 (PDT)
X-Received: by 2002:a5b:24e:0:b0:63d:cba0:3d55 with SMTP id
 g14-20020a5b024e000000b0063dcba03d55mr2315479ybp.613.1649164187073; Tue, 05
 Apr 2022 06:09:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220308132806.96095-1-Niklas.Cassel@wdc.com>
 <CAMuHMdW4BKSxucwgZS0TUAKd26kmrWbpsMbDmDYSs9yo5tWH=A@mail.gmail.com>
 <Ykw9+03YFl2Yd982@x1-carbon>
In-Reply-To: <Ykw9+03YFl2Yd982@x1-carbon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Apr 2022 15:09:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVswU_BiMwLHSB5YD9XZB4=AqEgqMRNLWYDaFSyQSwoKA@mail.gmail.com>
Message-ID: <CAMuHMdVswU_BiMwLHSB5YD9XZB4=AqEgqMRNLWYDaFSyQSwoKA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: dts: canaan: Fix SPI3 bus width
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
 Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_060952_176662_3B60184C 
X-CRM114-Status: GOOD (  33.43  )
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

Hi Niklas,

On Tue, Apr 5, 2022 at 3:03 PM Niklas Cassel <Niklas.Cassel@wdc.com> wrote:
> On Tue, Apr 05, 2022 at 02:26:53PM +0200, Geert Uytterhoeven wrote:
> > On Tue, Mar 8, 2022 at 2:30 PM Niklas Cassel <Niklas.Cassel@wdc.com> wrote:
> > > From: Niklas Cassel <niklas.cassel@wdc.com>
> > > According to the K210 Standalone SDK Programming guide:
> > > https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf
> > >
> > > Section 15.4.3.3:
> > > SPI0 and SPI1 supports: standard, dual, quad and octal transfers.
> > > SPI3 supports: standard, dual and quad transfers (octal is not supported).
> > >
> > > In order to support quad transfers (Quad SPI), SPI3 must have four IO wires
> > > connected to the SPI flash.
> > >
> > > Update the device tree to specify the correct bus width.
> > >
> > > Tested on maix bit, maix dock and maixduino, which all have the same
> > > SPI flash (gd25lq128d) connected to SPI3. maix go is untested, but it
> > > would not make sense for this k210 board to be designed differently.
> > >
> > > Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> > > ---
> > > Changes since v1:
> > > -Add the new properties directly after spi-max-frequency for all DT board
> > >  files.
> >
> > Thanks for your patch, which is now commit 6846d656106add3a ("riscv:
> > dts: canaan: Fix SPI3 bus width") in v5.18-rc1.
> >
> > > --- a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
> > > +++ b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
> > > @@ -203,6 +203,8 @@ flash@0 {
> > >                 compatible = "jedec,spi-nor";
> > >                 reg = <0>;
> > >                 spi-max-frequency = <50000000>;
> > > +               spi-tx-bus-width = <4>;
> > > +               spi-rx-bus-width = <4>;
> > >                 m25p,fast-read;
> > >                 broken-flash-reset;
> > >         };
> >
> > On MAiX BiT, I get:
> >
> >     +spi spi1.0: setup: ignoring unsupported mode bits a00
> >      spi-nor spi1.0: gd25lq128d (16384 Kbytes)
>
> The device tree is supposed to describe the hardware.
>
> The Synopsys SPI controller and the Gigadevice SPI flash both support quad
> transfers.
>
> It would be incorrect to adapt the device tree based on current limitations
> of the drivers/spi/spi-dw-core.c driver.
>
> Likewise, we shouldn't need to update the device tree if the dwc driver
> ever adds support for quad transfers.

I fully agree with that.

I was just wondering whether work is underway to add quad support
to the SPI controller driver.

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
