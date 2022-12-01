Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EEDC43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 06:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qZ/1yZXZ2ZmUDZq0WILz7obyeYBFeaz/D5/afugEGko=; b=ni7TJ8HxWkboYH
	vQ6Os3gVDOGZPfFJ31W3aMqXT+7M87TxxIJlTRyH31hQw+lWPEOdHbRnvHfK4CqtJxF5halh3b5KI
	R4ZXyziO8RV7q+Vgyv0AOszrG7Ijr4lkdxxIQGmZcLqQahvL1TyuRF7F8q8pTp8O43QWiG2bV8dpj
	puPmSrgFQDhDZvyrcwDLNdSwNU/dIYE+9eKbPjW7nhfeJRQvWNAAC1k8ysfNYAU/VN/63Gn1sdOMf
	g1fy+HUEkmvIfOxnuRZUBCoING+vUU4w5pOEvkvPweKGf/P6NdTjG9NTA4LvEADna7ADF2R38S17o
	XCpxbdl9IytVPPOkpOAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0cu8-005Ajb-3K; Thu, 01 Dec 2022 06:18:40 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0cu2-005AV7-Sg
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 06:18:37 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id A77A424E1C7;
	Thu,  1 Dec 2022 14:17:26 +0800 (CST)
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 1 Dec
 2022 14:17:26 +0800
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX161.cuchost.com
 (172.16.6.71) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 1 Dec
 2022 14:17:26 +0800
Received: from EXMBX068.cuchost.com ([fe80::c4da:cbc4:bb39:ca7e]) by
 EXMBX068.cuchost.com ([fe80::c4da:cbc4:bb39:ca7e%16]) with mapi id
 15.00.1497.044; Thu, 1 Dec 2022 14:17:26 +0800
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: "Conor.Dooley@microchip.com" <Conor.Dooley@microchip.com>
CC: "robh+dt@kernel.org" <robh+dt@kernel.org>, "herbert@gondor.apana.org.au"
	<herbert@gondor.apana.org.au>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>, "kernel@esmil.dk" <kernel@esmil.dk>,
	"davem@davemloft.net" <davem@davemloft.net>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>
Subject: RE: [PATCH 6/6] riscv: dts: starfive: Add crypto and DMA node for
 VisionFive 2
Thread-Topic: [PATCH 6/6] riscv: dts: starfive: Add crypto and DMA node for
 VisionFive 2
Thread-Index: AQHZBH/4vZHP2U3n+EalaiuTkXOjPK5WreUAgAHaqdA=
Date: Thu, 1 Dec 2022 06:17:26 +0000
Message-ID: <4ddddceba3dc437daca27374dd2f6fd7@EXMBX068.cuchost.com>
References: <20221130055214.2416888-1-jiajie.ho@starfivetech.com>
 <20221130055214.2416888-7-jiajie.ho@starfivetech.com>
 <1673ef8b-179e-3b03-b3f8-8d347c70d8c3@microchip.com>
In-Reply-To: <1673ef8b-179e-3b03-b3f8-8d347c70d8c3@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_221835_380989_1BCC1E95 
X-CRM114-Status: GOOD (  26.76  )
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



