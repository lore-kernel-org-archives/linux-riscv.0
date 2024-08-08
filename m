Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90729C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2024 07:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zyeRiEr6W7ukeXH7/a3deAdW/t8Shm9eIgaCTHhfYKc=; b=36gNk9neEsecjB
	8z7JZ0CxPIQIyth4B2W83NwyeOhNmxPJWcYb0OCS4New/FRrpk6TyYXSECNFUzNizZ7E5FhPq7Flq
	TwvknooFJy7D1LGe0UzdgLXDHvjD4+BxEXaktuX1rVOgl/4vguSVMhR14193VQd9RDxXHDGZfLif1
	gQmw5ZZpUN3UlEpHh3FF/1A2iJD7PWDGQBy0ri8gACmvTdOm+zbaw0eQxdJcP1QCeLcAn36VMudOX
	GxPws6eWv6w1X3/HR3b2+eRcX9/4grbzkG9QGVwDGQYW8YaCMHNf7D6JBgbNCLmQJzG1wDDo48M/K
	xmgV429IZfT63d3Z8BBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbxeE-00000007R0y-2h5y;
	Thu, 08 Aug 2024 07:33:22 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbxQi-00000007Mz3-48AB
	for linux-riscv@lists.infradead.org;
	Thu, 08 Aug 2024 07:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723101566; x=1754637566;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9Nbhk6CfRrxq7qd08hKcyo0cO/UojxpBoqL9e0BRuqo=;
  b=fbOmeOlybPZqMYs5s24xKSqo95XJGd8ZNk1oCeRZXGwWTXOw7YpIqQKp
   F5twH9Ey2O1BVSdWmkax73S4xp0Ul+WxH844Qj8z9WmnpbOktEHsgqQkg
   VV5gmNINvz62Sazl1OXB81+dys3PBAut0hw7JVnagB+RRr9SVGc4HwGTs
   GXQa8zHCM1+e17+qxEqwPJYRBJiwPyECvkZkyYCOJLO2xz8CTTxvxsZtK
   ZchQIfFF6CKDTHG7qHPepCcAQGhF2N+kCagQHS0pbGXGxLFh9VzMTFSTa
   omNKzj11Ai8NcxnPFFsyD/V4i4LdxBhhD3E1miLpqF5jTHCsaNekd/8tC
   A==;
X-CSE-ConnectionGUID: TRh3ssO1S2S44ANkgwrXUw==
X-CSE-MsgGUID: zD0mctMtSzCi1iu2a9mBGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21352344"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="21352344"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 00:19:25 -0700
X-CSE-ConnectionGUID: CmF79l6JRrC3hhHl10QrTQ==
X-CSE-MsgGUID: LKuBe3YdQCGqBCxG5kIgLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="80357473"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.245.150.149])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 00:19:17 -0700
Message-ID: <b87fb5fe-63e1-4f4e-bc7c-92a91becf61e@intel.com>
Date: Thu, 8 Aug 2024 10:19:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/8] mmc: sdhci-of-dwcmshc: factor out code into
 dwcmshc_rk35xx_init
To: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
 conor+dt@kernel.org, guoren@kernel.org, inochiama@outlook.com,
 jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh@kernel.org, ulf.hansson@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org,
 chao.wei@sophgo.com, haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com,
 tingzhu.wang@sophgo.com
Cc: Chen Wang <unicorn_wang@outlook.com>, Drew Fustini <drew@pdp7.com>
References: <cover.1722847198.git.unicorn_wang@outlook.com>
 <4f1f2fa403ce7f0b4d79afb7d7e8a1690cde5d6c.1722847198.git.unicorn_wang@outlook.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <4f1f2fa403ce7f0b4d79afb7d7e8a1690cde5d6c.1722847198.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_001925_117314_35331ACE 
X-CRM114-Status: GOOD (  16.55  )
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

