Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEAFEB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 07:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YfrhBiDFrIYlACXaWNeetjvpX6HTAtrcosvdzcmAlNU=; b=rsUEC6Fc0ou1rd
	sri23buaMxwMQrukDLrs2KD4tH2uJz1TiU6aYrp/m+A9qSmxQohAixlP9ptJ2mB46HlFNaEsx27NA
	lQyVoLtTmLGytGrplJoflUAXvOvld5nnGaWmbT9TzF7H+lTEMEu2+peoyIvAhOMefph4faJtBCLPS
	G3C38BueRonb4M3kj8cNqn7nWflRTGnOIgN6+AgAurmVVvUKPGXY4vMIQmkMJ2RWjhfjiisF8LflK
	uJZKh6W5YMUec8F5JXo4UyLsAwcLxWjQYPeNuiOBL2gH5ZiMuFStI9JnoWL4v3W7yF+9Ro9/+BwQ3
	9sfzojJOC3w/JYnU+VFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKD50-005HA0-1s;
	Fri, 14 Jul 2023 07:19:06 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKD4v-005H7F-3A
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 07:19:04 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id AF7978421;
	Fri, 14 Jul 2023 15:18:22 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 14 Jul
 2023 15:18:22 +0800
Received: from [192.168.120.57] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 14 Jul
 2023 15:18:21 +0800
Message-ID: <43ee3d3f-9ac9-f77b-dc4e-c44705f6efb3@starfivetech.com>
Date: Fri, 14 Jul 2023 15:18:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/3] dt-bindings: spi: add reference file to YAML
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Linus Walleij
	<linus.walleij@linaro.org>
References: <20230713090015.127541-1-william.qiu@starfivetech.com>
 <20230713090015.127541-2-william.qiu@starfivetech.com>
 <3365c703-5e5c-de7e-3ce3-047c9ac560ee@linaro.org>
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <3365c703-5e5c-de7e-3ce3-047c9ac560ee@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_001902_377422_5BE79BF5 
X-CRM114-Status: GOOD (  11.45  )
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



On 2023/7/13 18:12, Krzysztof Kozlowski wrote:
> On 13/07/2023 11:00, William Qiu wrote:
>> Add primecell.yaml as a refereence file to YAML.
> 
> This we see from the diff, but why you are doing it? Please provide
> rationale and answer to "why" in your commits.
> 
> Also typo: reference.
> 
>> 
>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>> ---
>>  Documentation/devicetree/bindings/spi/spi-pl022.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/spi/spi-pl022.yaml b/Documentation/devicetree/bindings/spi/spi-pl022.yaml
>> index 91e540a92faf..5e5a704a766e 100644
>> --- a/Documentation/devicetree/bindings/spi/spi-pl022.yaml
>> +++ b/Documentation/devicetree/bindings/spi/spi-pl022.yaml
>> @@ -11,6 +11,7 @@ maintainers:
>>  
>>  allOf:
>>    - $ref: spi-controller.yaml#
>> +  - $ref: /schemas/arm/primecell.yaml#
>>  
>>  # We need a select here so we don't match all nodes with 'arm,primecell'
>>  select:
> 
> Best regards,
> Krzysztof
> 
I will explain it in next version.

Best regards,
William

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
