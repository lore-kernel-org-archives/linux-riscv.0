Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CADC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 01:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8U/Qlc3habsfA1G4tN6977GYhtNermfpUvS2cjeKMc=; b=crim8qeBztl/ZE
	UmnfSW+ki0GCd0HzUO2wqp2ahoI3sLZWGsG0mtTHssohF4uB59WZiaMgSGz6n8Cjz2eYQb+VE9eIZ
	0VIARKQn6Y8uMSJ1T6ZemhcIGbuNtq8/CsBpWM00r3o/3IPERD+PFhb3AfrzC6Mcsr7DJuJaMSF+/
	V+BfTgDFN26gRqAD8Myp8C9bOU2IforF4wwsL+x4WkybtCOLicvHKCkt+oNk1W0d4AF40sGraKYNW
	oBfSql4ve8Iia0QIIXx2yRRAnBy5S161sXiRC2/TeaMGHsxC8cAdVSfZ86angTAWnnmmIK+cR3ZvQ
	SCTF8IkNNwh2YE+MUXaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozSZN-00EYd4-D5; Mon, 28 Nov 2022 01:04:25 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozSZJ-00EYa0-5H
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 01:04:24 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 3206824E235;
	Mon, 28 Nov 2022 09:03:51 +0800 (CST)
Received: from EXMBX065.cuchost.com (172.16.6.65) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 28 Nov
 2022 09:03:51 +0800
Received: from [192.168.125.66] (183.27.97.81) by EXMBX065.cuchost.com
 (172.16.6.65) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 28 Nov
 2022 09:03:50 +0800
Message-ID: <2a2cc5c9-650b-d2c8-f547-a2aadf5c7af4@starfivetech.com>
Date: Mon, 28 Nov 2022 09:04:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 2/5] dt-bindings: pinctrl: Add StarFive JH7110 sys
 pinctrl
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Hal Feng
	<hal.feng@starfivetech.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Linus Walleij
	<linus.walleij@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <linux-kernel@vger.kernel.org>
References: <20221118011108.70715-1-hal.feng@starfivetech.com>
 <20221118011108.70715-3-hal.feng@starfivetech.com>
 <468b06ea-e314-ce51-7fe5-12b83032a382@linaro.org>
From: Jianlong Huang <jianlong.huang@starfivetech.com>
In-Reply-To: <468b06ea-e314-ce51-7fe5-12b83032a382@linaro.org>
X-Originating-IP: [183.27.97.81]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX065.cuchost.com
 (172.16.6.65)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_170421_670343_1B4C8B43 
X-CRM114-Status: GOOD (  18.48  )
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

On 2022/11/21 16:43, Krzysztof Kozlowski wrote:
> On 18/11/2022 02:11, Hal Feng wrote:
>> From: Jianlong Huang <jianlong.huang@starfivetech.com>
>> 
>> Add pinctrl bindings for StarFive JH7110 SoC sys pinctrl controller.
>> 
>> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  .../pinctrl/starfive,jh7110-sys-pinctrl.yaml  | 165 ++++++++++++++++++
>>  1 file changed, 165 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
>> new file mode 100644
>> index 000000000000..79623f884a9c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
>> @@ -0,0 +1,165 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/starfive,jh7110-sys-pinctrl.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: StarFive JH7110 Sys Pin Controller
>> +
>> +description: |
>> +  Bindings for the JH7110 RISC-V SoC from StarFive Technology Ltd.
>> +
>> +  Out of the SoC's many pins only the ones named PAD_GPIO0 to PAD_GPIO63
>> +  can be multiplexed and have configurable bias, drive strength,
>> +  schmitt trigger etc.
>> +  Some peripherals have their I/O go through the 64 "GPIOs". This also
>> +  includes a number of other UARTs, I2Cs, SPIs, PWMs etc.
>> +  All these peripherals are connected to all 64 GPIOs such that
>> +  any GPIO can be set up to be controlled by any of the peripherals.
>> +
>> +maintainers:
>> +  - Jianlong Huang <jianlong.huang@starfivetech.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: starfive,jh7110-sys-pinctrl
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  reg-names:
>> +    items:
>> +      - const: control
> 
> Why reg-names for one entry? Perhaps just drop it.

Will fix, drop it.

> 
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  gpio-controller: true
>> +
>> +  "#gpio-cells":
>> +    const: 2
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +    description: The GPIO parent interrupt.
> 
> Drop description, it's obvious.