On 5/08/24 12:18, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Continue factor out code fron probe into dwcmshc_rk35xx_init.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> Tested-by: Drew Fustini <drew@pdp7.com> # TH1520
> Tested-by: Inochi Amaoto <inochiama@outlook.com> # Duo and Huashan Pi

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci-of-dwcmshc.c | 34 ++++++++++++++---------------
>  1 file changed, 16 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
> index b272ec2ab232..55fba5ef37ba 100644
> --- a/drivers/mmc/host/sdhci-of-dwcmshc.c
> +++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
> @@ -711,12 +711,22 @@ static void rk35xx_sdhci_reset(struct sdhci_host *host, u8 mask)
>  	sdhci_reset(host, mask);
>  }
>  
> -static int dwcmshc_rk35xx_init(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
> +static int dwcmshc_rk35xx_init(struct device *dev, struct sdhci_host *host,
> +			       struct dwcmshc_priv *dwc_priv)
>  {
>  	static const char * const clk_ids[] = {"axi", "block", "timer"};
> -	struct rk35xx_priv *priv = dwc_priv->priv;
> +	struct rk35xx_priv *priv;
>  	int err;
>  
> +	priv = devm_kzalloc(dev, sizeof(struct rk35xx_priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	if (of_device_is_compatible(dev->of_node, "rockchip,rk3588-dwcmshc"))
> +		priv->devtype = DWCMSHC_RK3588;
> +	else
> +		priv->devtype = DWCMSHC_RK3568;
> +
>  	priv->reset = devm_reset_control_array_get_optional_exclusive(mmc_dev(host->mmc));
>  	if (IS_ERR(priv->reset)) {
>  		err = PTR_ERR(priv->reset);
> @@ -739,6 +749,8 @@ static int dwcmshc_rk35xx_init(struct sdhci_host *host, struct dwcmshc_priv *dwc
>  	sdhci_writel(host, 0, DWCMSHC_EMMC_DLL_TXCLK);
>  	sdhci_writel(host, 0, DWCMSHC_EMMC_DLL_STRBIN);
>  
> +	dwc_priv->priv = priv;
> +
>  	return 0;
>  }
>  
> @@ -1184,7 +1196,6 @@ static int dwcmshc_probe(struct platform_device *pdev)
>  	struct sdhci_pltfm_host *pltfm_host;
>  	struct sdhci_host *host;
>  	struct dwcmshc_priv *priv;
> -	struct rk35xx_priv *rk_priv = NULL;
>  	const struct sdhci_pltfm_data *pltfm_data;
>  	int err;
>  	u32 extra, caps;
> @@ -1241,20 +1252,7 @@ static int dwcmshc_probe(struct platform_device *pdev)
>  	host->mmc_host_ops.execute_tuning = dwcmshc_execute_tuning;
>  
>  	if (pltfm_data == &sdhci_dwcmshc_rk35xx_pdata) {
> -		rk_priv = devm_kzalloc(&pdev->dev, sizeof(struct rk35xx_priv), GFP_KERNEL);
> -		if (!rk_priv) {
> -			err = -ENOMEM;
> -			goto err_clk;
> -		}
> -
> -		if (of_device_is_compatible(pdev->dev.of_node, "rockchip,rk3588-dwcmshc"))
> -			rk_priv->devtype = DWCMSHC_RK3588;
> -		else
> -			rk_priv->devtype = DWCMSHC_RK3568;
> -
> -		priv->priv = rk_priv;
> -
> -		err = dwcmshc_rk35xx_init(host, priv);
> +		err = dwcmshc_rk35xx_init(dev, host, priv);
>  		if (err)
>  			goto err_clk;
>  	}
> @@ -1290,7 +1288,7 @@ static int dwcmshc_probe(struct platform_device *pdev)
>  		dwcmshc_cqhci_init(host, pdev);
>  	}
>  
> -	if (rk_priv)
> +	if (pltfm_data == &sdhci_dwcmshc_rk35xx_pdata)
>  		dwcmshc_rk35xx_postinit(host, priv);
>  
>  	err = __sdhci_add_host(host);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
