Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CD2CD343E
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 15:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OjIzC0rPfgRyEt5wAZTTgNLfDCmx+0fRWh+Ct0tLFjU=; b=VUh+ISPLQbmGQW
	cPqm9edE30EYLOqZpyVte4ZQBCNhZRaTNNqvlSCE4ai1NWQuTRp+yMfq5N3+BBtsvLXIC0xS0UDwg
	SfGzq8Z8pSkE8ZlmmaZFWDN0knwRfIdrHXR+EmO/SwhDlFueWWtyQI4TiU7ElV6B7ko9tlr8B41ok
	864gjJVm9zDpuyYCRN/IUZVNm9FP3N1/Z1r9VBUwJMGt3Vmh/PJ4HoPpdbwZ4gt62h6YheDF/De9r
	2nWZM98Vhgmev8qjmY26U1K8v1k2Ilw7gymyx7JJFxcFRTDAinKx+rY5ftmKJaFvo8lvTlqah331A
	AaCUrGLSSKNbiRbhj+fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slVIx-00000000naf-14tc;
	Tue, 03 Sep 2024 15:18:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slVIt-00000000nYf-3f4C
	for linux-riscv@lists.infradead.org;
	Tue, 03 Sep 2024 15:18:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CCC395C59E6;
	Tue,  3 Sep 2024 15:18:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C554BC4CEC4;
	Tue,  3 Sep 2024 15:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725376726;
	bh=KjfS86PFrrzBccvKSo00f6geSxiz6DpoalzH4tV6qKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hajlWzrFyqkD1wZavYtTAVS4BjsI3w9FwZHtfEv3D2QoL3Xi6XwUpSp6sExiEEZgd
	 6Rod9J5ADvmLEaZWXNVyLDsOWuMpI39BkLhXqwZayoAZ+0+P9p/tR8LwrPAYBgnKBx
	 SUzYW1XngjdNwWMLYowYjc2o3MumtkzQ7cqIrqr+Pf5eyTmYTeTP4a+iuh27wStmDk
	 Su6tGMKneFMVrHkQveXWmWmnad4OPiaRgP/RpswNBmbriLraixlvcdMz/0l7kfJKw5
	 z0JKn3m5PzsWnr2mzl61sZNSbw7KlNP1oYx7A08ws3SPBjxoIJP6u38tnC8zuivxEw
	 go/HxekI3Gqqg==
Date: Tue, 3 Sep 2024 10:18:45 -0500
From: Rob Herring <robh@kernel.org>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: pinctrl: Add thead,th1520-pinctrl
 bindings
Message-ID: <20240903151845.GA1031888-robh@kernel.org>
References: <20240902-th1520-pinctrl-v1-0-639bf83ef50a@tenstorrent.com>
 <20240902-th1520-pinctrl-v1-1-639bf83ef50a@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240902-th1520-pinctrl-v1-1-639bf83ef50a@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_081848_025165_E18A1C2F 
X-CRM114-Status: GOOD (  30.07  )
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

On Mon, Sep 02, 2024 at 09:06:54PM -0700, Drew Fustini wrote:
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> 
> Add bindings for the pin controllers on the T-Head TH1520 RISC-V SoC.
> 
> Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> [dfustini: use a single compatible for all pin controller instances]
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
>  .../bindings/pinctrl/thead,th1520-pinctrl.yaml     | 165 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 166 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> new file mode 100644
> index 000000000000..429cc0bc1100
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> @@ -0,0 +1,165 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/thead,th1520-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: T-Head TH1520 SoC pin controller
> +
> +maintainers:
> +  - Emil Renner Berthing <emil.renner.berthing@canonical.com>
> +
> +description: |
> +  Pinmux and pinconf controller in the T-Head TH1520 RISC-V SoC.
> +
> +  The TH1520 has 3 groups of pads each controlled from different memory ranges.
> +  Confusingly the memory ranges are named
> +    PADCTRL_AOSYS  -> PAD Group 1
> +    PADCTRL1_APSYS -> PAD Group 2
> +    PADCTRL0_APSYS -> PAD Group 3
> +
> +  Each pad can be muxed individually to up to 6 different functions. For most
> +  pads only a few of those 6 configurations are valid though, and a few pads in
> +  group 1 does not support muxing at all.
> +
> +  Pinconf is fairly regular except for a few pads in group 1 that either can't
> +  be configured or has some special functions. The rest have configurable drive
> +  strength, input enable, schmitt trigger, slew rate, pull-up and pull-down in
> +  addition to a special strong pull up.
> +
> +  Certain pads in group 1 can be muxed to AUDIO_PA0 - AUDIO_PA30 functions and
> +  are then meant to be used by the audio co-processor. Each such pad can then
> +  be further muxed to either audio GPIO or one of 4 functions such as UART, I2C
> +  and I2S. If the audio pad is muxed to one of the 4 functions then pinconf is
> +  also configured in different registers. All of this is done from a different
> +  AUDIO_IOCTRL memory range and is left to the audio co-processor for now.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - thead,th1520-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +patternProperties:
> +  '-[0-9]+$':
> +    type: object
> +
> +    additionalProperties: false
> +
> +    patternProperties:
> +      '-pins$':
> +        type: object
> +        $ref: /schemas/pinctrl/pincfg-node.yaml
> +
> +        additionalProperties: false
> +
> +        description:
> +          A pinctrl node should contain at least one subnode describing one
> +          or more pads and their associated pinmux and pinconf settings.
> +
> +        properties:
> +          pins:
> +            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/pins

