Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979D4C52D7B
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2024 07:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NLwPxYkuJiv0AC24ByzJ4ZGx1r+N95wOH0F6hqXxh+4=; b=ufcNClyr8Ig/2i
	Jxf0BiJgZXVsg+mgL3Cdkg0/mEJAWEbWjK+aIidUQM3v6WZq6yUjQwLMAcZcPwM8odzRpFxT+/jZH
	mvp0eCNOg9SmMLQXl9YOG+A0tMBudFdJQCYsu3jL38bDlsvocRO9gRHFviFZWV7FPjbEupCALvtZH
	j8sNm3QrQRrxCmWLyBK7xtIdsFgGvlfc1Xqsl+zC04l4GfmnrwZxMcq8j2sF7BQMXuDtnAqMPx/LQ
	SLz/qCAPhjHnAgWHFd2SFDemp18z8ZWitd+HB85IZN6aIBjGQ5syyQYgEGjSnyt5N9veNQNHzTO5F
	1Xefdi/GIYk/p4H45nvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbxeD-00000007R0W-1f6D;
	Thu, 08 Aug 2024 07:33:21 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbxPs-00000007MeN-1XGU
	for linux-riscv@lists.infradead.org;
	Thu, 08 Aug 2024 07:18:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723101513; x=1754637513;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rGZNg5PBmivycKUoKDtf8zRVpsiIU/eF5UGG8zS0Mus=;
  b=d3alLWdVsyhncTcmvmFGUq8dmtfUceRYrAcGfFzH9R6ECIgeCC34kRyz
   LZywZ+ruYJCAPOJ0XBvXFMpO+qJA+zOFUtidsMEoloje1lL2wokp7i2JM
   ckEkVGED0sZtSRtL+zg1cehfYwFjkzj9QI30ZbRazQbHidatkvjtFQSaj
   GOTwqZqirenV70E8EblAKu13m+I4j8az1Q1SRPI5iFN6sIbpi1Wssj8To
   Fnyhk6MewgzCHMNY7sz3YaiATSvWM/G6SR8V4P3NfwuriBovKD8FmoEMl
   dMDOY2wrFUJb5b1X3BNK0t/2vwJqqy55CgoXAkjK5GaxwOM+0qwykbZwb
   A==;
X-CSE-ConnectionGUID: 92FOC8oZTW6B3pL65xHW6Q==
X-CSE-MsgGUID: oda+8/m3TsWKYzTZlx+wcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21352010"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="21352010"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 00:18:32 -0700
X-CSE-ConnectionGUID: 2fJCoyJUSUWX6IETeC9hdw==
X-CSE-MsgGUID: 6d2tdL3dRBu/ZeVYh9sjBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="80356907"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.245.150.149])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 00:18:25 -0700
Message-ID: <571dc3b1-3149-4d75-bd9a-ec1c4a9402c0@intel.com>
Date: Thu, 8 Aug 2024 10:18:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] mmc: sdhci-of-dwcmshc: move two rk35xx functions
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
 <54204702d5febd3e867eb3544c36919fe4140a88.1722847198.git.unicorn_wang@outlook.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <54204702d5febd3e867eb3544c36919fe4140a88.1722847198.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_001832_535343_528B350E 
