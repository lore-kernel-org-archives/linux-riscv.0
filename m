Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24490C43458
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 16:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8tU59sFeqlOH/AmEUciI94xpicFjHe6gmyAQRWANH4=; b=qhxEubF3TkfpPugWStnmUMHkps
	F+W7anZ72jvnC9dgoyfH5UrjF84rWhP8Lta/NLoyYeILcdYHflv0e8owG8wPQq7LID25/RPjNJIAs
	MsPyGRz3ytrS92cDqBwz+lkL+u6L9IiAGu3LP+4AXMCarDU46TjHEcsndUwulKwbAmOuZ4BGtAgnc
	wSbE373lwx2atfSh/Fs1daELuy2KdJ29tTzhO/16X6XEuGjw47V2K9Fep83HP1qnzlqswjtuNia2C
	x1BD1pBpf/FBjDWSQWiFnxeuZYUGZlVb0QfcZ9cI0OwKKSEDjf6CVjvsmK+XYaBEDCh3VvdQnmyHe
	RzWtCtOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd90n-0000000BaWV-0i6Q;
	Fri, 26 Jun 2026 16:02:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd90l-0000000BaW3-1WFf
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 16:02:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D3FF443586;
	Fri, 26 Jun 2026 16:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77EA31F000E9;
	Fri, 26 Jun 2026 16:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782489754;
	bh=vVEw2sl8gMVjpzvRHncA37eTT6r1qHRpLwlA10sxlEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nyaF8Y5EEbTAQXj1vDLlM1u9IPlK0Vd1bPN4lTDRdXgTFB3G+GBrRkSD3LCE6gi5A
	 nAHboPBaABiQ8FGGAh0NaIXAM+K4lyfTUbAokdnh3Pyh9MruXT+vq2i0r89k0+Okf7
	 TL5TLCS6u5mar/tbEejMCU3nqt60/tzMsVzfF1uyUMpF1SPZ899EZrLTAXz9YD5cVD
	 vEJCoyzRh/PXGl/tMh4rhwL/Pyi6jqGHiCcw0CxcY+g1Kd0gQo+njgk1oq3y/e4/Pj
	 ML5G8Z6VcGezP1h7JkXUw0/i2b+bXzR34tJRY3um0CJ5Un7A3ayYhGJbA/W8R1481o
	 fbw+vDWSoiZFw==
Date: Fri, 26 Jun 2026 17:02:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Yulin Lu <luyulin@eswincomputing.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: Re: Re: Re: [PATCH 3/7] riscv: dts: eswin: eic7700: add pinctrl
 support
Message-ID: <20260626-spring-moocher-7db000f7bcc6@spud>
References: <20260615122016.1110206-1-pinkesh.vaghela@einfochips.com>
 <20260615122016.1110206-4-pinkesh.vaghela@einfochips.com>
 <20260615-that-scarf-e048ef152676@spud>
 <55962658.7bea.19f02850fe2.Coremail.luyulin@eswincomputing.com>
 <20260626-headway-rewind-93c9239bd865@wendy>
 <5d44c6d7.7c1d.19f03184fa9.Coremail.luyulin@eswincomputing.com>
MIME-Version: 1.0
In-Reply-To: <5d44c6d7.7c1d.19f03184fa9.Coremail.luyulin@eswincomputing.com>
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
Content-Type: multipart/mixed; boundary="===============1827817550345246049=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1827817550345246049==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f2s54VQulkVvHusi"
Content-Disposition: inline


