Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1108DC7115C
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 14:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ILV2tn0L77hICVNNBFONHABsNEo1OKgUQO3DtACtbJc=; b=QyTY0w1vVwdGlO
	30Y34b0G43Ht6VDGxcR+nry0xjHnWPSUrhKJPwyPjdgH34EX1lnQFUhmSRm5Vr/4k8oGh9QKzmzsP
	0njig5ZYqud+MGq6rFcoqgRMhCHfXx4XHM7+h2iSHOX5S+y2gYQe9vOsU/3tW55xtkJeWFkQwOBOX
	aCh5krSS2uxjM9ipElIDp32J9Fxi/a7+ULTCb4WFKwkH9akIL0eK8SBX35yqJt6B2pv98DUjr1IJV
	N1prLsCpAj84ED+wWoDuMpHd3Fpso+OrCjy3KUaQwfrcFWdvNp5272CstdDGAmf66LuNh1EwD7RhC
	uiPNG9buvCir9LCBJ1Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uScS9-0000000FoqI-2s2K;
	Fri, 20 Jun 2025 14:10:49 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uScS4-0000000Fonr-4AY2
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 14:10:48 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-875acfc133dso62973539f.1
        for <linux-riscv@lists.infradead.org>; Fri, 20 Jun 2025 07:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750428644; x=1751033444; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cb95wT6YAeXhB7wAUnmyxgUJVnkrUiVyQ4loitF5Mh0=;
        b=A7JjOABw5UFHDXs85F+XjN7U5KZI9QkEMn3B0esDg9UAfLMuigC2P4lvx3RYDOHCyT
         MptRt3deP14XD4dDxEsWaKODd/th6S83jLmqEfrxL9VYm9NdTbYy/sB4KAiQigiC4NcZ
         6zJx6C9d5S5G1TcmYCzLrfS2khTukuW7OS430cMeybQzCbOyJIs4ygVhjEX6SnWUCuCA
         ZjTYvBugebLStfcufIwsb1qWTLyhPYh/EvecfCO8UCv5vo4y8GSF59+6SB7iFe6PGJke
         HeNbhs8TJnWgdB3nok4Ds6+Vlm83+3m/ey5Q7IjDVTRPOhvBL135adm2tpM3OfLx9gq8
         CnSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750428644; x=1751033444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cb95wT6YAeXhB7wAUnmyxgUJVnkrUiVyQ4loitF5Mh0=;
        b=ZVUolQoKT9xOzN09W73FHhpioYpyYcgUsjkYOyuICuX/UtCAG44iNNrsvy0UcebDJp
         91UCyexg83l57TpFzTZGq0nVwEkJTPI3b0QPuFJr34qt0DrRWtS2U+YN7RWfCiXk0kqp
         nXvs55zNPktwPoPpJDmqyFVxWis8U7LXxHvkfGngINq00ErBlD9mgRbSuBRy/AR/anIZ
         31WVyR6AQh8I0cjmCZWx99AZYRldSZYj4BiDejfCVKCR+nzSHhw1KHaMFR/qdl8kNukC
         osjIhISztBj6lqeN7Nh9AfBIgby+6jRnDGlVT4ANoO2gEnfFOWaS45gN7jkvdJhl5orL
         SHKg==
X-Forwarded-Encrypted: i=1; AJvYcCUb72EE9wbjeH7fihzWPvtT7l5QtMwnkZG3CpL0M4OUfaRiDseECPX6hyqZN7/PHG7k/k0ztMq7UPihtQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7SNU5ANxTiUafyfpSmIc8/s/NWu3u17nvSiu/D4GBOUPfDgoG
	l5fMIHMZEyqCT9ttv46Eq9Ed6U0t9RIqAWAiYLvkTkuvThCrZbvSgGYnEgbDC7cXB6U=
X-Gm-Gg: ASbGnctjkFxehjFMcVkvH9RYcuk/V6PXgKhRzyRofnvF7QTDlL0Oc36vfI7Ml4of++A
	peLtAMkyGWw9/9f668wj3uUIVvoT882At9cAt4dZnHpRGu2A13Q+IXjH/NJI3XFNoxchVUpWmN9
	9OwqM8BkNyzmPGvYqDoFx6tWpl+nFQCHixL2ooSEJQ2/Ca9DTEacYe2/m6l9tBAskTDlu8uEQge
	+v0ATIjb2DCPZC/mHtAkoNY/vJ1hLk0jkvfc1ICYjcen8wpSy0cF7dbSm7wZM2gRw6NnKSTSESp
	XMDhfqJxiL1cGSGdUQtFz0v/4A9lRg3L0XfK6LC4TgxnFq3Pl7XN4hYVCcHlAqoyYQUrYeguYu3
	hm+ePTdLTxdno3nIg8N254NN7QekraTUomqss
