Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75D5C35FFC
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Mar 2025 15:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJ2NFz79e9ZiMMy9h3ZQl0fsmHvJhb+Et1PQQHtb+qE=; b=BgRCQCGCnqlIS4
	zeCalT84JKuzAPgF8MDOU/13k3REau4NeZdPRKzzmsDRQ/IYjgQ0yxd0r4FtmYBQttn/cSrREIN98
	+yWE06gAGKxwBI4FPRlShQXdP0WaB8IYgvZPkHFl2humZKUFErCjSDei/Umk1fHRuFJ0E/KVDjk6o
	YeltZt7i9mHwGe3hSb/zqNyJN/Yix9DWyZNdgsYi6S12c3qjwpAjlgx4/sb5x0zS1J0T3DsdNjA9g
	rujSqVD9iNwsbPfaqMQjBmU2ChXLlKlZwgmuJTkSTjYYuef4LIp9aVnOhF+AIEkXvpJ3l3svORBbm
	8WlwWIksh0BzUDf2Lp1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tw17U-000000002VS-0RVG;
	Sat, 22 Mar 2025 15:50:44 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tw17R-000000002Ug-2kRH
	for linux-riscv@lists.infradead.org;
	Sat, 22 Mar 2025 15:50:42 +0000
Received: from localhost (unknown [116.232.48.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 137C73431B5;
	Sat, 22 Mar 2025 15:50:38 +0000 (UTC)
Date: Sat, 22 Mar 2025 15:50:34 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heylenay@4d2.org, guodong@riscstar.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, spacemit@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 2/7] clk: spacemit: define struct k1_ccu_data
Message-ID: <20250322155034-GYB11633@gentoo>
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-3-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250321151831.623575-3-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_085041_725775_C61B00B4 
X-CRM114-Status: GOOD (  28.82  )
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

this patch change relate to clock only, so how about let's fold
it into clk patches (which now has not been merged), so we make
the code right at first place? cause some moving around and renaming

On 10:18 Fri 21 Mar     , Alex Elder wrote:
> Define a new structure type to be used for describing the OF match data.
> Rather than using the array of spacemit_ccu_clk structures for match
> data, we use this structure instead.
> 
> Move the definition of the spacemit_ccu_clk structure closer to the top
> of the source file, and add the new structure definition below it.
> 
> Shorten the name of spacemit_ccu_register() to be k1_ccu_register().
any good reason to change this? it make the code style inconsistent,
do you just change it for shorten function, or want it to be more k1
specific, so next SoC - e.g maybe k2? will introduce another function?

> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/clk/spacemit/ccu-k1.c | 58 ++++++++++++++++++++++++++---------
>  1 file changed, 43 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index 44db48ae71313..f7367271396a0 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -129,6 +129,15 @@
>  #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
>  #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
>  
> +struct spacemit_ccu_clk {
> +	int id;
> +	struct clk_hw *hw;
> +};
> +
> +struct k1_ccu_data {
> +	struct spacemit_ccu_clk *clk;		/* array with sentinel */
> +};
> +
>  /*	APBS clocks start	*/
>  
>  /* Frequency of pll{1,2} should not be updated at runtime */
> @@ -1359,11 +1368,6 @@ static CCU_GATE_DEFINE(emmc_bus_clk, CCU_PARENT_HW(pmua_aclk),
>  		       0);
>  /*	APMU clocks end		*/
>  
> -struct spacemit_ccu_clk {
> -	int id;
> -	struct clk_hw *hw;
> -};
> -
>  static struct spacemit_ccu_clk k1_ccu_apbs_clks[] = {
>  	{ CLK_PLL1,		&pll1.common.hw },
>  	{ CLK_PLL2,		&pll2.common.hw },
> @@ -1403,6 +1407,10 @@ static struct spacemit_ccu_clk k1_ccu_apbs_clks[] = {
>  	{ 0,			NULL },
>  };
>  
> +static const struct k1_ccu_data k1_ccu_apbs_data = {
> +	.clk		= k1_ccu_apbs_clks,
> +};
> +
>  static struct spacemit_ccu_clk k1_ccu_mpmu_clks[] = {
>  	{ CLK_PLL1_307P2,	&pll1_d8_307p2.common.hw },
>  	{ CLK_PLL1_76P8,	&pll1_d32_76p8.common.hw },
> @@ -1440,6 +1448,10 @@ static struct spacemit_ccu_clk k1_ccu_mpmu_clks[] = {
>  	{ 0,			NULL },
>  };
>  
> +static const struct k1_ccu_data k1_ccu_mpmu_data = {
> +	.clk		= k1_ccu_mpmu_clks,
> +};
> +
>  static struct spacemit_ccu_clk k1_ccu_apbc_clks[] = {
>  	{ CLK_UART0,		&uart0_clk.common.hw },
>  	{ CLK_UART2,		&uart2_clk.common.hw },
> @@ -1544,6 +1556,10 @@ static struct spacemit_ccu_clk k1_ccu_apbc_clks[] = {
>  	{ 0,			NULL },
>  };
>  
> +static const struct k1_ccu_data k1_ccu_apbc_data = {
> +	.clk		= k1_ccu_apbc_clks,
> +};
> +
>  static struct spacemit_ccu_clk k1_ccu_apmu_clks[] = {
>  	{ CLK_CCI550,		&cci550_clk.common.hw },
>  	{ CLK_CPU_C0_HI,	&cpu_c0_hi_clk.common.hw },
> @@ -1610,9 +1626,13 @@ static struct spacemit_ccu_clk k1_ccu_apmu_clks[] = {
>  	{ 0,			NULL },
>  };
>  
> -static int spacemit_ccu_register(struct device *dev,
> -				 struct regmap *regmap, struct regmap *lock_regmap,
> -				 const struct spacemit_ccu_clk *clks)
> +static const struct k1_ccu_data k1_ccu_apmu_data = {
> +	.clk		= k1_ccu_apmu_clks,
> +};
> +
> +static int k1_ccu_register(struct device *dev, struct regmap *regmap,
> +			   struct regmap *lock_regmap,
> +			   struct spacemit_ccu_clk *clks)
>  {
>  	const struct spacemit_ccu_clk *clk;
>  	int i, ret, max_id = 0;
> @@ -1648,15 +1668,24 @@ static int spacemit_ccu_register(struct device *dev,
>  
>  	clk_data->num = max_id + 1;
>  
> -	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
> +	if (ret)
> +		dev_err(dev, "error %d adding clock hardware provider\n", ret);
> +
> +	return ret;
I'd use "return 0;", nothing different, just explicitly short

ok, I can understand this change ease debug procedure once there is problem.
(but I'm fine with either way, failure should rarely happen & will
identify early)

>  }
>  
>  static int k1_ccu_probe(struct platform_device *pdev)
>  {
>  	struct regmap *base_regmap, *lock_regmap = NULL;
>  	struct device *dev = &pdev->dev;
> +	const struct k1_ccu_data *data;
>  	int ret;
>  
> +	data = of_device_get_match_data(dev);
> +	if (!data)
> +		return -EINVAL;
> +
>  	base_regmap = device_node_to_regmap(dev->of_node);
>  	if (IS_ERR(base_regmap))
>  		return dev_err_probe(dev, PTR_ERR(base_regmap),
> @@ -1677,8 +1706,7 @@ static int k1_ccu_probe(struct platform_device *pdev)
>  					     "failed to get lock regmap\n");
>  	}
>  
> -	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap,
> -				    of_device_get_match_data(dev));
> +	ret = k1_ccu_register(dev, base_regmap, lock_regmap, data->clk);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to register clocks\n");
>  
> @@ -1688,19 +1716,19 @@ static int k1_ccu_probe(struct platform_device *pdev)
>  static const struct of_device_id of_k1_ccu_match[] = {
>  	{
>  		.compatible	= "spacemit,k1-pll",
> -		.data		= k1_ccu_apbs_clks,
> +		.data		= &k1_ccu_apbs_data,
>  	},
>  	{
>  		.compatible	= "spacemit,k1-syscon-mpmu",
> -		.data		= k1_ccu_mpmu_clks,
> +		.data		= &k1_ccu_mpmu_data,
>  	},
>  	{
>  		.compatible	= "spacemit,k1-syscon-apbc",
> -		.data		= k1_ccu_apbc_clks,
> +		.data		= &k1_ccu_apbc_data,
>  	},
>  	{
>  		.compatible	= "spacemit,k1-syscon-apmu",
> -		.data		= k1_ccu_apmu_clks,
> +		.data		= &k1_ccu_apmu_data,
>  	},
>  	{ }
	{ /* sentinel */ }
>  };
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