--f2s54VQulkVvHusi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 04:42:32PM +0800, Yulin Lu wrote:
> > > Hi, Conor. Thanks for your review.
> > >=20
> > > > On Mon, Jun 15, 2026 at 05:50:12PM +0530, Pinkesh Vaghela wrote:
> > > > > From: Yulin Lu <luyulin@eswincomputing.com>
> > > > >=20
> > > > > Add pinctrl node and related pin configuration for EIC7700 SoC
> > > > >=20
> > > > > Co-developed-by: Pritesh Patel <pritesh.patel@einfochips.com>
> > > > > Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> > > > > Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
> > > > > Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> > > > > ---
> > > > >  .../dts/eswin/eic7700-hifive-premier-p550.dts | 109 +++
> > > > >  .../riscv/boot/dts/eswin/eic7700-pinctrl.dtsi | 888 ++++++++++++=
++++++
> > > > >  arch/riscv/boot/dts/eswin/eic7700.dtsi        |   5 +
> > > > >  3 files changed, 1002 insertions(+)
> > > > >  create mode 100644 arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi
> > > > >=20
> > > > > diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p55=
0.dts b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> > > > > index 1fb92f0e7c55..e7bb96e14958 100644
> > > > > --- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> > > > > +++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> > > > > @@ -6,6 +6,7 @@
> > > > >  /dts-v1/;
> > > > > =20
> > > > >  #include "eic7700.dtsi"
> > > > > +#include "eic7700-pinctrl.dtsi"
> > > > > =20
> > >=20
> > > ...
> > >=20
> > > > > +&gpio79_pins {
> > > > > +	bias-disable;
> > > > > +	input-disable;
> > > > > +};
> > > > > +
> > > > > +&gpio80_pins {
> > > > > +	bias-pull-up;
> > > > > +	input-disable;
> > > > > +};
> > > > > +
> > > > > +&gpio82_pins {
> > > > > +	bias-pull-up;
> > > > > +	input-disable;
> > > > > +};
> > > > > +
> > > > > +&gpio84_pins {
> > > > > +	bias-disable;
> > > > > +	input-disable;
> > > > > +};
> > > > > +
> > > > > +&gpio85_pins {
> > > > > +	bias-pull-up;
> > > > > +	input-disable;
> > > > > +};
> > > > > +
> > > > > +&gpio94_pins {
> > > > > +	bias-disable;
> > > > > +	input-disable;
> > > > > +};
> > > > > +
> > > > > +&gpio106_pins {
> > > > > +	bias-disable;
> > > > > +	input-disable;
> > > > > +};
> > > > > +
> > > > > +&gpio111_pins {
> > > > > +	bias-disable;
> > > > > +	input-disable;
> > > > > +};
> > > > > +
> > > > > +&pinctrl {
> > > > > +	vrgmii-supply =3D <&vcc_1v8>;
> > > > > +};
> > > > > +
> > > > >  &uart0 {
> > > > >  	status =3D "okay";
> > > > >  };
> > > > > diff --git a/arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi b/arc=
h/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi
> > > > > new file mode 100644
> > > > > index 000000000000..7293df146aa7
> > > > > --- /dev/null
> > > > > +++ b/arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi
> > > > > @@ -0,0 +1,888 @@
> > > > > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > > > > +/*
> > > > > + * Copyright (c) 2025 Beijing ESWIN Computing Technology Co., Lt=
d.
> > > > > + *
> > > > > + * ESWIN's EIC7700 SoC pin-mux and pin-config options are listed=
 as
> > > > > + * device tree nodes in this file.
> > > > > + *
> > > > > + * Authors: Yulin Lu <luyulin@eswincomputing.com>
> > > > > + */
> > > > > +
> > > >=20
> > > > I don't really understand the groups here. I think you should make =
more
> > > > effort to put more pins in each group.
> > > >=20
> > > > > +		gpio1_pins: gpio1-pins {
> > > > > +			pins =3D "jtag0_tck";
> > > > > +			function =3D "gpio";
> > > > > +		};
> > > > > +
> > > > > +		gpio2_pins: gpio2-pins {
> > > > > +			pins =3D "jtag0_tms";
> > > > > +			function =3D "gpio";
> > > > > +		};
> > > > > +
> > > > > +		gpio3_pins: gpio3-pins {
> > > > > +			pins =3D "jtag0_tdi";
> > > > > +			function =3D "gpio";
> > > > > +		};
> > > > > +
> > > > > +		gpio4_pins: gpio4-pins {
> > > > > +			pins =3D "jtag0_tdo";
> > > > > +			function =3D "gpio";
> > > > > +		};
> > > >=20
> > > > Like these 4 for example, why not group these?
> > >=20
> > > The 'group' is used to correspond to the '-grp' tag in the YAML file =
and
> > > has no practical significance.
> > > Different board designs have different requirements for pin multiplex=
ing.
> > > Therefore, eic7700-pinctrl.dtsi only provides pins for the board-leve=
l DTS.
> > > Pins are combined and used in the board-level DTS via pinctrl-0 prope=
rty.
> >=20
> > These 4 pins in the driver are represented as:
> > 	EIC7700_PIN(14,  "jtag0_tck",		[0] =3D F_JTAG, [1] =3D F_SPI, [2] =3D =
F_GPIO),
> > 	EIC7700_PIN(15,  "jtag0_tms",		[0] =3D F_JTAG, [1] =3D F_SPI, [2] =3D =
F_GPIO),
> > 	EIC7700_PIN(16,  "jtag0_tdi",		[0] =3D F_JTAG, [1] =3D F_SPI, [2] =3D =
F_GPIO),
> > 	EIC7700_PIN(17,  "jtag0_tdo",		[0] =3D F_JTAG, [1] =3D F_SPI, [2] =3D =
F_GPIO),
> >=20
> > 	EIC7700_PIN(18,  "gpio5",		[0] =3D F_GPIO, [1] =3D F_SPI),
> >=20
> > There is no reason to ever partially use these as GPIO. Either they will
> > be all jtag, all spi or all gpio. pin 18 on the other than makes sense =
to have
> > in a dedicated group.
>=20
> Hi, Conor. Thanks for your reply.
>=20
> For pins 14 to 18, when they are not multiplexed as JTAG or SPI,
> they can be used as GPIO. The corresponding -pins combinations
> for JTAG, SPI, and GPIO are all implemented in eic7700-pinctrl.dtsi.
>=20
> Take pin 14 as an example. In eic7700-pinctrl.dtsi, it is defined:
>=20
> dual_spi2_pins: dual-spi2-pins {
> =A0 =A0 pins =3D "spi2_cs0_n", "jtag0_tck", "jtag0_tms", "jtag0_tdi";
> =A0 =A0 function =3D "spi";
> };
>=20
> quad_spi2_pins: quad-spi2-pins {
> =A0 =A0 pins =3D "spi2_cs0_n", "spi2_cs1_n", "jtag0_tck", "jtag0_tms",
> =A0 =A0 =A0 =A0 =A0 =A0"jtag0_tdi", "jtag0_tdo", "gpio5";
> =A0 =A0 function =3D "spi";
> };
>=20
> gpio1_pins: gpio1-pins {
> =A0 =A0 pins =3D "jtag0_tck";
> =A0 =A0 function =3D "gpio";
> };
>=20
> jtag0_pins: jtag0-pins {
> =A0 =A0 pins =3D "jtag0_tck", "jtag0_tms", "jtag0_tdi", "jtag0_tdo";
> =A0 =A0 function =3D "jtag";
> };
>=20
> Which specific combination is called, and how they are combined,
> depends on the board-level system design and is referenced in
> the device nodes of the board-level DTS. For example:
>=20
> pinctrl-0 =3D <&gpio1_pins>, <&jtag2_pins>;
>=20
> The pin multiplexing configuration depends on the board-level system desi=
gn.
> Using combinations of '-pins' is sufficient to satisfy all requirements,
> and there is no need to rely on '-grp' for this purpose.

What has -grp got to do with this?
All I am asking for is for you to do
gpio_jtag_pins: gpio-jtag-pins {
	pins =3D "jtag0_tck", "jtag0_tms", "jtag0_tdi", "jtag0_tdo";
	function =3D "gpio";
};

and wherever else you can make similar simplifications.

--f2s54VQulkVvHusi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj6ilQAKCRB4tDGHoIJi
0m8PAQDDTMRuVQsG4WB9tZS/fPDOLMkA/0dcLGPvM3Xuuxw9DgD+PNyJrdxd7eDK
7bOUfK6D7BA2mvfKcxplGZIdYPpdCAo=
=ssbL
-----END PGP SIGNATURE-----

--f2s54VQulkVvHusi--


--===============1827817550345246049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1827817550345246049==--

