Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C126CC3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 13:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w631DiwPAD8xNgAzCe7mYJbGPoBF+efFtINQqSguCYU=; b=hDn0NSjGdXC1KZ
	cTWGotgTs4/A6GZdWsNw9xkKQ3dbiw4hv2WHiX+K6TmIy/fn9o8bH49orDzOGjMuC2YEk8SU/0/6T
	FXqKUVns01whe7BWtWdPEe7QP+2F5aK8YnxlrsaoqhbgiV7Bv7MKoMfC7+4ollM82AbIcsQD56XNi
	OvW13JQHiMPW1dLXF60Se3qEySlKW3OePmfpMGHtZTONcWyFBlFnuwGiSBuDJOP634qcZYQqkpX/5
	QPgbyl9/6DDBmsGi8BXReT8sUkcLX9BA8rwSZwHwYtfujX3aPBVJ/zo3GMQ+tpVay37lqGHvAVoKY
	cq+eyELvB9pWm1kNBFUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUndT-00000002m70-1VBe;
	Fri, 19 Jul 2024 13:26:59 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUndQ-00000002m6X-13R1
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 13:26:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721395616; x=1752931616;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yU8f98IAmAXCWF97jWAcC9yDh1dQ8GhsvWFN4cf9n3o=;
  b=d60vqDEZR5xAJqxN9uHvcRO68NyvAhh7FpyZ6YP+UuIwdig0QdL9+/uU
   BnEi2w4aNmdoBae4MOLqgAMjr/sMdqfMMTDAojt6A937Rg7jm6wcVla+F
   Fv6ez8hcOo3rkAzGtr6gxYINyWIKSGgph3gocjQVxuTUUXHD0lpO5I8ej
   VUpk1/nhp6JKdetff0AX9MZ8PwU5fUJ0g432LaA6dsb/nm/cxGcFzK+gD
   zyP8VPqEW3My6bphScqpfZsBHuz/oosFyJcC0txLBg94mwMGtNvQcJ8Ig
   oAx1MEfi183F1YT3sYuEnIa/YcRemu8Lt0s8wB5u87RaeXraqQpa4ASty
   Q==;
X-CSE-ConnectionGUID: sk0ZVqhpQpa/1fIFSwhulg==
X-CSE-MsgGUID: DPLQCEKTSJ6+G0Gc+1PYNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="22767598"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="22767598"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 06:26:55 -0700
X-CSE-ConnectionGUID: 0qsrKouuQIymE30/DFvR0A==
X-CSE-MsgGUID: v4XoAXGgTjuJS6tBlKSl7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="50800301"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.245.150.149])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 06:26:48 -0700
Message-ID: <5e79be33-e914-4eb6-b8c4-a18b3c5dfcf7@intel.com>
Date: Fri, 19 Jul 2024 16:26:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] mmc: sdhci-of-dwcmshc: add dwcmshc_pltfm_data
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
 <63b66e64c22b5ef73df2d0aa2f5a992d562898d8.1721377374.git.unicorn_wang@outlook.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <63b66e64c22b5ef73df2d0aa2f5a992d562898d8.1721377374.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_062656_372626_E6FCAAAF 
