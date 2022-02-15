Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC55C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 12:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b8SRnfC6yV+il+nhm2jWg4NoNxwV53osPGEbA6rvkKg=; b=fOVJYIzjT5AOhV
	xfddYGi0iHUKEpOqMVkV+O6NEp1OMx4C+A5EizgPAUi9P8jgAGn/1399+ba5IKP2bw/iijViwaNC3
	QugI2aGvBkWHTglA0XnjdqYfe/kdAQcgMwoiB7GFVV7VhF+j8BFlFtEHIoLNHySi7AFcmAEVvaPHU
	k13649j8trlIBbVBJeH5/p2O34QbLrYERrpwKVZDOgJj/M8Allz5eV68Chi8iYuKS7NlCtDY5cc+t
	kLY+7Rab6NB7oPbaR+qS0GSK5KxxDmP/AZMxp5XVbuHayywL1/qNFqi1eL2ADYR5nvHK6IrLJialw
	zgtMLKqT6RWH1llg70rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJwbK-002e9z-Um; Tue, 15 Feb 2022 12:06:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJwbH-002e8h-Io
 for linux-riscv@lists.infradead.org; Tue, 15 Feb 2022 12:06:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 162AFB817BC;
 Tue, 15 Feb 2022 12:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1AB2C340ED;
 Tue, 15 Feb 2022 12:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644926788;
 bh=Sv9IrvT5EE6VlBqnofRFBXi83PWWmXl7XCHCvVMjTJ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TC0Q5IOz+/cfPgB6GZyxOj2vONGKWZOSW/Ih1uRBCYZR1Qmj609401JmPDeVKJZJ3
 tUJ68Ul/5/LUNCQjg/FHvkmz1iyzTxYBvADGDT8JnTPNvxkhMnzDuLyBQngMdIKq8q
 mDkmuHzn7rbo+0J65Jg4/Dxx6b9jos6tA481AdD3ayv2ZtrFvoNVg5yIBBpj2tyTux
 NcTv+R2NBbZ+ZFzKMLd5xkWgPYDzi0dLU03inPV00eC7jyO+G1xVofCFGfU8gVF/dD
 aYUugWTkbiPCi06+F1joVdES+3TFhBaR264LZSVO9guNuti4oNhuKlTrIO7kllJIK8
 nArzNJO2zQbEg==
Date: Tue, 15 Feb 2022 17:36:24 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Zong Li <zong.li@sifive.com>
Cc: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org,
 bin.meng@windriver.com, green.wan@sifive.com,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 3/3] dmaengine: sf-pdma: Get number of channel by
 device tree
Message-ID: <YguXQJp/b/8SzjGX@matsya>
References: <cover.1644215230.git.zong.li@sifive.com>
 <df6c8d1c701b33fa735dd072de3cb585dc60f2c9.1644215230.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <df6c8d1c701b33fa735dd072de3cb585dc60f2c9.1644215230.git.zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_040631_957090_519B3BB6 
X-CRM114-Status: GOOD (  25.89  )
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

On 07-02-22, 14:30, Zong Li wrote:
> It currently assumes that there are always four channels, it would
> cause the error if there is actually less than four channels. Change
> that by getting number of channel from device tree.
> 
> For backwards-compatibility, it uses the default value (i.e. 4) when
> there is no 'dma-channels' information in dts.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  drivers/dma/sf-pdma/sf-pdma.c | 21 ++++++++++++++-------
>  drivers/dma/sf-pdma/sf-pdma.h |  8 ++------
>  2 files changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
> index f12606aeff87..2ae10b61dfa1 100644
> --- a/drivers/dma/sf-pdma/sf-pdma.c
> +++ b/drivers/dma/sf-pdma/sf-pdma.c
> @@ -482,9 +482,7 @@ static void sf_pdma_setup_chans(struct sf_pdma *pdma)
>  static int sf_pdma_probe(struct platform_device *pdev)
>  {
>  	struct sf_pdma *pdma;
> -	struct sf_pdma_chan *chan;
>  	struct resource *res;
> -	int len, chans;
>  	int ret;
>  	const enum dma_slave_buswidth widths =
>  		DMA_SLAVE_BUSWIDTH_1_BYTE | DMA_SLAVE_BUSWIDTH_2_BYTES |
> @@ -492,13 +490,21 @@ static int sf_pdma_probe(struct platform_device *pdev)
>  		DMA_SLAVE_BUSWIDTH_16_BYTES | DMA_SLAVE_BUSWIDTH_32_BYTES |
>  		DMA_SLAVE_BUSWIDTH_64_BYTES;
>  
> -	chans = PDMA_NR_CH;
> -	len = sizeof(*pdma) + sizeof(*chan) * chans;
> -	pdma = devm_kzalloc(&pdev->dev, len, GFP_KERNEL);
> +	pdma = devm_kzalloc(&pdev->dev, sizeof(*pdma), GFP_KERNEL);
>  	if (!pdma)
>  		return -ENOMEM;
>  
> -	pdma->n_chans = chans;
> +	ret = of_property_read_u32(pdev->dev.of_node, "dma-channels",
> +				   &pdma->n_chans);
> +	if (ret) {
> +		dev_notice(&pdev->dev, "set number of channels to default value: 4\n");

This is useful for only debug i think, so dev_dbg perhaps

> +		pdma->n_chans = PDMA_MAX_NR_CH;
> +	}
> +
> +	if (pdma->n_chans > PDMA_MAX_NR_CH) {
> +		dev_err(&pdev->dev, "the number of channels exceeds the maximum\n");
> +		return -EINVAL;
> +	}
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	pdma->membase = devm_ioremap_resource(&pdev->dev, res);
> @@ -556,7 +562,7 @@ static int sf_pdma_remove(struct platform_device *pdev)
>  	struct sf_pdma_chan *ch;
>  	int i;
>  
> -	for (i = 0; i < PDMA_NR_CH; i++) {
> +	for (i = 0; i < pdma->n_chans; i++) {
>  		ch = &pdma->chans[i];
>  
>  		devm_free_irq(&pdev->dev, ch->txirq, ch);
> @@ -574,6 +580,7 @@ static int sf_pdma_remove(struct platform_device *pdev)
>  
>  static const struct of_device_id sf_pdma_dt_ids[] = {
>  	{ .compatible = "sifive,fu540-c000-pdma" },
> +	{ .compatible = "sifive,pdma0" },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, sf_pdma_dt_ids);
> diff --git a/drivers/dma/sf-pdma/sf-pdma.h b/drivers/dma/sf-pdma/sf-pdma.h
> index 0c20167b097d..8127d792f639 100644
> --- a/drivers/dma/sf-pdma/sf-pdma.h
> +++ b/drivers/dma/sf-pdma/sf-pdma.h
> @@ -22,11 +22,7 @@
>  #include "../dmaengine.h"
>  #include "../virt-dma.h"
>  
> -#define PDMA_NR_CH					4
> -
> -#if (PDMA_NR_CH != 4)
> -#error "Please define PDMA_NR_CH to 4"
> -#endif
> +#define PDMA_MAX_NR_CH					4
>  
>  #define PDMA_BASE_ADDR					0x3000000
>  #define PDMA_CHAN_OFFSET				0x1000
> @@ -118,7 +114,7 @@ struct sf_pdma {
>  	void __iomem            *membase;
>  	void __iomem            *mappedbase;
>  	u32			n_chans;
> -	struct sf_pdma_chan	chans[PDMA_NR_CH];
> +	struct sf_pdma_chan	chans[PDMA_MAX_NR_CH];

why waste memory allocating max, we know number of channels in probe,
why not allocate runtime?

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
