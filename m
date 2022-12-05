Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0146FC4321E
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 03:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l9khLoig/ccpGzw+ChxDzZL6YcejHvqZM27Zh+5eaco=; b=wQDkT6E59rSNlV
	/klNWsr/QOxle3KqD6hCRz3tnrPRCSgJiqcNqEdaoeXe1m5mbRcD4WMBZ33o50oD0pi6ewMS0ep5S
	Xtm+PUBdy6dl7IGNYMa9pV7keS73V3W4d2GM5XcgR+VU74qcuUr4A6fy1OKlljpY2yVC9uhtcPu3I
	y1Q7nc+UR4rYS0NAx0IeabOQ5cmgOwZib0JiWwYeYlAqNJJv4/Kr53AqSutef6ci60g9LlKzGhRvj
	NnFd/Ms0FWyItcRPwfLeSk5YoMtJv+SC1YKUqU7Ynda171xz0CwJZUxC9jh1PfJ5oPLO+pYquSFlo
	2jJS7EOiMpkj3j0YaAPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p22XZ-00DBDH-Ex; Mon, 05 Dec 2022 03:53:13 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p22XV-00DAyd-DN
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 03:53:12 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 95AC424E1CF;
	Mon,  5 Dec 2022 11:52:23 +0800 (CST)
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 5 Dec
 2022 11:52:23 +0800
Received: from [192.168.125.128] (113.72.146.33) by EXMBX161.cuchost.com
 (172.16.6.71) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 5 Dec
 2022 11:52:22 +0800
Message-ID: <e0551ed7-2208-6d08-235b-993702f0d89b@starfivetech.com>
Date: Mon, 5 Dec 2022 11:49:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 1/3] dt-bindings: watchdog: Add watchdog for StarFive
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-watchdog@vger.kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Wim Van
 Sebroeck" <wim@linux-watchdog.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Samin Guo <samin.guo@starfivetech.com>, Guenter Roeck <linux@roeck-us.net>,
	<linux-kernel@vger.kernel.org>
References: <20221202093943.149674-1-xingyu.wu@starfivetech.com>
 <20221202093943.149674-2-xingyu.wu@starfivetech.com>
 <cb8deb55-902a-0058-4764-a5f391f8de6d@linaro.org>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <cb8deb55-902a-0058-4764-a5f391f8de6d@linaro.org>
X-Originating-IP: [113.72.146.33]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX161.cuchost.com
 (172.16.6.71)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_195309_756478_A483ACC4 
X-CRM114-Status: GOOD (  14.18  )
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

On 2022/12/2 18:46, Krzysztof Kozlowski wrote:
> On 02/12/2022 10:39, xingu.wu wrote:
>> From: Xingyu Wu <xingyu.wu@starfivetech.com>
>> 
>> Add bindings to describe the watchdog for the StarFive SoCs.
>> 
>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>> ---
>>  .../bindings/watchdog/starfive,wdt.yaml       | 77 +++++++++++++++++++
>>  1 file changed, 77 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/watchdog/starfive,wdt.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/watchdog/starfive,wdt.yaml b/Documentation/devicetree/bindings/watchdog/starfive,wdt.yaml
>> new file mode 100644
>> index 000000000000..ece3e80153a0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/watchdog/starfive,wdt.yaml
> 
> Filename should be based on compatible. You do not allow here any other
> models... If you intent and you are 100% sure you will grow with new
> models, make it maybe a family-based name.

First, thank you for your reply. We have some other SoCs like JH7100 would use
this watchdog driver, but we now use JH7110 as our main release chip.
As you say, should we use "starfive,jh71xx-wdt.yaml" as filename?


>> @@ -0,0 +1,77 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/watchdog/starfive,wdt.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: StarFive Watchdog
>> +
>> +allOf:
>> +  - $ref: "watchdog.yaml#"
> 
> Drop quotes.

Will fix.
>> +
>> +maintainers:
>> +  - Samin Guo <samin.guo@starfivetech.com>
>> +  - Xingyu Wu <xingyu.wu@starfivetech.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: starfive,jh7110-wdt
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: Core clock
>> +      - description: APB clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core_clk
> 
> Drop _clk

Will fix.

> 
>> +      - const: apb_clk
> 
> Drop _clk

Will fix.

> 
>> +
>> +  resets:
>> +    items:
>> +      - description: APB reset
>> +      - description: Core reset
>> +
>> +  reset-names:
>> +    items:
>> +      - const: rst_apb
> 
> Drop rst_

Will fix.

> 
>> +      - const: rst_core
> 
> Ditto

Will fix.

> 
>> +
>> +  timeout-sec: true
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - reset-names
>> +  - timeout-sec
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/starfive-jh7110.h>
>> +    #include <dt-bindings/reset/starfive-jh7110.h>
>> +
>> +    watchdog@13070000 {
>> +            compatible = "starfive,jh7110-wdt";
> 
> Use 4 spaces for example indentation.

Will fix.

> 
>> +            reg = <0x13070000 0x10000>;
>> +            interrupts = <68>;
>> +            clocks = <&syscrg_clk JH7110_SYSCLK_WDT_CORE>,
>> +                     <&syscrg_clk JH7110_SYSCLK_WDT_APB>;
>> +            clock-names = "core_clk", "apb_clk";
>> +            resets = <&syscrg_rst JH7110_SYSRST_WDT_APB>,
>> +                     <&syscrg_rst JH7110_SYSRST_WDT_CORE>;
>> +            reset-names = "rst_apb", "rst_core";
>> +            timeout-sec = <15>;
>> +    };
>> +
> 
> Drop trailing line.

Will fix.

Best regards,
Xingyu Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
