Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41AF1C7618A
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 08:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9CbxBzyH1y7HKZn0iA4/OyqO2cDuQyoeZwDg7fBAc+A=; b=JEJkBBC4GhG7X+
	HPmimJYwy5Dj8sWUvkIeWjRyudHe6eWqP2vuYzw3h8YYPv/9NP6RzzQWVilQdLuoHmKvjiyWlXPvw
	0eKTvRMeY55Vb42FVMlKQeF2uVFOFNF+creJb8/6ofl9M1EOQf1dySjUcL6c2Rx/I3Ky8iJq+01yx
	FgeUXnLpOJR0XsLnR681zC+ZsrHWeD0gm46tbjnACih32tIE1Bsp6VP1LUqPsVS98IwMD3/BfQDMV
	+1911BmJQNswO2npiQHETSRS4UlPiCiGu4jYK1RzvITS3ZtItZAVRG/sWajrfCv29Rr+kM2mXz87/
	LJZyFe3mSpCGUyC1RmsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peAqt-008NYv-2V;
	Mon, 20 Mar 2023 08:26:47 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peAqp-008NWn-00
	for linux-riscv@lists.infradead.org;
	Mon, 20 Mar 2023 08:26:45 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 2A62824E284;
	Mon, 20 Mar 2023 16:26:18 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 20 Mar
 2023 16:26:18 +0800
Received: from [192.168.125.128] (183.27.97.64) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 20 Mar
 2023 16:26:17 +0800
Message-ID: <2eb0380e-bbb7-83fd-3916-9bdd8b068334@starfivetech.com>
Date: Mon, 20 Mar 2023 16:26:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 3/6] dt-bindings: soc: starfive: syscon: Add optional
 patternProperties
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, William Qiu
	<william.qiu@starfivetech.com>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>,
	"Emil Renner Berthing" <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal Feng
	<hal.feng@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
References: <20230316030514.137427-1-xingyu.wu@starfivetech.com>
 <20230316030514.137427-4-xingyu.wu@starfivetech.com>
 <1f352445-4677-e33b-be14-c76bd7ffa188@linaro.org>
 <45221a1c-dc01-2759-3e32-658636625529@starfivetech.com>
 <a6b9bab2-4151-c811-85ff-2424866e21d8@linaro.org>
 <ce674ea9-41ec-2862-c39c-207f0b6c45a2@starfivetech.com>
 <a65697f4-0a75-23e2-517c-2784b0c382bc@linaro.org>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <a65697f4-0a75-23e2-517c-2784b0c382bc@linaro.org>
X-Originating-IP: [183.27.97.64]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_012643_322719_73EFCC10 
X-CRM114-Status: GOOD (  19.48  )
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

On 2023/3/20 15:40, Krzysztof Kozlowski wrote:
> On 20/03/2023 08:29, Xingyu Wu wrote:
>> On 2023/3/20 14:37, Krzysztof Kozlowski wrote:
>>> On 20/03/2023 04:54, Xingyu Wu wrote:
>>>> On 2023/3/19 20:28, Krzysztof Kozlowski wrote:
>>>>> On 16/03/2023 04:05, Xingyu Wu wrote:
>>>>>> Add optional compatible and patternProperties.
>>>>>>
>>>>>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>>>>>> ---
>>>>>>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 39 ++++++++++++++++---
>>>>>>  1 file changed, 33 insertions(+), 6 deletions(-)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>>>>>> index ae7f1d6916af..b61d8921ef42 100644
>>>>>> --- a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>>>>>> @@ -15,16 +15,31 @@ description: |
>>>>>>  
>>>>>>  properties:
>>>>>>    compatible:
>>>>>> -    items:
>>>>>> -      - enum:
>>>>>> -          - starfive,jh7110-aon-syscon
>>>>>> -          - starfive,jh7110-stg-syscon
>>>>>> -          - starfive,jh7110-sys-syscon
>>>>>> -      - const: syscon
>>>>>> +    oneOf:
>>>>>> +      - items:
>>>>>> +          - enum:
>>>>>> +              - starfive,jh7110-aon-syscon
>>>>>> +              - starfive,jh7110-stg-syscon
>>>>>> +              - starfive,jh7110-sys-syscon
>>>>>> +          - const: syscon
>>>>>> +      - items:
>>>>>> +          - enum:
>>>>>> +              - starfive,jh7110-aon-syscon
>>>>>> +              - starfive,jh7110-stg-syscon
>>>>>> +              - starfive,jh7110-sys-syscon
>>>>>> +          - const: syscon
>>>>>> +          - const: simple-mfd
> 
> BTW, this also looks wrong. You just said that clock controller exists
> only in few variants. Also, why sometimes the same device  goes with
> simple-mfd and sometimies without? It's the same device.