X-Google-Smtp-Source: AGHT+IHOWUr/z3EkWBYHmgxBtlE4mt4YGXnWdQgUSVsQC0wQSTfNxZFXIK4wwFK7GGyxDqhayW89fg==
X-Received: by 2002:a05:6602:26ca:b0:86d:5b3:3b88 with SMTP id ca18e2360f4ac-8762d1b0cedmr243625639f.1.1750428637859;
        Fri, 20 Jun 2025 07:10:37 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8762b7adc23sm50782439f.35.2025.06.20.07.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 07:10:37 -0700 (PDT)
Message-ID: <8126de92-0338-4cd0-98fc-4f8c37500201@riscstar.com>
Date: Fri, 20 Jun 2025 09:10:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] mfd: spacemit: add support for SpacemiT PMICs
To: Lee Jones <lee@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250613210150.1468845-1-elder@riscstar.com>
 <20250613210150.1468845-3-elder@riscstar.com>
 <20250619144023.GG795775@google.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250619144023.GG795775@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_071045_045382_A53AA751 
X-CRM114-Status: GOOD (  41.83  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 6/19/25 9:40 AM, Lee Jones wrote:
> On Fri, 13 Jun 2025, Alex Elder wrote:
> 
>> Add support for SpacemiT PMICs. Initially only the P1 PMIC is supported
>> but the driver is structured to allow support for others to be added.
>>
>> The P1 PMIC is controlled by I2C, and is normally implemented with the
>> SpacemiT K1 SoC.  This PMIC provides six buck converters and 12 LDO
> 
> six or 12.  Please pick a format and remain consistent.

"Numbers smaller than ten should be spelled out."

But I'll use 6 and 12.

>> regulators.  It also implements a switch, watchdog timer, real-time clock,
>> and more, but initially we will only support its regulators.
> 
> You have to provide support for more than one device for this to be
> accepted into MFD.

OK.  I'm looking at the other device functions to see if I
can pick the easiest one.

>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/mfd/Kconfig         | 11 +++++
>>   drivers/mfd/Makefile        |  1 +
>>   drivers/mfd/spacemit-pmic.c | 91 +++++++++++++++++++++++++++++++++++++
>>   3 files changed, 103 insertions(+)
>>   create mode 100644 drivers/mfd/spacemit-pmic.c
>>
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>> index 6fb3768e3d71c..c59ae6cc2dd8d 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -1182,6 +1182,17 @@ config MFD_QCOM_RPM
>>   	  Say M here if you want to include support for the Qualcomm RPM as a
>>   	  module. This will build a module called "qcom_rpm".
>>   
>> +config MFD_SPACEMIT_PMIC
>> +	tristate "SpacemiT PMIC"
>> +	depends on ARCH_SPACEMIT || COMPILE_TEST
>> +	depends on I2C && OF
>> +	select MFD_CORE
>> +	select REGMAP_I2C
>> +	default ARCH_SPACEMIT
>> +	help
>> +	  This option enables support for SpacemiT I2C based PMICs.  At
>> +	  this time only the P1 PMIC (used with the K1 SoC) is supported.
>> +
>>   config MFD_SPMI_PMIC
>>   	tristate "Qualcomm SPMI PMICs"
>>   	depends on ARCH_QCOM || COMPILE_TEST
>> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
>> index 79495f9f3457b..59d1ec8db3a3f 100644
>> --- a/drivers/mfd/Makefile
>> +++ b/drivers/mfd/Makefile
>> @@ -266,6 +266,7 @@ obj-$(CONFIG_MFD_SUN4I_GPADC)	+= sun4i-gpadc.o
>>   obj-$(CONFIG_MFD_STM32_LPTIMER)	+= stm32-lptimer.o
>>   obj-$(CONFIG_MFD_STM32_TIMERS) 	+= stm32-timers.o
>>   obj-$(CONFIG_MFD_MXS_LRADC)     += mxs-lradc.o
>> +obj-$(CONFIG_MFD_SPACEMIT_PMIC)	+= spacemit-pmic.o
>>   obj-$(CONFIG_MFD_SC27XX_PMIC)	+= sprd-sc27xx-spi.o
>>   obj-$(CONFIG_RAVE_SP_CORE)	+= rave-sp.o
>>   obj-$(CONFIG_MFD_ROHM_BD71828)	+= rohm-bd71828.o
>> diff --git a/drivers/mfd/spacemit-pmic.c b/drivers/mfd/spacemit-pmic.c
>> new file mode 100644
>> index 0000000000000..7c3c3e27236da
>> --- /dev/null
>> +++ b/drivers/mfd/spacemit-pmic.c
>> @@ -0,0 +1,91 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2025 by RISCstar Solutions Corporation.  All rights reserved.
>> + * Derived from code from:
>> + *	Copyright (C) 2024 Troy Mitchell <troymitchell988@gmail.com>
>> + */
>> +
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/i2c.h>
>> +#include <linux/mfd/core.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/regmap.h>
>> +#include <linux/types.h>
>> +
>> +struct spacemit_pmic_data {
> 
> s/data/ddata/

I hadn't noticed that convention.  I'll use it.

>> +	const struct regmap_config *regmap_config;
>> +	const struct mfd_cell *mfd_cells;	/* array */
> 
> Hmm ... this is a red flag.  Let's see.
> 
>> +	size_t mfd_cell_count;
>> +};
>> +
>> +static const struct regmap_config p1_regmap_config = {
>> +	.reg_bits	= 8,
>> +	.val_bits	= 8,
>> +	.max_register	= 0xaa,
>> +};
>> +
>> +/* The name field defines the *driver* name that should bind to the device */
> 
> This comment is superfluous.

I'll delete it.

I was expecting the driver to recognize the device, not
the device specifying what driver to use, but I guess
I'm used to the DT model.

>> +static const struct mfd_cell p1_cells[] = {
>> +	{
>> +		.name		= "spacemit-p1-regulator",
> 
> This spacing is wonky.  Take a look at all the other drivers here.
> 
> Also, you probably want to use MFD_CELL_NAME().

Yes, I see that does what I want.

> One is not enough.
> 
>> +	},
>> +};
>> +
>> +static const struct spacemit_pmic_data p1_pmic_data = {
>> +	.regmap_config	= &p1_regmap_config,
>> +	.mfd_cells	= p1_cells,
>> +	.mfd_cell_count	= ARRAY_SIZE(p1_cells),
>> +};
>> +
>> +static int spacemit_pmic_probe(struct i2c_client *client)
>> +{
>> +	const struct spacemit_pmic_data *data;
>> +	struct device *dev = &client->dev;
>> +	struct regmap *regmap;
>> +
>> +	/* We currently have no need for a device-specific structure */
> 
> Then why are we adding one?

I don't understand, but it might be moot once I add support
for another (sub)device.

>> +	data = of_device_get_match_data(dev);
>> +	regmap = devm_regmap_init_i2c(client, data->regmap_config);
>> +	if (IS_ERR(regmap))
>> +		return dev_err_probe(dev, PTR_ERR(regmap),
>> +				     "regmap initialization failed");
>> +
>> +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
>> +				    data->mfd_cells, data->mfd_cell_count,
>> +				    NULL, 0, NULL);
>> +}
>> +
>> +static const struct of_device_id spacemit_pmic_match[] = {
>> +	{
>> +		.compatible	= "spacemit,p1",
>> +		.data		= &p1_pmic_data,
> 
> Ah, now I see.
> 
> We do not allow one data from registration mechanism (MFD) to be piped
> through another (OF).  If you have to match platform data to device (you
> don't), then pass through identifiers and match on those in a switch()
> statement instead.

I haven't done an MFD driver before and it took some time
to get this working.  I'll tell you what led me to it.

I used code posted by Troy Mitchell (plus downstream) as a
starting point.
   https://lore.kernel.org/lkml/20241230-k1-p1-v1-0-aa4e02b9f993@gmail.com/

Krzysztof Kozlowski made this comment on Troy's DT binding:
   Drop compatible, regulators are not re-usable blocks.

So my goal was to have the PMIC regulators get bound to a
driver without specifying a DT compatible string, and I
found this worked.

You say I don't need to match platform data to device, but
if I did I would pass through identifiers.  Can you refer
me to an example of code that correctly does what I should
be doing instead?

One other comment/question:
   This driver is structured as if it could support a different
   PMIC (in addition to P1).  Should I *not* do that, and simply
   make a source file hard-coded for this one PMIC?

>> +	},
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, spacemit_pmic_match);
>> +
>> +static struct i2c_driver spacemit_pmic_i2c_driver = {
>> +	.driver = {
>> +		.name = "spacemit-pmic",
>> +		.of_match_table = spacemit_pmic_match,
>> +	},
>> +	.probe    = spacemit_pmic_probe,
> 
> Remove these odd tabs please.

OK.

>> +};
>> +
>> +static int __init spacemit_pmic_init(void)
>> +{
>> +	return i2c_add_driver(&spacemit_pmic_i2c_driver);
>> +}
>> +
>> +static void __exit spacemit_pmic_exit(void)
>> +{
>> +	i2c_del_driver(&spacemit_pmic_i2c_driver);
>> +}
>> +
> 
> Remove this line.

Sure.

>> +module_init(spacemit_pmic_init);
>> +module_exit(spacemit_pmic_exit);
> 
> Are you sure there isn't some boiler plate to do all of this?
> 
> Ah ha:
> 
>    module_i2c_driver()

Thanks for Googling that for me.  And thank you very much
for the review.

					-Alex


>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("SpacemiT multi-function PMIC driver");
>> -- 
>> 2.45.2
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
