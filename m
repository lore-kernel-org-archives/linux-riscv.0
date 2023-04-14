Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4025BC77B6E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 06:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j6vnmJym8RiiZy7jiOZi8YjWcW3YU7tdTwxvkP5jYJc=; b=eJzoajuEPGVTTPqOq+TqUb54sk
	WKdodqCxuBn5htQKHdulHPoy77eUZQcg6zlB3YxB6ggdZjB4pFg36E86cGy+UChjp5RJ/ij0Dvq3N
	n2Tq0+Jft4Y1krKkwas9u0yLwJxO3FJ/vUXpV+gnMpCjocBV5/Yc/ey3qKAUNwsUu1bm8dM5fhzJ0
	UVsF1u3nI5nmd26zwljw/pG7fwVnqcRgeF6tdt5ThrJoQkoHj3AYqXgGBGp0BGd0OeSPl1rRRMVQl
	QLkEevmhSVS/pxvIGJAst8o9RdL/F9UeMR3pve9p4kNDIQnPqZT75g+nl4x77X+o0L6IVHFYHOTt6
	ocTkupjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnCup-008Sxo-2c;
	Fri, 14 Apr 2023 06:28:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnCum-008Sx6-0b
	for linux-riscv@lists.infradead.org;
	Fri, 14 Apr 2023 06:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1681453688; x=1712989688;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yUbogp083vNz/Diay1DDnDrLQxV7cDnHSWDCATBAGPg=;
  b=uS+Bb8j/ZEX1fmbi+9SiBP8srxC5OnMTVJkMIrWLTxZCF9ms+9RwK9T6
   JozeCsZuhBSH40Vp1JuI1HE2+eO/vlpWrr0NTZXlmzvx9DMNZhAjVRTgS
   lBFYXlRqccodKHn0AXlB38aFCZi5zTJFfILmZifi3vBqwcv/5CbGZf5ez
   v+lRnKeQ46O5gbGIym9rd3Vpb/KbUUn/qdCgdpHVCYk69GWQKLhrh2v/S
   uvw7PQp9B9NED8Z7f4hZ0tJi3ianS9DL8YeOQ7TLmjE/6UErIRGp5qUQe
   8H7ax5jsvfc+qygdQW0hf1NX2CydjBdjHvMWg/k8e5/R6HxNLu0GUnuqR
   w==;
X-IronPort-AV: E=Sophos;i="5.99,195,1677567600"; 
   d="asc'?scan'208";a="210414801"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2023 23:28:02 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 13 Apr 2023 23:28:02 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 13 Apr 2023 23:28:00 -0700
Date: Fri, 14 Apr 2023 07:27:44 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Changhuang Liang <changhuang.liang@starfivetech.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Walker Chen <walker.chen@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v1 1/7] dt-bindings: power: Constrain properties for
 JH7110 PMU
Message-ID: <20230414-wildfowl-unbeaten-fbdf895d1b5c@wendy>
References: <20230411064743.273388-1-changhuang.liang@starfivetech.com>
 <20230411064743.273388-2-changhuang.liang@starfivetech.com>
 <cb97cf01-2dfd-7f93-2048-e05a806d468f@linaro.org>
 <ee406b3d-0719-9332-cab5-62fe7537bcf1@starfivetech.com>
 <20230412-trifle-outplayed-8a1c795fab8b@wendy>
 <d59439c1-bce1-b4a1-0e05-77afc4fc2ebb@linaro.org>
MIME-Version: 1.0
In-Reply-To: <d59439c1-bce1-b4a1-0e05-77afc4fc2ebb@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_232808_308739_AF25E786 
X-CRM114-Status: GOOD (  18.46  )
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
Content-Type: multipart/mixed; boundary="===============8769907973215783791=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8769907973215783791==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4uTpX9GTsiQTdpIq"
Content-Disposition: inline

--4uTpX9GTsiQTdpIq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 12, 2023 at 01:29:57PM +0200, Krzysztof Kozlowski wrote:
> On 12/04/2023 11:42, Conor Dooley wrote:
> > On Wed, Apr 12, 2023 at 04:51:16PM +0800, Changhuang Liang wrote:
> >>
> >>
> >> On 2023/4/12 16:35, Krzysztof Kozlowski wrote:
> >>> On 11/04/2023 08:47, Changhuang Liang wrote:
> >>>> When use "starfive,jh7110-pmu-dphy" compatible, do not need the reg =
and
> >>>> interrupts properties.
> >> [...]
> >>>> =20
> >>>>  description: |
> >>>>    StarFive JH7110 SoC includes support for multiple power domains w=
hich can be
> >>>> @@ -17,6 +18,7 @@ properties:
> >>>>    compatible:
> >>>>      enum:
> >>>>        - starfive,jh7110-pmu
> >>>> +      - starfive,jh7110-pmu-dphy
> >>>
> >>> You do here much more than commit msg says.
> >>>
> >>> Isn'y DPHY a phy? Why is it in power?
> >>>
> >>
> >> OK, I will add more description. This is a power framework used to tur=
n on/off=20
> >> DPHY. So it in power, not a phy.
> >=20
> > Perhaps tie it less to its role w/ the phy, and more to do with its
> > location, say "jh7110-aon-pmu"?
> > There's already "aon"/"sys"/"stg" stuff used in clock-controller and
> > syscon compatibles etc.
> >=20
> > Krzysztof, what do you think of that? (if you remember the whole
> > discussion we previously had about using those identifiers a few weeks
> > ago).
>=20
> Depends whether this is the same case or not.

> AFAIR, for AON/SYS/STG
> these were blocks with few features, not only clock controller.

Correct, yes. In the dts, this "pmu-dphy" node is a child node of the
aon syscon, so this pmu stuff would be one of the several features.


--4uTpX9GTsiQTdpIq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZDjyYAAKCRB4tDGHoIJi
0rayAQDQvEYTN5qEh/woJsy4Uu6mKHynU+GBtUcFZPreUm/W8wEAz0rvwm2qU8Q1
MVnWhTO6aCd4Z1GqB1375PAmNv2lIwQ=
=Iewl
-----END PGP SIGNATURE-----

--4uTpX9GTsiQTdpIq--


--===============8769907973215783791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8769907973215783791==--

