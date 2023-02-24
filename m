Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4682FC64ED8
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 07:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1IzKUd6Bg9IdKuJ3PbYq9g05zuzCrxrjMAoDdVpEu0c=; b=tG+qrwogqqVmah
	lZPWtAVkmcZH3uRXj/BrgTNYzA47zwZaUVOv8YRQHvuqblmf/OXGgHQEF+URaCm2ljFM9tnC3atG1
	ZjDGhtgqebIl0Hphf1kP4wu5VmDlg2LpTmz06Q2A1jDOn0huDPfDgScKMxyiCbxCGmCNtDe9CL6N6
	HAK0NZnhvJKYjV0VReq5wCbVconwY1mwrBVH9oFMA0kauaDHmMT1gqwyzmaZ/I+y48+n99gQw2b7q
	BuRNHYy7uIDj6mZ+z+7hrCuMFPSJeLDMgzyoHXFWgnIxB35zYgL5JhBxFFvAYPovXNt6/nv+P8Ti7
	h+rtN5YTTaYQ2ZpxwchA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVSlb-001RFa-F3; Fri, 24 Feb 2023 07:45:19 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVSlY-001RDF-Ev
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 07:45:18 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 467D724E154;
	Fri, 24 Feb 2023 15:44:48 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 24 Feb
 2023 15:44:48 +0800
Received: from [192.168.125.128] (113.72.147.165) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 24 Feb
 2023 15:44:46 +0800
Message-ID: <3d9679f8-45c6-3f27-b671-a0828a1a4ad3@starfivetech.com>
Date: Fri, 24 Feb 2023 15:45:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 2/3] clk: starfive: Add StarFive JH7110 PLL clock
 driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Rob Herring
	<robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20230221141147.303642-1-xingyu.wu@starfivetech.com>
 <20230221141147.303642-3-xingyu.wu@starfivetech.com>
 <3f50066b-f967-b9fa-1e0d-5337ec1ed194@linaro.org>
 <5e4007b7-6522-4c81-ca15-15a98c586aad@starfivetech.com>
 <50b6fb73-afb2-051b-7969-d7fbbe1e6175@linaro.org>
 <f23b3755-e2dd-f858-02ad-3f1b58934bc6@starfivetech.com>
 <d76f25ff-3c60-4e9b-87d7-8c4043b2e47f@linaro.org>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <d76f25ff-3c60-4e9b-87d7-8c4043b2e47f@linaro.org>
X-Originating-IP: [113.72.147.165]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_234516_792812_51F2AFAF 
X-CRM114-Status: GOOD (  13.33  )
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

On 2023/2/23 18:10, Krzysztof Kozlowski wrote:
> On 23/02/2023 11:03, Xingyu Wu wrote:
>> On 2023/2/23 17:35, Krzysztof Kozlowski wrote:
>>> On 23/02/2023 10:32, Xingyu Wu wrote:
>>>> On 2023/2/23 16:56, Krzysztof Kozlowski wrote:
>>>>> On 21/02/2023 15:11, Xingyu Wu wrote:
>>>>>> Add driver for the StarFive JH7110 PLL clock controller and
>>>>>> modify the JH7110 system clock driver to rely on this PLL clocks.
>>>>>>
>>>>>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>>>>>> ---
>>>>>
>>>>>
>>>>>> +
>>>>>> +static int jh7110_pll_clk_probe(struct platform_device *pdev)
>>>>>> +{
>>>>>> +	int ret;
>>>>>> +	struct of_phandle_args args;
>>>>>> +	struct regmap *pll_syscon_regmap;
>>>>>> +	unsigned int idx;
>>>>>> +	struct jh7110_clk_pll_priv *priv;
>>>>>> +	struct jh7110_clk_pll_data *data;
>>>>>> +	char *pll_name[JH7110_PLLCLK_END] = {
>>>>>> +		"pll0_out",
>>>>>> +		"pll1_out",
>>>>>> +		"pll2_out"
>>>>>> +	};
>>>>>> +
>>>>>> +	priv = devm_kzalloc(&pdev->dev,
>>>>>> +			    struct_size(priv, data, JH7110_PLLCLK_END),
>>>>>> +			    GFP_KERNEL);
>>>>>> +	if (!priv)
>>>>>> +		return -ENOMEM;
>>>>>> +
>>>>>> +	priv->dev = &pdev->dev;
>>>>>> +	ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node, "starfive,sysreg", 0, 0, &args);
>>>>>
>>>>> 1. Wrong wrapping. Wrap code at 80 as coding style asks.
>>>>>
>>>>> 2. Why you are using syscon for normal, device MMIO operation? Your DTS
>>>>> also points that this is incorrect, hacky representation of hardware.
>>>>> Don't add devices to DT to fake places and then overuse syscon to fix
>>>>> that fake placement. The clock is in system registers, thus it must be
>>>>> there.
>>>>>
>>>>> 3. Even if this stays, why so complicated code instead of
>>>>> syscon_regmap_lookup_by_phandle()?
>>>>>
>>>>
>>>> Thanks for your advice. Will use syscon_regmap_lookup_by_phandle instead it
>>>> and remove useless part.
>>>
>>> So you ignored entirely part 2? This was the main comment... I am going
>>> to keep NAK-ing it then.
>> 
>> What I understand to mean is that I cannot use a fake node to operate syscon
>> registers. So I should move the PLL node under syscon node directly. Is it ok?
> 
> Yes, because it looks like entire PLL clock control is from the syscon
> node, thus the clocks are there.

Thanks for the guidance, I will modify it in the next patch.

Best regards,
Xingyu Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
