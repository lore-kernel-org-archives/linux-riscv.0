Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20833C36005
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Mar 2025 16:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XcYlX/vTYzcIPVMZ2jqY4RiUuWZR0cPTyceMN8TvKmc=; b=1UhQ9wdB69Zr1N
	sMpUUY/coRWsk/JffcyzJmEUr9Q+etsgAoayAZJCZfRjFe1d43txCBGbcKbFckc3AETglCKW7Yy9U
	icxlAMw2pRB4SbaiR2ioWZzS4ZJ/8EYIDAhaZ7nIFv6zAIidpengjYB/MTT9eDtmK1ztosOlsFhTY
	p5cJW0Fy5WIX9J2ALBztSw+uEEG3kRbKLKkIrvwrcThzN7UV0vpVxaxk9BA/0Z7mH//5CBrZnEIDE
	ITirO2/ztkosjbvrvaiHRvwMihMAUT2WxiNKtj7xS6gjk7BAg01uzY913VyJes25crUuO+XjB+vgA
	tVVnPdrsT+SsDJs5bXQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tw1Zi-000000004vT-1oBD;
	Sat, 22 Mar 2025 16:19:54 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tw1Zf-000000004v0-1cFS
	for linux-riscv@lists.infradead.org;
	Sat, 22 Mar 2025 16:19:52 +0000
