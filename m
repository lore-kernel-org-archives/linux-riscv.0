Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F19C04FF6
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 14:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/4Gs3olEEyis8GEUVv6d30BL3DK7HAHaROsY2ze8aE=; b=lFF37vr5pmPi4Qb9xpIP1EFHuR
	zCO+79f5AGtIEBJ6OtdqOdM4cXwuNxxjCPpNzhI+YHPcZY1FYUeKwuE7T5xuCXpsprxTT8KmcnC5g
	Vzg+GByT+7ygo7dCA4s6WGZo7igNzBCvkSnEBqPD869ctLPJHxC99gb62Ksw6wMP3jCgZny+FuqRm
	UmLOYhTUebZZtWOg0Vt5j0vqraNlet5t0rUJhmxCRUZgOIiC1Yzm5YZ5VL7EOjPwBNW76cB/nt8zE
	bk34VuTifx+8Cc40s6uf4vlBwW7yeEWwsp0M+qEhWlNaKcRudLqgKZJoT8KaU28H660Ss3Kf+T046
	HLCxFzrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxpCq-00000005y4I-2n71;
	Fri, 19 Apr 2024 14:27:12 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxpCm-00000005y1q-2l4X;
	Fri, 19 Apr 2024 14:27:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DF2EDCE1AE1;
	Fri, 19 Apr 2024 14:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE37C072AA;
	Fri, 19 Apr 2024 14:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713536826;
	bh=LIZ2ooYsvWJUe0Wpz+3YNSl3PEnltQyTG5qEOSFGmXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qk/D/+muf+di1gTdiGkl9RX59eTAIPKi/X4wFxyAAJLB4Ru+ZGaGdCvE4WSjhERbn
	 lDsBW4dOO8a2ClDwRQtf2zOTybfG+aE4+Xenb6tHxeEDjB5mHYr8Alb6BHwiuhEoRg
	 7R49/mWs0c6KvHLBbUjbKCwc5kpLILbiyHZGvNkaR/hsQezmnFTNtL06vAU5RsjbFM
	 X9SNuQMOiGnBErf20eaAM/jIWzBBlBb34BC97qizzwhHVC+sfKumxbeDS5kUUvIzJ0
	 owxzUMW6Jts137vJuNOH2RgyOSvQcftHP1eD4OYjtnjoZ3b0AaG9ztC5skFqP7Z+WL
	 cJTywwqn3hdDg==
Date: Fri, 19 Apr 2024 15:26:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>, dlan@gentoo.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add Sophgo CV1800 USB phy
Message-ID: <20240419-harmful-neutron-d0db367cf659@spud>
References: <IA1PR20MB4953780F4617823F7173B6D6BB042@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953040232A4D41E41F2D2A9BB042@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB4953040232A4D41E41F2D2A9BB042@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_072709_113667_25CDA406 
X-CRM114-Status: GOOD (  25.38  )
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
Content-Type: multipart/mixed; boundary="===============3437502378973901443=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3437502378973901443==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wzFy3jBeV9w7Nqxx"
Content-Disposition: inline


--wzFy3jBeV9w7Nqxx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 03:22:24PM +0800, Inochi Amaoto wrote:
> The USB phy of Sophgo CV18XX series SoC needs to sense a pin called
> "VBUS_DET" to get the right operation mode. If this pin is not
> connected, it only supports setting the mode manually.
>=20
> Add USB phy bindings for Sophgo CV18XX/SG200X series SoC.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  .../bindings/phy/sophgo,cv1800-usb-phy.yaml   | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/sophgo,cv1800-u=
sb-phy.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/phy/sophgo,cv1800-usb-phy.=
yaml b/Documentation/devicetree/bindings/phy/sophgo,cv1800-usb-phy.yaml
> new file mode 100644
> index 000000000000..cb394ac5d8c4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/sophgo,cv1800-usb-phy.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/sophgo,cv1800-usb-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo CV18XX/SG200X USB 2.0 PHY
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@outlook.com>
> +
> +properties:
> +  compatible:
> +    const: sophgo,cv1800-usb-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  clocks:
> +    items:
> +      - description: PHY clock
> +      - description: PHY app clock
> +      - description: PHY stb clock
> +      - description: PHY lpm clock
> +
> +  clock-names:
> +    items:
> +      - const: phy
> +      - const: app
> +      - const: stb
> +      - const: lpm
> +
> +  dr_mode:
> +    description: PHY device mode when initing.

"initing" isn't a word, "initialising" is the correct word. Or
"initializing" if you speak American. But if it is just the value during
initialisation, why do we need to know - we can just overwrite it in
software, right?

Are you sure that this is limited to initialisation? I would have
thought that it describes the configuration that the board is in, and is
a fixed property of the system?

> +    enum: [host, peripheral, otg]

Rob, I know this is a phy rather than a controller, so referencing
usb-drd.yaml doesn't really make sense, but there are several PHYs using
dr_mode so it feels like there should be something to reference here
rather than defining the property anew.

> +
> +  vbus_det-gpios:
> +    description: GPIO to the USB OTG VBUS detect pin. This should not be
> +      defined if vbus_det gpio and switch gpio are connected.

I don't understand the second sentence here.

> +    maxItems: 1
> +
> +  sophgo,switch-gpios:
> +    description: GPIO for the phy to control connected switch.
> +    maxItems: 2

You've got two items here, they should be described. /But/ the property
above says "switch gpio", which is singular. Which is it?

Cheers,
Conor.

> +
> +required:
> +  - compatible
> +  - "#phy-cells"
> +  - clocks
> +  - clock-names
> +  - dr_mode
> +
> +allOf:
> +  - if:
> +      properties:
> +        dr_mode:
> +          const: otg
> +    then:
> +      required:
> +        - vbus_det-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    phy@48 {
> +      compatible =3D "sophgo,cv1800-usb-phy";
> +      reg =3D <0x48 0x4>;
> +      #phy-cells =3D <0>;
> +      clocks =3D <&clk 92>, <&clk 93>,
> +               <&clk 94>, <&clk 95>;
> +      clock-names =3D "phy", "app", "stb", "lpm";
> +      dr_mode =3D "host";
> +    };
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    phy@54 {
> +      compatible =3D "sophgo,cv1800-usb-phy";
> +      reg =3D <0x54 0x4>;
> +      #phy-cells =3D <0>;
> +      clocks =3D <&clk 92>, <&clk 93>,
> +               <&clk 94>, <&clk 95>;
> +      clock-names =3D "phy", "app", "stb", "lpm";
> +      dr_mode =3D "otg";
> +      vbus_det-gpios =3D <&portb 6 GPIO_ACTIVE_HIGH>;
> +    };
> --
> 2.44.0
>=20

--wzFy3jBeV9w7Nqxx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiJ/LQAKCRB4tDGHoIJi
0vrCAP9R3ajhruwWEa6524OScv46PoGRGBZEDXLB11mYIt7yrQD+M6fgMybbX45+
WHmD18Svh+jDgv07w0Lt0Pf9l3RCUAE=
=Cu/R
-----END PGP SIGNATURE-----

--wzFy3jBeV9w7Nqxx--


--===============3437502378973901443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3437502378973901443==--

