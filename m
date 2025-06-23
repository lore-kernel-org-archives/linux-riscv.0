Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42828C7EE33
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 01:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z01QvVgZPcthiZZ/a2mr5b4kB4bCWcSEv56yiD5IMTU=; b=BGN5G8mIoVlwLL
	6ZIEZv/JDWN/EbJqqtnaEfPtiLXKEBES6j09Ar7kqlZgxrH2bW7Yp+OOIYQw1jMTosqzn3TmRFHrG
	m6WBoVjwNcv7IJ7COsoqoH1z6Jcvg6vl/Lg54nb9UEeN3+rJaUTc0vscVI7g++TsdEBxeUfmiM9JC
	1GeLCTD/U23y/GFMWtVVZQjB9NTgSknHf7YguEM2GddNTAYS+qyPak2KEaJ2j0m3c9f/zOUQrK9j9
	pwLRu2H0eqY9PxAHEe/BumXs9NbV7XUqpsJnrH08cG+JaNi5b3NIpbpDwEb+xrB1zSqApXKziVPRx
	8Sk9faPYEh0MHX5Wa2Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTscI-00000004NdZ-0NJX;
	Tue, 24 Jun 2025 01:38:30 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTnO4-00000003tQu-11yK
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 20:03:29 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6fafdd322d3so52184666d6.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 13:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750709007; x=1751313807; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SHvbV5Gb3cOPD4o1UtqsMvsOaltem8eGes/uTQkdjBA=;
        b=o6huOfouXVSFjUp2JJrovmzZwFgCNL9/cZ6AcU1LyR6LnKrJ42wPO1BLH/wK0Xba98
         13oLqkNmRFS5ZUPPsbn4F9geC7KZNQpV68UqnFGZYI12IUDoXPA3X0Bwh02KXERFNWT4
         zDRLR3Te3/qeD1cVXu76h6FOZ7tberSFnJkFId1Noyntaa+X0ZfWoNBHz50trNvcxpgU
         Gja5oHlN5CVqgwb6hY6QCZTLtUTL+5pZVNz/iZNgLQgcyZxhOTWhgzLwAuCq/d0TLFC7
         9DQHP1iBUZS7EEbeZuZOOt5WZHpBQlVwzokya4vAwhFohupDqpmFeZm5zInj5JYZI7zc
         0CyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750709007; x=1751313807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SHvbV5Gb3cOPD4o1UtqsMvsOaltem8eGes/uTQkdjBA=;
        b=HGc4O3S3GCHp145wVYfQhUMUne6WMna1NlKxlnx5zi5ve9zPMYQ1YChFGBGme0xD3z
         hqIy5i9CkVi+yu0RXdzRFvYxDV99m1tvK4syNbeMzdw6vRsSCHCf4Qp6Y66Ikzii83/d
         xivDzPQY3XFEo7dWp8qlb1mMmGxwjsrDfiIhij2W9JnhdPZIIZEl9FDuy4aqR3Dd464L
         7diSMc4MbXtvKBwNI7/YKpOX6IN7bHdYvJthgA0LsqPfM3up3QM3ShfNJdhtK/MbWHPn
         Ftj0OXJN+QJpardtua0TTebwyipg7Y6puunCt7Rqf3Kg36ugydeXFtaRDbwpxLylg5Lj
         v9NQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5thvNZpJBBW7HENfVu5J+dIA1EeDGo9uH9l+A9AB5PWjjEmEl5MDR5uKPfYxZGXWDuSzHOQCRPj4T+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ4YXbLS3nI9W0qGnC9nSOF9s56iRjx6HcwjauLbVdUYuapmF7
	aHNSpTpHhoA5oFro6cn02n5rLOXW9UJSwF/qJ6gJfPBdHDLZSP870JEsvipVT3fvHvo=