X-CRM114-Status: GOOD (  21.32  )
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
> This patch just move dwcmshc_rk35xx_init() and
> dwcmshc_rk35xx_postinit() to put the functions
> of rk35xx together as much as possible.
> 
> This change is an intermediate process before
> further modification.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> Tested-by: Drew Fustini <drew@pdp7.com> # TH1520
> Tested-by: Inochi Amaoto <inochiama@outlook.com> # Duo and Huashan Pi

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci-of-dwcmshc.c | 90 ++++++++++++++---------------
>  1 file changed, 45 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
> index 35401616fb2e..a002636d51fd 100644
> --- a/drivers/mmc/host/sdhci-of-dwcmshc.c
> +++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
> @@ -711,6 +711,51 @@ static void rk35xx_sdhci_reset(struct sdhci_host *host, u8 mask)
>  	sdhci_reset(host, mask);
>  }
>  
> +static int dwcmshc_rk35xx_init(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
> +{
> +	static const char * const clk_ids[] = {"axi", "block", "timer"};
> +	struct rk35xx_priv *priv = dwc_priv->priv;
> +	int err;
> +
> +	priv->reset = devm_reset_control_array_get_optional_exclusive(mmc_dev(host->mmc));
> +	if (IS_ERR(priv->reset)) {
> +		err = PTR_ERR(priv->reset);
> +		dev_err(mmc_dev(host->mmc), "failed to get reset control %d\n", err);
> +		return err;
> +	}
> +
> +	err = dwcmshc_get_enable_other_clks(mmc_dev(host->mmc), dwc_priv,
> +					    ARRAY_SIZE(clk_ids), clk_ids);
> +	if (err)
> +		return err;
> +
> +	if (of_property_read_u8(mmc_dev(host->mmc)->of_node, "rockchip,txclk-tapnum",
> +				&priv->txclk_tapnum))
> +		priv->txclk_tapnum = DLL_TXCLK_TAPNUM_DEFAULT;
> +
> +	/* Disable cmd conflict check */
> +	sdhci_writel(host, 0x0, dwc_priv->vendor_specific_area1 + DWCMSHC_HOST_CTRL3);
> +	/* Reset previous settings */
> +	sdhci_writel(host, 0, DWCMSHC_EMMC_DLL_TXCLK);
> +	sdhci_writel(host, 0, DWCMSHC_EMMC_DLL_STRBIN);
> +
> +	return 0;
> +}
> +
> +static void dwcmshc_rk35xx_postinit(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
> +{
> +	/*
> +	 * Don't support highspeed bus mode with low clk speed as we
> +	 * cannot use DLL for this condition.
> +	 */
> +	if (host->mmc->f_max <= 52000000) {
> +		dev_info(mmc_dev(host->mmc), "Disabling HS200/HS400, frequency too low (%d)\n",
> +			 host->mmc->f_max);
> +		host->mmc->caps2 &= ~(MMC_CAP2_HS200 | MMC_CAP2_HS400);
> +		host->mmc->caps &= ~(MMC_CAP_3_3V_DDR | MMC_CAP_1_8V_DDR);
> +	}
> +}
> +
>  static int th1520_execute_tuning(struct sdhci_host *host, u32 opcode)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> @@ -1064,51 +1109,6 @@ static void dwcmshc_cqhci_init(struct sdhci_host *host, struct platform_device *
>  	host->mmc->caps2 &= ~(MMC_CAP2_CQE | MMC_CAP2_CQE_DCMD);
>  }
>  
> -static int dwcmshc_rk35xx_init(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
> -{
> -	static const char * const clk_ids[] = {"axi", "block", "timer"};
> -	struct rk35xx_priv *priv = dwc_priv->priv;
> -	int err;
> -
> -	priv->reset = devm_reset_control_array_get_optional_exclusive(mmc_dev(host->mmc));
> -	if (IS_ERR(priv->reset)) {
> -		err = PTR_ERR(priv->reset);
> -		dev_err(mmc_dev(host->mmc), "failed to get reset control %d\n", err);
> -		return err;
> -	}
> -
> -	err = dwcmshc_get_enable_other_clks(mmc_dev(host->mmc), dwc_priv,
> -					    ARRAY_SIZE(clk_ids), clk_ids);
> -	if (err)
> -		return err;
> -
> -	if (of_property_read_u8(mmc_dev(host->mmc)->of_node, "rockchip,txclk-tapnum",
> -				&priv->txclk_tapnum))
> -		priv->txclk_tapnum = DLL_TXCLK_TAPNUM_DEFAULT;
> -
> -	/* Disable cmd conflict check */
> -	sdhci_writel(host, 0x0, dwc_priv->vendor_specific_area1 + DWCMSHC_HOST_CTRL3);
> -	/* Reset previous settings */
> -	sdhci_writel(host, 0, DWCMSHC_EMMC_DLL_TXCLK);
> -	sdhci_writel(host, 0, DWCMSHC_EMMC_DLL_STRBIN);
> -
> -	return 0;
> -}
> -
> -static void dwcmshc_rk35xx_postinit(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
> -{
> -	/*
> -	 * Don't support highspeed bus mode with low clk speed as we
> -	 * cannot use DLL for this condition.
> -	 */
> -	if (host->mmc->f_max <= 52000000) {
> -		dev_info(mmc_dev(host->mmc), "Disabling HS200/HS400, frequency too low (%d)\n",
> -			 host->mmc->f_max);
> -		host->mmc->caps2 &= ~(MMC_CAP2_HS200 | MMC_CAP2_HS400);
> -		host->mmc->caps &= ~(MMC_CAP_3_3V_DDR | MMC_CAP_1_8V_DDR);
> -	}
> -}
> -
>  static const struct of_device_id sdhci_dwcmshc_dt_ids[] = {
>  	{
>  		.compatible = "rockchip,rk3588-dwcmshc",


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
