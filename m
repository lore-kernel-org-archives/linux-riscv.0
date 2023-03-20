Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A88C7618A
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 07:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DFN6GKuVurBcKUWw8BOv+DjJqqEEjBU0REcTLNwdtBY=; b=E4DaKGpkLyXkAx
	HRpzMZoFtKpukgQ4HZt8df9DFI0jUSKdXWIJqfrOBKj0v6IpZT/0zRWzEIrLu9gUzrhzqxSq1mgGl
	D2a9ti3r+yrbRVa7/CcPiamFgAGqSZMQ6qRg8UB1y2KnsSuseYFVEuOcNyvWZJHhnwXAPn3/iF7jV
	7dAQdrYOP6aSOruzu4XuWbvoDxQjN3zwv/SrkswIjdzGycJDRgrOHX3RTMFmiwxZDzvjhR+v1lDXJ
	ln+TX7WK3kqzIrBvHHA9PPv5t3AuHtzmGMl2mAyt9A343rtb6bcEC+wFtPZ5LHzB0QrFmUeNJ0KBx
	xZxWuCLPcIZQXylCv/yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe9y6-008JCT-2k;
	Mon, 20 Mar 2023 07:30:10 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe9y3-008JBt-1g
	for linux-riscv@lists.infradead.org;
	Mon, 20 Mar 2023 07:30:10 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 8E20B24E1DF;
	Mon, 20 Mar 2023 15:29:55 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 20 Mar
 2023 15:29:55 +0800
Received: from [192.168.125.128] (183.27.97.64) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 20 Mar
 2023 15:29:54 +0800
Message-ID: <ce674ea9-41ec-2862-c39c-207f0b6c45a2@starfivetech.com>
Date: Mon, 20 Mar 2023 15:29:46 +0800
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
 <45221a1c-dc01-2759-3e32-658636625529@starfivetech.com>
 <a6b9bab2-4151-c811-85ff-2424866e21d8@linaro.org>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <a6b9bab2-4151-c811-85ff-2424866e21d8@linaro.org>
X-Originating-IP: [183.27.97.64]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_003007_876795_39A4A313 
X-CRM114-Status: GOOD (  15.38  )
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

On 2023/3/20 14:37, Krzysztof Kozlowski wrote:
> On 20/03/2023 04:54, Xingyu Wu wrote:
>> On 2023/3/19 20:28, Krzysztof Kozlowski wrote:
>>> On 16/03/2023 04:05, Xingyu Wu wrote:
>>>> Add optional compatible and patternProperties.
>>>>
>>>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>>>> ---
>>>>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 39 ++++++++++++++++---
>>>>  1 file changed, 33 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>>>> index ae7f1d6916af..b61d8921ef42 100644
>>>> --- a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>>>> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>>>> @@ -15,16 +15,31 @@ description: |
>>>>  
>>>>  properties:
>>>>    compatible:
>>>> -    items:
>>>> -      - enum:
>>>> -          - starfive,jh7110-aon-syscon
>>>> -          - starfive,jh7110-stg-syscon
>>>> -          - starfive,jh7110-sys-syscon
>>>> -      - const: syscon
>>>> +    oneOf:
>>>> +      - items:
>>>> +          - enum:
>>>> +              - starfive,jh7110-aon-syscon
>>>> +              - starfive,jh7110-stg-syscon
>>>> +              - starfive,jh7110-sys-syscon
>>>> +          - const: syscon
>>>> +      - items:
>>>> +          - enum:
>>>> +              - starfive,jh7110-aon-syscon
>>>> +              - starfive,jh7110-stg-syscon
>>>> +              - starfive,jh7110-sys-syscon
>>>> +          - const: syscon
>>>> +          - const: simple-mfd
>>>>  
>>>>    reg:
>>>>      maxItems: 1
>>>>  
>>>> +patternProperties:
>>>> +  # Optional children
>>>> +  "pll-clock-controller":
>>>
>>> It's not a pattern.
>> 
>> Does it use 'properties' instead of 'patternProperties'?
> 
> Yes.
> 
>> 
>>>
>>> Anyway should be clock-controller
>> 
>> Will fix.
>> 
>>>
>>>> +    type: object
>>>> +    $ref: /schemas/clock/starfive,jh7110-pll.yaml#
>>>> +    description: Clock provider for PLL.
>>>> +
>>>
>>> You just added these bindings! So the initial submission was incomplete
>>> on purpose?
>>>
>>> No, add complete bindings.
>> 
>> Does you mean that it should drop the 'description', or add complete 'description',
>> or add 'compatible', 'clocks' and 'clock-cells' of complete clock-controller bindings?
> 
> It means it should be squashed with the patch which adds it.

Should I drop the 'decription' here and keep the 'decription' in patch1?

> 
>> 
>>>
>>>>  required:
>>>>    - compatible
>>>>    - reg
>>>> @@ -38,4 +53,16 @@ examples:
>>>>          reg = <0x10240000 0x1000>;
>>>>      };
>>>>  
>>>> +  - |
>>>> +    syscon@13030000 {
>>>
>>> No need for new example... Just put it in existing one.
>>>
>> 
>> Actually, the PLL clock-controller are just set in sys-syscon resgisters. The stg-syscon and
>> aon-syscon don't need it. So PLL clock-controller node only is added in sys-syscon node.
> 
> So why having other examples if they are included here? Drop them.
> 

Should I drop the old example of stg-syscon and add a new example of sys-syscon which
include clock-controller child node?

Best regards,
Xingyu Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