X-Gm-Gg: ASbGncte7zGLgfnf8Qp/OY4COl9OqyrekU8pYaKhjNBzfd8VgdPUVQKRT5UrIzbmcBm
	ZcaLe6nzLmGSzy2yz52GoqhNkyaqbxypzo1KuvPN8SqVFokJgfOvq1QD6aT8RgwqDTlgqtZDv8E
	XNrrLbmp70xvfCDvKXg0en6zlV+VbQ4RPok5ydaV1jqJ/0E6WYtQNZCZ0O4IbGwmfErytqANbVm
	HjUj+/6d47cXiuv8d4+X5+i3RpfazjliJjIXtxc0I5hDbH0GeJgp3dZjLURycwrChJNxFSiC6Ea
	NUuUEypQSMTJe8zpXJVuwMlAb0oIMVOtqnFOY6VJHnQbadhzjTgO/BcFcbedEiJkJD9czl95zp1
	0px41TXJGG8wtFQ5zlqXVI5iO/Q==
X-Google-Smtp-Source: AGHT+IHumrQ7I9+KWWFuDhRtTXUetnYj5eNaskA2/R5KWnq/Qt2+NVksAOmZOF3H1r8gUpMvuaqYsw==
X-Received: by 2002:a05:6214:540e:b0:6fa:c3c8:d3d9 with SMTP id 6a1803df08f44-6fd0a31b2damr232736376d6.0.1750709007021;
        Mon, 23 Jun 2025 13:03:27 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd094569bdsm48831816d6.48.2025.06.23.13.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 13:03:26 -0700 (PDT)
Message-ID: <f2d04232-6662-49d5-936d-ec58d0fb01b6@riscstar.com>
Date: Mon, 23 Jun 2025 15:03:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] rtc: spacemit: support the SpacemiT P1 RTC
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: lee@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org,
 wangruikang@iscas.ac.cn, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, troymitchell988@gmail.com,
 guodong@riscstar.com, devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20250622032941.3768912-1-elder@riscstar.com>
 <20250622032941.3768912-5-elder@riscstar.com>
 <20250623191400c330f01f@mail.local>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250623191400c330f01f@mail.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_130328_296470_89CAB010 
X-CRM114-Status: GOOD (  29.79  )
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

On 6/23/25 2:14 PM, Alexandre Belloni wrote:
> Hello,
> 
> On 21/06/2025 22:29:36-0500, Alex Elder wrote:
>> Add support for the RTC found in the SpacemiT P1 PMIC.  Initially
>> only setting and reading the time are supported.
>>
>> The PMIC is implemented as a multi-function device.  This RTC is
>> probed based on this driver being named in a MFD cell in the simple
>> MFD I2C driver.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v3: - Added this driver to the series, in response to Lee Jones saying
>>        more than one MFD sub-device was required to be acceptable
>>
>>   drivers/rtc/Kconfig  |  10 ++++
>>   drivers/rtc/Makefile |   1 +
>>   drivers/rtc/rtc-p1.c | 137 +++++++++++++++++++++++++++++++++++++++++++
> 
> We need something more descriptive than p1 here

Are you referring to the chip itself, or do you want a longer
file name?   Do you prefer "rtc-spacemit-p1.c" or something?

