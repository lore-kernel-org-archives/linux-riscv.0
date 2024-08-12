Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50317C3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 15:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hb6iWcz+tmPXd/FKIgt+dtITLTT3XmBm0TbMtSRsunU=; b=jPu4mnE8YbUTmgVGVh6Yw5Rb+u
	5bhwlbC0gv8rKnA4lUDQDy2qIA/FrYUZjVMPXP0x4k5tkRrWQn8jdOyFRtkcfaLGaAWl1P9wSnH8g
	EXWWY70Zbkfvqss2A9qTbeNPRRCIp/A14G+GbzB3PEw6HvNLCmIDwRwpU7vI53/1cQHAITYsjASjy
	vfy1jhG8SWJXA4c0XNz1yh9Fy1viqOpilcK5fDd/iN30BP3xKYb13lela/YpLbwKoznWgtd1Bt3qv
	QLyKnoWq36lrHQIkVLbjBPIiPK+O6AesVPjotnyzqO54J2dta8piHMfdla2veFSCtOqL13yEFrRv9
	wAMxpkzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdXMG-00000000o7N-3qPD;
	Mon, 12 Aug 2024 15:53:20 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdXMD-00000000o6s-15hU
	for linux-riscv@lists.infradead.org;
	Mon, 12 Aug 2024 15:53:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 54D78CE0FBE;
	Mon, 12 Aug 2024 15:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 433E9C32782;
	Mon, 12 Aug 2024 15:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723477994;
	bh=HlRdvFKn4iFjzvom5J0DF55x13AYDpUEmQpaLh1Gggw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HNvjyIvYcUWCRotT7GQXgqUlrr5FSbUa41bF+C4Q8O9FFRsQi7TpfwO2qfPILOHLI
	 MF+lE2hpeNWcwGvlQSDyLXmIQgwb+YpXMz3VNQLUeGM71j8iMBfuYVcqFGZ+i3Y5wB
	 Va17H2VYVmfqjGUXSSc3oH4h7MJVVFEC6rm1ygQaF82Iwrre9WyHkpF42zFPXvkF2t
	 1Eehgat9ol63Z0l6MIrYBwGYslWQzKLWmZIK2TcfQIbJktRs56XmmZgaSa4JYrPb09
	 pw774D/pCJUrirfRHRn6YHv4Lm6g9p9J51Y5UpqLV9jXTrGhyDYiLT0JLszaRzrIi2
	 vNiqYIrH2WBTQ==
Date: Mon, 12 Aug 2024 16:53:09 +0100
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
Subject: Re: [PATCH v4 1/3] dt-bindings: iio: adc: sophgo,cv18xx-saradc.yaml:
 Add Sophgo CV18XX SARADC binding
Message-ID: <20240812-unwary-mongrel-9f6758bf624c@spud>
References: <20240812-sg2002-adc-v4-0-599bdb67592f@bootlin.com>
 <20240812-sg2002-adc-v4-1-599bdb67592f@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20240812-sg2002-adc-v4-1-599bdb67592f@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_085317_678080_AFADB282 
X-CRM114-Status: GOOD (  19.02  )
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
Content-Type: multipart/mixed; boundary="===============4217318486826477057=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4217318486826477057==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IXMbfodZVYjINFLf"
Content-Disposition: inline


--IXMbfodZVYjINFLf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 05:00:55PM +0200, Thomas Bonnefille wrote:
> The Sophgo SARADC is a Successive Approximation ADC that can be found in
> the Sophgo SoC.
>=20
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
>  .../bindings/iio/adc/sophgo,cv18xx-saradc.yaml     | 85 ++++++++++++++++=
++++++
>  1 file changed, 85 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-sara=
dc.yaml b/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.ya=
ml
> new file mode 100644
> index 000000000000..846590808e5f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/sophgo,cv18xx-saradc.yaml#

Filename matching the compatible please.

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
> +    const: sophgo,cv1800b-saradc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  "^channel@[0-3]+$":
> +    $ref: adc.yaml
> +
> +    description: |

This | is not required.

> +      Represents the channels of the ADC.
> +
> +    properties:
> +      reg:
> +        description: |
> +          The channel number. It can have up to 3 channels numbered from=
 0 to 2.
> +        items:
> +          - minimum: 0
> +            maximum: 2

Is this sufficient to limit the number of channels to 3? Aren't you relying
on the unique unit addresses warning in dtc to limit it, rather than
actually limiting with min/maxItems?

Otherwise, looks fine to me.

Cheers,
Conor.

> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/sophgo,cv1800.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    adc@30f0000 {
> +        compatible =3D "sophgo,cv1800b-saradc";
> +        reg =3D <0x030f0000 0x1000>;
> +        clocks =3D <&clk CLK_SARADC>;
> +        interrupts =3D <100 IRQ_TYPE_LEVEL_HIGH>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        channel@0 {
> +            reg =3D <0>;
> +        };
> +        channel@1 {
> +            reg =3D <1>;
> +        };
> +        channel@2 {
> +            reg =3D <2>;
> +        };
> +    };
>=20
> --=20
> 2.46.0
>=20

--IXMbfodZVYjINFLf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZrov5QAKCRB4tDGHoIJi
0oaoAQDMe6NoYEYFRjr7uYTIB7DeEAi2qvZXnWVWHzFxwkkH8QEAw36aA0k+SIZe
JdTW3mWW5ZLezGEIrXTpuMaHzqoqWwQ=
=K9Up
-----END PGP SIGNATURE-----

--IXMbfodZVYjINFLf--


--===============4217318486826477057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4217318486826477057==--

