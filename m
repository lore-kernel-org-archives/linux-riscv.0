Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AE5EB64D9
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 01:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A2haqgDMmBsQMIyPoTdTirQqTuSHyK+f5x9mGtSjMf8=; b=GOuXk5VaXdXBMB
	uWc1MRVbusILWPV0Buoshvi0rbs8QKzGUWHDkFzB3fnM9wkIuovuH48IDE673eK7ntLd14MqXawsx
	u6gOHfPviIf8yLxERkk711DjzBN02dT+vTIuqjnqQOmLIfGH2qSfpdXhQqgRFoLJ0Xz4F6NNsZkH0
	Xt5EfsKJpUPReE8b7cm5HqJGLliK7UYcdVuXoOk+dA3Qkyx4o+T1lqdc451cSsPCU7R1lenjIk5Ay
	Lkhuuh52mWwMuPxVwKyor5pJ+i6J/iT7PasBnbZGkAXy4SjmydwJcZL9VEP8Yvxt01ExDATtgQSfi
	UIZwBdiccc66aJ8RuP7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF3DK-002eMl-0C;
	Fri, 30 Jun 2023 01:46:22 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF3DG-002eL7-2y
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 01:46:20 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id D76DF24E245;
	Fri, 30 Jun 2023 09:45:51 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 30 Jun
 2023 09:45:51 +0800
Received: from [192.168.125.93] (183.27.97.206) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 30 Jun
 2023 09:45:50 +0800
Message-ID: <4ed97fd6-a99c-0be8-aff5-61021be59422@starfivetech.com>
Date: Fri, 30 Jun 2023 09:45:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 2/5] ASoC: codecs: Add StarFive JH7110 dummy PWM-DAC
 transmitter driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown
	<broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Walker
 Chen" <walker.chen@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230626110909.38718-1-hal.feng@starfivetech.com>
 <20230626110909.38718-3-hal.feng@starfivetech.com>
 <4c421206-39a2-d98e-f75d-f5d269e881ff@linaro.org>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <4c421206-39a2-d98e-f75d-f5d269e881ff@linaro.org>
X-Originating-IP: [183.27.97.206]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_184619_250384_6550DE2A 
X-CRM114-Status: GOOD (  12.59  )
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

On Mon, 26 Jun 2023 17:33:57 +0200, Krzysztof Kozlowski wrote:
> On 26/06/2023 13:09, Hal Feng wrote:
>> Add a dummy transmitter driver for StarFive JH7110 PWM-DAC module.
>> StarFive JH7110 PWM-DAC controller uses this driver.
>> 
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  sound/soc/codecs/Kconfig                     |  4 ++
>>  sound/soc/codecs/Makefile                    |  2 +
>>  sound/soc/codecs/jh7110_pwmdac_transmitter.c | 74 ++++++++++++++++++++
>>  3 files changed, 80 insertions(+)
>>  create mode 100644 sound/soc/codecs/jh7110_pwmdac_transmitter.c
>> 
> 
> ...
> 
>> +
>> +static struct platform_driver pwmdac_dit_driver = {
>> +	.probe		= pwmdac_dit_probe,
>> +	.driver		= {
>> +		.name	= DRV_NAME,
>> +		.of_match_table = of_match_ptr(pwmdac_dit_dt_ids),
>> +	},
>> +};
>> +
>> +module_platform_driver(pwmdac_dit_driver);
>> +
>> +MODULE_DESCRIPTION("StarFive JH7110 dummy PWM-DAC transmitter driver");
>> +MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("platform:" DRV_NAME);
> 
> Drop. You don't need it. If you need it, it means you miss proper ID table.

OK. I will drop it in the next version. Thanks.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
