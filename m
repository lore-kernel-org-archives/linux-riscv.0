Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B6CD46604
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 17:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/A1/7k1yqt7e1HywNiKz5xeSRviZTmEQspCSL9XlpPo=; b=Gb3B+kC9TqFOQo
	KAsBgzFEXL4ExBVJQH58rfMjkoWHn7eLm8IKFiC1ix07BCjmWEGjZvncNuFgDKMIEwB51vkwEWKyt
	j3wGG0tzgESbkPGzj0n3ddENpj3DUTP1VGIGoeI+TviK4Li4CBbF3XrwYO6gkwLUHkTWcxILLZhZ9
	s8PZCDoiA5nvOQrmZUV4i1Q/bVEkjcJsMoRPRecWOI+ym4DLEcM6QmKt+Pko+G0yPhJ80gR1wPcCf
	bWyJjcjekbBoPYukq6Yx3TXPbOrn8ntWyOiirXGe377CgQBlQe0Gr/8PCR1VBWfCwtRiqgNIY/9Nm
	8j2FXTR1aSQqw6IJHc7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgR89-0000000Cqrw-23LS;
	Thu, 15 Jan 2026 17:27:33 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgR87-0000000CqrS-1TrD
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 17:27:32 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-8887ac841e2so9482486d6.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 09:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768498050; x=1769102850; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fiKJ849xhUg0B5j5HLWz1UsKpOTFhEdl4ZZuo9C0n8U=;
        b=yDg8FdvUNP9Sw8lRFn7JaxKZRtuPCVMC9c5kp6HdSp/dsga+b3RUyuPD2snIpwZT19
         1KW+zWU1mGNERVyTXBnEzGwd1lAQ9tTYqmDalK4U8HTrQfNdmAG97tJhB98+yZKOOGNH
         kjOMvgCRdLQ0iPdEDZk7xWVLVlNppZfnIO3yucFfad+tStZT0mCy3X4NZMtUh7gdaqcn
         G4KvcQUnqhXQrtAumwAmrYaji9Ex4H4ltJ1HV0sBFv7/Cmv7ovNk+ToIS32L15UX+VwZ
         9FAtZyT6TYZNFWQe49wLUwYDN6YvZesx5ApdERqYzNEDRatqvlUD7cK0w+vG3rYne7rt
         H4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768498050; x=1769102850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fiKJ849xhUg0B5j5HLWz1UsKpOTFhEdl4ZZuo9C0n8U=;
        b=xMMPRZdXQ0f3/FvxFCl1My8sgRHtwcQqAGhOMrSpyfsfMwXgKUEe4C4AJ1jQDToce5
         b+uPjlsmO/mweeyaQbDL26ReD4Bxkd5XdVMSfHqUmmwqicE5B/1gDbbIBF+VWVXKmfFm
         DewsyclQU5f+pGsS7SNB7cdnq9AOS3VuCa8g28NvZVfc+DBZy2xWiFouneBpGz67QDt4
         gPAiszp1+DE/o9FYl6OF6mX1Q5DqKCKhMruU75V0iHQG1Nv40XDO5Dk1Mz2HPFrX4XCu
         +RlJYR0Z541enG1pKLZb4YF9MJhaYeeGAD0fCbWpJz4LbD3yPVpzdB05TTEs8HkIF5q/
         pYXg==
X-Forwarded-Encrypted: i=1; AJvYcCWi/W3bczU9d5vbSfZS//5LVpWQY8e4QjaOo33YbCF9YUI43rfM/Wk1A90k6fh1GgtlbNtRrJSNCTswpQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyV9eP5rjfq1mkATfXJLYhChgdvbnasabgHttl/D+VYVTAsNve0
	B7idStMVJfJd31Bz1JRAj+5wo2WVJedEHDQ/aq99buups7ma54bLCF1iMDUakOTPbzWQggjCAIo
	q85nN/CQ=
