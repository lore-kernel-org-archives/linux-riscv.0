Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EBDC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 02:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I1k6jXcpXx2z5wmjva7YBzZ30DXXVyNM6H/+/CBDM/s=; b=niO69CE/pm0JhE
	gKBJ7jp0P4CM+AlgJ3eNZ53b06BPAPFLbUt/ibSdCCYwfXbEei45B4XNXyUthBHqP2/JBDzdaEUqL
	Ya5DmvTpW5wCKIQYCmvC7YMMFsp0iwZA7z9eLP0DPqcTG99NoyzXTKbJ+2He6YA3UoYli4tW2dAWJ
	h71lGqrLYIakrMRT04xyGws8mcNwRUHVgewJ1ARAjQbPQc04HQaOAQx+oWbZEKMhU3d0CjwyONzXp
	YR+bJ5R3M1Ss44TqPGIRd55iRTSi7+EqAiLll46wDSV8501CTsXwmqEUs3vh6qzV7UuS9uxdTO0+S
	QJqq/gPruGCZjjRAYDUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4Yqp-006nbx-Bz; Mon, 12 Dec 2022 02:47:31 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4Yqk-006n98-5d
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 02:47:30 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id CA32F24E0D6;
	Mon, 12 Dec 2022 10:46:28 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 12 Dec
 2022 10:46:28 +0800
Received: from [192.168.125.96] (113.72.147.126) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 12 Dec
 2022 10:46:28 +0800
Message-ID: <320c8cd8-ef52-77ac-45a8-3b4a800c009d@starfivetech.com>
Date: Mon, 12 Dec 2022 10:46:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RESEND PATCH v2 1/3] dt-bindings: power: Add starfive,jh71xx-pmu
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-riscv@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, "Rafael J . Wysocki"
	<rafael@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20221208084523.9733-1-walker.chen@starfivetech.com>
 <20221208084523.9733-2-walker.chen@starfivetech.com>
 <d0226fa9-9253-72fc-2fb0-5bfbbcba5d86@linaro.org>
Content-Language: en-US
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <d0226fa9-9253-72fc-2fb0-5bfbbcba5d86@linaro.org>
X-Originating-IP: [113.72.147.126]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221211_184726_642740_BD52C7C5 
X-CRM114-Status: GOOD (  13.14  )
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

On 2022/12/8 16:59, Krzysztof Kozlowski wrote:
> On 08/12/2022 09:45, Walker Chen wrote:
>> Add bindings for Power Management Unit (PMU) on the StarFive JH71XX SoC.
>> 
>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>> ---
>>  .../bindings/power/starfive,jh71xx-pmu.yaml   | 45 +++++++++++++++++++
>>  .../dt-bindings/power/starfive,jh7110-pmu.h   | 17 +++++++
>>  2 files changed, 62 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/power/starfive,jh71xx-pmu.yaml
> 
> Filename matching compatible, so:
> starfive,jh7110-pmu.yaml

OK, will be fixed.

> 
> 
>>  create mode 100644 include/dt-bindings/power/starfive,jh7110-pmu.h
>> 
>> diff --git a/Documentation/devicetree/bindings/power/starfive,jh71xx-pmu.yaml b/Documentation/devicetree/bindings/power/starfive,jh71xx-pmu.yaml
>> new file mode 100644
>> index 000000000000..f308ae136a57
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/starfive,jh71xx-pmu.yaml
>> @@ -0,0 +1,45 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/power/starfive,jh71xx-pmu.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: StarFive JH71xx Power Management Unit
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
>> +      - enum:
> 
> Wrong indentation.
> 
> Does not look like you tested the bindings. Please run `make
> dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).

This is my mistake, I forgot to make dt_binding_check for .yaml file.

> 
>> +          - starfive,jh7110-pmu
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  "#power-domain-cells":
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - "#power-domain-cells"
>> +
> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