X-CRM114-Status: GOOD (  17.86  )
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
> Abstract dwcmshc_pltfm_data to hold the sdhci_pltfm_data
> plus some comoon operations of soc such as init/postinit.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  drivers/mmc/host/sdhci-of-dwcmshc.c | 83 +++++++++++++++++------------
>  1 file changed, 50 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
> index 30e4cea8a058..972d03ec60e3 100644
> --- a/drivers/mmc/host/sdhci-of-dwcmshc.c
> +++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
> @@ -205,6 +205,8 @@ struct rk35xx_priv {
>  
>  #define DWCMSHC_MAX_OTHER_CLKS 3
>  
> +struct dwcmshc_pltfm_data;

Forward declaration not needed

> +
>  struct dwcmshc_priv {
>  	struct clk	*bus_clk;
>  	int vendor_specific_area1; /* P_VENDOR_SPECIFIC_AREA1 reg */
> @@ -218,6 +220,12 @@ struct dwcmshc_priv {
>  	u16 flags;
>  };
>  
> +struct dwcmshc_pltfm_data {
> +	const struct sdhci_pltfm_data pdata;
> +	int (*init)(struct device *dev, struct sdhci_host *host, struct dwcmshc_priv *dwc_priv);
> +	void (*postinit)(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv);
> +};
> +
>  static int dwcmshc_get_enable_other_clks(struct device *dev,
>  					 struct dwcmshc_priv *priv,
>  					 int num_clks,
> @@ -1048,39 +1056,52 @@ static const struct sdhci_ops sdhci_dwcmshc_cv18xx_ops = {
>  	.platform_execute_tuning = cv18xx_sdhci_execute_tuning,
>  };
>  
> -static const struct sdhci_pltfm_data sdhci_dwcmshc_pdata = {
> -	.ops = &sdhci_dwcmshc_ops,
> -	.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
> -	.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
> +static const struct dwcmshc_pltfm_data sdhci_dwcmshc_pdata = {
> +	.pdata = {
> +		.ops = &sdhci_dwcmshc_ops,
> +		.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
> +		.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
> +	},
>  };
>  
>  #ifdef CONFIG_ACPI
> -static const struct sdhci_pltfm_data sdhci_dwcmshc_bf3_pdata = {
> -	.ops = &sdhci_dwcmshc_ops,
> -	.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
> -	.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN |
> -		   SDHCI_QUIRK2_ACMD23_BROKEN,
> +static const struct dwcmshc_pltfm_data sdhci_dwcmshc_bf3_pdata = {
> +	.pdata = {
> +		.ops = &sdhci_dwcmshc_ops,
> +		.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
> +		.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN |
> +			   SDHCI_QUIRK2_ACMD23_BROKEN,
> +	},
>  };
>  #endif
>  
> -static const struct sdhci_pltfm_data sdhci_dwcmshc_rk35xx_pdata = {
> -	.ops = &sdhci_dwcmshc_rk35xx_ops,
> -	.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN |
> -		  SDHCI_QUIRK_BROKEN_TIMEOUT_VAL,
> -	.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN |
> -		   SDHCI_QUIRK2_CLOCK_DIV_ZERO_BROKEN,
> +static const struct dwcmshc_pltfm_data sdhci_dwcmshc_rk35xx_pdata = {
> +	.pdata = {
> +		.ops = &sdhci_dwcmshc_rk35xx_ops,
> +		.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN |
> +			  SDHCI_QUIRK_BROKEN_TIMEOUT_VAL,
> +		.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN |
> +			   SDHCI_QUIRK2_CLOCK_DIV_ZERO_BROKEN,
> +	},
> +	.init = dwcmshc_rk35xx_init,
> +	.postinit = dwcmshc_rk35xx_postinit,
>  };
>  
> -static const struct sdhci_pltfm_data sdhci_dwcmshc_th1520_pdata = {
> -	.ops = &sdhci_dwcmshc_th1520_ops,
> -	.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
> -	.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
> +static const struct dwcmshc_pltfm_data sdhci_dwcmshc_th1520_pdata = {
> +	.pdata = {
> +		.ops = &sdhci_dwcmshc_th1520_ops,
> +		.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
> +		.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
> +	},
> +	.init = th1520_init,
>  };
>  
> -static const struct sdhci_pltfm_data sdhci_dwcmshc_cv18xx_pdata = {
> -	.ops = &sdhci_dwcmshc_cv18xx_ops,
> -	.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
> -	.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
> +static const struct dwcmshc_pltfm_data sdhci_dwcmshc_cv18xx_pdata = {
> +	.pdata = {
> +		.ops = &sdhci_dwcmshc_cv18xx_ops,
> +		.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
> +		.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
> +	},
>  };
>  
>  static const struct cqhci_host_ops dwcmshc_cqhci_ops = {
> @@ -1196,7 +1217,7 @@ static int dwcmshc_probe(struct platform_device *pdev)
>  	struct sdhci_pltfm_host *pltfm_host;
>  	struct sdhci_host *host;
>  	struct dwcmshc_priv *priv;
> -	const struct sdhci_pltfm_data *pltfm_data;
> +	const struct dwcmshc_pltfm_data *pltfm_data;
>  	int err;
>  	u32 extra, caps;
>  
> @@ -1206,7 +1227,7 @@ static int dwcmshc_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> -	host = sdhci_pltfm_init(pdev, pltfm_data,
> +	host = sdhci_pltfm_init(pdev, &pltfm_data->pdata,
>  				sizeof(struct dwcmshc_priv));
>  	if (IS_ERR(host))
>  		return PTR_ERR(host);
> @@ -1251,16 +1272,12 @@ static int dwcmshc_probe(struct platform_device *pdev)
>  	host->mmc_host_ops.hs400_enhanced_strobe = dwcmshc_hs400_enhanced_strobe;
>  	host->mmc_host_ops.execute_tuning = dwcmshc_execute_tuning;
>  
> -	if (pltfm_data == &sdhci_dwcmshc_rk35xx_pdata) {
> -		err = dwcmshc_rk35xx_init(dev, host, priv);
> +	if (pltfm_data->init) {
> +		err = pltfm_data->init(&pdev->dev, host, priv);
>  		if (err)
>  			goto err_clk;
>  	}
>  
> -	if (pltfm_data == &sdhci_dwcmshc_th1520_pdata) {
> -		th1520_init(dev, host, priv);
> -	}
> -
>  #ifdef CONFIG_ACPI
>  	if (pltfm_data == &sdhci_dwcmshc_bf3_pdata)
>  		sdhci_enable_v4_mode(host);
> @@ -1288,8 +1305,8 @@ static int dwcmshc_probe(struct platform_device *pdev)
>  		dwcmshc_cqhci_init(host, pdev);
>  	}
>  
> -	if (priv->priv)
> -		dwcmshc_rk35xx_postinit(host, priv);
> +	if (pltfm_data->postinit)
> +		pltfm_data->postinit(host, priv);
>  
>  	err = __sdhci_add_host(host);
>  	if (err)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
