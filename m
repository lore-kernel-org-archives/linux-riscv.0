Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962F0C27C75
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jun 2024 10:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V0Ze/UOTET42oEXN+TyKaxI9Kzu8+v4wwwSHbb5gF1M=; b=UUuVM7ydLJPjIm
	wBBABs/cv0pa3OOy/n34VocRhR3Iiv9bQYUzuMQ1UE4i3TgnV6zi9sMgimJMoe4+BtsDnk2v86ngC
	djV8x4GhdAnHm6J005n9OoJwK/FdHasq8jHMNT7Kld1d+4EtYYFXFdijf4S1wMttTITMFY7ld5fAG
	6TJAvsGC2krME2Ao/O1eSziTJ9iN5a9gZvudsMCNWXmQyyTAilyhSkCqI0tS5QdBGwa7TJby01dbR
	YQAK+5X7QtOCurd2jlPbaTx+/e4W/mUcL+80Z7rzYONCYkHhDRaXmibGtcYdLEfxvsXkUNqwaTUOz
	nVktIvOrXjCGFmP++xjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3zY-00000002NFZ-1sMh;
	Fri, 14 Jun 2024 10:17:08 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3zV-00000002NEw-0L37
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jun 2024 10:17:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718360225; x=1749896225;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Kp2k9QJ5A5Zl+bH/kPckSNE6AbcpyKuVP4WLhM43SMI=;
  b=dpPEl0xnMzn55+Xdohag52RsBXgNCUBD1tmlZQmt9IDAQFI2G0R7S9sk
   6CLuu2UbvS35KwuQ9iZ3iLBBvHQdUNLvmeHPh7xTCJ2yu/bol6QVO2v2r
   1nYUgqcFCuDpxuQh8RZxQ9SMEbWR5FJSZWphwMBUNHlh5yzXgi0MFG8Or
   Ns2cWiqByz8Jl7reh4h6bk+vPChYNgSKCpSELqY+QkviNvmqp9FXXGiaa
   VBL0dO3/j4cktPaoZ831xMAy/HX5Onq3oB4kmRh76wHRTAVz39GApIv9O
   UJFN8jQmY/tgMb0Rqp+vhJ9IbhztSbHNMydTIsPXgPIIP05eDGdv7MRP7
   Q==;
X-CSE-ConnectionGUID: V6fUDYPzTF6qEM1qK1NPgQ==
X-CSE-MsgGUID: 0tvQDS4MTt2M0AKUInrOaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="25814382"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="25814382"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 03:17:03 -0700
X-CSE-ConnectionGUID: a4pAfqHjSfSpLF/TWTOJZw==
X-CSE-MsgGUID: PctmzukzQXOyroOXVkz7kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="71228814"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.94.248.10])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 03:16:57 -0700
Message-ID: <6122ec89-1984-4dd7-8af6-50e2861f04d8@intel.com>
Date: Fri, 14 Jun 2024 13:16:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] mmc: sdhci-of-dwcmshc: adjust positions of helper
 routines
To: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
 conor+dt@kernel.org, guoren@kernel.org, inochiama@outlook.com,
 jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh@kernel.org, ulf.hansson@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org,
 chao.wei@sophgo.com, haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com,
 tingzhu.wang@sophgo.com
Cc: Chen Wang <unicorn_wang@outlook.com>
References: <cover.1718241495.git.unicorn_wang@outlook.com>
 <dec4798dc2728428e7468515cbf0bc87c6eff4a9.1718241495.git.unicorn_wang@outlook.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <dec4798dc2728428e7468515cbf0bc87c6eff4a9.1718241495.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_031705_246327_9DB384A3 
X-CRM114-Status: GOOD (  29.96  )
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

On 13/06/24 04:42, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> This patch does not change the logic of the code, but only adjusts
> the positions of some helper functions in the file according to
> categories to facilitate future function search and maintenance.
> 
> Category: helper functions (except for driver callback functions
> such as probe/remove/suspend/resume) are divided into two categories:
> 
> - dwcmshc level helpers
> - soc level helpers
> 
> After the adjustment, these functions will be put together according
> to category.

Please do not move any functions unless it is needed to avoid forward
declaration.

Unnecessarily churning the code makes backports more difficult and
complicates the code history, so it should be avoided in general.

> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  drivers/mmc/host/sdhci-of-dwcmshc.c | 392 +++++++++++++++-------------
>  1 file changed, 204 insertions(+), 188 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
> index e79aa4b3b6c3..a68818f53786 100644
> --- a/drivers/mmc/host/sdhci-of-dwcmshc.c
> +++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
> @@ -216,6 +216,12 @@ struct dwcmshc_priv {
>  	u16 flags;
>  };
>  
> +/*******************************************************************************
> + *
> + * dwcmshc level helper routines begin
> + *
> + ******************************************************************************/
> +
>  /*
>   * If DMA addr spans 128MB boundary, we split the DMA transfer into two
>   * so that each DMA transfer doesn't exceed the boundary.
> @@ -249,13 +255,6 @@ static unsigned int dwcmshc_get_max_clock(struct sdhci_host *host)
>  		return pltfm_host->clock;
>  }
>  
> -static unsigned int rk35xx_get_max_clock(struct sdhci_host *host)
> -{
> -	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> -
> -	return clk_round_rate(pltfm_host->clk, ULONG_MAX);
> -}
> -
>  static void dwcmshc_check_auto_cmd23(struct mmc_host *mmc,
>  				     struct mmc_request *mrq)
>  {
> @@ -377,29 +376,6 @@ static void dwcmshc_phy_3_3v_init(struct sdhci_host *host)
>  	sdhci_writeb(host, PHY_DLL_CTRL_ENABLE, PHY_DLL_CTRL_R);
>  }
>  
> -static void th1520_sdhci_set_phy(struct sdhci_host *host)
> -{
> -	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> -	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
> -	u32 emmc_caps = MMC_CAP2_NO_SD | MMC_CAP2_NO_SDIO;
> -	u16 emmc_ctrl;
> -
> -	/* Before power on, set PHY configs */
> -	if (priv->flags & FLAG_IO_FIXED_1V8)
> -		dwcmshc_phy_1_8v_init(host);
> -	else
> -		dwcmshc_phy_3_3v_init(host);
> -
> -	if ((host->mmc->caps2 & emmc_caps) == emmc_caps) {
> -		emmc_ctrl = sdhci_readw(host, priv->vendor_specific_area1 + DWCMSHC_EMMC_CONTROL);
> -		emmc_ctrl |= DWCMSHC_CARD_IS_EMMC;
> -		sdhci_writew(host, emmc_ctrl, priv->vendor_specific_area1 + DWCMSHC_EMMC_CONTROL);
> -	}
> -
> -	sdhci_writeb(host, FIELD_PREP(PHY_DLL_CNFG1_SLVDLY_MASK, PHY_DLL_CNFG1_SLVDLY) |
> -		     PHY_DLL_CNFG1_WAITCYCLE, PHY_DLL_CNFG1_R);
> -}
> -
>  static void dwcmshc_set_uhs_signaling(struct sdhci_host *host,
>  				      unsigned int timing)
>  {
> @@ -437,20 +413,6 @@ static void dwcmshc_set_uhs_signaling(struct sdhci_host *host,
>  	sdhci_writew(host, ctrl_2, SDHCI_HOST_CONTROL2);
>  }
>  
> -static void th1520_set_uhs_signaling(struct sdhci_host *host,
> -				     unsigned int timing)
> -{
> -	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> -	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
> -
> -	dwcmshc_set_uhs_signaling(host, timing);
> -	if (timing == MMC_TIMING_MMC_HS400)
> -		priv->delay_line = PHY_SDCLKDL_DC_HS400;
> -	else
> -		sdhci_writeb(host, 0, PHY_DLLDL_CNFG_R);
> -	th1520_sdhci_set_phy(host);
> -}
> -
>  static void dwcmshc_hs400_enhanced_strobe(struct mmc_host *mmc,
>  					  struct mmc_ios *ios)
>  {
> @@ -553,6 +515,112 @@ static void dwcmshc_cqhci_dumpregs(struct mmc_host *mmc)
>  	sdhci_dumpregs(mmc_priv(mmc));
>  }
>  
> +static const struct cqhci_host_ops dwcmshc_cqhci_ops = {
> +	.enable		= dwcmshc_sdhci_cqe_enable,
> +	.disable	= sdhci_cqe_disable,
> +	.dumpregs	= dwcmshc_cqhci_dumpregs,
> +	.set_tran_desc	= dwcmshc_set_tran_desc,
> +};
> +
> +static void dwcmshc_cqhci_init(struct sdhci_host *host, struct platform_device *pdev)
> +{
> +	struct cqhci_host *cq_host;
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
> +	bool dma64 = false;
> +	u16 clk;
> +	int err;
> +
> +	host->mmc->caps2 |= MMC_CAP2_CQE | MMC_CAP2_CQE_DCMD;
> +	cq_host = devm_kzalloc(&pdev->dev, sizeof(*cq_host), GFP_KERNEL);
> +	if (!cq_host) {
> +		dev_err(mmc_dev(host->mmc), "Unable to setup CQE: not enough memory\n");
> +		goto dsbl_cqe_caps;
> +	}
> +
> +	/*
> +	 * For dwcmshc host controller we have to enable internal clock
> +	 * before access to some registers from Vendor Specific Area 2.
> +	 */
> +	clk = sdhci_readw(host, SDHCI_CLOCK_CONTROL);
> +	clk |= SDHCI_CLOCK_INT_EN;
> +	sdhci_writew(host, clk, SDHCI_CLOCK_CONTROL);
> +	clk = sdhci_readw(host, SDHCI_CLOCK_CONTROL);
> +	if (!(clk & SDHCI_CLOCK_INT_EN)) {
> +		dev_err(mmc_dev(host->mmc), "Unable to setup CQE: internal clock enable error\n");
> +		goto free_cq_host;
> +	}
> +
> +	cq_host->mmio = host->ioaddr + priv->vendor_specific_area2;
> +	cq_host->ops = &dwcmshc_cqhci_ops;
> +
> +	/* Enable using of 128-bit task descriptors */
> +	dma64 = host->flags & SDHCI_USE_64_BIT_DMA;
> +	if (dma64) {
> +		dev_dbg(mmc_dev(host->mmc), "128-bit task descriptors\n");
> +		cq_host->caps |= CQHCI_TASK_DESC_SZ_128;
> +	}
> +	err = cqhci_init(cq_host, host->mmc, dma64);
> +	if (err) {
> +		dev_err(mmc_dev(host->mmc), "Unable to setup CQE: error %d\n", err);
> +		goto int_clock_disable;
> +	}
> +
> +	dev_dbg(mmc_dev(host->mmc), "CQE init done\n");
> +
> +	return;
> +
> +int_clock_disable:
> +	clk = sdhci_readw(host, SDHCI_CLOCK_CONTROL);
> +	clk &= ~SDHCI_CLOCK_INT_EN;
> +	sdhci_writew(host, clk, SDHCI_CLOCK_CONTROL);
> +
> +free_cq_host:
> +	devm_kfree(&pdev->dev, cq_host);
> +
> +dsbl_cqe_caps:
> +	host->mmc->caps2 &= ~(MMC_CAP2_CQE | MMC_CAP2_CQE_DCMD);
> +}
> +
> +static void dwcmshc_disable_card_clk(struct sdhci_host *host)
> +{
> +	u16 ctrl;
> +
> +	ctrl = sdhci_readw(host, SDHCI_CLOCK_CONTROL);
> +	if (ctrl & SDHCI_CLOCK_CARD_EN) {
> +		ctrl &= ~SDHCI_CLOCK_CARD_EN;
> +		sdhci_writew(host, ctrl, SDHCI_CLOCK_CONTROL);
> +	}
> +}
> +
> +#ifdef CONFIG_PM
> +
> +static void dwcmshc_enable_card_clk(struct sdhci_host *host)
> +{
> +	u16 ctrl;
> +
> +	ctrl = sdhci_readw(host, SDHCI_CLOCK_CONTROL);
> +	if ((ctrl & SDHCI_CLOCK_INT_EN) && !(ctrl & SDHCI_CLOCK_CARD_EN)) {
> +		ctrl |= SDHCI_CLOCK_CARD_EN;
> +		sdhci_writew(host, ctrl, SDHCI_CLOCK_CONTROL);
> +	}
> +}
> +
> +#endif
> +
> +/*******************************************************************************
> + *
> + * SoC level helper routines begin
> + *
> + ******************************************************************************/
> +
> +static unsigned int rk35xx_get_max_clock(struct sdhci_host *host)
> +{
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +
> +	return clk_round_rate(pltfm_host->clk, ULONG_MAX);
> +}
> +
>  static void dwcmshc_rk3568_set_clock(struct sdhci_host *host, unsigned int clock)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> @@ -681,6 +749,98 @@ static void rk35xx_sdhci_reset(struct sdhci_host *host, u8 mask)
>  	sdhci_reset(host, mask);
>  }
>  
> +static int dwcmshc_rk35xx_init(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
> +{
> +	int err;
> +	struct rk35xx_priv *priv = dwc_priv->priv;
> +
> +	priv->reset = devm_reset_control_array_get_optional_exclusive(mmc_dev(host->mmc));
> +	if (IS_ERR(priv->reset)) {
> +		err = PTR_ERR(priv->reset);
> +		dev_err(mmc_dev(host->mmc), "failed to get reset control %d\n", err);
> +		return err;
> +	}
> +
> +	priv->rockchip_clks[0].id = "axi";
> +	priv->rockchip_clks[1].id = "block";
> +	priv->rockchip_clks[2].id = "timer";
> +	err = devm_clk_bulk_get_optional(mmc_dev(host->mmc), RK35xx_MAX_CLKS,
> +					 priv->rockchip_clks);
> +	if (err) {
> +		dev_err(mmc_dev(host->mmc), "failed to get clocks %d\n", err);
> +		return err;
> +	}
> +
> +	err = clk_bulk_prepare_enable(RK35xx_MAX_CLKS, priv->rockchip_clks);
> +	if (err) {
> +		dev_err(mmc_dev(host->mmc), "failed to enable clocks %d\n", err);
> +		return err;
> +	}
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
> +static void th1520_sdhci_set_phy(struct sdhci_host *host)
> +{
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
> +	u32 emmc_caps = MMC_CAP2_NO_SD | MMC_CAP2_NO_SDIO;
> +	u16 emmc_ctrl;
> +
> +	/* Before power on, set PHY configs */
> +	if (priv->flags & FLAG_IO_FIXED_1V8)
> +		dwcmshc_phy_1_8v_init(host);
> +	else
> +		dwcmshc_phy_3_3v_init(host);
> +
> +	if ((host->mmc->caps2 & emmc_caps) == emmc_caps) {
> +		emmc_ctrl = sdhci_readw(host, priv->vendor_specific_area1 + DWCMSHC_EMMC_CONTROL);
> +		emmc_ctrl |= DWCMSHC_CARD_IS_EMMC;
> +		sdhci_writew(host, emmc_ctrl, priv->vendor_specific_area1 + DWCMSHC_EMMC_CONTROL);
> +	}
> +
> +	sdhci_writeb(host, FIELD_PREP(PHY_DLL_CNFG1_SLVDLY_MASK, PHY_DLL_CNFG1_SLVDLY) |
> +		     PHY_DLL_CNFG1_WAITCYCLE, PHY_DLL_CNFG1_R);
> +}
> +
> +static void th1520_set_uhs_signaling(struct sdhci_host *host,
> +				     unsigned int timing)
> +{
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
> +
> +	dwcmshc_set_uhs_signaling(host, timing);
> +	if (timing == MMC_TIMING_MMC_HS400)
> +		priv->delay_line = PHY_SDCLKDL_DC_HS400;
> +	else
> +		sdhci_writeb(host, 0, PHY_DLLDL_CNFG_R);
> +	th1520_sdhci_set_phy(host);
> +}
> +
>  static int th1520_execute_tuning(struct sdhci_host *host, u32 opcode)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> @@ -967,128 +1127,6 @@ static const struct sdhci_pltfm_data sdhci_dwcmshc_cv18xx_pdata = {
>  	.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
>  };
>  
> -static const struct cqhci_host_ops dwcmshc_cqhci_ops = {
> -	.enable		= dwcmshc_sdhci_cqe_enable,
> -	.disable	= sdhci_cqe_disable,
> -	.dumpregs	= dwcmshc_cqhci_dumpregs,
> -	.set_tran_desc	= dwcmshc_set_tran_desc,
> -};
> -
> -static void dwcmshc_cqhci_init(struct sdhci_host *host, struct platform_device *pdev)
> -{
> -	struct cqhci_host *cq_host;
> -	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> -	struct dwcmshc_priv *priv = sdhci_pltfm_priv(pltfm_host);
> -	bool dma64 = false;
> -	u16 clk;
> -	int err;
> -
> -	host->mmc->caps2 |= MMC_CAP2_CQE | MMC_CAP2_CQE_DCMD;
> -	cq_host = devm_kzalloc(&pdev->dev, sizeof(*cq_host), GFP_KERNEL);
> -	if (!cq_host) {
> -		dev_err(mmc_dev(host->mmc), "Unable to setup CQE: not enough memory\n");
> -		goto dsbl_cqe_caps;
> -	}
> -
> -	/*
> -	 * For dwcmshc host controller we have to enable internal clock
> -	 * before access to some registers from Vendor Specific Area 2.
> -	 */
> -	clk = sdhci_readw(host, SDHCI_CLOCK_CONTROL);
> -	clk |= SDHCI_CLOCK_INT_EN;
> -	sdhci_writew(host, clk, SDHCI_CLOCK_CONTROL);
> -	clk = sdhci_readw(host, SDHCI_CLOCK_CONTROL);
> -	if (!(clk & SDHCI_CLOCK_INT_EN)) {
> -		dev_err(mmc_dev(host->mmc), "Unable to setup CQE: internal clock enable error\n");
> -		goto free_cq_host;
> -	}
> -
> -	cq_host->mmio = host->ioaddr + priv->vendor_specific_area2;
> -	cq_host->ops = &dwcmshc_cqhci_ops;
> -
> -	/* Enable using of 128-bit task descriptors */
> -	dma64 = host->flags & SDHCI_USE_64_BIT_DMA;
> -	if (dma64) {
> -		dev_dbg(mmc_dev(host->mmc), "128-bit task descriptors\n");
> -		cq_host->caps |= CQHCI_TASK_DESC_SZ_128;
> -	}
> -	err = cqhci_init(cq_host, host->mmc, dma64);
> -	if (err) {
> -		dev_err(mmc_dev(host->mmc), "Unable to setup CQE: error %d\n", err);
> -		goto int_clock_disable;
> -	}
> -
> -	dev_dbg(mmc_dev(host->mmc), "CQE init done\n");
> -
> -	return;
> -
> -int_clock_disable:
> -	clk = sdhci_readw(host, SDHCI_CLOCK_CONTROL);
> -	clk &= ~SDHCI_CLOCK_INT_EN;
> -	sdhci_writew(host, clk, SDHCI_CLOCK_CONTROL);
> -
> -free_cq_host:
> -	devm_kfree(&pdev->dev, cq_host);
> -
> -dsbl_cqe_caps:
> -	host->mmc->caps2 &= ~(MMC_CAP2_CQE | MMC_CAP2_CQE_DCMD);
> -}
> -
> -static int dwcmshc_rk35xx_init(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
> -{
> -	int err;
> -	struct rk35xx_priv *priv = dwc_priv->priv;
> -
> -	priv->reset = devm_reset_control_array_get_optional_exclusive(mmc_dev(host->mmc));
> -	if (IS_ERR(priv->reset)) {
> -		err = PTR_ERR(priv->reset);
> -		dev_err(mmc_dev(host->mmc), "failed to get reset control %d\n", err);
> -		return err;
> -	}
> -
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
> -		return err;
> -	}
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
> @@ -1288,17 +1326,6 @@ static int dwcmshc_probe(struct platform_device *pdev)
>  	return err;
>  }
>  
> -static void dwcmshc_disable_card_clk(struct sdhci_host *host)
> -{
> -	u16 ctrl;
> -
> -	ctrl = sdhci_readw(host, SDHCI_CLOCK_CONTROL);
> -	if (ctrl & SDHCI_CLOCK_CARD_EN) {
> -		ctrl &= ~SDHCI_CLOCK_CARD_EN;
> -		sdhci_writew(host, ctrl, SDHCI_CLOCK_CONTROL);
> -	}
> -}
> -
>  static void dwcmshc_remove(struct platform_device *pdev)
>  {
>  	struct sdhci_host *host = platform_get_drvdata(pdev);
> @@ -1406,17 +1433,6 @@ static int dwcmshc_resume(struct device *dev)
>  
>  #ifdef CONFIG_PM
>  
> -static void dwcmshc_enable_card_clk(struct sdhci_host *host)
> -{
> -	u16 ctrl;
> -
> -	ctrl = sdhci_readw(host, SDHCI_CLOCK_CONTROL);
> -	if ((ctrl & SDHCI_CLOCK_INT_EN) && !(ctrl & SDHCI_CLOCK_CARD_EN)) {
> -		ctrl |= SDHCI_CLOCK_CARD_EN;
> -		sdhci_writew(host, ctrl, SDHCI_CLOCK_CONTROL);
> -	}
> -}
> -
>  static int dwcmshc_runtime_suspend(struct device *dev)
>  {
>  	struct sdhci_host *host = dev_get_drvdata(dev);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