No, we generally don't reference individual properties across schemas. 
Add a reference to pinmux-node.yaml for the node.

> +            description: List of pads that properties in the node apply to.
> +
> +          function:
> +            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/function
> +            enum: [ gpio, pwm, uart, ir, i2c, spi, qspi, sdio, audio, i2s,
> +                    gmac0, gmac1, dpu0, dpu1, isp, hdmi, bootsel, debug,
> +                    clock, jtag, iso7816, efuse, reset ]
> +            description: The mux function to select for the given pins.
> +
> +          bias-disable: true
> +
> +          bias-pull-up:
> +            oneOf:
> +              - type: boolean
> +                description: Enable the regular 48kOhm pull-up
> +              - enum: [ 2100, 48000 ]
> +                description: Enable the strong 2.1kOhm pull-up or regular 48kOhm pull-up
> +
> +          bias-pull-down:
> +            oneOf:
> +              - type: boolean
> +              - const: 44000
> +            description: Enable the regular 44kOhm pull-down
> +
> +          drive-strength:
> +            enum: [ 1, 2, 3, 5, 7, 8, 10, 12, 13, 15, 16, 18, 20, 21, 23, 25 ]
> +            description: Drive strength in mA
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
> +        required:
> +          - pins
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +
> +examples:
> +  - |
> +    padctrl0_apsys: pinctrl@ec007000 {
> +        compatible = "thead,th1520-pinctrl";
> +        reg = <0xec007000 0x1000>;
> +        clocks = <&apb_clk>;
> +
> +        uart0_pins: uart0-0 {
> +            tx-pins {
> +                pins = "UART0_TXD";
> +                function = "uart";
> +                bias-disable;
> +                drive-strength = <3>;
> +                input-disable;
> +                input-schmitt-disable;
> +                slew-rate = <0>;
> +            };
> +
> +            rx-pins {
> +                pins = "UART0_RXD";
> +                function = "uart";
> +                bias-disable;
> +                drive-strength = <1>;
> +                input-enable;
> +                input-schmitt-enable;
> +                slew-rate = <0>;
> +            };
> +        };
> +    };
> +
> +    padctrl1_apsys: pinctrl@e7f3c000 {
> +        compatible = "thead,th1520-pinctrl";
> +        reg = <0xe7f3c000 0x1000>;
> +        clocks = <&apb_clk>;
> +
> +        i2c5_pins: i2c5-0 {
> +            i2c-pins {
> +                pins = "QSPI1_CSN0",    /* I2C5_SCL */
> +                       "QSPI1_D0_MOSI"; /* I2C5_SDA */
> +                function = "i2c";
> +                bias-pull-up = <2100>;
> +                drive-strength = <7>;
> +                input-enable;
> +                input-schmitt-enable;
> +                slew-rate = <0>;
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 878dcd23b331..a73953c0f080 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19700,6 +19700,7 @@ L:	linux-riscv@lists.infradead.org
>  S:	Maintained
>  T:	git https://github.com/pdp7/linux.git
>  F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
> +F:	Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
>  F:	arch/riscv/boot/dts/thead/
>  F:	drivers/clk/thead/clk-th1520-ap.c
>  F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
> 
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
