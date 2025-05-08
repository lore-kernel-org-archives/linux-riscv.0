Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1716AC3ABC0
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 12:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YKCg1h+dOvcHd4c5+iXVw48z5cPGKGhMMdnSV3K8Z0s=; b=rabt41ABH+7HKl
	kNdeX7gKwSPh2SHPTkzzszE41L/YMIWDua9l+vyhJIXX3UHdp0VTJGjE0B9vC/YDy9dNjjWaj/wIo
	oQ8gK9Nk877lzVOUqjhBr5K1ocimCW0aV53ZV/HDmC6+akQpZ2rTqRFk3sg29CvdtOCZqBJr9LiBq
	D1c5MCINV9/2x8ENWGMcERd5H5qLoj0aDghGZQ2QXl49kjDwqHWnylLLxjq5CNtsDF47q9hXGtgNU
	4w877YQjUgLP8i2u2h6OfQhbmdL08+x3jzRPyOLGg2/orvC3gkQ4Kzc9lXHxB8Jj4A0LdOSy7VYTx
	pvQrhkl2PiQVEO3nC7zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD004-00000000YaM-3Alm;
	Thu, 08 May 2025 12:05:16 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD001-00000000YZr-460s
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 12:05:15 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-85d9a87660fso79094739f.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 05:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746705913; x=1747310713; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K8M0x8NEzmO2L8ditubkbYYKzlcC91sxEJhQj0PA8tI=;
        b=0CWY8dFN2wTsb4d/MjyVhcg+EGyUsGJLb3CFBNRDdC99RXCtHSCxxikF8N3O800rzU
         pPF08tH/F2Nq4/IxWZjeu/I9ogvzsTiQa2mYqW/d7+sCx1N7mhZHtPEM+qPFxaSO6zFo
         +nIGPEi0mcTZxlmvLoQzBTWbDG3nOHbkfttkXHDJ8GZqGw2womz/EiJd18R43gaqSHMQ
         bNu6L74psUQHmrkrvFMrsxzfKpDJhXfrXfpbtIJ5i4gETBcz62AfbFfA+CQnyzwjPEcD
         IwUjMtbU0GB8IRy270Fuzr9zaLEJ0GDUJRKhfAUrv+lyYWXMC6ocU9gm1zjQK0nuFgGb
         AW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746705913; x=1747310713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K8M0x8NEzmO2L8ditubkbYYKzlcC91sxEJhQj0PA8tI=;
        b=d0LFZlITbPC8MmnSdDQpcWXrucDr5MiLOX/Xie1b22QQlYNW2U9DlsRYxAzDKxPBcu
         EqVfLVUT4+QAEr4wrOyIasEak88oWs2OEkCtfbSovyx2iuU5ZqOAuk25AcP9LzbuF2lg
         BD7bvMYCYV1YjfZxJAo3BVGToIsGDCcHEO56NPAF5uV6bsfg/G8zpkYK5n09cTm2cPup
         cCesvxNurlO+PlAPehOyZyJEEJNn49aY15CTjSzoqpUiHRjvwfoaUWFLdkDi9jVPFgpc
         dxL+U35HXZKvU5DB/YK92E6wXRuhDLnZX3CnvW6rWLlkN3Ph7k9SJUKFdBiIwm2f6nUs
         T0FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUCzBqdJ2jER99V7Cc/CVrr0il/ycMxBBqT1xQc9c3X5yWnUWev2DYy5KQhnyvvnYTuo2ySZukQBb7gw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo9Kdjo+uJzxcJMXEnaIOUFy0Al6TMip8BjjbsRMACxEAFE/Mw
	U4KndPQ7dqg1UxhnJ6esZU5Q8/xzsBhfgfw3anr8k/+PZ9kf7k2IjgxxTd1VtdY=
