Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FCAC43458
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 15:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+5NqdX4ZFiYPgAHJe3dX7RrsluE3VsrKOWRStZZKBo=; b=saIPRD+1cylWUiv2Ymf37D8dBX
	KjxtpLKYqunnJH0pC0+rK5Z//tdENoAiUXvwRwomPsA8FBcAVDJxm01QoCnR7qHpqLX3wbxZ1tMkH
	X2AJnWBK8YZm/7OCMcxTW4jHn2oxGUeoO18P5Th6CgExEGkaZ4gylCjW5UdaB2cZzzlkVgSECZz0+
	3jy+khXYtNM6iOZjB1UMob5wobkKfeszVJfMF4tR2cbAQ6imqOxmhRgfuC+S9uYxv5+NZMZB/2Z5y
	JojF/7duGnTA2WgfSvI9Ov5ulc3fEhjG0h1UzfAtmSU9rxnPonTYsJDyHGtxofIygiig8ZTzoWOI/
	6AGrQRrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDT4-0000000Ezbh-3HDh;
	Mon, 29 Jun 2026 15:00:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDT2-0000000EzXT-26Ex
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 15:00:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D1C22601AC;
	Mon, 29 Jun 2026 15:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C2A41F00A3D;
	Mon, 29 Jun 2026 15:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782745211;
	bh=6p+eFWjhiLtnMGQUwrrOgD9HfsGzvqqndl5QcxUEoMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ciEIFrPxV5GFw/mxRKCJ8o7cbPyOYju8nHTVlWnZH5WrLq7HaO4lwEcB5aRWIKXxu
	 zoWLdZqk8zgXP3M4epuidlust3SuoXhBgbJEtdaE+v/ijVgobpAcGJqDk6npfuVH8f
	 GpOf3dHVI0gabIBpuMIi2BMPgFhf6MT2i6wyXDajOcPakqNEzLIQPci1DVRCieV7C3
	 LHGUiNYuksaUS86Ofsr3381ZvYpm8rERzIWeJZ+U332hJuMd/Y35pnpNj36+J/es3+
	 /kHTppYU16NyiCzMs5EmTTTcXT1oh4lUNUBl+AfhCS2swORKEpg3caoGkfsrDE0Yjw
	 Itp2Xyh4d/1Tg==
Date: Mon, 29 Jun 2026 16:00:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 1/3] dt-bindings: pwm: opencores: Update compatibles,
 examples and maintainers
Message-ID: <20260629-unedited-tarmac-b6eaaaced8fc@spud>
References: <20260629063601.63917-1-hal.feng@starfivetech.com>
 <20260629063601.63917-2-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260629063601.63917-2-hal.feng@starfivetech.com>
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
Content-Type: multipart/mixed; boundary="===============3874213524901810514=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3874213524901810514==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oTxfEJL/1/eWeBeU"
Content-Disposition: inline

--oTxfEJL/1/eWeBeU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 02:35:59PM +0800, Hal Feng wrote:
> Remove the jh8100 compatible since the JH8100 SoC has been canceled and
> will not be released. Add the jhb100 compatible to replace it.
>=20
> Change the register size in examples to 0x10, since an OpenCores PTC IP
> has only 4 32-bit registers: CNTR, HRC, LRC and CTRL.

Actually, please also add a fixes tag to the original commit adding the
binding.

Cheers,
Conor.

>=20
> I will maintain this pwm module in place of William.
>=20
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  Documentation/devicetree/bindings/pwm/opencores,pwm.yaml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml b/D=
ocumentation/devicetree/bindings/pwm/opencores,pwm.yaml
> index 52a59d245cdb..42c5d2b6326d 100644
> --- a/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: OpenCores PWM controller
> =20
>  maintainers:
> -  - William Qiu <william.qiu@starfivetech.com>
> +  - Hal Feng <hal.feng@starfivetech.com>
> =20
>  description:
>    The OpenCores PTC ip core contains a PWM controller. When operating in=
 PWM
> @@ -23,7 +23,7 @@ properties:
>        - enum:
>            - starfive,jh7100-pwm
>            - starfive,jh7110-pwm
> -          - starfive,jh8100-pwm
> +          - starfive,jhb100-pwm
>        - const: opencores,pwm-v1
> =20
>    reg:
> @@ -49,7 +49,7 @@ examples:
>    - |
>      pwm@12490000 {
>          compatible =3D "starfive,jh7110-pwm", "opencores,pwm-v1";
> -        reg =3D <0x12490000 0x10000>;
> +        reg =3D <0x12490000 0x10>;
>          clocks =3D <&clkgen 181>;
>          resets =3D <&rstgen 109>;
>          #pwm-cells =3D <3>;
> --=20
> 2.43.2
>=20

--oTxfEJL/1/eWeBeU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakKIdwAKCRB4tDGHoIJi
0gigAP9N5K8X2TSAkyzyTu+kpvOQHJEoarApLQm4rhdCmzeGjgEApQzOHlW7QO2Z
ZY/1qEFPIOPiY9c5zrVEYt+Azbp6OgY=
=mcXf
-----END PGP SIGNATURE-----

--oTxfEJL/1/eWeBeU--


--===============3874213524901810514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3874213524901810514==--

