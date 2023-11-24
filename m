Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96430C61DF4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 12:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t2ifdqIpOj7zdRXRY3Kai+N4OdP8b5MHklqTnTujAkc=; b=3f9jUNyfY7k4f4
	xGGVcZJe6Ka7hW0bb6sH8ZxeNIJxwVSeA3syM86ARLequNn+b6MEA14w5V9SiCvOsPvh8Xg6/qhq0
	T0T+UJZtJbKlSj3JtoY8+VtZAe2sNq6SJ5elvC6BgDI+iUejWrmpIs87ZyXi7NDwvBAupyKs09UBk
	ZjQfbJ9jK5Vc078qbTSCi6euoiPVUBFDGfsb6wmhE5ZbzFh2rI1uCy9YBlv6y8d0Jp0Nr/fZznVME
	Tr4UDQda1Bl0uiMH7tO85VQlxlmVCxfWu5A0c1A6hdyqSMVwFoFNVlCokd9NzCIEUSe6F2Y5G6+rX
	y7IskerDhtFlJpQbCEGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6V28-007AkC-2A;
	Fri, 24 Nov 2023 12:11:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6V25-007Ajf-1M
	for linux-riscv@lists.infradead.org;
	Fri, 24 Nov 2023 12:11:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 91651621E0;
	Fri, 24 Nov 2023 12:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98825C433C8;
	Fri, 24 Nov 2023 12:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700827900;
	bh=hUSNeT8w2Ovv/qRsF9dJwQ3T21rZ7awLhr/c8/siSeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FjFsjhJcdh1kjeVJRqLvqBmHLs4+QeKFabtHHpvqWZ/Boaf/jqKpCKggvUdVkb9tV
	 /D8tU/7yDwqTsja4jZ97ifEMOtJkfWivJYMBG2+OJSoH5QwvtIkdVX90YO2Sf6cXgp
	 fh2HSVF5TWjSpwo4m1NRsSyrRUTWBYGL7ckc5Yz5P0Ki7Ti32oLYQ4wf/QS9Z0SHEf
	 15DHso6QUEGOZWQAijtG+krZPUHaPQqUOZv62NK0OqCgpCzvR8xN+rKzc1QDEoAuH7
	 qTCfwM4IgXEdLA/ZtD7XBr8P+pIljJZhK8p0+2iMB0U8JCGm4YojupWhaj8FknLrKX
	 OXjM3MGXJ9IKw==
Date: Fri, 24 Nov 2023 17:41:36 +0530
From: Vinod Koul <vkoul@kernel.org>
To: shravan chippa <shravan.chippa@microchip.com>
Cc: green.wan@sifive.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, conor+dt@kernel.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	nagasuresh.relli@microchip.com, praveen.kumar@microchip.com,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v4 3/4] dmaengine: sf-pdma: add mpfs-pdma compatible name
Message-ID: <ZWCS+ECGTgwVPR1u@matsya>
References: <20231031052753.3430169-1-shravan.chippa@microchip.com>
 <20231031052753.3430169-4-shravan.chippa@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231031052753.3430169-4-shravan.chippa@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_041141_544942_51FDC5DC 
X-CRM114-Status: GOOD (  21.54  )
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

On 31-10-23, 10:57, shravan chippa wrote:
> From: Shravan Chippa <shravan.chippa@microchip.com>
> 
> Sifive platform dma does not allow out-of-order transfers,
> Add a PolarFire SoC specific compatible and code to support
> for out-of-order dma transfers

By default dma xtions are not supposed to be out of order, so why does
it make sense specifying that here?

