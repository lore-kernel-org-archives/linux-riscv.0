Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F430C04A6A
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 03:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oOAlF9L6ND3qJQvR2/a4czo/fDODpXKdBBbmXLtQsP4=; b=vu+5aOGlnvByU9
	lfkCxdcVLf5+AlFDpooqCQu6IIscNfw7qzEULoBKgqhIiHIhavhR7OMHJ6xuTQdPn4AyFmvTvt8cQ
	no462RvpZdloDt7kaH7IQC0QWYyhhFcIiAj5PQdU/ElH3WDRdlE2w+FeJEmGYGRXsxkRulVphSkSD
	sscbi8WsZ71hCJ1xHj4hk65J90c6zBSzuOpFB9UR54rzlMHjUwN+KX6avqJjHt100KtNEvxSQ6wiT
	y138dqdQh9MZIcDffKNVblM65BBMwhxf7FM7GdfdyFxHUEc1m8L1x3g8IfSKq5yAx6jRhlG6ykZ1o
	OOzwrb1t1ZWVzIvlpBhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qROan-006VsJ-0c;
	Thu, 03 Aug 2023 03:01:37 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qROai-006Vql-3C
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 03:01:35 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id EA21F24E225;
	Thu,  3 Aug 2023 11:00:48 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 3 Aug
 2023 11:00:49 +0800
Received: from [192.168.125.84] (183.27.98.54) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 3 Aug
 2023 11:00:47 +0800
Message-ID: <2ea68c95-1581-a67d-613b-5315fcfd0016@starfivetech.com>
Date: Thu, 3 Aug 2023 11:00:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 2/3] ASoC: starfive: Add JH7110 PWM-DAC driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown
	<broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Walker Chen <walker.chen@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230731032829.127864-1-hal.feng@starfivetech.com>
 <20230731032829.127864-3-hal.feng@starfivetech.com>
 <b938ba84-38e9-b220-9686-6656e4452c10@linaro.org>
Content-Language: en-US
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <b938ba84-38e9-b220-9686-6656e4452c10@linaro.org>
X-Originating-IP: [183.27.98.54]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_200133_318437_ACD62A6E 
X-CRM114-Status: GOOD (  13.32  )
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

On Mon, 31 Jul 2023 09:06:10 +0200, Krzysztof Kozlowski wrote:
> On 31/07/2023 05:28, Hal Feng wrote:
>> Add PWM-DAC driver support for the StarFive JH7110 SoC.
>> 
> 
> 
> ...
> 
>> +static int jh7110_pwmdac_probe(struct platform_device *pdev)
>> +{
>> +	struct jh7110_pwmdac_dev *dev;
>> +	struct resource *res;
>> +	int ret;
>> +
>> +	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
>> +	if (!dev)
>> +		return -ENOMEM;
>> +
>> +	dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>> +	if (IS_ERR(dev->base))
>> +		return PTR_ERR(dev->base);
>> +
>> +	dev->mapbase = res->start;
>> +
>> +	dev->clks[0].id = "apb";
>> +	dev->clks[1].id = "core";
>> +
>> +	ret = devm_clk_bulk_get(&pdev->dev, ARRAY_SIZE(dev->clks), dev->clks);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "failed to get pwmdac clocks\n");
> 
> return dev_err_probe

OK, will fix.

> 
>> +		return ret;
>> +	}
>> +
>> +	dev->rst_apb = devm_reset_control_get_exclusive(&pdev->dev, NULL);
>> +	if (IS_ERR(dev->rst_apb)) {
>> +		dev_err(&pdev->dev, "failed to get pwmdac apb reset\n");
>> +		return PTR_ERR(dev->rst_apb);
> 
> return dev_err_probe

Will fix.

> 
>> +	}
>> +
>> +	dev->dev = &pdev->dev;
>> +	dev->shift = PWMDAC_SHIFT_8;
>> +	dev->duty_cycle = PWMDAC_CYCLE_CENTER;
>> +	dev->cnt_n = PWMDAC_SAMPLE_CNT_1;
>> +	dev->data_change = NO_CHANGE;
>> +	dev->data_mode = INVERTER_DATA_MSB;
>> +	dev->data_shift = PWMDAC_DATA_LEFT_SHIFT_BIT_0;
>> +
>> +	dev_set_drvdata(&pdev->dev, dev);
>> +	ret = devm_snd_soc_register_component(&pdev->dev,
>> +					      &jh7110_pwmdac_component,
>> +					      &jh7110_pwmdac_dai, 1);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "failed to register dai\n");
>> +		return ret;
> 
> I guess here as well for consistency and shorter code even though
> EPROBE_DEFER does not happen really.
> 
> return dev_err_probe

Will fix.

> 
>> +	}
>> +
>> +	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "failed to register pcm\n");
>> +		return ret;
> 
> return dev_err_probe

Will fix. Thanks for your review.

Best regards,
Hal

> 
>> +	}
>> +


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
