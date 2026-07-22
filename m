Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E63FC44539
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 12:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m5ANq6xCyacDe+n6uFrl+EOyLk/JftnNvBUhrRmjXBs=; b=fAWzPlDCkD7a4V
	IZjeqgMLpuNymNzqOfhnUZkeeX6H6udPwaG7f1b2ikynRGX+LAlR/ht3fCuTpex1n905bCZUhsepo
	CGce/HxI9Z0XMhTz6BRBjpVJudq6gcZ5ytoqQRNX/vOHNH+CJGxnSVKJzOksR34GaH8Xtd3r/L1Js
	Ti2eufbhrNqSBp2n6X9m9jOUcEZ7x5zt1GSZ3lri6Gu7zK+GYBVL5KaXh1bFXs9rqcD6foX+kxi3u
	xpPynXGTOCOo1sVq9yVP1+ai076hn8gFY8MTsyNpAdh3Oj7axWZ5e+Xc0D0KBShFyvkecBMjFvE5d
	tLZroLgYtcfRnoXXGrlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVq7-0000000Bihw-47ln;
	Wed, 22 Jul 2026 12:14:20 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVq5-0000000Bihb-0VZU
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 12:14:18 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-51c2808dbc3so88131511cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 05:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1784722455; x=1785327255; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jGQC9a0lDQVYs2rzJjXKUgf6ViPQ8mWczj4aICyEJF0=;
        b=g0IRhtGOkj4qutZWX9kjBz44wJqu9x88hN6J5AH3qV/qNxMVCnn/zMDoTDOv5iscDa
         CJ7bxV7i+RfD8Qc2H8oDaxLeBJrXwX2iUn89+ebKoh5bx58I6siHMwLO2qZwjos6aXvb
         frt88j2DXLYTc1HX7JfbwHLcI7X+/bcTOg9TYaV4RjZk/8GrTQiw2f6cFy2eCxVuSU29
         mUyofm2THb7nLT17Z7GN9F36POWMikScnck4Sli//uLqR1UPxNZ9sY15UnijoLtHPRX/
         5wtmb8PE3Hi32ZNjIq8QD7pG5PY7i5BGroLsnhyK4Azo6mozFlYrraG1k7tq+PdyHXA/
         IHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784722455; x=1785327255;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jGQC9a0lDQVYs2rzJjXKUgf6ViPQ8mWczj4aICyEJF0=;
        b=W3OHB+P9mFMP0d/EoQxccVhvVnBmfBHNZVllVWP3B66577fdkR5oqElnnYm7dXBBWH
         4LIQR7y22gB/GaVT9qRgHoChuyB/iUGkJWmNhgQli0I0tzHS2n0GGQgNUtD6V+VOT0KY
         tVQrxCiq5HlRN2/lh94AYfSusNMJQG3FqhiBPmLdDhRG2IqYYaaPEXAAZbKlKjMBDqSA
         Waz7DQTdTtvrsaF55sxaEB68tKLZohEndLSuOiBxsRRbP5x7fWHlskLQ8ZTjreLtUEcb
         RMLkZx5HV1horUO4JtdFNI0QAfa7ie5/YQ3ltPs2LqSfy2F4tCUq/qUfeUM3a9cXn23s
         7D6w==
X-Forwarded-Encrypted: i=1; AHgh+RrJqdcp2stkLc9kOsawkvm/8toFh895C3LZ9V+S1gH7LH7fViLhyZ+ueMpqEAzxqP2sZXBrz6Tq18bXWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YybsM0Bm4eqyAVK4lsMWAS62XrPSRdbTsJaT+MJGlNRHNcU5EpF
	+zAyqDNElDgFK5706aHm7wdhT6YxghRQ1XvscuyG6cVDP8jh6EXPI7udQ0zj65vU7CM=