> 
> Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> ---
>  drivers/dma/sf-pdma/sf-pdma.c | 27 ++++++++++++++++++++++++---
>  drivers/dma/sf-pdma/sf-pdma.h |  8 +++++++-
>  2 files changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
> index 4c456bdef882..82ab12c40743 100644
> --- a/drivers/dma/sf-pdma/sf-pdma.c
> +++ b/drivers/dma/sf-pdma/sf-pdma.c
> @@ -25,6 +25,8 @@
>  
>  #include "sf-pdma.h"
>  
> +#define PDMA_QUIRK_NO_STRICT_ORDERING   BIT(0)
> +
>  #ifndef readq
>  static inline unsigned long long readq(void __iomem *addr)
>  {
> @@ -66,7 +68,7 @@ static struct sf_pdma_desc *sf_pdma_alloc_desc(struct sf_pdma_chan *chan)
>  static void sf_pdma_fill_desc(struct sf_pdma_desc *desc,
>  			      u64 dst, u64 src, u64 size)
>  {
> -	desc->xfer_type = PDMA_FULL_SPEED;
> +	desc->xfer_type =  desc->chan->pdma->transfer_type;
>  	desc->xfer_size = size;
>  	desc->dst_addr = dst;
>  	desc->src_addr = src;
> @@ -520,6 +522,7 @@ static struct dma_chan *sf_pdma_of_xlate(struct of_phandle_args *dma_spec,
>  
>  static int sf_pdma_probe(struct platform_device *pdev)
>  {
> +	const struct sf_pdma_driver_platdata *ddata;
>  	struct sf_pdma *pdma;
>  	int ret, n_chans;
>  	const enum dma_slave_buswidth widths =
> @@ -545,6 +548,14 @@ static int sf_pdma_probe(struct platform_device *pdev)
>  
>  	pdma->n_chans = n_chans;
>  
> +	pdma->transfer_type = PDMA_FULL_SPEED | PDMA_STRICT_ORDERING;
> +
> +	ddata  = device_get_match_data(&pdev->dev);
> +	if (ddata) {
> +		if (ddata->quirks & PDMA_QUIRK_NO_STRICT_ORDERING)
> +			pdma->transfer_type &= ~PDMA_STRICT_ORDERING;
> +	}
> +
>  	pdma->membase = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(pdma->membase))
>  		return PTR_ERR(pdma->membase);
> @@ -632,9 +643,19 @@ static int sf_pdma_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct sf_pdma_driver_platdata mpfs_pdma = {
> +	.quirks = PDMA_QUIRK_NO_STRICT_ORDERING,
> +};
> +
>  static const struct of_device_id sf_pdma_dt_ids[] = {
> -	{ .compatible = "sifive,fu540-c000-pdma" },
> -	{ .compatible = "sifive,pdma0" },
> +	{
> +		.compatible = "sifive,fu540-c000-pdma",
> +	}, {
> +		.compatible = "sifive,pdma0",
> +	}, {
> +		.compatible = "microchip,mpfs-pdma",
> +		.data	    = &mpfs_pdma,
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, sf_pdma_dt_ids);
> diff --git a/drivers/dma/sf-pdma/sf-pdma.h b/drivers/dma/sf-pdma/sf-pdma.h
> index 5c398a83b491..267e79a5e0a5 100644
> --- a/drivers/dma/sf-pdma/sf-pdma.h
> +++ b/drivers/dma/sf-pdma/sf-pdma.h
> @@ -48,7 +48,8 @@
>  #define PDMA_ERR_STATUS_MASK				GENMASK(31, 31)
>  
>  /* Transfer Type */
> -#define PDMA_FULL_SPEED					0xFF000008
> +#define PDMA_FULL_SPEED					0xFF000000
> +#define PDMA_STRICT_ORDERING				BIT(3)
>  
>  /* Error Recovery */
>  #define MAX_RETRY					1
> @@ -112,8 +113,13 @@ struct sf_pdma {
>  	struct dma_device       dma_dev;
>  	void __iomem            *membase;
>  	void __iomem            *mappedbase;
> +	u32			transfer_type;
>  	u32			n_chans;
>  	struct sf_pdma_chan	chans[];
>  };
>  
> +struct sf_pdma_driver_platdata {
> +	u32 quirks;
> +};
> +
>  #endif /* _SF_PDMA_H */
> -- 
> 2.34.1

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
