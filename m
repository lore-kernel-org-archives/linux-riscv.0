Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66000C001B0
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 16:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2R2rK7sYaW2PBOP8ntLUsO99NOIvUsBg2qZftqVIVI=; b=yDYU2kwLBlipQf87iaHKIaTdrY
	q+GskzSof4OJWJuPxpqmKJJ1Gw6KimupUjrsqIf2+zJvp4WqFF3a2gHw7czrQj9wkgPxVeQhehKoS
	Jb66grWxna0rkLXz6IgB0AwhgIkaD4LYkQlbUpHjx9rSw/bMzP5fnwuqDa59P9lW/CUDlwRLp59T6
	soaYFFecP85TRaRS9Xcq0LBY8thSFXNn0HXjcNIBc7pqdsJwL6TK/M27VNhLJMP3Kf/lpKH70CpP8
	ME/YSZbY7vntY2oGSEuM8Q2HXBJB/vRCDEB5wkbhyDrfkuDgS28wOQDHuNSa5wcd6aqMirRwC+O0w
	ighWUSiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCjJS-0041j5-0T;
	Fri, 23 Jun 2023 16:07:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCjJP-0041iP-2Z;
	Fri, 23 Jun 2023 16:07:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EDCC261A71;
	Fri, 23 Jun 2023 16:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D333C433C8;
	Fri, 23 Jun 2023 16:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687536422;
	bh=PzZ3EmR9MICcwpoqTQk53g/RvLGwPzf3GIaDJYYrG/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=od/tS904+6jb8khi59PK5j771y6tflzReQ2ngFWZxeUWfzcSsPpGaHiBYmOKseW5/
	 r1fPB7hhaMzGXqsSyZ6bOvJMXsaN55xEKfFHyoVHNGAsBcfiBF+mTMFB8cNKo3KAd9
	 c+DD8xSIHYJglw9pqz8RKIp8+ZseIVKgBgZZruAJ5MwovkURFZYKPiW9g/c1G6Q4qX
	 fBEiS3tASRhmRQbHh3iP7lbIAuXh7JZyFvWlmkOMzQPwfviNMPSFvL6oYWu0aQByW3
	 moRZPAksI43uzoHzHBIkChKDE/gHqkbK2WVOAjN8eCj4e6eAHgwd3aXaDxh7xNr0Nb
	 47Xx5yvq3jamg==
Date: Fri, 23 Jun 2023 17:06:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Aleksandr Shubin <privatesub2@gmail.com>
Cc: linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/3] riscv: dts: allwinner: d1: Add pwm node
Message-ID: <20230623-budget-helpless-32f82537ab40@spud>
References: <20230623150012.1201552-1-privatesub2@gmail.com>
 <20230623150012.1201552-4-privatesub2@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230623150012.1201552-4-privatesub2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_090703_913851_2E169B67 
X-CRM114-Status: GOOD (  17.72  )
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
Content-Type: multipart/mixed; boundary="===============0830820581016522974=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0830820581016522974==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ac7UQ6ZCF2/3CB3I"
Content-Disposition: inline


--Ac7UQ6ZCF2/3CB3I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 23, 2023 at 06:00:01PM +0300, Aleksandr Shubin wrote:
> D1 and T113s contain a pwm controller with 8 channels.
> This controller is supported by the sun20i-pwm driver.
>=20
> Add a device tree node for it.
>=20
> Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
> ---
>  arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/ris=
cv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index 922e8e0e2c09..50f0f761527b 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -127,6 +127,18 @@ uart3_pb_pins: uart3-pb-pins {
>  			};
>  		};
> =20
> +		pwm: pwm@2000c00 {
> +			compatible =3D "allwinner,sun20i-d1-pwm";
> +			reg =3D <0x02000c00 0x400>;
> +			clocks =3D <&dcxo>,
> +				 <&ccu CLK_BUS_PWM>;
> +			clock-names =3D "hosc", "bus";
> +			resets =3D <&ccu RST_BUS_PWM>;

> +			allwinner,pwm-channels =3D <8>;

This fails dtbs_check. Please test the dts against the bindings.

Cheers,
Conor.

> +			status =3D "disabled";
> +			#pwm-cells =3D <0x3>;
> +		};
> +
>  		ccu: clock-controller@2001000 {
>  			compatible =3D "allwinner,sun20i-d1-ccu";
>  			reg =3D <0x2001000 0x1000>;
> --=20
> 2.25.1
>=20

--Ac7UQ6ZCF2/3CB3I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJXDIAAKCRB4tDGHoIJi
0ujpAQC9S1Qf2IoZ2/nZ+UM8pJ738bDHZNGyp2kiplAXDx5RkQEApyOUmbmCe+3t
jKF64KxbfxaQqYDdmqlocslEhgq9XQo=
=PG6i
-----END PGP SIGNATURE-----

--Ac7UQ6ZCF2/3CB3I--


--===============0830820581016522974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0830820581016522974==--