X-Gm-Gg: ASbGncsrEyDyIEFEs6PvzXSY+0jBGKkjSbPxrB7Z1+VZVTvBChQC0jdESoHbUDZsTJD
	5VpDxUvpnMtytVJ2zHH5D9WOsuU/ph5F/XL6Zu3lf941nQ7BwUhEbC/SsIGYUJyM62ArSndQ5lL
	VD5l9Rv6L6IXDBP01uhc8mA9+fSatNrDR+uCdQT5d7hZNR1ilKa+SsHA9dQWz5a+PQY1o0C/Clk
	Qk6EFdfJzO0Tl87UBPufLxL3V1WC3n0WgosJoC6g/KFv7KI9kxi2vcUzzse/BaR5NIg6M8zIPZk
	u2yt+B+y1rdNFfJQEE9QvaepWacRTbn2DdMWq5Z23somlZVXY/Do0h1I65YMnwZANGWBHBq3pjR
	AGxWGOVtsAza23d4=
X-Google-Smtp-Source: AGHT+IENqOgzqKVvC6xZkVLM4GsFD62j+3s7icngKTzU2XQvVbzom+EN/JjFN+hVz861VlB35c5Qhw==
X-Received: by 2002:a05:6602:29c5:b0:864:a228:92b4 with SMTP id ca18e2360f4ac-8674727ecd2mr957925539f.7.1746705912788;
        Thu, 08 May 2025 05:05:12 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88a8cf7c5sm3139756173.14.2025.05.08.05.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 05:05:11 -0700 (PDT)
Message-ID: <70fb558d-2da6-4b4d-a34c-9d992b700a50@riscstar.com>
Date: Thu, 8 May 2025 07:05:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] reset: spacemit: add support for SpacemiT CCU
 resets
To: Philipp Zabel <p.zabel@pengutronix.de>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com,
 sboyd@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@gentoo.org
Cc: heylenay@4d2.org, inochiama@outlook.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250506210638.2800228-1-elder@riscstar.com>
 <20250506210638.2800228-5-elder@riscstar.com>
 <8b5d8045041f2f07b68066e4e541d5e42282fa9b.camel@pengutronix.de>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <8b5d8045041f2f07b68066e4e541d5e42282fa9b.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_050514_027816_5A539499 
X-CRM114-Status: GOOD (  32.15  )
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

On 5/8/25 4:01 AM, Philipp Zabel wrote:
> Hi Alex,
> 
> On Di, 2025-05-06 at 16:06 -0500, Alex Elder wrote:
>> Implement reset support for SpacemiT CCUs.  The code is structured to
>> handle SpacemiT resets generically, while defining the set of specific
>> reset controllers and their resets in an SoC-specific source file.
> 
> Are you confident that future SpacemiT CCUs will be sufficiently
> similar for this split to make sense? This feels like it could be a
> premature abstraction to me.

Honestly, no.  I decided to do it this way to mirror how
the clock driver is structured, but I agree with you.  The
code is pretty simple currently, and it could all go in a
single file.  Splitting it later would be easy if needed.

I'll do that for the next version.

