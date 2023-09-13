Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0C5EEB596
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 06:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+fcwA2VIKV5yN8PkkE/IcN4jVrTIM+GcfPYNTYTjnWI=; b=ZX/i6rO4uDbOUChB9Bq2XKQWDm
	QXqFSUbum/rko/BXs5+FfBr8oUScHqqMkQL1Qr1Yb2xaqJuhOagunAIM0g0GcPuzb7JsSrhuHAai2
	/RPIAcv6I1W/peWCqxplJclaKrES4QwV9AwQaCg+dsb4RSA/mxoO45xmDcSAl3Jsn4h0Bf3KJqulF
	hx4t+2uPPlcvgU3VTyDrzsv0JkKjN8bEpZrP0AUeyTT01pyz/78vtFBNm+5TMljFg2Dms1SHAtV9t
	rbzr+795E054RYF91gKcZLhwW0rYW5nCyOOgkx17YD1appE3J3My/EUItWL0ifftvqI8q7U75NdNR
	qa49FiVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgJG4-004n9m-39;
	Wed, 13 Sep 2023 06:21:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgJG1-004n8H-2v
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 06:21:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1694586110; x=1726122110;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yQ/j7D4OXBoW16GrBTc/hnFxI50i0+gh0HACschoKSA=;
  b=uAf6RwzJ5TO2b46fB1lYi87o54HYZ26Ne0qoWHDvXtT0QLmfqH6k5NXQ
   ZBTiNUeVY+WUH2k9U+2gdWwBIiX3CxhN/fmzIidqhPGMTE7QzL2Xs/KJO
   loWl4u1SlrbLlbHopWFBLiZaXGO/9pV4ypOLHCbmqB6QGbcEQKs9Epeds
   UibVFtDu8OgvnmiyujHPzaM2XVdqHSdAkkxo0uQTY2bn5VvYKw9+nAe4e
   348T7fkUWzBmfBVocjUwXQA6byAPq0qlFRAGTb9l3AbW4wsgFQeBd6RjE
   2SjhipMCJdoInFIFe8qsbu2y8a1sZh7upykAFhAPH9HCq9Twij+Ob6dRz
   g==;
X-CSE-ConnectionGUID: 7XmvrzgjQjiO7en38VZV5Q==
X-CSE-MsgGUID: Lz0HCdHbTEyKqaPCKhfWKw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="asc'?scan'208";a="234927951"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Sep 2023 23:21:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 12 Sep 2023 23:21:12 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 12 Sep 2023 23:21:10 -0700
Date: Wed, 13 Sep 2023 07:20:54 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Hal Feng <hal.feng@starfivetech.com>
CC: Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [-next v2 1/2] riscv: dts: starfive: visionfive 2: Enable usb0
Message-ID: <20230913-mockup-liable-9dcf94ed4568@wendy>
References: <20230829020511.26844-1-hal.feng@starfivetech.com>
 <c417d55d-d886-f66d-15a9-73b297d28d59@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <c417d55d-d886-f66d-15a9-73b297d28d59@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_232149_946112_B13349F3 
X-CRM114-Status: GOOD (  18.68  )
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
Content-Type: multipart/mixed; boundary="===============1082503541667768208=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1082503541667768208==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6s20so3aHOodvuXr"
Content-Disposition: inline

--6s20so3aHOodvuXr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 11:47:22AM +0800, Hal Feng wrote:
> On Tue, 29 Aug 2023 10:05:10 +0800, Hal Feng wrote:
> > usb0 was disabled by mistake when merging, so enable it.
> >=20
> > Fixes: e7c304c0346d ("riscv: dts: starfive: jh7110: add the node and pi=
ns configuration for tdm")
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> >  arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.=
dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > index d79f94432b27..85f40df93f25 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > @@ -513,6 +513,7 @@ &uart0 {
> > =20
> >  &usb0 {
> >  	dr_mode =3D "peripheral";
> > +	status =3D "okay";
> >  };
>=20
> Hi, Conor,
>=20
> As v6.6-rc1 is already released, would you apply this series
> in rc2 or the later rc versions?

Yes, I was planning on doing a sweep for potential fixes today. There's
3 or 4 I think.

--6s20so3aHOodvuXr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQFUuAAKCRB4tDGHoIJi
0nRsAQCTaqgoWUbeumzMTXR5EzAQXSylZNGF84sjQsGXntCqYgD9ErLrcWMRsBL/
Ez8Q3a7Spg2MhCfTWPzCpJX74CDvhAs=
=+OgF
-----END PGP SIGNATURE-----

--6s20so3aHOodvuXr--


--===============1082503541667768208==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1082503541667768208==--

