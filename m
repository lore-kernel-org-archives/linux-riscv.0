Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852ECECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 10:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bIX/edz8wygcbaTtAsw+nfHyaK0z5sNhytT9xOpCA3U=; b=zVzjItjn1zo0JR
	Rr19+U3IdLLhlk8qnhLOAa5FwU67GsIGIFFf5O719bFdqFKHrphVyUIBHgyQLe58uq+n0q8zW+ig6
	zKq0Pe7R9Gbde50UZ7dbO2iBbWWQMSl3L3wgwEYcxCD8EYsIsF66UmsXsMSfyw2lE5gP0YTmgf4M0
	V5hCs8OPl5zQm5OasQJ6bgGp7fE3tYzASMBeSAqyN4Fzx4rnwD0uV1njeBabe/ETMsdB5Rhs9uFmj
	tVAcuzXVxGpEf2Hhe6nUJYqmSLEvIltw1/nVekqbvHccYejDtwHvxv+OCdINRqYtZA6hs4rpRly/g
	MfSxXOJiR3Q9ohINYtwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oawec-00Aja9-LL; Wed, 21 Sep 2022 10:08:30 +0000
Received: from mail-qk1-f169.google.com ([209.85.222.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaweY-00AjXd-Vk; Wed, 21 Sep 2022 10:08:28 +0000
Received: by mail-qk1-f169.google.com with SMTP id g2so3600519qkk.1;
        Wed, 21 Sep 2022 03:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Q42qokBJHSJ02Yiksv4KQyCcXIUfc5O74ntw/Bpmgc0=;
        b=yM5VXbLBUAPtKD/aRkYWLOzQ8V2XcX4Og55LTNL1OHt23mxmTi2aA5s/M2GbMnmxdQ
         a3nJnEXW5Gds4hHoE1juX/qyDPLT9IWQ19xQnBSRP0qXhbxtTy0dEEioV1I92hhTNv6c
         0Ip9KHZUOLEsvbhJDSEwXdPELiHNZ488pPPq8zagNTJQapxOlFbw86m6ZiXdkrekWBh6
         GD35/m9gs3AkWR2aJ+E3Kc2Av/HevRemV++gdP/Rj7eYUlTI34anUd3UrQsHqdkb9WBB
         O73+zNGHtNdfs/r9pb+XzcCBjNcZcQqZtW6dtATYr4auWpyrpsk0Jt+YApgreZg6VpjM
         xacA==
X-Gm-Message-State: ACrzQf34lu95K/NZcHqBi6z4gT8rcyh95UuET9pXLwBqEej50ASuIQ2T
	O8Hp5O+Ra25sJxsLHrL5MAW4Lxan6S+LbKU1
X-Google-Smtp-Source: AMsMyM6Sng9zLdXcu6iqhrJbumQ4FE+Z4oRnUTOegRxyCdP0EBIr4GxJgMWZON9BPLFGMYMcEDBxGg==
X-Received: by 2002:a05:620a:2206:b0:6ce:8c53:3a77 with SMTP id m6-20020a05620a220600b006ce8c533a77mr19748931qkh.16.1663754904640;
        Wed, 21 Sep 2022 03:08:24 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id de4-20020a05620a370400b006bbb07ebd83sm1598615qkb.108.2022.09.21.03.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 03:08:23 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id e81so7259446ybb.13;
        Wed, 21 Sep 2022 03:08:22 -0700 (PDT)
X-Received: by 2002:a5b:104:0:b0:6b0:429:3fe9 with SMTP id 4-20020a5b0104000000b006b004293fe9mr23028012ybx.543.1663754902653;
 Wed, 21 Sep 2022 03:08:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdUPm36RsxHdVwspR3NCAR3C507AyB6R65W42N2gXWq0ag@mail.gmail.com>
 <b0f2e13a-ff5d-5bfc-6dda-ca39bb57803e@linaro.org> <CA+V-a8t3ukpa1PNz=5fP+BTjWkFJmwDo_EJJYjO9YctF2=K1Vg@mail.gmail.com>
 <df9ff0bd-ad0e-4b5b-859d-dd913628edc8@linaro.org>
In-Reply-To: <df9ff0bd-ad0e-4b5b-859d-dd913628edc8@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Sep 2022 12:08:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXaWz4zP-Zrc4drxwVmbMjmGZHABVbUtO91fZXKawathw@mail.gmail.com>
Message-ID: <CAMuHMdXaWz4zP-Zrc4drxwVmbMjmGZHABVbUtO91fZXKawathw@mail.gmail.com>
Subject: Re: Similar SoCs with different CPUs and interrupt bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
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
X-CRM114-CacheID: sfid-20220921_030827_036956_688139AA 
X-CRM114-Status: GOOD (  26.17  )
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

Hi Krzysztof,

On Wed, Sep 21, 2022 at 11:26 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 21/09/2022 11:20, Lad, Prabhakar wrote:
> >> What do you mean? Macros support string concatenation and simple
> >> arithmetic like adding numbers. I just tested it.
> >>
> > I did try the below:
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> > b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> > index 689aa4ba416b..0f923c276cd3 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> > @@ -8,6 +8,8 @@
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >  #include <dt-bindings/clock/r9a07g043-cpg.h>
> >
> > +#define SOC_PERIPHERAL_IRQ(nr, na) GIC_SPI nr na
> > +
> >  / {
> >      compatible = "renesas,r9a07g043";
> >      #address-cells = <2>;
> > @@ -128,7 +130,7 @@ ssi1: ssi@1004a000 {
> >              compatible = "renesas,r9a07g043-ssi",
> >                       "renesas,rz-ssi";
> >              reg = <0 0x1004a000 0 0x400>;
> > -            interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
> > +            interrupts = <SOC_PERIPHERAL_IRQ(330, IRQ_TYPE_LEVEL_HIGH)>,
> >                       <GIC_SPI 331 IRQ_TYPE_EDGE_RISING>,
> >                       <GIC_SPI 332 IRQ_TYPE_EDGE_RISING>,
> >                       <GIC_SPI 333 IRQ_TYPE_EDGE_RISING>;
> >
> > This worked as expected, but couldn't get the arithmetic operation
> > working. Could you please provide an example?
>
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> index ff6aab388eb7..0ecca775fa3f 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> @@ -8,6 +8,8 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/r9a07g043-cpg.h>
>
> +#define SOC_PERIPHERAL_IRQ_NUMBER(na)  (na + 32)
> +#define SOC_PERIPHERAL_IRQ(nr, na) GIC_SPI nr SOC_PERIPHERAL_IRQ_NUMBER(na)

#define SOC_PERIPHERAL_IRQ(nr, flags) GIC_SPI
SOC_PERIPHERAL_IRQ_NUMBER(nr) flags

>  / {
>         compatible = "renesas,r9a07g043";
>         #address-cells = <2>;
> @@ -128,7 +130,7 @@ ssi1: ssi@1004a000 {
>                         compatible = "renesas,r9a07g043-ssi",
>                                      "renesas,rz-ssi";
>                         reg = <0 0x1004a000 0 0x400>;
> -                       interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
> +                       interrupts = <SOC_PERIPHERAL_IRQ(330, IRQ_TYPE_LEVEL_HIGH)>,
>
>
>
> Or any other method like that....

Oh cool, seems like arithmetic is supported.
No idea what I did wrong last time I tried...

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
