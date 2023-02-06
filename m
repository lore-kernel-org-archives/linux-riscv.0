Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB916C636D3
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 16:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ogPJe3LV8yCS2KEyNtkFPlbhwrVt8Phj8EEfIB1XCw=; b=rovW4vGLLrHych
	bpNgWAl8AvcnILFWbcgID8/lEqvz62DS9uVrU8RKZoA/7ESPDItyaV0yEXITqlPB9ZiSnEG0X5/jy
	HiXC1HjxO5jPCO0P1KrrBnnBH4R0Hfu/DmUKYDws/hlXP3jhZ1H3qP3La22iqki1yevmVXeEGzi+Z
	1GklWgqDeMqDlN494Vjvhhz9RC4VEhtiPnkSHH6d+mcmTvBnOKPdCFZOTXNjSBAsJ45d6T/72LsFa
	YS2nQny7fy9hJ0NkASMVN+fxKwOBNWIGrhO06nZ6DMtP+2VSKDrUCpRMLkGmKOoLnhMOchPxQ+lGe
	TjFd3SyObxXuhzjUHMjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP4P6-009KzL-NP; Mon, 06 Feb 2023 16:31:40 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP4P1-009KqW-9F
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 16:31:38 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 2305724E01A;
	Tue,  7 Feb 2023 00:30:44 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Feb
 2023 00:30:44 +0800
Received: from [172.16.16.234] (113.72.145.145) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Feb
 2023 00:30:43 +0800
Message-ID: <ca8fb8fd-aa1a-bcef-122f-83bc8647d01d@starfivetech.com>
Date: Tue, 7 Feb 2023 00:30:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 1/4] dt-bindings: pinctrl: Add StarFive JH7110 sys
 pinctrl
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, Conor Dooley <conor@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Linus Walleij
	<linus.walleij@linaro.org>, Andreas Schwab <schwab@suse.de>, "Emil Renner
 Berthing" <emil.renner.berthing@canonical.com>, Jianlong Huang
	<jianlong.huang@starfivetech.com>, <linux-kernel@vger.kernel.org>
References: <20230203141801.59083-1-hal.feng@starfivetech.com>
 <20230203141801.59083-2-hal.feng@starfivetech.com>
 <20230206161016.GA156592-robh@kernel.org>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20230206161016.GA156592-robh@kernel.org>
X-Originating-IP: [113.72.145.145]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_083135_662668_A8E914CD 
X-CRM114-Status: GOOD (  14.13  )
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

On Mon, 6 Feb 2023 10:10:16 -0600, Rob Herring wrote:
> On Fri, Feb 03, 2023 at 10:17:58PM +0800, Hal Feng wrote:
>> diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
>> new file mode 100644
>> index 000000000000..22554e68ec91
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
>> @@ -0,0 +1,141 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/starfive,jh7110-sys-pinctrl.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: StarFive JH7110 SYS Pin Controller
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
>> +    additionalProperties: false
>> +    patternProperties:
>> +      '-pins$':
>> +        type: object
>> +        description: |
>> +          A pinctrl node should contain at least one subnode representing the
>> +          pinctrl groups available on the machine. Each subnode will list the
>> +          pins it needs, and how they should be configured, with regard to
>> +          muxer configuration, bias, input enable/disable, input schmitt
>> +          trigger enable/disable, slew-rate and drive strength.
>> +        $ref: /schemas/pinctrl/pincfg-node.yaml
> 
> On 2nd look, this should be:
> 
> allOf:
>   - $ref: /schemas/pinctrl/pincfg-node.yaml
>   - $ref: /schemas/pinctrl/pinmux-node.yaml

Will fix accordingly. Thanks.

> 
>> +        additionalProperties: false
>> +
>> +        properties:
>> +          pinmux:
>> +            description: |
>> +              The list of GPIOs and their mux settings that properties in the
>> +              node apply to. This should be set using the GPIOMUX or PINMUX
>> +              macros.
>> +            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/pinmux
> 
> And drop this.
> 
> Same in other patch. With that, Reviewed-by stands.

Will fix it. Thank you for your review.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
