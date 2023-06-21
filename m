Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2139EB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 06:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=usWjDGlAOJ3oxtguTfwkSQAk5nVBUy3bY0ZTU8GSVGU=; b=BlXJ9fjx76osxo
	PnjUKI3DtnWiPozU+yoDMXFW+QP5XfLT3kb9H8c6MKFK6WJNYGRaUmoHyPUcFr7+UGEqdxHJLYPlw
	7gn2ISUkRc9iyjsnpsVJRYkz+GwIsA7NTb0g2AlCaWz+QMAYm3hTp9VChZAicrQIHgC/zooaNEMaY
	ZoEoUWyTxEhY1jC8PRMZfp59qxwTXu+0i/JHKKE1QlwRAIaJ/OCw/HJKy874cKseBAy9VjvBqFnu1
	2yEFyZLQ6bJD5JoJpAjRWLc3XTzNHBP0bkckY58qJG98U50zp3KCHrsyqQGmA9EhJw6W/533HaWCQ
	cIvPpI73SPkjdJRxFcYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBras-00DT2c-1d;
	Wed, 21 Jun 2023 06:45:30 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBrao-00DSzy-0w
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 06:45:28 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id E998E24E1AC;
	Wed, 21 Jun 2023 14:45:13 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 21 Jun
 2023 14:45:13 +0800
Received: from [192.168.120.57] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 21 Jun
 2023 14:45:12 +0800
Message-ID: <fb608232-f44d-21cf-7e0e-28829196e677@starfivetech.com>
Date: Wed, 21 Jun 2023 14:45:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 1/3] dt-bindings: qspi: cdns,qspi-nor: Add clocks for
 StarFive JH7110 SoC
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Ziv Xu
	<ziv.xu@starfivetech.com>
References: <20230619083517.415597-1-william.qiu@starfivetech.com>
 <20230619083517.415597-2-william.qiu@starfivetech.com>
 <4937f9c4-a0e0-fd37-d71b-e7488b2a1062@linaro.org>
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <4937f9c4-a0e0-fd37-d71b-e7488b2a1062@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS063.cuchost.com (172.16.6.23) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_234526_629692_4F3B0A02 
X-CRM114-Status: GOOD (  18.74  )
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



On 2023/6/19 20:17, Krzysztof Kozlowski wrote:
> On 19/06/2023 10:35, William Qiu wrote:
>> The QSPI controller needs three clock items to work properly on StarFive
>> JH7110 SoC, so there is need to change the maxItems's value to 3. Other
>> platforms do not have this constraint.
>> 
>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  .../bindings/spi/cdns,qspi-nor.yaml           | 20 ++++++++++++++++++-
>>  1 file changed, 19 insertions(+), 1 deletion(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
>> index b310069762dd..1b83cbb9a086 100644
>> --- a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
>> +++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
>> @@ -26,6 +26,15 @@ allOf:
>>              const: starfive,jh7110-qspi
>>      then:
>>        properties:
>> +        clocks:
>> +          maxItems: 3
>> +
>> +        clock-names:
>> +          items:
>> +            - const: ref
>> +            - const: ahb
>> +            - const: apb
> 
> You are duplicating top-level property. Define the items only in one
> place. If this list is applicable to everything, then in top-level property.
> 
Only in JH7110 SoC need there clocks, other platforms do not have this constraint.
So I need to duplicating top-level property.
>> +
>>          resets:
>>            minItems: 2
>>            maxItems: 3
>> @@ -38,6 +47,9 @@ allOf:
>>  
>>      else:
>>        properties:
>> +        clocks:
>> +          maxItems: 1
> 
> clock-names is missing. They must be in sync with clocks. What is the
> first clock?
> 
But there are no clock-names before, should I add it?
>> +
>>          resets:
>>            maxItems: 2
>>  
>> @@ -70,7 +82,13 @@ properties:
>>      maxItems: 1
>>  
>>    clocks:
>> -    maxItems: 1
>> +    maxItems: 3
> 
> 
> You did not test it before sending. minItems is missing.
> 
I will add it.
As for other platforms, should I use enum to constraint the clocks?
>> +
>> +  clock-names:
>> +    items:
>> +      - const: ref
>> +      - const: ahb
>> +      - const: apb
> 
> 
>>  
>>    cdns,fifo-depth:
>>      description:
> 
> Best regards,
> Krzysztof
> 
Thanks for taking time to review this patches series.

Best regards,
William

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
