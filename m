Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A81CFD313
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 11:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cHQz2+7zXBRjBsO7aUdxajc0JwGXiIFbrqDPZtDvJnE=; b=CDrjltyPix9rpSqS2nqgHj6wnl
	f98pqaAmY71G2YL65pR/bAy44LYVRrYCY7+AB/VJqq2VmSo+WzVcxGmy3bYkoTkYXA+oFPgwxhxDi
	5fBabjmox7rXcfUX0qChl7gxHc9J2Ka9MbwI2wi/nouAhpY8jHti+JUSLKBdbZVJECU+sFCHAdSZU
	ZK8/kOv4pmK5BDmnK21MEbVfNG4NKJh09mxOPcsnUlML1up/gVTn2OEo0F6cG9JQ5SZ4woGSgcS5+
	N9qrJEmAjZI96MZnBRrExzbNM74neyBTHpdB5FLyEc25o5tEhJmH5q6eoL7c/VExd193oUV97umTi
	xh3CTvuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUQ6-0000000BVd2-2YAl;
	Mon, 24 Nov 2025 11:07:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUQ0-0000000BVVJ-3vZt
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 11:07:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1610243F96;
	Mon, 24 Nov 2025 11:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 783F1C116D0;
	Mon, 24 Nov 2025 11:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763982460;
	bh=sbCml/7nmSaH6gPaF7Ndj2Z9wRXVc41vQ2zcx6IMeo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wi5I/apXii6KdXWyWS4fZPIO+lGmfTJPUADNIqyL/Exe7vmHtZ6eRgdzx+8T/lW2g
	 +TGL+FOrsDvvrYHCPtd86tTkQpFZbETBaNo1aatenV2kg14ZEvJrsXEFMRmmt3XIJT
	 YMhPLCHOkpF2V4TldSrHDPgFXYF9MJVHBWLtMmJwGnj7jHbXYc6RSCYXZZSpt/n7My
	 LlI/EWqSOqRbrO44cmC6gXNjwxxDz4nAR6zeg5eCJ8v9YxMx7ilThBogtDdwj9wu6g
	 jggAGDxutbpoLE343DLYP5TejsIx+4xMuCP71eP5FLkCNMXn9dw25nSGmTChbzr5l5
	 +f4gFdPP0Ubig==
Date: Mon, 24 Nov 2025 11:07:35 +0000
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Subject: Re: [PATCH v3 2/2] riscv: dts: starfive: add Orange Pi RV
Message-ID: <20251124-blaming-duplicity-fb1311864b3f@spud>
References: <20251123225059.49665-1-e@freeshell.de>
 <20251123225059.49665-3-e@freeshell.de>
