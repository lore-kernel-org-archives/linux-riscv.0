Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA2AC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 09:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U+kAXOQrOVyQjk4gNiSXZGoj+jQsFIMxewCcVEls+ZM=; b=rFYcAJZOeXUcQX
	DA2p+J5wqmaJCh2UmOV9eIhn7LOgKmFqnyecoLEQtpCC95wEMKCqhdVz0u0Yp4tuT5JOL7sjtGxD9
	WsLfKaTPdFOGC53bXSxZNxDE0tDKjEA0d24fsmCgNE1/0T9FOvCWV4VARdoOfUAS7j+g4IvjWJ+QQ
	cCf/32c1GxQ+Ekf290IB02GCpReQ5MR6YW+kyp2XirtXT2gyN9dalt41MMKv79QwjswS/qawLm04x
	hjiU6ILhYfWxPAGoaWoMYpF7GS8scaseUHId1kTcW9o4aJCzRRSC9rMZLDNHCTWsmCraZS5WqPBeS
	hHHHfHn7aF5fhqYpB8pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV7yG-00FixI-Hz; Thu, 23 Feb 2023 09:33:00 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV7y7-00FitS-V6
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 09:32:56 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id D85AB24E294;
	Thu, 23 Feb 2023 17:32:39 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 23 Feb
 2023 17:32:39 +0800
Received: from [192.168.125.128] (113.72.147.165) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 23 Feb
 2023 17:32:38 +0800
Message-ID: <5e4007b7-6522-4c81-ca15-15a98c586aad@starfivetech.com>
Date: Thu, 23 Feb 2023 17:32:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 2/3] clk: starfive: Add StarFive JH7110 PLL clock
 driver
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
References: <20230221141147.303642-1-xingyu.wu@starfivetech.com>
 <20230221141147.303642-3-xingyu.wu@starfivetech.com>
 <3f50066b-f967-b9fa-1e0d-5337ec1ed194@linaro.org>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <3f50066b-f967-b9fa-1e0d-5337ec1ed194@linaro.org>
X-Originating-IP: [113.72.147.165]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_013252_309239_60CC88D3 
X-CRM114-Status: GOOD (  15.59  )
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

On 2023/2/23 16:56, Krzysztof Kozlowski wrote:
> On 21/02/2023 15:11, Xingyu Wu wrote:
>> Add driver for the StarFive JH7110 PLL clock controller and
>> modify the JH7110 system clock driver to rely on this PLL clocks.
>> 
>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>> ---
> 
> 
>> +
>> +static int jh7110_pll_clk_probe(struct platform_device *pdev)
>> +{
>> +	int ret;
>> +	struct of_phandle_args args;
>> +	struct regmap *pll_syscon_regmap;
>> +	unsigned int idx;
>> +	struct jh7110_clk_pll_priv *priv;
>> +	struct jh7110_clk_pll_data *data;
>> +	char *pll_name[JH7110_PLLCLK_END] = {
>> +		"pll0_out",
>> +		"pll1_out",
>> +		"pll2_out"
>> +	};
>> +
>> +	priv = devm_kzalloc(&pdev->dev,
>> +			    struct_size(priv, data, JH7110_PLLCLK_END),
>> +			    GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	priv->dev = &pdev->dev;
>> +	ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node, "starfive,sysreg", 0, 0, &args);
> 
> 1. Wrong wrapping. Wrap code at 80 as coding style asks.
> 
> 2. Why you are using syscon for normal, device MMIO operation? Your DTS
> also points that this is incorrect, hacky representation of hardware.
> Don't add devices to DT to fake places and then overuse syscon to fix
> that fake placement. The clock is in system registers, thus it must be
> there.
> 
> 3. Even if this stays, why so complicated code instead of
> syscon_regmap_lookup_by_phandle()?
> 

Thanks for your advice. Will use syscon_regmap_lookup_by_phandle instead it
and remove useless part.

> 
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "Failed to parse starfive,sys-syscon : %d\n", ret);
> 
> dev_err_probe and in other places as well, if applicable.

Will drop.

Best regards,
Xingyu Wu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
