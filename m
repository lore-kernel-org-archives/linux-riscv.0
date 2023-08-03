Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5903C00528
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 08:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d61cCT2T53Sk5/3SUGSbuJJVtHkogTEprVbDDSXeNGA=; b=gLJXxbN89mXF1F
	WAqNbvo+XiOyizB6P9qjR/QUlTs7qY973vjRWwXcizc1iqaWQ6mRRZJzG6M9//hVM2A7BPqsWx9VA
	Ox3CcsX//sVDukc6Y9rGOo9sTHl5fD/S3w5OqNVHjXlEOCwatum/tc465yKRg/l+/6yPNmzA7NRYZ
	vwlO27JHkovd/wghDGuEXkvAgO7CKFvgaBio586No/F0T4Sd0yZDNfFH1AYWRE+1t5nvA0JcXPOeT
	jPWT9LFeq/fV81/JjiAZEQ3ULCC7SRBqsV/q2e6gl/rJwiLHKSVm+fXfiKOYUxzBRcfCll3APouH/
	ggR/YHQen5a9/JYBaJKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRTqx-0073Ih-0E;
	Thu, 03 Aug 2023 08:38:39 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRTqq-0073Fi-2K
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 08:38:37 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id AC5BE8067;
	Thu,  3 Aug 2023 16:37:52 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 3 Aug
 2023 16:37:52 +0800
Received: from [192.168.125.84] (183.27.98.54) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 3 Aug
 2023 16:37:51 +0800
Message-ID: <34c8c9d5-fad0-52ce-d1e6-798546005bfd@starfivetech.com>
Date: Thu, 3 Aug 2023 16:37:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 2/3] ASoC: starfive: Add JH7110 PWM-DAC driver
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Claudiu Beznea <claudiu.beznea@microchip.com>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Walker Chen <walker.chen@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20230731032829.127864-1-hal.feng@starfivetech.com>
 <20230731032829.127864-3-hal.feng@starfivetech.com>
 <9b03c7ed-845c-494b-8c40-10d1fe923b15@sirena.org.uk>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <9b03c7ed-845c-494b-8c40-10d1fe923b15@sirena.org.uk>
X-Originating-IP: [183.27.98.54]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_013833_106905_FEFB797C 
X-CRM114-Status: GOOD (  20.68  )
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

On Mon, 31 Jul 2023 20:14:38 +0100, Mark Brown wrote:
> On Mon, Jul 31, 2023 at 11:28:28AM +0800, Hal Feng wrote:
> 
>> +static const struct jh7110_ct_pwmdac pwmdac_ct_data_shift[] = {
>> +	{ .name = "left 0 bit", .vals = PWMDAC_DATA_LEFT_SHIFT_BIT_0 },
>> +	{ .name = "left 1 bit", .vals = PWMDAC_DATA_LEFT_SHIFT_BIT_1 },
>> +	{ .name = "left 2 bit", .vals = PWMDAC_DATA_LEFT_SHIFT_BIT_2 },
>> +	{ .name = "left 3 bit", .vals = PWMDAC_DATA_LEFT_SHIFT_BIT_3 },
>> +	{ .name = "left 4 bit", .vals = PWMDAC_DATA_LEFT_SHIFT_BIT_4 },
>> +	{ .name = "left 5 bit", .vals = PWMDAC_DATA_LEFT_SHIFT_BIT_5 },
>> +	{ .name = "left 6 bit", .vals = PWMDAC_DATA_LEFT_SHIFT_BIT_6 },
>> +	{ .name = "left 7 bit", .vals = PWMDAC_DATA_LEFT_SHIFT_BIT_7 }
>> +};
> 
> It's not clear to me why this is user selectable - what does the control
> do?

It's convenient to change the register values in user space with the
control. But actually using fixed register configuration is enough.
I will drop all these control in the next version.

> 
>> +static int jh7110_pwmdac_put(struct snd_kcontrol *kcontrol,
>> +			     struct snd_ctl_elem_value *ucontrol,
>> +			     int pwmdac_ct)
>> +{
>> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>> +	struct jh7110_pwmdac_dev *dev = snd_soc_component_get_drvdata(component);
>> +	int sel = ucontrol->value.enumerated.item[0];
>> +	unsigned int items;
> 
>> +	if (pwmdac_ct == PWMDAC_CT_SHIFT)
>> +		dev->shift = pwmdac_ct_shift[sel].vals;
>> +	else if (pwmdac_ct == PWMDAC_CT_DUTY_CYCLE)
>> +		dev->duty_cycle = pwmdac_ct_duty_cycle[sel].vals;
>> +	else if (pwmdac_ct == PWMDAC_CT_DATA_CHANGE)
>> +		dev->data_change = pwmdac_ct_data_change[sel].vals;
>> +	else if (pwmdac_ct == PWMDAC_CT_DATA_MODE)
>> +		dev->data_mode = pwmdac_ct_data_mode[sel].vals;
>> +	else if (pwmdac_ct == PWMDAC_CT_DATA_SHIFT)
>> +		dev->data_shift = pwmdac_ct_data_shift[sel].vals;
>> +
>> +	return 0;
>> +}
> 
> _put() operations should return 1 if the control value changes so event
> generation works - please test a card using this driver with the
> mixer-test selftest, it'll identify this and a bunch of other potential
> issues.

Thanks for the correct, but it doesn't matter as I will drop these control
later.

> 
>> +static int jh7110_pwmdac_component_probe(struct snd_soc_component *component)
>> +{
>> +	snd_soc_add_component_controls(component, jh7110_pwmdac_snd_controls,
>> +				       ARRAY_SIZE(jh7110_pwmdac_snd_controls));
>> +	return 0;
>> +}
> 
> The driver can just point to the controls from the _driver struct and
> skip having a probe() function.

Thanks for your advice, but I would like to drop these control later.

Thanks again for your review.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
