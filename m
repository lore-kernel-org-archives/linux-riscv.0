Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D1DEB64DD
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 09:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Fn9ZdWbCH2GN7nugYverx1zU5jNdV11D04Y35xovbs=; b=wgvWLQjTC2G2jk
	mlKmaWjJPzXPJTAgwd28p0fDpsAtvk4u/21Tq5Ogt8KwMHLTBJe3eEGudxStxi9SP7o41ROVn5e9H
	nUFbOzIpbqhuOiFLRLkgPDcBCBO7ZCO0UCC6bS6ZTuP/FbaauZPoHUIxt7Ul/SNiFLZO0kdl6elZa
	ZDtusgJga54pYbwuveYKrMASHw/c8C9qcD5FgM2IkU758QXr0o8DNY+iHR/XhCER5ihuF1bNu2546
	aQ57lIrSPL8S77LkKNMZtBUFk34yGRz7gR0wqBWSsgYmO4GgD4Kn4sko9muJziPVo1h+hK6JS4zXK
	TjetvGvI66pX+zTv+zeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSwEN-00GX5U-2r;
	Mon, 07 Aug 2023 09:08:51 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSwEJ-00GX2O-0Z
	for linux-riscv@lists.infradead.org;
	Mon, 07 Aug 2023 09:08:50 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id D759D8157;
	Mon,  7 Aug 2023 17:07:38 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 7 Aug
 2023 17:07:38 +0800
Received: from [192.168.125.128] (113.72.146.246) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 7 Aug
 2023 17:07:37 +0800
Message-ID: <12a9bfda-9c9f-6baf-3e5f-ce7cc7d79aee@starfivetech.com>
Date: Mon, 7 Aug 2023 17:03:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1 2/5] ASoC: dt-bindings: snps,designware-i2s: Add
 StarFive JH7110 SoC support
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Maxim Kochetkov
	<fido_max@inbox.ru>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: Jose Abreu <joabreu@synopsys.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Walker Chen <walker.chen@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-riscv@lists.infradead.org>
References: <20230802084301.134122-1-xingyu.wu@starfivetech.com>
 <20230802084301.134122-3-xingyu.wu@starfivetech.com>
 <37a636dd-fbd8-d475-8814-e0cc6d5cc812@linaro.org>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <37a636dd-fbd8-d475-8814-e0cc6d5cc812@linaro.org>
X-Originating-IP: [113.72.146.246]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_020847_589964_F54C22B4 
X-CRM114-Status: GOOD (  12.93  )
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

On 2023/8/6 5:02, Krzysztof Kozlowski wrote:
> On 02/08/2023 10:42, Xingyu Wu wrote:
>> Add the StarFive JH7110 (TX0/TX1/RX channel) SoC support in the bindings
>> of Designware I2S controller. The I2S controller needs two reset items''
> 
> Thank you for your patch. There is something to discuss/improve.
> 
>>  
>>    resets:
>>      items:
>>        - description: Optional controller resets
>> +      - description: controller reset of Sampling rate
>> +    minItems: 1
>>  
>>    dmas:
>>      items:
>> @@ -51,6 +75,17 @@ properties:
>>        - const: rx
>>      minItems: 1
>>  
>> +  starfive,syscon:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +      - items:
>> +          - description: phandle to System Register Controller sys_syscon node.
>> +          - description: I2S-rx enabled control offset of SYS_SYSCONSAIF__SYSCFG register.
>> +          - description: I2S-rx enabled control mask
>> +    description:
>> +      The phandle to System Register Controller syscon node and the I2S-rx(ADC)
>> +      enabled control offset and mask of SYS_SYSCONSAIF__SYSCFG register.
>> +
>>  allOf:
>>    - $ref: dai-common.yaml#
>>    - if:
>> @@ -66,6 +101,66 @@ allOf:
>>        properties:
>>          "#sound-dai-cells":
>>            const: 0
> 
> You need to constrain clocks and resets also for all other existing
> variants.
>>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: snps,designware-i2s
>> +    then:
>> +      properties:
>> +        clocks:
>> +          maxItems: 1
>> +        clock-names:
>> +          maxItems: 1
>> +        resets:
>> +          maxItems: 1
>> +    else:
>> +      properties:
>> +        resets:
>> +          minItems: 2

The resets of TX0/TX1/RX on JH7110 SoC are mentioned in 'else' here.

>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: starfive,jh7110-i2stx0
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 5
> 
> Also maxItems

Will add.

> 
>> +        clock-names:
>> +          minItems: 5
> 
> Also maxItems

Will add.

> 
> What about resets? 1 or 2 items?

Mentioned it in the 'else'.
Or do you mean I should drop the 'else' and add the resets in here?
And is the same for TX1 and RX?

> 
>> +      required:
>> +        - resets
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: starfive,jh7110-i2stx1
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 9
>> +        clock-names:
>> +          minItems: 9
> 
> resets?> 
>> +      required:
>> +        - resets
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: starfive,jh7110-i2srx
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 9
>> +        clock-names:
>> +          minItems: 9
> 
> resets?
> 
>> +      required:
>> +        - resets
>> +        - starfive,syscon
>> +    else:
>> +      properties:
>> +        starfive,syscon: false
>>  
>>  required:
>>    - compatible
> 

Best regards,
Xingyu Wu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
