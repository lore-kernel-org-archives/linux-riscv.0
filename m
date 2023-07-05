Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14FAEB64D9
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 03:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tXKE+6AzvG03PTzRWBVEilO/N/JikpOOAN5Ls4yqUfk=; b=NK29QUJhtnImRx
	G+Qnm0hsp0ucs6UpYEoZRaUXQhXJX9sh4c16HRgqA3S13+8cJWCGeHHg0z3OLbw3qo3fxd4JLPeoO
	tQBjOimJmfl0x3sCn2f3qHO0yP7iwg6Hx0AW35pib2FaVB9m8EyhostayV23x5pMc/0q8uhCG04AO
	4BAbHxd7HIMS8Bl8gwMBWHMRqQNu6GD+Q1R9q14oZvBumkdsHOOOFM7m9k3bw3tcL7YYeqBqHptj5
	iIb0FUsrVzLdBbBNv/aoAzaz37FrmhYLOyQBFRLJIw/3TTpbAVvvPaRomIt5jsVJu+x6hV3nlVsNo
	Kzhvl7FJS1Kcvq/2sviQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGtLR-00EhPh-28;
	Wed, 05 Jul 2023 03:38:21 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGtLN-00EhOO-1w
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 03:38:19 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 6E85B24E24B;
	Wed,  5 Jul 2023 11:37:41 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 5 Jul
 2023 11:37:41 +0800
Received: from [192.168.120.57] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 5 Jul
 2023 11:37:40 +0800
Message-ID: <c5027d42-b9be-090d-bd43-86c9b1448c99@starfivetech.com>
Date: Wed, 5 Jul 2023 11:37:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND v1 1/2] dt-binding: spi: constrain minItems of clocks and
 clock-names
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Linus Walleij
	<linus.walleij@linaro.org>
References: <20230704092200.85401-1-william.qiu@starfivetech.com>
 <20230704092200.85401-2-william.qiu@starfivetech.com>
 <1b65e8d1-d5e1-0d6b-1248-d9683be44db8@linaro.org>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <1b65e8d1-d5e1-0d6b-1248-d9683be44db8@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_203817_806954_5497B053 
X-CRM114-Status: GOOD (  15.01  )
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



On 2023/7/4 17:38, Krzysztof Kozlowski wrote:
> On 04/07/2023 11:21, William Qiu wrote:
>> The SPI controller only need apb_pclk clock to work properly on JH7110 SoC,
>> so there add minItems whose value is equal to 1. Other platforms do not
>> have this constraint.
>> 
>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> 
> I don't get why this is resent, but subject prefix is still wrong. It's
> dt-bindings.
> 
Will update.
>> ---
>>  Documentation/devicetree/bindings/spi/spi-pl022.yaml | 11 ++++++++---
>>  1 file changed, 8 insertions(+), 3 deletions(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/spi/spi-pl022.yaml b/Documentation/devicetree/bindings/spi/spi-pl022.yaml
>> index 91e540a92faf..42bb34c39971 100644
>> --- a/Documentation/devicetree/bindings/spi/spi-pl022.yaml
>> +++ b/Documentation/devicetree/bindings/spi/spi-pl022.yaml
>> @@ -11,6 +11,7 @@ maintainers:
>> 
>>  allOf:
>>    - $ref: spi-controller.yaml#
>> +  - $ref: /schemas/arm/primecell.yaml#
> 
> This looks unrelated, so keep it as separate commit with its own rationale.
> 
Because "arm,primecell-periphid"  is need in JH7110 SoC, so I added them in
one commit, so do I need to put them in two commit?
>> 
>>  # We need a select here so we don't match all nodes with 'arm,primecell'
>>  select:
>> @@ -34,12 +35,16 @@ properties:
>>      maxItems: 1
>> 
>>    clocks:
>> +    minItems: 1
>>      maxItems: 2
>> 
>>    clock-names:
>> -    items:
>> -      - const: sspclk
>> -      - const: apb_pclk
>> +    oneOf:
>> +      - items:
>> +          - const: apb_pclk
>> +      - items:
>> +          - const: sspclk
>> +          - const: apb_pclk
> 
> Are you sure that your clock is APB pclk in such case?
> 
Yes, in JH7110 SoC is APB pclk in such case.

Thanks for taking time to review this patch series.
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
