Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C084C6FD1D
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Apr 2023 09:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TlUkcokK48aVUqV3T0hr2THH5b5jYsmoz2gAfvigX90=; b=LRX1BuaJnpLLFO
	LTjAZ/yYe4yjX0G1h6Vn9Z4y4zxU8z/Ao1dDXofjfXwbBTjAg4OlB4XEegt6nEIQkvdzdRpMeEJjE
	dpx2dY8xcaWV85xXvRu+gRTmqQhfUZEGbOcElVAH0LXXkbxaWCavIBgVanGw6AiumNn4a6DBK6JTs
	LjsxTh1r6ABx7eXnLurIYuR9TxRPuONCsfKBOrT+VuD3TJpUNnofuFx2bdvn/TXLylxRRZmMrrver
	QyGCfuKA/sDSsYf97yjcdZZmCszj8CUsgj0I1f1qau23BZhywhMHazek+MQqYKzJ0syYD895RqBdr
	1sgWVQUlaZiz5cviF0SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkiRM-009fVO-36;
	Fri, 07 Apr 2023 09:31:28 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkiRH-009fP1-3A
	for linux-riscv@lists.infradead.org;
	Fri, 07 Apr 2023 09:31:26 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 319A924E245;
	Fri,  7 Apr 2023 17:30:33 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 7 Apr
 2023 17:30:33 +0800
Received: from [192.168.120.57] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 7 Apr
 2023 17:30:32 +0800
Message-ID: <2ce35d68-ae6c-129f-588e-9b292de3a654@starfivetech.com>
Date: Fri, 7 Apr 2023 17:30:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v7 1/2] dt-bindings: soc: starfive: Add StarFive syscon
 doc
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Emil
 Renner Berthing" <kernel@esmil.dk>
References: <20230406103308.1280860-1-william.qiu@starfivetech.com>
 <20230406103308.1280860-2-william.qiu@starfivetech.com>
 <833b68a5-263d-d293-4910-2ca50b43e60d@linaro.org>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <833b68a5-263d-d293-4910-2ca50b43e60d@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_023124_346378_3FBCD8FD 
X-CRM114-Status: GOOD (  15.70  )
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



On 2023/4/7 2:30, Krzysztof Kozlowski wrote:
> On 06/04/2023 12:33, William Qiu wrote:
>> Add documentation to describe StarFive System Controller Registers.
> 
> Subject: drop second/last, redundant "doc". The "dt-bindings" prefix is
> already stating that these are documentation files.
> 
Will fix.
>> 
>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>> ---
>>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 56 +++++++++++++++++++
>>  MAINTAINERS                                   |  5 ++
>>  2 files changed, 61 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>> new file mode 100644
>> index 000000000000..0d0319426b67
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>> @@ -0,0 +1,56 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/soc/starfive/starfive,jh7110-syscon.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: StarFive JH7110 SoC system controller
>> +
>> +maintainers:
>> +  - William Qiu <william.qiu@starfivetech.com>
>> +
>> +description: |
>> +  The StarFive JH7110 SoC system controller provides register information such
>> +  as offset, mask and shift to configure related modules such as MMC and PCIe.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - starfive,jh7110-aon-syscon
>> +              - starfive,jh7110-sys-syscon
>> +          - const: syscon
>> +          - const: simple-mfd
>> +      - items:
>> +          - const: starfive,jh7110-stg-syscon
>> +          - const: syscon
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clock-controller:
>> +    type: object
> 
> This should be rather specific schema, so $ref.
> 

This would be $ref: /schemas/clock/starfive,jh7110-pll.yaml#, but this file is not
available at present,  so I would like to ask if I should submit the documents
instead of Xingyu


>> +
>> +  power-controller:
>> +    type: object
> 
Will fix, it would be $ref: /schemas/power/starfive,jh7110-pmu.yaml#.

Best regards,
William
> Same problem.
> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    syscon@10240000 {
>> +        compatible = "starfive,jh7110-stg-syscon", "syscon";
>> +        reg = <0x10240000 0x1000>;
>> +    };
>> +
>> +    syscon@13030000 {
>> +        compatible = "starfive,jh7110-sys-syscon", "syscon", "simple-mfd";
>> +        reg = <0x13030000 0x1000>;
>> +    };
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
