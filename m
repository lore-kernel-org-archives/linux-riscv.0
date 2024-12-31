Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14ACE77188
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Dec 2024 07:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ju0RgcLrhp0PKSfsIjLc7KBxeGkztyBEkDHDAPJN5u0=; b=MCKP/rpsoyZ+qA
	GkZxFVaF90Meo/K2eaaO8n5tUOem0Jqmr3qmrOH/IvXfVsnwNSw395x/85iRpu6Ij0vOkLsaIXDhk
	BvA3JUStk8VZP8zZzmiXLhDjLmHkkIoL1bpKuJvmvdIsPwdyTMtR/2o9JUvQnt1fkmbkSC1tE2WyL
	rn2pH8+uuzke17RfOSM59mo3DRzjgUU4U0NxAT/woRWZYdoOMkbnsYlYe3VmTwA7jhz/1j6F/ss4C
	j11oZ3LAobqKMqPTEEgfyXcHcZhC8wUCSamQE9iqB9CVcDX6Q7H9vlz6W3kJ8rNRsedrXfykKxC/+
	uyhEEX/wUdPAnFvrOh7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSWJg-00000006gbx-3pHB;
	Tue, 31 Dec 2024 07:05:24 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSWJe-00000006gbU-2wro
	for linux-riscv@lists.infradead.org;
	Tue, 31 Dec 2024 07:05:23 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-21669fd5c7cso131549195ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Dec 2024 23:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735628721; x=1736233521; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vxL96k524hPFwnuPAuPSwwG3eVkzjQYeq/r9y0dX6zU=;
        b=RsgaIi6cau7JtjxYm8e7rXze02fpycDS28Mab69sdksR02jO3nTTT5+3J2fJ4NuCG2
         PEdptNcHNnlvjdj7FjULjaIzNIUfGfs65iGwlX5r6zsagzRveleAxZbZJb6zPh1B5PzB
         rcjxu5K5wl+ZuU4KQO+0mkpTnlMBszMFe++n56kklDkKqNwBAsvY0J2eSckISVIqbmkj
         L+nDGGwyNOrVHFDMR3GaJM7d26BD70+hcpr1tI6OxWxMFAiiOmcT8viqpDM/I9uZ5kkW
         xPTTsCIgyhFtzxJONxF3VZwPztEQNDNVd7fonPZN7Go10bmlaOuzz3g9s7i/p4fc9/NJ
         bCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735628721; x=1736233521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vxL96k524hPFwnuPAuPSwwG3eVkzjQYeq/r9y0dX6zU=;
        b=BaiJ3uhyhu9GeZJD00H8txsGOnLkOUru3U8M5+tq8jU5CSTC8ku5lyXkmneGc7rtYC
         imiWFEKvXdapIwr7RGWaI/YvOAoWyDTZJWX8ngcSbQBou54kd5DkuXmMdNadis3wwNww
         2OxR+47aGOYkgWRuSGQNs1tIkPUkMT3B8F4Dnl46XJESjORXcVmN4FYzqgzoD9lAl4tR
         29MEWwEySLxSTC6eq+21Sq4s+eaFcznFKKf4q8ZQmr3ZfEOpl8kXrXkkt9/YzUJs1vjN
         naLffK7NzCJ/OPY1exlPKA/tY+dG+XjqI1Tntc595qQbE0ObZ6HUdnXxKDt8DxH06Rt2
         6+uA==
X-Forwarded-Encrypted: i=1; AJvYcCW7sA/WaqUA8pfJyMA398aDkESgGWJN1widvKGc11B6zvvEgbFtx9CmyB5WuMWVkKHRl/bVzEx1cO/tWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAtFTPAkFMY1PaTKhg3vPI2hpixOrN3mBnABMhuJRCFY+dkWEK
	eAnXqzw94TkdUXz1w4FvmW4ezrqEeHltEcu/3uFFasSu6bMOXOSX
X-Gm-Gg: ASbGnctNJOlkGKXlHiGohTPjxICWU0pCXyvfM9q3v9Cl8eBBbvWWX+UCB16cQISoafZ
	kFuBQVbd0mv7wyAogxMqzNIq6eDEofUs42AmwIikB5mi11ByyxsmDEU9mp0iKibHxeTvtFh2Du7
	bBdnJADi0Ij8/Uneuxai4iPd76NKdtII0hUUA30P3uAgfIzEtoyrYOtgd2teCILeiSqsntDtQbJ
	T1lMqRvEL5rPlJJSuuBrMNTNgtyM0Puej9fLzo0
