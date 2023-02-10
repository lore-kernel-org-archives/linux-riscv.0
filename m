Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715F8C636CD
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Feb 2023 08:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ycch7crU6939u811iPmy/pQqXkbc2xNIKOmmZPHa5gU=; b=4UT0qGT1w7b7z4
	D5d1keP4feoxkZ3kwTabHXZz0eYq0hmjbsvBRLzE1gtDw/ipMLrJCdq65h3a3ADPMlhWT+fxnq5SW
	lCmyVrcnq18kZHs0PMlhfoNUV6z9WpgdWXURHEJPGeiMHiGEPvLz7tLYytdOaatsvwmSAHdy9JS2f
	5dCRH3pYTanOp7D9jhuujjl4yyhkl8D2kn5ypNKD4S/nxwfIwZ1HhjjyF0T5FcHYT+yA6Y43RHk/h
	OPhCiMTjMcRKiqWpVfBNKcXDO19GV5yIG8y4fjCeIi/TP+TsGw3r0MBO7WJh1hCupdFbwDNiXnJdt
	I0yivyLsjyA6oy8Ogmug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQPFl-004snO-Ta; Fri, 10 Feb 2023 08:59:33 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQPFi-004sll-PP
	for linux-riscv@lists.infradead.org; Fri, 10 Feb 2023 08:59:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2B22EB8240D;
	Fri, 10 Feb 2023 08:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37DC0C433EF;
	Fri, 10 Feb 2023 08:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676019567;
	bh=2Q1YlvwNymVHCAJA7z8rYoDTg4mMIzYexR8YRdQiSOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tVum6c+/+iO5J2TRKtYVj0dS32KT9pKUFl5ksEpo+9zzQ5YRroj/Mo6QN5X5lzeyj
	 5QsWaDoJp30AoY6qSWsmYJ/3TkEYulL9W2XMJMN1lh76mEIvkT80BmJPOP4s2mS9p5
	 QPALwYLrsv/WJ14bXL/o9ZF1DM5h0DaitLtAd6xc/3pln/7EkiribfanG8E1MbUw9T
	 1Ynl18jNwUPYPP0Ygyqj+cwAFrOmsN4SeFp7riRe1VbmROALJCaz3pECQa+vqKJE8N
	 nnkd2H/bCwkt/3nn/lIKzem1At+7LbXed3HtJRuRyb9Uw2m6rDbfPe099pOGaQkwP9
	 mxpb0Zir7Ibmg==
Date: Fri, 10 Feb 2023 14:29:23 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Walker Chen <walker.chen@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] dma: dw-axi-dmac: Add support for StarFive DMA
Message-ID: <Y+YHa7jVpTs9Qg73@matsya>
References: <20230206113811.23133-1-walker.chen@starfivetech.com>
 <20230206113811.23133-3-walker.chen@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230206113811.23133-3-walker.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_005931_143495_44F6343F 
X-CRM114-Status: GOOD (  23.62  )
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

On 06-02-23, 19:38, Walker Chen wrote:
> Adding DMA reset operation in device probe, and using different
> registers according to the hardware handshake number.

subsystem tag is dmaengine: xxx

