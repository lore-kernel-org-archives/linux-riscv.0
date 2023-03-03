Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B121C64EC4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 08:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FBfVDgU3D3c8VkOhuJuHirPJvGnCRNgs037cPbq7kF0=; b=IGKki0GWCR4OoL
	4B67HVJYLziTRgV1sf7IcDKELTRtJSUVtbrB2vYbdgDyrE5dYhA3QZqI8YIn3AtEMXkImpbuhk/eN
	q/PPjwTO8j+gPcL8tCcgXXMu6O9sTEgQvX4SOn0Zgo/WDpO5CknRtZhd3pAMXxi8LmmAXwyCxXWLB
	ThhO8Axma9u0DbJd/V7vchiMNqiPsvaVTwhczW9W1JIR2S/BtR7z7YzKANd1UXSx3ireoREBvAROM
	7MKr3ddXoc0n7C7a1s9fkn0OeQdRDHU/Oikx773PdLbXpsH1rU93IupFWVTktK4lh/kOXlcKuzHwk
	Dzm43KAOPlhIcxHhykdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY0iV-005NY8-0G; Fri, 03 Mar 2023 08:24:39 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY0iO-005NWw-49
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 08:24:37 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id C974224E285;
	Fri,  3 Mar 2023 16:24:10 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 3 Mar
 2023 16:24:10 +0800
Received: from [192.168.125.93] (113.72.145.171) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 3 Mar
 2023 16:24:10 +0800
Message-ID: <82b2a817-5fb6-d0fc-868a-26a0285bcad7@starfivetech.com>
Date: Fri, 3 Mar 2023 16:24:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v3 1/3] dt-bindings: dma: snps,dw-axi-dmac: constrain
 minItems/maxItems of resets for JH7110 DMA
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
	<vkoul@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <dmaengine@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20230227131042.16125-1-walker.chen@starfivetech.com>
 <20230227131042.16125-2-walker.chen@starfivetech.com>
 <20230228153752.GA3292255-robh@kernel.org>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <20230228153752.GA3292255-robh@kernel.org>
X-Originating-IP: [113.72.145.171]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_002432_490317_B3D860FE 
X-CRM114-Status: GOOD (  12.51  )
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



On 2023/2/28 23:37, Rob Herring wrote:
> On Mon, Feb 27, 2023 at 09:10:40PM +0800, Walker Chen wrote:
>> The DMA controller needs two reset items to work properly on JH7110 SoC,
>> so there is need to change the maxItems' value to 2 and add minItems
>> whose value is equal to 1. Other platforms do not have this constraint.
>> 
>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>> ---
>>  .../bindings/dma/snps,dw-axi-dmac.yaml        | 25 ++++++++++++++++---
>>  1 file changed, 21 insertions(+), 4 deletions(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>> index ad107a4d3b33..4ed0a6b7ca69 100644
>> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>> @@ -12,14 +12,12 @@ maintainers:
>>  description:
>>    Synopsys DesignWare AXI DMA Controller DT Binding
>>  
>> -allOf:
>> -  - $ref: "dma-controller.yaml#"
>> -
>>  properties:
>>    compatible:
>>      enum:
>>        - snps,axi-dma-1.01a
>>        - intel,kmb-axi-dma
>> +      - starfive,jh7110-axi-dma
>>  
>>    reg:
>>      minItems: 1
>> @@ -58,7 +56,8 @@ properties:
>>      maximum: 8
>>  
>>    resets:
>> -    maxItems: 1
>> +    minItems: 1
>> +    maxItems: 2
>>  
>>    snps,dma-masters:
>>      description: |
>> @@ -109,6 +108,24 @@ required:
>>    - snps,priority
>>    - snps,block-size
>>  
>> +allOf:
>> +  - $ref: "dma-controller.yaml#"
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - starfive,jh7110-axi-dma
>> +    then:
>> +      properties:
>> +        resets:
>> +          minItems: 1
>> +          maxItems: 2
> 
> A given platform should not have a variable number of resets. This also 
> does nothing because you just duplicated the top-level constraints. If 
> you have 2, then you want just 'minItems: 2'.

Okay, this will be fixed.
Thank you for pointing out the problem for me.

Best regards,
Walker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
