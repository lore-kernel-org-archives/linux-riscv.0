Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3EDC636CC
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 16:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TMwGtXtDXvb7yiSYgfgwK6wXP6Q7kxHK7W2EtvvEOcg=; b=Ig830OCzAEnOx5Ky2U7gwZtSHk
	VllRaE9r2EK5Yg7cyj6aa2QkaaW0u4q7vRVpLFoxKoxlw0UDmIoPC73FjrTMxHBOBoEK9RuANl/lI
	bxYk2K1BXbTvhn3Hg2LPAsNhbfALJWd07xapOdrqrmPpilubp3T+aBn4IfhHScVY42MjD2n6bDSH7
	t2HHO1tOaeE9WVw5P1pUjG1pC8Dw4uR9jkuR2AgiNdMEHaH6finH1xnc2QqoGf4NLZR3LBAOMStlz
	JFsOFOz05IpTnG/Q0dsyKQe/yqWIhFYWK0JgCpWvatQOtH3w5LIhxv4EgUKT9zxJ7sUbbSGxLthuv
	oR+IKEiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPnYL-00GJsz-QP; Wed, 08 Feb 2023 16:44:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPnXM-00GJNb-Rr; Wed, 08 Feb 2023 16:43:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 693CB6172B;
	Wed,  8 Feb 2023 16:43:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5950C433D2;
	Wed,  8 Feb 2023 16:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675874591;
	bh=9JnV3h9dVys98lzdeX7nLKiew6Xl3wZrBHZ3W+YcEV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cVf7PoPR0hfFREHoNOntlFKcTWcwIEawIPfSU4oA0o+namPfcpnELDHhsKGZ7+fCO
	 /908A6h77w8wfHs97Oh5qBsYnqOBSm1OTlIB+DyYkZTZd1eztbXcnAix+5cEFonI8M
	 9MblElIhNvZdsIly571mIkuVeE0AdDTVO5uKP1e4uo/gE0pmBD9ePYLYDD72QS8syD
	 6npy2WkXvy8MhU3l230C3zju6IJDPusKOF1qWRnw4zOfFlHsl1j7VW9A6SjjGUPoN2
	 GOpwrcRCY2Ctg6FNmo9x6h5U4Bh5EzCDiD+U7jzpuGEYQZmT2DL/hMF6/1JRBC2nFb
	 q6E3jf+uuWwuA==
Date: Wed, 8 Feb 2023 16:43:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Trevor Woerner <twoerner@gmail.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] riscv: dts: nezha-d1: add gpio-line-names
Message-ID: <Y+PRGjn8a26pe5Dy@spud>
References: <20230208014504.18899-1-twoerner@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230208014504.18899-1-twoerner@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_084313_015596_2A6EA48F 
X-CRM114-Status: GOOD (  17.77  )
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
Content-Type: multipart/mixed; boundary="===============3369554693952350164=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3369554693952350164==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="S4azWlTkoRx3v2FI"
Content-Disposition: inline


--S4azWlTkoRx3v2FI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Trevor,

On Tue, Feb 07, 2023 at 08:45:03PM -0500, Trevor Woerner wrote:
> Add descriptive names so users can associate specific lines with their
> respective pins on the 40-pin header according to the schematics found at:
>=20
> 	http://dl.linux-sunxi.org/D1/D1_Nezha_development_board_schematic_diagra=
m_20210224.pdf

Dunno about the sunxi folk, but ideally that'd be a Link: tag IMO.

>=20
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  .../boot/dts/allwinner/sun20i-d1-nezha.dts    | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts b/arch/ris=
cv/boot/dts/allwinner/sun20i-d1-nezha.dts
> index a0769185be97..33489c7619cb 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
> @@ -90,6 +90,15 @@ pcf8574a: gpio@38 {
>  		gpio-controller;
>  		#gpio-cells =3D <2>;
>  		#interrupt-cells =3D <2>;
> +		gpio-line-names =3D
> +			"pin13 [PP0,gpio8] ",
> +			"pin16 [PP1,gpio10]",
> +			"pin18 [PP2,gpio11]",
> +			"pin26 [PP3,gpio17]",
> +			"pin22 [PP4,gpio14]",
> +			"pin28 [PP5,gpio19]",
> +			"pin37 [PP6,gpio23]",
> +			"pin11 [PP7,gpio6] ";

dtbs_check does not like this:
arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dtb: gpio@38: 'gpio-line-name=
s' does not match any of the regexes: '^(.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9=
]+'
        From schema: Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml

>  	};
>  };
> =20
> @@ -164,3 +173,47 @@ &usbphy {
>  	usb1_vbus-supply =3D <&reg_vcc>;
>  	status =3D "okay";
>  };
> +
> +&pio {
> +	gpio-line-names =3D
> +		/* Port A */
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		/* Port B */
> +		"pin5  [PB0, gpio2/twi2-sck]",
> +		"pin3  [PB1, gpio1/twi2-sda]",
> +		"",
> +		"pin38 [PB3, gpio24/i2s2-din]",
> +		"pin40 [PB4, gpio25/i2s2-dout]",
> +		"pin12 [PB5, gpio7/i2s-clk]",
> +		"pin35 [PB6, gpio22/i2s2-lrck]",
> +		"",
> +		"pin8  [PB8, gpio4/uart0-txd]",
> +		"pin10 [PB9, gpio5/uart0-rxd]",
> +		"",
> +		"",
> +		"pin15 [PB12,gpio9]",

Why not pick a consistent styling w.r.t. the space between PB#, & gpio?

Cheers,
Conor.

> +		"", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		/* Port C */
> +		"",
> +		"pin31 [PC1, gpio21]",
> +		"", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		/* Port D */
> +		"", "", "", "", "", "", "", "",
> +		"", "",
> +		"pin24 [PD10,gpio16/spi1-ce0]",
> +		"pin23 [PD11,gpio15/spi1-clk]",
> +		"pin19 [PD12,gpio12/spi1-mosi]",
> +		"pin21 [PD13,gpio13/spi1-miso]",
> +		"pin27 [PD14,gpio18/spi1-hold]",
> +		"pin29 [PD15,gpio20/spi1-wp]",
> +		"", "", "", "", "", "",
> +		"pin7  [PD22,gpio3/pwm]";
> +};
> --=20
> 2.36.0.rc2.17.g4027e30c53
>=20

--S4azWlTkoRx3v2FI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+PRGgAKCRB4tDGHoIJi
0iRiAP4vgkyStKLRofn1o81fjP/aeDkslORttfK0szBbB8AwZgD7B96WjbtVAZkn
oXsPbP3B0H5zboAMRKCEfxhs0feWaQY=
=E3Jw
-----END PGP SIGNATURE-----

--S4azWlTkoRx3v2FI--


--===============3369554693952350164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3369554693952350164==--

