Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD83ECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 10:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XHGkTvLAA/zftoIYL+bMbDnDXcaaQuRrUyCc4W1lwRQ=; b=vSzIWSup3uz0qP
	7CcQVfL4nd8336CoO+xMbXRgucb70/U5ATul0MkQAfdbE02+z0eRu5uJOGlQnYykyo7VGBZY0DXvA
	rgcV0OcIxYkPgHrQ3Q/nr6w/JXrRkb/ciYrFm970WyCD2hPCTVf6tOn54TTbwuU0DAg5ZoNolJVJr
	G5lEOXlSKhviaJip4Bq2LOsB0p9MMNHAmoGMpeukX4z5YeRF+k5F0u8Z7wbNs/f2w3gqfBrphGuva
	MjfjfoLuhKXmVz7LihLAus76HwbEuAocb56/61DGHUhvtFwphgQw+DshsvsWWRTZhokyhrrGhLSQT
	U1GEX0tfWxAgndgpp7hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaweM-00AjUf-0z; Wed, 21 Sep 2022 10:08:14 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaweI-00AjNm-EO; Wed, 21 Sep 2022 10:08:11 +0000
Received: by mail-ej1-x630.google.com with SMTP id y17so12457918ejo.6;
        Wed, 21 Sep 2022 03:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=16JHpy8HOV5zOjzO41UWCeQsc//VdSkHGlgOJLsMd8k=;
        b=W2nsBUXvxZW4u9Vlf0bwCXbGqjxzpcwSk+491KYGNutwKR5iVS/4+r1ZWnYID/AMjB
         XMXv5w2GMh6+F8QGi7Io73MQA5tSGqmG2x/3U2WZN7mB/C3zCUl0vt1c7Li5kpJ5ieNe
         r8r2OyPJyAxFaQXePEK0wOHZpVDUuuj7DJjhSGHEzNN9tpj70q+o/+LJhw5u9sVksOQr
         T/FBkTX5G9QjyXlKxw1cBnk2Z5yk3gkHGF0DZ2+UvaT/knvTFCAVHRVNnH91qBVrvo8H
         80e0lk7XR3ChVikb17npTnmpn70MchyWfxrtsQAYXUWDsUZhSg0+lJ+n9WpY5F7UyvaE
         pQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=16JHpy8HOV5zOjzO41UWCeQsc//VdSkHGlgOJLsMd8k=;
        b=uzwmIXNg8Ca9wJLpLNNNwtS443wA/FeqMqb5knTrtT5a85/4ODEN3pAJ1MNqAX0UEu
         fpfV7Yavm5+Ma/tz7wlEAwLRtGJpDhaZxDq0qiEYQyEJDkQhR6WHtaA13xTtUceCFhT+
         L8rTtTQ7RZSSnprYMP5e3vHFHB1F4wC2O+13uELY/kB/f/e77s91G+o/xnY1QkCSeQZt
         4fVtE2EI4jlq+OULjHJDYUFP80GUuIb1ybAR5LZMiRKEjT0Em0lGE8Y3XzJHuvSV5jFB
         UIxfu8NYZCscUJnt5RvdknPh+nlcebCKLna2bc793oR7G5wBhc9gaTX/dXErOkLRiDp5
         kyFA==
X-Gm-Message-State: ACrzQf07vm0A7rD8p9d1tP8b5DHjmCJSD9Ex4K+WIdqRhUYvXzNHUBN0
	svAamkTAT/bjkJfnM5zWP6G8se1QBsyMPSKCZyM=
X-Google-Smtp-Source: AMsMyM5rh1KQ7KgFpMv+pJ3tu52sOsSxVxHqI6HzSneUdWNk74IBai04tZfLSooyjz4dTz8BOkizUbI1Qgl4nYk8Jqs=
X-Received: by 2002:a17:906:591:b0:73d:c3ef:84ae with SMTP id
 17-20020a170906059100b0073dc3ef84aemr20462081ejn.155.1663754876285; Wed, 21
 Sep 2022 03:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdUPm36RsxHdVwspR3NCAR3C507AyB6R65W42N2gXWq0ag@mail.gmail.com>
 <b0f2e13a-ff5d-5bfc-6dda-ca39bb57803e@linaro.org> <CA+V-a8t3ukpa1PNz=5fP+BTjWkFJmwDo_EJJYjO9YctF2=K1Vg@mail.gmail.com>
 <df9ff0bd-ad0e-4b5b-859d-dd913628edc8@linaro.org>
In-Reply-To: <df9ff0bd-ad0e-4b5b-859d-dd913628edc8@linaro.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 21 Sep 2022 11:07:29 +0100
Message-ID: <CA+V-a8svcTXceeLSVD4D9VazTc9nN5MXsFmvcFaDd2mM0REDhg@mail.gmail.com>
Subject: Re: Similar SoCs with different CPUs and interrupt bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, 
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
X-CRM114-CacheID: sfid-20220921_030810_500090_9D865189 
X-CRM114-Status: GOOD (  19.35  )
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

On Wed, Sep 21, 2022 at 10:26 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 21/09/2022 11:20, Lad, Prabhakar wrote:
> >>
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
>
Thanks for the pointer! (Ive tested the above and it works)

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
