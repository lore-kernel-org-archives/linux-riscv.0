Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F8ACFD313
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 13:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8KYXao9Z+/B/jUlFWxAPstx5/+EM2v3DvC/BDOP5g0c=; b=nR1aHCCtYecaw0DlJo9furgs+1
	osYz2tC90DffzHX8586sUvIK3nZ+Vo0+ET94V/UR2vd6iEqCze8OR+SrkrTUPWv6vjE+0xvSMvcfl
	TRm5qQHQf6w1HWp52Usc+RTpqc0m8zA4GYaE7n0iu1wSwl2e5fMyzSnOOC9Lrn4gMPabN3ZF0C98J
	iMSzavKvrLJEwqNUUKcwvhnHwBcl5OuV8l94aiGS3VLleWZOJRNTcpu4vzcRosJ1tl6lLJG4mFHIH
	0EqFPoqFzgmd/zhLpEHdFmmMWMWF8TvuVjEMtoxyoRksUfK/bAC3aK/gPb7aTW8au3bJR7V5/yp6t
	HlJB6jlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWVp-0000000Biu5-0KcH;
	Mon, 24 Nov 2025 13:21:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWVo-0000000Bitu-00p9
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 13:21:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B9E960167;
	Mon, 24 Nov 2025 13:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D60AC4CEF1;
	Mon, 24 Nov 2025 13:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763990506;
	bh=W6l8Kje8i5zEPsAYHczwdnoSnWf3b9Gi5NNtIeW2Goc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UrLnpJPhASQSKFOzKEYvjKXQ7286vNMvNeNOJqkUY1htn3gmMtfAUSd9+ekx+K6hJ
	 VlwSNf5YryrRtYHjK3n0EujL07ejtlDnhUMB7yNP+surHYIrzoYWb+A1SLNsOoQsS3
	 0hIFNiZld6ReERxtauQtzpSLy5yhNHddOEsMo2eufeo2HFKY1AWFGLnZxD88iRTBek
	 4Gj5FYjMe/dn3ftXXJ0MMejOp1EvR5fZ00txN/9qk/H6ZzqAdjd4j019PWdUtQQFku
	 5TAObJvYcyp+WuBxX6JsDc+IW+CykJKPLR4qFt9PW0RX/1cpVV9fJGezH5kgLYgnGL
	 sgHM6SsSifCKg==
Date: Mon, 24 Nov 2025 13:21:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: E Shattow <e@freeshell.de>, Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v3 2/2] riscv: dts: starfive: add Orange Pi RV
Message-ID: <20251124-emit-monument-380beaa6c394@spud>
References: <20251123225059.49665-1-e@freeshell.de>
 <20251123225059.49665-3-e@freeshell.de>
 <20251124-blaming-duplicity-fb1311864b3f@spud>
 <1f0885a31e8fd9f4cd667c05fef818c8a38203e7.camel@icenowy.me>
MIME-Version: 1.0
In-Reply-To: <1f0885a31e8fd9f4cd667c05fef818c8a38203e7.camel@icenowy.me>
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
Content-Type: multipart/mixed; boundary="===============0961650783844268659=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0961650783844268659==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="INXoaJd+izpLhJBa"
Content-Disposition: inline


