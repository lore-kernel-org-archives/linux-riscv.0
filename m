Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD73DC77B7A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 14:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MGlnG+P6XIunGJtIQMNYTBckgjm25ttd/uVGDb/DTZo=; b=SWLxK69O++lYwgBEBcrBbks1gP
	kvzVh3Xrec9AcSm/f1y25Xzo6SwgZ1Bo3GbdTPV3pyonvZe8k00mkPacoZX/lg9MVxLvcwEt6pnql
	E7uhVlMp6dX0JjJmmJZa92odNGXJvaMGTKYyfkCwJQiO8ScOsxwxqb9WzOoobC0mk1n1ftVyAoiin
	oZEnZJ2CgpVzOLEK0CKDaw4Nwikioizn0Ds2PeDrpJblJRrz1eEip1j6ZWI2wC84GAlLO3sGa0bCW
	xBEXhqQ2zve7tiLOC/fWFplDR2u619P6bQFhbB7Vn490vP+EXV8/hFoslEPovj5INeXaLyuqoXG2X
	BpG/095w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q00v4-00GT4R-1l;
	Fri, 19 May 2023 14:17:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q00v1-00GT3N-0Z
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 14:17:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684505840; x=1716041840;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sd2VkJX17zpiW/S4Qia53jgvQaRUOiUOyM2LVozEYUc=;
  b=YBjUlDJ4tymE8MXnQ0JWLP45q020PZdEryw/3Fwl1RPCSfyNbzisOWu6
   vCFfOonYP0z9Q5vS4wAoWQADAkoJ3uL/RJRtZz8Yx51FhHbcMpFtZi6v+
   Z8xI4QGySAYC9eXZCDjMAQ1Hezoq6r/axjKd4R3z4fagUYTwnmqRMTorf
   4mmnkSdOHTfrxf8HnSgj14iSv9FsMHOTLNEiN++dpVwK5mRCbLLiNjO5z
   3d+/hTDd38EP5CpAzi9+/P+fLurkc7A3WIDbiPX+kCEmYeGPttZErUqVC
   ynCsCPcwUXUJyG05U7it9Ub1iIAGB0ki/KAAd2xNjgHWByjVnoEJnw6fp
   g==;
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="asc'?scan'208";a="214610741"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 May 2023 07:17:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 19 May 2023 07:17:13 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 19 May 2023 07:17:10 -0700
Date: Fri, 19 May 2023 15:16:49 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Torsten Duwe <duwe@lst.de>
CC: Xingyu Wu <xingyu.wu@starfivetech.com>, <linux-riscv@lists.infradead.org>,
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
Message-ID: <20230519-smokeless-guileless-2a71cae06509@wendy>
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
 <20230512022036.97987-2-xingyu.wu@starfivetech.com>
 <20230519135733.GA10188@lst.de>
MIME-Version: 1.0
In-Reply-To: <20230519135733.GA10188@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_071719_219310_94AEB959 
X-CRM114-Status: GOOD (  14.47  )
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
Content-Type: multipart/mixed; boundary="===============1883059512912017970=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1883059512912017970==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="R4Qg/wX5CgaesNEQ"
Content-Disposition: inline

--R4Qg/wX5CgaesNEQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2023 at 03:57:33PM +0200, Torsten Duwe wrote:
> On Fri, May 12, 2023 at 10:20:30AM +0800, Xingyu Wu wrote:
> [...]
> >  #ifndef __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
> >  #define __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
> > =20
> > +/* PLL clocks */
> > +#define JH7110_CLK_PLL0_OUT			0
> > +#define JH7110_CLK_PLL1_OUT			1
> > +#define JH7110_CLK_PLL2_OUT			2
>=20
> In U-Boot commit 58c9c60b Yanhong Wang added:
>=20
> +
> +#define JH7110_SYSCLK_PLL0_OUT                       190
> +#define JH7110_SYSCLK_PLL1_OUT                       191
> +#define JH7110_SYSCLK_PLL2_OUT                       192
> +
> +#define JH7110_SYSCLK_END                    193
>=20
> in that respective file.
>=20
> > +#define JH7110_PLLCLK_END			3
> > +
> >  /* SYSCRG clocks */
> >  #define JH7110_SYSCLK_CPU_ROOT			0
>=20
> If the symbolic names referred to the same items, would it be possible
> to keep the two files in sync somehow?

Ohh, that's not good.. If you pass the U-Boot dtb to Linux it won't
understand the numbering. The headers are part of the dt-binding :/

--R4Qg/wX5CgaesNEQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGeE0QAKCRB4tDGHoIJi
0j9qAP43YVrZEKNRod6kOuBIre1NM1sSrB1fIk55f7+4mLNEYwEAlTvK/m1TazZN
R+GITt0fWp/eotW4VJ7EN6IC8v3C3QE=
=BbP3
-----END PGP SIGNATURE-----

--R4Qg/wX5CgaesNEQ--


--===============1883059512912017970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1883059512912017970==--