X-Gm-Gg: AY/fxX5DgzzIxCj+kny6r8IPKXeG1REL3JE7hklZ68pEECbgtbVL4V1vG2KkiEIxB1r
	p3UhAC+MXv4oSCd5EP7SyH+l60aWyx5ZQ322VodMsulFqL+MQTKcounbVx2lY0JkkGrYYhzstu+
	swz2oSWNRry5Wewb3dt91XGhEIzGRgVW60PkVaoVkI5d/CPQo6IAtTN7wZfjkIDm90DAqG0XIoQ
	NLewZA0zxArW3r2OVahHRw+ePaFze4q74Hn4AfxTVe38Id+DmPsJwrmcchv6/Ey+ubvoZrye/1J
	LRibvdX49rf2oRJexFnAF4E51RmY1W7Qs68mDTCy0feAEp47ZIa7mztMiDZhPdOjvWvldPXX2ih
	IXQrqhIpm5ocZlBa6Xmd4gC9ZXEtiZLtgwrUPfIVWXhFXxI3JPOFDuJEeYoMqYzDb6vHWOXcqVf
	1WGw69UJR1OHTef9tAEYyJBI9cQ+HDHh8dxuZqr5DmzYu0dUFweFujyDf8eZagw0c=
X-Received: by 2002:a05:6214:1243:b0:892:65bb:124b with SMTP id 6a1803df08f44-8942ddf4171mr2103946d6.70.1768498049994;
        Thu, 15 Jan 2026 09:27:29 -0800 (PST)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530a9e5d1sm452354985a.18.2026.01.15.09.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 09:27:29 -0800 (PST)
Message-ID: <80161b42-c665-4fe8-bc7c-845ca44bc723@riscstar.com>
Date: Thu, 15 Jan 2026 11:27:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] reset: spacemit: Extract common K1 reset code
To: Guodong Xu <guodong@riscstar.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Haylen Chu <heylenay@4d2.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20260108-k3-reset-v2-0-457df235efe9@riscstar.com>
 <20260108-k3-reset-v2-3-457df235efe9@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260108-k3-reset-v2-3-457df235efe9@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_092731_430813_9370A2F9 
X-CRM114-Status: GOOD (  29.75  )
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

On 1/8/26 8:22 AM, Guodong Xu wrote:
> Extract the common reset controller code from the K1 driver into
> separate reset-spacemit-common.{c,h} files to prepare for additional
> SpacemiT SoCs that share the same reset controller architecture.
> 
> The common code includes handlers for reset assert and deassert
> operations and probing for auxiliary bus devices.
> 
> Changes during extraction:
> - Module ownership: Use dev->driver->owner instead of THIS_MODULE in
>    spacemit_reset_controller_register() to correctly reference the
>    calling driver's module.
> - Rename spacemit_reset_ids to spacemit_k1_reset_ids.
> - Define new namespace "RESET_SPACEMIT" for the exported common
>    functions (spacemit_reset_probe) and update K1 driver to import it.
> 
> This prepares for additional SpacemiT SoCs (K3) that share the same reset
> controller architecture.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

