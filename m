Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E104DC3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 19:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lW3BaD0X+0gnVdOoossIWtrfzMhfTD4g1fIeW+ewwHw=; b=q+LVAChHtzjUKQ
	6tCqWi1tsAbvR9NExNmMBI5CrYU2dPJ+AFnq7GCbx8F1b5oWMRPPJcRc2oup9SHnlH9TRGWUiu+vG
	WCsqoHsV33LJYT0ZK08vbLX7O/H9p+9SfvfaQCq/9CnKa8UiiYoJrh9yqSWI7tKSM6xu/GbOuoG0y
	DWXlmRQbAhTz3KFWLYCl44p1CBpQoed3byQeXZwJ71lAfwSZQA2matvzgK3G5g/n6pEjF0d3W1ySj
	HLLk3atjJoFtZyqf8unhyqUL2OtBKnMG4xaRuMUE4TZ3V4wTQHJ+e8nqVTduyOBw3BoWNFIwWurBa
	iqNxwlCU96NSimJ//tYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWLEt-0000000DLbT-1NV5;
	Tue, 23 Jul 2024 19:31:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWLEp-0000000DLb1-48lB
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jul 2024 19:31:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3D5BF60DE1;
	Tue, 23 Jul 2024 19:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9935AC4AF09;
	Tue, 23 Jul 2024 19:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721763114;
	bh=o1cb58zWoAaLX2YYfI9NTmLR6gYzz9BPPWEXcPeG9/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AYoOLh+7TYQJc8U8Br1/u5SBbyXf2UbMOJ6oyP++MfP7T4QNuGQs/LPyiFH23jOdz
	 rEIPdBPysN2nPhc3C8xtXsomq2tATsVnS7YBUGfqRpbAB5OTqOPOv95pbBonuFkhse
	 9P49cIoajoXlfCKajyjLr2+zOiZx8F9VOtupCYCZT3s1/V4Fv/ZAIt6qz/tIUvSIOi
	 H+gkxmYrS3irUhFv0UTSKuw6QJ8ZB/h/h7ESMfWyNYuGOQMTukEmisRQVcKiPfK8rG
	 X5JiIm+VpXoSMUVgGsvsfFYXP/vhvuzKA9Rdob71yF3AcoBf4sDtlNPjNxChqcmmN5
	 KbQuX9UgC/3vg==
Date: Tue, 23 Jul 2024 13:31:53 -0600
From: Rob Herring <robh@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Drew Fustini <dfustini@baylibre.com>, Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/7] dt-bindings: pinctrl: Add pinctrl for Sophgo
 CV1800 series SoC.
Message-ID: <20240723193153.GA992922-robh@kernel.org>
References: <IA1PR20MB49535F9918829FA524BDB02ABBA82@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953E686117C52C2B4EF35C3BBA82@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB4953E686117C52C2B4EF35C3BBA82@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_123156_182194_36ECFD13 
X-CRM114-Status: GOOD (  22.38  )
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

On Mon, Jul 22, 2024 at 09:39:20AM +0800, Inochi Amaoto wrote:
> Add pinctrl support for Sophgo CV1800 series SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  .../pinctrl/sophgo,cv1800-pinctrl.yaml        | 129 ++++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-cv1800b.h |  63 +++++++++
>  include/dt-bindings/pinctrl/pinctrl-cv1812h.h | 127 +++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-cv18xx.h  |  19 +++
>  include/dt-bindings/pinctrl/pinctrl-sg2000.h  | 127 +++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-sg2002.h  |  79 +++++++++++
>  6 files changed, 544 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1800b.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1812h.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv18xx.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2000.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2002.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
> new file mode 100644
> index 000000000000..e6bd271ad22d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
> @@ -0,0 +1,129 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/sophgo,cv1800-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo CV1800 Pin Controller
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@outlook.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sophgo,cv1800b-pinctrl
> +      - sophgo,cv1812h-pinctrl
> +      - sophgo,sg2000-pinctrl
> +      - sophgo,sg2002-pinctrl
> +
> +  reg:
> +    items:
> +      - description: pinctrl for system domain
> +      - description: pinctrl for rtc domain
> +
> +  reg-names:
> +    items:
> +      - const: sys
> +      - const: rtc
> +
> +  resets:
> +    maxItems: 1
> +
> +patternProperties:
> +  '-cfg$':
> +    type: object
> +    description: |

Don't need '|' if no formatting.

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
> +          enable/disable, input schmitt trigger, slew-rate, drive strength
> +          and bus hold state. In addition, all pins in the same subnode
> +          should have the same power domain. For configuration detail,
> +          refer to https://github.com/sophgo/sophgo-doc/.
> +        $ref: /schemas/pinctrl/pincfg-node.yaml
> +
> +        properties:
> +          pinmux:
> +            description: |
> +              The list of GPIOs and their mux settings that properties in the
> +              node apply to. This should be set using the GPIOMUX or GPIOMUX2
> +              macro.
> +            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/pinmux

You already referenced this above which is the right way. Drop this 
$ref.

> +
> +          bias-pull-up:
> +            type: boolean
> +
> +          bias-pull-down:
> +            type: boolean
> +
> +          drive-strength:
> +            description: typical current when output high level, but in mA.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +
> +          drive-strength-microamp:
> +            description: typical current when output high level.

New binding, why do you need both of these properties? Use the latter.

> +
> +          input-schmitt-microvolt:
> +            description: typical threshold for schmitt trigger.

No constraints?

> +
> +          power-source:
> +            description: power supplies at X mV.
> +            enum: [ 1800, 3300 ]
> +
> +          slew-rate:
> +            description: slew rate for output buffer (0 is fast, 1 is slow)
> +            enum: [ 0, 1 ]
> +
> +          bias-bus-hold:
> +            type: boolean
> +
> +        required:
> +          - pinmux
> +          - power-source
> +
> +        additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
> +
> +    soc {
> +        #address-cells = <1>;
> +        #size-cells = <1>;

You can remove 'soc' node from the example. 1 cell is the default for 
examples.

> +
> +        pinctrl@3001000 {
> +            compatible = "sophgo,cv1800b-pinctrl";
> +            reg = <0x03001000 0x1000>,
> +                  <0x05027000 0x1000>;
> +            reg-names = "sys", "rtc";
> +
> +            uart0_cfg: uart0-cfg {
> +                uart0-pins {
> +                    pinmux = <PINMUX(PIN_UART0_TX, 0)>,
> +                             <PINMUX(PIN_UART0_RX, 0)>;
> +                    bias-pull-up;
> +                    drive-strength = <2>;
> +                    power-source = <3300>;
> +                    slew-rate = <0>;
> +                };
> +            };
> +        };
> +    };
> +
> +...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
