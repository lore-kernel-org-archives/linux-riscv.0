Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A555CCD4851
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 07:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QaAOveFYiLWq7Djk6IC62V++vkaMcwy5u32oa4+gjA=; b=4MWkLmKQqtIB/GmUfvm3ngxwcf
	UrtZSTH8faUEhH1omByb8P8GIPcsjEg9gO+GUjhB0txI0oo6HGpMcQ1sE5+ZBJn/1xVLyISf9qqs2
	MgB4eVuflahmnh4ZbCUwSW0k6Zap+OgV2SvLqNWqjrJfYRnckeuUnx7biY1Z+1t6xcUmrGRBJuWQr
	3eDvbMIbqiD3NMlmGnPecvgEFCn9xv86Yb70jKjC50kP3zN0LUbPjI3qGTp6yI8zPfIdAKP80OdNq
	fIZtbSwyGYYCwzdgSPiwf4lZEqKWIWyaA5hbqyY+YusmAOxZ/Xmx9DN11VxKCt+rm6yvG1jd4ZK4G
	0VvuHJuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmtN-00000007c4f-2CPy;
	Fri, 15 May 2026 07:23:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmtK-00000007c3u-49ry
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 07:23:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778829807; x=1810365807;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wPER1cxZKqcS1CaNfmttXC5wbLdKQ5JLuGqR3y/2TP8=;
  b=nmLFLLEuhwSFcNWhd379ivt9i2EPJ9cv3vtQIHY2D1YO48648RfyaNhQ
   ufOXtmobIm1pI6gTaz7scA2w3gdaivB7ZEvlFdb1Ilszicu8oov865AOK
   W3dZ6BKtiSI8of9f9M1CMRJKzEpMNqGRNPFmM3buv+N7QDsis8ZbyShp2
   vufa0jruc7bxgR+aYoqh7sT/WBTqoqAd0HjXqEl2W1q1HMNBlU8ORPaEq
   Ad+PJ+jwUL6EsZN6oO/JHl2WsY2zbW3aG9TEnlWZGJVNioE6L2hIYnFbH
   dxMH+2v+k+aPHuXnRnVmJYGHrzV44MbiDkQ+MeM3Shv5noZg+e433x9r1
   g==;
X-CSE-ConnectionGUID: sZxHqqzyRZaW9VpTQfRRCQ==
X-CSE-MsgGUID: NN/PVGBKTl20iRvOU+FNsA==
X-IronPort-AV: E=Sophos;i="6.23,236,1770620400"; 
   d="asc'?scan'208";a="56782864"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 May 2026 00:23:24 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 15 May 2026 00:23:23 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 15 May 2026 00:23:20 -0700
Date: Fri, 15 May 2026 08:22:42 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
CC: Conor Dooley <conor@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Paul
 Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt
	<palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel
	<p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Lianfeng
 Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v2 04/22] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Message-ID: <20260515-eligible-greasily-257029ab1720@wendy>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
 <20260514111218.94519-5-changhuang.liang@starfivetech.com>
 <20260514-undermost-gray-6c9967b363a3@spud>
 <ZQ4PR01MB1202BD7677ACAF6EE18D062AF2042@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <ZQ4PR01MB1202BD7677ACAF6EE18D062AF2042@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_002327_252593_806156B5 
X-CRM114-Status: GOOD (  45.21  )
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
Content-Type: multipart/mixed; boundary="===============7933074767524410233=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7933074767524410233==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sceamiqloubMEw/P"
Content-Disposition: inline

