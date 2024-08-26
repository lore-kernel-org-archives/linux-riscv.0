Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C7CC5320E
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 03:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A+y4VqjpPXVmIKUc7dl2rDHro46nHnt/nhESoCwbaQw=; b=G4czLp5NWVGTWZ
	UaaxDCD6Ngcgk0/nCZCh8m2uzs2+VcMiooSIiTMIrKlVK9tvbpWj0TgAUYAj+Zp+r9NxSNW5G3kX+
	OdmsdVnOX3kEDgRSZo9PZI1kYLSfeUYfolQcvtnC1wr/akSQrY5dXMrxgZao2EmCKbX9r3uXUIaXA
	JEd2HwxBQ8L3EG3ByhmzbU1SeuSUfB/3Qygu0xdlaM3AMSGhxKyi6P1mOmY5WF7g1whRotY/w9+zQ
	qdFm9BaO8GBsGb2eMOza5jclbq0ry48Ikfs9BUVi+Lx2RR8PWvT9jCiJhjLAMUNxxhAwnk/NABotw
	QTZYkFxpYuRccV6JQR6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siQ72-00000005cUn-49xX;
	Mon, 26 Aug 2024 03:09:48 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siQ6y-00000005cUF-1N4H
	for linux-riscv@lists.infradead.org;
	Mon, 26 Aug 2024 03:09:46 +0000
Date: Mon, 26 Aug 2024 03:09:39 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-binding: pinctrl: spacemit: add documents for
 K1 SoC
Message-ID: <20240826030939.GYB22924.dlan.gentoo>
References: <20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org>
 <20240825-02-k1-pinctrl-v2-1-ddd38a345d12@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240825-02-k1-pinctrl-v2-1-ddd38a345d12@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_200944_426008_0F432BE5 
X-CRM114-Status: GOOD (  21.93  )
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
Cc: devicetree@vger.kernel.org, Meng Zhang <zhangmeng.kevin@spacemit.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 13:10 Sun 25 Aug     , Yixun Lan wrote:
> Add dt-binding for the pinctrl driver of SpacemiT's K1 SoC.
> 
> Two vendor specific properties are introduced here, As the pinctrl
> has dedicated slew rate enable control - bit[7], so we have
> spacemit,slew-rate-{enable,disable} for this. For the same reason,
> creating spacemit,strong-pull-up for the strong pull up control.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      | 134 +++++++++++++++++
>  include/dt-bindings/pinctrl/spacemit,k1-pinctrl.h  | 161 +++++++++++++++++++++
>  2 files changed, 295 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> new file mode 100644
> index 0000000000000..8adfc5ebbce37
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> @@ -0,0 +1,134 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SpacemiT K1 SoC Pin Controller
> +
> +maintainers:
> +  - Yixun Lan <dlan@gentoo.org>
> +
> +properties:
> +  compatible:
> +    const: spacemit,k1-pinctrl
> +
> +  reg:
> +    items:
> +      - description: pinctrl io memory base
> +
> +patternProperties:
> +  '-cfg$':
> +    type: object
> +    description: |
> +      A pinctrl node should contain at least one subnode representing the
> +      pinctrl groups available on the machine.
> +
> +    additionalProperties: false
> +
> +    patternProperties:
> +      '-pins$':
> +        type: object
> +        description: |
> +          Each subnode will list the pins it needs, and how they should
> +          be configured, with regard to muxer configuration, bias, input
> +          enable/disable, input schmitt trigger, slew-rate enable/disable,
> +          slew-rate, drive strength, power source.
> +        $ref: /schemas/pinctrl/pincfg-node.yaml
> +
> +        allOf:
> +          - $ref: pincfg-node.yaml#
> +          - $ref: pinmux-node.yaml#
> +
> +        properties:
> +          pinmux:
> +            description: |
> +              The list of GPIOs and their mux settings that properties in the
> +              node apply to. This should be set using the K1_PADCONF macro to
> +              construct the value.
> +            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/pinmux
> +
> +          bias-disable: true
> +
> +          bias-pull-up: true
> +
> +          bias-pull-down: true
> +
> +          drive-strength-microamp:
just realise here should use 'drive-strength' which will comply to hw
will fix in next version

