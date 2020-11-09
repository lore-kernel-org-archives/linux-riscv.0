Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B0CC2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 21:22:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDD97206CB
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 21:22:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dte3rz+5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HG+R+afc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDD97206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mGkeLomhAhjp/2JqZPOJjSNLYI9rHH3Ldx+1IxLe9fE=; b=Dte3rz+5h/PguCp04adjJ1/f9
	NXcGQGiQDls9rxqQ34qvid8x2U9qzmLROPq1IvjY9APV1ezVI/K9R83XO56uPUz8EwvkV6jxeHq0T
	7sFWx5WAkX+3amJMqM+hfzNtbI6XAuvmXGgHngProqnuOVDwRjiQTxGrCEX6vGQl68TxrJCTrM6Ro
	3GfKtwXdiCi45sv9nLpyUGdujrqSA/BANF87f28D0WsKPdNe6hEc081zdNubvOcjNGY9Ha7iwupV4
	thqrYGdlkOLFU0gJEjmo7b2JF+HatZlMwiFG4bv/1ATYea6AyyQoLG1EABb/Bt0pvImKEGaRBudsK
	1am93w+PA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcEc5-0000IQ-MC; Mon, 09 Nov 2020 21:22:09 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcEc2-0000Hn-VE
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 21:22:08 +0000
Received: by mail-lf1-x143.google.com with SMTP id u18so14463436lfd.9
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 13:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=erGCDfk1T8jj0P66ygwuQHbBulQ+TeFa6YVDO6ZXBrI=;
 b=HG+R+afcnVk+JjnjUT4bLntCCRkeqWjO387aQAi+qWzlwVcG+x3ZmJm9yTlfS8vZnY
 wmuDwnkEnegAgv6C5dTgRaW1B7M92a6LzgvNvuyaXmkItwo+wXXyWwHn2SXlLrmNgytF
 qlsNWkDzkkolZpnHrU1Gx23bcfr0Gc27muvTkFm2qe0XjIkSYs9P2Z2Qr5mY5ToXiKL3
 A6VKW4z2BA3xUKuP7belL/6Zl25hG6zOzmMeVSMZsKEQC2mZqIL8VNFq+PvL0uefMuen
 0BW33KF7X6JHunCeDl42YzJDddCRT+W5fGfoFVHtG1If9YgyJZKzR0lOPJ/jeARFvqCk
 kJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=erGCDfk1T8jj0P66ygwuQHbBulQ+TeFa6YVDO6ZXBrI=;
 b=UdnHJMqkbZ5YUt6n4YsymdtetC0BNHSY2/n9MlIzEOkIvbC/IhatmqRwacQHVam36r
 c2I8bSU+n/Z7ekAvonA+/SdmxqIWifSaTykirkVZbfBNzIEJdh7+nKQDE3dZhAGnAJKt
 cJXtZJ3yexeFX97dBSTYBCmc8NsXm281AKXSYM2UT4oa0yws1qR8HaEvqN9TriWp2pJj
 p9RQ4o+Ud32a+KbUmFbM3oqPvEoUM0DNdvm7nMoLjDZiPi/qSOmArGfR9zeHeZI1dMnY
 ZJKWsD8Hf10P1/HgVQ/y5/fUEMaeg+Zzn/W6KUifRF8iSmLQL0VaaPpiL9bPd0m236NJ
 uvXw==
X-Gm-Message-State: AOAM531s9CF/mR/+8NRk4YPjgUDsysWaswZ+09F7pq3HO+ab13BMToCv
 maEK9tTE60JptkQxVqGEL6U=
X-Google-Smtp-Source: ABdhPJyckhHVzvlbB8NBnv1YJ+bafHBWpymTA8AujTFSZMEi2aaWRiumfgLTTGBMDdsK6VkU/3Xfgw==
X-Received: by 2002:a19:3ce:: with SMTP id 197mr6794065lfd.364.1604956925708; 
 Mon, 09 Nov 2020 13:22:05 -0800 (PST)
Received: from mobilestation ([95.79.141.114])
 by smtp.gmail.com with ESMTPSA id x8sm1400561lff.196.2020.11.09.13.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 13:22:05 -0800 (PST)
Date: Tue, 10 Nov 2020 00:21:58 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH 06/32] spi: dw: Add support for the Kendryte K210 SoC
Message-ID: <20201109212158.y34otj3uy2hev75c@mobilestation>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-7-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201107081420.60325-7-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_162207_026756_24300E59 
X-CRM114-Status: GOOD (  23.89  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 Sean Anderson <seanga2@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Nov 07, 2020 at 05:13:54PM +0900, Damien Le Moal wrote:
> The DW SPI master of the Kendryte K210 RISC-V SoC uses the 32-bits
> ctrlr0 register format. This SoC is also quite slow and gets significant
> SD card performance improvements from using no-delay polled transfers.
> Add the dw_spi_k210_init() function tied to the
> "canaan,kendryte-k210-spi" compatible string to set the
> DW_SPI_CAP_DFS_32 and DW_SPI_CAP_POLL_NODELAY DW SPI capability fields
> for this SoC.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  drivers/spi/spi-dw-mmio.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
> index 3f1bc384cb45..a00def6c5b39 100644
> --- a/drivers/spi/spi-dw-mmio.c
> +++ b/drivers/spi/spi-dw-mmio.c
> @@ -223,6 +223,14 @@ static int dw_spi_keembay_init(struct platform_device *pdev,
>  	return 0;
>  }
>  
> +static int dw_spi_k210_init(struct platform_device *pdev,
> +			    struct dw_spi_mmio *dwsmmio)
> +{
> +	dwsmmio->dws.caps = DW_SPI_CAP_DFS_32 | DW_SPI_CAP_POLL_NODELAY;
> +
> +	return 0;
> +}
> +
>  static int dw_spi_mmio_probe(struct platform_device *pdev)
>  {
>  	int (*init_func)(struct platform_device *pdev,
> @@ -340,6 +348,7 @@ static const struct of_device_id dw_spi_mmio_of_match[] = {
>  	{ .compatible = "snps,dwc-ssi-1.01a", .data = dw_spi_dwc_ssi_init},
>  	{ .compatible = "intel,keembay-ssi", .data = dw_spi_keembay_init},
>  	{ .compatible = "microchip,sparx5-spi", dw_spi_mscc_sparx5_init},

> +	{ .compatible = "canaan,kendryte-k210-spi", .data = dw_spi_k210_init},

Other than the comments from Sean and Mark regarding the DFS_32
feature runtime detectability, I couldn't find a patch with adding the
new new compatible string into the DW APB SSI DT schema. Have I missed
it? If I haven't could you add one to the next version of the series?

-Sergey

>  	{ /* end of table */}
>  };
>  MODULE_DEVICE_TABLE(of, dw_spi_mmio_of_match);
> -- 
> 2.28.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
