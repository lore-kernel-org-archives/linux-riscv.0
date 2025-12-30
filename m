Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACF2E94107
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 00:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s08qfIZ5O8mqoEkLwLQ2YPl9PM9sd49tUrMgHMNo+F0=; b=T4LThqKWXKsvzq
	AwmF7OxLjH230q5OMGoZOtt7Yeel0Wcc/p1IWKsZtjP0G3/h3zfYxoP0guoSE8Xyda8orpsBcXE+y
	ouMY1pdgQtD9JlrKPd0QnGIz8cbDyyqW2wDqg24acGVSRosakwbY/9jzeJ4eZRrtkQLl1wJ9xYIEr
	lMQJryER9gKMXO6OS7DnVG8yX/TDcmindWylPwh+lgU/wNU0XLz/e01V5QnpEbCJPfZ5L2jYwQdpV
	vRjobFVKi0nBBicv81kkbaGc9pfrMdmTOtmhbOSd+zR9tqOimB2JOD+t9IwSdM3MQRsDc4rsLCkOw
	H7BEBdBFt15p2HOMAqIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaNwJ-00000004C2d-2IDr;
	Tue, 30 Dec 2025 00:50:21 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaNwG-00000004C26-3jl7
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 00:50:18 +0000
Received: by mail-qv1-xf43.google.com with SMTP id 6a1803df08f44-88a32bf0248so73962126d6.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Dec 2025 16:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767055815; x=1767660615; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mcQfeRSOzGUpy1su1reSd6KnOIVV8UyhdobMHCI9C80=;
        b=guPb9opaGZFnDfGpObEsgiuoywyLqyO0lngS2ok7PTBoqXz4bYfuwt9tSHRpfpj8n2
         tHFJFmeKR9dxonKkKOb+in1MbwAaJoFRT7b1AYtKN68Q0TwZMqgzD7c1NdBjW076wrJ4
         5bQqhij9u0Cgg/e82c0Sn5JFLsgXVeO07Fk2sK2zCvbR8RvhSoK3+yRs96VhWHyD3MOs
         cWr4I7/j3ICeoDO7s8KgUKOzSepS67eU7tUvDTH21zROdEVWZ0cM2V3Y6PFrugRCkpoU
         r+r4J0rlwR13Uq8fk++ue5RfSp7N2iwE/Gnw0KR270y7GOMvKZUgdQ7JM65mfdryBDS1
         ZWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767055815; x=1767660615;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mcQfeRSOzGUpy1su1reSd6KnOIVV8UyhdobMHCI9C80=;
        b=i6BJWsaeuSGqif+pzgYt/bPoDQfuNDuf+BJZDk379rxmUb2fg0UVcB8z3dr594AcA+
         KNCH5DfCRx4MLbgbcEXbbJf0yVWCo9YrQwh1+1nVh6hW/QcQy5VDOLpJ4hi2loGgR6ww
         y456qTFSlLlxI4lHv3kbm3kNShIy5rk6PchWvOZgwMBJ6Uuh7nf9O7kfft+1TZ1NLZi7
         GYgchw6DhwIQj8+x2kar4BXjgnm8yC6KpYm30v28ucb2TgyGCFm2l0uB8GeSz/ecb4eN
         fPjp6vg1w+Y8f1W0r4BKpwTOjhiVlNJGK1tnvExtsN+FoQkqRJK3PUIRlYd8Xl7jEMpf
         lYnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3Sf2WCAv3SWUXU26YTFv2Q/h2s2SzXkZgCkMqRk/8HCmSsyOvFOcRsn/AwcwB/3B7YymTcVXBFIqqpA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMOW7lHKpe63LLVrIV7CmhG7qk5jhiRNIK0c6Mr8QvdYelkTFq
	ecNgu+Q/hiY+vZMO/YguMy6juYvKeLe1jhtxFmYWRxYwF5sl2wFOqDEhPY6PHQBHzCU=
X-Gm-Gg: AY/fxX49+6bbtcnPbAwL30iI+6EBnCTO+1/6JZls9KoifMKBI3S61yucwQ7fJZbThaT
	AQQ1A/0fIflSrIwJ758VXLe10V3qS9QWzRBnmphT2CnS4BdeAsphEQdv2KlCcWHPOD1pYFVmAlI
	WiKNf/cPophp02E0Rh/TwRLv2l3XyI5CHsc3TfUKpVRT+xVCCCxJdRgvwCzEAeYOcZ5pxknksKC
	zUm3NZiEqjQBsZsGZwqocsuzuyRjkInDsFzxkcemNyNdAlyRZmKSV5NLF5rBkv79Zg/zctpKvjG
	9cjn1dKF3Pe/5m4QJa3ACQHpgPKnfGwvKc19h250PxXPPrKrlOv9JfhUu2z4T6X0kOwiT6KCUw6
	8b4PeAmAVWtR+fVHXQTPgWXWLQcMqRMYRa4EQG+LdzD5qVop7n1NIiH2fjXnz1ec/wM0JBemPxM
	MNLOZajrI7HPUqjnenXlrnSarwfTgObk9NTy6dJFCrfQsF5vKtDQE=
X-Google-Smtp-Source: AGHT+IF2ABeBWgRWRwwsbjzT/6REvtqaV8aFrPPVBUy5ytQBFWhVoVrPlEMOJ2p37Czl1zIpI40giA==
X-Received: by 2002:a05:6214:4285:b0:882:44cc:f58e with SMTP id 6a1803df08f44-88d8166590dmr599666146d6.2.1767055815490;
        Mon, 29 Dec 2025 16:50:15 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c096891558sm2482817485a.15.2025.12.29.16.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 16:50:15 -0800 (PST)
