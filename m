Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E370EC54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 08:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UqYIkbSWkKjuU3aVROQHWpX+f0bu2LecWwq30I6xNvI=; b=f0gGWAvuEwMrDM
	mKxJf7TUeUni3nqp5/zs202bqhZybr6JvYBC08qZs44+rRurNBzqjO5STu6Xdol3s12WxPRJBr0jJ
	IuraZiFro9uYS0Vla7sAcimCxLGCrpuhTA5liJ5iUwCz9UHo52ggYSHCsi0VgYXMy1JS646isTTUg
	7wv93BQVrKVf00kaZu9Z9qqyRZ6i6r8+6KZERkqdt/kHa53dh5lMBllofIuRYoaeBmeuEB+asiOlJ
	5xjOaL9mzGUzd0TjpxUFNQQXDiUI71qJLMhMnMWYf7Qx8ZyLhs/7yzTRL+2viuWqdJErsg6m5ueBP
	YyqIol55lrddFWea1tGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMPJN-002crj-QX; Mon, 30 Jan 2023 08:14:45 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMPJK-002cr8-Tl
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 08:14:45 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id ECE7224E1ED;
	Mon, 30 Jan 2023 16:14:24 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 30 Jan
 2023 16:14:25 +0800
Received: from [192.168.125.128] (183.27.97.127) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 30 Jan
 2023 16:14:23 +0800
Message-ID: <ce15c2be-e959-334a-2297-cfbb6bc2d62f@starfivetech.com>
Date: Mon, 30 Jan 2023 16:10:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 07/11] dt-bindings: clock: Add StarFive JH7110
 Video-Output clock and reset generator
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>
CC: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20230120024445.244345-1-xingyu.wu@starfivetech.com>
 <20230120024445.244345-8-xingyu.wu@starfivetech.com>
 <428dc119-82ab-e565-7bd6-1a99ec3967d9@linaro.org>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <428dc119-82ab-e565-7bd6-1a99ec3967d9@linaro.org>
X-Originating-IP: [183.27.97.127]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_001443_290994_D0FFA387 
X-CRM114-Status: GOOD (  11.81  )
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

