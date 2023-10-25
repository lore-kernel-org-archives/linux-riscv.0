Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0A6C07545
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 13:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dN8KK3qcWAdYuOMVkJtB1voMJQdgFmU+d3bPRMslOPU=; b=nOdkztNX/t0WBbIDqfJ5UmcgsP
	c6xfXUdkabq7Fwmdpzs1u6VKUaPQ/G6gdm2GurUnBEhLuYYHLUaVc0Falk57rPtr8Gceu6QFwWjae
	Z3uVtXNz3xvRSJZh4RrlkXS92oWEYFKaxYm3NK8Q7AhLmylgH8Pup3YvOggKVr+45aB2o68SImUog
	5SxSCeuxiPqbqU0nhuR5VI/rc9p2wWHMMDhhxVBKVS5Q/+PJ9Zp7amZ8Sm5QRDZqcQ18y9kymTF94
	oKwQD4+WHpuc61GCZzcY9hsOSJejZa/IZcMho/fHGkdHGTBpU9j6Ytbx1YClGyRt6y/GlJt27/RDL
	Aa9fsX6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvdVl-00CMIA-20;
	Wed, 25 Oct 2023 13:01:25 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvdVi-00CMGv-1z
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 13:01:24 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A52B73FD3D
	for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 13:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1698238873;
	bh=Ja9/pCBWGEb2jT4TVb34dvtYhqs8vTUmcB3t9wcKY1o=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=iN12AhLjYPgHx/UGw1h4PPIEEKJ7s5Cblx4gCIhv2+zb8hPgBhur0/jjmfscViln/
	 YkgIEof2K0sSiN0JXVNDkMFf5pMJk/Vsld+YPA0btrp4X0zddTk3GhNEK/GxKrPitV
	 tVO57PwR3C6Vf5Lk2WX5iHavveGu7J2mtjlutHupExWf3cOpgO5eDrJcGVR7/IY8Bw
	 aUKExzFenyQzkfSyXwowl2k/mAd0BHk3z8+hie2uVVJ+WdHbsy4ec26YmypzYGKAbk
	 eNO49f+Pacy56EoeMwKsN3OvlQebx/Wz+q7oeUPYe/EoGIeleACq5ewuULMwgkFIMy
	 eyY+G+CVSBTpQ==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-41cba27f8b2so57361441cf.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 06:01:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698238868; x=1698843668;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ja9/pCBWGEb2jT4TVb34dvtYhqs8vTUmcB3t9wcKY1o=;
        b=RaLUo5eOavXQZTkgBtA6OA7haO2PcEWRkQdh/IApGcApG4cbR5YFDCHcF+RTD5mXsN
         mt5QDCw5u7XqkdJR0UxxwlithsltYhKwYt9vYrKSJxxbTOmm7ZgXNDyfrDZ8o4YawvTD
         L9ipbEIBJt35cHl+Uvp2jhQtyQUC+BJDB7YTl619P/nA0bQxlFwj7e3KfXbWeSRvKt3U
         9h7iN5ISFMJUnAzWC+ntMESI0IfLL+rlJG2zDKvOvtAHjB/amvx0uWTzPwAseyeL5cqb
         OseXhWFtDSt1CIup6lKYNELzok0KKZGYG3tAXqcGm1lU3hPiUDy7mrFehLIOdnE1PpD8
         wGaw==
X-Gm-Message-State: AOJu0Yxx3Kbbo6aGXLJdS480BvoIfwHfJZa1zRfoQdyXqmyT3Gq8qmiB
	JG6VNmUBQR1PZoaCkHptbm+xq34Qx3Vu3sDfJYHplfz5jVKbeU3MBIijT5Mq5HhyMK2mCJnPBBn
	Appk/Z6F1qZB0A1qBuafSpalvY3hByvx+BPlyFHxps/OF8PAVFheL1dff9+MhWA==
X-Received: by 2002:ac8:7f55:0:b0:403:2877:bc52 with SMTP id g21-20020ac87f55000000b004032877bc52mr14847384qtk.0.1698238868270;
        Wed, 25 Oct 2023 06:01:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHR4n03DxpEQ8FKBl/cC8JZSa2ZdjBM0k+4vHHfPQdbqvxHY2awJSdK2W4XYzETcAfXppp1yQjthWwRg+k5wtE=
X-Received: by 2002:ac8:7f55:0:b0:403:2877:bc52 with SMTP id
 g21-20020ac87f55000000b004032877bc52mr14847345qtk.0.1698238867829; Wed, 25
 Oct 2023 06:01:07 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Oct 2023 06:01:07 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231025102251.3369472-4-shravan.chippa@microchip.com>
References: <20231025102251.3369472-1-shravan.chippa@microchip.com> <20231025102251.3369472-4-shravan.chippa@microchip.com>
Mime-Version: 1.0
Date: Wed, 25 Oct 2023 06:01:07 -0700
Message-ID: <CAJM55Z9s4AFcA0OdfBEOP8=OK9Oa3NzV5qZ9f-Q2f0Kn-BcE8A@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dmaengine: sf-pdma: add mpfs-pdma compatible name
To: shravan chippa <shravan.chippa@microchip.com>, green.wan@sifive.com, vkoul@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, conor+dt@kernel.org
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nagasuresh.relli@microchip.com, praveen.kumar@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_060122_851483_72DB4FB2 
X-CRM114-Status: GOOD (  20.36  )
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

shravan chippa wrote:
> From: Shravan Chippa <shravan.chippa@microchip.com>
>
> Sifive platform dma does not allow out-of-order transfers,
> Add a PolarFire SoC specific compatible and code to support
> for out-of-order dma transfers
>
> Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> ---
>  drivers/dma/sf-pdma/sf-pdma.c | 27 ++++++++++++++++++++++++---
>  drivers/dma/sf-pdma/sf-pdma.h |  8 +++++++-
>  2 files changed, 31 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
> index 4c456bdef882..9cc4beec40f0 100644
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
> +			pdma->transfer_type &= ~(PDMA_STRICT_ORDERING) ;

The parentheses are unnecessary and you have an extra space.

With that fixed:
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

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
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