Received: from localhost (unknown [116.232.48.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BA60834307B;
	Sat, 22 Mar 2025 16:19:49 +0000 (UTC)
Date: Sat, 22 Mar 2025 16:19:45 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heylenay@4d2.org, guodong@riscstar.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, spacemit@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 3/7] clk: spacemit: add reset controller support
Message-ID: <20250322161945-GYC11633@gentoo>
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-4-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250321151831.623575-4-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_091951_453497_6A36F7CA 
X-CRM114-Status: GOOD (  30.97  )
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

Hi Alex:

On 10:18 Fri 21 Mar     , Alex Elder wrote:
> Define ccu_reset_data as a structure that contains the constant
> register offset and bitmasks used to assert and deassert a reset
> control on a SpacemiT K1 CCU. Define ccu_reset_controller_data as
> a structure that contains the address of an array of those structures
> and a count of the number of elements in the array.
> 
> Add a pointer to a ccu_reset_controller_data structure to the
> k1_ccu_data structure.  Reset support is optional for SpacemiT CCUs;
> the new pointer field will be null for CCUs without any resets.
> 
> Finally, define a new ccu_reset_controller structure, which (for
> a CCU with resets) contains a pointer to the constant reset data,
> the regmap to be used for the controller, and an embedded a reset
> controller structure.
> 
> Each reset control is asserted or deasserted by updating bits in
> a register.  The bits used are defined by an assert mask and a
> deassert mask.  In some cases, one (non-zero) mask asserts reset
> and a different (non-zero) mask deasserts it.  Otherwise one mask
> is nonzero, and the other is zero.  Either way, the bits in
> both masks are cleared, then either the assert mask or the deassert
> mask is set in a register to affect the state of a reset control.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/clk/spacemit/ccu-k1.c | 93 +++++++++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index f7367271396a0..6d879411c6c05 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -10,6 +10,7 @@
>  #include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
>  
>  #include "ccu_common.h"
>  #include "ccu_pll.h"
> @@ -134,8 +135,26 @@ struct spacemit_ccu_clk {
>  	struct clk_hw *hw;
>  };
>  
> +struct ccu_reset_data {
> +	u32 offset;
> +	u32 assert_mask;
> +	u32 deassert_mask;
> +};
> +
> +struct ccu_reset_controller_data {
> +	u32 count;
> +	const struct ccu_reset_data *data;	/* array */
> +};
> +
>  struct k1_ccu_data {
>  	struct spacemit_ccu_clk *clk;		/* array with sentinel */
> +	const struct ccu_reset_controller_data *rst_data;
> +};
> +
> +struct ccu_reset_controller {
> +	struct regmap *regmap;
> +	const struct ccu_reset_controller_data *data;
> +	struct reset_controller_dev rcdev;
>  };
>  
>  /*	APBS clocks start	*/
> @@ -1630,6 +1649,48 @@ static const struct k1_ccu_data k1_ccu_apmu_data = {
>  	.clk		= k1_ccu_apmu_clks,
>  };
>  
> +static struct ccu_reset_controller *
> +rcdev_to_controller(struct reset_controller_dev *rcdev)
I'd suggest to avoid the line break to make it slightly more readable, intuitive
as the 80 column limit isn't hard rule

there are maybe more place similar to this, I won't add more comments
https://github.com/torvalds/linux/commit/bdc48fa11e46f867ea4d75fa59ee87a7f48be144

> +{
> +	return container_of(rcdev, struct ccu_reset_controller, rcdev);
> +}
since this function is only used once, open-code it?
but I'd fine with either way if you prefer to keep it

> +
> +static int
> +k1_rst_update(struct reset_controller_dev *rcdev, unsigned long id, bool assert)
s/k1_rst_update/k1_reset_update/g
this is a taste change, but I found more people follow this when grep driver/reset
> +{
> +	struct ccu_reset_controller *controller = rcdev_to_controller(rcdev);
> +	struct regmap *regmap = controller->regmap;
> +	const struct ccu_reset_data *data;
> +	u32 val;
> +	int ret;
> +
> +	data = &controller->data->data[id];
> +
> +	ret = regmap_read(regmap, data->offset, &val);
> +	if (ret)
> +		return ret;
> +
> +	val &= ~(data->assert_mask | data->deassert_mask);
> +	val |= assert ? data->assert_mask : data->deassert_mask;
> +
> +	return regmap_write(regmap, data->offset, val);
> +}
> +
> +static int k1_rst_assert(struct reset_controller_dev *rcdev, unsigned long id)
same reason, rst -> reset, more below
> +{
> +	return k1_rst_update(rcdev, id, true);
> +}
> +
> +static int k1_rst_deassert(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	return k1_rst_update(rcdev, id, false);
> +}
> +
> +static const struct reset_control_ops k1_reset_control_ops = {
> +	.assert		= k1_rst_assert,
> +	.deassert	= k1_rst_deassert,
> +};
> +
>  static int k1_ccu_register(struct device *dev, struct regmap *regmap,
>  			   struct regmap *lock_regmap,
>  			   struct spacemit_ccu_clk *clks)
> @@ -1675,6 +1736,33 @@ static int k1_ccu_register(struct device *dev, struct regmap *regmap,
>  	return ret;
>  }
>  
> +static int
> +k1_reset_controller_register(struct device *dev, struct regmap *regmap,
> +			     const struct ccu_reset_controller_data *data)
> +{
> +	struct ccu_reset_controller *controller;
> +	struct reset_controller_dev *rcdev;
> +
> +	/* Resets are optional */
> +	if (!data)
> +		return 0;
> +
> +	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
> +	if (!controller)
> +		return -ENOMEM;
> +
> +	controller->regmap = regmap;
> +	controller->data = data;
> +
> +	rcdev = &controller->rcdev;
..
> +	rcdev->owner = THIS_MODULE;
move to last?
> +	rcdev->nr_resets = data->count;
> +	rcdev->ops = &k1_reset_control_ops;
> +	rcdev->of_node = dev->of_node;
> +
> +	return devm_reset_controller_register(dev, rcdev);
> +}
> +
>  static int k1_ccu_probe(struct platform_device *pdev)
>  {
>  	struct regmap *base_regmap, *lock_regmap = NULL;
> @@ -1710,6 +1798,11 @@ static int k1_ccu_probe(struct platform_device *pdev)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to register clocks\n");
>  
> +	ret = k1_reset_controller_register(dev, base_regmap, data->rst_data);
..
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to register reset controller\n");
same 100 column reason
> +
>  	return 0;
>  }
>  
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
