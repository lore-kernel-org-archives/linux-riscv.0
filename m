Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57378C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 08:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jFI6uqIubK9iKqexAcyAw5FcZnFoSg5nRb//2ZkgT88=; b=turxHiIH3/duoY
	rSc67o7OzUFlEec+tqsK3fzK/DQ8PJLpYJ+mw8vuqo28106MOT4+SUxwr/YptKy/hAXCHStWLK084
	cM07l03+JwNMrxKecIXzSCGQ9EBg81adkpYva+yCbFGRItYyw9QMxgeqDvhxYTgTadUhiNdDF3B/n
	Xx+155yisBzZJcOlIMpm6gT9SZtUUS3SFhVKXp6rr2C5p7jk7nuXoQu+E/LT/Xs51Z2llRrreGE3g
	ZrzMs9hQiadR1ESawUMA0DlaAKhlhlsDEichpWMhSIrz6x2dWz2jibS6192ysn/4/1l8p89GUwaEQ
	35vLa1H3OJnRQeEmXsVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV73h-00FYh8-Ja; Thu, 23 Feb 2023 08:34:33 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV73d-00FYeK-RJ
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 08:34:32 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 24D1F24E277;
	Thu, 23 Feb 2023 16:33:42 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 23 Feb
 2023 16:33:42 +0800
Received: from [192.168.125.128] (113.72.147.165) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 23 Feb
 2023 16:33:41 +0800
Message-ID: <1d215c21-ccad-742f-447b-4aa5e42a4d83@starfivetech.com>
Date: Thu, 23 Feb 2023 16:34:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 1/3] dt-bindings: clock: Add StarFive JH7110 PLL clock
 generator
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Emil Renner Berthing
	<kernel@esmil.dk>, "Rob Herring" <robh+dt@kernel.org>, Conor Dooley
	<conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal Feng
	<hal.feng@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
References: <20230221141147.303642-1-xingyu.wu@starfivetech.com>
 <20230221141147.303642-2-xingyu.wu@starfivetech.com>
 <c0df5685-d0ef-705c-9684-86928dd68ab5@linaro.org>
Content-Language: en-US
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <c0df5685-d0ef-705c-9684-86928dd68ab5@linaro.org>
X-Originating-IP: [113.72.147.165]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_003430_207914_FE92BC1D 
X-CRM114-Status: GOOD (  15.56  )
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

On 2023/2/22 17:11, Krzysztof Kozlowski wrote:
> On 21/02/2023 15:11, Xingyu Wu wrote:
>> Add bindings for the PLL clock generator on the JH7110 RISC-V SoC.
> 
> Just one sentence... not explaining anything around ABI break. Nope.
> 
>> 
>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>> ---
>>  .../bindings/clock/starfive,jh7110-pll.yaml   | 45 +++++++++++++++++++
>>  .../dt-bindings/clock/starfive,jh7110-crg.h   | 12 ++---
>>  2 files changed, 52 insertions(+), 5 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml
>> new file mode 100644
>> index 000000000000..8fd18e6c2e9b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml
>> @@ -0,0 +1,45 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/starfive,jh7110-pll.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: StarFive JH7110 PLL Clock Generator
>> +
>> +maintainers:
>> +  - Xingyu Wu <xingyu.wu@starfivetech.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: starfive,jh7110-pll
>> +
>> +  clocks:
>> +    maxItems: 1
>> +      - description: Main Oscillator (24 MHz)
> 
> Does not look like you tested the bindings. Please run `make
> dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).

Remove the ' - ' before 'description' and pass the dt_binding_check.

> 
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +    description:
>> +      See <dt-bindings/clock/starfive,jh7110-crg.h> for valid indices.
>> +
>> +  starfive,sysreg:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> 
> That's not how the property is modeled... look at other code.

Remove the '-array'.

> 
>> +    description:
>> +      the phandle to System Register Controller syscon node.
>> +
>> +required:
>> +  - compatible
>> +  - clocks
>> +  - '#clock-cells'
>> +  - starfive,sysreg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    pllclk: pll-clock-controller {
>> +      compatible = "starfive,jh7110-pll";
>> +      clocks = <&osc>;
>> +      #clock-cells = <1>;
>> +      starfive,sysreg = <&sys_syscon>;
>> +    };
>> diff --git a/include/dt-bindings/clock/starfive,jh7110-crg.h b/include/dt-bindings/clock/starfive,jh7110-crg.h
>> index 5e4f21ca0642..086a6ddcf380 100644
>> --- a/include/dt-bindings/clock/starfive,jh7110-crg.h
>> +++ b/include/dt-bindings/clock/starfive,jh7110-crg.h
>> @@ -6,6 +6,12 @@
>>  #ifndef __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
>>  #define __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
>>  
>> +/* PLL clocks */
>> +#define JH7110_CLK_PLL0_OUT			0
>> +#define JH7110_CLK_PLL1_OUT			1
>> +#define JH7110_CLK_PLL2_OUT			2
>> +#define JH7110_PLLCLK_END			3
>> +
>>  /* SYSCRG clocks */
>>  #define JH7110_SYSCLK_CPU_ROOT			0
>>  #define JH7110_SYSCLK_CPU_CORE			1
>> @@ -198,11 +204,7 @@
>>  #define JH7110_SYSCLK_TDM_TDM_INV		188
>>  #define JH7110_SYSCLK_JTAG_CERTIFICATION_TRNG	189
>>  
>> -#define JH7110_SYSCLK_PLL0_OUT			190
>> -#define JH7110_SYSCLK_PLL1_OUT			191
>> -#define JH7110_SYSCLK_PLL2_OUT			192
>> -
> 
> 
> NAK. ABI break. You have entire commit msg to explain this and avoid
> questions from reviewers.
> 

Discussed with Hal.Feng to delete this part and move it to driver in his next patch series.

Best regards,
Xingyu Wu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
