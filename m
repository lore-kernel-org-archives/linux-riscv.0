Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB765C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 20:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3qt1p3lwIHcm5Z+UjO8SGv6uzNZozCu7TcGQKxmGxWg=; b=CR5LwjEfpu7ROe
	QQ5kirRM2wlmDMlTfJz2QAtZ7+e5Cww8lCrk7JOehryPhIwBKUkxZWbP6D4XX3Z+l4dNJr+eIY+Y1
	NKu8pwufwMsCC27ExKt0jVJmDrbxqmXy0bBz/dfM2hbeIyQojQUL7pARYoRmcsrlfnlFRVjkYRTj4
	xBYAAH1aOeFifBgBWrU7Uoz2DveVbaIn64lOZClC77vLbB1WkHyEat8VmPSGsSVYdQzS5lb208n1G
	wRVKpWH2/9NsGkDNWGurvEmIRCpZfnB+bCLCACiPCOvbL+pcJDiBKZJoIE050wNH2izfr8TTvGEcO
	aY8do0BBgV4JrCYkCxog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7j5D-003nEz-Uw; Tue, 20 Dec 2022 20:19:28 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7j59-003nC8-Aj
	for linux-riscv@lists.infradead.org; Tue, 20 Dec 2022 20:19:26 +0000
Received: by mail-oi1-f179.google.com with SMTP id c133so4622095oif.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Dec 2022 12:19:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+xkuoiTx+LpEgW02YNmIVP+hcVgK99rnEV6yAQNpAk=;
        b=gfS9NmDtSbpwPzYIqR2zREqFewF1lO+KbhSmc0H0dAxqzuXI2yyI6WRRhyHyGLpyw2
         PBNAvbxbZTqBWHYIPRnvv66VKtaomRyKKqvGbbQRGyx+RCvpKoYiE1ct2+L46x3bckWd
         nNRtY0ykMm2zo7gAxm3q+qgw3rUBWuUC3DYUBhdfuqkiitXZuog/398ZWKpOTt23wDwY
         lH6jplQeAGJBQfoYHVI2/mnw5svMWr/zEiqka6rm1un6yBdL2yjYDQ+1fIZAu+4Wd3KH
         aCaRABrDjEo/Fzxl3kOYOBvWnI+OhLxHQNTe+68Zd6FRK3LQz5W9FeRkMJzHU0cegyJV
         Rw6w==
X-Gm-Message-State: ANoB5pm3433+N8ciL8mOeek0rTrWnb1NgQMguZF9xbYu2oXsIRyD3gh1
	mu9BQjvDPBf3WqlW+jWFaQ==
X-Google-Smtp-Source: AA0mqf5kvtYfmB2zekg2pHhypZVP0jdIPDHhpLct68rwaJ2tmnBTvciF2tARXoqUIIvVgVfXbdTghw==
X-Received: by 2002:a05:6808:4088:b0:35e:bd7e:c89a with SMTP id db8-20020a056808408800b0035ebd7ec89amr7511579oib.16.1671567561613;
        Tue, 20 Dec 2022 12:19:21 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j9-20020a056808056900b0035a921f2093sm5816162oig.20.2022.12.20.12.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 12:19:21 -0800 (PST)
Received: (nullmailer pid 1018599 invoked by uid 1000);
	Tue, 20 Dec 2022 20:19:20 -0000
Date: Tue, 20 Dec 2022 14:19:20 -0600
From: Rob Herring <robh@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Jianlong Huang <jianlong.huang@starfivetech.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: pinctrl: Add StarFive JH7110 sys
 pinctrl
Message-ID: <20221220201920.GA1012864-robh@kernel.org>
References: <20221220005529.34744-1-hal.feng@starfivetech.com>
 <20221220005529.34744-3-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221220005529.34744-3-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_121923_435583_A1D5F307 