This looks good to me.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
> v2: Use dev->driver->owner for the reset controller owner instead of
>      THIS_MODULE to fix the module reference counting issue pointed out
>      by Krzysztof Kozlowski.
> ---
>   drivers/reset/spacemit/Kconfig                 |  17 +++-
>   drivers/reset/spacemit/Makefile                |   2 +
>   drivers/reset/spacemit/reset-spacemit-common.c |  77 ++++++++++++++++++
>   drivers/reset/spacemit/reset-spacemit-common.h |  42 ++++++++++
>   drivers/reset/spacemit/reset-spacemit-k1.c     | 107 +++----------------------
>   5 files changed, 144 insertions(+), 101 deletions(-)
> 
> diff --git a/drivers/reset/spacemit/Kconfig b/drivers/reset/spacemit/Kconfig
> index 552884e8b72afeb05cdb9b6565ad8e7fd32f990b..56a4858b30e136296e1f9c85b7b13ccee91fe7b4 100644
> --- a/drivers/reset/spacemit/Kconfig
> +++ b/drivers/reset/spacemit/Kconfig
> @@ -1,10 +1,20 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   
> -config RESET_SPACEMIT_K1
> -	tristate "SpacemiT K1 reset driver"
> +menu "Reset support for SpacemiT platforms"
>   	depends on ARCH_SPACEMIT || COMPILE_TEST
> -	depends on SPACEMIT_K1_CCU
> +
> +config RESET_SPACEMIT_COMMON
> +	tristate
>   	select AUXILIARY_BUS
> +	help
> +	  Common reset controller infrastructure for SpacemiT SoCs.
> +	  This provides shared code and helper functions used by
> +	  reset drivers for various SpacemiT SoC families.
> +
> +config RESET_SPACEMIT_K1
> +	tristate "Support for SpacemiT K1 SoC"
> +	depends on SPACEMIT_K1_CCU
> +	select RESET_SPACEMIT_COMMON
>   	default SPACEMIT_K1_CCU
>   	help
>   	  Support for reset controller in SpacemiT K1 SoC.
> @@ -12,3 +22,4 @@ config RESET_SPACEMIT_K1
>   	  unit (CCU) driver to provide reset control functionality
>   	  for various peripherals and subsystems in the SoC.
>   
> +endmenu
> diff --git a/drivers/reset/spacemit/Makefile b/drivers/reset/spacemit/Makefile
> index de7e358c74fd7b0fac3ec2c18d985331af64fcbb..fecda9f211b24a54707b3f425b9325be1f2f7738 100644
> --- a/drivers/reset/spacemit/Makefile
> +++ b/drivers/reset/spacemit/Makefile
> @@ -1,3 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_RESET_SPACEMIT_COMMON)	+= reset-spacemit-common.o
> +
>   obj-$(CONFIG_RESET_SPACEMIT_K1)		+= reset-spacemit-k1.o
>   
> diff --git a/drivers/reset/spacemit/reset-spacemit-common.c b/drivers/reset/spacemit/reset-spacemit-common.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..0626633a5e7db6e31be4ed36505b15291eb186b1
> --- /dev/null
> +++ b/drivers/reset/spacemit/reset-spacemit-common.c
> @@ -0,0 +1,77 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/* SpacemiT reset controller driver - common implementation */
> +
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +
> +#include <soc/spacemit/ccu.h>
> +
> +#include "reset-spacemit-common.h"
> +
> +static int spacemit_reset_update(struct reset_controller_dev *rcdev,
> +				 unsigned long id, bool assert)
> +{
> +	struct ccu_reset_controller *controller;
> +	const struct ccu_reset_data *data;
> +	u32 mask;
> +	u32 val;
> +
> +	controller = container_of(rcdev, struct ccu_reset_controller, rcdev);
> +	data = &controller->data->reset_data[id];
> +	mask = data->assert_mask | data->deassert_mask;
> +	val = assert ? data->assert_mask : data->deassert_mask;
> +
> +	return regmap_update_bits(controller->regmap, data->offset, mask, val);
> +}
> +
> +static int spacemit_reset_assert(struct reset_controller_dev *rcdev,
> +				 unsigned long id)
> +{
> +	return spacemit_reset_update(rcdev, id, true);
> +}
> +
> +static int spacemit_reset_deassert(struct reset_controller_dev *rcdev,
> +				   unsigned long id)
> +{
> +	return spacemit_reset_update(rcdev, id, false);
> +}
> +
> +static const struct reset_control_ops spacemit_reset_control_ops = {
> +	.assert		= spacemit_reset_assert,
> +	.deassert	= spacemit_reset_deassert,
> +};
> +
> +static int spacemit_reset_controller_register(struct device *dev,
> +					      struct ccu_reset_controller *controller)
> +{
> +	struct reset_controller_dev *rcdev = &controller->rcdev;
> +
> +	rcdev->ops = &spacemit_reset_control_ops;
> +	rcdev->owner = dev->driver->owner;
> +	rcdev->of_node = dev->of_node;
> +	rcdev->nr_resets = controller->data->count;
> +
> +	return devm_reset_controller_register(dev, &controller->rcdev);
> +}
> +
> +int spacemit_reset_probe(struct auxiliary_device *adev,
> +			 const struct auxiliary_device_id *id)
> +{
> +	struct spacemit_ccu_adev *rdev = to_spacemit_ccu_adev(adev);
> +	struct ccu_reset_controller *controller;
> +	struct device *dev = &adev->dev;
> +
> +	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
> +	if (!controller)
> +		return -ENOMEM;
> +	controller->data = (const struct ccu_reset_controller_data *)id->driver_data;
> +	controller->regmap = rdev->regmap;
> +
> +	return spacemit_reset_controller_register(dev, controller);
> +}
> +EXPORT_SYMBOL_NS_GPL(spacemit_reset_probe, "RESET_SPACEMIT");
> +
> +MODULE_DESCRIPTION("SpacemiT reset controller driver - common code");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/reset/spacemit/reset-spacemit-common.h b/drivers/reset/spacemit/reset-spacemit-common.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..ffaf2f86eb39df72b079095b3f5da3622e132c8d
> --- /dev/null
> +++ b/drivers/reset/spacemit/reset-spacemit-common.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * SpacemiT reset controller driver - common definitions
> + */
> +
> +#ifndef _RESET_SPACEMIT_COMMON_H_
> +#define _RESET_SPACEMIT_COMMON_H_
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>
> +#include <linux/types.h>
> +
> +struct ccu_reset_data {
> +	u32 offset;
> +	u32 assert_mask;
> +	u32 deassert_mask;
> +};
> +
> +struct ccu_reset_controller_data {
> +	const struct ccu_reset_data *reset_data;	/* array */
> +	size_t count;
> +};
> +
> +struct ccu_reset_controller {
> +	struct reset_controller_dev rcdev;
> +	const struct ccu_reset_controller_data *data;
> +	struct regmap *regmap;
> +};
> +
> +#define RESET_DATA(_offset, _assert_mask, _deassert_mask)	\
> +	{							\
> +		.offset		= (_offset),			\
> +		.assert_mask	= (_assert_mask),		\
> +		.deassert_mask	= (_deassert_mask),		\
> +	}
> +
> +/* Common probe function */
> +int spacemit_reset_probe(struct auxiliary_device *adev,
> +			 const struct auxiliary_device_id *id);
> +
> +#endif /* _RESET_SPACEMIT_COMMON_H_ */
> diff --git a/drivers/reset/spacemit/reset-spacemit-k1.c b/drivers/reset/spacemit/reset-spacemit-k1.c
> index cc7fd1f8750d422f3d8f96367ae259f38418c44b..8f3b5329ea5f627ab454e15bf485b155c9f48ca5 100644
> --- a/drivers/reset/spacemit/reset-spacemit-k1.c
> +++ b/drivers/reset/spacemit/reset-spacemit-k1.c
> @@ -1,41 +1,13 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   
> -/* SpacemiT reset controller driver */
> +/* SpacemiT K1 reset controller driver */
>   
> -#include <linux/auxiliary_bus.h>
> -#include <linux/container_of.h>
> -#include <linux/device.h>
>   #include <linux/module.h>
> -#include <linux/regmap.h>
> -#include <linux/reset-controller.h>
> -#include <linux/types.h>
>   
> -#include <soc/spacemit/k1-syscon.h>
>   #include <dt-bindings/clock/spacemit,k1-syscon.h>
> +#include <soc/spacemit/k1-syscon.h>
>   
> -struct ccu_reset_data {
> -	u32 offset;
> -	u32 assert_mask;
> -	u32 deassert_mask;
> -};
> -
> -struct ccu_reset_controller_data {
> -	const struct ccu_reset_data *reset_data;	/* array */
> -	size_t count;
> -};
> -
> -struct ccu_reset_controller {
> -	struct reset_controller_dev rcdev;
> -	const struct ccu_reset_controller_data *data;
> -	struct regmap *regmap;
> -};
> -
> -#define RESET_DATA(_offset, _assert_mask, _deassert_mask)	\
> -	{							\
> -		.offset		= (_offset),			\
> -		.assert_mask	= (_assert_mask),		\
> -		.deassert_mask	= (_deassert_mask),		\
> -	}
> +#include "reset-spacemit-common.h"
>   
>   static const struct ccu_reset_data k1_mpmu_resets[] = {
>   	[RESET_WDT]	= RESET_DATA(MPMU_WDTPCR,		BIT(2), 0),
> @@ -214,91 +186,30 @@ static const struct ccu_reset_controller_data k1_apbc2_reset_data = {
>   	.count		= ARRAY_SIZE(k1_apbc2_resets),
>   };
>   
> -static int spacemit_reset_update(struct reset_controller_dev *rcdev,
> -				 unsigned long id, bool assert)
> -{
> -	struct ccu_reset_controller *controller;
> -	const struct ccu_reset_data *data;
> -	u32 mask;
> -	u32 val;
> -
> -	controller = container_of(rcdev, struct ccu_reset_controller, rcdev);
> -	data = &controller->data->reset_data[id];
> -	mask = data->assert_mask | data->deassert_mask;
> -	val = assert ? data->assert_mask : data->deassert_mask;
> -
> -	return regmap_update_bits(controller->regmap, data->offset, mask, val);
> -}
> -
> -static int spacemit_reset_assert(struct reset_controller_dev *rcdev,
> -				 unsigned long id)
> -{
> -	return spacemit_reset_update(rcdev, id, true);
> -}
> -
> -static int spacemit_reset_deassert(struct reset_controller_dev *rcdev,
> -				   unsigned long id)
> -{
> -	return spacemit_reset_update(rcdev, id, false);
> -}
> -
> -static const struct reset_control_ops spacemit_reset_control_ops = {
> -	.assert		= spacemit_reset_assert,
> -	.deassert	= spacemit_reset_deassert,
> -};
> -
> -static int spacemit_reset_controller_register(struct device *dev,
> -					      struct ccu_reset_controller *controller)
> -{
> -	struct reset_controller_dev *rcdev = &controller->rcdev;
> -
> -	rcdev->ops = &spacemit_reset_control_ops;
> -	rcdev->owner = THIS_MODULE;
> -	rcdev->of_node = dev->of_node;
> -	rcdev->nr_resets = controller->data->count;
> -
> -	return devm_reset_controller_register(dev, &controller->rcdev);
> -}
> -
> -static int spacemit_reset_probe(struct auxiliary_device *adev,
> -				const struct auxiliary_device_id *id)
> -{
> -	struct spacemit_ccu_adev *rdev = to_spacemit_ccu_adev(adev);
> -	struct ccu_reset_controller *controller;
> -	struct device *dev = &adev->dev;
> -
> -	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
> -	if (!controller)
> -		return -ENOMEM;
> -	controller->data = (const struct ccu_reset_controller_data *)id->driver_data;
> -	controller->regmap = rdev->regmap;
> -
> -	return spacemit_reset_controller_register(dev, controller);
> -}
> -
>   #define K1_AUX_DEV_ID(_unit) \
>   	{ \
>   		.name = "spacemit_ccu.k1-" #_unit "-reset", \
>   		.driver_data = (kernel_ulong_t)&k1_ ## _unit ## _reset_data, \
>   	}
>   
> -static const struct auxiliary_device_id spacemit_reset_ids[] = {
> +static const struct auxiliary_device_id spacemit_k1_reset_ids[] = {
>   	K1_AUX_DEV_ID(mpmu),
>   	K1_AUX_DEV_ID(apbc),
>   	K1_AUX_DEV_ID(apmu),
>   	K1_AUX_DEV_ID(rcpu),
>   	K1_AUX_DEV_ID(rcpu2),
>   	K1_AUX_DEV_ID(apbc2),
> -	{ },
> +	{ /* sentinel */ }
>   };
> -MODULE_DEVICE_TABLE(auxiliary, spacemit_reset_ids);
> +MODULE_DEVICE_TABLE(auxiliary, spacemit_k1_reset_ids);
>   
>   static struct auxiliary_driver spacemit_k1_reset_driver = {
>   	.probe          = spacemit_reset_probe,
> -	.id_table       = spacemit_reset_ids,
> +	.id_table       = spacemit_k1_reset_ids,
>   };
>   module_auxiliary_driver(spacemit_k1_reset_driver);
>   
> +MODULE_IMPORT_NS("RESET_SPACEMIT");
>   MODULE_AUTHOR("Alex Elder <elder@kernel.org>");
> -MODULE_DESCRIPTION("SpacemiT reset controller driver");
> +MODULE_DESCRIPTION("SpacemiT K1 reset controller driver");
>   MODULE_LICENSE("GPL");
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
