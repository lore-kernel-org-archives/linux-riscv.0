Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF6FC636CC
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 06:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Q149v/EHXJ/djqNeXbn5sifYsYq1gh8Oya2soSikrg=; b=eJMQJRW+ewsLrr
	Hm/52Bi+zyhm9yJVtTohVWUNN/R2VGn7Bqj3meD43uWmEmK0d0qO//h6ng7dK8oh241hiibh9UlqR
	KlgeOz3jZEfs0//cFy6H/fjMGUZg6bRxX8WHPbKVTUNVz4ieJ/AY/QuohPg5lIt+DuzGNRkrA/ga4
	Xr6yf9KDkIkZPN6kFm3B1CN9TSbjyjTdYDBnrbJX1NZsS6aJ+tkX8RlBRYA6z/8z57pPQActunAQE
	8esDH81aLAMJ8JCM9u1sEVoQKanD/RrOoKuBGZFtlDoQUUYGe3urxKibS7JPU07sTNhkT/kIGmsR+
	L3R/H5jGdrQH7mJkCvGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNpnh-000bAr-W0; Fri, 03 Feb 2023 06:43:58 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNpnd-000b9c-JC
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 06:43:56 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 7011224E1E4;
	Fri,  3 Feb 2023 14:43:38 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 3 Feb
 2023 14:43:38 +0800
Received: from [192.168.125.110] (113.72.144.84) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 3 Feb
 2023 14:43:37 +0800
Message-ID: <6133d2bd-ba04-05e3-93f3-1989f84aa17c@starfivetech.com>
Date: Fri, 3 Feb 2023 14:43:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v3 2/5] dt-bindings: pinctrl: Add StarFive JH7110 sys
 pinctrl
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, Conor Dooley <conor@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Linus Walleij
	<linus.walleij@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Jianlong Huang
	<jianlong.huang@starfivetech.com>, <linux-kernel@vger.kernel.org>
References: <20221220005529.34744-1-hal.feng@starfivetech.com>
 <20221220005529.34744-3-hal.feng@starfivetech.com>
 <20221220201920.GA1012864-robh@kernel.org>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20221220201920.GA1012864-robh@kernel.org>
X-Originating-IP: [113.72.144.84]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_224353_960252_7EC0422A 
X-CRM114-Status: GOOD (  20.75  )
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

On Tue, 20 Dec 2022 14:19:20 -0600, Rob Herring wrote:
> On Tue, Dec 20, 2022 at 08:55:26AM +0800, Hal Feng wrote:
>> From: Jianlong Huang <jianlong.huang@starfivetech.com>
>> 
>> Add pinctrl bindings for StarFive JH7110 SoC sys pinctrl controller.
>> 
>> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
>> Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  .../pinctrl/starfive,jh7110-sys-pinctrl.yaml  | 142 ++++++++++++++++++
>>  MAINTAINERS                                   |   3 +-
>>  .../pinctrl/starfive,jh7110-pinctrl.h         | 115 ++++++++++++++
>>  3 files changed, 259 insertions(+), 1 deletion(-)
>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
>>  create mode 100644 include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
>> 
>> diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
>> new file mode 100644
>> index 000000000000..60e616af2201
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
>> @@ -0,0 +1,142 @@
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
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  interrupt-controller: true
>> +
>> +  '#interrupt-cells':
>> +    const: 2
>> +
>> +  gpio-controller: true
>> +
>> +  '#gpio-cells':
>> +    const: 2
>> +
>> +patternProperties:
>> +  '-[0-9]+$':
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
>> +            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/pinmux
> 
> Generally, don't reference individual properties. Instead, '-pins$' 
> needs a $ref to pinmux-node.yaml.

Sorry for the late reply. '-pins$' miss a $ref to pincfg-node.yaml here. I will
add it in the next version. 'pinmux' is not a property in pincfg-node.yaml, but
a property in pinmux-node.yaml, so need a individual reference.

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
> 
>> +        additionalProperties: false
>> +
>> +    additionalProperties: false
> 
> It's easier to read if you put these at the beginning before a long 
> properties section.

Will fix it. Thank you for your feedback.

Best regards,
Hal

> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - interrupts
>> +  - interrupt-controller
>> +  - '#interrupt-cells'
>> +  - gpio-controller
>> +  - '#gpio-cells'
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    gpio@13040000 {
>> +        compatible = "starfive,jh7110-sys-pinctrl";
>> +        reg = <0x13040000 0x10000>;
>> +        clocks = <&syscrg 112>;
>> +        resets = <&syscrg 2>;
>> +        interrupts = <86>;
>> +        interrupt-controller;
>> +        #interrupt-cells = <2>;
>> +        gpio-controller;
>> +        #gpio-cells = <2>;
>> +
>> +        uart0-0 {
>> +            tx-pins {
>> +                pinmux = <0xff140005>;
>> +                bias-disable;
>> +                drive-strength = <12>;
>> +                input-disable;
>> +                input-schmitt-disable;
>> +                slew-rate = <0>;
>> +            };
>> +
>> +            rx-pins {
>> +                pinmux = <0x0E000406>;
>> +                bias-pull-up;
>> +                drive-strength = <2>;
>> +                input-enable;
>> +                input-schmitt-enable;
>> +                slew-rate = <0>;
>> +            };
>> +        };
>> +    };

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
