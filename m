Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459EDE7718A
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Dec 2024 19:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P44qk4NCvud6PdAUpG7uToDNGJQGQUfxJf42wrmYHSQ=; b=tf6V9hc5bkAqSGAcYKvzM/5kxh
	HWa7luS6eX6ID0HNx7bJaF+p4ukj1Anpo6IKLurr6BO3gNwds/rDgdgPobiplLB/vFTyTNPsF2aAp
	z6lmL2t8Depkaax0KGbUwQUzKf/2+FaeLepXkArv0gVgLDxirV8a4ynM2JdOUqZJvchxCWv0Gk4c3
	G/SayhVWpUqzktBIhGTTsLhVXqBUkfIagEe+mvlNnPZuNAM2DWKRrXkr2vXxDVEUy4HOEhLF3mK4/
	3KkTffXCUwy4joLUu6KIujEFxrPbaR3/r7RCcix9KsR3phplwhOCs1XkXrqUvLR9FRj9E/68btMY0
	3IcVNKkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMeG-00000002vHV-2WEf;
	Thu, 19 Dec 2024 19:57:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMZW-00000002uBL-3Zdg
	for linux-riscv@lists.infradead.org;
	Thu, 19 Dec 2024 19:52:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4687A5C68EB;
	Thu, 19 Dec 2024 19:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF7CC4CECE;
	Thu, 19 Dec 2024 19:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734637954;
	bh=jvsgdtWvGlEi67Ya4ZxgoWj4tFejX/Od5rTFurvvA7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BxeeJ5ccJXTbtf6BAHQZzhlNcIHAXUyizQ2zo2UzrSc0AhjJPF2vS8EvkFRs0KZnx
	 akewWFnGo3MhgEIdFXD2AbvqO9yTHIi9/OHf0Ycsx6t8FgvpcH1jGR9cAsTAuZuZaf
	 4oplg9471OojyE92YJAiJmiCN3CX1zSOLXYT5gvxofcTKy2S0UinDH9H+n89WtEPQr
	 yEa+bnEmltQMVIKreeGpWBt4njVFFSJm7Z8ToKLb3iqh/Y/w6tsONYrzLFNP2s9rRn
	 9vV7M4DNBCmLXPJiuXmzQQs2u/1d0Pm3XIJUfwVRNQzT2MNtHOZX90985WJLOahyoM
	 819hCxoug0WpQ==
Date: Thu, 19 Dec 2024 19:52:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: gpio: spacemit: add support for K1
 SoC
Message-ID: <20241219-secret-passenger-350d9c54fdf9@spud>
References: <20241219-03-k1-gpio-v2-0-28444fd221cd@gentoo.org>
 <20241219-03-k1-gpio-v2-1-28444fd221cd@gentoo.org>
MIME-Version: 1.0
In-Reply-To: <20241219-03-k1-gpio-v2-1-28444fd221cd@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_115234_973981_FF6BDE8E 
X-CRM114-Status: GOOD (  22.79  )
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
Cc: linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Meng Zhang <zhangmeng.kevin@spacemit.com>
Content-Type: multipart/mixed; boundary="===============7542188001630242941=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7542188001630242941==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TlnOqraZRabZf1Fo"
Content-Disposition: inline


--TlnOqraZRabZf1Fo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 03:17:43PM +0800, Yixun Lan wrote:
> The GPIO controller of K1 support basic functions as input/output,
> all pins can be used as interrupt which route to one IRQ line,
> trigger type can be select between rising edge, failing edge, or both.
> There are four GPIO banks, each consisting of 32 pins.
>=20
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 75 ++++++++++++++++=
++++++
>  1 file changed, 75 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml=
 b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..3d3d0b3bf2c144ed57b717bee=
50064949e26f087
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/spacemit,k1-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SpacemiT K1 GPIO controller
> +
> +maintainers:
> +  - Yixun Lan <dlan@gentoo.org>
> +
> +description:
> +  The controller's registers are organized as sets of eight 32-bit
> +  registers with each set controlling a bank of up to 32 pins.  A single
> +  interrupt is shared for all of the banks handled by the controller.
> +
> +properties:
> +  compatible:
> +    const: spacemit,k1-gpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  ranges: true

What do you need this for?

> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  gpio-ranges: true
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      The interrupt shared by all GPIO lines for this controller.
> +
> +  interrupt-names: true

Not that a name is valuable when you only have one interrupt, but if you
don't specify what the name is, you cannot interrupt-names!

Cheers,
Conor.

> +
> +  "#interrupt-cells":
> +    const: 2
> +    description:
> +      The first cell is the GPIO number, the second should specify inter=
rupt
> +      flag. The controller does not support level interrupts, flags of
> +      IRQ_TYPE_LEVEL_HIGH, IRQ_TYPE_LEVEL_LOW should not be used.
> +      Refer <dt-bindings/interrupt-controller/irq.h> for valid flags.
> +
> +  interrupt-controller: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - interrupts
> +  - interrupt-names
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio@d4019000 {
> +        compatible =3D "spacemit,k1-gpio";
> +        reg =3D <0xd4019000 0x800>;
> +        gpio-controller;
> +        #gpio-cells =3D <2>;
> +        interrupts =3D <58>;
> +        interrupt-names =3D "gpio_mux";
> +        interrupt-parent =3D <&plic>;
> +        interrupt-controller;
> +        #interrupt-cells =3D <2>;
> +        gpio-ranges =3D <&pinctrl 0 0 128>;
> +    };
>=20
> --=20
> 2.47.0
>=20

--TlnOqraZRabZf1Fo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2R5fAAKCRB4tDGHoIJi
0onSAP4xxs/QVra4eTxc7N7zscD89ikPe+xy/u6E9H6QX4W7CQD/X+H99sdD6DWM
rW2FKZz+v4xUkPFAI/AyGM5nouWeQgk=
=cxwg
-----END PGP SIGNATURE-----

--TlnOqraZRabZf1Fo--


--===============7542188001630242941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7542188001630242941==--

