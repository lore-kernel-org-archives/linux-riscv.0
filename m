Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C7FC3DA7F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 12:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a2nPJSZ3ftDeZihne5KmMCdSHB4LTV6Av1I5Qe34uHU=; b=GGa8JZCm/uB0DPJ6LLXz64ZFmi
	J4gZSm+yIOrVyaqErXD1twijhMs2Yqz05jYEFlp7Hi69lIppPJ0tenjNbTtH2veyLcv4YeCcJ0PEc
	1qWX2AdEGspxdDMAwPdRYZ4hkqhh0/Pf6Y3nTQ3kT7ZV6gjbJY+WLPL766iGKNgl3wpJHcJhObuM6
	IjXcn3Tsd/ItwidH5ko7bqpAQW6LDRjGBUHGfHcst5MQ45cY3as6OIXasOf4/1cRohYUru+y+bpF8
	9tKaAWG+x4yHtE9Hz++w4PbAlvxAZnnyD7vvu2ZNzw+m414x8IEvB/wz4YkEYZ8PAF1n2s3AvcVBA
	prI1gVsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXKL7-00000003uMR-0Ox8;
	Fri, 26 Jul 2024 12:46:29 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXKL3-00000003uLj-0c69
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 12:46:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 65092CE1742;
	Fri, 26 Jul 2024 12:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C305C32782;
	Fri, 26 Jul 2024 12:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721997982;
	bh=W/Q2VBfV6fDJKX1ZqjaPGWunIuWzmZLmn5Xdx9gGl9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X6JWWmqNDjQZFjceAzCkRiSONsAsE3Tg7Zf14UcXGzGPLbCuZb/voxqmqhSdNB2KW
	 28Q2deAt/nv7UhAMDxRW/001hCpTvaq8PJa34heqWUrubWI05IFtmi4x88UqaGcFwl
	 Eq6/JOsP9uU82t8+IjX/H7vJVwXFCBZO8hpcvVNu2GnHJEQmLWeCKMBz2m8JKreyWG
	 eO71PArpdCTKob+fuDLNMkhuLoOpHhtytZvXErtCUZWIBzBJ+FVx+0B3yJAHEjAh5H
	 YuAHDcL0eTHWgjeXJsRIPYB8PTeI+0TimyWQeHzGtWOBCAMMnAGR06WXC9vTdr7xBQ
	 izjouJkBN+qhg==
Date: Fri, 26 Jul 2024 13:46:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	William Qiu <william.qiu@starfivetech.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: dts: starfive: remove non-existant spi device
 from jh7110-common.dtsi
Message-ID: <20240726-likewise-satin-81a7a4a3885c@spud>
References: <20240716-majesty-antler-d9bedc7fd0af@wendy>
 <CAJM55Z9FAH-uiNmXDELM0gkYjHue+g8JQgOryxOCv4OXJ9f5EA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z9FAH-uiNmXDELM0gkYjHue+g8JQgOryxOCv4OXJ9f5EA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_054625_684465_90447F5D 
X-CRM114-Status: GOOD (  28.20  )
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
Content-Type: multipart/mixed; boundary="===============5583458202206989304=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5583458202206989304==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oZLvSg5CtS81Y1Gm"
Content-Disposition: inline


--oZLvSg5CtS81Y1Gm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2024 at 08:29:39AM -0400, Emil Renner Berthing wrote:
> Conor Dooley wrote:
> > There is no rohm,dh2228fv on any of supported JH7110 boards - in fact
> > the dh2228fv almost certainly does not exist as it is not a valid Rohm
> > part number. Likely a typo by Maxime when adding the device originally,
> > and should have been bh2228fv, but these boards do not have a bh2228fv
> > either! Remove it from jh7110-common.dtsi - pretending to have a device
> > so that the spidev driver will be bound by Linux is not acceptable.
>=20
> This patch is correct, but as you mention the fake device was most likely=
 added
> in order to use spidev from userspace with random devices added on the ex=
posed
> pins. In case someone actually makes use of this wouldn't this be a regre=
ssion?
> What is the right way to support this?

Unfortunately, there's no "right way" that's supported for for this
particular case. If people want to use spidev for their device, they
should either document it in the bindings, add the compatible to the
spidev driver and use an overlay to add the device to the dts or they
can r bind the spidev driver to the device from userspace.

The other thing, which doesn't exist yet, is a connector binding. The
folks are Beagle are currently working on creating a connector binding
for the Mikrobus connector - but that's rather far from complete at the
moment.

Cheers,
Conor.

> > Fixes: 74fb20c8f05d ("riscv: dts: starfive: Add spi node and pins confi=
guration")
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > CC: Emil Renner Berthing <kernel@esmil.dk>
> > CC: Conor Dooley <conor@kernel.org>
> > CC: Rob Herring <robh@kernel.org>
> > CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > CC: Paul Walmsley <paul.walmsley@sifive.com>
> > CC: Palmer Dabbelt <palmer@dabbelt.com>
> > CC: Albert Ou <aou@eecs.berkeley.edu>
> > CC: William Qiu <william.qiu@starfivetech.com>
> > CC: linux-riscv@lists.infradead.org
> > CC: devicetree@vger.kernel.org
> > CC: linux-kernel@vger.kernel.org
> > ---
> >  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 6 ------
> >  1 file changed, 6 deletions(-)
> >
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/ris=
cv/boot/dts/starfive/jh7110-common.dtsi
> > index 8ff6ea64f048..395436ec0f97 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > @@ -346,12 +346,6 @@ &spi0 {
> >  	pinctrl-names =3D "default";
> >  	pinctrl-0 =3D <&spi0_pins>;
> >  	status =3D "okay";
> > -
> > -	spi_dev0: spi@0 {
> > -		compatible =3D "rohm,dh2228fv";
> > -		reg =3D <0>;
> > -		spi-max-frequency =3D <10000000>;
> > -	};
> >  };
> >
> >  &sysgpio {
> > --
> > 2.43.2
> >

--oZLvSg5CtS81Y1Gm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZqOamgAKCRB4tDGHoIJi
0gFPAQDTaqVqm80i5t4bOVDsRiIvq4FlwJU27Ol3l7bXNjFl9QD+NFzwpkuQtaMR
7Td5Zj+cKPezLGcIubKy+fQhQ4oUcAc=
=33EL
-----END PGP SIGNATURE-----

--oZLvSg5CtS81Y1Gm--


--===============5583458202206989304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5583458202206989304==--

