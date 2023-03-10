Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E50C64EC4
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Mar 2023 08:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kl/vdBcDBaCZQY3ytY5a9yUadmhiHC27T0Je9yejsk4=; b=UoBKZIFw54EehM
	81w3uzVPv0g12ArLa88HgM0kniqySkAFIlkREYZ3AXTRJhZfAxDgkARCYU2jUKbGdZyBPM+UdNkYB
	is1/cOK0fdKm4LhaiDa2+/GG0mf9gI8iqkEhEnGeoglTwTjOLZYqcc/SUmJnDKiCESYXf8D1DZ1Cq
	8evbe0IoQkef0QRGHzaUphBpXUTMLOSkRyMnmwTTU6GsxYtKfzKn7blEVDY9ype7ir3CEIAF8PKhq
	JtmQEmuoIzu2/s3fFFM3MBqKbljtCqnWnB94LGXNgqcSuFmz2wXfYqQTFqusXkYRH8CYYUKwEBMx+
	1OL3bGmJ02AM2aso+YAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paXi9-00DVXO-9f; Fri, 10 Mar 2023 08:02:45 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paXi4-00DVR7-WE; Fri, 10 Mar 2023 08:02:43 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 19B0A24E1FE;
	Fri, 10 Mar 2023 16:01:47 +0800 (CST)
Received: from EXMBX071.cuchost.com (172.16.6.81) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 10 Mar
 2023 16:01:47 +0800
Received: from [192.168.125.108] (183.27.96.115) by EXMBX071.cuchost.com
 (172.16.6.81) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 10 Mar
 2023 16:01:45 +0800
Message-ID: <5ebede90-7851-6b3b-adf7-81604f955817@starfivetech.com>
Date: Fri, 10 Mar 2023 16:01:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: Add StarFive JH7110 USB
 dt-binding
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Vinod Koul <vkoul@kernel.org>, "Kishon
 Vijay Abraham I" <kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Pawel Laszczak
	<pawell@cadence.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Peter
 Chen" <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-usb@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20230308082800.3008-1-minda.chen@starfivetech.com>
 <20230308082800.3008-2-minda.chen@starfivetech.com>
 <8124eed7-b9ab-046d-4eb2-9b853ce2bcdd@linaro.org>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <8124eed7-b9ab-046d-4eb2-9b853ce2bcdd@linaro.org>
X-Originating-IP: [183.27.96.115]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX071.cuchost.com
 (172.16.6.81)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_000241_380941_42AB2A1A 
X-CRM114-Status: GOOD (  16.64  )
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



On 2023/3/9 18:07, Krzysztof Kozlowski wrote:
> On 08/03/2023 09:27, Minda Chen wrote:
>> Add StarFive JH7110 SoC USB 3.0 phy dt-binding.
>> USB controller is cadence USB 3.0 IP.
> 
> Subject: drop second/last, redundant "binding". The "dt-bindings" prefix
> is already stating that these are bindings.
> 
>> 
>> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
>> ---
>>  .../bindings/phy/starfive,jh7110-usb-phy.yaml | 158 ++++++++++++++++++
>>  1 file changed, 158 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml b/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
>> new file mode 100644
>> index 000000000000..daa88d065deb
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
>> @@ -0,0 +1,158 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/starfive,jh7110-usb-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: StarFive USB 2.0 and 3.0 PHY
>> +
>> +maintainers:
>> +  - Minda Chen<minda.chen@starfivetech.com>
> 
> Missing space
> 
>> +
>> +properties:
>> +  compatible:
>> +    items:
> 
> Drop items, it's just one item.
> 
> 
>> +      - const: starfive,jh7110-usb
>> +
>> +  reg:
>> +    maxItems: 2
>> +
>> +  reg-names:
>> +    items:
>> +      - const: usb3
>> +      - const: usb2
>> +
>> +  clocks:
>> +    items:
>> +      - description: usb 125m clock
>> +      - description: app 125m clock
>> +      - description: lpm clock
>> +      - description: stb clock
>> +      - description: apb clock
>> +      - description: axi clock
>> +      - description: utmi apb clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: usb_125m
>> +      - const: usb0_app_125
>> +      - const: usb0_lpm
>> +      - const: usb0_stb
>> +      - const: usb0_apb
>> +      - const: usb0_axi
>> +      - const: usb0_utmi_apb
>> +
>> +  resets:
>> +    items:
>> +      - description: USB0_PWRUP reset
>> +      - description: USB0_APB reset
>> +      - description: USB0_AXI reset
>> +      - description: USB0_UTMI_APB reset
>> +
>> +  starfive,sys-syscon:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +      items:
>> +        - description: phandle to System Register Controller sys_syscon node.
>> +        - description: offset of SYS_SYSCONSAIF__SYSCFG register for USB.
>> +    description:
>> +      The phandle to System Register Controller syscon node and the offset
>> +      of SYS_SYSCONSAIF__SYSCFG register for USB.
>> +
>> +  starfive,stg-syscon:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +      items:
>> +        - description: phandle to System Register Controller stg_syscon node.
>> +        - description: register0 offset of STG_SYSCONSAIF__SYSCFG register for USB.
>> +        - description: register1 offset of STG_SYSCONSAIF__SYSCFG register for USB.
>> +        - description: register2 offset of STG_SYSCONSAIF__SYSCFG register for USB.
>> +        - description: register3 offset of STG_SYSCONSAIF__SYSCFG register for USB.
>> +    description:
>> +      The phandle to System Register Controller syscon node and the offset
>> +      of STG_SYSCONSAIF__SYSCFG register for USB. Total 4 regsisters offset
>> +      for USB.
>> +
>> +  dr_mode:
>> +    description: PHY mode.
>> +    enum:
>> +      - host
>> +      - peripheral
>> +      - otg
>> +
>> +  "#address-cells":
>> +    maximum: 2
>> +
>> +  "#size-cells":
>> +    maximum: 2
>> +
>> +  ranges: true
>> +
>> +  starfive,usb2-only:
>> +    type: boolean
>> +    description: Set USB using usb 2.0 phy. Supprt USB 2.0 only
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - starfive,sys-syscon
>> +  - starfive,stg-syscon
>> +  - dr_mode
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - ranges
>> +
>> +patternProperties:
> 
> This goes before required block
> 
>> +  "^usb@[0-9a-f]+$":
>> +    type: object
>> +    description: |
>> +      usbphy node should have '1' usb controller subnode.
>> +      It could be Cadence USB3 DRD controller.
>> +      Cadence USB3 should follow the bindings specified in
>> +      Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> 
> $ref instead of free form text
> 
> 
ok, thanks. Next version I will follow the comments to change.
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