>> A SpacemiT reset controller device is an auxiliary device associated with
>> a clock controller (CCU).
>>
>> This initial patch defines the reset controllers for the MPMU, APBC, and
>> MPMU CCUs, which already defined clock controllers.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/reset/Kconfig           |   1 +
>>   drivers/reset/Makefile          |   1 +
>>   drivers/reset/spacemit/Kconfig  |  12 +++
>>   drivers/reset/spacemit/Makefile |   7 ++
>>   drivers/reset/spacemit/core.c   |  61 +++++++++++
>>   drivers/reset/spacemit/core.h   |  39 +++++++
>>   drivers/reset/spacemit/k1.c     | 177 ++++++++++++++++++++++++++++++++
>>   7 files changed, 298 insertions(+)
>>   create mode 100644 drivers/reset/spacemit/Kconfig
>>   create mode 100644 drivers/reset/spacemit/Makefile
>>   create mode 100644 drivers/reset/spacemit/core.c
>>   create mode 100644 drivers/reset/spacemit/core.h
>>   create mode 100644 drivers/reset/spacemit/k1.c
>>
>> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
>> index 99f6f9784e686..b1f1af50ca10b 100644
>> --- a/drivers/reset/Kconfig
>> +++ b/drivers/reset/Kconfig
>> @@ -354,6 +354,7 @@ source "drivers/reset/amlogic/Kconfig"
>>   source "drivers/reset/starfive/Kconfig"
>>   source "drivers/reset/sti/Kconfig"
>>   source "drivers/reset/hisilicon/Kconfig"
>> +source "drivers/reset/spacemit/Kconfig"
>>   source "drivers/reset/tegra/Kconfig"
>>   
>>   endif
>> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
>> index 31f9904d13f9c..6c19fd875ff13 100644
>> --- a/drivers/reset/Makefile
>> +++ b/drivers/reset/Makefile
>> @@ -2,6 +2,7 @@
>>   obj-y += core.o
>>   obj-y += amlogic/
>>   obj-y += hisilicon/
>> +obj-y += spacemit/
>>   obj-y += starfive/
>>   obj-y += sti/
>>   obj-y += tegra/
>> diff --git a/drivers/reset/spacemit/Kconfig b/drivers/reset/spacemit/Kconfig
>> new file mode 100644
>> index 0000000000000..4ff3487a99eff
>> --- /dev/null
>> +++ b/drivers/reset/spacemit/Kconfig
>> @@ -0,0 +1,12 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +config RESET_SPACEMIT
>> +	bool
>> +
>> +config RESET_SPACEMIT_K1
>> +	tristate "SpacemiT K1 reset driver"
>> +	depends on ARCH_SPACEMIT || COMPILE_TEST
>> +	select RESET_SPACEMIT
>> +	default ARCH_SPACEMIT
>> +	help
>> +	  This enables the reset controller driver for the SpacemiT K1 SoC.
> 
> Does the size of the K1 specific parts even warrant this per-SoC
> Kconfig option? I suggest to only have a user visible tristate
> RESET_SPACEMIT option.

I don't know if the size warrants it, it was more about structuring
config options to match the separation of the reset definitions.
Along with consolidating into a single source file, I'll just use
a single config option.

> 
>> diff --git a/drivers/reset/spacemit/Makefile b/drivers/reset/spacemit/Makefile
>> new file mode 100644
>> index 0000000000000..3a064e9d5d6b4
>> --- /dev/null
>> +++ b/drivers/reset/spacemit/Makefile
>> @@ -0,0 +1,7 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +obj-$(CONFIG_RESET_SPACEMIT)			+= reset_spacemit.o
>> +
>> +reset_spacemit-y				:= core.o
>> +
>> +reset_spacemit-$(CONFIG_RESET_SPACEMIT_K1)	+= k1.o
>> diff --git a/drivers/reset/spacemit/core.c b/drivers/reset/spacemit/core.c
>> new file mode 100644
>> index 0000000000000..5cd981eb3f097
>> --- /dev/null
>> +++ b/drivers/reset/spacemit/core.c
>> @@ -0,0 +1,61 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
>> +/* SpacemiT reset driver core */
>> +
>> +#include <linux/container_of.h>
>> +#include <linux/regmap.h>
>> +#include <linux/reset-controller.h>
>> +#include <linux/types.h>
>> +
>> +#include "core.h"
>> +
>> +static int spacemit_reset_update(struct reset_controller_dev *rcdev,
>> +				 unsigned long id, bool assert)
>> +{
>> +	struct ccu_reset_controller *controller;
>> +	const struct ccu_reset_data *data;
>> +	u32 mask;
>> +	u32 val;
>> +
>> +	controller = container_of(rcdev, struct ccu_reset_controller, rcdev);
>> +	data = &controller->data->reset_data[id];
>> +	mask = data->assert_mask | data->deassert_mask;
>> +	val = assert ? data->assert_mask : data->deassert_mask;
>> +
>> +	return regmap_update_bits(controller->regmap, data->offset, mask, val);
>> +}
>> +
>> +static int spacemit_reset_assert(struct reset_controller_dev *rcdev,
>> +				 unsigned long id)
>> +{
>> +	return spacemit_reset_update(rcdev, id, true);
>> +}
>> +
>> +static int spacemit_reset_deassert(struct reset_controller_dev *rcdev,
>> +				   unsigned long id)
>> +{
>> +	return spacemit_reset_update(rcdev, id, false);
>> +}
>> +
>> +static const struct reset_control_ops spacemit_reset_control_ops = {
>> +	.assert		= spacemit_reset_assert,
>> +	.deassert	= spacemit_reset_deassert,
>> +};
>> +
>> +/**
>> + * spacemit_reset_controller_register() - register a reset controller
>> + * @dev:	Device that's registering the controller
>> + * @controller:	SpacemiT CCU reset controller structure
>> + */
>> +int spacemit_reset_controller_register(struct device *dev,
>> +				       struct ccu_reset_controller *controller)
>> +{
>> +	struct reset_controller_dev *rcdev = &controller->rcdev;
>> +
>> +	rcdev->ops = &spacemit_reset_control_ops;
>> +	rcdev->owner = THIS_MODULE;
>> +	rcdev->of_node = dev->of_node;
>> +	rcdev->nr_resets = controller->data->count;
>> +
>> +	return devm_reset_controller_register(dev, &controller->rcdev);
>> +}
>> diff --git a/drivers/reset/spacemit/core.h b/drivers/reset/spacemit/core.h
>> new file mode 100644
>> index 0000000000000..a71f835ccb779
>> --- /dev/null
>> +++ b/drivers/reset/spacemit/core.h
>> @@ -0,0 +1,39 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +/* SpacemiT reset driver core */
>> +
>> +#ifndef __RESET_SPACEMIT_CORE_H__
>> +#define __RESET_SPACEMIT_CORE_H__
>> +
>> +#include <linux/device.h>
> 
> This include can be replaced by forward declarations for struct device
> and struct regmap.

