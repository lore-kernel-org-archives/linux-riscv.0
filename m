Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA969C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 05:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hoiGIBH7tUdsWVWAQeM8wB0fA7lu7Dkc+BitZ7HPUTU=; b=edlOWciGb9LUKR
	HBogit0wmjCqeD/9Be2AKbDO4bIvS62Ekn1TK5+ZqhtKtJYH3NxbaVqg12kphLJKQLZGl2kU617kQ
	BYbE02CitYB5hzdQdlkYzo3wKlcNqqHfdb5pLZieCFe4vaVn80V+LTXq9vhZaYIP9xWpNJMk3SOzC
	K/GpNKCYd8KVM6pBmCIXA9U4YKS1EObB1+jFWzTSyiDgtUIRWVp6k42UTfMLrfBBQBGmtPLQ++hwK
	u3578LF3i+dM8mMLJfuUTxqVrncpr42/iKLvcnyJ2QS/gT6ZLDBQRV6mvr++ThOT3L6AsIvVr488L
	wS0saWUrOHHk5TaCrt5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNp69-000U5E-1L; Fri, 03 Feb 2023 05:58:57 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNp64-000U2N-1u
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 05:58:55 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 07EFD24E1DB;
	Fri,  3 Feb 2023 13:58:23 +0800 (CST)
Received: from EXMBX073.cuchost.com (172.16.6.83) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 3 Feb
 2023 13:58:22 +0800
Received: from [192.168.120.49] (171.223.208.138) by EXMBX073.cuchost.com
 (172.16.6.83) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 3 Feb
 2023 13:58:21 +0800
Message-ID: <14eed87c-72ce-e9c7-710e-64108cd641ba@starfivetech.com>
Date: Fri, 3 Feb 2023 13:58:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 4/7] dt-bindings: net: Add support StarFive dwmac
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <20230118061701.30047-1-yanhong.wang@starfivetech.com>
 <20230118061701.30047-5-yanhong.wang@starfivetech.com>
 <102db6ae-742b-ea20-076e-386a0284a185@linaro.org>
From: yanhong wang <yanhong.wang@starfivetech.com>
In-Reply-To: <102db6ae-742b-ea20-076e-386a0284a185@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX073.cuchost.com
 (172.16.6.83)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_215852_420432_6DC4D0A6 
X-CRM114-Status: GOOD (  19.72  )
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



On 2023/1/18 23:49, Krzysztof Kozlowski wrote:
> On 18/01/2023 07:16, Yanhong Wang wrote:
>> Add documentation to describe StarFive dwmac driver(GMAC).
>> 
>> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> 
> 
> Subject is poor. You miss device prefix and it's not correct sentence.
> 
> "Add support for XYZ"
> or better:
> "Add XYZ"
> 

Thanks. I will change to "Add support for JH7110" in the next version.

> 
>> ---
>>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>>  .../bindings/net/starfive,jh7110-dwmac.yaml   | 113 ++++++++++++++++++
>>  MAINTAINERS                                   |   5 +
>>  3 files changed, 119 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> index baf2c5b9e92d..8b07bc9c8b00 100644
>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> @@ -91,6 +91,7 @@ properties:
>>          - snps,dwmac-5.20
>>          - snps,dwxgmac
>>          - snps,dwxgmac-2.10
>> +        - starfive,jh7110-dwmac
>>  
>>    reg:
>>      minItems: 1
>> diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
>> new file mode 100644
>> index 000000000000..eb0767da834a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
>> @@ -0,0 +1,113 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (C) 2022 StarFive Technology Co., Ltd.
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/starfive,jh7110-dwmac.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: StarFive JH7110 DWMAC glue layer
>> +
>> +maintainers:
>> +  - Yanhong Wang <yanhong.wang@starfivetech.com>
>> +
>> +select:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        enum:
>> +          - starfive,jh7110-dwmac
>> +  required:
>> +    - compatible
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - starfive,jh7110-dwmac
>> +      - const: snps,dwmac-5.20
>> +
>> +  clocks:
>> +    items:
>> +      - description: GMAC main clock
>> +      - description: GMAC AHB clock
>> +      - description: PTP clock
>> +      - description: TX clock
>> +      - description: GTXC clock
>> +      - description: GTX clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: stmmaceth
>> +      - const: pclk
>> +      - const: ptp_ref
>> +      - const: tx
>> +      - const: gtxc
>> +      - const: gtx
>> +
>> +  resets:
>> +    items:
>> +      - description: MAC Reset signal.
> 
> Drop trailing dot
> 

I will fix.

>> +      - description: AHB Reset signal.
> 
> Ditto
> 

I will fix.

>> +
>> +  reset-names:
>> +    items:
>> +      - const: stmmaceth
>> +      - const: ahb
> 
> You have two resets. Why do you change them to three for all variants?
> It's not explained in commit 2/7, so this is confusing.
> 

Refer to the definition of clocks, define the value of maxItems slightly larger (3),
and reserve a little expandable space without affecting other definitions.
If you need to configure 3 resets in the future, you only need to define it
in individual schemas, and you don't need to adjust this item anymore.  
I will adjust maxItems to 2 in the next version.

>> +
>> +allOf:
>> +  - $ref: snps,dwmac.yaml#
>> +
>> +unevaluatedProperties: true
>> +
>> +required:
>> +  - compatible
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - reset-names
>> +
> 
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
