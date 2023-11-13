Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDEE1C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 09:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uqfti5kCKldlXUKlnxVc7iJ9kXg9k+xLEsZGwH2ITdQ=; b=3VEhZTAR3Bh3CH
	YeqL+OGzuOWo0Eed2X/vg1lEv4RhRy9qTNzd4xJDOnmfgF2h1W6yo8VlsUxq+vFIwFNISPgWPoIZR
	5TTyH+DOKm06ohO0F4GmvV2uXbH6O51LSFakv+l+9zcjlKiNefcAWkKdMoXX0vTw51bsf9v1wf4PO
	kC6nwKxhmsoXx5ojht1XeT+JrlnT6SViDEj/i4gCLDC20y+ubdi2nHhorbz3QTLizpjPWILGetYVs
	JghLFz1za2jhKrYqZsfXuVdVzqz65PS/Q/P87jhjvuvZqlbA0uGTaEkXYTvyHDNcfpXbeGby7RVBW
	2CvTrk56mvWGDcmVoShQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2TXU-00Dald-39;
	Mon, 13 Nov 2023 09:47:28 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2TXR-00DakU-2b
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 09:47:27 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 2424E24E2A3;
	Mon, 13 Nov 2023 17:47:14 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 13 Nov
 2023 17:47:14 +0800
Received: from [192.168.120.47] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 13 Nov
 2023 17:47:12 +0800
Message-ID: <6610e454-2fda-4a2b-b088-88237685ea49@starfivetech.com>
Date: Mon, 13 Nov 2023 17:47:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] pwm: opencores: Add PWM driver support
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pwm@vger.kernel.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Hal Feng
	<hal.feng@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	"Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20231110062039.103339-1-william.qiu@starfivetech.com>
 <20231110062039.103339-3-william.qiu@starfivetech.com>
 <66173ccd-4478-4622-a386-557a8d35102f@linaro.org>
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <66173ccd-4478-4622-a386-557a8d35102f@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_014726_132821_F259D856 
X-CRM114-Status: GOOD (  19.06  )
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



On 2023/11/10 20:27, Krzysztof Kozlowski wrote:
> On 10/11/2023 07:20, William Qiu wrote:
>> Add Pulse Width Modulation driver support for OpenCores.
> 
> What is OpenCores? Why all your commit messages lack basic explanation
> of the hardware you are working on?
> 
Will modify.
>> 
> 
> 
>> +static const struct ocores_pwm_data jh7100_pwm_data = {
>> +	.get_ch_base = starfive_jh71x0_get_ch_base,
>> +};
>> +
>> +static const struct ocores_pwm_data jh7110_pwm_data = {
>> +	.get_ch_base = starfive_jh71x0_get_ch_base,
>> +};
>> +
>> +static const struct of_device_id ocores_pwm_of_match[] = {
>> +	{ .compatible = "opencores,pwm" },
>> +	{ .compatible = "starfive,jh7100-pwm", .data = &jh7100_pwm_data},
>> +	{ .compatible = "starfive,jh7110-pwm", .data = &jh7110_pwm_data},
> 
> Your bindings say something entirely else.
> 
> I don't understand what is happening with this patchset.
> 
Will update.
> 
>> +	{ /* sentinel */ }
>> +};
> 
> ...
> 
>> +	ddata->regs = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(ddata->regs))
>> +		return dev_err_probe(dev, PTR_ERR(ddata->regs),
>> +				     "Unable to map IO resources\n");
>> +
>> +	ddata->clk = devm_clk_get(dev, NULL);
>> +	if (IS_ERR(ddata->clk))
>> +		return dev_err_probe(dev, PTR_ERR(ddata->clk),
>> +				     "Unable to get pwm's clock\n");
>> +
>> +	ret = clk_prepare_enable(ddata->clk);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Clock enable failed\n");
> 
> dev_clk_get_enabled() or whatever the API is called
>
You mean change devm_clk_get_enabled() instead of devm_clk_get()?
>> +
>> +	ddata->rst = devm_reset_control_get_optional_exclusive(dev, NULL);
>> +	reset_control_deassert(ddata->rst);
>> +
>> +	ddata->clk_rate = clk_get_rate(ddata->clk);
>> +	if (ddata->clk_rate <= 0)
>> +		return dev_err_probe(dev, ddata->clk_rate,
>> +				     "Unable to get clock's rate\n");
>> +
>> +	ret = devm_pwmchip_add(dev, chip);
>> +	if (ret < 0) {
>> +		dev_err_probe(dev, ret, "Could not register PWM chip\n");
>> +		clk_disable_unprepare(ddata->clk);
>> +		reset_control_assert(ddata->rst);
> 
> return dev_err_probe
> 
Will update.
>> +	}
>> +
>> +	platform_set_drvdata(pdev, ddata);
>> +
>> +	return ret;
>> +}
>> +
>> +static void ocores_pwm_remove(struct platform_device *dev)
>> +{
>> +	struct ocores_pwm_device *ddata = platform_get_drvdata(dev);
>> +
>> +	reset_control_assert(ddata->rst);
>> +	clk_disable_unprepare(ddata->clk);
> 
> You have confusing order of cleanups. It's like random, once clock then
> reset, in other place reset then clock.
> 
Will change it into a reasonable order.

Thank you for spending time on this patchset.

Best Regards,
William
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
