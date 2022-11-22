Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791B0C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 13:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MpM/aPS3AuFC6LADuW9elk24yuvY0jivZiTHNKfflnA=; b=w1P40IiI75NHYq
	mMMVkW5S5HZ+8uYhVAArYP4HOurpbkm8G0oKE6Rnls6ieenK7Weu8aPjff+eRhqHHBn66wup0H1nF
	jlf03x/fZZpaUb7/eqeuIZuW9O0iFRWRfJ+VuFW5SGjUuxy4C8M5kzDl9Mj5SadqKGywfszMRwj2H
	8o9wi1T2pDC6vHRUPFWjzyklgko+3YXGf6yiLlJpg/2aP+kF9/lP2GU8MM3l7lT5kfVnvBBxzyvt8
	ZtlVVz19U8RaeEz/Y6gignYVWdQQXzLvxpsEcByBcip1KTwlF+F5bdBSUQdqqmW0xQo72qK9/fDTc
	v73V42PEwcDtSAXv7kEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxTEP-009c9e-Pb; Tue, 22 Nov 2022 13:22:33 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxTEM-009buZ-F3
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 13:22:32 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id D43AC24E1BB;
	Tue, 22 Nov 2022 21:22:04 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 22 Nov
 2022 21:22:05 +0800
Received: from [192.168.125.96] (113.72.144.23) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 22 Nov
 2022 21:22:03 +0800
Message-ID: <f21b0aa9-2ac8-ae28-755a-d530171f930a@starfivetech.com>
Date: Tue, 22 Nov 2022 21:22:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 2/4] dt-bindings: power: Add starfive,jh71xx-power
 bindings
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-riscv@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20221118133216.17037-1-walker.chen@starfivetech.com>
 <20221118133216.17037-3-walker.chen@starfivetech.com>
 <99302e53-c0c9-cfe8-4e6a-c70e8428d9c3@linaro.org>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <99302e53-c0c9-cfe8-4e6a-c70e8428d9c3@linaro.org>
X-Originating-IP: [113.72.144.23]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_052230_703489_4F738B72 
X-CRM114-Status: GOOD (  13.80  )
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

On 2022/11/21 18:13, Krzysztof Kozlowski wrote:
> On 18/11/2022 14:32, Walker Chen wrote:
>> Add bindings for the power domain controller on the StarFive JH71XX SoC.
>> 
> 
> Subject: drop second, redundant "bindings".

Will fix.

> 
>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>> ---
>>  .../bindings/power/starfive,jh71xx-power.yaml | 46 +++++++++++++++++++
> 
> 1st patch should be squashed here. Headers are part of bindings file.

Will be done in the next version of patch.

> 
>>  1 file changed, 46 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/power/starfive,jh71xx-power.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/power/starfive,jh71xx-power.yaml b/Documentation/devicetree/bindings/power/starfive,jh71xx-power.yaml
>> new file mode 100644
>> index 000000000000..2537303b4829
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/starfive,jh71xx-power.yaml
> 
> Filename like compatible.

As mentioned in the previous email, the compatible in the driver should be changed to "starfive,jh7110-power".

> 
>> @@ -0,0 +1,46 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/power/starfive,jh71xx-power.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: StarFive JH71xx Power Domains Controller
>> +
>> +maintainers:
>> +  - Walker Chen <walker.chen@starfivetech.com>
>> +
>> +description: |
>> +  StarFive JH71xx SoCs include support for multiple power domains which can be
>> +  powered on/off by software based on different application scenes to save power.
>> +
>> +properties:
>> +  compatible:
>> +    items:
> 
> No items. You have just one item,

Yes, this issue will be fixed. Thank you for your advice.

Best Regards,
Walker Chen


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
