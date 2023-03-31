Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86D6C76196
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 18:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGsIDrwt4NX7hJPeLQ8BD3kjfSF22glAEiLNZj0wpQA=; b=Af4vaclyK2ANJeC0JpStUZnpxM
	oBL9t+AXYYiD+JPVc0QLmlQGg/Cd+c776YcNS2OUmAqvmdA5mZ0IXPkFvbfWT3SvfiWei4Vy4tkSb
	ywHlqXFtiQEj2nmPhGqS6zJ/9BbGIhoAcZPKvxygOpdmr2El9uB+JIMyuPTbQVopV5XLcSv1M/ypI
	XH01YPAk5WFs8hM0TCX3wQGdsCW1IuQxQrf3cjbxPxQbx3oEsKRN5hEWsh9atPSa16AQJrnHLtACN
	uoAsJF2vzMG20lzzekN8fCoYBhvZiruqbkbWYb+BzRRf4bK3aU5mZy6SCURpjHOV3aQKNNc8w3gAa
	0UNDzGcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piJek-008U4N-09;
	Fri, 31 Mar 2023 18:39:22 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piJef-008U2c-2c;
	Fri, 31 Mar 2023 18:39:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 80ECFB8319F;
	Fri, 31 Mar 2023 18:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3256CC433EF;
	Fri, 31 Mar 2023 18:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680287955;
	bh=eqEkQdcItulIBYfu63tsCeTblX411ylkWCoUY/V/uWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CBQ+Ry2iM7+5i9TV/gOsUHqOL/h49W1vS9TeUUVJ9gJtWjuI+vRd9yHkwrGpjrmn8
	 W0N4XstXsBEomURTXLS6AEwngiWkZ/UcMOeyRSJ+xVP50JxxJaZ6s9epZaJ8nfOtpJ
	 ad2Wylb7EtVa6kXpe2J1S8BsEf+IE/h8rUuDjl5BzMPUNMHniUO9Eo9RHwDioYBDVO
	 npuOA+mZBcWz7b69M/NXBfWIrPRgI51acgb/du9+JUEHKIY39+Ti90f0BQWXQwLHr4
	 cRfSjYpXTDnqehIiCcEolchbHALgutD+6rDaBTcYknnl3ZcL+0v99sBx+7CGb8+ctE
	 MXKlJ7dXbu63Q==
Date: Fri, 31 Mar 2023 19:39:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: linux-sunxi@lists.linux.dev, conor.dooley@microchip.com,
	Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Trevor Woerner <twoerner@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH] riscv: dts: nezha-d1: Add memory
Message-ID: <25837ca5-b709-4d20-912b-ab13e6353069@spud>
References: <20230331182727.4062790-1-evan@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230331182727.4062790-1-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_113918_135343_8EC5BF0C 
X-CRM114-Status: GOOD (  19.73  )
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
Content-Type: multipart/mixed; boundary="===============5460834243742931639=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5460834243742931639==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TnwQBgyZeUS8jdJs"
Content-Disposition: inline


--TnwQBgyZeUS8jdJs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 31, 2023 at 11:27:27AM -0700, Evan Green wrote:
> Add memory info for the D1 Nezha, which seems to be required for it to
> boot with the stock firmware. Note that this hardcodes 1GB, which is
> not technically correct as they also make models with different amounts
> of RAM.

> Is the firmware supposed to populate this?

Yup. Samuel intentionally did it this way:
https://lore.kernel.org/linux-riscv/8a2194bf-93bd-de4d-8d39-0cd72aabb0a9@sh=
olland.org/

Since I don't like using the firmware provided stuff to more easily
test I do this in my u-boot boot script:

tftp 0x54000000 d1-fitImage.fit
bootm start 0x54000000
bootm loados 0x54000000
bootm ramdisk;
bootm prep;
fdt memory 0x40000000 0x20000000
bootm go;

Hope either of the above are helpful,
Conor.

>=20
> Signed-off-by: Evan Green <evan@rivosinc.com>
>=20
> ---
>=20
>  arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts b/arch/ris=
cv/boot/dts/allwinner/sun20i-d1-nezha.dts
> index 4ed33c1e7c9c..6aba68cf5541 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
> @@ -32,6 +32,12 @@ / {
>  	model =3D "Allwinner D1 Nezha";
>  	compatible =3D "allwinner,d1-nezha", "allwinner,sun20i-d1";
> =20
> +	// FIXME: this is temporary.
> +	memory@40000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x40000000 0x40000000>; /* 1 GB */
> +	};
> +
>  	aliases {
>  		ethernet0 =3D &emac;
>  		ethernet1 =3D &xr829;
> --=20
> 2.25.1
>=20

--TnwQBgyZeUS8jdJs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCcozQAKCRB4tDGHoIJi
0htEAP0diQJ9Zbhuux3uzUrGT5BnDcXMtCUEsij5CLqMnsP97wD+MhvYerrIgPU2
VSRJF3YaWTBm0hqklFNbFU7LFRj0sg0=
=cDyc
-----END PGP SIGNATURE-----

--TnwQBgyZeUS8jdJs--


--===============5460834243742931639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5460834243742931639==--