--sceamiqloubMEw/P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 06:10:28AM +0000, Changhuang Liang wrote:
> Hi, Conor
>=20
> Thanks for the review.
>=20
> > On Thu, May 14, 2026 at 04:12:00AM -0700, Changhuang Liang wrote:
> > > Add pinctrl bindings for StarFive JHB100 SoC System-0(sys0) pinctrl
> > > controller.
> > >
> > > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > ---
> > >  .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml | 175 ++++++++++++++++=
++
> > >  .../pinctrl/starfive,jhb100-pinctrl.h         |  17 ++
> > >  2 files changed, 192 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl
> > > .yaml  create mode 100644
> > > include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinct
> > > rl.yaml
> > > b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinct
> > > rl.yaml
> > > new file mode 100644
> > > index 000000000000..21d3693587fd
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-p
> > > +++ inctrl.yaml
> > > @@ -0,0 +1,175 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause %YAML 1.2
> > > +---
> > > +$id:
> > > +http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys0-pinctrl.ya
> > > +ml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: StarFive JHB100 System-0 Pin Controller
> > > +
> > > +description: |
> > > +  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Lt=
d.
> > > +
> > > +  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2,
> > > + per0, per1,  per2, per2pok, per3, adc0, adc1, emmc, and vga.
> > > +  This document provides an overview of the "sys0" pinctrl domain.
> > > +
> > > +  The "sys0" domain has a pin controller which provides
> > > +  - function selection for GPIO pads.
> > > +  - GPIO pad configuration.
> > > +  - GPIO interrupt handling.
> > > +
> > > +  In the SYS0 Pin Controller, there are 4 multi-function GPIO_PADs.
> > > + Each of  them can be multiplexed to different hardware blocks
> > > + through function  selection and each iopad has a maximum of up to 2
> > functions - 0 and 1.
> > > +  Function 0 is the default function which is generally the GPIO
> > > + function  (or occasionally, it can be a peripheral signal).
> > > +  Function 1 is the alternate function or peripheral signal that can
> > > + be  routed to the iopad. The function selection is carried out by
> > > + writing  the function number to the iopad function select register.
> > > +
> > > +  Each iopad is configurable with parameters such as input-enable,
> > > + internal  pull-up/pull-down bias, drive strength, schmitt trigger,
> > > + slew rate,  input  debounce nanoseconds, power source and drive type
> > (open-drain or push-pull).
> > > +
> > > +maintainers:
> > > +  - Alex Soo <yuklin.soo@starfivetech.com>
> >=20
> > Why is Alex the maintainer when you are the sole author?
> >=20
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - const: starfive,jhb100-sys0-pinctrl
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  interrupt-controller: true
> > > +
> > > +  '#interrupt-cells':
> > > +    const: 3
> > > +
> > > +  gpio-controller: true
> > > +
> > > +  '#gpio-cells':
> > > +    const: 3
> > > +
> > > +  gpio-ranges: true
> > > +
> > > +  gpio-line-names: true
> > > +
> > > +patternProperties:
> > > +  '-grp$':
> > > +    type: object
> > > +    additionalProperties: false
> > > +    patternProperties:
> > > +      '-pins$':
> > > +        type: object
> > > +        description: |
> > > +          A pinctrl node should contain at least one subnode
> > representing the
> > > +          pinctrl groups available in the domain. Each subnode will =
list
> > the
> > > +          pins it needs, and how they should be configured, with reg=
ard
> > to
> > > +          function selection, bias, input enable/disable, input schm=
itt
> > > +          trigger enable/disable, slew-rate, input debounce
> > nanoseconds,
> > > +          drive-open-drain, drive-push-pull, power-source and
> > drive-strength.
> > > +        allOf:
> > > +          - $ref: /schemas/pinctrl/pincfg-node.yaml
> > > +          - $ref: /schemas/pinctrl/pinmux-node.yaml
> > > +        unevaluatedProperties: false
> >=20
> > I think this should be additionalProperties, since you're citing all the
> > properties you do support below.
> >=20
> > > +
> > > +        properties:
> > > +          pins:
> > > +            description:
> > > +              The list of IOs that properties in the pincfg node app=
ly to.
> > > +
> > > +          function:
> > > +            description:
> > > +              A string containing the name of the function to mux for
> > these
> > > +              pins.
> > > +            enum: [ auxpwrgood, gpio, hbled, pe2rst_out ]
> > > +
> > > +          bias-disable: true
> > > +
> > > +          bias-pull-down:
> > > +            type: boolean
> > > +
> > > +          bias-pull-up:
> > > +            oneOf:
> > > +              - type: boolean
> > > +              - enum: [ 600, 900, 1200, 2000 ]
> > > +                description: Pull up RSEL type resistance values (in
> > ohms)
> > > +            description:
> > > +              For normal pull up type there is no need to specify a
> > resistance
> > > +              value, hence this can be specified as a boolean proper=
ty.
> > > +              For RSEL pull up type a resistance value (in ohms) can=
 be
