Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5046ECD4F39
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 18:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCdiWQCUW/9l4IZILebp4Aa9vp4x7xrOEWCg/3XhIOE=; b=AhekAUxlNJLgqlDnotd6kgECJj
	UaAgAdmCMv7z8UBfU/2JEV5GH88LQ9Ckt/o7mehQuG4juD5Vz1yAUfnEVOIETF3YpXid1T5Jx51xi
	j+XrY1G3W4+vTJOTWfKlhkWrG16tUU9zZXcRQKei+geJpgIOInF/K1erkeNxDLDs4EGq7jF/Qa0EM
	9H2r23VodWuzi6HNeZ70vZyogGOcjCi3dac+hOGZ70iafHoyZ7FGkOmV7eM6ERjAu8UiacrfAeL9I
	fBBbbtcKmnMXwgJ86rNpuGMqYMXRcJ1MLUxpHaKCBNHr16z5MjRNDXdyWIkzL14mZhAqpryKYxTQu
	HJZIllkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNbAt-00000006Ml2-3e4b;
	Thu, 14 May 2026 18:52:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNbAs-00000006MkL-1C2s
	for linux-riscv@bombadil.infradead.org;
	Thu, 14 May 2026 18:52:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ufZoOphBDRZ0nLnNFOjB7ZN/8tulU4lo8h5ghqMFNAY=; b=C0ujoXbdEodZR933jE3AS86yax
	UZ3PwcyQSSeJFmCmu++E3J6njQy7kLby/hPd/tTRFb+9gJPdtc1SSd2bipfaYk7hzZsYBDqmTuFMc
	ejKB59eZE787eASxEZNOQEofrhBM4hrv0V7unoLF+v8+wE7qkZpZqC9nF/KtNjtVGCet0Xa6SGA8S
	X9OJNINA+JqwYUZQDKizFVEWJdnxSs5W9MMa/pMh584S114CIJGIuvxvErg5JFOeHL8S+bCNburUR
	K3c2ExOGoEqUoImVmBlx6lqPXIuD97QXCGCETx8r+8s6W40aYB9lLlWxwEMSF9mnSOEWOTHO/EYiN
	BLB4SFEA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNbAn-00000003f9H-2xJ5
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 18:52:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2406540976;
	Thu, 14 May 2026 18:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7414C2BCB3;
	Thu, 14 May 2026 18:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778784758;
	bh=EjjckhqKrEpt2tuinU7XDjnKyA1wZpkbU4cCxxKq8Zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bQLvdkjBKplXHSyQPsPUVaUpVCYaGm4kIsGxEJ7c6WznxtKsJ1j4izEIn86kox3Ia
	 lqitdPJcFQrEdXTPdIFQSqCwWXeAg22Nc/bl08Cbv/3EoYdt8nNWe0+U/+g4xVJ+3m
	 aYNzhw73c7lNR1RUkUP2UQa/FCuTb8rzAYswbS7bH8Z6ziu/jbyGCmpxcpG96cgkJX
	 KRgvf/eV5hoYJ/EiRh9+KBOclon3NVRZ2qD2X8qWL1ysjRIDCIjeOMBoXTnfUo9+tu
	 cnaFFSAAwuWoTRtzq259NMaLU6uZx7z7S+EGy4oC2boBpeTGKJIYtr8mdTTExy8D1l
	 xbEdEZ29napGg==
Date: Thu, 14 May 2026 19:52:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v2 04/22] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Message-ID: <20260514-undermost-gray-6c9967b363a3@spud>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
 <20260514111218.94519-5-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260514111218.94519-5-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_195242_417379_98C808E4 
X-CRM114-Status: GOOD (  29.17  )
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
Content-Type: multipart/mixed; boundary="===============8458125799699910996=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8458125799699910996==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qQBf5GEmk4YQ2r9u"
Content-Disposition: inline


--qQBf5GEmk4YQ2r9u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 04:12:00AM -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC System-0(sys0) pinctrl
> controller.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml | 175 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  17 ++
>  2 files changed, 192 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh=
b100-sys0-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sy=
s0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100=
-sys0-pinctrl.yaml
> new file mode 100644
> index 000000000000..21d3693587fd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinc=
trl.yaml
> @@ -0,0 +1,175 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys0-pinctrl.=
yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JHB100 System-0 Pin Controller
> +
> +description: |
> +  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
> +
> +  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0,=
 per1,
> +  per2, per2pok, per3, adc0, adc1, emmc, and vga.
> +  This document provides an overview of the "sys0" pinctrl domain.
> +
> +  The "sys0" domain has a pin controller which provides
> +  - function selection for GPIO pads.
> +  - GPIO pad configuration.
> +  - GPIO interrupt handling.
> +
> +  In the SYS0 Pin Controller, there are 4 multi-function GPIO_PADs. Each=
 of