X-CRM114-Status: GOOD (  26.34  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Dec 20, 2022 at 08:55:26AM +0800, Hal Feng wrote:
> From: Jianlong Huang <jianlong.huang@starfivetech.com>
> 
> Add pinctrl bindings for StarFive JH7110 SoC sys pinctrl controller.
> 
> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../pinctrl/starfive,jh7110-sys-pinctrl.yaml  | 142 ++++++++++++++++++
>  MAINTAINERS                                   |   3 +-
>  .../pinctrl/starfive,jh7110-pinctrl.h         | 115 ++++++++++++++
>  3 files changed, 259 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
> new file mode 100644
> index 000000000000..60e616af2201
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
> @@ -0,0 +1,142 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/starfive,jh7110-sys-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 Sys Pin Controller
> +
> +description: |
> +  Bindings for the JH7110 RISC-V SoC from StarFive Technology Ltd.
> +
> +  Out of the SoC's many pins only the ones named PAD_GPIO0 to PAD_GPIO63
> +  can be multiplexed and have configurable bias, drive strength,
> +  schmitt trigger etc.
> +  Some peripherals have their I/O go through the 64 "GPIOs". This also
> +  includes a number of other UARTs, I2Cs, SPIs, PWMs etc.
> +  All these peripherals are connected to all 64 GPIOs such that
> +  any GPIO can be set up to be controlled by any of the peripherals.
> +
> +maintainers:
> +  - Jianlong Huang <jianlong.huang@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-sys-pinctrl
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
> +patternProperties:
> +  '-[0-9]+$':
> +    type: object
> +    patternProperties:
> +      '-pins$':
> +        type: object
> +        description: |
> +          A pinctrl node should contain at least one subnode representing the
> +          pinctrl groups available on the machine. Each subnode will list the
> +          pins it needs, and how they should be configured, with regard to
> +          muxer configuration, system signal configuration, pin groups for
> +          vin/vout module, pin voltage, mux functions for output, mux functions
> +          for output enable, mux functions for input.
> +
> +        properties:
> +          pinmux:
> +            description: |
> +              The list of GPIOs and their mux settings that properties in the
> +              node apply to. This should be set using the GPIOMUX macro.
> +            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/pinmux

Generally, don't reference individual properties. Instead, '-pins$' 
needs a $ref to pinmux-node.yaml.

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
> +          input-enable: true
> +
> +          input-disable: true
> +
> +          input-schmitt-enable: true
> +
> +          input-schmitt-disable: true
> +
> +          slew-rate:
> +            maximum: 1
> +

> +        additionalProperties: false
> +
> +    additionalProperties: false

It's easier to read if you put these at the beginning before a long 
properties section.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - gpio-controller
> +  - '#gpio-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio@13040000 {
> +        compatible = "starfive,jh7110-sys-pinctrl";
> +        reg = <0x13040000 0x10000>;
> +        clocks = <&syscrg 112>;
> +        resets = <&syscrg 2>;
> +        interrupts = <86>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +
> +        uart0-0 {
> +            tx-pins {
> +                pinmux = <0xff140005>;
> +                bias-disable;
> +                drive-strength = <12>;
> +                input-disable;
> +                input-schmitt-disable;
> +                slew-rate = <0>;
> +            };
> +
> +            rx-pins {
> +                pinmux = <0x0E000406>;
> +                bias-pull-up;
> +                drive-strength = <2>;
> +                input-enable;
> +                input-schmitt-enable;
> +                slew-rate = <0>;
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e0ffe584030b..57fd051ff4e8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19645,10 +19645,11 @@ M:	Emil Renner Berthing <kernel@esmil.dk>
>  M:	Jianlong Huang <jianlong.huang@starfivetech.com>
>  L:	linux-gpio@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
> +F:	Documentation/devicetree/bindings/pinctrl/starfive,jh71*.yaml
>  F:	arch/riscv/boot/dts/starfive/jh7110-pinfunc.h
>  F:	drivers/pinctrl/starfive/
>  F:	include/dt-bindings/pinctrl/pinctrl-starfive-jh7100.h
> +F:	include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
>  
>  STARFIVE JH71X0 RESET CONTROLLER DRIVERS
>  M:	Emil Renner Berthing <kernel@esmil.dk>
> diff --git a/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
> new file mode 100644
> index 000000000000..c97dde8e864c
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
> @@ -0,0 +1,115 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +/*
> + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + */
> +
> +#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_JH7110_H__
> +#define __DT_BINDINGS_PINCTRL_STARFIVE_JH7110_H__
> +
> +/* sys_iomux pin */
> +#define	PAD_GPIO0		0
> +#define	PAD_GPIO1		1
> +#define	PAD_GPIO2		2
> +#define	PAD_GPIO3		3
> +#define	PAD_GPIO4		4
> +#define	PAD_GPIO5		5
> +#define	PAD_GPIO6		6
> +#define	PAD_GPIO7		7
> +#define	PAD_GPIO8		8
> +#define	PAD_GPIO9		9
> +#define	PAD_GPIO10		10
> +#define	PAD_GPIO11		11
> +#define	PAD_GPIO12		12
> +#define	PAD_GPIO13		13
> +#define	PAD_GPIO14		14
> +#define	PAD_GPIO15		15
> +#define	PAD_GPIO16		16
> +#define	PAD_GPIO17		17
> +#define	PAD_GPIO18		18
> +#define	PAD_GPIO19		19
> +#define	PAD_GPIO20		20
> +#define	PAD_GPIO21		21
> +#define	PAD_GPIO22		22
> +#define	PAD_GPIO23		23
> +#define	PAD_GPIO24		24
> +#define	PAD_GPIO25		25
> +#define	PAD_GPIO26		26
> +#define	PAD_GPIO27		27
> +#define	PAD_GPIO28		28
> +#define	PAD_GPIO29		29
> +#define	PAD_GPIO30		30
> +#define	PAD_GPIO31		31
> +#define	PAD_GPIO32		32
> +#define	PAD_GPIO33		33
> +#define	PAD_GPIO34		34
> +#define	PAD_GPIO35		35
> +#define	PAD_GPIO36		36
> +#define	PAD_GPIO37		37
> +#define	PAD_GPIO38		38
> +#define	PAD_GPIO39		39
> +#define	PAD_GPIO40		40
> +#define	PAD_GPIO41		41
> +#define	PAD_GPIO42		42
> +#define	PAD_GPIO43		43
> +#define	PAD_GPIO44		44
> +#define	PAD_GPIO45		45
> +#define	PAD_GPIO46		46
> +#define	PAD_GPIO47		47
> +#define	PAD_GPIO48		48
> +#define	PAD_GPIO49		49
> +#define	PAD_GPIO50		50
> +#define	PAD_GPIO51		51
> +#define	PAD_GPIO52		52
> +#define	PAD_GPIO53		53
> +#define	PAD_GPIO54		54
> +#define	PAD_GPIO55		55
> +#define	PAD_GPIO56		56
> +#define	PAD_GPIO57		57
> +#define	PAD_GPIO58		58
> +#define	PAD_GPIO59		59
> +#define	PAD_GPIO60		60
> +#define	PAD_GPIO61		61
> +#define	PAD_GPIO62		62
> +#define	PAD_GPIO63		63
> +#define	PAD_SD0_CLK		64
> +#define	PAD_SD0_CMD		65
> +#define	PAD_SD0_DATA0		66
> +#define	PAD_SD0_DATA1		67
> +#define	PAD_SD0_DATA2		68
> +#define	PAD_SD0_DATA3		69
> +#define	PAD_SD0_DATA4		70
> +#define	PAD_SD0_DATA5		71
> +#define	PAD_SD0_DATA6		72
> +#define	PAD_SD0_DATA7		73
> +#define	PAD_SD0_STRB		74
> +#define	PAD_GMAC1_MDC		75
> +#define	PAD_GMAC1_MDIO		76
> +#define	PAD_GMAC1_RXD0		77
> +#define	PAD_GMAC1_RXD1		78
> +#define	PAD_GMAC1_RXD2		79
> +#define	PAD_GMAC1_RXD3		80
> +#define	PAD_GMAC1_RXDV		81
> +#define	PAD_GMAC1_RXC		82
> +#define	PAD_GMAC1_TXD0		83
> +#define	PAD_GMAC1_TXD1		84
> +#define	PAD_GMAC1_TXD2		85
> +#define	PAD_GMAC1_TXD3		86
> +#define	PAD_GMAC1_TXEN		87
> +#define	PAD_GMAC1_TXC		88
> +#define	PAD_QSPI_SCLK		89
> +#define	PAD_QSPI_CS0		90
> +#define	PAD_QSPI_DATA0		91
> +#define	PAD_QSPI_DATA1		92
> +#define	PAD_QSPI_DATA2		93
> +#define	PAD_QSPI_DATA3		94
> +
> +#define GPOUT_LOW		0
> +#define GPOUT_HIGH		1
> +
> +#define GPOEN_ENABLE		0
> +#define GPOEN_DISABLE		1
> +
> +#define GPI_NONE		255
> +
> +#endif
> -- 
> 2.38.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
