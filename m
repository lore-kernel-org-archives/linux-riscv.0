Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540C7C77B6E
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 06:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fz6Y09MpSdThMrcr9UBYAlGBFOCLA3JXCtjBD1GLUBY=; b=rc3sZ4cJVpVsmoZC3bL4kMacts
	mKJs3Wta4C3K7B9eDebKHUGlBb4tjmhQPZLuAa0r2zgjpTNnFkYSBVOrsOzsEVIBRX45J3HvXhPoj
	6Gbs/sbER+tbxZNTbBJpjIrdxzrOr/Vsr6eqPC1Lk0ZaJSF6Y0aLo7b734R1p8URcRkdMxC2WI2MH
	uJGvjpZwxI4m/jI3DmilQGBjHpBpUisCAPM3LgEnOns4fs/RE06jkUh7XGXlFzqcmBsJ430GdIOWu
	nrlT1NoSac3DmHwiY8dXNGbJF3zZeLDTM0e132t1RCmDM4yT0ADLV39L9m/f/ekZRWchOo0gahKD6
	e247aOww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmTx1-001xv6-38;
	Wed, 12 Apr 2023 06:27:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmTwz-001xtg-0H
	for linux-riscv@lists.infradead.org;
	Wed, 12 Apr 2023 06:27:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1681280844; x=1712816844;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0oFXd/j/ZCtmJRDoDRxJJvoLSwqd30a5/biS7X1TG58=;
  b=p38+LoJ7VsWEE1QuAYwSnv8S3qCWsppfCpvjw0Z9HQvXyUTCO8xXQP7j
   sdcM3hNmA28Ptm+dyj3H4GmQI3XHiuZCOJ8Nv2ocZtj8II3VadIyWzDsK
   wfkMmms3ovyiGlCmPGdvDT0QyEYnvTB5y8ZJcaB7pP+Qm0ogUPi7l+nla
   Egdv3+2WGjE8lmNW3AkEOr2dctns+52ZZ+P9KUib8I0OabRuSrdw6Z53y
   PatPsH50WhPQHT3eh3YVmJ0L1Q1/Lk6jrkGjjBnGA9oJMWDfM7nUH4+BW
   f8tH6E/BsQXoEOuoav3LIAqoWYV5Kbl734PE0I985lRqLbfrr7FX2JEBH
   g==;
X-IronPort-AV: E=Sophos;i="5.98,338,1673938800"; 
   d="asc'?scan'208";a="208721680"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Apr 2023 23:27:20 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 11 Apr 2023 23:27:20 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 11 Apr 2023 23:27:18 -0700
Date: Wed, 12 Apr 2023 07:27:03 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Walker Chen <walker.chen@starfivetech.com>
CC: Changhuang Liang <changhuang.liang@starfivetech.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v1 5/7] soc: starfive: Use call back to parse device tree
 resources
Message-ID: <20230412-dwindling-tattoo-220650300f1f@wendy>
References: <20230411064743.273388-1-changhuang.liang@starfivetech.com>
 <20230411064743.273388-6-changhuang.liang@starfivetech.com>
 <eeb7dadb-1cfd-d270-158b-5dd2e5f2bd1a@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <eeb7dadb-1cfd-d270-158b-5dd2e5f2bd1a@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_232725_170871_3334F745 
X-CRM114-Status: GOOD (  11.74  )
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
Content-Type: multipart/mixed; boundary="===============0647795725294026918=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0647795725294026918==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5FwCN1gjD8flHocD"
Content-Disposition: inline

--5FwCN1gjD8flHocD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 12, 2023 at 02:07:52PM +0800, Walker Chen wrote:
>=20
>=20
> On 2023/4/11 14:47, Changhuang Liang wrote:
> > Different compatible parse device tree resources work in different ways.
> >=20
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>=20
> I don't think it's necessary to submit multiple patches separately for th=
e same .c file
> unless it is very necessary. Because the disadvantage of separating multi=
ple patches=20
> is that some information lacks completeness and coherence.

Other than patches 4 & 6, which could be squashed, the breakdown here is
fine IMO. Doing one thing per patch makes it obvious to the reader
*what* is happening.

There's just some missing boilerplate in the commit messages across the
series that the DPHY PMU does not have a reg nor interrupts, and this
work is being done to support that.

Cheers,
Conor.

--5FwCN1gjD8flHocD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZDZPMwAKCRB4tDGHoIJi
0htHAP9THN3zvMQq0pjNoX3Dm0EMizqv5U1cfly39UetP3sIRQD/SWUkFbuqhbQf
U2JRE3tzABbWkjTYzBrcssVqkS2c5gA=
=XK0O
-----END PGP SIGNATURE-----

--5FwCN1gjD8flHocD--


--===============0647795725294026918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0647795725294026918==--

