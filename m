Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9792C6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 13:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CDFbgJGbSRJD+PD1dFtVBHpkzCYiy/0y05QmC9ewOtU=; b=iKyaJ2BeHniEbN
	PKHq3gZmUUU1Q5cSwKWC1hOhCfnykLO5MMKQZwOf1oCRqTWeVZ8bALEeDVc/MEzpq4I82hppJRCg7
	oEPRchWRDqumGd6rYHaWaWXxVt4qe7ZUWXNRav6/Yh052xro4sxK1Pj7zfz909RbYfVkguIGH1T85
	Eh/ViuTSEsLnDuh8T/kQgH11PVOo6jsMIa3SYkDj/veD0ThdSdm4XZFyQoIG7ADugS/5kMZNeuAYb
	K8i6feWTRYrckuh6YJQ879VYxFG0q7EyZULigHvfXS50mnLGkmUQxydNSOojDi9bxGTayr9ia57oP
	54rg+usf9tb6L68RAP5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmw2r-0000000HH9f-3LMm;
	Wed, 20 Mar 2024 13:31:53 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmw2o-0000000HH8m-2UlQ
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 13:31:52 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-7cc692af9ebso130330839f.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 Mar 2024 06:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710941509; x=1711546309; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IYdYatrCiN+ZNudG0itP80RnPg8bYH9YQGS/b3nlFcg=;
        b=Tkl4ATfq+OmrA2S7oGwwGZeqxPHeunibgIWIxlbcXJ9GkBYuG+KABl9n10TzlyRDxX
         Der3tqGxK/OLXkJ3drCQVSsQoBi47cQAAJgdhUnWTMXJd8K8sT+orXmDlRzPjk/zallW
         wxkhvlDTqwqT8fTc3l0EwLKOc/VycIltnPPG38NciHtO4S4rqac1k1emMaXVuAkX44l+
         OlKp9mWC97Qzf7CKEr+8JIECP11ZqkIGyHC2JCxlGbmL4XgFpUF+6C13vOSWm1Ybk3cc
         TyG9dxUtqFP32uR3Aa8YDmx2VXd+V/J0rty/Y7PhM1sRclHslzExiTXmy/6gEUHDD5Wf
         3ynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710941509; x=1711546309;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IYdYatrCiN+ZNudG0itP80RnPg8bYH9YQGS/b3nlFcg=;
        b=J+jnjVUXDCdi/PrXdwrxFakVeP0cmrgbQz66702DT9jcxA2nGmsm5EPMGHpXfWl1Sq
         kOWWX8um+Lv7G9xkd7MqI+e1b0RBBH9ZDvTRT/7Z2RoFiuw9BfOFrfmuRLVsGDuErb+k
         Qz9wt7HKvY3eEIiNHUlHp2AviFZv3R4lVigzkQxlKlsAIt5YiFbTSY9wZgbsTwkax+Ul
         GJ4tXnB/9y8mWkqYREOYsOk2U79br2iHwJdnsnhL+i3D2RD8THfFDkyT2vDG/4Y9A6A3
         rFdd0twgbkkhveU8wN0HxSAlIXNDTdzedzqJITA1ov9fETkRnxJnompi5TFN294K49af
         xmcw==
X-Forwarded-Encrypted: i=1; AJvYcCW5IcF8cti+yHnZiudYzqsARQqECylYToef+LQP6+xgnXvdaJjnfRrGfPnMcC+wLM2+xHM69TgpxgIjvDIleH/HgtP1U4gCgmxbcnr9qEYC
X-Gm-Message-State: AOJu0YyPzA8hhG4iFEn2xiPAd7SKz0Mz7X+nrdItUh5CQsPsh2wBmdMw
	WHjSvJkY13VoqCXG7YUF4uGyVqbbIn62nVOX4wUFfGW0dJKIl85HujBIpEuhsCQ=
X-Google-Smtp-Source: AGHT+IGoPCXNA3HRY8p2GtYz/53SBRtoENZxvjYaojzumY8ha+biNeqbSMxKdf8JSNNfmYOzAKSjBA==
X-Received: by 2002:a05:6602:1d18:b0:7cc:652d:ce60 with SMTP id hh24-20020a0566021d1800b007cc652dce60mr11299708iob.20.1710941509203;
        Wed, 20 Mar 2024 06:31:49 -0700 (PDT)
Received: from [100.64.0.1] ([136.226.86.189])
        by smtp.gmail.com with ESMTPSA id u11-20020a6be30b000000b007cf25fe77efsm18631ioc.15.2024.03.20.06.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 06:31:48 -0700 (PDT)
