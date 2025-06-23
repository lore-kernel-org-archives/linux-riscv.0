Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03281C77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 01:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=95YM0kEg2NWHmS09hiadNcR/SSc1lNnm3N9CJRhPcx0=; b=yMGbiJL6Vo0ex6
	U5FtAZCUdvOVPi8zu+OXuqBXkMl3khg44eoBIaKC6JYZlzQaq8T6xmODFBriIAROBZcikVqImWsdT
	QOtMg9FvXeyb/cvyemdV2sb72Kq7mN6VNAdK8DOvWqE+qfiTuPUEWE+d1+bZfErhDQ+9um4gM2rip
	/3EByilZldRWW6GVZIn6xXw+4P1dzNZghx/s/ZeqtcIo9Hn6JEVTJ2dUvqXS2Zjq2Fy9YHmI+1X6H
	PIt/I0SRBxjjVCT/hJw2o/U8xuynEDDS5FZHZLGBI9z2040shqFFTk1ook1rWHF0uHcWeLJbge8GE
	B7KFBDuzIN/16TsUNCGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTscD-00000004NaF-3esd;
	Tue, 24 Jun 2025 01:38:25 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTmcK-00000003n43-1I0x
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 19:14:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9A8644389;
	Mon, 23 Jun 2025 19:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750706043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=plrmxrpOaORibBC+apUmisrBSlFs6aP2PmQczgUKjrI=;
	b=U9S098LvVLIdJuLYXK0FftX9g34JekisyscFQJIoAzY2vz0bfJ8D3WvkE01Q2hHarpKyBk
	sI8RZtNOZnehhk7Oyuy5avAdrsfAXsCA87A/e2uS0XRisLUHzl8HgEuQb+9ayhU8Vl3qbK
	vIbbuBUDQObejeiV+34Wj3Ehl0C+n3sI6rfem5W+E2iZwa8/FqFMiAlH1M1guLaEaLS/I2
	IrhTD7Pj/dQ/8awTtD+su2Zw7ruMzumfoiJwUQTArRjFPnCg0LcWvh4abN0HyvIA1I9/wh
	XeYf7ZQHTEdisAa3FSTAMCHPCs2Q5QJ0VVDmt7TOrUBsiWrxxqkLlqSfu6jLPA==
Date: Mon, 23 Jun 2025 21:14:00 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alex Elder <elder@riscstar.com>
Cc: lee@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dlan@gentoo.org, wangruikang@iscas.ac.cn, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	troymitchell988@gmail.com, guodong@riscstar.com,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 4/7] rtc: spacemit: support the SpacemiT P1 RTC
Message-ID: <20250623191400c330f01f@mail.local>
References: <20250622032941.3768912-1-elder@riscstar.com>
 <20250622032941.3768912-5-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250622032941.3768912-5-elder@riscstar.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujeekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopegvlhguvghrsehrihhstghsthgrrhdrtghomhdprhgtphhtthhopehlvggvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlghhirhgufihoohgusehgmhgrihhlrdgto
 hhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughlrghnsehgvghnthhoohdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_121408_673356_51F8EC6C 
X-CRM114-Status: GOOD (  32.16  )
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

Hello,

On 21/06/2025 22:29:36-0500, Alex Elder wrote:
> Add support for the RTC found in the SpacemiT P1 PMIC.  Initially
> only setting and reading the time are supported.
> 
> The PMIC is implemented as a multi-function device.  This RTC is
> probed based on this driver being named in a MFD cell in the simple
> MFD I2C driver.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v3: - Added this driver to the series, in response to Lee Jones saying
>       more than one MFD sub-device was required to be acceptable
> 
>  drivers/rtc/Kconfig  |  10 ++++
>  drivers/rtc/Makefile |   1 +
>  drivers/rtc/rtc-p1.c | 137 +++++++++++++++++++++++++++++++++++++++++++

We need something more descriptive than p1 here

>  3 files changed, 148 insertions(+)
>  create mode 100644 drivers/rtc/rtc-p1.c
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 9aec922613cec..27cff02ba4e66 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -406,6 +406,16 @@ config RTC_DRV_MAX77686
>  	  This driver can also be built as a module. If so, the module
>  	  will be called rtc-max77686.
>  
> +config RTC_DRV_P1

Ditto

