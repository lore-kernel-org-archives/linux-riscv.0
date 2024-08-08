Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F66DC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2024 07:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HsUGEVGbiRlsL3M61n7tW7hN4ppZ+fLVHrb79ukS8J4=; b=4qPX2ilwu6kiBe
	Qa3REDYPPucN4NmwZ2T97AAXM2vwycuWYiH5v1uUYf06UOSH+7tGKohqznhxOpOLqSMjMbtWI2YH8
	CirI1f+VKGvj3T2n8mQfn+aSeGaZtiQaVzrZavMdJ5Sm7v+X79UP/RqZQ7HWbuSU5hI79BqgxvA3u
	HQLr1pesdGFkfovT8pdJFz/ra6qYw16/ONTyM3z5uva/pCOYiSWvsLMxGNINl+NlE/z0QHql/1Y0s
	wwLLbsgJRnDaxeKPSfFuBLNuzzltmz0YdD8GQ/vM/kwRx1vUeVn4QH0KyTvJkj2BrQcPEuEzY7vm8
	LDIZSlX8/3GxdopDFnFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbxeC-00000007R0F-37d0;
	Thu, 08 Aug 2024 07:33:20 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbxPY-00000007MWb-21IV
	for linux-riscv@lists.infradead.org;
	Thu, 08 Aug 2024 07:18:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723101493; x=1754637493;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PhIRrqCmbBa2e0mnCCkEByzuKx+DKmmf2NOmKScSSwM=;
  b=YV952nG1yZyZAuhSv+QIZvN841qGAlipOwHZSdjl/ffd1l5+PGM+iYk/
   x0bFGUtTTDUOsN59vNeQQRf+KnH/8ahe8KQ8X3jCRcEwryWMYPEPbtgwZ
   BObFHmAB9eO0BI5WXaqYel7j4+HPVav3IS70grwEkG2y82+vFM0Qw84hL
   KD8ZgEPQeTeqDCS7/yOvRM6KrCoK4Kv0c6hnX6sBxQFVnYaN0r9tTEmCB
   sWrXyYaPDy7rTX+rVc3ZUPAyyI1StWO04aoxcpzQ0HWB3O9EkryNKpq6a
   BBCf9KnUk8BgnxFDQYdXO8P1uns9vwPEdDWMFcT0w/0PFGCkGng6I4R+A
   g==;
X-CSE-ConnectionGUID: epONrUvgRw2pkVjKbISrgg==
X-CSE-MsgGUID: NHno+zSJTwyGLDxibxl2Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21351848"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="21351848"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 00:18:09 -0700
X-CSE-ConnectionGUID: FdaLk54YSqWK5j5DEzFQag==
X-CSE-MsgGUID: w837B2o2TEqhkGwTR6h87w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="80356598"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.245.150.149])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 00:18:02 -0700
Message-ID: <173460a6-7f99-4b3f-8402-afa7c43911f9@intel.com>
Date: Thu, 8 Aug 2024 10:17:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] mmc: sdhci-of-dwcmshc: add common bulk optional
 clocks support
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
 <e57e8c51da81f176b49608269a884f840903e78e.1722847198.git.unicorn_wang@outlook.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <e57e8c51da81f176b49608269a884f840903e78e.1722847198.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_001812_641458_FD7F8D1F 
X-CRM114-Status: GOOD (  23.28  )
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

