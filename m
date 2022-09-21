Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4E1ECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 21:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oa8Q63MKvN+z2i7HhBgEpvKIx4dGwQrvAfXB3tqvW/U=; b=eYdb+WdFT1G8mX
	MpYCHvw8kMR3e9Has0IBrHGqrAcoG3dnJAyMvHy9LY69oLOBTDo2oW1Knl7RK+1tkA5QjyuOdOoVC
	olJ4MGYjQ2z8kL6r/Eoke5t4s48LVFFS54xDr+UQRtJQe6ko9AYixF7AZSkidMX3i3uFY/pcIFEiW
	3z53Dk/alIW4vkSAVphIJfMCgo5/Ywlhy3RqMLDLfev5n/pwXwYhBUkUKRZmBCir+Xe0msNIatbXg
	wXnn8j6G6n2vTZyzsToRpzsXh7YwOo5kqwyIk+CBCANfnXP5+BBAFv4g1Ivb/4Tlag6V7WZsNSjSk
	Ldx62221a/kNhXRBdGew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob6vD-00Ceyq-W1; Wed, 21 Sep 2022 21:06:20 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob6uz-00Cewm-FT; Wed, 21 Sep 2022 21:06:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CAD01B831EA;
	Wed, 21 Sep 2022 21:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C545EC433C1;
	Wed, 21 Sep 2022 21:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663794362;
	bh=4pEno27AZYa4mJMVJgAgsAXTI/+40ZvutoCLEOhJzGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sDQSjVHV+zbK4QkKWAC0QEE3eleBlrxAN/lUEQ5+rlQRQ8/bSOSzaqbLEQulF+nml
	 7s+TcuZGAnf/JkUt5g4ywB3NSBlS2B6tt/4DXjig42OddiO9OeK1x0zCdGCU8OM3sO
	 LUQ9IYbV+QND4jdV4/Gkhakzqz4ohno535eWT03xlFMdGj2mj2j0MaqRGwdaCMC63J
	 iCWm/AqP2rr6PVKVVoaq2SL+Cu5FwRhLjEyJ3PEqQMni6BL1zOpx9lLLHXxc4cP2wp
	 Gte9njqBesBn2vyIwu8t7Y4w/WzUIMXbmeMVGLK+XKgXIy5ESVh1xqu/P4GAFlEqjq
	 qCvJXSBwUD7bg==
Date: Wed, 21 Sep 2022 22:05:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel@sholland.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Atish Patra <atishp@atishpatra.org>,
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Subject: Re: Similar SoCs with different CPUs and interrupt bindings
Message-ID: <Yyt8s5+pyoysVNeC@spud>
References: <CAMuHMdUPm36RsxHdVwspR3NCAR3C507AyB6R65W42N2gXWq0ag@mail.gmail.com>
 <b0f2e13a-ff5d-5bfc-6dda-ca39bb57803e@linaro.org>
 <CA+V-a8t3ukpa1PNz=5fP+BTjWkFJmwDo_EJJYjO9YctF2=K1Vg@mail.gmail.com>
 <df9ff0bd-ad0e-4b5b-859d-dd913628edc8@linaro.org>
 <CAMuHMdXaWz4zP-Zrc4drxwVmbMjmGZHABVbUtO91fZXKawathw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXaWz4zP-Zrc4drxwVmbMjmGZHABVbUtO91fZXKawathw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_140605_845254_B3A0F09C 
X-CRM114-Status: GOOD (  17.68  )
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

On Wed, Sep 21, 2022 at 12:08:11PM +0200, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> > > This worked as expected, but couldn't get the arithmetic operation
> > > working. Could you please provide an example?
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> > index ff6aab388eb7..0ecca775fa3f 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> > @@ -8,6 +8,8 @@
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >  #include <dt-bindings/clock/r9a07g043-cpg.h>
> >
> > +#define SOC_PERIPHERAL_IRQ_NUMBER(na)  (na + 32)
> > +#define SOC_PERIPHERAL_IRQ(nr, na) GIC_SPI nr SOC_PERIPHERAL_IRQ_NUMBER(na)
> 
> #define SOC_PERIPHERAL_IRQ(nr, flags) GIC_SPI
> SOC_PERIPHERAL_IRQ_NUMBER(nr) flags
> 
> >  / {
> >         compatible = "renesas,r9a07g043";
> >         #address-cells = <2>;
> > @@ -128,7 +130,7 @@ ssi1: ssi@1004a000 {
> >                         compatible = "renesas,r9a07g043-ssi",
> >                                      "renesas,rz-ssi";
> >                         reg = <0 0x1004a000 0 0x400>;
> > -                       interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
> > +                       interrupts = <SOC_PERIPHERAL_IRQ(330, IRQ_TYPE_LEVEL_HIGH)>,
> >
> >
> >
> > Or any other method like that....
> 
> Oh cool, seems like arithmetic is supported.
> No idea what I did wrong last time I tried...

Oh sick, it does actually work??? So, am I missing something or is this
sort of approach now a no-brainer?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