> +  them can be multiplexed to different hardware blocks through function
> +  selection and each iopad has a maximum of up to 2 functions - 0 and 1.
> +  Function 0 is the default function which is generally the GPIO function
> +  (or occasionally, it can be a peripheral signal).
> +  Function 1 is the alternate function or peripheral signal that can be
> +  routed to the iopad. The function selection is carried out by writing
> +  the function number to the iopad function select register.
> +
> +  Each iopad is configurable with parameters such as input-enable, inter=
nal
> +  pull-up/pull-down bias, drive strength, schmitt trigger, slew rate,  i=
nput
> +  debounce nanoseconds, power source and drive type  (open-drain or push=
-pull).
> +
> +maintainers:
> +  - Alex Soo <yuklin.soo@starfivetech.com>

Why is Alex the maintainer when you are the sole author?

> +
> +properties:
> +  compatible:
> +    items:
> +      - const: starfive,jhb100-sys0-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 3
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 3
> +
> +  gpio-ranges: true
> +
> +  gpio-line-names: true
> +
> +patternProperties:
> +  '-grp$':
> +    type: object
> +    additionalProperties: false
> +    patternProperties:
> +      '-pins$':
> +        type: object
> +        description: |
> +          A pinctrl node should contain at least one subnode representin=
g the
> +          pinctrl groups available in the domain. Each subnode will list=
 the
> +          pins it needs, and how they should be configured, with regard =
to
> +          function selection, bias, input enable/disable, input schmitt
> +          trigger enable/disable, slew-rate, input debounce nanoseconds,
> +          drive-open-drain, drive-push-pull, power-source and drive-stre=
ngth.
> +        allOf:
> +          - $ref: /schemas/pinctrl/pincfg-node.yaml
> +          - $ref: /schemas/pinctrl/pinmux-node.yaml
> +        unevaluatedProperties: false

I think this should be additionalProperties, since you're citing all the
properties you do support below.

> +
> +        properties:
> +          pins:
> +            description:
> +              The list of IOs that properties in the pincfg node apply t=
o.
> +
> +          function:
> +            description:
> +              A string containing the name of the function to mux for th=
ese
> +              pins.
> +            enum: [ auxpwrgood, gpio, hbled, pe2rst_out ]
> +
> +          bias-disable: true
> +
> +          bias-pull-down:
> +            type: boolean
> +
> +          bias-pull-up:
> +            oneOf:
> +              - type: boolean
> +              - enum: [ 600, 900, 1200, 2000 ]
> +                description: Pull up RSEL type resistance values (in ohm=
s)
> +            description:
> +              For normal pull up type there is no need to specify a resi=
stance
> +              value, hence this can be specified as a boolean property.
> +              For RSEL pull up type a resistance value (in ohms) can be =
added.
> +
> +          drive-open-drain: true
> +
> +          drive-push-pull: true
> +
> +          drive-strength:
> +            enum: [ 2, 4, 8, 12 ]
> +
> +          drive-strength-microamp:
> +            enum: [ 2000, 4000, 8000, 12000 ]
> +
> +          input-debounce-nanoseconds:
> +            minimum: 0
> +            maximum: 4294967295
> +
> +          input-disable: true
> +
> +          input-enable: true
> +
> +          input-schmitt-enable: true
> +
> +          input-schmitt-disable: true
> +
> +          power-source:
> +             enum: [ 0, 1, 2 ]
> +
> +          slew-rate:
> +            enum: [ 0, 1 ]
> +            default: 0
> +            description: |
> +                0: slow (half frequency)
> +                1: fast
> +
> +required:
> +  - compatible
> +  - reg
> +  - resets
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        pinctrl_sys0: pinctrl@13080000 {
> +            compatible =3D "starfive,jhb100-sys0-pinctrl";
> +            reg =3D <0x0 0x13080000 0x0 0x800>;
> +            resets =3D <&sys0crg 2>;
> +            interrupts =3D <56>;
> +            interrupt-controller;
> +            #interrupt-cells =3D <3>;
> +            gpio-controller;
> +            #gpio-cells =3D <3>;
> +            gpio-ranges =3D <&pinctrl_sys0 0 0 0 4>;
> +        };
> +    };
> diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/incl=
ude/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> new file mode 100644
> index 000000000000..6d8f5516a178
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +/*
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + *
> + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> + */
> +
> +#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
> +#define __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
> +
> +/* sys0 pad numbers */
> +#define PADNUM_SYS0_GPIO_A0				0
> +#define PADNUM_SYS0_GPIO_A1				1
> +#define PADNUM_SYS0_GPIO_A2				2
> +#define PADNUM_SYS0_GPIO_A3				3

Does this provide any actual value? Across the whole series, most
numbers you put in this binding headers do not appear in any drivers
at all. Seems like these defines should appear in the dts directly?

pw-bot: changes-requested

Cheers,
Conor.

> +
> +#endif
> --=20
> 2.25.1
>=20

--qQBf5GEmk4YQ2r9u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagYZ8AAKCRB4tDGHoIJi
0rX3AQDZ/MD1411Omq0iweCXVv8GChspy99U/9p7n6u8LvDW/QD+M2IaZxzEFcB9
9eFs8+joPj8M0GHlb0gA8KKdbMUNxwA=
=k4Xv
-----END PGP SIGNATURE-----

--qQBf5GEmk4YQ2r9u--


--===============8458125799699910996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8458125799699910996==--