> +            description: |
> +              typical current when output high level, but in mA.
> +              1.8V output: 11, 21, 32, 42 (mA)
> +              3.3V output: 7, 10, 13, 16, 19, 23, 26, 29 (mA)
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +
> +          input-schmitt:
> +            description: |
> +              typical threshold for schmitt trigger.
> +              0: buffer mode
> +              1: trigger mode
> +              2, 3: trigger mode
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1, 2, 3]
> +
> +          power-source:
> +            description: external power supplies at 1.8v or 3.3v.
> +            enum: [ 1800, 3300 ]
> +
> +          slew-rate:
> +            description: |
> +              slew rate for output buffer
> +              0, 1: Slow speed
> +              2: Medium speed
> +              3: Fast speed
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1, 2, 3]
> +
> +          spacemit,slew-rate-enable:
> +            description: enable slew rate.
> +            type: boolean
> +
> +          spacemit,slew-rate-disable:
> +            description: disable slew rate.
> +            type: boolean
> +
> +          spacemit,strong-pull-up:
> +            description: enable strong pull up.
> +            type: boolean
> +
> +        required:
> +          - pinmux
> +
> +        additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/pinctrl/spacemit,k1-pinctrl.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        pinctrl@d401e000 {
> +            compatible = "spacemit,k1-pinctrl";
> +            reg = <0x0 0xd401e000 0x0 0x400>;
> +            #pinctrl-cells = <2>;
> +            #gpio-range-cells = <3>;
> +
> +            uart0_2_cfg: uart0-2-cfg {
> +                uart0-2-pins {
> +                    pinmux = <K1_PADCONF(GPIO_68, 2)>,
> +                             <K1_PADCONF(GPIO_69, 2)>;
> +                    bias-pull-up;
> +                    drive-strength-microamp = <32>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/include/dt-bindings/pinctrl/spacemit,k1-pinctrl.h b/include/dt-bindings/pinctrl/spacemit,k1-pinctrl.h
> new file mode 100644
> index 0000000000000..13ef4aa6c53a3
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/spacemit,k1-pinctrl.h
> @@ -0,0 +1,161 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright (c) 2022-2024 SpacemiT (Hangzhou) Technology Co. Ltd
> + * Copyright (c) 2024 Yixun Lan <dlan@gentoo.org>
> + *
> + */
> +
> +#ifndef _DT_BINDINGS_PINCTRL_K1_H
> +#define _DT_BINDINGS_PINCTRL_K1_H
> +
> +#define PINMUX(pin, mux) \
> +	(((pin) & 0xffff) | (((mux) & 0xff) << 16))
> +
> +/* pin offset */
> +#define PINID(x)	((x) + 1)
> +
> +#define GPIO_INVAL  0
> +#define GPIO_00     PINID(0)
> +#define GPIO_01     PINID(1)
> +#define GPIO_02     PINID(2)
> +#define GPIO_03     PINID(3)
> +#define GPIO_04     PINID(4)
> +#define GPIO_05     PINID(5)
> +#define GPIO_06     PINID(6)
> +#define GPIO_07     PINID(7)
> +#define GPIO_08     PINID(8)
> +#define GPIO_09     PINID(9)
> +#define GPIO_10     PINID(10)
> +#define GPIO_11     PINID(11)
> +#define GPIO_12     PINID(12)
> +#define GPIO_13     PINID(13)
> +#define GPIO_14     PINID(14)
> +#define GPIO_15     PINID(15)
> +#define GPIO_16     PINID(16)
> +#define GPIO_17     PINID(17)
> +#define GPIO_18     PINID(18)
> +#define GPIO_19     PINID(19)
> +#define GPIO_20     PINID(20)
> +#define GPIO_21     PINID(21)
> +#define GPIO_22     PINID(22)
> +#define GPIO_23     PINID(23)
> +#define GPIO_24     PINID(24)
> +#define GPIO_25     PINID(25)
> +#define GPIO_26     PINID(26)
> +#define GPIO_27     PINID(27)
> +#define GPIO_28     PINID(28)
> +#define GPIO_29     PINID(29)
> +#define GPIO_30     PINID(30)
> +#define GPIO_31     PINID(31)
> +
> +#define GPIO_32     PINID(32)
> +#define GPIO_33     PINID(33)
> +#define GPIO_34     PINID(34)
> +#define GPIO_35     PINID(35)
> +#define GPIO_36     PINID(36)
> +#define GPIO_37     PINID(37)
> +#define GPIO_38     PINID(38)
> +#define GPIO_39     PINID(39)
> +#define GPIO_40     PINID(40)
> +#define GPIO_41     PINID(41)
> +#define GPIO_42     PINID(42)
> +#define GPIO_43     PINID(43)
> +#define GPIO_44     PINID(44)
> +#define GPIO_45     PINID(45)
> +#define GPIO_46     PINID(46)
> +#define GPIO_47     PINID(47)
> +#define GPIO_48     PINID(48)
> +#define GPIO_49     PINID(49)
> +#define GPIO_50     PINID(50)
> +#define GPIO_51     PINID(51)
> +#define GPIO_52     PINID(52)
> +#define GPIO_53     PINID(53)
> +#define GPIO_54     PINID(54)
> +#define GPIO_55     PINID(55)
> +#define GPIO_56     PINID(56)
> +#define GPIO_57     PINID(57)
> +#define GPIO_58     PINID(58)
> +#define GPIO_59     PINID(59)
> +#define GPIO_60     PINID(60)
> +#define GPIO_61     PINID(61)
> +#define GPIO_62     PINID(62)
> +#define GPIO_63     PINID(63)
> +
> +#define GPIO_64     PINID(64)
> +#define GPIO_65     PINID(65)
> +#define GPIO_66     PINID(66)
> +#define GPIO_67     PINID(67)
> +#define GPIO_68     PINID(68)
> +#define GPIO_69     PINID(69)
> +#define GPIO_70     PINID(70)
> +#define GPIO_71     PINID(71)
> +#define GPIO_72     PINID(72)
> +#define GPIO_73     PINID(73)
> +#define GPIO_74     PINID(74)
> +#define GPIO_75     PINID(75)
> +#define GPIO_76     PINID(76)
> +#define GPIO_77     PINID(77)
> +#define GPIO_78     PINID(78)
> +#define GPIO_79     PINID(79)
> +#define GPIO_80     PINID(80)
> +#define GPIO_81     PINID(81)
> +#define GPIO_82     PINID(82)
> +#define GPIO_83     PINID(83)
> +#define GPIO_84     PINID(84)
> +#define GPIO_85     PINID(85)
> +
> +#define GPIO_101    PINID(89)
> +#define GPIO_100    PINID(90)
> +#define GPIO_99     PINID(91)
> +#define GPIO_98     PINID(92)
> +#define GPIO_103    PINID(93)
> +#define GPIO_102    PINID(94)
> +
> +#define GPIO_104    PINID(109)
> +#define GPIO_105    PINID(110)
> +#define GPIO_106    PINID(111)
> +#define GPIO_107    PINID(112)
> +#define GPIO_108    PINID(113)
> +#define GPIO_109    PINID(114)
> +#define GPIO_110    PINID(115)
> +
> +#define GPIO_93     PINID(116)
> +#define GPIO_94     PINID(117)
> +#define GPIO_95     PINID(118)
> +#define GPIO_96     PINID(119)
> +#define GPIO_97     PINID(120)
> +
> +#define GPIO_86     PINID(122)
> +#define GPIO_87     PINID(123)
> +#define GPIO_88     PINID(124)
> +#define GPIO_89     PINID(125)
> +#define GPIO_90     PINID(126)
> +#define GPIO_91     PINID(127)
> +#define GPIO_92     PINID(128)
> +
> +#define GPIO_111    PINID(130)
> +#define GPIO_112    PINID(131)
> +#define GPIO_113    PINID(132)
> +#define GPIO_114    PINID(133)
> +#define GPIO_115    PINID(134)
> +#define GPIO_116    PINID(135)
> +#define GPIO_117    PINID(136)
> +#define GPIO_118    PINID(137)
> +#define GPIO_119    PINID(138)
> +#define GPIO_120    PINID(139)
> +#define GPIO_121    PINID(140)
> +#define GPIO_122    PINID(141)
> +#define GPIO_123    PINID(142)
> +#define GPIO_124    PINID(143)
> +#define GPIO_125    PINID(144)
> +#define GPIO_126    PINID(145)
> +#define GPIO_127    PINID(146)
> +
> +#define SLEW_RATE_SLOW0		0
> +#define SLEW_RATE_SLOW1		1
> +#define SLEW_RATE_MEDIUM	2
> +#define SLEW_RATE_FAST		3
> +
> +#define K1_PADCONF(pin, func) (((pin) << 16) | (func))
> +
> +#endif /* _DT_BINDINGS_PINCTRL_K1_H */
> 
> -- 
> 2.45.2

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