> -----Original Message-----
> From: Conor.Dooley@microchip.com <Conor.Dooley@microchip.com>
> Sent: Wednesday, November 30, 2022 5:31 PM
> To: JiaJie Ho <jiajie.ho@starfivetech.com>
> Cc: robh+dt@kernel.org; herbert@gondor.apana.org.au; linux-
> crypto@vger.kernel.org; kernel@esmil.dk; davem@davemloft.net;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> riscv@lists.infradead.org; krzysztof.kozlowski+dt@linaro.org
> Subject: Re: [PATCH 6/6] riscv: dts: starfive: Add crypto and DMA node for
> VisionFive 2
> 
> Hey Jia Jie Ho,
> 
> On 30/11/2022 05:52, Jia Jie Ho wrote:
> > [You don't often get email from jiajie.ho@starfivetech.com. Learn why
> > this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know
> > the content is safe
> >
> > Adding StarFive crypto IP and DMA controller node to VisionFive 2 SoC.
> >
> > Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
> > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> 
> Out of curiosity, what was Huan Feng's contribution to this patch?
> Did they co-develop it, or is there some other reason?
> 
Hi Conor, 
Yes, Huan Feng co-developed this driver.

> > ---
> >   .../jh7110-starfive-visionfive-v2.dts         |  8 +++++
> >   arch/riscv/boot/dts/starfive/jh7110.dtsi      | 36 +++++++++++++++++++
> 
> I figure Emil will likely see anyway, but whenever you get actual review
> comments and send a v2 - please don't drop people that get_maintainer.pl
> tells you are responsible for the code in question.
> 
I will include everyone involved when sending the new patch series.

> >   2 files changed, 44 insertions(+)
> >
> > diff --git
> > a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> > b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> > index 450e920236a5..da2aa4d597f3 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> > @@ -115,3 +115,11 @@ &tdm_ext {
> >   &mclk_ext {
> >          clock-frequency = <49152000>;
> >   };
> > +
> > +&sec_dma {
> > +       status = "okay";
> > +};
> > +
> > +&crypto {
> > +       status = "okay";
> > +};
> 
> In what scenario would you not want to have these enabled?
> 
> Thanks,
> Conor.
> 
These drivers are always enabled. 
Is everything ok with the dts node entries?
Thank you for spending time reviewing and providing suggestions for this patch.

Regards,
Jia Jie

> > diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > index 4ac159d79d66..745a5650882c 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > @@ -455,5 +455,41 @@ uart5: serial@12020000 {
> >                          reg-shift = <2>;
> >                          status = "disabled";
> >                  };
> > +
> > +               sec_dma: sec_dma@16008000 {
> > +                       compatible = "arm,pl080", "arm,primecell";
> > +                       arm,primecell-periphid = <0x00041080>;
> > +                       reg = <0x0 0x16008000 0x0 0x4000>;
> > +                       reg-names = "sec_dma";
> > +                       interrupts = <29>;
> > +                       clocks = <&stgcrg JH7110_STGCLK_SEC_HCLK>,
> > +                                <&stgcrg JH7110_STGCLK_SEC_MISCAHB>;
> > +                       clock-names = "sec_hclk","apb_pclk";
> > +                       resets = <&stgcrg JH7110_STGRST_SEC_TOP_HRESETN>;
> > +                       reset-names = "sec_hre";
> > +                       lli-bus-interface-ahb1;
> > +                       mem-bus-interface-ahb1;
> > +                       memcpy-burst-size = <256>;
> > +                       memcpy-bus-width = <32>;
> > +                       #dma-cells = <2>;
> > +                       status = "disabled";
> > +               };
> > +
> > +               crypto: crypto@16000000 {
> > +                       compatible = "starfive,jh7110-crypto";
> > +                       reg = <0x0 0x16000000 0x0 0x4000>;
> > +                       reg-names = "secreg";
> > +                       clocks = <&stgcrg JH7110_STGCLK_SEC_HCLK>,
> > +                                <&stgcrg JH7110_STGCLK_SEC_MISCAHB>;
> > +                       clock-names = "sec_hclk","sec_ahb";
> > +                       resets = <&stgcrg JH7110_STGRST_SEC_TOP_HRESETN>;
> > +                       reset-names = "sec_hre";
> > +                       enable-side-channel-mitigation;
> > +                       enable-dma;
> > +                       dmas = <&sec_dma 1 2>,
> > +                              <&sec_dma 0 2>;
> > +                       dma-names = "sec_m","sec_p";
> > +                       status = "disabled";
> > +               };
> >          };
> >   };
> > --
> > 2.25.1
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
