Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E6BC63797
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jan 2023 08:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ITU2yroat9t7mJf+A+Kt0LWhiEIStmfXlL+vxn+P1cc=; b=Ceos5txo9tgeoN
	2svlRU5P1Vo3ty1Agro3+Qrp5dbrouhICf5f/kasz5vRu15/u3rAE4USsDuaHXCK1yT3bjzHxd3Ab
	9r2DnEeP6dhyNJOqMCOknHCE7RAXCfYym7P9LEHpbaa2B7hlpnI9gcnZVfMmFu3QYb7ioUJcZOMXS
	4pk+Nmrorww0l775VNcRalIr+785KyF7bApGwxH4Rp0l4ZWHhzbQ/ej/joW8iWQ5fd6WtbA2fZuPZ
	MOZLLviqs0Yby/sczds7MmHUcUQKIturHRmr7Dug8QLadHAspvwd9uPaqAHsAw7SzD8tx8NSmqDaG
	cZ8Ygym6vzY/aTrFvc+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHh7h-00DI6B-4u; Tue, 17 Jan 2023 08:15:13 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHh7b-00DI3z-Lm
	for linux-riscv@lists.infradead.org; Tue, 17 Jan 2023 08:15:11 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 37D8D24E226;
	Tue, 17 Jan 2023 16:14:53 +0800 (CST)
Received: from EXMBX073.cuchost.com (172.16.6.83) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 17 Jan
 2023 16:14:53 +0800
Received: from [192.168.120.49] (171.223.208.138) by EXMBX073.cuchost.com
 (172.16.6.83) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 17 Jan
 2023 16:14:52 +0800
Message-ID: <bb1f3c71-e1a7-cd2d-b728-6e9027dae150@starfivetech.com>
Date: Tue, 17 Jan 2023 16:14:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 2/7] dt-bindings: net: snps,dwmac: Update the maxitems
 number of resets and reset-names
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
References: <20230106030001.1952-1-yanhong.wang@starfivetech.com>
 <20230106030001.1952-3-yanhong.wang@starfivetech.com>
 <2328562d-59a2-f60e-b17b-6cf16392e01f@linaro.org>
 <84e783a6-0aea-a6ba-13a0-fb29c66cc81a@starfivetech.com>
 <8ee5f6ef-80cb-2e0f-6681-598ccc697291@linaro.org>
From: yanhong wang <yanhong.wang@starfivetech.com>
In-Reply-To: <8ee5f6ef-80cb-2e0f-6681-598ccc697291@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX073.cuchost.com
 (172.16.6.83)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_001508_043489_AF0326DB 
X-CRM114-Status: GOOD (  14.87  )
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



On 2023/1/17 15:46, Krzysztof Kozlowski wrote:
> On 17/01/2023 07:52, yanhong wang wrote:
>> 
>> 
>> On 2023/1/6 20:44, Krzysztof Kozlowski wrote:
>>> On 06/01/2023 03:59, Yanhong Wang wrote:
>>>> Some boards(such as StarFive VisionFive v2) require more than one value
>>>> which defined by resets property, so the original definition can not
>>>> meet the requirements. In order to adapt to different requirements,
>>>> adjust the maxitems number definition.
>>>>
>>>> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
>>>> ---
>>>>  .../devicetree/bindings/net/snps,dwmac.yaml   | 36 ++++++++++++++-----
>>>>  1 file changed, 28 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>>> index e26c3e76ebb7..f7693e8c8d6d 100644
>>>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>>> @@ -132,14 +132,6 @@ properties:
>>>>          - pclk
>>>>          - ptp_ref
>>>>  
>>>> -  resets:
>>>> -    maxItems: 1
>>>> -    description:
>>>> -      MAC Reset signal.
>>>> -
>>>> -  reset-names:
>>>> -    const: stmmaceth
>>>> -
>>>>    power-domains:
>>>>      maxItems: 1
>>>>  
>>>> @@ -463,6 +455,34 @@ allOf:
>>>>              Enables the TSO feature otherwise it will be managed by
>>>>              MAC HW capability register.
>>>>  
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: starfive,jh7110-dwmac
>>>> +
>>>
>>> Looking at your next binding patch, this seems a bit clearer. First of
>>> all, this patch on itself has little sense. It's not usable on its own,
>>> because you need the next one.
>>>
>>> Probably the snps,dwmac should be just split into common parts used by
>>> devices. It makes code much less readable and unnecessary complicated to
>>> support in one schema both devices and re-usability.
>>>
>>> Otherwise I propose to make the resets/reset-names just like clocks are
>>> made: define here wide constraints and update all other users of this
>>> binding to explicitly restrict resets.
>>>
>>>
>> 
>> Thanks, refer to the definition of clocks. If it is defined as follows, is it OK?
>> 
>> properties:
>>   resets:
>>     minItems: 1
>>     maxItems: 3
>>     additionalItems: true
> 
> Drop
> 
>>     items:
>>       - description: MAC Reset signal.
> 
> Drop both
> 
>> 
>>   reset-names:
>>     minItems: 1
>>     maxItems: 3
>>     additionalItems: true
> 
> Drop
> 
>>     contains:
>>       enum:
>>         - stmmaceth
> 
> Drop all
> 
>> 
>> 
>> allOf:
>>   - if:
>>       properties:
>>         compatible:
>>           contains:
>>             const: starfive,jh7110-dwmac
>>     then:
>>       properties:
>>         resets:
>>           minItems: 2
>>           maxItems: 2
>>         reset-names:
>>           items:
>>             - const: stmmaceth
>>             - const: ahb
>>       required:
>>         - resets
>>         - reset-names  
>>     else:
>>       properties:
>>         resets:
>>           maxItems: 1
>>           description:
>>             MAC Reset signal.
>> 
>>         reset-names:
>>           const: stmmaceth
>> 
>> Do you have any other better suggestions?
> 
> More or less like this but the allOf should not be in snps,dwmac schema
> but in individual schemas. The snps,dwmac is growing unmaintainable...
> 

Thanks, it is defined as follows, is it right?

properties:
  resets:
    minItems: 1
    maxItems: 3
    additionalItems: true

  reset-names:
    minItems: 1
    maxItems: 3
    additionalItems: true


> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