On 2023/1/20 16:13, Krzysztof Kozlowski wrote:
> On 20/01/2023 03:44, Xingyu Wu wrote:
>> Add bindings for the Video-Output clock and reset generator (VOUTCRG)
>> on the JH7110 RISC-V SoC by StarFive Ltd.
>> 
>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>> ---
>>  .../clock/starfive,jh7110-voutcrg.yaml        | 96 +++++++++++++++++++
>>  .../dt-bindings/clock/starfive,jh7110-crg.h   | 22 +++++
>>  .../dt-bindings/reset/starfive,jh7110-crg.h   | 16 ++++
>>  3 files changed, 134 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml
>> new file mode 100644
>> index 000000000000..a6a43d86a392
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml
>> @@ -0,0 +1,96 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/starfive,jh7110-voutcrg.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: StarFive JH7110 Video-Output Clock and Reset Generator
>> +
>> +maintainers:
>> +  - Xingyu Wu <xingyu.wu@starfivetech.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: starfive,jh7110-voutcrg
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: Vout Top core
>> +      - description: Vout Top Ahb
>> +      - description: Vout Top Axi
>> +      - description: Vout Top HDMI MCLK
>> +      - description: I2STX0 BCLK
>> +      - description: external HDMI pixel
>> +
>> +  clock-names:
>> +    items:
>> +      - const: vout_src
>> +      - const: vout_top_ahb
>> +      - const: vout_top_axi
>> +      - const: vout_top_hdmitx0_mclk
>> +      - const: i2stx0_bclk
>> +      - const: hdmitx0_pixelclk
>> +
>> +  resets:
>> +    items:
>> +      - description: Vout Top core
>> +
>> +  reset-names:
>> +    items:
>> +      - const: vout_top_src
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +    description:
>> +      See <dt-bindings/clock/starfive,jh7110-crg.h> for valid indices.
>> +
>> +  '#reset-cells':
>> +    const: 1
>> +    description:
>> +      See <dt-bindings/reset/starfive,jh7110-crg.h> for valid indices.
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +    description:
>> +      Vout domain power
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - reset-names
>> +  - '#clock-cells'
>> +  - '#reset-cells'
>> +  - power-domains
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/starfive,jh7110-crg.h>
>> +    #include <dt-bindings/power/starfive,jh7110-pmu.h>
>> +    #include <dt-bindings/reset/starfive,jh7110-crg.h>
>> +
>> +    voutcrg: clock-controller@295C0000 {
>> +        compatible = "starfive,jh7110-voutcrg";
>> +        reg = <0x295C0000 0x10000>;
>> +        clocks = <&syscrg JH7110_SYSCLK_VOUT_SRC>,
>> +                 <&syscrg JH7110_SYSCLK_VOUT_TOP_AHB>,
>> +                 <&syscrg JH7110_SYSCLK_VOUT_TOP_AXI>,
>> +                 <&syscrg JH7110_SYSCLK_VOUT_TOP_HDMITX0_MCLK>,
>> +                 <&syscrg JH7110_SYSCLK_I2STX0_BCLK>,
>> +                 <&hdmitx0_pixelclk>;
>> +        clock-names = "vout_src", "vout_top_ahb",
>> +                      "vout_top_axi", "vout_top_hdmitx0_mclk",
>> +                      "i2stx0_bclk", "hdmitx0_pixelclk";
>> +        resets = <&syscrg JH7110_SYSRST_VOUT_TOP_SRC>;
>> +        reset-names = "vout_top_src";
>> +        #clock-cells = <1>;
>> +        #reset-cells = <1>;
>> +        power-domains = <&pwrc JH7110_PD_VOUT>;
>> +    };
>> diff --git a/include/dt-bindings/clock/starfive,jh7110-crg.h b/include/dt-bindings/clock/starfive,jh7110-crg.h
>> index 91ee589809c3..3ebece93cbd3 100644
>> --- a/include/dt-bindings/clock/starfive,jh7110-crg.h
>> +++ b/include/dt-bindings/clock/starfive,jh7110-crg.h
>> @@ -274,4 +274,26 @@
>>  
>>  #define JH7110_ISPCLK_END			14
>>  
>> +/* VOUTCRG clocks */
>> +#define JH7110_VOUTCLK_APB			0
>> +#define JH7110_VOUTCLK_DC8200_PIX		1
>> +#define JH7110_VOUTCLK_DSI_SYS			2
>> +#define JH7110_VOUTCLK_TX_ESC			3
>> +#define JH7110_VOUTCLK_DC8200_AXI		4
>> +#define JH7110_VOUTCLK_DC8200_CORE		5
>> +#define JH7110_VOUTCLK_DC8200_AHB		6
>> +#define JH7110_VOUTCLK_DC8200_PIX0		7
>> +#define JH7110_VOUTCLK_DC8200_PIX1		8
>> +#define JH7110_VOUTCLK_DOM_VOUT_TOP_LCD		9
>> +#define JH7110_VOUTCLK_DSITX_APB		10
>> +#define JH7110_VOUTCLK_DSITX_SYS		11
>> +#define JH7110_VOUTCLK_DSITX_DPI		12
>> +#define JH7110_VOUTCLK_DSITX_TXESC		13
>> +#define JH7110_VOUTCLK_MIPITX_DPHY_TXESC	14
>> +#define JH7110_VOUTCLK_HDMI_TX_MCLK		15
>> +#define JH7110_VOUTCLK_HDMI_TX_BCLK		16
>> +#define JH7110_VOUTCLK_HDMI_TX_SYS		17
>> +
>> +#define JH7110_VOUTCLK_END			18
>> +
>>  #endif /* __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__ */
>> diff --git a/include/dt-bindings/reset/starfive,jh7110-crg.h b/include/dt-bindings/reset/starfive,jh7110-crg.h
>> index 1b40df62cdac..f89589610cf5 100644
>> --- a/include/dt-bindings/reset/starfive,jh7110-crg.h
>> +++ b/include/dt-bindings/reset/starfive,jh7110-crg.h
>> @@ -195,4 +195,20 @@
>>  
>>  #define JH7110_ISPRST_END			12
>>  
>> +/* VOUTCRG resets */
>> +#define	JH7110_VOUTRST_DC8200_AXI		0
>> +#define	JH7110_VOUTRST_DC8200_AHB		1
> 
> Ditto

Will fix.

Best regards,
Xingyu Wu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
