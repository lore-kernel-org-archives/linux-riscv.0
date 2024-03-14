Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C24C54E60
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 14:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eW6MC8YnmhUQCKYy6ddIojgygyUZdZi26aFuIEJtLeQ=; b=H2gYYRRp7pa7K6
	YU9bqQcqjAIyudwiJu0svgSaz/NJ3931HWoiPbV/kSQnog/3RElDVPigTfGLR7BUhvSh2ol7lNZF/
	NZquBNhHOk1T9k/5ogi+VHXNDpZqRufZOLwnsXpI45g6uHN4I4CWJ/GJiy53/Z58uoAk1uZOQL1Xt
	xhYgBWG/nVDRwf9meQzbS4dNZZRYU6OwP82RZAcXxdIGQiljAq4XWAYzP9Gg7bSh17nK1Zwx2OKxN
	FrnbDupGcebzqssSfFX5Yle4rfFjgAYoKf4jhsFDX/jJ+I2gR8YLOobRz0CBmnUc3cqUU/f80WZGp
	SUje6/rcUAt+ON1nPOMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkm8G-0000000EebC-0tkg;
	Thu, 14 Mar 2024 14:32:32 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkm8C-0000000EeZw-2TQT
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 14:32:30 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7810827e54eso68006085a.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 07:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710426746; x=1711031546; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jPb7/+yEf34BX9JyUtMPYax+3UVX1h03DI1ozbgzGLM=;
        b=EUHBJJkENAg4KOtsP5y5XQM8bsVFRpZAVnas5suuRPaEm2bNH4Y0Y7q+uFRDMUH9OV
         Wl4cH47RW9P0Xvf7dBCuWTw7AQFaBau60+bUxsurLW8J4PlpqETovPZCRIqmIEzNNwLM
         PjMwBTQ1/kmuVpoo2w1BbohxGUpRQl+vVZBS+WTTBFfS3rGdcOcp0ctn1GzaFqfgwfiC
         af7nBUiiTJn0SFiXMXOzquS2f728hmNnZq2rOgVm7yzbf6NAmFXApbAL2hS5mkGOenAG
         8nSiCfxEHxgud9CSwoHK0DPcSmJK3LPTLors+IqszlhHiPZxPwRk67RNIqGqzOXDgtL/
         5t5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710426746; x=1711031546;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jPb7/+yEf34BX9JyUtMPYax+3UVX1h03DI1ozbgzGLM=;
        b=Y1HLH4H/y1nfwaCh7c386dxuaEac/k0DlBkYCdlg9fOPrPyJNLzor9/KweeyiTJiRG
         Dtz0wUtFK5NKwFUME9F4xzq98tUGE10EmF+KSHHOUDc9UlUtbtUlE+WQgokBqvvvFncv
         JB6pzbVQY3y4oixKjtxlij5OIwb7OhZp5x4b7Kqey+wrt4u+Hrc+O4U04LTXzMgJcyIH
         Tcr2LjjSKKY49MRB2hgyTsubEzoI7v492eVQ3s07v8ygYnE7+6+Y6WMKjUZeY4o2XRwB
         MLza72a2YS5g030y+BQ7yJ8QAb/IkDbYeqFS1ziO+U8j+zcTfztyi6CFM0+7JVBuPcsA
         34UQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlgQHsvhoUOxZIWKSjGmwYiqF2rC7nl+uqrC5ZxK4nNRVVysv1tY5eOYiL1oMhrzSCUmmPnNfpGt6BpdjXQIOkiuRg9VMyXefhsM05IRIt
X-Gm-Message-State: AOJu0Yz0Yg6Fl4RumsurYIBVXasvHS/KMbO4H4iPBADt9GlN94yjeRSF
	Uiyz0tcDnQlYT21PY9GEQ4DScXy/HsXk0bAD2vIQMFG/xjTi7PAonCMufffPAU5n1hyeJu1VdtO
	1
