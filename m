Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3363FED3F0
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 16:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6LlnjbMiC++tqPXOqDSz6JW83qO5IHZyA2mo/yQKWI=; b=EwNByQiZoK82cbyTDnMpcyMxpo
	8dLynDdY7ebfgdbYe+WA9hEdpfOIJVKldSZ7CNpd/PZqx6yeHuyMdS2+Y/1+LCng3+Bba0ThNi3Ur
	RM7K6q2/K6uzSKf21VnUiLJCznufmjfAs9082DO2xUceEaY5rdRTlDjbFQwx0RKE+JUx3492zF3j9
	0P0VhAT8xq/9RH81zPKxq3I9RLzCNWvglcwl+xJ+urxPV0E0SdE5iMIUlKIzZAGZlKXPjwj8k9nOx
	DgQM9I53ZnP/a9cNQRYxggJCSzh2n4KolWntji8x3uzsLy7Z2CAJilUqi8OS9JDiUt4uE8bSbhsbD
	qrj3jTcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJpp-0000000DYT0-2Vjk;
	Fri, 24 Apr 2026 16:56:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJpo-0000000DYSZ-2TKR
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 16:56:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE9C2600CB;
	Fri, 24 Apr 2026 16:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D29C19425;
	Fri, 24 Apr 2026 16:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777049815;
	bh=RfjkBzwZ9edtsWXWfoG26jk4sifBG9YcFnA7yXOM/ww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RCdyJj9fNhnq2y2tvCxJyCFSzCyDtzas7v3XsVw++ruxt59N9WECEEAmQxwVhP4uh
	 OBpEWAyeCzwwuJ5f+MZ6Cp0xes6xhmJTePpo7rqgdqdqL+Ox+B5rmXz3MoLwyvK12Q
	 08XlSp1EF427rp3ToZOEI7Bi1cel6CzoP4cCRvqYq8i5S/bowjtWZwBZQTxM+hRj9a
	 kTZN1M6AkDx5Wtdj6MoOVV3+eBAYAKXXshLiFaTBkeVrUpbH01+FJSHNo9cwGMu/Se
	 yM3dEGJCtLZQH+sDsbKDf30MI5yrEAturDsSbeLBSWZc/JCaDvBheAk/AzSdSEaT85
	 L+WS20iHUr2Yw==
Date: Fri, 24 Apr 2026 17:56:50 +0100
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
Subject: Re: [PATCH v1 11/20] dt-bindings: pinctrl: Add
 starfive,jhb100-per1-pinctrl
Message-ID: <20260424-mumps-foothill-ef122c1029c0@spud>
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
 <20260424111330.702272-12-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260424111330.702272-12-changhuang.liang@starfivetech.com>
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
Content-Type: multipart/mixed; boundary="===============0462560545741421185=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0462560545741421185==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+tz+siA7KtiLNcy0"
Content-Disposition: inline


--+tz+siA7KtiLNcy0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 04:13:21AM -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-1(per1) pinctrl
> controller.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

There's a lot of binding here, and I think a bunch of them have similar
questions to be answered, so I am just going to review this one for now.

> ---
>  .../pinctrl/starfive,jhb100-per1-pinctrl.yaml | 217 ++++++++++++++++++
>  1 file changed, 217 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh=
b100-per1-pinctrl.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-pe=
r1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100=
-per1-pinctrl.yaml
> new file mode 100644
> index 000000000000..b2af4df874df
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinc=
trl.yaml
> @@ -0,0 +1,217 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-per1-pinctrl.=
yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JHB100 Peripheral-1 Pin Controller
> +
> +description: |
> +  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
> +
> +  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0,=
 per1,
> +  per2, per2pok, per3, adc0, adc1, emmc, and vga.
> +  This document provides an overview of the "per1" pinctrl domain.
> +
> +  The "per1" domain has a pin controller which provides
> +  - function selection for GPIO pads.
> +  - GPIO pad configuration.
> +  - GPIO interrupt handling.
> +
> +  In the Peripheral-1 Pin Controller, there are 36 multi-function GPIO_P=
ADs. Each of them
> +  can be multiplexed to several peripherals through function selection. =
Each iopad has a
> +  maximum of up to 3 functions - 0, 1, and 2. Function 0 is the default =
function which is
> +  generally the GPIO function. Function 1 and 2 are the alternate functi=
ons or peripheral
> +  signals that can be routed to the iopad. The function selection can be=
 carried out by
> +  writing the function number to the iopad function select register.
> +  Each iopad is configurable with parameters such as input-enable, inter=
nal pull-up/pull-down
> +  bias, drive strength, schmitt trigger, slew rate, and debounce width.
> +
> +  This domain contains 4 IO groups which support voltage levels 1.8V and=
 3.3V
