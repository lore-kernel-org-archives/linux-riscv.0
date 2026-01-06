Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7B9CE9D41
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 14:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ygNGgwUpY/k2oURtcI+Y8TLGIXFpSgT+TUZboVJnh/k=; b=a5w3ylB1w6HiKP
	KiMDwiaiqv8dWA7OdOIwRX6rc3AT0hGxB0O7c+0eHuMlT21RHW4q34C1qeFm0XdsoGWSDlru4+DqM
	cXSCSLtnr7A5iVgqetAlUy7TEq6FNoWQHwvr3ZLt3LGOrUmHxydhhnW5+V1kLWqoKKv2LAEAzyOek
	VPYi/kma4Va88mLh5dFsS7HQa6kLCyUDkCgRzwJgp7a23eEPY6cNPM27HvuFpEZheve56jJiZPn5Y
	gymOBD+22tval3rvvO2r6tF7BpfWh4DhOASPejcvgSB9Mk39lNsx1o1vXTqvLuz2paZ0QFeGX8kZV
	huyVWnsHVTp3vaVPFirQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8Hw-0000000DJJM-0f0A;
	Tue, 06 Jan 2026 14:44:00 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8Ht-0000000DJHZ-23G6
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 14:43:58 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-8b144ec3aa8so99826785a.2
        for <linux-riscv@lists.infradead.org>; Tue, 06 Jan 2026 06:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767710636; x=1768315436; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rog/A303nBNnKd9hedF+AVkollAQIitKAnxFL0w4GYY=;
        b=zvQBkqEJxo7pdA/tGpcmR/mYCqE9bwhjMxbZZonJDiQEl+lxKkmfZW1a+qq+fpadyY
         ynlHaPUB/V3MM+FSvix315hvncxF+FVSrBTi6vWfyWFp8Juw46QHVWLMcsfNjz7TjHkx
         dF4s6p8D2lrBsp1PB2QCO6u1Zgo03j0gUM7Qpc8pWmBXedD8zWpNspMHD+XeLCt98oSh
         nO19BR6Lw3hC/YLUIjfoK6sCWmKhiC3R72sBSy2qgM1MBPS1K4f52SHEgWMuspnycTsP
         TzNbNakbadNKKRmQ/HUxobnFuUPfMj6S+NcZRBPGI/lSsrb6HK8nSastxzzoRSs9ivFd
         YFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767710636; x=1768315436;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rog/A303nBNnKd9hedF+AVkollAQIitKAnxFL0w4GYY=;
        b=TVcwT+3UEThSzZcVFEJ6JpDV9Y40uVD75yeWCmCVij74hWiBZ77xuYZti1u7rlsQft
         Yy35bR5J5+CLLw2RHq2JDvzl/LSIjTaLfpg1d+rapE07N/xkKJTHYrem4OEOeQ1GcRRb
         8Xzq0qmPJxso4kWcbgK88sJEQscQmE5MLaCYzzzsiWsmMFNlD5FBL2KxzEzdmsiEJT8T
         +O+d33bttoe71FElxhcKgEkCJcqdSCCUNOuBZibnBT17jVz0l2j6BY5rBqLCIAS9QLWE
         /qAeik5KYgps4ZdWX+924au5JLDVNEA6UbI/yHchjujEIHFcxLdXfCrXgN+QNrYfpEPy
         eXxA==
X-Forwarded-Encrypted: i=1; AJvYcCWaXguCmeqtIelckmFAMbA7JRJMl2kLYZbrLMXABtsQQ9+NYG4f70BO6r91WlqVS+kMRlU9vwL6UnspmA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpewtixaz4b9IvJCTUx+OYBbfc2Izl+ePZ91jX2QmIp0AoMyeb
	TlKXjgefRf2Y/KYrAm+cbJmFU9zneGtWPTGv99bgb5MdeoRFWf7m8JuJPlglkaDgo7I=