> 
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> ---
>  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 25 ++++++++++++++++---
>  drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  3 +++
>  2 files changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> index a183d93bd7e2..3581810033d2 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -25,6 +25,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/property.h>
> +#include <linux/reset.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
>  
> @@ -86,7 +87,8 @@ static inline void axi_chan_config_write(struct axi_dma_chan *chan,
>  
>  	cfg_lo = (config->dst_multblk_type << CH_CFG_L_DST_MULTBLK_TYPE_POS |
>  		  config->src_multblk_type << CH_CFG_L_SRC_MULTBLK_TYPE_POS);
> -	if (chan->chip->dw->hdata->reg_map_8_channels) {
> +	if (chan->chip->dw->hdata->reg_map_8_channels &&
> +	    !chan->chip->dw->hdata->use_cfg2) {

what about older/other platforms that dont have use_cfg2?

>  		cfg_hi = config->tt_fc << CH_CFG_H_TT_FC_POS |
>  			 config->hs_sel_src << CH_CFG_H_HS_SEL_SRC_POS |
>  			 config->hs_sel_dst << CH_CFG_H_HS_SEL_DST_POS |
> @@ -541,8 +543,6 @@ static void dw_axi_dma_set_hw_channel(struct axi_dma_chan *chan, bool set)
>  			(chan->id * DMA_APB_HS_SEL_BIT_SIZE));
>  	reg_value |= (val << (chan->id * DMA_APB_HS_SEL_BIT_SIZE));
>  	lo_hi_writeq(reg_value, chip->apb_regs + DMAC_APB_HW_HS_SEL_0);
> -
> -	return;
>  }
>  
>  /*
> @@ -1136,7 +1136,7 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
>  	axi_chan_disable(chan);
>  
>  	ret = readl_poll_timeout_atomic(chan->chip->regs + DMAC_CHEN, val,
> -					!(val & chan_active), 1000, 10000);
> +					!(val & chan_active), 1000, DMAC_TIMEOUT_US);
>  	if (ret == -ETIMEDOUT)
>  		dev_warn(dchan2dev(dchan),
>  			 "%s failed to stop\n", axi_chan_name(chan));
> @@ -1323,6 +1323,12 @@ static int parse_device_properties(struct axi_dma_chip *chip)
>  
>  	chip->dw->hdata->m_data_width = tmp;
>  
> +	ret = device_property_read_u32(dev, "snps,num-hs-if", &tmp);
> +	if (!ret) {
> +		if (tmp > 16)
> +			chip->dw->hdata->use_cfg2 = true;
> +	}
> +
>  	ret = device_property_read_u32_array(dev, "snps,block-size", carr,
>  					     chip->dw->hdata->nr_channels);
>  	if (ret)
> @@ -1410,6 +1416,16 @@ static int dw_probe(struct platform_device *pdev)
>  	if (IS_ERR(chip->cfgr_clk))
>  		return PTR_ERR(chip->cfgr_clk);
>  
> +	if (of_device_is_compatible(node, "starfive,axi-dma")) {
> +		chip->resets = devm_reset_control_array_get_exclusive(&pdev->dev);
> +		if (IS_ERR(chip->resets))
> +			return PTR_ERR(chip->resets);
> +
> +		ret = reset_control_deassert(chip->resets);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret = parse_device_properties(chip);
>  	if (ret)
>  		return ret;
> @@ -1554,6 +1570,7 @@ static const struct dev_pm_ops dw_axi_dma_pm_ops = {
>  static const struct of_device_id dw_dma_of_id_table[] = {
>  	{ .compatible = "snps,axi-dma-1.01a" },
>  	{ .compatible = "intel,kmb-axi-dma" },
> +	{ .compatible = "starfive,axi-dma" },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, dw_dma_of_id_table);
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> index e9d5eb0fd594..761d95691c02 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> @@ -21,6 +21,7 @@
>  #define DMAC_MAX_CHANNELS	16
>  #define DMAC_MAX_MASTERS	2
>  #define DMAC_MAX_BLK_SIZE	0x200000
> +#define DMAC_TIMEOUT_US		200000
>  
>  struct dw_axi_dma_hcfg {
>  	u32	nr_channels;
> @@ -33,6 +34,7 @@ struct dw_axi_dma_hcfg {
>  	/* Register map for DMAX_NUM_CHANNELS <= 8 */
>  	bool	reg_map_8_channels;
>  	bool	restrict_axi_burst_len;
> +	bool	use_cfg2;
>  };
>  
>  struct axi_dma_chan {
> @@ -70,6 +72,7 @@ struct axi_dma_chip {
>  	struct clk		*core_clk;
>  	struct clk		*cfgr_clk;
>  	struct dw_axi_dma	*dw;
> +	struct reset_control	*resets;
>  };
>  
>  /* LLI == Linked List Item */
> -- 
> 2.17.1

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
