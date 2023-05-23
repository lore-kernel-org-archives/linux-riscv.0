Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30AAFC77B75
	for <linux-riscv@archiver.kernel.org>; Tue, 23 May 2023 08:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wu7I0JzNwGmh9EClp5oin7w63XRI0VRxxd1dbqMX3oU=; b=JtSOT0qMmYvH4W8N33EOqPs1Lg
	cl7/c25OiOdGtBOrpUcLhUtnEzgE1bwXOMAGoillztr1ZE7wcZCzuI8Nmwves5RrzzX8p9QOK0e/E
	XZb8e/N5D82w8lgKHCaCP/jHc5IDWbkKHJmHXhOcH4LTBto4CpOK5ow0ZSzTKK2aZI2eDD1xqOALS
	hrBbMznpuPaLJUhnnIPXmAPn0tprxUhMTESHMAu6h7gs5kz5fpWExLA8GoubbL4r+7yjNdgQzjsho
	iY1beGnnAKuyCSf4EltvXK/iuf8XPlBl/TJDX3ULDIt6LTuctLXw+Qacz/RnZCK6A1jV/48QfwVJE
	WCnHjxbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1NOP-009RMn-1T;
	Tue, 23 May 2023 08:29:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1NOJ-009RLS-2R
	for linux-riscv@lists.infradead.org;
	Tue, 23 May 2023 08:29:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684830551; x=1716366551;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fr8/rGDDsZpOOPOgXOkmnx5UALlAdGkBZkWrF/mDeOw=;
  b=P+TQXx5XzkA/GdkaA2jBWIZ41PV+d5DomW1JWq6E2UIs27lqBERzEDix
   nIeG2PfommeHJgJDWBI4Lik5HqrAvBOFz+JyBub4AjilSEcTKqRNUCnYx
   gG6pkzLlLLz4oC3C6jxGeAfkYjPpraLQJ1SmsBG9+yQu8Te2DVLcH02vG
   KCgXA6A5O7i/Xt4YjGs2PBPZMJpResZv97MiL4hMqB2AuRDDtulrr+/tF
   svB7a5mbNZJClIP4bjlYrzokWmKER6EmxyG04oeok45kNeH4mtcBSOQyR
   SGNSnltKRFKlDs46R4d62x6Z3iHIQUaXzb9Y3zhyFwvygkvCQDOLVf0Cs
   A==;
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; 
   d="asc'?scan'208";a="214471136"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 May 2023 01:29:05 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 23 May 2023 01:29:04 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 23 May 2023 01:29:01 -0700
Date: Tue, 23 May 2023 09:28:39 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
CC: Torsten Duwe <duwe@lst.de>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <yanhong.wang@starfivetech.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, Emil Renner
 Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, William Qiu
	<william.qiu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: Add StarFive JH7110 PLL clock
 generator
Message-ID: <20230523-fondue-monotype-0c751a8f0c13@wendy>
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
 <20230512022036.97987-2-xingyu.wu@starfivetech.com>
 <20230519135733.GA10188@lst.de>
 <20230519-smokeless-guileless-2a71cae06509@wendy>
 <df43411e-8982-74f5-6148-e7281c37dada@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <df43411e-8982-74f5-6148-e7281c37dada@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_012912_005432_38E73410 
X-CRM114-Status: GOOD (  20.76  )
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
Content-Type: multipart/mixed; boundary="===============7448248338290140324=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7448248338290140324==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="P8c7zTGQM/sTX7js"
Content-Disposition: inline

--P8c7zTGQM/sTX7js
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 23, 2023 at 10:56:43AM +0800, Xingyu Wu wrote:
> On 2023/5/19 22:16, Conor Dooley wrote:
> > On Fri, May 19, 2023 at 03:57:33PM +0200, Torsten Duwe wrote:
> >> On Fri, May 12, 2023 at 10:20:30AM +0800, Xingyu Wu wrote:
> >> [...]
> >> >  #ifndef __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
> >> >  #define __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
> >> > =20
> >> > +/* PLL clocks */
> >> > +#define JH7110_CLK_PLL0_OUT			0
> >> > +#define JH7110_CLK_PLL1_OUT			1
> >> > +#define JH7110_CLK_PLL2_OUT			2
> >>=20
> >> In U-Boot commit 58c9c60b Yanhong Wang added:
> >>=20
> >> +
> >> +#define JH7110_SYSCLK_PLL0_OUT                       190
> >> +#define JH7110_SYSCLK_PLL1_OUT                       191
> >> +#define JH7110_SYSCLK_PLL2_OUT                       192
> >> +
> >> +#define JH7110_SYSCLK_END                    193
> >>=20
> >> in that respective file.
> >>=20
> >> > +#define JH7110_PLLCLK_END			3
> >> > +
> >> >  /* SYSCRG clocks */
> >> >  #define JH7110_SYSCLK_CPU_ROOT			0
> >>=20
> >> If the symbolic names referred to the same items, would it be possible
> >> to keep the two files in sync somehow?
> >=20
> > Ohh, that's not good.. If you pass the U-Boot dtb to Linux it won't
> > understand the numbering. The headers are part of the dt-binding :/
>=20
> Because PLL driver is separated from SYSCRG drivers in Linux, the numberi=
ng
> starts from 0. But in Uboot, the PLL driver is included in the SYSCRG dri=
ver,
> and the number follows the SYSCRG.

Unfortunately, how you choose to construct your drivers has nothing to
do with this.
These defines/numbers appear in the dts and are part of the DT ABI.
The same dts is supposed to work for Linux & U-Boot.

--P8c7zTGQM/sTX7js
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGx5NwAKCRB4tDGHoIJi
0hKCAQCjR+6mFn9Hvjg7LZxkV1N8CJdjb0cHcueV22kKPkPAUwEAs0oxZHhBAEM3
N73rfgjIVRlJ5hJyp3q2Sua21OaY/w4=
=v6JB
-----END PGP SIGNATURE-----

--P8c7zTGQM/sTX7js--


--===============7448248338290140324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7448248338290140324==--

