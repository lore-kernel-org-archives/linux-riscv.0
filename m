Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B6BC6FD1D
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 07:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9hP2URuORniOgtvl0Xudg1vcOhJUbZmCi95XYpmjw9M=; b=LRRTur5+LnBYbGewy5d5ggq/E5
	+pT50xwK3IUqZVwHZp8lmY3yrYxB/4ZdEMsRTc/k+n7ir6VIQElGEo1iHVIVqdJ8z23b7WTQVx2Rw
	YpNz1kdl6OHnYZmDoDmBEd8wmGWoap6QnuCHJiInpMrIm4MDVjQjyhnXtM9z413OTH6rqODPkgOMt
	hpWeoc7It2oxNIJTNjwIUJOFvazKwjq7m09/vdidiJ9puH8YptC6AYRmtNw6qEwMtc3WetP217pEc
	ckbOu3rGJs0uBb0uK2r8x807QSaSPkNZ3/hJede99wir6yONOJn4P2MsRtm18WInSTNzxQj34nnpA
	RDOTRU2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phnB2-0030WT-32;
	Thu, 30 Mar 2023 07:58:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phnAz-0030UL-1o
	for linux-riscv@lists.infradead.org;
	Thu, 30 Mar 2023 07:58:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680163109; x=1711699109;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A06o++GEZF1cEl6Qfofe3vUwyO2hA9xPd0Uh8TRXZRI=;
  b=wYUhcSTeiCm2OGjejiGG9dasetIbSZrT3SxbkyuKv+dMlU6t3Q/pnefC
   VY98zEbfe5M6qn+L/VDVsKK7QPiRZdqmyW1K7NvQxckK8YKYvNziU1ypx
   r/ZiWaz/SPBfzWa8xXym7owq4esnCYXsx+gwyIe/7YX65FYajE1NuKk17
   2qb0vEalmfPkqbAjrTeKVhmNhVJMPN7j59aj45NV5Om5Mw9QfPDDG40L2
   yJf3js2yN+b3bAz0GRT5GGEKkI+60SX8SixZ4bS4LwNzgR9SuXpzq3l+m
   QcMojX2kOZF9xM94f9Vti5o34Yg92lxZwd6sGooq9QLlBJL8O1O6iPwXj
   A==;
X-IronPort-AV: E=Sophos;i="5.98,303,1673938800"; 
   d="asc'?scan'208";a="218651809"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Mar 2023 00:58:25 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 00:58:25 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 30 Mar 2023 00:58:23 -0700
Date: Thu, 30 Mar 2023 08:58:09 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<walker.chen@starfivetech.com>
CC: Walker Chen <walker.chen@starfivetech.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v1 3/3] riscv: dts: starfive: add tdm node and sound card
Message-ID: <af015701-f1ff-4b1e-9b1b-c635fc684ce6@spud>
References: <20230329153320.31390-1-walker.chen@starfivetech.com>
 <20230329153320.31390-4-walker.chen@starfivetech.com>
 <d455a90a-7e63-2254-75cb-70cb26ae7483@linaro.org>
MIME-Version: 1.0
In-Reply-To: <d455a90a-7e63-2254-75cb-70cb26ae7483@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_005829_648164_162F4822 
X-CRM114-Status: GOOD (  12.72  )
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
Content-Type: multipart/mixed; boundary="===============5980365537138465395=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5980365537138465395==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QNdQWFvvxmlEs8o1"
Content-Disposition: inline

--QNdQWFvvxmlEs8o1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2023 at 09:43:10AM +0200, Krzysztof Kozlowski wrote:
> On 29/03/2023 17:33, Walker Chen wrote:
> > Add the tdm controller node and sound card for the StarFive JH7110 SoC.

> > +		compatible =3D "fixed-clock";
> > +		clock-output-names =3D "wm8960_mclk";
> > +		#clock-cells =3D <0>;
> > +	};
> > +
> >  	i2srx_bclk_ext: i2srx-bclk-ext-clock {
> >  		compatible =3D "fixed-clock";
> >  		clock-output-names =3D "i2srx_bclk_ext";
> > @@ -375,6 +381,27 @@
> >  			status =3D "disabled";
> >  		};
> > =20
> > +		tdm: tdm@10090000 {
> > +			compatible =3D "starfive,jh7110-tdm";
> > +			reg =3D <0x0 0x10090000 0x0 0x1000>;
> > +			clocks =3D <&syscrg JH7110_SYSCLK_TDM_AHB>,
> > +				 <&syscrg JH7110_SYSCLK_TDM_APB>,
> > +				 <&syscrg JH7110_SYSCLK_TDM_INTERNAL>,
> > +				 <&syscrg JH7110_SYSCLK_TDM_TDM>,
> > +				 <&syscrg JH7110_SYSCLK_MCLK_INNER>,
> > +				 <&tdm_ext>;
> > +			clock-names =3D "tdm_ahb", "tdm_apb",
> > +				      "tdm_internal", "tdm",
> > +				      "mclk_inner", "tdm_ext";
> > +			resets =3D <&syscrg JH7110_SYSRST_TDM_AHB>,
> > +				 <&syscrg JH7110_SYSRST_TDM_APB>,
> > +				 <&syscrg JH7110_SYSRST_TDM_CORE>;
> > +			dmas =3D <&dma 20>, <&dma 21>;
> > +			dma-names =3D "rx","tx";
> > +			#sound-dai-cells =3D <0>;
> > +			status =3D "disabled";
> > +		};
> > +
> >  		stgcrg: clock-controller@10230000 {
> >  			compatible =3D "starfive,jh7110-stgcrg";
> >  			reg =3D <0x0 0x10230000 0x0 0x10000>;
> > @@ -601,5 +628,12 @@
> >  			#reset-cells =3D <1>;
> >  			power-domains =3D <&pwrc JH7110_PD_VOUT>;
> >  		};
> > +
> > +		sound0: snd-card0 {
>=20
> 1. Why card0?
> 2. Where is this node located? In MMIO bus? Run some basic checks on
> your DTS before submitting upstream.
> dtbs_check
> dtbs W=3D1
>=20
> 3. Why this is even in the DTSI? This really looks wrong.

Excuse me for not following here, but Walker, could you point me at
where in the schematic for the VisionFive 2 that this wm8960 actually
is?
I know ~nothing about audio, but good old Google tells me that this is a
dedicated codec chip and I was looking at [1] and could not easily find
it on the schematic.

Thanks,
Conor.

1 https://doc-en.rvspace.org/VisionFive2/PDF/SCH_RV002_V1.2A_20221216.pdf

--QNdQWFvvxmlEs8o1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCVBBAAKCRB4tDGHoIJi
0vwwAP9ZaSwYSns7mnKRth/7zaYJio+DGrk7Decdat0PRkCAKgD/V+oWJQb4k4XP
/cV4orJwQtUvav3dglridCNAmArKkQQ=
=3gLi
-----END PGP SIGNATURE-----

--QNdQWFvvxmlEs8o1--


--===============5980365537138465395==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5980365537138465395==--

