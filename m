Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C944C3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 13:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NZTVdOv4F/jJPNte7hLkVwQwkzT7GiyWDwtYO+X05gI=; b=MPiEfiNl2imHiV
	XyZMF+lquDysYoVCWW6VKa9BKPTS5hIuzbW2HB4p2z4/lQESGjZkA8+dEek82/1/zirTjRAC6J97A
	dTQfWtBkOr/xRGoI2mRHUGKpF5gAMx0m+GMkr+na77e6EtdABWjIMbo72Il8W3IldLhtyB9uUO/dj
	hF4VwvVu7y67nT/6QnkKtjTph8qLSn2UorI6/4i+pLA0d8zcIvf5rGeiQp0PBLfZLPRT4cxlLeZR8
	HwNRantLzVGk9cPSdbEjezDInvFtuBLGW9uRgUhfJ+BJgKYAqWN5lMThp0fmL0e7c4N8OLjLuYmpN
	8HKXzr2uBfLFJcgGQoKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUnaP-00000002lTE-3Aeb;
	Fri, 19 Jul 2024 13:23:49 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUnaN-00000002lSh-0A40
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 13:23:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721395427; x=1752931427;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rL0qQz3bf5sQLGtti36JxstdaTgsUAOfAw64mFDeiLc=;
  b=afVypRHI/qGWfpW8vD26M+Ovll+TG/tIM4AyKxKeRtXELKN8G3loxRzn
   RQfz77jWKE7AYUfKA17m1r2btzaHq6XkoBj8cGJZbZBrBlShtst6fzHSp
   8iZdXGVn4CtTbTQ7eTBGNT1WZtVip6xtGNWSFmJGOXutTVnJocs+4zrqD
   d67ICvxknDtnsigUU9zowKB12hnc8zPCMRI6u/aN+BbmqG0f1+3mAvwhE
   wByaMmV7n+anuDHrwx0fFSd6EV0GkVj2rfRSdOH4Wv03OY3WjSrDYEhSD
   gva6CIEQVdZjigN3z4MZzwgCznbu6ui+RBJM0xhpbemOHUgiXuL8KevVR
   g==;
X-CSE-ConnectionGUID: +gOlwHUuRBmC/a3m+T9hjg==
X-CSE-MsgGUID: rXDEzQ0wRPuBd4P4Ir1BPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="30158878"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="30158878"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 06:23:46 -0700
X-CSE-ConnectionGUID: R9lYcB/vSpyJrOmZemS+0Q==
X-CSE-MsgGUID: 9oXb3w/UQze62qk/h+2wcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="51171213"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.245.150.149])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 06:23:39 -0700
Message-ID: <9d87c796-ae47-4f5a-8506-f0723be9c989@intel.com>
Date: Fri, 19 Jul 2024 16:23:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/8] mmc: sdhci-of-dwcmshc: factor out code into
 dwcmshc_rk35xx_init
To: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
 conor+dt@kernel.org, guoren@kernel.org, inochiama@outlook.com,
 jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh@kernel.org, ulf.hansson@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org,
 chao.wei@sophgo.com, haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com,
 tingzhu.wang@sophgo.com
Cc: Chen Wang <unicorn_wang@outlook.com>
References: <cover.1721377374.git.unicorn_wang@outlook.com>
 <1bb79db9f05ade17d269acefb6dcdce455236b92.1721377374.git.unicorn_wang@outlook.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <1bb79db9f05ade17d269acefb6dcdce455236b92.1721377374.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_062347_164285_E0673BCA 
X-CRM114-Status: GOOD (  17.53  )
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

On 19/07/24 11:46, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Continue factor out code fron probe into dwcmshc_rk35xx_init.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  drivers/mmc/host/sdhci-of-dwcmshc.c | 34 ++++++++++++++---------------
>  1 file changed, 16 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
> index bb0adc2ee325..30e4cea8a058 100644
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
> +	if (priv->priv)

It would be clearer here to use

	if (pltfm_data == &sdhci_dwcmshc_rk35xx_pdata)

>  		dwcmshc_rk35xx_postinit(host, priv);
>  
>  	err = __sdhci_add_host(host);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
