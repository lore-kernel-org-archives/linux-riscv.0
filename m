Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2415BC6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 09:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=saS5OEy8+Ujvc9Rfa18GpUoMZDrfLYIk4gYTx9Yll1g=; b=03eR/OQlqYBJ9K
	KoxJSCvSxvymiqtFfiiSd79g7OMHb0nr2k655gatF3Bl7ZjDlYGJr2LdjVVtqvxTSkgbu7m4YMCyP
	rvrQxkRM9BPC1wSX79fEYPNYPeqMPqdVBvEXsL/Xy/uziDiAt2ZEoqiowPO5x15zZ1zpPsfETLb8b
	HnVDuXyQUpGLuxmPzo27f+7MvManxNOMXALPM0sDtD17ry2s8ZE7iP81AG1HSLfuWKFCDX1OFrR27
	8wPJc8Ya89ZmnNgTyPBbxTaYqRawERXGhsDp0KU+Ucpv19tbep6s5qlGzvzlm5BfJHIcCIcI+eUWb
	1hPhgR64jajjgpqlUi3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peBdG-008S2J-2t;
	Mon, 20 Mar 2023 09:16:46 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peBdC-008S14-0R
	for linux-riscv@lists.infradead.org;
	Mon, 20 Mar 2023 09:16:45 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 9508024E1B5;
	Mon, 20 Mar 2023 17:16:29 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 20 Mar
 2023 17:16:29 +0800
Received: from [192.168.125.128] (183.27.97.64) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 20 Mar
 2023 17:16:28 +0800
Message-ID: <e3604902-2b7d-6ca5-9523-04dc09c920ed@starfivetech.com>
Date: Mon, 20 Mar 2023 17:16:20 +0800
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
 <2eb0380e-bbb7-83fd-3916-9bdd8b068334@starfivetech.com>
 <8c5a7421-2948-674d-91a0-9cafe336401b@linaro.org>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <8c5a7421-2948-674d-91a0-9cafe336401b@linaro.org>
X-Originating-IP: [183.27.97.64]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_021642_456310_156B033D 
X-CRM114-Status: GOOD (  12.44  )
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

On 2023/3/20 16:36, Krzysztof Kozlowski wrote:
> On 20/03/2023 09:26, Xingyu Wu wrote:
>> On 2023/3/20 15:40, Krzysztof Kozlowski wrote:
>>> On 20/03/2023 08:29, Xingyu Wu wrote:
>>>> On 2023/3/20 14:37, Krzysztof Kozlowski wrote:
>>>>> On 20/03/2023 04:54, Xingyu Wu wrote:
>>>>>> On 2023/3/19 20:28, Krzysztof Kozlowski wrote:
>>>>>>> On 16/03/2023 04:05, Xingyu Wu wrote:
>>>>>>>> Add optional compatible and patternProperties.
>>>>>>>>
>>>>>>>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>>>>>>>> ---
>>>>>>>>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 39 ++++++++++++++++---
>>>>>>>>  1 file changed, 33 insertions(+), 6 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>>>>>>>> index ae7f1d6916af..b61d8921ef42 100644
>>>>>>>> --- a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>>>>>>>> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>>>>>>>> @@ -15,16 +15,31 @@ description: |
>>>>>>>>  
>>>>>>>>  properties:
>>>>>>>>    compatible:
>>>>>>>> -    items:
>>>>>>>> -      - enum:
>>>>>>>> -          - starfive,jh7110-aon-syscon
>>>>>>>> -          - starfive,jh7110-stg-syscon
>>>>>>>> -          - starfive,jh7110-sys-syscon
>>>>>>>> -      - const: syscon
>>>>>>>> +    oneOf:
>>>>>>>> +      - items:
>>>>>>>> +          - enum:
>>>>>>>> +              - starfive,jh7110-aon-syscon
>>>>>>>> +              - starfive,jh7110-stg-syscon
>>>>>>>> +              - starfive,jh7110-sys-syscon
>>>>>>>> +          - const: syscon
>>>>>>>> +      - items:
>>>>>>>> +          - enum:
>>>>>>>> +              - starfive,jh7110-aon-syscon
>>>>>>>> +              - starfive,jh7110-stg-syscon
>>>>>>>> +              - starfive,jh7110-sys-syscon
>>>>>>>> +          - const: syscon
>>>>>>>> +          - const: simple-mfd
>>>
>>> BTW, this also looks wrong. You just said that clock controller exists
>>> only in few variants. Also, why sometimes the same device  goes with
>>> simple-mfd and sometimies without? It's the same device.
>> 
>> Oh yes, If modified to:
>> 
>> oneOf:
>>       - items:
>>           - enum:
>>               - starfive,jh7110-aon-syscon
>>               - starfive,jh7110-stg-syscon
>>           - const: syscon
>>       - items:
>>           - const: starfive,jh7110-sys-syscon
>>           - const: syscon
>>           - const: simple-mfd
>> 
>> Or:
>> 
>>      - minItems: 2
>>        items:
>>          - enum:
>>              - starfive,jh7110-aon-syscon
>>              - starfive,jh7110-stg-syscon
>>              - starfive,jh7110-sys-syscon
>>          - const: syscon
>>          - const: simple-mfd
>> 
>> 
>> Which one is better?
> 
> If aon and stg are not supposed to have children, then only the first is
> correct. It's not which is better, the second is not really correct in
> such case.
> 

OK, will modify it in next version. Thanks.

Best regards,
Xingyu Wu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
