Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA47606EE8B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 16:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fdFI4zKo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kFu+4Fcc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oLsXbsHqQtzmw+3kS+yGXSG/RkaXskngg31j7eZhCD8=; b=fdFI4zKo1r0wSqyToSuBDWPJ9C
	HhlCMJic9A+OV4eTNp3g9bzg7+3OyjScwBknQLc2LuuPUdeneMzGm15COX84f7Vp5O35k2+/Wr9RR
	8VxpIin3b4Mj8RX6yDo6vFtiBValj63q187xW4rIVNML8smzADWy59cTlbCI+62hs/FAnXKrlG9M7
	G3d44lxZkKzBD1K8co003D8bwatcq/ecKkE4KeVP2jE30BBU/hViQAavFKneQVJpBydLuuZEpb2Ar
	AHPvZKVff5V3wfnAvnyNQxbCr4RQVv/oxRFulbvH6Npl72Jk4GItxsNA0F6aDluZ7FRNZw1gEkiLQ
	jBZRDc2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOeIo-000000067SE-0Icf;
	Wed, 04 Nov 2026 16:57:34 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOeIj-000000067RH-2dl2;
	Wed, 04 Nov 2026 16:57:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793811450; x=1825347450;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kA+R8pE/sj6tJF3qdsiBNT3subr7oV44Dq41fpFh520=;
  b=kFu+4FccF4mwUg+lujbS5S2z+QsSmjNhZ2VXE9pkRUGU5JFaHhAYGvqD
   2m2d8WwUUduzhkv25AeyGq18y54cB2L2uwYz+0iORYVvJTVVqTvdzFX//
   nY/LI7ZovPrR1J/Ai8kBe7wWWVYp/ULULxkbABr1DAiW55rj7hOf7G6gZ
   WmDtFd7z6TbAA9Sx7emazezcXk6wyGhs6R9EPg4judjPYKUoCeL8ToSJa
   3CitTzz5hVIteV4+ew2YrFRFmrpP9KOFL1SzmRjSdGs8owXQpa5mnZ86b
   oA3jcPhvKxK5Rvl0dLUipiF0DGa6BFYUhPbp38L1Oxg0Ubz/xy5n/6N/x
   g==;
X-CSE-ConnectionGUID: Q1eXTNr7S+C0I8mftDgGgw==
X-CSE-MsgGUID: 2FX2Q2CGT9yb2dicM/f89w==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2455748"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2455748"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 08:57:29 -0800
X-CSE-ConnectionGUID: i6LkdCHBS8aHv+axP23p/Q==
X-CSE-MsgGUID: bTVdwHnSQh2Pf9cSJkKNSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7158496"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 08:57:16 -0800
Date: Wed, 4 Nov 2026 18:57:14 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Frank.Li@oss.nxp.com
Cc: Mark Brown <broonie@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Radu Pirea <radu_nicolae.pirea@upb.ro>,
	CL Wang <cl634@andestech.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vladimir Oltean <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
	Haibo Chen <haibo.chen@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Heiko Stuebner <heiko@sntech.de>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	"open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"open list:FREESCALE DSPI DRIVER" <imx@lists.linux.dev>,
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
	"open list:RENESAS RZ/V2H(P) RSPI DRIVER" <linux-renesas-soc@vger.kernel.org>,
	"open list:SAMSUNG SPI DRIVERS" <linux-samsung-soc@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v2 1/1] spi: use dmaengine_desc_set_callback()
Message-ID: <autj6pr_bPaul3w0@ashevche-desk.local>
References: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_085729_735410_8F88053E 
X-CRM114-Status: GOOD (  16.67  )
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 10:22:45AM -0500, Frank.Li@oss.nxp.com wrote:
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across SPI bus drivers.
> 
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com> # dw, pxa2xx, topcliff-pch

(Note, you forgot to add the list of the drivers to the Rb trailers of other reviewers)

>  drivers/spi/spi-dw-dma.c          | 6 ++----
>  drivers/spi/spi-pxa2xx-dma.c      | 3 +--
>  drivers/spi/spi-topcliff-pch.c    | 6 ++----

> --- a/drivers/spi/spi-dw-dma.c
> +++ b/drivers/spi/spi-dw-dma.c
> @@ -397,8 +397,7 @@ static int dw_spi_dma_submit_tx(struct dw_spi *dws, struct scatterlist *sgl,
>  	if (!txdesc)
>  		return -ENOMEM;
>  
> -	txdesc->callback = dw_spi_dma_tx_done;
> -	txdesc->callback_param = dws;
> +	dmaengine_desc_set_callback(txdesc, dw_spi_dma_tx_done, NULL, dws);
>  
>  	cookie = dmaengine_submit(txdesc);
>  	ret = dma_submit_error(cookie);
> @@ -498,8 +497,7 @@ static int dw_spi_dma_submit_rx(struct dw_spi *dws, struct scatterlist *sgl,
>  	if (!rxdesc)
>  		return -ENOMEM;
>  
> -	rxdesc->callback = dw_spi_dma_rx_done;
> -	rxdesc->callback_param = dws;
> +	dmaengine_desc_set_callback(rxdesc, dw_spi_dma_rx_done, NULL, dws);
>  
>  	cookie = dmaengine_submit(rxdesc);
>  	ret = dma_submit_error(cookie);

> --- a/drivers/spi/spi-pxa2xx-dma.c
> +++ b/drivers/spi/spi-pxa2xx-dma.c
> @@ -154,8 +154,7 @@ int pxa2xx_spi_dma_prepare(struct driver_data *drv_data,
>  	}
>  
>  	/* We are ready when RX completes */
> -	rx_desc->callback = pxa2xx_spi_dma_callback;
> -	rx_desc->callback_param = drv_data;
> +	dmaengine_desc_set_callback(rx_desc, pxa2xx_spi_dma_callback, NULL, drv_data);
>  
>  	dmaengine_submit(rx_desc);
>  	dmaengine_submit(tx_desc);

> --- a/drivers/spi/spi-topcliff-pch.c
> +++ b/drivers/spi/spi-topcliff-pch.c
> @@ -1022,8 +1022,7 @@ static void pch_spi_handle_dma(struct pch_spi_data *data, int *bpw)
>  		return;
>  	}
>  	dma_sync_sg_for_device(&data->host->dev, sg, num, DMA_FROM_DEVICE);
> -	desc_rx->callback = pch_dma_rx_complete;
> -	desc_rx->callback_param = data;
> +	dmaengine_desc_set_callback(desc_rx, pch_dma_rx_complete, NULL, data);
>  	dma->nent = num;
>  	dma->desc_rx = desc_rx;
>  
> @@ -1084,8 +1083,7 @@ static void pch_spi_handle_dma(struct pch_spi_data *data, int *bpw)
>  		return;
>  	}
>  	dma_sync_sg_for_device(&data->host->dev, sg, num, DMA_TO_DEVICE);
> -	desc_tx->callback = NULL;
> -	desc_tx->callback_param = data;
> +	dmaengine_desc_set_callback(desc_tx, NULL, NULL, data);

Yeah, data can be replaced by NULL as has been already mentioned.

>  	dma->nent = num;
>  	dma->desc_tx = desc_tx;
>  

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