Message-ID: <3ea5b28b-a0ed-49fb-a8a8-6f575a24820d@riscstar.com>
Date: Mon, 29 Dec 2025 18:50:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v2 2/3] clk: spacemit: extract common ccu functions
To: Yixun Lan <dlan@gentoo.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Guodong Xu <guodong@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Yao Zi <me@ziyao.cc>
References: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
 <20251226-06-k1-clk-common-v2-2-28b59418b4df@gentoo.org>
Content-Language: en-US
In-Reply-To: <20251226-06-k1-clk-common-v2-2-28b59418b4df@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_165017_012368_277C12B0 
X-CRM114-Status: GOOD (  40.01  )
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

On 12/26/25 12:55 AM, Yixun Lan wrote:
> Refactor the probe function of SpacemiT's clock, and extract a common ccu
> file, so new clock driver added in the future can share the same code,
> which would lower the burden of maintenance. Since this commit changes the
> module name where the auxiliary device registered, the auxiliary device id
> need to be adjusted. Idea of the patch is come from review of K3 clock
> driver, please refer this disucssion [1].

I understand the point here, and it's just like the first patch:
you're extracting generic code out of the K1-specific file so a
new K3-specific source file can use it too.  This is really good.

However the end result should incorporate *only* generic code
in the generic file, and have the SoC-specific source files
contain everything else.

But as you have it now, the (new) generic probe function
contains special handling for "spacemit,k1-pll", and that's
not generic.

So I suggest you still implement k1_ccu_probe() (and k3_ccu_probe())
separately, allowing each of them to do platform-specific things
before (and/or after) calling the generic probe function.

I had this comment at the end but I'll put it here instead:
You could move the spacemit_ccu_data structure into the common
header file in a separate patch (possibly the one where you
introduced that file in the first place).


OK now I'll talk a bit about why I think you don't need to change
the names of the resets auxiliary devices.  (And even if you do,
I don't think you need the macro.)

Each CCU is defined by its "data" in of_k1_ccu_match[].  The
compatible strings that match those CCUs will be specified in
the DTS files.  For a given platform (K1 or K3), only those
CCUs that make sense for that platform will be defined (i.e.
"spacemit,k1-syscon-mpmu" defines k1_ccu_mpmu_data, which is
appropriate for a K1 platform, not K3).

So even if two resets have the same name, it shouldn't
matter if they're defined for use by separate platforms.
(I think the name is mainly used in defining the auxiliary
device name.)

I might be mistaken, and I don't think adding an SoC identifier
to the reset name hurts anything.  If you do it, it should be
done inside the platform-specific file.

And... I don't know why you don't just add "k1-" or "k3-" to
the name assigned rather than using the macro.  You're only
using it within a platform-specific structure.

static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
	.reset_name	= "k1-mpmu-reset",

rather than
	.reset_name	= _K_RST(mpmu),

					-Alex

> Link: https://lore.kernel.org/all/aTo8sCPpVM1o9PKX@pie/ [1]
> Suggested-by: Yao Zi <me@ziyao.cc>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>   drivers/clk/spacemit/ccu-k1.c     | 188 ++------------------------------------
>   drivers/clk/spacemit/ccu_common.c | 171 ++++++++++++++++++++++++++++++++++
>   drivers/clk/spacemit/ccu_common.h |  10 ++
>   3 files changed, 188 insertions(+), 181 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index 01d9485b615d..f97d6f0f0c39 100644
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
> @@ -802,7 +789,7 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
> -	.reset_name	= "mpmu-reset",
> +	.reset_name	= _K_RST(mpmu),
>   	.hws		= k1_ccu_mpmu_hws,
>   	.num		= ARRAY_SIZE(k1_ccu_mpmu_hws),
>   };
> @@ -913,7 +900,7 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_apbc_data = {
> -	.reset_name	= "apbc-reset",
> +	.reset_name	= _K_RST(apbc),
>   	.hws		= k1_ccu_apbc_hws,
>   	.num		= ARRAY_SIZE(k1_ccu_apbc_hws),
>   };
> @@ -984,184 +971,23 @@ static struct clk_hw *k1_ccu_apmu_hws[] = {
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_apmu_data = {
> -	.reset_name	= "apmu-reset",
> +	.reset_name	= _K_RST(apmu),
>   	.hws		= k1_ccu_apmu_hws,
>   	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_rcpu_data = {
> -	.reset_name	= "rcpu-reset",
> +	.reset_name	= _K_RST(rcpu),
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_rcpu2_data = {
> -	.reset_name	= "rcpu2-reset",
> +	.reset_name	= _K_RST(rcpu2),
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_apbc2_data = {
> -	.reset_name	= "apbc2-reset",
> +	.reset_name	= _K_RST(apbc2),
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
> @@ -1200,7 +1026,7 @@ static struct platform_driver k1_ccu_driver = {
>   		.name		= "spacemit,k1-ccu",
>   		.of_match_table = of_k1_ccu_match,
>   	},
> -	.probe	= k1_ccu_probe,
> +	.probe	= spacemit_ccu_probe,
>   };
>   module_platform_driver(k1_ccu_driver);
>   
> diff --git a/drivers/clk/spacemit/ccu_common.c b/drivers/clk/spacemit/ccu_common.c
> index 4412c4104dab..f1a837aafb46 100644
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
> +int spacemit_ccu_probe(struct platform_device *pdev)
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
> +	if (of_device_is_compatible(dev->of_node, "spacemit,k1-pll")) {
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
> index da72f3836e0b..9b4ef24875e5 100644
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
> +int spacemit_ccu_probe(struct platform_device *pdev);
> +
>   #endif /* _CCU_COMMON_H_ */
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