X-Google-Smtp-Source: AGHT+IFyWpvpLRnvDR2FEcatdl/nSLAujpfkq2yHkpftx9iOtxQgzmVAvBfGJr74VrhWmpvy2Bz78g==
X-Received: by 2002:a05:620a:268f:b0:789:d2e9:9699 with SMTP id c15-20020a05620a268f00b00789d2e99699mr1030374qkp.22.1710426746591;
        Thu, 14 Mar 2024 07:32:26 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.8.192])
        by smtp.gmail.com with ESMTPSA id m26-20020a05620a221a00b00788481cdf4csm878245qkh.111.2024.03.14.07.32.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 07:32:25 -0700 (PDT)
Message-ID: <695ebdde-3dc3-41b1-b20b-f02c4ba1ae5d@sifive.com>
Date: Thu, 14 Mar 2024 09:32:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: starfive: jh7100: Use provided clocks instead of
 hardcoded names
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng
 <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
References: <898aa0925a9598d44721d00145015b215434cb3b.1710414195.git.geert@linux-m68k.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <898aa0925a9598d44721d00145015b215434cb3b.1710414195.git.geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_073228_742131_F12E33CF 
X-CRM114-Status: GOOD (  23.95  )
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

Hi Geert,

On 2024-03-14 6:05 AM, Geert Uytterhoeven wrote:
> The Starfive JH7100 clock driver does not use the DT "clocks" property
> to find its external input clocks, but instead relies on the names of
> the actual external clock providers.  This is fragile, and caused
> breakage when sanitizing clock names in DT.
> 
> Fix this by obtaining the external input clocks through the DT "clocks"
> property, and using their clk_hw objects or corresponding name.
> 
> Fixes: f03606470886 ("riscv: dts: starfive: replace underscores in node names")
> Fixes: 4210be668a09ee20 ("clk: starfive: Add JH7100 clock generator driver")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> After this is applied, the workaround in commit 7921e231f85a349d
> ("riscv: dts: starfive: jh7100: fix root clock names") can be reverted.
> ---
>  drivers/clk/starfive/clk-starfive-jh7100.c | 47 +++++++++++++++-------
>  drivers/clk/starfive/clk-starfive-jh71x0.h |  1 +
>  2 files changed, 33 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/clk/starfive/clk-starfive-jh7100.c b/drivers/clk/starfive/clk-starfive-jh7100.c
> index 0342db24c27e10df..08e6f03f2cfc36c1 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7100.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7100.c
> @@ -7,6 +7,7 @@
>   * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
>   */
>  
> +#include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/device.h>
>  #include <linux/init.h>
> @@ -18,10 +19,18 @@
>  #include "clk-starfive-jh71x0.h"
>  
>  /* external clocks */
> -#define JH7100_CLK_OSC_SYS		(JH7100_CLK_END + 0)
> -#define JH7100_CLK_OSC_AUD		(JH7100_CLK_END + 1)
> -#define JH7100_CLK_GMAC_RMII_REF	(JH7100_CLK_END + 2)
> -#define JH7100_CLK_GMAC_GR_MII_RX	(JH7100_CLK_END + 3)
> +enum {
> +	EXT_CLK_OSC_SYS,
> +	EXT_CLK_OSC_AUD,
> +	EXT_CLK_GMAC_RMII_REF,
> +	EXT_CLK_GMAC_GR_MII_RX,
> +	EXT_NUM_CLKS
> +};
> +
> +#define JH7100_CLK_OSC_SYS		(JH7100_CLK_END + EXT_CLK_OSC_SYS)
> +#define JH7100_CLK_OSC_AUD		(JH7100_CLK_END + EXT_CLK_OSC_AUD)
> +#define JH7100_CLK_GMAC_RMII_REF	(JH7100_CLK_END + EXT_CLK_GMAC_RMII_REF)
> +#define JH7100_CLK_GMAC_GR_MII_RX	(JH7100_CLK_END + EXT_CLK_GMAC_GR_MII_RX)
>  
>  static const struct jh71x0_clk_data jh7100_clk_data[] __initconst = {
>  	JH71X0__MUX(JH7100_CLK_CPUNDBUS_ROOT, "cpundbus_root", 0, 4,
> @@ -284,8 +293,12 @@ static struct clk_hw *jh7100_clk_get(struct of_phandle_args *clkspec, void *data
>  
>  static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
>  {
> +	static const char *jh7100_ext_clk[EXT_NUM_CLKS] =
> +		{ "osc_sys", "osc_aud", "gmac_rmii_ref", "gmac_gr_mii_rxclk" };
>  	struct jh71x0_clk_priv *priv;
> +	const char *osc_sys;
>  	unsigned int idx;
> +	struct clk *clk;
>  	int ret;
>  
>  	priv = devm_kzalloc(&pdev->dev, struct_size(priv, reg, JH7100_CLK_PLL0_OUT), GFP_KERNEL);
> @@ -298,13 +311,23 @@ static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
>  	if (IS_ERR(priv->base))
>  		return PTR_ERR(priv->base);
>  
> +	for (idx = 0; idx < EXT_NUM_CLKS; idx++) {
> +		clk = devm_clk_get(&pdev->dev, jh7100_ext_clk[idx]);
> +		if (IS_ERR(clk))
> +			return PTR_ERR(clk);
> +
> +		priv->ext[idx] = __clk_get_hw(clk);
> +	}
> +
> +	osc_sys = clk_hw_get_name(priv->ext[EXT_CLK_OSC_SYS]);
> +
>  	priv->pll[0] = devm_clk_hw_register_fixed_factor(priv->dev, "pll0_out",
> -							 "osc_sys", 0, 40, 1);
> +							 osc_sys, 0, 40, 1);
>  	if (IS_ERR(priv->pll[0]))
>  		return PTR_ERR(priv->pll[0]);
>  
>  	priv->pll[1] = devm_clk_hw_register_fixed_factor(priv->dev, "pll1_out",
> -							 "osc_sys", 0, 64, 1);
> +							 osc_sys, 0, 64, 1);

These should use devm_clk_hw_register_fixed_factor_parent_hw(). (Or you could
define a devm_clk_hw_register_fixed_factor_fw_name() and drop the other changes.)

Regards,
Samuel

>  	if (IS_ERR(priv->pll[1]))
>  		return PTR_ERR(priv->pll[1]);
>  
> @@ -331,16 +354,10 @@ static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
>  
>  			if (pidx < JH7100_CLK_PLL0_OUT)
>  				parents[i].hw = &priv->reg[pidx].hw;
> -			else if (pidx < JH7100_CLK_END)
> +			else if (pidx < JH7100_CLK_OSC_SYS)
>  				parents[i].hw = priv->pll[pidx - JH7100_CLK_PLL0_OUT];
> -			else if (pidx == JH7100_CLK_OSC_SYS)
> -				parents[i].fw_name = "osc_sys";
> -			else if (pidx == JH7100_CLK_OSC_AUD)
> -				parents[i].fw_name = "osc_aud";
> -			else if (pidx == JH7100_CLK_GMAC_RMII_REF)
> -				parents[i].fw_name = "gmac_rmii_ref";
> -			else if (pidx == JH7100_CLK_GMAC_GR_MII_RX)
> -				parents[i].fw_name = "gmac_gr_mii_rxclk";
> +			else if (pidx <= JH7100_CLK_GMAC_GR_MII_RX)
> +				parents[i].hw = priv->ext[pidx - JH7100_CLK_OSC_SYS];
>  		}
>  
>  		clk->hw.init = &init;
> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.h b/drivers/clk/starfive/clk-starfive-jh71x0.h
> index 23e052fc15495c41..4f46939179cd7418 100644
> --- a/drivers/clk/starfive/clk-starfive-jh71x0.h
> +++ b/drivers/clk/starfive/clk-starfive-jh71x0.h
> @@ -115,6 +115,7 @@ struct jh71x0_clk_priv {
>  	struct device *dev;
>  	void __iomem *base;
>  	struct clk_hw *pll[3];
> +	struct clk_hw *ext[4];
>  	struct jh71x0_clk reg[];
>  };
>  


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