Oh yes, If modified to:

oneOf:
      - items:
          - enum:
              - starfive,jh7110-aon-syscon
              - starfive,jh7110-stg-syscon
          - const: syscon
      - items:
          - const: starfive,jh7110-sys-syscon
          - const: syscon
          - const: simple-mfd

Or:

     - minItems: 2
       items:
         - enum:
             - starfive,jh7110-aon-syscon
             - starfive,jh7110-stg-syscon
             - starfive,jh7110-sys-syscon
         - const: syscon
         - const: simple-mfd


Which one is better?

> 
>>>>>>  
>>>>>>    reg:
>>>>>>      maxItems: 1
>>>>>>  
>>>>>> +patternProperties:
>>>>>> +  # Optional children
>>>>>> +  "pll-clock-controller":
>>>>>
>>>>> It's not a pattern.
>>>>
>>>> Does it use 'properties' instead of 'patternProperties'?
>>>
>>> Yes.
>>>
>>>>
>>>>>
>>>>> Anyway should be clock-controller
>>>>
>>>> Will fix.
>>>>
>>>>>
>>>>>> +    type: object
>>>>>> +    $ref: /schemas/clock/starfive,jh7110-pll.yaml#
>>>>>> +    description: Clock provider for PLL.
>>>>>> +
>>>>>
>>>>> You just added these bindings! So the initial submission was incomplete
>>>>> on purpose?
>>>>>
>>>>> No, add complete bindings.
>>>>
>>>> Does you mean that it should drop the 'description', or add complete 'description',
>>>> or add 'compatible', 'clocks' and 'clock-cells' of complete clock-controller bindings?
>>>
>>> It means it should be squashed with the patch which adds it.
>> 
>> Should I drop the 'decription' here and keep the 'decription' in patch1?
> 
> There should be no this patch at all. However I do not understand what
> you want to do with description. What's wrong with description?

I thought you were commenting under description, saying a conflict with pll dtbindings' description.
Is that mean I should add it in the syscon patch fo william not this patchset?

>> 
>>>
>>>>
>>>>>
>>>>>>  required:
>>>>>>    - compatible
>>>>>>    - reg
>>>>>> @@ -38,4 +53,16 @@ examples:
>>>>>>          reg = <0x10240000 0x1000>;
>>>>>>      };
>>>>>>  
>>>>>> +  - |
>>>>>> +    syscon@13030000 {
>>>>>
>>>>> No need for new example... Just put it in existing one.
>>>>>
>>>>
>>>> Actually, the PLL clock-controller are just set in sys-syscon resgisters. The stg-syscon and
>>>> aon-syscon don't need it. So PLL clock-controller node only is added in sys-syscon node.
>>>
>>> So why having other examples if they are included here? Drop them.
>>>
>> 
>> Should I drop the old example of stg-syscon and add a new example of sys-syscon which
>> include clock-controller child node?
> 
> No, there should be no stg-syscon example, it's useless.
> 

Thanks. I will remind william to use sys-syscon example instead.

Best regards,
Xingyu Wu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
