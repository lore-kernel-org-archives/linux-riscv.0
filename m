Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F6DC6FD1E
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 10:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OsAAd4LhliQ2FGlHwZonQYC8M/riI6JuwPexWxJFq3U=; b=amHvEJDCV5gcdy
	+27biL5fP+/y4Qrs9D15wkZEhuOwMXOEeq4pJAy826oP45ZxUv8r6pjJPxwd9d6sbcGc41miviirX
	xc0Vkndz8efeePa3HhQoiOa3shRxWrKpKOG4o/dNatqYl/J7fx3iIjnJVq1fjuFlO8gN3LEaZ7tKG
	ZLp/eKDuRhNqnix6qL96/q1gW+YfSj88fgIKkbTmBptbkV2QIpQt9llnL9Cg0CGq4zIcGHbAZ9+uO
	wt2FDWpPIBCFR0KCoExF0pjUU+6vDOrh4Xy9tCtxjQY+4Be4fkPdBo/N0KM5zNcY55Af24T91DbAs
	66rfJTnjirSyUaZVaIBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUac-00HHqA-9F; Tue, 07 Mar 2023 10:30:38 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUaY-00HHj7-Lp
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 10:30:37 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id EC71C24E31D;
	Tue,  7 Mar 2023 18:30:10 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Mar
 2023 18:30:10 +0800
Received: from [192.168.125.96] (183.27.97.46) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Mar
 2023 18:30:10 +0800
Message-ID: <0725e451-7c0b-0aac-ecd3-502b02276a9a@starfivetech.com>
Date: Tue, 7 Mar 2023 18:30:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v4 1/3] dt-bindings: dma: snps,dw-axi-dmac: constrain
 resets items for JH7110 dma
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Eugeniy Paltsev
	<Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Emil
 Renner Berthing" <emil.renner.berthing@canonical.com>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230306140430.28951-1-walker.chen@starfivetech.com>
 <20230306140430.28951-2-walker.chen@starfivetech.com>
 <b2b36909-b0b1-7507-3145-141eb5ec0f3f@linaro.org>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <b2b36909-b0b1-7507-3145-141eb5ec0f3f@linaro.org>
X-Originating-IP: [183.27.97.46]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_023035_057670_D0BD5E06 
X-CRM114-Status: GOOD (  15.03  )
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



On 2023/3/7 17:03, Krzysztof Kozlowski wrote:
> On 06/03/2023 15:04, Walker Chen wrote:
>> The DMA controller needs two reset items to work properly on JH7110 SoC,
>> so there is need to constrain the items' value to 2, other platforms
>> have 1 reset item at most.
>> 
>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>> ---
>>  .../bindings/dma/snps,dw-axi-dmac.yaml        | 24 +++++++++++++++----
>>  1 file changed, 20 insertions(+), 4 deletions(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>> index ad107a4d3b33..d8b5439f215c 100644
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
>> @@ -109,6 +108,23 @@ required:
>>    - snps,priority
>>    - snps,block-size
>>  
>> +allOf:
>> +  - $ref: "dma-controller.yaml#"
> 
> Rebase your patches on something recent... I would argue that it should
> be based on maintainer's (or linux-next) tree, but that would be too
> good to be true.

This was written by referring to the syntax of other dt-binding, but your suggestion 
is a good one, the next version of patches will be rebased on kernel 6.3.

> 
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - starfive,jh7110-axi-dma
>> +    then:
>> +      properties:
>> +        resets:
>> +          minItems: 2
> 
> What are the items expected here?

Do you mean to add descriptions for items here ?

Thanks!

Best regards,
Walker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