> > added.
> > > +
> > > +          drive-open-drain: true
> > > +
> > > +          drive-push-pull: true
> > > +
> > > +          drive-strength:
> > > +            enum: [ 2, 4, 8, 12 ]
> > > +
> > > +          drive-strength-microamp:
> > > +            enum: [ 2000, 4000, 8000, 12000 ]
> > > +
> > > +          input-debounce-nanoseconds:
> > > +            minimum: 0
> > > +            maximum: 4294967295
> > > +
> > > +          input-disable: true
> > > +
> > > +          input-enable: true
> > > +
> > > +          input-schmitt-enable: true
> > > +
> > > +          input-schmitt-disable: true
> > > +
> > > +          power-source:
> > > +             enum: [ 0, 1, 2 ]
> > > +
> > > +          slew-rate:
> > > +            enum: [ 0, 1 ]
> > > +            default: 0
> > > +            description: |
> > > +                0: slow (half frequency)
> > > +                1: fast
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - resets
> > > +  - interrupts
> > > +  - interrupt-controller
> > > +  - '#interrupt-cells'
> > > +  - gpio-controller
> > > +  - '#gpio-cells'
> > > +  - gpio-ranges
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    soc {
> > > +        #address-cells =3D <2>;
> > > +        #size-cells =3D <2>;
> > > +
> > > +        pinctrl_sys0: pinctrl@13080000 {
> > > +            compatible =3D "starfive,jhb100-sys0-pinctrl";
> > > +            reg =3D <0x0 0x13080000 0x0 0x800>;
> > > +            resets =3D <&sys0crg 2>;
> > > +            interrupts =3D <56>;
> > > +            interrupt-controller;
> > > +            #interrupt-cells =3D <3>;
> > > +            gpio-controller;
> > > +            #gpio-cells =3D <3>;
> > > +            gpio-ranges =3D <&pinctrl_sys0 0 0 0 4>;
> > > +        };
> > > +    };
> > > diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> > > b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> > > new file mode 100644
> > > index 000000000000..6d8f5516a178
> > > --- /dev/null
> > > +++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> > > @@ -0,0 +1,17 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> > > +/*
> > > + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> > > + *
> > > + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > + */
> > > +
> > > +#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
> > > +#define __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
> > > +
> > > +/* sys0 pad numbers */
> > > +#define PADNUM_SYS0_GPIO_A0				0
> > > +#define PADNUM_SYS0_GPIO_A1				1
> > > +#define PADNUM_SYS0_GPIO_A2				2
> > > +#define PADNUM_SYS0_GPIO_A3				3
> >=20
> > Does this provide any actual value? Across the whole series, most numbe=
rs
> > you put in this binding headers do not appear in any drivers at all. Se=
ems like
> > these defines should appear in the dts directly?
>=20
> However, the current series of drivers will use some of these definitions.
>=20
> Copied from patch 12:
> +static const struct pinvref_desc pinvref_desc_sys2[] =3D {
> +	{
> +		.name =3D "gpiow0",
> +		.pin_grp =3D {
> +			PADNUM_SYS2_GPIO_A36,
> +			PADNUM_SYS2_GPIO_A37,
> +			PADNUM_SYS2_GPIO_A38,
> +			PADNUM_SYS2_GPIO_A39
> +		},
> +		.num_pins =3D 4,
> +		.range =3D BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)

Can you explain why you need something like this when you're using pins
and functions? These look a lot like your own home-rolled groups, that
exist just to set the range of permitted values for vref?

As far as I can tell, the only controller that supports something other
than 1.8v and 3.3v is "per2", so you should be able to apply the
restrictions here entirely in the dt-binding?

I notice you have
> > > +          power-source:
> > > +             enum: [ 0, 1, 2 ]
in all bindings, but no explanation of what the values are. That needs
to change, and you should not permit 1 in anything other than "per2",
since that appears to be the only user.

Also, you've not responded to my other comments, one of which was a
question. Why not?

Thanks,
Conor.

> +	},
> +	{
> +		.name =3D "gpiow-inner",
> +		.pin_grp =3D {
> +			PADNUM_SYS2_GPIO_A40,
> +			PADNUM_SYS2_GPIO_A41,
> +			PADNUM_SYS2_GPIO_A42,
> +			PADNUM_SYS2_GPIO_A43
> +		},
> +		.num_pins =3D 4,
> +		.range =3D BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
> +	},
> +	{ NULL },
> +};
>=20
> Therefore, I have uniformly created include/dt-bindings/pinctrl/starfive,=
jhb100-pinctrl.h
>=20
> Best Regards,
> Changhuang
>=20

--sceamiqloubMEw/P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagbJuwAKCRB4tDGHoIJi
0vKZAP93UYHpsiFwsIbT8nCIyOIq7PrtiEIvg72pNnZe8rS6pwD+Mw0r+eFUz/FW
nYYGigbCQ/8gfcNICWqx8xDNK8KMQwk=
=2glK
-----END PGP SIGNATURE-----

--sceamiqloubMEw/P--


--===============7933074767524410233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7933074767524410233==--

