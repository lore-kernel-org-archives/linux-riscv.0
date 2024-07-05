Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E380BC30658
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 15:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vg4nrk/fbvP2qRKCjkLZwqInACkXTsThHOiuX2JfEaA=; b=zydgJcrZWDYGOAIF81xZLhbZMA
	nEvxvcgsPLYXZRlorFZEDRn3BMbaN/Mlg5tBN5DMJrCuIyLJ5zREBW3kkRiYT205WF0pOiq0Xu27J
	C5CFg6A7NSJJhx7HGGlmdt1nTis1f4T2J/KfdVWCT+ogY1R5OWYgHytE2+ADQUnHYHJTnFdN9xhLI
	OIs7ITHYlmiiB+HRC1HlJleC4mB44RW3Mkhifk/e1+E5magTqo8p0GqOzFFy07QuBryjaH4avGN5b
	XBu1QU+GXyfOPJ5ZWBG+PdJQsEMetjZ/IZqGC5YUHYtHjU7VK+2dU2xpa/3XQOVnofh81S0AujV9K
	a/fP5aNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPkRE-0000000GG5P-1Woj;
	Fri, 05 Jul 2024 15:01:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPkRA-0000000GG4o-2Z94
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jul 2024 15:01:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF67462807;
	Fri,  5 Jul 2024 15:01:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630D1C116B1;
	Fri,  5 Jul 2024 15:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720191682;
	bh=xEoppWy0KqDVp9QxcL7rzFgPsmzQXswT2gXTdcrZA/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IJcdLZ6tECRRBILi98BHYGvO9qjylZnL2oVf7RRyX4bk8aaaktei/fm5RbUE4ZvUR
	 DZix8dkn/ovADFeS3oVmNF+p7GficsV4yPuzp3tgM0gDZMo5bBfslDMG+V9dyXmYkW
	 xctYTsj7Mey6zvp0vqSxxtC/DMaRXiGZhIfAsi97x9bl71zJc+qmajUCymzGlz+IXP
	 oAxCubPSbxQzejO28pRdoxoXLhw4WlT1A6gl5sdcG+YFWcyTVT7hCSc9pGq8kVx0cy
	 3O1aXk1WBrOyagNWE+kU/pQmIuVWI37gi7xWQjRlIJlM3/v5tyQa6TPfNPaKGz8+Y1
	 it5ieQhVJoFmg==
Date: Fri, 5 Jul 2024 16:01:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: iio: adc: sophgo,cv18xx-saradc.yaml:
 Add Sophgo SARADC binding documentation
Message-ID: <20240705-unaired-pesticide-4135eaa04212@spud>
References: <20240705-sg2002-adc-v2-0-83428c20a9b2@bootlin.com>
 <20240705-sg2002-adc-v2-1-83428c20a9b2@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20240705-sg2002-adc-v2-1-83428c20a9b2@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_080124_918854_ABA903FB 
X-CRM114-Status: GOOD (  20.32  )
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
Content-Type: multipart/mixed; boundary="===============5898050033719051649=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5898050033719051649==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xMmRnVLDUviAWcqC"
Content-Disposition: inline


--xMmRnVLDUviAWcqC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 05, 2024 at 03:42:23PM +0200, Thomas Bonnefille wrote:
> The Sophgo SARADC is a Successive Approximation ADC that can be found in
> the Sophgo SoC.
>=20
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
>  .../bindings/iio/adc/sophgo,cv18xx-saradc.yaml     | 63 ++++++++++++++++=
++++++
>  1 file changed, 63 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-sara=
dc.yaml b/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.ya=
ml
> new file mode 100644
> index 000000000000..31bd8ac6dfa5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/sophgo,cv18xx-saradc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title:
> +  Sophgo CV18XX SoC series 3 channels Successive Approximation Analog to
> +  Digital Converters
> +
> +maintainers:
> +  - Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> +
> +description:
> +  Datasheet at https://github.com/sophgo/sophgo-doc/releases
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - sophgo,cv1800b-saradc
> +          - const: sophgo,cv18xx-saradc

I don't think the fallback here makes sense. If there's other devices
with a compatible programming model added later, we can fall back to the
cv1800b.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    description:
> +      SARADC will use the presence of this clock to determine if the con=
troller
> +      needs to be explicitly clocked by it (Active domain) or if it is p=
art of
> +      the No-Die Domain, along with the RTC, which does not require expl=
icit
> +      clocking.

What does "explicit clocking" mean? Is it clocked directly (or via
dividers) by a clock on the board or another source?

Cheers,
Conor.

> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/sophgo,cv1800.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    /* ADC in the Active domain */
> +    adc@30f0000 {
> +        compatible =3D "sophgo,cv1800b-saradc", "sophgo,cv18xx-saradc";
> +        clocks =3D <&clk CLK_SARADC>;
> +        interrupts =3D <100 IRQ_TYPE_LEVEL_HIGH>;
> +        reg =3D <0x030F0000 0x1000>;
> +    };
> +  - |
> +    #include <dt-bindings/clock/sophgo,cv1800.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    /* ADC in the No-Die domain */
> +    adc@502c000 {
> +        compatible =3D "sophgo,cv1800b-saradc", "sophgo,cv18xx-saradc";
> +        reg =3D <0x0502C000 0x1000>;
> +    };
>=20
> --=20
> 2.45.2
>=20

--xMmRnVLDUviAWcqC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZogKvQAKCRB4tDGHoIJi
0giYAQCgNHCyz5yAdPei9eufgsMfJqNkiZDfQ8RrCap1Y6BZqwD/VGne9AxOjshS
nixXIYG/eV1vC5giJbjCGbmArAA8nwM=
=k1hL
-----END PGP SIGNATURE-----

--xMmRnVLDUviAWcqC--


--===============5898050033719051649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5898050033719051649==--