Will fix, drop it.

> 
>> +
>> +  interrupt-controller: true
>> +
>> +  "#interrupt-cells":
>> +    const: 2
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - gpio-controller
>> +  - "#gpio-cells"
>> +  - interrupts
>> +  - interrupt-controller
>> +  - "#interrupt-cells"
>> +
>> +patternProperties:
>> +  '-[0-9]+$':
> 
> Keep consistent quotes, either ' or "
> 
> How do you differentiate hogs? The pattern is a bit unspecific.

Will fix.
Keep consisitent quotes, use '

> 
>> +    type: object
>> +    patternProperties:
>> +      '-pins$':
>> +        type: object
>> +        description: |
>> +          A pinctrl node should contain at least one subnode representing the
>> +          pinctrl groups available on the machine. Each subnode will list the
>> +          pins it needs, and how they should be configured, with regard to
>> +          muxer configuration, system signal configuration, pin groups for
>> +          vin/vout module, pin voltage, mux functions for output, mux functions
>> +          for output enable, mux functions for input.
>> +
>> +        properties:
>> +          pinmux:
>> +            description: |
>> +              The list of GPIOs and their mux settings that properties in the
>> +              node apply to. This should be set using the GPIOMUX macro.
>> +            $ref: "/schemas/pinctrl/pinmux-node.yaml#/properties/pinmux"
> 
> Drop quotes.

Will fix, drop quotes.

> 
>> +
>> +          bias-disable: true
>> +
>> +          bias-pull-up:
>> +            type: boolean
>> +
>> +          bias-pull-down:
>> +            type: boolean
>> +
>> +          drive-strength:
>> +            enum: [ 2, 4, 8, 12 ]
>> +
>> +          input-enable: true
>> +
>> +          input-disable: true
>> +
>> +          input-schmitt-enable: true
>> +
>> +          input-schmitt-disable: true
>> +
>> +          slew-rate:
>> +            maximum: 1
>> +
>> +        additionalProperties: false
>> +
>> +    additionalProperties: false
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/starfive-jh7110.h>
>> +    #include <dt-bindings/reset/starfive-jh7110.h>
>> +    #include <dt-bindings/pinctrl/pinctrl-starfive-jh7110.h>
>> +
>> +        soc {
> 
> Use 4 spaces for example indentation.

Will fix.

> 
>> +                #address-cells = <2>;
>> +                #size-cells = <2>;
>> +
>> +                gpio: gpio@13040000 {
>> +                        compatible = "starfive,jh7110-sys-pinctrl";
>> +                        reg = <0x0 0x13040000 0x0 0x10000>;
>> +                        reg-names = "control";
>> +                        clocks = <&syscrg_clk JH7110_SYSCLK_IOMUX>;
>> +                        resets = <&syscrg_rst JH7110_SYSRST_IOMUX>;
>> +                        interrupts = <86>;
>> +                        interrupt-controller;
>> +                        #interrupt-cells = <2>;
>> +                        #gpio-cells = <2>;
>> +                        gpio-controller;
>> +                        status = "okay";
> 
> No status in examples.

Will fix, drop it.

> 
>> +
>> +                        uart0_pins: uart0-0 {
>> +                                tx-pins {
>> +                                        pinmux = <GPIOMUX(5, GPOUT_SYS_UART0_TX, GPOEN_ENABLE, GPI_NONE)>;
>> +                                        bias-disable;
>> +                                        drive-strength = <12>;
>> +                                        input-disable;
>> +                                        input-schmitt-disable;
>> +                                        slew-rate = <0>;
>> +                                };
>> +
>> +                                rx-pins {
>> +                                        pinmux = <GPIOMUX(6, GPOUT_LOW, GPOEN_DISABLE, GPI_SYS_UART0_RX)>;
>> +                                        bias-pull-up;
>> +                                        drive-strength = <2>;
>> +                                        input-enable;
>> +                                        input-schmitt-enable;
>> +                                        slew-rate = <0>;
>> +                                };
>> +                        };
>> +                };
>> +
>> +                uart0 {
>> +                        pinctrl-names = "default";
>> +                        pinctrl-0 = <&uart0_pins>;
>> +                        status = "okay";
> 
> Drop this node, useless.

Will fix, drop this node.

> 
>> +                };
>> +        };
>> +
>> +...
> 

Best regards,
Jianlong Huang



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