On 5/08/24 12:17, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> In addition to the required core clock and optional
> bus clock, the soc will expand its own clocks, so
> the bulk clock mechanism is abstracted.
> 
> Note, I call the bulk clocks as "other clocks" due
> to the bus clock has been called as "optional".
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> Tested-by: Drew Fustini <drew@pdp7.com> # TH1520
> Tested-by: Inochi Amaoto <inochiama@outlook.com> # Duo and Huashan Pi

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci-of-dwcmshc.c | 90 +++++++++++++++--------------
>  1 file changed, 48 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
> index e79aa4b3b6c3..35401616fb2e 100644
> --- a/drivers/mmc/host/sdhci-of-dwcmshc.c
> +++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
> @@ -108,7 +108,6 @@
>  #define DLL_LOCK_WO_TMOUT(x) \
>  	((((x) & DWCMSHC_EMMC_DLL_LOCKED) == DWCMSHC_EMMC_DLL_LOCKED) && \
>  	(((x) & DWCMSHC_EMMC_DLL_TIMEOUT) == 0))
> -#define RK35xx_MAX_CLKS 3
>  
>  /* PHY register area pointer */
>  #define DWC_MSHC_PTR_PHY_R	0x300
> @@ -199,23 +198,54 @@ enum dwcmshc_rk_type {
>  };
>  
>  struct rk35xx_priv {
> -	/* Rockchip specified optional clocks */
> -	struct clk_bulk_data rockchip_clks[RK35xx_MAX_CLKS];
>  	struct reset_control *reset;
>  	enum dwcmshc_rk_type devtype;
>  	u8 txclk_tapnum;
>  };
>  
> +#define DWCMSHC_MAX_OTHER_CLKS 3
> +
>  struct dwcmshc_priv {
>  	struct clk	*bus_clk;
>  	int vendor_specific_area1; /* P_VENDOR_SPECIFIC_AREA1 reg */
>  	int vendor_specific_area2; /* P_VENDOR_SPECIFIC_AREA2 reg */
>  
> +	int num_other_clks;
> +	struct clk_bulk_data other_clks[DWCMSHC_MAX_OTHER_CLKS];
> +
>  	void *priv; /* pointer to SoC private stuff */
>  	u16 delay_line;
>  	u16 flags;
>  };
>  
> +static int dwcmshc_get_enable_other_clks(struct device *dev,
> +					 struct dwcmshc_priv *priv,
> +					 int num_clks,
> +					 const char * const clk_ids[])
> +{
> +	int err;
> +
> +	if (num_clks > DWCMSHC_MAX_OTHER_CLKS)
> +		return -EINVAL;
> +
> +	for (int i = 0; i < num_clks; i++)
> +		priv->other_clks[i].id = clk_ids[i];
> +
> +	err = devm_clk_bulk_get_optional(dev, num_clks, priv->other_clks);
> +	if (err) {
> +		dev_err(dev, "failed to get clocks %d\n", err);
> +		return err;
> +	}
> +
> +	err = clk_bulk_prepare_enable(num_clks, priv->other_clks);
> +	if (err)
> +		dev_err(dev, "failed to enable clocks %d\n", err);
> +
> +	priv->num_other_clks = num_clks;
> +
> +	return err;
> +}
> +
>  /*
>   * If DMA addr spans 128MB boundary, we split the DMA transfer into two
>   * so that each DMA transfer doesn't exceed the boundary.
> @@ -1036,8 +1066,9 @@ static void dwcmshc_cqhci_init(struct sdhci_host *host, struct platform_device *
>  
>  static int dwcmshc_rk35xx_init(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
>  {
> -	int err;
> +	static const char * const clk_ids[] = {"axi", "block", "timer"};
>  	struct rk35xx_priv *priv = dwc_priv->priv;
> +	int err;
>  
>  	priv->reset = devm_reset_control_array_get_optional_exclusive(mmc_dev(host->mmc));
>  	if (IS_ERR(priv->reset)) {
> @@ -1046,21 +1077,10 @@ static int dwcmshc_rk35xx_init(struct sdhci_host *host, struct dwcmshc_priv *dwc
>  		return err;
>  	}
>  
> -	priv->rockchip_clks[0].id = "axi";
> -	priv->rockchip_clks[1].id = "block";
> -	priv->rockchip_clks[2].id = "timer";
> -	err = devm_clk_bulk_get_optional(mmc_dev(host->mmc), RK35xx_MAX_CLKS,
> -					 priv->rockchip_clks);
> -	if (err) {
> -		dev_err(mmc_dev(host->mmc), "failed to get clocks %d\n", err);
> -		return err;
> -	}
> -
> -	err = clk_bulk_prepare_enable(RK35xx_MAX_CLKS, priv->rockchip_clks);
> -	if (err) {
> -		dev_err(mmc_dev(host->mmc), "failed to enable clocks %d\n", err);
> +	err = dwcmshc_get_enable_other_clks(mmc_dev(host->mmc), dwc_priv,
> +					    ARRAY_SIZE(clk_ids), clk_ids);
> +	if (err)
>  		return err;
> -	}
>  
>  	if (of_property_read_u8(mmc_dev(host->mmc)->of_node, "rockchip,txclk-tapnum",
>  				&priv->txclk_tapnum))
> @@ -1280,9 +1300,7 @@ static int dwcmshc_probe(struct platform_device *pdev)
>  err_clk:
>  	clk_disable_unprepare(pltfm_host->clk);
>  	clk_disable_unprepare(priv->bus_clk);
> -	if (rk_priv)
> -		clk_bulk_disable_unprepare(RK35xx_MAX_CLKS,
> -					   rk_priv->rockchip_clks);
> +	clk_bulk_disable_unprepare(priv->num_other_clks, priv->other_clks);
>  free_pltfm:
>  	sdhci_pltfm_free(pdev);
>  	return err;
> @@ -1304,7 +1322,6 @@ static void dwcmshc_remove(struct platform_device *pdev)
>  	struct sdhci_host *host = platform_get_drvdata(pdev);
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>  	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
> -	struct rk35xx_priv *rk_priv = priv->priv;
>  
>  	pm_runtime_get_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> @@ -1316,9 +1333,7 @@ static void dwcmshc_remove(struct platform_device *pdev)
>  
>  	clk_disable_unprepare(pltfm_host->clk);
>  	clk_disable_unprepare(priv->bus_clk);
> -	if (rk_priv)
> -		clk_bulk_disable_unprepare(RK35xx_MAX_CLKS,
> -					   rk_priv->rockchip_clks);
> +	clk_bulk_disable_unprepare(priv->num_other_clks, priv->other_clks);
>  	sdhci_pltfm_free(pdev);
>  }
>  
> @@ -1328,7 +1343,6 @@ static int dwcmshc_suspend(struct device *dev)
>  	struct sdhci_host *host = dev_get_drvdata(dev);
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>  	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
> -	struct rk35xx_priv *rk_priv = priv->priv;
>  	int ret;
>  
>  	pm_runtime_resume(dev);
> @@ -1347,9 +1361,7 @@ static int dwcmshc_suspend(struct device *dev)
>  	if (!IS_ERR(priv->bus_clk))
>  		clk_disable_unprepare(priv->bus_clk);
>  
> -	if (rk_priv)
> -		clk_bulk_disable_unprepare(RK35xx_MAX_CLKS,
> -					   rk_priv->rockchip_clks);
> +	clk_bulk_disable_unprepare(priv->num_other_clks, priv->other_clks);
>  
>  	return ret;
>  }
> @@ -1359,7 +1371,6 @@ static int dwcmshc_resume(struct device *dev)
>  	struct sdhci_host *host = dev_get_drvdata(dev);
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>  	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
> -	struct rk35xx_priv *rk_priv = priv->priv;
>  	int ret;
>  
>  	ret = clk_prepare_enable(pltfm_host->clk);
> @@ -1372,29 +1383,24 @@ static int dwcmshc_resume(struct device *dev)
>  			goto disable_clk;
>  	}
>  
> -	if (rk_priv) {
> -		ret = clk_bulk_prepare_enable(RK35xx_MAX_CLKS,
> -					      rk_priv->rockchip_clks);
> -		if (ret)
> -			goto disable_bus_clk;
> -	}
> +	ret = clk_bulk_prepare_enable(priv->num_other_clks, priv->other_clks);
> +	if (ret)
> +		goto disable_bus_clk;
>  
>  	ret = sdhci_resume_host(host);
>  	if (ret)
> -		goto disable_rockchip_clks;
> +		goto disable_other_clks;
>  
>  	if (host->mmc->caps2 & MMC_CAP2_CQE) {
>  		ret = cqhci_resume(host->mmc);
>  		if (ret)
> -			goto disable_rockchip_clks;
> +			goto disable_other_clks;
>  	}
>  
>  	return 0;
>  
> -disable_rockchip_clks:
> -	if (rk_priv)
> -		clk_bulk_disable_unprepare(RK35xx_MAX_CLKS,
> -					   rk_priv->rockchip_clks);
> +disable_other_clks:
> +	clk_bulk_disable_unprepare(priv->num_other_clks, priv->other_clks);
>  disable_bus_clk:
>  	if (!IS_ERR(priv->bus_clk))
>  		clk_disable_unprepare(priv->bus_clk);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
