Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DDDC30659
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 12:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozRuTAOiU68NiFGAtaSgsgaxSBjw8Y/1pQJjWcmbjE0=; b=ByBEBcI8bJmK0Qe2KtSY2njo2+
	ShuNfhZvb8eXNim2r/s2R/pMwLfM7NhdXwRNM0O8bD/ZEcBfMwI0nEhjYm2CRvm7DW6g6sS8Oc/eV
	UsAa5j6gXjWhCm72LNKAShYkNycKuI3EelOGZelHt/ZJGZZhNGLjpAd5BDfsZITMTHjpdAxyKGVth
	0MokEF+3EvxWZAwtew5IgnavWP9wOxdcmC/5BdlkbO8ivwKU2gHuF8ukiTFuAyXbfiSL56/fZsK91
	HgvU5yIgiNAXbfeICFGbTyMmhU6Lat6/MB9onIGLnvB7zW+IXrSk/GZJfoUlEzb2dsYd6/WF++lEk
	84U4jiwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGH3-00000003GRJ-3ZRi;
	Mon, 01 Jul 2024 12:36:49 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOFzV-000000037Y7-1zxj
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 12:18:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 56F9BCE1303;
	Mon,  1 Jul 2024 12:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F0AC116B1;
	Mon,  1 Jul 2024 12:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719836318;
	bh=ngfLZvGV6uNktSmrI51yAbmgEtk/48MHEWS6ypeymyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MT4f8WELSRTQzhacSmF5U6XENMjFHm/V1ehqU/8RQFmoiEN3M63QkYwdNIWGpjjax
	 50w04mD01aEgUvzPqhwE9/T2zPRk7wM+W5iKB5J/erAhOnGYleoUgb9HiJLqWE0hbC
	 nmFwK9jcUAAntb0ckGzTNW9W3jCgXSn3MkAniGaWpnjQJ1sVvwICrz+oGmz5MX2Zav
	 utyhyQzEuZ/Wxg8UjLI2d5IKmLKb7RWTy7YokMimNoOL7JKFR91JzTSIFmlLwKy80F
	 ri8F2stJDEOBoLd06AjZeRBIv3wyFPFklCjBTYrfos0Z6KZZcRld7ffXfLJf5AbOwX
	 ysxOybwj3We0Q==
Date: Mon, 1 Jul 2024 13:18:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: dts: starfive: add pcie1 on the star64
Message-ID: <20240701-jaundice-enroll-1473aecce983@spud>
References: <20240626-traverse-excitable-a1d9be38a9da@spud>
 <SHXPR01MB086332671CEBE2D0A21ED695E6D32@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <SHXPR01MB086332671CEBE2D0A21ED695E6D32@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_051841_905241_B37D2D65 
X-CRM114-Status: GOOD (  22.93  )
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
Content-Type: multipart/mixed; boundary="===============1948790218739067584=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1948790218739067584==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xupLm0cCcA85XjGZ"
Content-Disposition: inline


--xupLm0cCcA85XjGZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2024 at 10:45:15AM +0000, Minda Chen wrote:
>=20
>=20
> >=20
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > It was reported to me that the star64 actually /does/ have an exposed P=
CIe port,
> > despite the commit message there. In my original conversation with Mind=
a,
> > they said that pcie1 was available there and pcie0 was not, but the v2 =
patch
> > didn't actually add pcie1 on the star64.
> >=20
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > I think I'll just squash this in and fixup the commit message, since th=
e patch is still
> > at the top of my branch.
> >=20
> > CC: Minda Chen <minda.chen@starfivetech.com>
> > CC: Conor Dooley <conor@kernel.org>
> > CC: Rob Herring <robh+dt@kernel.org>,
> > CC: Emil Renner Berthing <emil.renner.berthing@canonical.com
> > CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org
> > CC: devicetree@vger.kernel.org
> > CC: linux-kernel@vger.kernel.org
> > CC: linux-riscv@lists.infradead.org
> > ---
> >  arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts | 4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> > b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> > index 2d41f18e0359..b720cdd15ed6 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> > @@ -39,6 +39,10 @@ phy1: ethernet-phy@1 {
> >  	};
> >  };
> >=20
> > +&pcie1 {
> > +	status =3D "okay";
> > +};
> > +
> >  &phy0 {
> >  	rx-internal-delay-ps =3D <1900>;
> >  	tx-internal-delay-ps =3D <1500>;
> > --
> > 2.43.0
>=20
> Hi Conor
>=20
> The jh7110-pine64-star64.dts is in linux-next tree. I have not noticed it=
 before.
> Should I squash this to my patch? Can my dts patch be accepted in kernel =
6.11? Thanks
> (The same with Starfive PCIe patch set in linux-next, which will be merge=
 in 6.11, right?)

I already applied your patch, I'll squash this into your patch and queue
the result for 6.11.

Thanks,
Conor.

--xupLm0cCcA85XjGZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoKemwAKCRB4tDGHoIJi
0hl5AP4tq/0cGJ4J8cwlO45COR2B2WBVRKqZ2766zlqVGyzPxAD/UBj0CMvcQrG6
TqLmV/Av2kgk7raSUv6G+/bKAKfz7gw=
=OgkJ
-----END PGP SIGNATURE-----

--xupLm0cCcA85XjGZ--


--===============1948790218739067584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1948790218739067584==--

