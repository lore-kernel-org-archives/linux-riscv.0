Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EF8C5479D
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 02:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j7Ku7jby85bm1c1er77KVkwtg5trh5HP5lAUk/vckzY=; b=qbe/jRAbvvhJpE
	d+rUtaLXapofxhn6rV0W2rT/qpgmv7EkR7KSjwyWgmOZRwqm5GOen4+NE/RWAZPgMrsVmcqNSh0/b
	zpLXeCdLkDM4MqHyDlAKVC8OZPpsyMC+p0HMiiSmSD9WFt1LcQkw5C27wjCPcge2rqNdin5E0JfGr
	3b5Luq71OEXqYJKyDmDm9u8x80yXSvAjzLTeHAMKyvnUFIzhkl+u0rUsR5NxLhcnBzZOidYoFhIeX
	cveAXnUs2nHDO34nO+Ny4F3JhvTMxKybrvY/4Pzx3+8MXTEi41ZHekrqSIcF1gpVK31GuEFUtCyzK
	E71hVOa8Yn71RgLgfDYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF4EC-004xX1-3w; Tue, 10 Jan 2023 02:19:04 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF4E7-004xLk-4Y
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 02:19:01 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id CA36324E161;
	Tue, 10 Jan 2023 10:18:18 +0800 (CST)
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 10 Jan
 2023 10:18:18 +0800
Received: from [192.168.125.128] (113.72.147.215) by EXMBX161.cuchost.com
 (172.16.6.71) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 10 Jan
 2023 10:18:17 +0800
Message-ID: <4febeef1-a42a-7d6f-d1af-d8fe19582822@starfivetech.com>
Date: Tue, 10 Jan 2023 10:14:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 1/3] dt-bindings: timer: Add timer for StarFive JH7110
 SoC
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Samin Guo
	<samin.guo@starfivetech.com>, <linux-kernel@vger.kernel.org>
References: <20221223094801.181315-1-xingyu.wu@starfivetech.com>
 <20221223094801.181315-2-xingyu.wu@starfivetech.com>
 <179e66a8-c6c0-6d3e-4f4a-6b884f532572@linaro.org>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <179e66a8-c6c0-6d3e-4f4a-6b884f532572@linaro.org>
X-Originating-IP: [113.72.147.215]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX161.cuchost.com
 (172.16.6.71)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_181859_580057_8AF36A5E 
X-CRM114-Status: GOOD (  19.32  )
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

On 2022/12/23 18:25, Krzysztof Kozlowski wrote:
> On 23/12/2022 10:47, Xingyu Wu wrote:
>> Add bindings for the timer on the JH7110
>> RISC-V SoC by StarFive Technology Ltd.
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst#L586
> 
> 
>> 
>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>> ---
>>  .../timer/starfive,jh7110-timers.yaml         | 105 ++++++++++++++++++
>>  1 file changed, 105 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/timer/starfive,jh7110-timers.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/timer/starfive,jh7110-timers.yaml b/Documentation/devicetree/bindings/timer/starfive,jh7110-timers.yaml
>> new file mode 100644
>> index 000000000000..fe58dc056313
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/timer/starfive,jh7110-timers.yaml
>> @@ -0,0 +1,105 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/timer/starfive,jh7110-timers.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: StarFive Timers
> 
> 
> Not enough, really not enough. Describe the hardware.

Will add. Thanks.

> 
>> +
>> +maintainers:
>> +  - Samin Guo <samin.guo@starfivetech.com>
>> +  - Xingyu Wu <xingyu.wu@starfivetech.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: starfive,jh7110-timers
> 
> Why plural "timers", not "timer"? The module is usually called timer -
> see other hardware that type.
> 

Will fix. Thanks.

>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    items:
>> +      - description: timer channel 0 interrupt
>> +      - description: timer channel 1 interrupt
>> +      - description: timer channel 2 interrupt
>> +      - description: timer channel 3 interrupt
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: timer0
>> +      - const: timer1
>> +      - const: timer2
>> +      - const: timer3
> 
> I would just drop the names, not really useful. Unless you plan to add
> here some generic interrupt (like you did for clock-names)?

Will drop. Thanks.

> 
>> +
>> +  clocks:
>> +    items:
>> +      - description: timer channel 0 clock
>> +      - description: timer channel 1 clock
>> +      - description: timer channel 2 clock
>> +      - description: timer channel 3 clock
>> +      - description: APB clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: timer0
>> +      - const: timer1
>> +      - const: timer2
>> +      - const: timer3
>> +      - const: apb
>> +
>> +  resets:
>> +    items:
>> +      - description: timer channel 0 reset
>> +      - description: timer channel 1 reset
>> +      - description: timer channel 2 reset
>> +      - description: timer channel 3 reset
>> +      - description: APB reset
>> +
>> +  reset-names:
>> +    items:
>> +      - const: timer0
>> +      - const: timer1
>> +      - const: timer2
>> +      - const: timer3
>> +      - const: apb
>> +
>> +  clock-frequency:
>> +    description: The frequency of the clock that drives the counter, in Hz.
> 
> Why do you need it? Use common clk framework to get that frequency.

Because normally this timer driver is loaded earlier than the clock tree driver, it won't get
that frequency by clk framework and this 'clock-frequency' node is used instead.

> 
> Also, sort the nodes somehow, e.g.
> compatible/reg/clocks/clock-frequency/interrupts/resets.

Will reorder. Thanks.

> 
> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - interrupt-names
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - reset-names
>> +  - clock-frequency
>> +
>> +unevaluatedProperties: false
> 
> Did you test the binding?

Yes, I had tested by 'dt_binding_check'. Do you mean the 'unevaluatedProperties' is wrong
and use 'additionalProperties'?

Best regards,
Xingyu Wu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
