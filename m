Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD946CD98DA
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 16:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5vZvMTNoK0N8GqAK7cTfJT1z9bhqfxQtf0RKcLbKdQU=; b=PL0Ho3vhyvx6a7oRJU94sYC5mU
	NgRw+jk6nnwC5J/BMbt41Z5PpPqtBjGJPgdzXFgBkcynujK+UzfcXBVHimFkBcx8usJidvkExLbaV
	4v75Bbc97gSKrM0BWRCONXyRtQlmtvvRGYje5Xk8qTB8dQOiGPeK4UBHcfGl+6hFSdtLB0seTTXif
	C1ojn/eSlA+Gc6DzdFUlKsCQXD3NGzgSogZVB3uf9FhiYZak2Aw88iWIgqhP7TQU7qntSjYVPjxPB
	VkknMTQTYBigh44CZHe0mkUBGkIu+hxXyNnSDc8ex2sGgauF802YW3beojhRl18ZLM3LqAhzlvqCp
	60SBoIUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZA4L-0000000EZHJ-1UXN;
	Mon, 15 Jun 2026 16:21:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZA4K-0000000EZH3-1va8
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 16:21:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7CE78600AB;
	Mon, 15 Jun 2026 16:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA9B11F00A3A;
	Mon, 15 Jun 2026 16:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781540507;
	bh=KVQGn0OT9TN5mU4TSLj+eoo/72aHXUhKV8j0BCeT7bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jy+Ozi8Pcj9d7ElLFtaOP/dMljwKLHonFWLotwyx+wwU/gxWxXJJ91rM+yV1l6q12
	 srerybYO7mu2RGAtbJ9gzP4y+QGkQ3X7LjYYIQ3h2nGnQnlVyihOCM87QhVtjxRIyX
	 FWipXHW4NN5GJvninCinVxC0OFNMlw7mQXgPKKgCJAoXt6cd2oeXonz9XtuIXrkpxK
	 hJa4kCZX+i3fX3jriSCqx9qTD+ShyDwQzrncjySPBerK0022eNdk6viGA6ewhgJD6C
	 0xTa9g8tmwXBHrEOeL/bREvCVeTztiqP37JDqMdhaJGDKdWhj543V/JRzU7ztdM07U
	 xblxrT2jX8i8g==
Date: Mon, 15 Jun 2026 17:21:42 +0100
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
Subject: Re: [PATCH v19 1/3] dt-bindings: pwm: opencores: Update compatibles,
 examples and maintainers
Message-ID: <20260615-crescent-equation-d948fcc46cd1@spud>
References: <20260615155759.129210-1-hal.feng@starfivetech.com>
 <20260615155759.129210-2-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260615155759.129210-2-hal.feng@starfivetech.com>
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
Content-Type: multipart/mixed; boundary="===============0434046672786714537=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0434046672786714537==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H8PfMBgNawoYkmL4"
Content-Disposition: inline


--H8PfMBgNawoYkmL4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 11:57:57PM +0800, Hal Feng wrote:
> Remove the jh8100 compatible since the JH8100 SoC has been canceled and
> will not be released. Add the jhb100 compatible to replace it.

> Use a oneOf construct to support the single-string opencores,pwm-v1
> compatible.

No thanks. Simple as this IP might be, I still want soc-specific
compatibles to be a requirement.
pw-bot: changes-requested

Thanks,
Conor.

>=20
> Change the register size in examples to 0x10, since an OpenCores PTC IP
> has only 4 32-bit registers: CNTR, HRC, LRC and CTRL.
>=20
> I will maintain this pwm module in place of William.
>=20
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../devicetree/bindings/pwm/opencores,pwm.yaml   | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml b/D=
ocumentation/devicetree/bindings/pwm/opencores,pwm.yaml
> index 52a59d245cdb..5f05606a2d3d 100644
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
> @@ -19,12 +19,14 @@ allOf:
> =20
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - starfive,jh7100-pwm
> -          - starfive,jh7110-pwm
> -          - starfive,jh8100-pwm
> +    oneOf:
>        - const: opencores,pwm-v1
> +      - items:
> +        - enum:
> +            - starfive,jh7100-pwm
> +            - starfive,jh7110-pwm
> +            - starfive,jhb100-pwm
> +        - const: opencores,pwm-v1
> =20
>    reg:
>      maxItems: 1
> @@ -49,7 +51,7 @@ examples:
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

--H8PfMBgNawoYkmL4
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajAmkwAKCRB4tDGHoIJi
0sH2AQCoyaF1bRjxjw2x0+m09ZjoTIXK1KvTYBZNxYnjdxzABQD/Xh/8foQ3B44U
/lzPJaQXkyivFCdzq9zNipew1n9JpQI=
=+lHT
-----END PGP SIGNATURE-----

--H8PfMBgNawoYkmL4--


--===============0434046672786714537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0434046672786714537==--