X-Gm-Gg: AY/fxX7WfNtM3VwX6RUIp2drB7bCqTC0DQuKm1+fkMxndGG9BokmcZ3KoLmQ5UO30LD
	MDVxWm1T4hd3Vb8M4t45/SZLoeiJZZQoiixasSQyxFHxF9l9ACUORlSoYTZCIpnLkzw6a4cP4Ou
	ujDpnAYKAYiCDfGVO1DMk1zIchNBqmT3/7kFBV5hdDMKodgPhYFJJrup5EUpE9RvPG1k+YmocRS
	LOgG7FIBuGWNBOR7TMdRod8+3AM2t9Mfi2QbHlbou8+sNpv0ldSqAINHE6mrvAYaa0JjhYqeINt
	lRMWwHQtnoEQLTniZ7LOw+qRHlLPY2f3bqep7eQVIU/dVfuy/5psTYOLx+KpzZmoe8gM9uaCi6x
	LQtYJj++st1rc+bi9irjmJaaX8MLp4Cxdbfw8i6tm/rdOysVi9NfKmGcpsKcr5fxPOXFZUo/6h3
	nWxwo9H8dfk4EDphOl+Nkc65SiVR9PhFvooMNkX5ssYfJC1D5Wsvk=
X-Google-Smtp-Source: AGHT+IFYqi2toZCdCuQZsUh/EKjp61Zc98MPld9QD98KQo6pAb1fbhQWOQ4ktANOtoLEtXCIeuBplA==
X-Received: by 2002:a05:620a:25ce:b0:8bb:a675:b540 with SMTP id af79cd13be357-8c37ebca405mr392613485a.69.1767710636222;
        Tue, 06 Jan 2026 06:43:56 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51b732sm173883085a.25.2026.01.06.06.43.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 06:43:55 -0800 (PST)
Message-ID: <a198d2d2-0c82-4c9d-abca-d17221ef1453@riscstar.com>
Date: Tue, 6 Jan 2026 08:43:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] clk: spacemit: extract common ccu functions
To: Yixun Lan <dlan@gentoo.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Guodong Xu <guodong@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Yao Zi <me@ziyao.cc>
References: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
 <20260103-06-k1-clk-common-v3-2-6061d9f69eef@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260103-06-k1-clk-common-v3-2-6061d9f69eef@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_064357_578336_277C3BCF 
X-CRM114-Status: GOOD (  33.03  )
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

On 1/3/26 1:26 AM, Yixun Lan wrote:
> Refactor the probe function of SpacemiT's clock, and extract a common ccu
> file, so new clock driver added in the future can share the same code,
> which would lower the burden of maintenance. Since this commit changes the
> module name where the auxiliary device registered, the auxiliary device id
> need to be adjusted. Idea of the patch comes from the review of K3 clock
> driver, please refer to this disucssion[1] for more detail.

Are all of the hunks of moved code moved without change (I
think so)?  If so I think it's worth mentioning that.  If
not, you should explain whatever differs, and why.  (I would
expect the only thing that would have to change is making
spacemit_ccu_probe() public.)

I made one minor comment below.  I didn't verify, but I
assume this is all just moving the code around, and based
on that:

Reviewed-by: Alex Elder <elder@riscstar.com>

