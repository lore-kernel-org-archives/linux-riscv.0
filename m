Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B48FC636D4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 03:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H9Zq3JGHZ7/gkCSws4+UrmzTmxDub78F7xcPkuP3ARo=; b=aD39zZzlbc9YnE
	oNbJ4Ka/lplNs/MIpkuzDzQC7PB338OPxrleaY47dyjtufbwerXnUBzX52kUx3erKWqqmxDtM5fyb
	fPndlJCrN+W+5VrvaR9tJiz+9JCurHkQxb+PZLDhPbrcxXVRCXSeE1sJ6tOMSSOJmZYUkSjy0cLiH
	Rw+LKW1znXYJy3Tsm4hvXI7p3EKGGLoTdB7Q3RtdKmXzId52Bsll9LkyqA85PZUpghIxtkh2UBA14
	yOETQIW9VqINj8OLgJNAMg+xEe9wbM/C/kAFslIW3mGmKcxlE9Beh9p0MLIhYQRQNHjnpJBVnZqOh
	De3PewZhhLuGdqt1eUew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRlfW-00HCZQ-5n; Tue, 14 Feb 2023 03:07:46 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRlfS-00HCYL-Dn; Tue, 14 Feb 2023 03:07:44 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id EF3A624E235;
	Tue, 14 Feb 2023 11:07:29 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Feb
 2023 11:07:29 +0800
Received: from [192.168.1.100] (183.27.97.168) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Feb
 2023 11:07:29 +0800
Message-ID: <f33f3ce0-ca0f-b24e-eab6-4fb9a6ae6d4a@starfivetech.com>
Date: Tue, 14 Feb 2023 11:07:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v1 2/4] dt-bindings: phy: Add starfive,jh7110-dphy-rx
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Vinod Koul
	<vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: Jack Zhu <jack.zhu@starfivetech.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20230210061713.6449-1-changhuang.liang@starfivetech.com>
 <20230210061713.6449-3-changhuang.liang@starfivetech.com>
 <3fc07187-f5a0-86d1-a0fd-ba18a2baf555@linaro.org>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <3fc07187-f5a0-86d1-a0fd-ba18a2baf555@linaro.org>
X-Originating-IP: [183.27.97.168]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_190742_781901_3D29393A 
X-CRM114-Status: GOOD (  16.65  )
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



On 2023/2/13 17:30, Krzysztof Kozlowski wrote:
> On 10/02/2023 07:17, Changhuang Liang wrote:
>> Starfive SoC like the jh7110 use a MIPI D-PHY RX controller based on
>> a M31 IP. Add a binding for it.
>>
>> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>> ---
>>  .../bindings/phy/starfive,jh7110-dphy-rx.yaml | 78 +++++++++++++++++++
>>  1 file changed, 78 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml b/Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml
>> new file mode 100644
>> index 000000000000..1c1e5c7cbee2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml
>> @@ -0,0 +1,78 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/starfive,jh7110-dphy-rx.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Starfive SoC MIPI D-PHY Rx Controller
>> +
>> +maintainers:
>> +  - Jack Zhu <jack.zhu@starfivetech.com>
>> +  - Changhuang Liang <changhuang.liang@starfivetech.com>
>> +
>> +description: |
>> +  The Starfive SOC has a MIPI CSI D-PHY based on M31 IP use to transfer
>> +  the CSI cameras data.
>> +
>> +properties:
>> +  compatible:
>> +    items:
> 
> Drop items
> 

OK, will fix it

>> +      - const: "starfive,jh7110-dphy-rx"
> 
> Drop quotes
> 

OK, will drop quotes

>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 3
> 
> Drop minItems
> 

OK, will drop minItems

>> +    maxItems: 3
>> +
>> +  clock-names:
>> +    items:
>> +      - const: cfg
>> +      - const: ref
>> +      - const: tx
>> +
>> +  resets:
>> +    minItems: 2
> 
> Ditto
> 

here i will change to define each reset is.
Refer to the Rob Herring's comment.

>> +    maxItems: 2
>> +
>> +  starfive,aon-syscon:
>> +    $ref: '/schemas/types.yaml#/definitions/phandle-array'
> 
> Drop quotes
> 

OK, will drop quotes

>> +    items:
>> +      items:
>> +        - description: phandle of AON SYSCON
>> +        - description: register offset
>> +    description: The register of dphy rx driver can be configured
>> +      by AON SYSCON in this property.
> 
> Can be? So does not have to? But you made it a required property....
> 

Maybe I described it wrong.
I will change to:
	description: The power of dphy rx can be configured by AON SYSCON
	  in this property.
It is like AON SYSCON is the power switch of the dphy rx, it is necessary to
configure the AON SYSCON register, so I made it a required property.

>> +
>> +  "#phy-cells":
>> +    const: 0
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - starfive,aon-syscon
>> +  - "#phy-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/starfive,jh7110-crg.h>
>> +    #include <dt-bindings/reset/starfive,jh7110-crg.h>
>> +
>> +    dphy@19820000 {
> 
> just phy@......
> 

OK, will fix it.

>> +      compatible = "starfive,jh7110-dphy-rx";
>> +      reg = <0x19820000 0x10000>;
>> +      clocks = <&ispcrg JH7110_ISPCLK_M31DPHY_CFGCLK_IN>,
>> +               <&ispcrg JH7110_ISPCLK_M31DPHY_REFCLK_IN>,
>> +               <&ispcrg JH7110_ISPCLK_M31DPHY_TXCLKESC_LAN0>;
>> +      clock-names = "cfg", "ref", "tx";
>> +      resets = <&ispcrg JH7110_ISPRST_M31DPHY_HW>,
>> +               <&ispcrg JH7110_ISPRST_M31DPHY_B09_ALWAYS_ON>;
>> +      starfive,aon-syscon = <&aon_syscon 0x00>;
>> +      #phy-cells = <0>;
>> +    };
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