> +  gpioe-spi - comprises PAD_GPIO_C0 through PAD_GPIO_C4.
> +  gpioe-qspi0 - comprises PAD_GPIO_C5 through PAD_GPIO_C11.
> +  gpioe-qspi1 - comprises PAD_GPIO_C12 through PAD_GPIO_C19.
> +  gpioe-qspi2 - comprises PAD_GPIO_C20 through PAD_GPIO_C27.
> +
> +  Each of the above IO groups must be configured with a voltage setting =
that matches the external
> +  voltage level provided to the IO group.
> +
> +maintainers:
> +  - Alex Soo <yuklin.soo@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: starfive,jhb100-per1-pinctrl
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
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  gpio-line-names: true
> +
> +  gpioe-spi-vref:

Why are these custom properties required?
This sounds like the sort of information that could be gleaned from the
"power-source" property.

> +    description: |
> +        Voltage reference value for the IO group "gpioe-spi"
> +        0: voltage reference value for 3.3V
> +        2: voltage reference value for 1.8V
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 2]
> +    default: 0
> +
> +  gpioe-qspi0-vref:
> +    description: |
> +        Voltage reference value for the IO group "gpioe-qspi0"
> +        0: voltage reference value for 3.3V
> +        2: voltage reference value for 1.8V
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 2]
> +    default: 0
> +
> +  gpioe-qspi1-vref:
> +    description: |
> +        Voltage reference value for the IO group "gpioe-qspi1"
> +        0: voltage reference value for 3.3V
> +        2: voltage reference value for 1.8V
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 2]
> +    default: 0
> +
> +  gpioe-qspi2-vref:
> +    description: |
> +        Voltage reference value for the IO group "gpioe-qspi2"
> +        0: voltage reference value for 3.3V
> +        2: voltage reference value for 1.8V
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 2]
> +    default: 0
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
> +          trigger enable/disable, slew-rate and drive strength.
> +        allOf:
> +          - $ref: /schemas/pinctrl/pincfg-node.yaml
> +          - $ref: /schemas/pinctrl/pinmux-node.yaml
> +        unevaluatedProperties: false
> +
> +        properties:
> +          pinmux:
> +            description: |
> +              The list of GPIOs and their function select.
> +              The PINMUX macros are used to configure the
> +              function selection.

Why is the pinmux property needed?
Can you use pins and function instead?

Looking at the defines that you have added, it appears that lots of
defines for the same peripheral share the same numerical values,
suggesting that across peripheral, all (or most) pins would share the
same mux setting/"function select", suggesting that pins/function would
suffice.

I'd like to see some justification for pinmux being the right solution
here, like the "function select" used by one peripheral being
significantly different for many of its pins.

> +
> +          bias-disable: true
> +
> +          bias-pull-up:
> +            type: boolean
> +
> +          bias-pull-down:
> +            type: boolean
> +
> +          drive-strength:
> +            enum: [ 2, 4, 8, 12 ]
> +
> +          drive-strength-microamp:
> +            enum: [ 2000, 4000, 8000, 12000 ]
> +
> +          input-enable: true
> +
> +          input-disable: true
> +
> +          input-schmitt-enable: true
> +
> +          input-schmitt-disable: true
> +
> +          slew-rate:
> +            enum: [ 0, 1 ]
> +            default: 0
> +            description: |
> +                0: slow (half frequency)
> +                1: fast
> +
> +          starfive,debounce-width:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            default: 0
> +            description:
> +              Debounce width 0 =3D Disabled, Others =3D 80ns*N stages

This sounds like it should be called "debounce-stages".

> +
> +          starfive,drive-i2c-fast-mode:
> +            type: boolean
> +            description:
> +              Enable I2C fast mode drive
> +
> +          starfive,drive-i2c-fast-mode-plus:
> +            type: boolean
> +            description:
> +              Enable I2C fast mode plus drive
> +
> +          starfive,i2c-open-drain-pull-up-ohm:
> +            $ref: /schemas/types.yaml#/definitions/uint32

The unit of resistance is "ohms" in dt-schema, if you swap to that you
won't need the $ref.

> +            description:
> +              open drain pull-up select
> +            enum: [600, 900, 1200, 2000]
> +            default: 600
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
> +        pinctrl_per1: pinctrl@11b42000 {

Drop the label here, since there's no users.


Cheers,
Conor.

> +            compatible =3D "starfive,jhb100-per1-pinctrl";
> +            reg =3D <0x0 0x11b42000 0x0 0x800>;
> +            resets =3D <&per1crg 0>;
> +            interrupts =3D <61>;
> +            interrupt-controller;
> +            #interrupt-cells =3D <2>;
> +            gpio-controller;
> +            #gpio-cells =3D <2>;
> +            gpio-ranges =3D <&pinctrl_per1 0 0 36>;
> +        };
> +    };
> --=20
> 2.25.1
>=20

--+tz+siA7KtiLNcy0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeugzwAKCRB4tDGHoIJi
0v3fAQDhkw+Bzt68Na1/fsB1WpDiJ8OeoomVlu6nLURmbFc5SgEAzKaRkiDAuMXN
8o8+1ioxYj5PRdVnKVUQX4k0+vO/FQs=
=9eal
-----END PGP SIGNATURE-----

--+tz+siA7KtiLNcy0--


--===============0462560545741421185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0462560545741421185==--