X-Google-Smtp-Source: AGHT+IGI3SSlgQgFw/RV/cr2SlcZ1KIA1Ss5CzTRTC68uk6A2ue+tFzsPPgc9UOp7OnkIcMBFnpT2A==
X-Received: by 2002:a05:6a00:c85:b0:728:e969:d4b7 with SMTP id d2e1a72fcca58-72abddbd4ecmr44679549b3a.12.1735628721389;
        Mon, 30 Dec 2024 23:05:21 -0800 (PST)
Received: from [127.0.0.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842dd089089sm18601679a12.58.2024.12.30.23.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 23:05:20 -0800 (PST)
Message-ID: <e817cccd-1470-4f57-8510-7817cf69d1f5@gmail.com>
Date: Tue, 31 Dec 2024 15:05:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mfd: add new driver for P1 PMIC from SpacemiT
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20241230-k1-p1-v1-0-aa4e02b9f993@gmail.com>
 <20241230-k1-p1-v1-2-aa4e02b9f993@gmail.com>
 <c0714653-f7b0-4bd3-877e-55682847d619@kernel.org>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <c0714653-f7b0-4bd3-877e-55682847d619@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_230522_825299_398F32DA 
X-CRM114-Status: GOOD (  38.42  )
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

Hi, Krzysztof.
Thanks for ur review!

On 2024/12/30 19:33, Krzysztof Kozlowski wrote:
> On 30/12/2024 11:02, Troy Mitchell wrote:
>> Add the core MFD driver for P1 PMIC. I define four sub-devices
> 
> 
> I do not see any definition of MFD subdevices.
I define them in spacemit-p1.h.
the macro is named `P1_MFD_CELL`
> 
>> for which the drivers will be added in subsequent patches.
>>
>> For this patch, It supports `reboot` and `shutdown`.
>>
>> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
>> ---
>>  drivers/mfd/Kconfig                        |  14 +
>>  drivers/mfd/Makefile                       |   1 +
>>  drivers/mfd/spacemit-pmic.c                | 159 ++++++++++
>>  include/linux/mfd/spacemit/spacemit-p1.h   | 491 +++++++++++++++++++++++++++++
>>  include/linux/mfd/spacemit/spacemit-pmic.h |  39 +++
>>  5 files changed, 704 insertions(+)
>>
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>> index ae23b317a64e49f0cb529ae6bd1becbb90b7c282..c062bf6b11fd23d420a6d5f6ee51b3ec97f9fcbb 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -1173,6 +1173,20 @@ config MFD_QCOM_RPM
>>  	  Say M here if you want to include support for the Qualcomm RPM as a
>>  	  module. This will build a module called "qcom_rpm".
>>  
>> +config MFD_SPACEMIT_PMIC
>> +	tristate "SpacemiT PMIC"
>> +	depends on ARCH_SPACEMIT || COMPILE_TEST
>> +	depends on I2C && OF
>> +	select MFD_CORE
>> +	select REGMAP_I2C
>> +	select REGMAP_IRQ
>> +	help
>> +	  If this option is turned on, the P1 chip produced by SpacemiT will
>> +	  be supported.
>> +
>> +	  This driver can also be compiled as a module. If you choose to build
>> +	  it as a module, the resulting kernel module will be named `spacemit-pmic`.
>> +
>>  config MFD_SPMI_PMIC
>>  	tristate "Qualcomm SPMI PMICs"
>>  	depends on ARCH_QCOM || COMPILE_TEST
>> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
>> index e057d6d6faef5c1d639789e2560f336fa26cd872..284dbb8fe2ef83bdd994a598504fe315f2eabbdf 100644
>> --- a/drivers/mfd/Makefile
>> +++ b/drivers/mfd/Makefile
>> @@ -266,6 +266,7 @@ obj-$(CONFIG_MFD_SUN4I_GPADC)	+= sun4i-gpadc.o
>>  obj-$(CONFIG_MFD_STM32_LPTIMER)	+= stm32-lptimer.o
>>  obj-$(CONFIG_MFD_STM32_TIMERS) 	+= stm32-timers.o
>>  obj-$(CONFIG_MFD_MXS_LRADC)     += mxs-lradc.o
>> +obj-$(CONFIG_MFD_SPACEMIT_PMIC)	+= spacemit-pmic.o
>>  obj-$(CONFIG_MFD_SC27XX_PMIC)	+= sprd-sc27xx-spi.o
>>  obj-$(CONFIG_RAVE_SP_CORE)	+= rave-sp.o
>>  obj-$(CONFIG_MFD_ROHM_BD71828)	+= rohm-bd71828.o
>> diff --git a/drivers/mfd/spacemit-pmic.c b/drivers/mfd/spacemit-pmic.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..d9f6785cecbd405821dead13cdf8d1f9fd64e508
>> --- /dev/null
>> +++ b/drivers/mfd/spacemit-pmic.c
>> @@ -0,0 +1,159 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2024 Troy Mitchell <troymitchell988@gmail.com>
>> + */
>> +
>> +#include <linux/i2c.h>
>> +#include <linux/mfd/core.h>
>> +#include <linux/mfd/spacemit/spacemit-pmic.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
> 
> I don't see usage of this header. Include what is used directly.
> 
>> +#include <linux/pm_wakeirq.h>
>> +#include <linux/reboot.h>
>> +
>> +P1_REGMAP_CONFIG;
>> +P1_IRQS_DESC;
>> +P1_IRQ_CHIP_DESC;
>> +P1_POWER_KEY_RESOURCES_DESC;
>> +P1_RTC_RESOURCES_DESC;
>> +P1_MFD_CELL;
>> +P1_MFD_MATCH_DATA;
> 
> Hm? Declarations and definitions go here, not to somewhere else.
I will write them here directly in next version
> 
> 
> 
>> +
>> +static int spacemit_pmic_probe(struct i2c_client *client)
>> +{
>> +	const struct spacemit_pmic_match_data *match_data;
>> +	const struct mfd_cell *cells;
>> +	struct spacemit_pmic *pmic;
>> +	int nr_cells, ret;
>> +
>> +	if (!client->irq)
>> +		return dev_err_probe(&client->dev, -ENXIO, "no interrupt supported");
> 
> And why is this fatal error? If interrupt is not supported by hardware,
> why would you add "unsupported" interrupt?
bcs the I2C driver is based on interrupt whatever I2C if use FIFO or dma.
So I judge here whether the client successfully obtains the irq. If not, the I2C
driver is unavailable.

I think I need to delete this `if`? Because if the I2C driver fails to load, the
I2C device driver will not be loaded
> 
>> +
>> +	match_data = of_device_get_match_data(&client->dev);
>> +	if (WARN_ON(!match_data))
>> +		return -EINVAL;
>> +
>> +	pmic = devm_kzalloc(&client->dev, sizeof(*pmic), GFP_KERNEL);
>> +	if (!pmic)
>> +		return -ENOMEM;
>> +
>> +	cells = match_data->mfd_cells;
>> +	nr_cells = match_data->nr_cells;
>> +
>> +	pmic->regmap_cfg = match_data->regmap_cfg;
>> +	pmic->regmap_irq_chip = match_data->regmap_irq_chip;
>> +	pmic->i2c = client;
>> +	pmic->match_data = match_data;
>> +	pmic->regmap = devm_regmap_init_i2c(client, pmic->regmap_cfg);
>> +	if (IS_ERR(pmic->regmap))
>> +		return dev_err_probe(&client->dev,
>> +				     PTR_ERR(pmic->regmap),
>> +				     "regmap initialization failed");
>> +
>> +	regcache_cache_bypass(pmic->regmap, true);
>> +
>> +	i2c_set_clientdata(client, pmic);
>> +
>> +	if (pmic->regmap_irq_chip) {
> 
> 
> It's impossible to have it false. Test your driver.
SpacemiT has another PMIC named P1S. I'm not sure if P1S has these features, and
I don't have a P1S chip to test and verify.
Therefore, I added a judgement here. But I will drop them in next version. I
should add the check only after confirming that P1S really doesn't have these
features
> 
>> +		ret = regmap_add_irq_chip(pmic->regmap, client->irq, IRQF_ONESHOT, -1,
>> +						pmic->regmap_irq_chip, &pmic->irq_data);
>> +		if (ret)
>> +			return dev_err_probe(&client->dev, ret, "failed to add irqchip");
>> +	}
>> +
>> +	dev_pm_set_wake_irq(&client->dev, client->irq);
>> +	device_init_wakeup(&client->dev, true);
>> +
>> +	ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
>> +				   cells, nr_cells, NULL, 0,
>> +				   regmap_irq_get_domain(pmic->irq_data));
>> +	if (ret)
>> +		return dev_err_probe(&client->dev, ret, "failed to add MFD devices");
>> +
>> +	if (match_data->shutdown.reg) {
> 
> Also not possible, useless if.
same
> 
>> +		ret = devm_register_sys_off_handler(&client->dev,
>> +						    SYS_OFF_MODE_POWER_OFF_PREPARE,
>> +						    SYS_OFF_PRIO_HIGH,
>> +						    &spacemit_pmic_shutdown,
>> +						    pmic);
>> +		if (ret)
>> +			return dev_err_probe(&client->dev,
>> +					     ret,
>> +					     "failed to register restart handler");
>> +
>> +	}
>> +
>> +	if (match_data->reboot.reg) {
> 
> Also not possible.
same
> 
>> +		ret = devm_register_sys_off_handler(&client->dev,
>> +						    SYS_OFF_MODE_RESTART,
>> +						    SYS_OFF_PRIO_HIGH,
>> +						    &spacemit_pmic_restart,
>> +						    pmic);
>> +		if (ret)
>> +			return dev_err_probe(&client->dev,
>> +					     ret,
>> +					     "failed to register restart handler");
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id spacemit_pmic_of_match[] = {
>> +	{ .compatible = "spacemit,p1", .data = &pmic_p1_match_data },
>> +	{ /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, spacemit_pmic_of_match);
>> +
>> +static struct i2c_driver spacemit_pmic_i2c_driver = {
>> +	.driver = {
>> +		.name = "spacemit-pmic",
>> +		.of_match_table = spacemit_pmic_of_match,
>> +	},
>> +	.probe    = spacemit_pmic_probe,
>> +};
>> +
>> +static int __init spacemit_pmic_init(void)
>> +{
>> +	return platform_driver_register(&spacemit_pmic_i2c_driver);
>> +}
>> +
>> +static void __exit spacemit_pmic_exit(void)
>> +{
>> +	platform_driver_unregister(&spacemit_pmic_i2c_driver);
>> +}
>> +
>> +module_init(spacemit_pmic_init);
>> +module_exit(spacemit_pmic_exit);
> 
> Use proper wrapper for these above.
ok
> 
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("mfd core driver for the SpacemiT PMIC");
> 
> ...
> 
>> +
>> +#define P1_MAX_REG			0xA8
>> +
>> +#define P1_BUCK_VSEL_MASK		0xff
>> +#define P1_BUCK_EN_MASK			0x1
>> +
>> +#define P1_BUCK1_CTRL_REG		0x47
>> +#define P1_BUCK2_CTRL_REG		0x4a
> 
> 
> Either lowercase or uppercase hex, not both.
ok
> 
>> +#define P1_BUCK3_CTRL_REG		0x4d
>> +#define P1_BUCK4_CTRL_REG		0x50
>> +#define P1_BUCK5_CTRL_REG		0x53
>> +#define P1_BUCK6_CTRL_REG		0x56
>> +
>> +#define P1_BUCK1_VSEL_REG		0x48
>> +#define P1_BUCK2_VSEL_REG		0x4b
>> +#define P1_BUCK3_VSEL_REG		0x4e
>> +#define P1_BUCK4_VSEL_REG		0x51
>> +#define P1_BUCK5_VSEL_REG		0x54
>> +#define P1_BUCK6_VSEL_REG		0x57
>> +
>> +#define P1_ALDO1_CTRL_REG		0x5b
>> +#define P1_ALDO2_CTRL_REG		0x5e
>> +#define P1_ALDO3_CTRL_REG		0x61
>> +#define P1_ALDO4_CTRL_REG		0x64
>> +
>> +#define P1_ALDO1_VOLT_REG		0x5c
>> +#define P1_ALDO2_VOLT_REG		0x5f
>> +#define P1_ALDO3_VOLT_REG		0x62
>> +#define P1_ALDO4_VOLT_REG		0x65
>> +
>> +#define P1_ALDO_EN_MASK			0x1
>> +#define P1_ALDO_VSEL_MASK		0x7f
>> +
>> +#define P1_DLDO1_CTRL_REG		0x67
>> +#define P1_DLDO2_CTRL_REG		0x6a
>> +#define P1_DLDO3_CTRL_REG		0x6d
>> +#define P1_DLDO4_CTRL_REG		0x70
>> +#define P1_DLDO5_CTRL_REG		0x73
>> +#define P1_DLDO6_CTRL_REG		0x76
>> +#define P1_DLDO7_CTRL_REG		0x79
>> +
>> +#define P1_DLDO1_VOLT_REG		0x68
>> +#define P1_DLDO2_VOLT_REG		0x6b
>> +#define P1_DLDO3_VOLT_REG		0x6e
>> +#define P1_DLDO4_VOLT_REG		0x71
>> +#define P1_DLDO5_VOLT_REG		0x74
>> +#define P1_DLDO6_VOLT_REG		0x77
>> +#define P1_DLDO7_VOLT_REG		0x7a
>> +
>> +#define P1_DLDO_EN_MASK			0x1
>> +#define P1_DLDO_VSEL_MASK		0x7f
>> +
>> +#define P1_SWITCH_CTRL_REG		0x59
>> +#define P1_SWTICH_EN_MASK		0x1
>> +
>> +#define P1_PWR_CTRL2			0x7e
>> +#define P1_SW_SHUTDOWN_BIT_MSK		0x4
>> +#define P1_SW_RESET_BIT_MSK		0x2
>> +
>> +#define P1_E_GPI0_MSK			BIT(0)
>> +#define P1_E_GPI1_MSK			BIT(1)
>> +#define P1_E_GPI2_MSK			BIT(2)
>> +#define P1_E_GPI3_MSK			BIT(3)
>> +#define P1_E_GPI4_MSK			BIT(4)
>> +#define P1_E_GPI5_MSK			BIT(5)
>> +
>> +#define P1_E_ADC_TEMP_MSK		BIT(0)
>> +#define P1_E_ADC_EOC_MSK		BIT(1)
>> +#define P1_E_ADC_EOS_MSK		BIT(2)
>> +#define P1_E_WDT_TO_MSK			BIT(3)
>> +#define P1_E_ALARM_MSK			BIT(4)
>> +#define P1_E_TICK_MSK			BIT(5)
>> +
>> +#define P1_E_LDO_OV_MSK			BIT(0)
>> +#define P1_E_LDO_UV_MSK			BIT(1)
>> +#define P1_E_LDO_SC_MSK			BIT(2)
>> +#define P1_E_SW_SC_MSK			BIT(3)
>> +#define P1_E_TEMP_WARN_MSK		BIT(4)
>> +#define P1_E_TEMP_SEVERE_MSK		BIT(5)
>> +#define P1_E_TEMP_CRIT_MSK		BIT(6)
>> +
>> +#define P1_E_BUCK1_OV_MSK		BIT(0)
>> +#define P1_E_BUCK2_OV_MSK		BIT(1)
>> +#define P1_E_BUCK3_OV_MSK		BIT(2)
>> +#define P1_E_BUCK4_OV_MSK		BIT(3)
>> +#define P1_E_BUCK5_OV_MSK		BIT(4)
>> +#define P1_E_BUCK6_OV_MSK		BIT(5)
>> +
>> +#define P1_E_BUCK1_UV_MSK		BIT(0)
>> +#define P1_E_BUCK2_UV_MSK		BIT(1)
>> +#define P1_E_BUCK3_UV_MSK		BIT(2)
>> +#define P1_E_BUCK4_UV_MSK		BIT(3)
>> +#define P1_E_BUCK5_UV_MSK		BIT(4)
>> +#define P1_E_BUCK6_UV_MSK		BIT(5)
>> +
>> +#define P1_E_BUCK1_SC_MSK		BIT(0)
>> +#define P1_E_BUCK2_SC_MSK		BIT(1)
>> +#define P1_E_BUCK3_SC_MSK		BIT(2)
>> +#define P1_E_BUCK4_SC_MSK		BIT(3)
>> +#define P1_E_BUCK5_SC_MSK		BIT(4)
>> +#define P1_E_BUCK6_SC_MSK		BIT(5)
>> +
>> +#define P1_E_PWRON_RINTR_MSK		BIT(0)
>> +#define P1_E_PWRON_FINTR_MSK		BIT(1)
>> +#define P1_E_PWRON_SINTR_MSK		BIT(2)
>> +#define P1_E_PWRON_LINTR_MSK		BIT(3)
>> +#define P1_E_PWRON_SDINTR_MSK		BIT(4)
>> +#define P1_E_VSYS_OV_MSK		BIT(5)
>> +
>> +#define P1_E_STATUS_REG_BASE		0x91
>> +#define P1_E_EN_REG_BASE		0x98
>> +
>> +#define P1_REGMAP_CONFIG	\
>> +	static const struct regmap_config p1_regmap_config = {	\
>> +		.reg_bits = 8,					\
>> +		.val_bits = 8,					\
>> +		.max_register = P1_MAX_REG,			\
>> +		.cache_type = REGCACHE_RBTREE,			\
>> +	}
>> +
>> +#define P1_IRQS_DESC					\
>> +static const struct regmap_irq p1_irqs[] = {		\
> 
> 
> No, all these defines are just not needed, not readable. Please follow
> existing kernel style - just look at recent drivers in drivers/mfd/ to
> see how they are designed and developed.
ok thanks!
> 
>> +	[P1_E_GPI0] = {					\
>> +		.mask = P1_E_GPI0_MSK,			\
>> +		.reg_offset = 0,			\
>> +	},						\
>> +							\
>> +	[P1_E_GPI1] = {					\
>> +		.mask = P1_E_GPI1_MSK,			\
> 
> Best regards,
> Krzysztof

-- 
Troy Mitchell

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