Message-ID: <47bddec7-953d-4ea4-84f1-b0dcf0641baa@sifive.com>
Date: Wed, 20 Mar 2024 08:31:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: starfive: jh7100: Use clk_hw for external input
 clocks
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>,
 Hal Feng <hal.feng@starfivetech.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor.dooley@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
References: <beb746c7538a4ff720a25fd8f309da20d8d854ef.1710933713.git.geert@linux-m68k.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <beb746c7538a4ff720a25fd8f309da20d8d854ef.1710933713.git.geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_063150_707376_5445FE7E 
X-CRM114-Status: GOOD (  26.42  )
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

On 2024-03-20 6:24 AM, Geert Uytterhoeven wrote:
> The Starfive JH7100 clock driver does not use the DT "clocks" property
> to find the external main input clock, but instead relies on the name of
> the actual clock provider ("osc_sys").  This is fragile, and caused
> breakage when sanitizing clock node names in DTS.
> 
> Fix this by obtaining the external main input clock using
> devm_clk_get(), and passing the returned clk_hw object to
> devm_clk_hw_register_fixed_factor_parent_hw().
> 
> While name-based look-up of the other external input clocks works as-is,
> convert them to a similar clk_hw-based scheme to increase uniformity,
> and to decrease the number of name-based look-ups.
> 
> Fixes: f03606470886 ("riscv: dts: starfive: replace underscores in node names")
> Fixes: 4210be668a09ee20 ("clk: starfive: Add JH7100 clock generator driver")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> After this is applied, the workaround in commit 7921e231f85a349d
> ("riscv: dts: starfive: jh7100: fix root clock names") can be reverted.
> 
> This is v2 of "[PATCH] clk: starfive: jh7100: Use provided clocks
> instead of hardcoded names"
> https://lore.kernel.org/r/898aa0925a9598d44721d00145015b215434cb3b.1710414195.git.geert@linux-m68k.org/
> 
> v2:
>   - Use devm_clk_hw_register_fixed_factor_parent_hw(),
>   - Drop no longer needed local osc_sys name.
> ---
>  drivers/clk/starfive/clk-starfive-jh7100.c | 48 ++++++++++++++--------
>  drivers/clk/starfive/clk-starfive-jh71x0.h |  1 +
>  2 files changed, 32 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/clk/starfive/clk-starfive-jh7100.c b/drivers/clk/starfive/clk-starfive-jh7100.c
> index 0342db24c27e10df..ead5a7b14bab9045 100644
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
> @@ -284,8 +293,11 @@ static struct clk_hw *jh7100_clk_get(struct of_phandle_args *clkspec, void *data
>  
>  static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
>  {
> +	static const char *jh7100_ext_clk[EXT_NUM_CLKS] =
> +		{ "osc_sys", "osc_aud", "gmac_rmii_ref", "gmac_gr_mii_rxclk" };

This should be __initconst. Otherwise:

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

>  	struct jh71x0_clk_priv *priv;
>  	unsigned int idx;
> +	struct clk *clk;
>  	int ret;
>  
>  	priv = devm_kzalloc(&pdev->dev, struct_size(priv, reg, JH7100_CLK_PLL0_OUT), GFP_KERNEL);
> @@ -298,13 +310,21 @@ static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
>  	if (IS_ERR(priv->base))
>  		return PTR_ERR(priv->base);
>  
> -	priv->pll[0] = devm_clk_hw_register_fixed_factor(priv->dev, "pll0_out",
> -							 "osc_sys", 0, 40, 1);
> +	for (idx = 0; idx < EXT_NUM_CLKS; idx++) {
> +		clk = devm_clk_get(&pdev->dev, jh7100_ext_clk[idx]);
> +		if (IS_ERR(clk))
> +			return PTR_ERR(clk);
> +
> +		priv->ext[idx] = __clk_get_hw(clk);
> +	}
> +
> +	priv->pll[0] = devm_clk_hw_register_fixed_factor_parent_hw(priv->dev,
> +			"pll0_out", priv->ext[EXT_CLK_OSC_SYS], 0, 40, 1);
>  	if (IS_ERR(priv->pll[0]))
>  		return PTR_ERR(priv->pll[0]);
>  
> -	priv->pll[1] = devm_clk_hw_register_fixed_factor(priv->dev, "pll1_out",
> -							 "osc_sys", 0, 64, 1);
> +	priv->pll[1] = devm_clk_hw_register_fixed_factor_parent_hw(priv->dev,
> +			"pll1_out", priv->ext[EXT_CLK_OSC_SYS], 0, 64, 1);
>  	if (IS_ERR(priv->pll[1]))
>  		return PTR_ERR(priv->pll[1]);
>  
> @@ -331,16 +351,10 @@ static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
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
