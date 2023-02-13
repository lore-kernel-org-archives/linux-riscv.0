Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9984C636D4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 10:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ET+G7BU29MaXcK17wrZv7b/uzKszpaVZ3e8j2LLZ0NM=; b=hkd6d4SgKqZlas
	N7+U55MK7RuWxET27m+0/6tsikju8KYiIBzA1BVuoVYopJsqCA9/Yxo5kgvfsZJXNwFaolXcwVywL
	rI0SKluVj4VvpPOuTO58GSlhpAKOb/q4onW9zqlfqNIGr6KyOTgF5B2XoXwqSg8V0rdG49gupq5Jb
	W4XNGJo1WH4PGaHumhLcv3jwX4uXSx/acjL3ZJ5h56zzp669oUPSxA/dasWyczirTArlQXCVdMu/a
	kmfdnyIxjp7wRVEV4l2KgnL6R2hHWKrApnCzappLeyehIrWKO/6TSF4SyiyIRAob5PQx4xpzjW6VT
	6lXBAOny277FuWbHbHLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRVmN-00E2cf-2A; Mon, 13 Feb 2023 10:09:47 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRVmF-00E2Qz-49
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 10:09:45 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 7853124E238;
	Mon, 13 Feb 2023 18:08:42 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 13 Feb
 2023 18:08:42 +0800
Received: from [192.168.125.74] (183.27.97.168) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 13 Feb
 2023 18:08:41 +0800
Message-ID: <9f8c3242-762c-96a3-ad5b-e71e2321e7bf@starfivetech.com>
Date: Mon, 13 Feb 2023 18:08:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v1 1/3] dt-bindings: dma: snps,dw-axi-dmac: Update resets
 and add snps,num-hs-if
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <dmaengine@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Emil Renner Berthing <kernel@esmil.dk>,
	<linux-kernel@vger.kernel.org>
References: <20230206113811.23133-1-walker.chen@starfivetech.com>
 <20230206113811.23133-2-walker.chen@starfivetech.com>
 <20230207205800.GA4140140-robh@kernel.org>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <20230207205800.GA4140140-robh@kernel.org>
X-Originating-IP: [183.27.97.168]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_020939_527627_28978921 
X-CRM114-Status: GOOD (  16.98  )
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

On 2023/2/8 4:58, Rob Herring wrote:
> On Mon, Feb 06, 2023 at 07:38:09PM +0800, Walker Chen wrote:
>> Add two reset items and properties 'snps,num-hs-if'.
>> The DMA controller needs to be reset before being used in JH7110 SoC.
>> Another difference from the original version is that the hardware
>> handshake number of DMA can be up to 56 while the number in original
>> version is less than 16, and different registers are selected according
>> to this.
>> 
>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>> ---
>>  .../bindings/dma/snps,dw-axi-dmac.yaml          | 17 ++++++++++++++++-
>>  1 file changed, 16 insertions(+), 1 deletion(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>> index 67aa7bb6d36a..1a8d8c20e254 100644
>> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>> @@ -9,6 +9,7 @@ title: Synopsys DesignWare AXI DMA Controller
>>  maintainers:
>>    - Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
>>    - Jee Heng Sia <jee.heng.sia@intel.com>
>> +  - Walker Chen <walker.chen@starfivetech.com>
>>  
>>  description:
>>    Synopsys DesignWare AXI DMA Controller DT Binding
>> @@ -21,6 +22,7 @@ properties:
>>      enum:
>>        - snps,axi-dma-1.01a
>>        - intel,kmb-axi-dma
>> +      - starfive,axi-dma
> 
> This should be SoC specific.

Well, so this should be 'starfive,jh7110-axi-dma'.

> 
>>  
>>    reg:
>>      minItems: 1
>> @@ -59,7 +61,12 @@ properties:
>>      maximum: 8
>>  
>>    resets:
>> -    maxItems: 1
>> +    maxItems: 2
>> +
>> +  reset-names:
>> +    items:
>> +      - const: axi-rst
>> +      - const: ahb-rst
> 
> '-rst' is redundant.

Okay, will be drop '-rst' in next version.

> 
>>  
>>    snps,dma-masters:
>>      description: |
>> @@ -74,6 +81,14 @@ properties:
>>      $ref: /schemas/types.yaml#/definitions/uint32
>>      enum: [0, 1, 2, 3, 4, 5, 6]
>>  
>> +  snps,num-hs-if:
>> +    description: |
>> +      The number of hardware handshake. If it is more than 16,
>> +      CHx_CFG2 is used to configure the DMA transfer instead of CHx_CFG.
> 
> Can't you infer this from the compatible string?

Yeah, maybe this is also feasible from the compatible string.
Thanks.

Best regards,
Walker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
