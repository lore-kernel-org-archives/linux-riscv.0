Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6866C6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 03:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eeJoHaWd4Y8t0UGbUMYdtjovmostRvAQHYgOJZtw3go=; b=TXY7GvcFE7dcdB
	MH/tMcxa0dmzRZ5sIjS14kg+fbueMlR7bDlzvIDVEDCzlSQKJBeDxVeQ/QwPtTuaHiXsYkdcFyL10
	2f/TsVhuJGrl84UBgqEGNUbSIWe3Ch3qoSQ6O6DBsaVyXDsJCi8b4cTT2Xp0jTGX2JpLD0Oay7f5c
	DeNn6uiqAxkduckZeeuMcEY//DRw9jWsqF5M4C7EDl/+Okwher+NbifdU4JXxuWEmJlMaoE9zYPfV
	ju+vhvAozhvg+Vstwc1lTQQA6BsdiIajcvLnEqJcMjaKpqYWBRb+c6USxR2gfndbGpKU25zCvcPo/
	tQ2kNbvf9JSGcydKYnMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe6bw-0081b5-2l;
	Mon, 20 Mar 2023 03:55:04 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe6bs-0081Z3-35
	for linux-riscv@lists.infradead.org;
	Mon, 20 Mar 2023 03:55:03 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 8D4D524E2B0;
	Mon, 20 Mar 2023 11:54:34 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 20 Mar
 2023 11:54:34 +0800
Received: from [192.168.125.128] (183.27.97.64) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 20 Mar
 2023 11:54:33 +0800
Message-ID: <45221a1c-dc01-2759-3e32-658636625529@starfivetech.com>
Date: Mon, 20 Mar 2023 11:54:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 3/6] dt-bindings: soc: starfive: syscon: Add optional
 patternProperties
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>,
	"Emil Renner Berthing" <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal Feng
	<hal.feng@starfivetech.com>, William Qiu <william.qiu@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20230316030514.137427-1-xingyu.wu@starfivetech.com>
 <20230316030514.137427-4-xingyu.wu@starfivetech.com>
 <1f352445-4677-e33b-be14-c76bd7ffa188@linaro.org>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <1f352445-4677-e33b-be14-c76bd7ffa188@linaro.org>
X-Originating-IP: [183.27.97.64]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_205501_300839_29B84EEC 
X-CRM114-Status: GOOD (  15.40  )
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

On 2023/3/19 20:28, Krzysztof Kozlowski wrote:
> On 16/03/2023 04:05, Xingyu Wu wrote:
>> Add optional compatible and patternProperties.
>> 
>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>> ---
>>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 39 ++++++++++++++++---
>>  1 file changed, 33 insertions(+), 6 deletions(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>> index ae7f1d6916af..b61d8921ef42 100644
>> --- a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>> @@ -15,16 +15,31 @@ description: |
>>  
>>  properties:
>>    compatible:
>> -    items:
>> -      - enum:
>> -          - starfive,jh7110-aon-syscon
>> -          - starfive,jh7110-stg-syscon
>> -          - starfive,jh7110-sys-syscon
>> -      - const: syscon
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - starfive,jh7110-aon-syscon
>> +              - starfive,jh7110-stg-syscon
>> +              - starfive,jh7110-sys-syscon
>> +          - const: syscon
>> +      - items:
>> +          - enum:
>> +              - starfive,jh7110-aon-syscon
>> +              - starfive,jh7110-stg-syscon
>> +              - starfive,jh7110-sys-syscon
>> +          - const: syscon
>> +          - const: simple-mfd
>>  
>>    reg:
>>      maxItems: 1
>>  
>> +patternProperties:
>> +  # Optional children
>> +  "pll-clock-controller":
> 
> It's not a pattern.

Does it use 'properties' instead of 'patternProperties'?

> 
> Anyway should be clock-controller

Will fix.

> 
>> +    type: object
>> +    $ref: /schemas/clock/starfive,jh7110-pll.yaml#
>> +    description: Clock provider for PLL.
>> +
> 
> You just added these bindings! So the initial submission was incomplete
> on purpose?
> 
> No, add complete bindings.

Does you mean that it should drop the 'description', or add complete 'description',
or add 'compatible', 'clocks' and 'clock-cells' of complete clock-controller bindings?

> 
>>  required:
>>    - compatible
>>    - reg
>> @@ -38,4 +53,16 @@ examples:
>>          reg = <0x10240000 0x1000>;
>>      };
>>  
>> +  - |
>> +    syscon@13030000 {
> 
> No need for new example... Just put it in existing one.
> 

Actually, the PLL clock-controller are just set in sys-syscon resgisters. The stg-syscon and
aon-syscon don't need it. So PLL clock-controller node only is added in sys-syscon node.

Best regards,
Xingyu Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
