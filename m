Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF50C52D73
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2024 07:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GJ+/xkwnnum3xfjvH2MMfGTwy6+WA/1dxeSFNxlOBog=; b=oUQ5ZRx/TrHTxL
	LXxT92+E+KcfUZhWzK5YxFJhX67ey1wrKMxY7GLO6rthuKVbMvKi27fbIBXf/LAtFWioEyeQ2h0f3
	RuO0juTfifNPFwNj4ZrweffoXzBPU9EE3Aa2iAimIyMQtm0v19SM282oj/A5triuz2H5ac7W/HrUh
	lzuQIeRlgehyyvfeuvt9mIbe8pwzNrFB7EzLqR5HtMcrwP7Oo98PQtVcso1iKajq8ME+zKCJhx38k
	oTVP8naOunlqEPf/ZDIkyHvKg71mcEBnhy39JB6l/xQSmjaszcaPySzC1lfq8MpdsYIkiIQfMGu+f
	8eA4/FY/vxO1/uV9eFqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbxeG-00000007R2i-1loo;
	Thu, 08 Aug 2024 07:33:24 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbxRI-00000007NDT-2xb0
	for linux-riscv@lists.infradead.org;
	Thu, 08 Aug 2024 07:20:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723101601; x=1754637601;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wxcgCBOimKAD4jUkdWEqChnDm5Iep6D0bqcnGk9a604=;
  b=Ren4Jb1b6zT+Wxxh7+jDCbpf1g77lFx5G7iPvxjRt/iAvCRJ4zfiahE5
   H/mJC3uJen2//4XA36J1mmQqYiwWbfhaZOLqa4ARQB+MfeebqOGyTe/uA
   Eyy7WDHUXnsuxNu5N+HS4bzZQYo/abNbkX5cNMYfexl5QCpP0LW7NfUgg
   sPCzfEbqPSyPrPzovD/yNOh549aAdU1Qmm6YWdUV0J03DhyGOkBOuB9rN
   LZGaTdVxPha8oEwXMJTQb9fx6fsrUmbTyh4O1/jUmz5kNHKXvSMhbhx7D
   HU9dLHXD/x0r2V0OS9j/DWdWNTwaK8I7Q0c3ClnX8G06aDuXWJRtPE+E/
   g==;
X-CSE-ConnectionGUID: qTycy/QoRjitV6pi1/62ng==
X-CSE-MsgGUID: RgRkmM0FQ2+0hyFYbUoK5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="38717166"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="38717166"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 00:20:00 -0700
X-CSE-ConnectionGUID: ZN4ej1yBTdiS48l9s30F4w==
X-CSE-MsgGUID: qNA912EzR/2GnojYfNPF5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="57365976"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.245.150.149])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 00:19:52 -0700
Message-ID: <41fd12ad-a341-45c1-8760-9ac712564c56@intel.com>
Date: Thu, 8 Aug 2024 10:19:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/8] mmc: sdhci-of-dwcmshc: Add support for Sophgo
 SG2042
To: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
 conor+dt@kernel.org, guoren@kernel.org, inochiama@outlook.com,
 jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh@kernel.org, ulf.hansson@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org,
 chao.wei@sophgo.com, haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com,
 tingzhu.wang@sophgo.com
Cc: Chen Wang <unicorn_wang@outlook.com>
References: <cover.1722847198.git.unicorn_wang@outlook.com>
 <eb21847528a6487af54bb80f1ce94adff289cdb0.1722847198.git.unicorn_wang@outlook.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <eb21847528a6487af54bb80f1ce94adff289cdb0.1722847198.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_002000_798342_68E52C85 
X-CRM114-Status: GOOD (  22.24  )
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