>>   3 files changed, 148 insertions(+)
>>   create mode 100644 drivers/rtc/rtc-p1.c
>>
>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>> index 9aec922613cec..27cff02ba4e66 100644
>> --- a/drivers/rtc/Kconfig
>> +++ b/drivers/rtc/Kconfig
>> @@ -406,6 +406,16 @@ config RTC_DRV_MAX77686
>>   	  This driver can also be built as a module. If so, the module
>>   	  will be called rtc-max77686.
>>   
>> +config RTC_DRV_P1
> 
> Ditto
> 
>> +	tristate "SpacemiT P1 RTC"
>> +	depends on ARCH_SPACEMIT || COMPILE_TEST
>> +	select MFD_SPACEMIT_P1
>> +	default ARCH_SPACEMIT
>> +	help
>> +	  Enable support for the RTC function in the SpacemiT P1 PMIC.
>> +	  This driver can also be built as a module, which will be called
>> +	  "spacemit-p1-rtc".
>> +
>>   config RTC_DRV_NCT3018Y
>>   	tristate "Nuvoton NCT3018Y"
>>   	depends on OF
>> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
>> index 4619aa2ac4697..f8588426e2ba4 100644
>> --- a/drivers/rtc/Makefile
>> +++ b/drivers/rtc/Makefile
>> @@ -171,6 +171,7 @@ obj-$(CONFIG_RTC_DRV_SD2405AL)	+= rtc-sd2405al.o
>>   obj-$(CONFIG_RTC_DRV_SD3078)	+= rtc-sd3078.o
>>   obj-$(CONFIG_RTC_DRV_SH)	+= rtc-sh.o
>>   obj-$(CONFIG_RTC_DRV_SNVS)	+= rtc-snvs.o
>> +obj-$(CONFIG_RTC_DRV_P1)	+= rtc-p1.o
>>   obj-$(CONFIG_RTC_DRV_SPEAR)	+= rtc-spear.o
>>   obj-$(CONFIG_RTC_DRV_STARFIRE)	+= rtc-starfire.o
>>   obj-$(CONFIG_RTC_DRV_STK17TA8)	+= rtc-stk17ta8.o
>> diff --git a/drivers/rtc/rtc-p1.c b/drivers/rtc/rtc-p1.c
>> new file mode 100644
>> index 0000000000000..e0d2c0c822142
>> --- /dev/null
>> +++ b/drivers/rtc/rtc-p1.c
>> @@ -0,0 +1,137 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Driver for the RTC found in the SpacemiT P1 PMIC
>> + *
>> + * Copyright (C) 2025 by RISCstar Solutions Corporation.  All rights reserved.
>> + */
>> +
>> +#include <linux/bits.h>
>> +#include <linux/device.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/rtc.h>
>> +
>> +#define MOD_NAME	"spacemit-p1-rtc"
>> +
>> +/* Offset to byte containing the given time unit */
>> +enum time_unit {
>> +	tu_second = 0,		/* 0-59 */
>> +	tu_minute,		/* 0-59 */
>> +	tu_hour,		/* 0-59 */
>> +	tu_day,			/* 0-30 (struct tm uses 1-31) */
>> +	tu_month,		/* 0-11 */
>> +	tu_year,		/* Years since 2000 (struct tm uses 1900) */
>> +	tu_count,		/* Last; not a time unit */
>> +};
> 
> I'm not sure this enum actually brings anything

It's just defining the sequence of register values
symbolically.  Do you prefer #defines?

It doesn't matter much to me, I just want to know what
you'd prefer.