You're right, but I think this will be moot with a single source file.
Anyway, I'll fix this.

>> +#include <linux/reset-controller.h>
>> +#include <linux/types.h>
>> +
>> +struct ccu_reset_data {
>> +	u32 offset;
>> +	u32 assert_mask;
>> +	u32 deassert_mask;
>> +};
>> +
>> +#define RESET_DATA(_offset, _assert_mask, _deassert_mask)	\
>> +	{							\
>> +		.offset		= (_offset),			\
>> +		.assert_mask	= (_assert_mask),		\
>> +		.deassert_mask	= (_deassert_mask),		\
>> +	}
>> +
>> +struct ccu_reset_controller_data {
>> +	const struct ccu_reset_data *reset_data;	/* array */
>> +	size_t count;
>> +};
>> +
>> +struct ccu_reset_controller {
>> +	struct reset_controller_dev rcdev;
>> +	const struct ccu_reset_controller_data *data;
>> +	struct regmap *regmap;
>> +};
>> +
>> +extern int spacemit_reset_controller_register(struct device *dev,
>> +			      struct ccu_reset_controller *controller);
> 
> Drop the extern keyword.

OK, but here too I think there will be no external declaration in
the next version.

>> +
>> +#endif /* __RESET_SPACEMIT_CORE_H__ */
>> diff --git a/drivers/reset/spacemit/k1.c b/drivers/reset/spacemit/k1.c
>> new file mode 100644
>> index 0000000000000..19a34f151b214
>> --- /dev/null
>> +++ b/drivers/reset/spacemit/k1.c
>> @@ -0,0 +1,177 @@
> [...]
>> +static int spacemit_k1_reset_probe(struct auxiliary_device *adev,
>> +				   const struct auxiliary_device_id *id)
>> +{
>> +	struct spacemit_ccu_adev *rdev = to_spacemit_ccu_adev(adev);
>> +	const void *data = (void *)id->driver_data;
>> +	struct ccu_reset_controller *controller;
>> +	struct device *dev = &adev->dev;
>> +
>> +	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
>> +	if (!controller)
>> +		return -ENODEV;
> 
> -ENOMEM, this is a failed memory allocation.

Yes, you're correct, I'll fix this.  Thank you very much
for your review.

					-Alex

> regards
> Philipp


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
