Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80220C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Dec 2022 10:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TfQI2Yj00avDPbrqVoVz5DmzzN/qxKLR+CWdb/qNbIc=; b=fG3QTRUDTYge9j
	ngBGIM69vSD0yDPQ9n4/fuN3QTtAI1Jemj4mYkz6YcsFJrlTzQsWMzjuQDlJi3Ls7pn16QzzRGFdC
	0pIVtRHZ5LVFR8rsE06wwkNI4UMR/HzTTc1L+vbml8km4JIDnYRP93tBfjG4gfHR6376+Sf4nUmaP
	1b1yyxJWbSVu8TAiUDDPQOFnV3iXNslxCup419GmkNUFiWJZrJY1sWtX+oaRgzrfMpxpFI6iSslzy
	cvNYLh0sewhZfhDxvjKR8f7GDlaN/ms6nHR1+LyYwS1nA8DG0Cqz+UPmFu+MFERmLA7WuEPU9Uo7Q
	hJJ9SlaKfQ8aWipq475w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATrq-0049zI-3H; Wed, 28 Dec 2022 10:41:02 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATri-0049uO-L3
	for linux-riscv@lists.infradead.org; Wed, 28 Dec 2022 10:40:58 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 66CF424E102;
	Wed, 28 Dec 2022 18:40:19 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 28 Dec
 2022 18:40:19 +0800
Received: from [192.168.120.55] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 28 Dec
 2022 18:40:18 +0800
Message-ID: <4cb26636-8f65-b801-9374-e8b7e9fff2fe@starfivetech.com>
Date: Wed, 28 Dec 2022 18:40:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/3] dt-bindings: mmc: Add bindings for StarFive
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, <linux-kernel@vger.kernel.org>
References: <20221227122227.460921-1-william.qiu@starfivetech.com>
 <20221227122227.460921-2-william.qiu@starfivetech.com>
 <fc5866ef-4eea-bc15-7cbe-d2e00c37e282@linaro.org>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <fc5866ef-4eea-bc15-7cbe-d2e00c37e282@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_024055_068462_E7023FA0 
X-CRM114-Status: GOOD (  20.40  )
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



On 2022/12/27 21:05, Krzysztof Kozlowski wrote:
> On 27/12/2022 13:22, William Qiu wrote:
>> Add documentation to describe StarFive
>> designware mobile storage host controller driver.
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst#L586
> 
> The subject is a bit redundant and not precise. No need to mention
> "bindings" twice but "StarFive" is really too generic. Do you add now
> all possible devices from StarFive? I see only one. Rephrase (use git
> log to find examples).
> 

Will update

>> 
>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>> ---
>>  .../bindings/mmc/starfive,jh7110-mmc.yaml     | 72 +++++++++++++++++++
>>  1 file changed, 72 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml b/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
>> new file mode 100644
>> index 000000000000..430dd5f24933
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
>> @@ -0,0 +1,72 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mmc/starfive,jh7110-mmc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: StarFive Designware Mobile Storage Host Controller
>> +
>> +description:
>> +  StarFive uses the Synopsys designware mobile storage host controller
>> +  to interface a SoC with storage medium such as eMMC or SD/MMC cards.
>> +
>> +allOf:
>> +  - $ref: synopsys-dw-mshc-common.yaml#
>> +
>> +maintainers:
>> +  - William Qiu <william.qiu@starfivetech.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: starfive,jh7110-mmc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: biu clock
>> +      - description: ciu clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: biu
>> +      - const: ciu
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  starfive,syscon:
> 
> Name is not specific enough. What is syscon? Any syscon? This needs to
> be specific.
> 

Will update.

>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description:
>> +      arg0:arg0 is syscon.
> 
> What is syscon?
> 

Will update.

>> +      arg1:arg1 is syscon register offset, used to enable MMC function.
> 
> Describe the argument, not what it is used for, e.g. "offset of XXX YYY ZZZ"
> 
>> +      arg2:arg2 is used to enable the register shift of the MMC function.
>> +      arg3:arg3 is used to enable the register mask of the MMC function.
> 
> That's not how the phandle array is described. Instead:
> 
> https://elixir.bootlin.com/linux/v5.18-rc1/source/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml#L42
> 

Hi Krzysztof,

Thank you for taking time to review and provide helpful comments for this patch.
I will fix all the above issues in the next version.

Best Regards,
William Qiu

> 
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