On 5/08/24 12:19, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add support for the mmc controller of Sophgo SG2042.
> 
> SG2042 uses Synopsys PHY the same as TH1520 so we reuse the tuning
> logic from TH1520. Besides this, this patch implement some SG2042
> specific work, such as clocks and reset ops.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci-of-dwcmshc.c | 125 ++++++++++++++++++++++++++--
>  1 file changed, 118 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
> index 16f420994519..ba8960d8b2d4 100644
> --- a/drivers/mmc/host/sdhci-of-dwcmshc.c
> +++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
> @@ -113,12 +113,15 @@
>  #define DWC_MSHC_PTR_PHY_R	0x300
>  
>  /* PHY general configuration */
> -#define PHY_CNFG_R		(DWC_MSHC_PTR_PHY_R + 0x00)
> -#define PHY_CNFG_RSTN_DEASSERT	0x1  /* Deassert PHY reset */
> -#define PHY_CNFG_PAD_SP_MASK	GENMASK(19, 16) /* bits [19:16] */
> -#define PHY_CNFG_PAD_SP		0x0c /* PMOS TX drive strength */
> -#define PHY_CNFG_PAD_SN_MASK	GENMASK(23, 20) /* bits [23:20] */
> -#define PHY_CNFG_PAD_SN		0x0c /* NMOS TX drive strength */
> +#define PHY_CNFG_R			(DWC_MSHC_PTR_PHY_R + 0x00)
> +#define PHY_CNFG_RSTN_DEASSERT		0x1  /* Deassert PHY reset */
> +#define PHY_CNFG_PHY_PWRGOOD_MASK	BIT_MASK(1) /* bit [1] */
> +#define PHY_CNFG_PAD_SP_MASK		GENMASK(19, 16) /* bits [19:16] */
> +#define PHY_CNFG_PAD_SP			0x0c /* PMOS TX drive strength */
> +#define PHY_CNFG_PAD_SP_SG2042		0x09 /* PMOS TX drive strength for SG2042 */
> +#define PHY_CNFG_PAD_SN_MASK		GENMASK(23, 20) /* bits [23:20] */
> +#define PHY_CNFG_PAD_SN			0x0c /* NMOS TX drive strength */
> +#define PHY_CNFG_PAD_SN_SG2042		0x08 /* NMOS TX drive strength for SG2042 */
>  
>  /* PHY command/response pad settings */
>  #define PHY_CMDPAD_CNFG_R	(DWC_MSHC_PTR_PHY_R + 0x04)
> @@ -147,10 +150,12 @@
>  #define PHY_PAD_TXSLEW_CTRL_P		0x3 /* Slew control for P-Type pad TX */
>  #define PHY_PAD_TXSLEW_CTRL_N_MASK	GENMASK(12, 9) /* bits [12:9] */
>  #define PHY_PAD_TXSLEW_CTRL_N		0x3 /* Slew control for N-Type pad TX */
> +#define PHY_PAD_TXSLEW_CTRL_N_SG2042	0x2 /* Slew control for N-Type pad TX for SG2042 */
>  
>  /* PHY CLK delay line settings */
>  #define PHY_SDCLKDL_CNFG_R		(DWC_MSHC_PTR_PHY_R + 0x1d)
> -#define PHY_SDCLKDL_CNFG_UPDATE	BIT(4) /* set before writing to SDCLKDL_DC */
> +#define PHY_SDCLKDL_CNFG_EXTDLY_EN	BIT(0)
> +#define PHY_SDCLKDL_CNFG_UPDATE		BIT(4) /* set before writing to SDCLKDL_DC */
>  
>  /* PHY CLK delay line delay code */
>  #define PHY_SDCLKDL_DC_R		(DWC_MSHC_PTR_PHY_R + 0x1e)
> @@ -158,10 +163,14 @@
>  #define PHY_SDCLKDL_DC_DEFAULT		0x32 /* default delay code */
>  #define PHY_SDCLKDL_DC_HS400		0x18 /* delay code for HS400 mode */
>  
> +#define PHY_SMPLDL_CNFG_R		(DWC_MSHC_PTR_PHY_R + 0x20)
> +#define PHY_SMPLDL_CNFG_BYPASS_EN	BIT(1)
> +
>  /* PHY drift_cclk_rx delay line configuration setting */
>  #define PHY_ATDL_CNFG_R			(DWC_MSHC_PTR_PHY_R + 0x21)
>  #define PHY_ATDL_CNFG_INPSEL_MASK	GENMASK(3, 2) /* bits [3:2] */
>  #define PHY_ATDL_CNFG_INPSEL		0x3 /* delay line input source */
> +#define PHY_ATDL_CNFG_INPSEL_SG2042	0x2 /* delay line input source for SG2042 */
>  
>  /* PHY DLL control settings */
>  #define PHY_DLL_CTRL_R			(DWC_MSHC_PTR_PHY_R + 0x24)
> @@ -1013,6 +1022,85 @@ static int cv18xx_sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
>  	return ret;
>  }
>  
> +static inline void sg2042_sdhci_phy_init(struct sdhci_host *host)
> +{
> +	u32 val;
> +
> +	/* Asset phy reset & set tx drive strength */
> +	val = sdhci_readl(host, PHY_CNFG_R);
> +	val &= ~PHY_CNFG_RSTN_DEASSERT;
> +	val |= FIELD_PREP(PHY_CNFG_PHY_PWRGOOD_MASK, 1);
> +	val |= FIELD_PREP(PHY_CNFG_PAD_SP_MASK, PHY_CNFG_PAD_SP_SG2042);
> +	val |= FIELD_PREP(PHY_CNFG_PAD_SN_MASK, PHY_CNFG_PAD_SN_SG2042);
> +	sdhci_writel(host, val, PHY_CNFG_R);
> +
> +	/* Configure phy pads */
> +	val = PHY_PAD_RXSEL_3V3;
> +	val |= FIELD_PREP(PHY_PAD_WEAKPULL_MASK, PHY_PAD_WEAKPULL_PULLUP);
> +	val |= FIELD_PREP(PHY_PAD_TXSLEW_CTRL_P_MASK, PHY_PAD_TXSLEW_CTRL_P);
> +	val |= FIELD_PREP(PHY_PAD_TXSLEW_CTRL_N_MASK, PHY_PAD_TXSLEW_CTRL_N_SG2042);
> +	sdhci_writew(host, val, PHY_CMDPAD_CNFG_R);
> +	sdhci_writew(host, val, PHY_DATAPAD_CNFG_R);
> +	sdhci_writew(host, val, PHY_RSTNPAD_CNFG_R);
> +
> +	val = PHY_PAD_RXSEL_3V3;
> +	val |= FIELD_PREP(PHY_PAD_TXSLEW_CTRL_P_MASK, PHY_PAD_TXSLEW_CTRL_P);
> +	val |= FIELD_PREP(PHY_PAD_TXSLEW_CTRL_N_MASK, PHY_PAD_TXSLEW_CTRL_N_SG2042);
> +	sdhci_writew(host, val, PHY_CLKPAD_CNFG_R);
> +
> +	val = PHY_PAD_RXSEL_3V3;
> +	val |= FIELD_PREP(PHY_PAD_WEAKPULL_MASK, PHY_PAD_WEAKPULL_PULLDOWN);
> +	val |= FIELD_PREP(PHY_PAD_TXSLEW_CTRL_P_MASK, PHY_PAD_TXSLEW_CTRL_P);
> +	val |= FIELD_PREP(PHY_PAD_TXSLEW_CTRL_N_MASK, PHY_PAD_TXSLEW_CTRL_N_SG2042);
> +	sdhci_writew(host, val, PHY_STBPAD_CNFG_R);
> +
> +	/* Configure delay line */
> +	/* Enable fixed delay */
> +	sdhci_writeb(host, PHY_SDCLKDL_CNFG_EXTDLY_EN, PHY_SDCLKDL_CNFG_R);
> +	/*
> +	 * Set delay line.
> +	 * Its recommended that bit UPDATE_DC[4] is 1 when SDCLKDL_DC is being written.
> +	 * Ensure UPDATE_DC[4] is '0' when not updating code.
> +	 */
> +	val = sdhci_readb(host, PHY_SDCLKDL_CNFG_R);
> +	val |= PHY_SDCLKDL_CNFG_UPDATE;
> +	sdhci_writeb(host, val, PHY_SDCLKDL_CNFG_R);
> +	/* Add 10 * 70ps = 0.7ns for output delay */
> +	sdhci_writeb(host, 10, PHY_SDCLKDL_DC_R);
> +	val = sdhci_readb(host, PHY_SDCLKDL_CNFG_R);
> +	val &= ~(PHY_SDCLKDL_CNFG_UPDATE);
> +	sdhci_writeb(host, val, PHY_SDCLKDL_CNFG_R);
> +
> +	/* Set SMPLDL_CNFG, Bypass */
> +	sdhci_writeb(host, PHY_SMPLDL_CNFG_BYPASS_EN, PHY_SMPLDL_CNFG_R);
> +
> +	/* Set ATDL_CNFG, tuning clk not use for init */
> +	val = FIELD_PREP(PHY_ATDL_CNFG_INPSEL_MASK, PHY_ATDL_CNFG_INPSEL_SG2042);
> +	sdhci_writeb(host, val, PHY_ATDL_CNFG_R);
> +
> +	/* Deasset phy reset */
> +	val = sdhci_readl(host, PHY_CNFG_R);
> +	val |= PHY_CNFG_RSTN_DEASSERT;
> +	sdhci_writel(host, val, PHY_CNFG_R);
> +}
> +
> +static void sg2042_sdhci_reset(struct sdhci_host *host, u8 mask)
> +{
> +	sdhci_reset(host, mask);
> +
> +	if (mask & SDHCI_RESET_ALL)
> +		sg2042_sdhci_phy_init(host);
> +}
> +
> +static int sg2042_init(struct device *dev, struct sdhci_host *host,
> +		       struct dwcmshc_priv *dwc_priv)
> +{
> +	static const char * const clk_ids[] = {"timer"};
> +
> +	return dwcmshc_get_enable_other_clks(mmc_dev(host->mmc), dwc_priv,
> +					     ARRAY_SIZE(clk_ids), clk_ids);
> +}
> +
>  static const struct sdhci_ops sdhci_dwcmshc_ops = {
>  	.set_clock		= sdhci_set_clock,
>  	.set_bus_width		= sdhci_set_bus_width,
> @@ -1054,6 +1142,16 @@ static const struct sdhci_ops sdhci_dwcmshc_cv18xx_ops = {
>  	.platform_execute_tuning = cv18xx_sdhci_execute_tuning,
>  };
>  
> +static const struct sdhci_ops sdhci_dwcmshc_sg2042_ops = {
> +	.set_clock		= sdhci_set_clock,
> +	.set_bus_width		= sdhci_set_bus_width,
> +	.set_uhs_signaling	= dwcmshc_set_uhs_signaling,
> +	.get_max_clock		= dwcmshc_get_max_clock,
> +	.reset			= sg2042_sdhci_reset,
> +	.adma_write_desc	= dwcmshc_adma_write_desc,
> +	.platform_execute_tuning = th1520_execute_tuning,
> +};
> +
>  static const struct dwcmshc_pltfm_data sdhci_dwcmshc_pdata = {
>  	.pdata = {
>  		.ops = &sdhci_dwcmshc_ops,
> @@ -1102,6 +1200,15 @@ static const struct dwcmshc_pltfm_data sdhci_dwcmshc_cv18xx_pdata = {
>  	},
>  };
>  
> +static const struct dwcmshc_pltfm_data sdhci_dwcmshc_sg2042_pdata = {
> +	.pdata = {
> +		.ops = &sdhci_dwcmshc_sg2042_ops,
> +		.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
> +		.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
> +	},
> +	.init = sg2042_init,
> +};
> +
>  static const struct cqhci_host_ops dwcmshc_cqhci_ops = {
>  	.enable		= dwcmshc_sdhci_cqe_enable,
>  	.disable	= sdhci_cqe_disable,
> @@ -1194,6 +1301,10 @@ static const struct of_device_id sdhci_dwcmshc_dt_ids[] = {
>  		.compatible = "thead,th1520-dwcmshc",
>  		.data = &sdhci_dwcmshc_th1520_pdata,
>  	},
> +	{
> +		.compatible = "sophgo,sg2042-dwcmshc",
> +		.data = &sdhci_dwcmshc_sg2042_pdata,
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, sdhci_dwcmshc_dt_ids);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