> +	tristate "SpacemiT P1 RTC"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	select MFD_SPACEMIT_P1
> +	default ARCH_SPACEMIT
> +	help
> +	  Enable support for the RTC function in the SpacemiT P1 PMIC.
> +	  This driver can also be built as a module, which will be called
> +	  "spacemit-p1-rtc".
> +
>  config RTC_DRV_NCT3018Y
>  	tristate "Nuvoton NCT3018Y"
>  	depends on OF
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 4619aa2ac4697..f8588426e2ba4 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -171,6 +171,7 @@ obj-$(CONFIG_RTC_DRV_SD2405AL)	+= rtc-sd2405al.o
>  obj-$(CONFIG_RTC_DRV_SD3078)	+= rtc-sd3078.o
>  obj-$(CONFIG_RTC_DRV_SH)	+= rtc-sh.o
>  obj-$(CONFIG_RTC_DRV_SNVS)	+= rtc-snvs.o
> +obj-$(CONFIG_RTC_DRV_P1)	+= rtc-p1.o
>  obj-$(CONFIG_RTC_DRV_SPEAR)	+= rtc-spear.o
>  obj-$(CONFIG_RTC_DRV_STARFIRE)	+= rtc-starfire.o
>  obj-$(CONFIG_RTC_DRV_STK17TA8)	+= rtc-stk17ta8.o
> diff --git a/drivers/rtc/rtc-p1.c b/drivers/rtc/rtc-p1.c
> new file mode 100644
> index 0000000000000..e0d2c0c822142
> --- /dev/null
> +++ b/drivers/rtc/rtc-p1.c
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for the RTC found in the SpacemiT P1 PMIC
> + *
> + * Copyright (C) 2025 by RISCstar Solutions Corporation.  All rights reserved.
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/rtc.h>
> +
> +#define MOD_NAME	"spacemit-p1-rtc"
> +
> +/* Offset to byte containing the given time unit */
> +enum time_unit {
> +	tu_second = 0,		/* 0-59 */
> +	tu_minute,		/* 0-59 */
> +	tu_hour,		/* 0-59 */
> +	tu_day,			/* 0-30 (struct tm uses 1-31) */
> +	tu_month,		/* 0-11 */
> +	tu_year,		/* Years since 2000 (struct tm uses 1900) */
> +	tu_count,		/* Last; not a time unit */
> +};

I'm not sure this enum actually brings anything

> +
> +/* Consecutive bytes contain seconds, minutes, etc. */
> +#define RTC_COUNT_BASE		0x0d
> +
> +#define RTC_CTRL		0x1d
> +#define RTC_EN		BIT(2)
> +
> +struct p1_rtc {
> +	struct regmap *regmap;
> +	struct rtc_device *rtc;
> +};
> +
> +static int p1_rtc_read_time(struct device *dev, struct rtc_time *t)
> +{
> +	struct p1_rtc *p1 = dev_get_drvdata(dev);
> +	u8 time[tu_count];
> +	int ret;
> +
> +	ret = regmap_bulk_read(p1->regmap, RTC_COUNT_BASE, &time, sizeof(time));
> +	if (ret)
> +		return ret;
> +
> +	t->tm_sec = time[tu_second] & GENMASK(5, 0);
> +	t->tm_min = time[tu_minute] & GENMASK(5, 0);
> +	t->tm_hour = time[tu_hour] & GENMASK(4, 0);
> +	t->tm_mday = (time[tu_day] & GENMASK(4, 0)) + 1;
> +	t->tm_mon = time[tu_month] & GENMASK(3, 0);
> +	t->tm_year = (time[tu_year] & GENMASK(5, 0)) + 100;
> +	/* tm_wday, tm_yday, and tm_isdst aren't used */
> +
> +	return 0;
> +}
> +
> +static int p1_rtc_set_time(struct device *dev, struct rtc_time *t)
> +{
> +	struct p1_rtc *p1 = dev_get_drvdata(dev);
> +	u8 time[tu_count];
> +	int ret;
> +
> +	time[tu_second] = t->tm_sec;
> +	time[tu_minute] = t->tm_min;
> +	time[tu_hour] = t->tm_hour;
> +	time[tu_day] = t->tm_mday - 1;
> +	time[tu_month] = t->tm_mon;
> +	time[tu_year] = t->tm_year - 100;
> +
> +	/* Disable the RTC to update; re-enable again when done */
> +	ret = regmap_update_bits(p1->regmap, RTC_CTRL, RTC_EN, 0);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_bulk_write(p1->regmap, RTC_COUNT_BASE, time, sizeof(time));
> +
> +	(void)regmap_update_bits(p1->regmap, RTC_CTRL, RTC_EN, RTC_EN);

Don't you care whether the RTC has been reenabled?

> +
> +	return ret;
> +}
> +
> +static const struct rtc_class_ops p1_rtc_class_ops = {
> +	.read_time = p1_rtc_read_time,
> +	.set_time = p1_rtc_set_time,
> +};
> +
> +static int p1_rtc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rtc_device *rtc;
> +	struct p1_rtc *p1;
> +	int ret;
> +
> +	p1 = devm_kzalloc(dev, sizeof(*p1), GFP_KERNEL);
> +	if (!p1)
> +		return -ENOMEM;
> +	dev_set_drvdata(dev, p1);
> +
> +	p1->regmap = dev_get_regmap(dev->parent, NULL);
> +	if (!p1->regmap)
> +		return dev_err_probe(dev, -ENODEV, "failed to get regmap\n");
> +
> +	rtc = devm_rtc_allocate_device(dev);
> +	if (IS_ERR(rtc))
> +		return dev_err_probe(dev, PTR_ERR(rtc),
> +				     "error allocating device\n");
> +	p1->rtc = rtc;
> +
> +	rtc->ops = &p1_rtc_class_ops;
> +	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
> +	rtc->range_max = RTC_TIMESTAMP_END_2063;
> +
> +	clear_bit(RTC_FEATURE_ALARM, rtc->features);
> +	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
> +
> +	ret = devm_rtc_register_device(rtc);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "error registering RTC\n");

This message is unnecessary, there are no silent error path in
devm_rtc_register_device

> +
> +	return 0;
> +}
> +
> +static struct platform_driver p1_rtc_driver = {
> +	.probe = p1_rtc_probe,
> +	.driver = {
> +		.name = MOD_NAME,
> +	},
> +};
> +
> +module_platform_driver(p1_rtc_driver);
> +
> +MODULE_DESCRIPTION("SpacemiT P1 RTC driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:" MOD_NAME);

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
