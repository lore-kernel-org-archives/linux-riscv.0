Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CF2D3E78C
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Dec 2025 03:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rIYuOx7R+XsdbXF6V3CjA1IbeiftxhBtjFAHYnsckwI=; b=W4TgMecUpwQGsD
	3ZXp+MBEQlN0feWoWTSCABPufKups4VRLxzW/3HrR7BpT9UTtsnFp6uiw8HKOBUOEt/QNLNCYG1yy
	dGbdinENxpI9RvwGiaORbabr4/F0slxS7xUoTK/QReMPNjUjpVbWijM85O5ZnDqB0UZbGxoH/SWeE
	wCYwDNfPDWfU1Z7+UXZU56edcQdQL/hgQiG5l2Hyl6xdKV0f1s987se8rX8eaxR9vFPazi9PY3kVc
	QrJtvZh8eC6ar5msPh71cOnoA+1WDuqb8PdIf7k8OtNt39cE3TGyBF2xlzVUCyDCQVFXs3hypPzFy
	fFxfqjphAIQsYRyuq3hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTXVk-0000000GAjL-0LRM;
	Thu, 11 Dec 2025 03:38:36 +0000
Received: from mail50.out.titan.email ([44.199.128.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTXVi-0000000GAiz-2cG4
	for linux-riscv@lists.infradead.org;
	Thu, 11 Dec 2025 03:38:35 +0000
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4dRdbX2hJHz9ry1;
	Thu, 11 Dec 2025 03:38:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=d8kSlJlqIefSfeNRWxze+FrgjZpC7LfELXdE8F9Z6j8=;
	c=relaxed/relaxed; d=ziyao.cc;
	h=to:date:from:references:mime-version:cc:message-id:subject:in-reply-to:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1765424312; v=1;
	b=Sb3V7oy9M6KtFk/EiXbU3x0sxy5ui/n0npN3DwZKF8ai6I1TaUdKUuz56G7e4T6xOBtat4td
	U7jdvHVN/nzH2FqZ9JWqOjG2amaNDwxM9UwQmC4f4pRDfrlGty808TiGdu7Mok9omeVG6m7qtjc
	HQAw30C5S8c3YI8FMn5ialmY=
Received: from pie (unknown [117.171.66.90])
	by smtp-out.flockmail.com (Postfix) with ESMTPA id 4dRdbS1wFqz9rwy;
	Thu, 11 Dec 2025 03:38:27 +0000 (UTC)
Date: Thu, 11 Dec 2025 03:38:24 +0000
Feedback-ID: :me@ziyao.cc:ziyao.cc:flockmailId
From: Yao Zi <me@ziyao.cc>
To: Yixun Lan <dlan@gentoo.org>, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Haylen Chu <heylenay@4d2.org>, Inochi Amaoto <inochiama@gmail.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 4/4] clk: spacemit: k3: add the clock tree
Message-ID: <aTo8sCPpVM1o9PKX@pie>
References: <20251211-k3-clk-v1-0-8ee47c70c5bc@gentoo.org>
 <20251211-k3-clk-v1-4-8ee47c70c5bc@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251211-k3-clk-v1-4-8ee47c70c5bc@gentoo.org>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1765424312200132238.21635.2368487487041513004@prod-use1-smtp-out1003.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=TPG/S0la c=1 sm=1 tr=0 ts=693a3cb8
	a=rBp+3XZz9uO5KTvnfbZ58A==:117 a=rBp+3XZz9uO5KTvnfbZ58A==:17
	a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10 a=CEWIc4RMnpUA:10 a=7mOBRU54AAAA:8
	a=prZasoeBdVvYPQNCfvoA:9 a=CjuIK1q_8ugA:10 a=wa9RWnbW_A1YIeRBVszw:22
	a=3z85VNIBY5UIEeAh_hcH:22 a=NWVoK91CQySWRX1oVYDe:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_193834_736602_73CF9A3F 
X-CRM114-Status: GOOD (  26.06  )
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

On Thu, Dec 11, 2025 at 09:19:44AM +0800, Yixun Lan wrote:
> Add clock support to SpacemiT K3 SoC, the clock tree consist of several
> blocks which are APBC, APBS, APMU, DCIU, MPUM.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/clk/spacemit/Kconfig     |    6 +
>  drivers/clk/spacemit/Makefile    |   11 +-
>  drivers/clk/spacemit/ccu-k3.c    | 1641 ++++++++++++++++++++++++++++++++++++++
>  include/soc/spacemit/ccu.h       |   18 +
>  include/soc/spacemit/k1-syscon.h |   12 +-
>  include/soc/spacemit/k3-syscon.h |  273 +++++++
>  6 files changed, 1947 insertions(+), 14 deletions(-)

...

> diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
> new file mode 100644
> index 000000000000..948889e8ca8c
> --- /dev/null
> +++ b/drivers/clk/spacemit/ccu-k3.c
> @@ -0,0 +1,1641 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 SpacemiT Technology Co. Ltd
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/auxiliary_bus.h>
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <soc/spacemit/k3-syscon.h>
> +
> +#include "ccu_common.h"
> +#include "ccu_pll.h"
> +#include "ccu_mix.h"
> +#include "ccu_ddn.h"
> +
> +#include <dt-bindings/clock/spacemit,k3-clocks.h>
> +
> +struct spacemit_ccu_data {
> +	const char *reset_name;
> +	struct clk_hw **hws;
> +	size_t num;
> +};

...

> +static const struct spacemit_ccu_data k3_ccu_dciu_data = {
> +	.reset_name	= "dciu-reset",
> +	.hws		= k3_ccu_dciu_hws,
> +	.num		= ARRAY_SIZE(k3_ccu_dciu_hws),
> +};
> +
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
> +	clk_data->num = data->num;
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
> +	static u32 next_id;
> +	int ret;
> +
> +	/* Nothing to do if the CCU does not implement a reset controller */
> +	if (!reset_name)
> +		return 0;
> +
> +	cadev = devm_kzalloc(dev, sizeof(*cadev), GFP_KERNEL);
> +	if (!cadev)
> +		return -ENOMEM;
> +	cadev->regmap = regmap;
> +
> +	adev = &cadev->adev;
> +	adev->name = reset_name;
> +	adev->dev.parent = dev;
> +	adev->dev.release = spacemit_cadev_release;
> +	adev->dev.of_node = dev->of_node;
> +	adev->id = next_id++;
> +
> +	ret = auxiliary_device_init(adev);
> +	if (ret)
> +		return ret;
> +
> +	ret = auxiliary_device_add(adev);
> +	if (ret) {
> +		auxiliary_device_uninit(adev);
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
> +}

This piece of code looks quiet similar to types/functions with the same
names in ccu-k1.c. If I'm correct, could we separate the logic into a
new file and avoid duplication?

> +static int k3_ccu_probe(struct platform_device *pdev)
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
> +	/*
> +	 * The lock status of PLLs locate in MPMU region, while PLLs themselves
> +	 * are in APBS region. Reference to MPMU syscon is required to check PLL
> +	 * status.
> +	 */
> +	if (of_device_is_compatible(dev->of_node, "spacemit,k3-pll")) {
> +		struct device_node *mpmu = of_parse_phandle(dev->of_node, "spacemit,mpmu", 0);
> +
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

k3_ccu_probe looks quote similar to k1_ccu_probe, too. The only
difference is that k3_ccu_probe checks for spacemit,k3-pll instead of
spacemit,k1-pll.

We could share most of the probe code by writing a SoC-independent probe
function,

	int spacemit_ccu_probe(struct platform_dev *pdev,
			       const char *pll_compatible);

and calling it in ccu-k1.c and ccu-k3.c with different pll_compatible.

Regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