MIME-Version: 1.0
In-Reply-To: <20251123225059.49665-3-e@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_030741_070286_E19192D7 
X-CRM114-Status: GOOD (  18.63  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berthing <kernel@esmil.dk>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: multipart/mixed; boundary="===============1410950933553634515=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1410950933553634515==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AcVI3kJ2wz21qqy0"
Content-Disposition: inline


--AcVI3kJ2wz21qqy0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 23, 2025 at 02:50:45PM -0800, E Shattow wrote:
> From: Icenowy Zheng <uwu@icenowy.me>
>=20
> Orange Pi RV is a SBC based on the StarFive VisionFive 2 board.
>=20
> Orange Pi RV features:
>=20
> - StarFive JH7110 SoC
> - GbE port connected to JH7110 GMAC0 via YT8531 PHY
> - 4x USB ports via VL805 PCIe USB controller connected to JH7110 pcie0
> - M.2 M-key slot connected to JH7110 pcie1
> - HDMI video output
> - 3.5mm audio output
> - Ampak AP6256 SDIO Wi-Fi/Bluetooth module on mmc0
> - microSD slot on mmc1
> - SPI NOR flash memory
> - 24c02 EEPROM (read only by default)
>=20
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: E Shattow <e@freeshell.de>
> ---
>  arch/riscv/boot/dts/starfive/Makefile         |  1 +
>  .../boot/dts/starfive/jh7110-orangepi-rv.dts  | 76 +++++++++++++++++++
>  2 files changed, 77 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dts
>=20
> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/=
starfive/Makefile
> index 62b659f89ba7..d34c8c79bc10 100644
> --- a/arch/riscv/boot/dts/starfive/Makefile
> +++ b/arch/riscv/boot/dts/starfive/Makefile
> @@ -12,6 +12,7 @@ dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-deepcomputing-f=
ml13v01.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-milkv-mars.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-milkv-marscm-emmc.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-milkv-marscm-lite.dtb
> +dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-orangepi-rv.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-pine64-star64.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-starfive-visionfive-2-v1.2a.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-starfive-visionfive-2-v1.3b.dtb
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dts b/arch/r=
iscv/boot/dts/starfive/jh7110-orangepi-rv.dts
> new file mode 100644
> index 000000000000..16ec2767134e
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dts
> @@ -0,0 +1,76 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
> + */
> +
> +/dts-v1/;
> +#include "jh7110-common.dtsi"
> +
> +/ {
> +	model =3D "Xunlong Orange Pi RV";
> +	compatible =3D "xunlong,orangepi-rv", "starfive,jh7110";
> +
> +	/* This regulator is always on by hardware */
> +	reg_vcc3v3_pcie: regulator-vcc3v3-pcie {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc3v3-pcie";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	wifi_pwrseq: wifi-pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		reset-gpios =3D <&sysgpio 62 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&gmac0 {
> +	assigned-clocks =3D <&aoncrg JH7110_AONCLK_GMAC0_TX>;
> +	assigned-clock-parents =3D <&aoncrg JH7110_AONCLK_GMAC0_RMII_RTX>;
> +	starfive,tx-use-rgmii-clk;
> +	status =3D "okay";
> +};
> +
> +&mmc0 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	cap-sd-highspeed;
> +	mmc-pwrseq =3D <&wifi_pwrseq>;
> +	vmmc-supply =3D <&reg_vcc3v3_pcie>;
> +	vqmmc-supply =3D <&vcc_3v3>;
> +	status =3D "okay";
> +
> +	ap6256: wifi@1 {
> +		compatible =3D "brcm,bcm43456-fmac", "brcm,bcm4329-fmac";
> +		reg =3D <1>;
> +		/* TODO: out-of-band IRQ on GPIO21 */

What's up with this TODO? Why's the gpio not here? Missing binding
support, missing driver support?

> +	};
> +};
> +
> +&mmc1 {
> +	cd-gpios =3D <&sysgpio 41 GPIO_ACTIVE_HIGH>;
> +};
> +
> +&pcie0 {
> +	status =3D "okay";
> +};
> +
> +&pcie1 {
> +	status =3D "okay";
> +};
> +
> +&phy0 {
> +	rx-internal-delay-ps =3D <1500>;
> +	tx-internal-delay-ps =3D <1500>;
> +	motorcomm,rx-clk-drv-microamp =3D <3970>;
> +	motorcomm,rx-data-drv-microamp =3D <2910>;
> +	motorcomm,tx-clk-adj-enabled;
> +	motorcomm,tx-clk-10-inverted;
> +	motorcomm,tx-clk-100-inverted;
> +	motorcomm,tx-clk-1000-inverted;
> +};
> +
> +&pwmdac {
> +	status =3D "okay";
> +};
> --=20
> 2.50.0
>=20

--AcVI3kJ2wz21qqy0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSQ8dwAKCRB4tDGHoIJi
0gKUAQCHaNEzOZ4qPXve3F2aeeKYpr5+2ZMIrhOuqdqsunZydQD9HJ0x2Rvd/w8u
spF+ZiVUHgtIjbLiGLjxeUxS6sSKFAE=
=I8Fj
-----END PGP SIGNATURE-----

--AcVI3kJ2wz21qqy0--


--===============1410950933553634515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1410950933553634515==--

