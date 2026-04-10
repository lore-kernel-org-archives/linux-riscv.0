Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA11F459F7
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 17:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pK+41tkf6xBcDxH1LV0K7sUBckvZoIhpTrXcOSpte4w=; b=eKz/drfH4ALgxtsk9xze7GIY28
	pTF0mQics7n7QKrn4jdDMeSpM03On1kZ425+uH4zM29cU4Cw0H87Tanvkyw7z+QH6LjsVQw4MmO5w
	jVSK951/ek9sozhRJ7E/RkUtd+o7NhIJorB2zqybYK5WicBS8ThkuO9+gS/I4C6QO4mwxhTRVgsww
	tEJAnBSMxkNS+SNXmktZRRnJkJMAjiMFC3Rxkt0HBfbX9zDRzOQuX1G8POuxmrqRqW7213RIDn71U
	n9tbZrFINMZq2/hDd9+9YKmRY18+jEjfihQkcHqmiaEZYIYGpAV3N/+pqGY7xHuieWxlXFb/ZJs1e
	4aUCBBQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFsq-0000000Ce3h-27wP;
	Fri, 10 Apr 2026 17:43:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFsp-0000000Ce3Y-1gwp
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 17:43:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 795116001A;
	Fri, 10 Apr 2026 17:43:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3827EC19421;
	Fri, 10 Apr 2026 17:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775842986;
	bh=NLB9LEMY5pWWZ3n8brg3UOx+BxMKZY6/dSsFdTIeHf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kM0uuTbp2GWgXAjoEz2Ob8KFuviqYXbnI4rc2/9F+ozZWXlcGA+xqSWmjw0a90nlI
	 fOBysVnEAYoeg3Rjpm+Yrci0iXek1GOmFx/G1rKn6E8e37a4CAohI+GiuwEaYZaOIx
	 nDRL714NfwzMxRlaWD1rjV6RyoWPl8Y/uDPBfm9+GtwQBm3EVxKqckTovwdZhYcZHp
	 Rhr2XO+22Wzmx5H3l5tffjuZQaW7aC+fuvq4ytpTPRhXk0gmUwg2XLCiTOHDV8DBxE
	 ggBJWIc3FqmR0xA/PoZlLE1XC8qGTiAyoGgjBkScK73AdQa0mqYlI5k2oKgPRrKUlr
	 mi9VnMzYXtkjA==
Date: Fri, 10 Apr 2026 18:43:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v1 1/5] dt-bindings: interrupt-controller: Convert the
 word "jh8100" to "jhb100"
Message-ID: <20260410-rockstar-monologue-b3f64fe20226@spud>
References: <20260410090106.622781-1-changhuang.liang@starfivetech.com>
 <20260410090106.622781-2-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260410090106.622781-2-changhuang.liang@starfivetech.com>
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
Content-Type: multipart/mixed; boundary="===============5623929136704359568=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5623929136704359568==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rRj6akklFzTXY1lx"
Content-Disposition: inline


--rRj6akklFzTXY1lx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 02:01:02AM -0700, Changhuang Liang wrote:
> The StarFive JH8100 SoC was discontinued before production. The
> newly taped-out JHB100 SoC uses the same interrupt controller IP.
>=20
> Rename the binding file, compatible string, and MAINTAINERS entry
> from "jh8100" to "jhb100". In JHB100 SoC, The clocks and resets are
> not operated by users, but they exist in the hardware. Mark them as
> optional.

Content looks fine, I think the commit message should be changed to
something like "repurpose binding for unreleased jh8100 for jhb100".

W/ something along those lines
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  ...ve,jh8100-intc.yaml =3D> starfive,jhb100-intc.yaml} | 12 ++++--------
>  MAINTAINERS                                          |  2 +-
>  2 files changed, 5 insertions(+), 9 deletions(-)
>  rename Documentation/devicetree/bindings/interrupt-controller/{starfive,=
jh8100-intc.yaml =3D> starfive,jhb100-intc.yaml} (81%)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/starf=
ive,jh8100-intc.yaml b/Documentation/devicetree/bindings/interrupt-controll=
er/starfive,jhb100-intc.yaml
> similarity index 81%
> rename from Documentation/devicetree/bindings/interrupt-controller/starfi=
ve,jh8100-intc.yaml
> rename to Documentation/devicetree/bindings/interrupt-controller/starfive=
,jhb100-intc.yaml
> index ada5788602d6..576b1d6c7973 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/starfive,jh8=
100-intc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/starfive,jhb=
100-intc.yaml
> @@ -1,13 +1,13 @@
>  # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/interrupt-controller/starfive,jh8100-=
intc.yaml#
> +$id: http://devicetree.org/schemas/interrupt-controller/starfive,jhb100-=
intc.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
>  title: StarFive External Interrupt Controller
> =20
>  description:
> -  StarFive SoC JH8100 contain a external interrupt controller. It can be=
 used
> +  StarFive SoC JHB100 contain a external interrupt controller. It can be=
 used
>    to handle high-level input interrupt signals. It also send the output
>    interrupt signal to RISC-V PLIC.
> =20
> @@ -16,7 +16,7 @@ maintainers:
> =20
>  properties:
>    compatible:
> -    const: starfive,jh8100-intc
> +    const: starfive,jhb100-intc
> =20
>    reg:
>      maxItems: 1
> @@ -40,8 +40,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - clocks
> -  - resets
>    - interrupts
>    - interrupt-controller
>    - "#interrupt-cells"
> @@ -51,10 +49,8 @@ additionalProperties: false
>  examples:
>    - |
>      interrupt-controller@12260000 {
> -      compatible =3D "starfive,jh8100-intc";
> +      compatible =3D "starfive,jhb100-intc";
>        reg =3D <0x12260000 0x10000>;
> -      clocks =3D <&syscrg_ne 76>;
> -      resets =3D <&syscrg_ne 13>;
>        interrupts =3D <45>;
>        interrupt-controller;
>        #interrupt-cells =3D <1>;
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d238590a31f2..a2961727e3d1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25312,7 +25312,7 @@ F:	drivers/phy/starfive/phy-jh7110-usb.c
>  STARFIVE JH8100 EXTERNAL INTERRUPT CONTROLLER DRIVER
>  M:	Changhuang Liang <changhuang.liang@starfivetech.com>
>  S:	Supported
> -F:	Documentation/devicetree/bindings/interrupt-controller/starfive,jh810=
0-intc.yaml
> +F:	Documentation/devicetree/bindings/interrupt-controller/starfive,jhb10=
0-intc.yaml
>  F:	drivers/irqchip/irq-starfive-jh8100-intc.c
> =20
>  STATIC BRANCH/CALL
> --=20
> 2.25.1
>=20
>=20

--rRj6akklFzTXY1lx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCadk2pQAKCRB4tDGHoIJi
0mtsAQCrrB/xGtsUkGetT8r+sJWjMb0UXBmk5RE78eS0ExnF2gEAuBq+zals99Os
7hG4LWCkEqAnm13kvHiVVo0Q+TYggQ0=
=D8//
-----END PGP SIGNATURE-----

--rRj6akklFzTXY1lx--


--===============5623929136704359568==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5623929136704359568==--