--INXoaJd+izpLhJBa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 07:08:55PM +0800, Icenowy Zheng wrote:
> =E5=9C=A8 2025-11-24=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 11:07 +0000=EF=
=BC=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
> > On Sun, Nov 23, 2025 at 02:50:45PM -0800, E Shattow wrote:
> > > From: Icenowy Zheng <uwu@icenowy.me>
> > >=20
> > > Orange Pi RV is a SBC based on the StarFive VisionFive 2 board.
> > >=20
> > > Orange Pi RV features:
> > >=20
> > > - StarFive JH7110 SoC
> > > - GbE port connected to JH7110 GMAC0 via YT8531 PHY
> > > - 4x USB ports via VL805 PCIe USB controller connected to JH7110
> > > pcie0
> > > - M.2 M-key slot connected to JH7110 pcie1
> > > - HDMI video output
> > > - 3.5mm audio output
> > > - Ampak AP6256 SDIO Wi-Fi/Bluetooth module on mmc0
> > > - microSD slot on mmc1
> > > - SPI NOR flash memory
> > > - 24c02 EEPROM (read only by default)
> > >=20
> > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > Signed-off-by: E Shattow <e@freeshell.de>
> > > ---
> > > =C2=A0arch/riscv/boot/dts/starfive/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > > =C2=A0.../boot/dts/starfive/jh7110-orangepi-rv.dts=C2=A0 | 76
> > > +++++++++++++++++++
> > > =C2=A02 files changed, 77 insertions(+)
> > > =C2=A0create mode 100644 arch/riscv/boot/dts/starfive/jh7110-orangepi-
> > > rv.dts
> > >=20
> > > diff --git a/arch/riscv/boot/dts/starfive/Makefile
> > > b/arch/riscv/boot/dts/starfive/Makefile
> > > index 62b659f89ba7..d34c8c79bc10 100644
> > > --- a/arch/riscv/boot/dts/starfive/Makefile
> > > +++ b/arch/riscv/boot/dts/starfive/Makefile
> > > @@ -12,6 +12,7 @@ dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-
> > > deepcomputing-fml13v01.dtb
> > > =C2=A0dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-milkv-mars.dtb
> > > =C2=A0dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-milkv-marscm-emmc.dtb
> > > =C2=A0dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-milkv-marscm-lite.dtb
> > > +dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-orangepi-rv.dtb
> > > =C2=A0dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-pine64-star64.dtb
> > > =C2=A0dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-starfive-visionfive-2-
> > > v1.2a.dtb
> > > =C2=A0dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-starfive-visionfive-2-
> > > v1.3b.dtb
> > > diff --git a/arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dts
> > > b/arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dts
> > > new file mode 100644
> > > index 000000000000..16ec2767134e
> > > --- /dev/null
> > > +++ b/arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dts
> > > @@ -0,0 +1,76 @@
> > > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > > +/*
> > > + * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
> > > + */
> > > +
> > > +/dts-v1/;
> > > +#include "jh7110-common.dtsi"
> > > +
> > > +/ {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0model =3D "Xunlong Orange =
Pi RV";
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0compatible =3D "xunlong,or=
angepi-rv", "starfive,jh7110";
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* This regulator is alway=
s on by hardware */
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reg_vcc3v3_pcie: regulator=
-vcc3v3-pcie {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0compatible =3D "regulator-fixed";
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0regulator-name =3D "vcc3v3-pcie";
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0regulator-min-microvolt =3D <3300000>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0regulator-max-microvolt =3D <3300000>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0regulator-always-on;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0wifi_pwrseq: wifi-pwrseq {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0compatible =3D "mmc-pwrseq-simple";
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0reset-gpios =3D <&sysgpio 62 GPIO_ACTIVE_LOW>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> > > +};
> > > +
> > > +&gmac0 {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0assigned-clocks =3D <&aonc=
rg JH7110_AONCLK_GMAC0_TX>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0assigned-clock-parents =3D=
 <&aoncrg
> > > JH7110_AONCLK_GMAC0_RMII_RTX>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0starfive,tx-use-rgmii-clk;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =3D "okay";
> > > +};
> > > +
> > > +&mmc0 {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#address-cells =3D <1>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#size-cells =3D <0>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cap-sd-highspeed;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mmc-pwrseq =3D <&wifi_pwrs=
eq>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vmmc-supply =3D <&reg_vcc3=
v3_pcie>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vqmmc-supply =3D <&vcc_3v3=
>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =3D "okay";
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ap6256: wifi@1 {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0compatible =3D "brcm,bcm43456-fmac", "brcm,bcm4329-
> > > fmac";
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0reg =3D <1>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0/* TODO: out-of-band IRQ on GPIO21 */
> >=20
> > What's up with this TODO? Why's the gpio not here? Missing binding
> > support, missing driver support?
>=20
> Missing driver support in the pinctrl driver.

Provided Emil is okay with the patchset, I'll probably modify the
comment to mention what the todo depends on then.

>=20
> >=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> > > +};
> > > +
> > > +&mmc1 {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cd-gpios =3D <&sysgpio 41 =
GPIO_ACTIVE_HIGH>;
> > > +};
> > > +
> > > +&pcie0 {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =3D "okay";
> > > +};
> > > +
> > > +&pcie1 {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =3D "okay";
> > > +};
> > > +
> > > +&phy0 {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rx-internal-delay-ps =3D <=
1500>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tx-internal-delay-ps =3D <=
1500>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0motorcomm,rx-clk-drv-micro=
amp =3D <3970>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0motorcomm,rx-data-drv-micr=
oamp =3D <2910>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0motorcomm,tx-clk-adj-enabl=
ed;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0motorcomm,tx-clk-10-invert=
ed;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0motorcomm,tx-clk-100-inver=
ted;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0motorcomm,tx-clk-1000-inve=
rted;
> > > +};
> > > +
> > > +&pwmdac {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =3D "okay";
> > > +};
> > > --=20
> > > 2.50.0
> > >=20
>=20

--INXoaJd+izpLhJBa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSRb5gAKCRB4tDGHoIJi
0jGRAQChGlMWCguWeh8rzdjVrsKVjHDF2GBfijzf5r5GqagRhQEArYNDjwZlt6P0
XD6DbIbjl6HHnz4lFdbBkMrdhst9NwY=
=hyAG
-----END PGP SIGNATURE-----

--INXoaJd+izpLhJBa--


--===============0961650783844268659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0961650783844268659==--

