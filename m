Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E75EB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 06:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=if181sARjUikEqcM8Eo9XtyIyW4dhKWSSqKUo5HSvKs=; b=Q3mNUuhLywPr9X
	sQu2U2cISZDSu9U6nsLM2KwEjaxqwxaWyBtpGMokm8KNkcaCG7Mj5g/F1wXbhEzHZX7cMlR15QWo7
	uvLHwF6I0aCwAlwL5otwf0SBxI0OhMdNWOoEOZ+pgB0m/MKFV5KvZZqtBL6jbYVp2p92hfngqsutP
	jjF7UpwqNYeRI8WjSfiiIyHMomRu/mU/9XUYOGD/haHswzN7UpRwRZS7+HnNAv0AE5l4JVZ0wrck9
	fYLUkP3H5eJ1YmZNVue9RtgpfZo+jm+Q0aIAbqi08zxSMJREcoARdr7IJqKd7JoDT4QgS6pXWca30
	yRFEPW39snddlF+NfrpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKCI2-005AXa-2d;
	Fri, 14 Jul 2023 06:28:30 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKCHy-005AWG-1G
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 06:28:29 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 1A84324E2E3;
	Fri, 14 Jul 2023 14:27:42 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 14 Jul
 2023 14:27:42 +0800
Received: from [192.168.125.128] (183.27.98.46) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 14 Jul
 2023 14:27:40 +0800
Message-ID: <1b55f255-a9b2-1f0a-9b8b-11c787e76a75@starfivetech.com>
Date: Fri, 14 Jul 2023 14:24:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND PATCH v6 1/7] dt-bindings: clock: Add StarFive JH7110 PLL
 clock generator
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Hal
 Feng" <hal.feng@starfivetech.com>, William Qiu
	<william.qiu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
References: <20230704064610.292603-1-xingyu.wu@starfivetech.com>
 <20230704064610.292603-2-xingyu.wu@starfivetech.com>
 <CAJM55Z8vj6KvpKZxRVh0+G_LCXrpnXzOR+oBad-igkHVTD_J=Q@mail.gmail.com>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <CAJM55Z8vj6KvpKZxRVh0+G_LCXrpnXzOR+oBad-igkHVTD_J=Q@mail.gmail.com>
X-Originating-IP: [183.27.98.46]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_232826_819644_9CF8EC25 
X-CRM114-Status: GOOD (  15.89  )
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

On 2023/7/13 20:26, Emil Renner Berthing wrote:
> On Tue, 4 Jul 2023 at 08:49, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>>
>> Add bindings for the PLL clock generator on the JH7110 RISC-V SoC.
>>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>> ---
>>  .../bindings/clock/starfive,jh7110-pll.yaml   | 46 +++++++++++++++++++
>>  .../dt-bindings/clock/starfive,jh7110-crg.h   |  6 +++
>>  2 files changed, 52 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml
>> new file mode 100644
>> index 000000000000..beb78add5a8d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml
>> @@ -0,0 +1,46 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/starfive,jh7110-pll.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: StarFive JH7110 PLL Clock Generator
>> +
>> +description:
>> +  These PLLs are high speed, low jitter frequency synthesizers in JH7110.
> 
> ..synthesizers in the JH7110.

Will fix.

> 
>> +  Each PLL works in integer mode or fraction mode, with configuration
>> +  registers in the sys syscon. So the PLLs node should be a child of
>> +  SYS-SYSCON node.
>> +  The formula for calculating frequency is
>> +  Fvco = Fref * (NI + NF) / M / Q1
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
>> +    description: Main Oscillator (24 MHz)
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +    description:
>> +      See <dt-bindings/clock/starfive,jh7110-crg.h> for valid indices.
>> +
>> +required:
>> +  - compatible
>> +  - clocks
>> +  - '#clock-cells'
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    clock-controller {
>> +      compatible = "starfive,jh7110-pll";
>> +      clocks = <&osc>;
>> +      #clock-cells = <1>;
>> +    };
>> diff --git a/include/dt-bindings/clock/starfive,jh7110-crg.h b/include/dt-bindings/clock/starfive,jh7110-crg.h
>> index 06257bfd9ac1..086a6ddcf380 100644
>> --- a/include/dt-bindings/clock/starfive,jh7110-crg.h
>> +++ b/include/dt-bindings/clock/starfive,jh7110-crg.h
>> @@ -6,6 +6,12 @@
>>  #ifndef __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
>>  #define __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
>>
>> +/* PLL clocks */
>> +#define JH7110_CLK_PLL0_OUT                    0
>> +#define JH7110_CLK_PLL1_OUT                    1
>> +#define JH7110_CLK_PLL2_OUT                    2
>> +#define JH7110_PLLCLK_END                      3
> 
> It would be nice if these names followed the same pattern as the
> clocks below. Eg. something like JH7110_PLLCLK_PLL?_OUT and
> JH7110_PLLCLK_END.
> 
> But maybe these defines are not even needed, since you just do <&pll
> 0>, <&pll 1> and it's obvious what that means.

I prefer to keep these names because they are used in the PLL driver
and are more easy to understand than numbers.
I will use the JH7110_PLLCLK_PLL?_OUT to follow the same pattern
in next version.

Best regards,
Xingyu Wu

> 
>>  /* SYSCRG clocks */
>>  #define JH7110_SYSCLK_CPU_ROOT                 0
>>  #define JH7110_SYSCLK_CPU_CORE                 1
>> --
>> 2.25.1
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