> 
>> +
>> +/* Consecutive bytes contain seconds, minutes, etc. */
>> +#define RTC_COUNT_BASE		0x0d
>> +
>> +#define RTC_CTRL		0x1d
>> +#define RTC_EN		BIT(2)
>> +
>> +struct p1_rtc {
>> +	struct regmap *regmap;
>> +	struct rtc_device *rtc;
>> +};
>> +
>> +static int p1_rtc_read_time(struct device *dev, struct rtc_time *t)
>> +{
>> +	struct p1_rtc *p1 = dev_get_drvdata(dev);
>> +	u8 time[tu_count];
>> +	int ret;
>> +
>> +	ret = regmap_bulk_read(p1->regmap, RTC_COUNT_BASE, &time, sizeof(time));
>> +	if (ret)
>> +		return ret;
>> +
>> +	t->tm_sec = time[tu_second] & GENMASK(5, 0);
>> +	t->tm_min = time[tu_minute] & GENMASK(5, 0);
>> +	t->tm_hour = time[tu_hour] & GENMASK(4, 0);
>> +	t->tm_mday = (time[tu_day] & GENMASK(4, 0)) + 1;
>> +	t->tm_mon = time[tu_month] & GENMASK(3, 0);
>> +	t->tm_year = (time[tu_year] & GENMASK(5, 0)) + 100;
>> +	/* tm_wday, tm_yday, and tm_isdst aren't used */
>> +
>> +	return 0;
>> +}
>> +
>> +static int p1_rtc_set_time(struct device *dev, struct rtc_time *t)
>> +{
>> +	struct p1_rtc *p1 = dev_get_drvdata(dev);
>> +	u8 time[tu_count];
>> +	int ret;
>> +
>> +	time[tu_second] = t->tm_sec;
>> +	time[tu_minute] = t->tm_min;
>> +	time[tu_hour] = t->tm_hour;
>> +	time[tu_day] = t->tm_mday - 1;
>> +	time[tu_month] = t->tm_mon;
>> +	time[tu_year] = t->tm_year - 100;
>> +
>> +	/* Disable the RTC to update; re-enable again when done */
>> +	ret = regmap_update_bits(p1->regmap, RTC_CTRL, RTC_EN, 0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_bulk_write(p1->regmap, RTC_COUNT_BASE, time, sizeof(time));
>> +
>> +	(void)regmap_update_bits(p1->regmap, RTC_CTRL, RTC_EN, RTC_EN);
> 
> Don't you care whether the RTC has been reenabled?

Yes, Mateusz pointed this out.  I'll fix this.

I hope that disabling and re-enabling isn't require,
which makes the error possibilities a lot simpler.

Otherwise it's not clear how best to recover from
an error re-enabling the RTC (but yes, if no error
occurs in the bulk write, an error when re-enabling
will be returned).

>> +
>> +	return ret;
>> +}
>> +
>> +static const struct rtc_class_ops p1_rtc_class_ops = {
>> +	.read_time = p1_rtc_read_time,
>> +	.set_time = p1_rtc_set_time,
>> +};
>> +
>> +static int p1_rtc_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct rtc_device *rtc;
>> +	struct p1_rtc *p1;
>> +	int ret;
>> +
>> +	p1 = devm_kzalloc(dev, sizeof(*p1), GFP_KERNEL);
>> +	if (!p1)
>> +		return -ENOMEM;
>> +	dev_set_drvdata(dev, p1);
>> +
>> +	p1->regmap = dev_get_regmap(dev->parent, NULL);
>> +	if (!p1->regmap)
>> +		return dev_err_probe(dev, -ENODEV, "failed to get regmap\n");
>> +
>> +	rtc = devm_rtc_allocate_device(dev);
>> +	if (IS_ERR(rtc))
>> +		return dev_err_probe(dev, PTR_ERR(rtc),
>> +				     "error allocating device\n");
>> +	p1->rtc = rtc;
>> +
>> +	rtc->ops = &p1_rtc_class_ops;
>> +	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
>> +	rtc->range_max = RTC_TIMESTAMP_END_2063;
>> +
>> +	clear_bit(RTC_FEATURE_ALARM, rtc->features);
>> +	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
>> +
>> +	ret = devm_rtc_register_device(rtc);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "error registering RTC\n");
> 
> This message is unnecessary, there are no silent error path in
> devm_rtc_register_device

Awesome.  I'll just return what devm_rtc_regsister_device()
returns.

Thanks a lot.

					-Alex

> 
>> +
>> +	return 0;
>> +}
>> +
>> +static struct platform_driver p1_rtc_driver = {
>> +	.probe = p1_rtc_probe,
>> +	.driver = {
>> +		.name = MOD_NAME,
>> +	},
>> +};
>> +
>> +module_platform_driver(p1_rtc_driver);
>> +
>> +MODULE_DESCRIPTION("SpacemiT P1 RTC driver");
>> +MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("platform:" MOD_NAME);
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