X-Gm-Gg: AR+sD10A03Jj14PFGb1RMa6enznASRo1pRr+kMTqDjvVAztVOoiaIw25A4eueuurVHk
	9yzdTHY/+HyjbTARpCfUIJ6+7qXATabXJsf1rcb6+PWFD88IhAbHRxT6I/Dy1YpabL8jqccS9fg
	JgjMaATWBDjrjZZW6XbtQHz+tLecOy9DG/NK06UeYorNw5nv5F6oaYyWLLTavaipHCU6wwj/rLS
	ANNjXy+4oW5WN6YtPijcc6KUo0wkKBZuVJNIxIen2biNhbRV02fp4nnbdueltLk/t+RYiQvOSqx
	vkhdmlTUY5xiCV3e3bjla2Su/PVcndR7rjn0twW4+MixBwUyAQfAkQEEdn53qUV18D7bNSMXPny
	RsfdhP7ggsA5Y1zN9B901V6VIXSSYRWH16y5HrLySkna+XZKUVw9AHDCOT35fjAq2mtlV7Sq110
	VtIQ==
X-Received: by 2002:a05:622a:58cb:b0:51c:19af:6341 with SMTP id d75a77b69052e-5213cbd5495mr205627331cf.36.1784722455297;
        Wed, 22 Jul 2026 05:14:15 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-527d402caf9sm13896591cf.30.2026.07.22.05.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 05:14:14 -0700 (PDT)
Message-ID: <3793653d-f06e-4353-968d-ea42200899a5@riscstar.com>
Date: Wed, 22 Jul 2026 07:14:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: spacemit: prepare both DMA descriptors before
 submitting
To: kr494167@gmail.com, broonie@kernel.org, dlan@kernel.org
Cc: guodong@riscstar.com, linux-spi@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260722034103.12190-1-kr494167@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260722034103.12190-1-kr494167@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_051417_307976_FA0FA902 
X-CRM114-Status: GOOD (  17.90  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 7/21/26 10:41 PM, kr494167@gmail.com wrote:
> From: surendra <kr494167@gmail.com>

Do you have a more complete identity?

> k1_spi_dma_one() currently submits the TX DMA descriptor to the DMA engine
> before preparing the RX DMA descriptor. If preparing the RX descriptor
> subsequently fails, the function jumps to the fallback error path without
> canceling or aborting the already submitted TX DMA descriptor.
> 
> Fix this by preparing both the TX and RX descriptors before submitting
> either of them to the DMA engine.
> 
> Fixes: efcd8b9d1111 ("spi: spacemit: introduce SpacemiT K1 SPI controller driver")
> Signed-off-by: surendra <kr494167@gmail.com>

This looks good to me.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/spi/spi-spacemit-k1.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/spi/spi-spacemit-k1.c b/drivers/spi/spi-spacemit-k1.c
> index 215fe66d27b4..96b41b67fcbf 100644
> --- a/drivers/spi/spi-spacemit-k1.c
> +++ b/drivers/spi/spi-spacemit-k1.c
> @@ -278,25 +278,25 @@ static int k1_spi_dma_one(struct spi_controller *host, struct spi_device *spi,
>   			  struct spi_transfer *transfer)
>   {
>   	struct k1_spi_driver_data *drv_data = spi_controller_get_devdata(host);
> -	struct dma_async_tx_descriptor *desc;
> +	struct dma_async_tx_descriptor *txdesc, *rxdesc;
>   	u32 val;
>   
> -	/* Prepare the TX descriptor and submit it */
> -	desc = k1_spi_dma_prep(drv_data, transfer, true);
> -	if (!desc)
> +	/* Prepare the TX descriptor */
> +	txdesc = k1_spi_dma_prep(drv_data, transfer, true);
> +	if (!txdesc)
>   		goto fallback;
> -	dmaengine_submit(desc);
>   
> -	/* Prepare the RX descriptor and submit it */
> -	desc = k1_spi_dma_prep(drv_data, transfer, false);
> -	if (!desc)
> +	/* Prepare the RX descriptor */
> +	rxdesc = k1_spi_dma_prep(drv_data, transfer, false);
> +	if (!rxdesc)
>   		goto fallback;
>   
>   	/* When RX is complete we also know TX has completed */
> -	desc->callback = k1_spi_dma_callback;
> -	desc->callback_param = drv_data;
> +	rxdesc->callback = k1_spi_dma_callback;
> +	rxdesc->callback_param = drv_data;
>   
> -	dmaengine_submit(desc);
> +	dmaengine_submit(txdesc);
> +	dmaengine_submit(rxdesc);
>   
>   	val = readl(drv_data->base + SSP_TOP_CTRL);
>   	val |= TOP_TRAIL;		/* Trailing bytes handled by DMA */


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
