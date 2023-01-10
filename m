Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A751C54EBD
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 01:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FeATII29iIjaaiguvudufRBKmYPkGoHhXiY1lKiJQVA=; b=sIgwB78xcTUKuH
	2xGEI78vJv33Mib96Bit+O1E1B0dMMjcAkVqxrph+HofpEjdPzHl+AQXgr4YR2BnvznHCp1uGuSV5
	Ee2mFGeIZDBYrxWIZXUaGXEJ/i4Mv9iZ8BzWQL3aaiZqh0I8Kizsi220I+LnQ+wsRdm9kUNQ5a3z5
	aaGYbIxUkAzcSa6JWGUY9QLzDY8IwCcGD4T0hyem5LkbjHHhqtzdrzIJ4trPsiLU/lzTagkIBE1Ap
	Rb9DXiuu+eVRpZN0b4E57g+lO7AipLzgFVLqjKUovxp9lTE5j0Rq5b+Ix3TbQrB2A9J5U5vu0K6/x
	lXsVQ2+qPLM5xjQAkbvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF30K-004niO-Em; Tue, 10 Jan 2023 01:00:40 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF30G-004nfs-Fq
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 01:00:39 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 98EBA24E10F;
	Tue, 10 Jan 2023 08:59:58 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 10 Jan
 2023 08:59:58 +0800
Received: from EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4]) by
 EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4%16]) with mapi id
 15.00.1497.044; Tue, 10 Jan 2023 08:59:58 +0800
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Olivia Mackall <olivia@selenic.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<kernel@esmil.dk>, Conor Dooley <conor.dooley@microchip.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH v3 3/3] riscv: dts: starfive: Add TRNG node for VisionFive
 2
Thread-Topic: [PATCH v3 3/3] riscv: dts: starfive: Add TRNG node for
 VisionFive 2
Thread-Index: AQHZJEs2/69byV6q60qz9odnDfnRWq6V2l8AgAD5KdA=
Date: Tue, 10 Jan 2023 00:59:58 +0000
Message-ID: <31f6c05b2836450d86560c3efda4abf2@EXMBX168.cuchost.com>
References: <20230109165249.110279-1-jiajie.ho@starfivetech.com>
 <20230109165249.110279-4-jiajie.ho@starfivetech.com> <Y7xWtFZO/Y7GaYRQ@spud>
In-Reply-To: <Y7xWtFZO/Y7GaYRQ@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.190.108.220]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_170036_917620_14C499C7 
X-CRM114-Status: GOOD (  21.08  )
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
> From: Conor Dooley <conor@kernel.org>
> Sent: 10 January, 2023 2:02 AM
> To: JiaJie Ho <jiajie.ho@starfivetech.com>
> Cc: Olivia Mackall <olivia@selenic.com>; Herbert Xu
> <herbert@gondor.apana.org.au>; Rob Herring <robh+dt@kernel.org>;
> Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Emil Renner
> Berthing <kernel@esmil.dk>; Conor Dooley <conor.dooley@microchip.com>;
> linux-crypto@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-riscv@lists.infradead.org
> Subject: Re: [PATCH v3 3/3] riscv: dts: starfive: Add TRNG node for VisionFive
> 2
> 
> Hey folks,
> 
> On Tue, Jan 10, 2023 at 12:52:49AM +0800, Jia Jie Ho wrote:
> > Adding StarFive TRNG controller node to VisionFive 2 SoC.
> >
> > Co-developed-by: Jenny Zhang <jenny.zhang@starfivetech.com>
> > Signed-off-by: Jenny Zhang <jenny.zhang@starfivetech.com>
> > Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
> > ---
> >  arch/riscv/boot/dts/starfive/jh7110.dtsi | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > index 4ac159d79d66..3c29e0bc6246 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > @@ -455,5 +455,15 @@ uart5: serial@12020000 {
> >  			reg-shift = <2>;
> >  			status = "disabled";
> >  		};
> > +
> > +		rng: rng@1600c000 {
> > +			compatible = "starfive,jh7110-trng";
> > +			reg = <0x0 0x1600C000 0x0 0x4000>;
> > +			clocks = <&stgcrg JH7110_STGCLK_SEC_HCLK>,
> > +				 <&stgcrg JH7110_STGCLK_SEC_MISCAHB>;
> 
> Which clock source is this? I see syscrg and aoncrg in the v3
> devicetree:
> https://lore.kernel.org/linux-riscv/20221220011247.35560-7-
> hal.feng@starfivetech.com/
> 
> Have a missed a patchset which adds support for this particular clock
> controller? At the very least, I don't think one has reached the linux-riscv
> mailing list.
> The clock driver patchset only has aoncrg & syscrg:
> https://lore.kernel.org/linux-riscv/20221220005054.34518-1-
> hal.feng@starfivetech.com/
> 

Hi Conor,

Thanks for reviewing the patches.
Yes, the patch for stg domain hasn't been submitted yet.
In this case should I drop this patch from the series until the related patches reach the mailing list?

Thanks
,Jia Jie

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