> Link: https://lore.kernel.org/all/aTo8sCPpVM1o9PKX@pie/ [1]
> Suggested-by: Yao Zi <me@ziyao.cc>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>   drivers/clk/spacemit/ccu-k1.c     | 179 ++------------------------------------
>   drivers/clk/spacemit/ccu_common.c | 171 ++++++++++++++++++++++++++++++++++++
>   drivers/clk/spacemit/ccu_common.h |  10 +++
>   3 files changed, 186 insertions(+), 174 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index 01d9485b615d..02c792a73759 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -5,15 +5,10 @@
>    */
>   
>   #include <linux/array_size.h>
> -#include <linux/auxiliary_bus.h>
>   #include <linux/clk-provider.h>
> -#include <linux/delay.h>
> -#include <linux/idr.h>
> -#include <linux/mfd/syscon.h>
>   #include <linux/minmax.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
> -#include <linux/slab.h>
>   #include <soc/spacemit/k1-syscon.h>
>   
>   #include "ccu_common.h"
> @@ -23,14 +18,6 @@
>   
>   #include <dt-bindings/clock/spacemit,k1-syscon.h>
>   
> -struct spacemit_ccu_data {
> -	const char *reset_name;
> -	struct clk_hw **hws;
> -	size_t num;
> -};
> -
> -static DEFINE_IDA(auxiliary_ids);
> -
>   /* APBS clocks start, APBS region contains and only contains all PLL clocks */
>   
>   /*
> @@ -1001,167 +988,6 @@ static const struct spacemit_ccu_data k1_ccu_apbc2_data = {
>   	.reset_name	= "apbc2-reset",
>   };
>   
> -static int spacemit_ccu_register(struct device *dev,
> -				 struct regmap *regmap,
> -				 struct regmap *lock_regmap,
> -				 const struct spacemit_ccu_data *data)
> -{
> -	struct clk_hw_onecell_data *clk_data;
> -	int i, ret;
> -
> -	/* Nothing to do if the CCU does not implement any clocks */
> -	if (!data->hws)
> -		return 0;
> -
> -	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
> -				GFP_KERNEL);
> -	if (!clk_data)
> -		return -ENOMEM;
> -
> -	clk_data->num = data->num;
> -
> -	for (i = 0; i < data->num; i++) {
> -		struct clk_hw *hw = data->hws[i];
> -		struct ccu_common *common;
> -		const char *name;
> -
> -		if (!hw) {
> -			clk_data->hws[i] = ERR_PTR(-ENOENT);
> -			continue;
> -		}
> -
> -		name = hw->init->name;
> -
> -		common = hw_to_ccu_common(hw);
> -		common->regmap		= regmap;
> -		common->lock_regmap	= lock_regmap;
> -
> -		ret = devm_clk_hw_register(dev, hw);
> -		if (ret) {
> -			dev_err(dev, "Cannot register clock %d - %s\n",
> -				i, name);
> -			return ret;
> -		}
> -
> -		clk_data->hws[i] = hw;
> -	}
> -
> -	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
> -	if (ret)
> -		dev_err(dev, "failed to add clock hardware provider (%d)\n", ret);
> -
> -	return ret;
> -}
> -
> -static void spacemit_cadev_release(struct device *dev)
> -{
> -	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> -
> -	ida_free(&auxiliary_ids, adev->id);
> -	kfree(to_spacemit_ccu_adev(adev));
> -}
> -
> -static void spacemit_adev_unregister(void *data)
> -{
> -	struct auxiliary_device *adev = data;
> -
> -	auxiliary_device_delete(adev);
> -	auxiliary_device_uninit(adev);
> -}
> -
> -static int spacemit_ccu_reset_register(struct device *dev,
> -				       struct regmap *regmap,
> -				       const char *reset_name)
> -{
> -	struct spacemit_ccu_adev *cadev;
> -	struct auxiliary_device *adev;
> -	int ret;
> -
> -	/* Nothing to do if the CCU does not implement a reset controller */
> -	if (!reset_name)
> -		return 0;
> -
> -	cadev = kzalloc(sizeof(*cadev), GFP_KERNEL);
> -	if (!cadev)
> -		return -ENOMEM;
> -
> -	cadev->regmap = regmap;
> -
> -	adev = &cadev->adev;
> -	adev->name = reset_name;
> -	adev->dev.parent = dev;
> -	adev->dev.release = spacemit_cadev_release;
> -	adev->dev.of_node = dev->of_node;
> -	ret = ida_alloc(&auxiliary_ids, GFP_KERNEL);
> -	if (ret < 0)
> -		goto err_free_cadev;
> -	adev->id = ret;
> -
> -	ret = auxiliary_device_init(adev);
> -	if (ret)
> -		goto err_free_aux_id;
> -
> -	ret = auxiliary_device_add(adev);
> -	if (ret) {
> -		auxiliary_device_uninit(adev);
> -		return ret;
> -	}
> -
> -	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
> -
> -err_free_aux_id:
> -	ida_free(&auxiliary_ids, adev->id);
> -err_free_cadev:
> -	kfree(cadev);
> -
> -	return ret;
> -}
> -
> -static int k1_ccu_probe(struct platform_device *pdev)
> -{
> -	struct regmap *base_regmap, *lock_regmap = NULL;
> -	const struct spacemit_ccu_data *data;
> -	struct device *dev = &pdev->dev;
> -	int ret;
> -
> -	base_regmap = device_node_to_regmap(dev->of_node);
> -	if (IS_ERR(base_regmap))
> -		return dev_err_probe(dev, PTR_ERR(base_regmap),
> -				     "failed to get regmap\n");
> -
> -	/*
> -	 * The lock status of PLLs locate in MPMU region, while PLLs themselves
> -	 * are in APBS region. Reference to MPMU syscon is required to check PLL
> -	 * status.
> -	 */
> -	if (of_device_is_compatible(dev->of_node, "spacemit,k1-pll")) {
> -		struct device_node *mpmu = of_parse_phandle(dev->of_node,
> -							    "spacemit,mpmu", 0);
> -		if (!mpmu)
> -			return dev_err_probe(dev, -ENODEV,
> -					     "Cannot parse MPMU region\n");
> -
> -		lock_regmap = device_node_to_regmap(mpmu);
> -		of_node_put(mpmu);
> -
> -		if (IS_ERR(lock_regmap))
> -			return dev_err_probe(dev, PTR_ERR(lock_regmap),
> -					     "failed to get lock regmap\n");
> -	}
> -
> -	data = of_device_get_match_data(dev);
> -
> -	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap, data);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "failed to register clocks\n");
> -
> -	ret = spacemit_ccu_reset_register(dev, base_regmap, data->reset_name);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "failed to register resets\n");
> -
> -	return 0;
> -}
> -
>   static const struct of_device_id of_k1_ccu_match[] = {
>   	{
>   		.compatible	= "spacemit,k1-pll",
> @@ -1195,6 +1021,11 @@ static const struct of_device_id of_k1_ccu_match[] = {
>   };
>   MODULE_DEVICE_TABLE(of, of_k1_ccu_match);
>   
> +static int k1_ccu_probe(struct platform_device *pdev)
> +{
> +	return spacemit_ccu_probe(pdev, "spacemit,k1-pll");
> +}
> +
>   static struct platform_driver k1_ccu_driver = {
>   	.driver = {
>   		.name		= "spacemit,k1-ccu",
> diff --git a/drivers/clk/spacemit/ccu_common.c b/drivers/clk/spacemit/ccu_common.c
> index 4412c4104dab..5f05b17f8452 100644
> --- a/drivers/clk/spacemit/ccu_common.c
> +++ b/drivers/clk/spacemit/ccu_common.c
> @@ -1,6 +1,177 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   
> +#include <linux/clk-provider.h>
> +#include <linux/device/devres.h>
> +#include <linux/mfd/syscon.h>
>   #include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/slab.h>
> +#include <soc/spacemit/ccu.h>
> +
> +#include "ccu_common.h"
> +
> +static DEFINE_IDA(auxiliary_ids);

I'd insert a space here to make the definition above stand out a
bit more.

> +static int spacemit_ccu_register(struct device *dev,
> +				 struct regmap *regmap,
> +				 struct regmap *lock_regmap,
> +				 const struct spacemit_ccu_data *data)
> +{
> +	struct clk_hw_onecell_data *clk_data;
> +	int i, ret;
> +
> +	/* Nothing to do if the CCU does not implement any clocks */
> +	if (!data->hws)
> +		return 0;
> +
> +	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
> +				GFP_KERNEL);
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	clk_data->num = data->num;
> +
> +	for (i = 0; i < data->num; i++) {
> +		struct clk_hw *hw = data->hws[i];
> +		struct ccu_common *common;
> +		const char *name;
> +
> +		if (!hw) {
> +			clk_data->hws[i] = ERR_PTR(-ENOENT);
> +			continue;
> +		}
> +
> +		name = hw->init->name;
> +
> +		common = hw_to_ccu_common(hw);
> +		common->regmap		= regmap;
> +		common->lock_regmap	= lock_regmap;
> +
> +		ret = devm_clk_hw_register(dev, hw);
> +		if (ret) {
> +			dev_err(dev, "Cannot register clock %d - %s\n",
> +				i, name);
> +			return ret;
> +		}
> +
> +		clk_data->hws[i] = hw;
> +	}
> +
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
> +	if (ret)
> +		dev_err(dev, "failed to add clock hardware provider (%d)\n", ret);
> +
> +	return ret;
> +}
> +
> +static void spacemit_cadev_release(struct device *dev)
> +{
> +	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +
> +	ida_free(&auxiliary_ids, adev->id);
> +	kfree(to_spacemit_ccu_adev(adev));
> +}
> +
> +static void spacemit_adev_unregister(void *data)
> +{
> +	struct auxiliary_device *adev = data;
> +
> +	auxiliary_device_delete(adev);
> +	auxiliary_device_uninit(adev);
> +}
> +
> +static int spacemit_ccu_reset_register(struct device *dev,
> +				       struct regmap *regmap,
> +				       const char *reset_name)
> +{
> +	struct spacemit_ccu_adev *cadev;
> +	struct auxiliary_device *adev;
> +	int ret;
> +
> +	/* Nothing to do if the CCU does not implement a reset controller */
> +	if (!reset_name)
> +		return 0;
> +
> +	cadev = kzalloc(sizeof(*cadev), GFP_KERNEL);
> +	if (!cadev)
> +		return -ENOMEM;
> +
> +	cadev->regmap = regmap;
> +
> +	adev = &cadev->adev;
> +	adev->name = reset_name;
> +	adev->dev.parent = dev;
> +	adev->dev.release = spacemit_cadev_release;
> +	adev->dev.of_node = dev->of_node;
> +	ret = ida_alloc(&auxiliary_ids, GFP_KERNEL);
> +	if (ret < 0)
> +		goto err_free_cadev;
> +	adev->id = ret;
> +
> +	ret = auxiliary_device_init(adev);
> +	if (ret)
> +		goto err_free_aux_id;
> +
> +	ret = auxiliary_device_add(adev);
> +	if (ret) {
> +		auxiliary_device_uninit(adev);
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
> +
> +err_free_aux_id:
> +	ida_free(&auxiliary_ids, adev->id);
> +err_free_cadev:
> +	kfree(cadev);
> +
> +	return ret;
> +}
> +
> +int spacemit_ccu_probe(struct platform_device *pdev, const char *compat)
> +{
> +	struct regmap *base_regmap, *lock_regmap = NULL;
> +	const struct spacemit_ccu_data *data;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	base_regmap = device_node_to_regmap(dev->of_node);
> +	if (IS_ERR(base_regmap))
> +		return dev_err_probe(dev, PTR_ERR(base_regmap),
> +				     "failed to get regmap\n");
> +
> +	/*
> +	 * The lock status of PLLs locate in MPMU region, while PLLs themselves
> +	 * are in APBS region. Reference to MPMU syscon is required to check PLL
> +	 * status.
> +	 */
> +	if (compat && of_device_is_compatible(dev->of_node, compat)) {
> +		struct device_node *mpmu = of_parse_phandle(dev->of_node,
> +							    "spacemit,mpmu", 0);
> +		if (!mpmu)
> +			return dev_err_probe(dev, -ENODEV,
> +					     "Cannot parse MPMU region\n");
> +
> +		lock_regmap = device_node_to_regmap(mpmu);
> +		of_node_put(mpmu);
> +
> +		if (IS_ERR(lock_regmap))
> +			return dev_err_probe(dev, PTR_ERR(lock_regmap),
> +					     "failed to get lock regmap\n");
> +	}
> +
> +	data = of_device_get_match_data(dev);
> +
> +	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap, data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register clocks\n");
> +
> +	ret = spacemit_ccu_reset_register(dev, base_regmap, data->reset_name);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register resets\n");
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(spacemit_ccu_probe, "CLK_SPACEMIT");
>   
>   MODULE_DESCRIPTION("SpacemiT CCU common clock driver");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/spacemit/ccu_common.h b/drivers/clk/spacemit/ccu_common.h
> index da72f3836e0b..7ae244b5eace 100644
> --- a/drivers/clk/spacemit/ccu_common.h
> +++ b/drivers/clk/spacemit/ccu_common.h
> @@ -7,6 +7,8 @@
>   #ifndef _CCU_COMMON_H_
>   #define _CCU_COMMON_H_
>   
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
>   #include <linux/regmap.h>
>   
>   struct ccu_common {
> @@ -36,6 +38,12 @@ static inline struct ccu_common *hw_to_ccu_common(struct clk_hw *hw)
>   	return container_of(hw, struct ccu_common, hw);
>   }
>   
> +struct spacemit_ccu_data {
> +	const char *reset_name;
> +	struct clk_hw **hws;
> +	size_t num;
> +};
> +
>   #define ccu_read(c, reg)						\
>   	({								\
>   		u32 tmp;						\
> @@ -45,4 +53,6 @@ static inline struct ccu_common *hw_to_ccu_common(struct clk_hw *hw)
>   #define ccu_update(c, reg, mask, val) \
>   	regmap_update_bits((c)->regmap, (c)->reg_##reg, mask, val)
>   
> +int spacemit_ccu_probe(struct platform_device *pdev, const char *compat);
> +
>   #endif /* _CCU_COMMON_H_ */
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
