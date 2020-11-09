Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A4E8C388F7
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 14:25:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1BC820674
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 14:25:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zTFdtVjl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DLaQop/B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1BC820674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cKW7dbmayD/oRkcB4FQyM8dZCQ+5B/XG1y+UiJQfLuM=; b=zTFdtVjlt9qRdYpNVFxN5AA0B
	Ab976jV/dSXWWcAgsDLU0kMq1SCsIYTiwjvzJqDPgNbQyNWRobT/2yZnZOFk4eJ2oQlJecHbnYFe4
	IOKeSQyOEB8o+dBVUziRMjtTafOCeUA/F+MYWqOBUzXTS4WI7UBssZQk4urExa1xo3AzpnYIW5UVf
	GjTE43RmZqP8ffV9EGHki1IPy+H3xaAYZtLlnHlWZv3y6u87t9Lj0qLDcn+HQSZReT2NmUiG3zuah
	gJKsMXbjLNW3LZWU+iwf7YspBUn8tQ1kYKXj25nk6WyEplpRk91sFxDqGn1+W2VfiYLiRG0Wqe65V
	rXNIlvzeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc870-0004Yp-Q6; Mon, 09 Nov 2020 14:25:38 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc86y-0004Xl-GX
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 14:25:37 +0000
Received: by mail-lj1-x243.google.com with SMTP id v20so2018012ljk.8
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 06:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=URtdoNVy8gkPjkFeamValqRKNNb6u2NGeKTyfcPlO98=;
 b=DLaQop/BJeZDkogr8fvQz6LbxsL33OhxD4lqAi9SvHtRmZNBf2xTIyRTZyFGwyhiDl
 G9qOu8XSWJ+rZwZGks9jJwuWlBETaNerCEkGHK1/OzHxZhOXheXU1ffD8dsYrRpgGMF5
 +wS933P8s6M68Uwyf9RbC4q57O/2zbOyfsUPIPHMTjAbNXTTU90mhPNyCBlALqmRzhSp
 19brjatCQSXL7+vDornRUks5ZE/rv9Bnc8P8IeWJ1zdGcx9N7rtG9KwaTifYHv4Pgy9K
 ne+oXHaMtJYLd2O3IfEQ1sGoaUqOEtzGeTMgAurOtR52+4G0gUFk55IsVvleliEwWMdI
 +VNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=URtdoNVy8gkPjkFeamValqRKNNb6u2NGeKTyfcPlO98=;
 b=OUUc6vqjiF3diB73t87CfPmmfgAiLbefmVIFzitxq8CKQMswPPZrKvtN59L1QG4Hj0
 Gh0TUXB3jvyC0rc4xQoYwxILonh1LcZXZm31ed5Rol8gQrHcKLsIT56HgPnpJ2vQ6iVm
 u4ztmecfcgdaEX+E+xeT4+UaMZ6Q2hT+h4KyAY1uClufgcm0ddYOy7xtSjjocSD0mp25
 +q6Qe6ynMY5ksxp/cmqkx4SLGF8S5ZvUH+AMwEmp8nEx5yfKOkVqno7UmlYAIc9pzxeR
 2L3w7LCFMtTjLctI51wU6RRGIj/DRXuLxE3aEm4mLYVAxTrw/g0MNsNsd/YIj17WRWBZ
 cfYQ==
X-Gm-Message-State: AOAM530HRHmqHOlqgaJH50Q0SiBA1f4/gHfhxzesZ5+aMMgjZedI3/pc
 qT0mgxOS3oAiHVvHCm6oJRA=
X-Google-Smtp-Source: ABdhPJxzl/GFY/rQuAZ6payfqwMabYYZkaNwAFBFjC9q1uKdg7lmxSJpUdStg7dfVfrnJnzAPGbTPA==
X-Received: by 2002:a2e:9096:: with SMTP id l22mr2683281ljg.199.1604931932805; 
 Mon, 09 Nov 2020 06:25:32 -0800 (PST)
Received: from mobilestation ([95.79.141.114])
 by smtp.gmail.com with ESMTPSA id 78sm2196319ljf.64.2020.11.09.06.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 06:25:32 -0800 (PST)
Date: Mon, 9 Nov 2020 17:25:29 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH 02/32] spi: dw: Add support for 32-bits ctrlr0 layout
Message-ID: <20201109142529.tt5ojjyn36vd3ohe@mobilestation>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-3-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201107081420.60325-3-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_092536_585145_A1BFDBFF 
X-CRM114-Status: GOOD (  28.55  )
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

Hello Damien,
Thanks for your patches. My comments are below.

On Sat, Nov 07, 2020 at 05:13:50PM +0900, Damien Le Moal wrote:
> Synopsis DesignWare DW_apb_ssi version 4 defines a 32-bit layout of
> the ctrlr0 register for SPI masters. The layout of ctrlr0 is:
> 
> |   31 .. 23  | 22 .. 21 | 20 .. 16 |
> | other stuff | spi_frf  |  dfs_32  |
> 
> |   15 .. 10  | 9 .. 8 | 7 .. 6 | 5 .. 4 | 3 .. 0 |
> | other stuff |  tmod  |  mode  |  frf   |  dfs   |
> 

> Th main difference of this layout with the 16-bits version is the data
    ^
    |
    e

> frame format field which resides in bits 16..20 instead of bits 3..0.
> 

Are you sure they have been moved from [0, 3] to [16, 20]? I don't have the
manual for the 4.0x version of the core, but according to this patch:
https://patchwork.kernel.org/project/spi-devel-general/patch/1575907443-26377-7-git-send-email-wan.ahmad.zainie.wan.mohamad@intel.com/
it has been ok to use the lowest four bits for DFS setting. Is the commit
message misleading there?

> Introduce the DW SPI capability flag DW_SPI_CAP_DFS_32 to let a
> platform signal that this layout is in use. Modify
> dw_spi_update_config() to test this capability flag to set the data
> frame format field at the correct register location.
> 
> Suggested-by: Sean Anderson <seanga2@gmail.com>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  drivers/spi/spi-dw-core.c | 8 ++++++--
>  drivers/spi/spi-dw.h      | 9 +++++++++
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
> index 2e50cc0a9291..841c85247f01 100644
> --- a/drivers/spi/spi-dw-core.c
> +++ b/drivers/spi/spi-dw-core.c
> @@ -311,8 +311,12 @@ void dw_spi_update_config(struct dw_spi *dws, struct spi_device *spi,
>  	u32 speed_hz;
>  	u16 clk_div;
>  

> -	/* CTRLR0[ 4/3: 0] Data Frame Size */
> -	cr0 |= (cfg->dfs - 1);
> +	if (!(dws->caps & DW_SPI_CAP_DFS_32))
> +		/* CTRLR0[ 4/3: 0] Data Frame Size */
> +		cr0 |= (cfg->dfs - 1);
> +	else
> +		/* CTRLR0[20: 16] Data Frame Size */
> +		cr0 |= (cfg->dfs - 1) << DWC_APB_CTRLR0_32_DFS_OFFSET;

If you extend the dfs field from four to five bits, then
controller->bits_per_word_mask field should be properly updated too.

Alas it hasn't been done for the DWC_ssi version of the core. So I suppose it
should be fixed for the both of them.

Just for the record. There are very handy macros for setting and getting bit fields
to/from a variable. This is a good place to use them instead of manually
shifting and defining the offsets. The macros are defined in linux/bitfield.h .
Alas this driver hasn't been converted to using them. So I won't insist on using
them here. But I hope someone will fix it sometime in future...

-Sergey

>  
>  	if (!(dws->caps & DW_SPI_CAP_DWC_SSI))
>  		/* CTRLR0[ 9:8] Transfer Mode */
> diff --git a/drivers/spi/spi-dw.h b/drivers/spi/spi-dw.h
> index faf40cb66498..48a11a51a407 100644
> --- a/drivers/spi/spi-dw.h
> +++ b/drivers/spi/spi-dw.h
> @@ -9,6 +9,7 @@
>  #include <linux/io.h>
>  #include <linux/scatterlist.h>
>  #include <linux/spi/spi-mem.h>
> +#include <linux/bitfield.h>
>  
>  /* Register offsets */
>  #define DW_SPI_CTRLR0			0x00
> @@ -72,6 +73,13 @@
>  #define DWC_SSI_CTRLR0_FRF_OFFSET	6
>  #define DWC_SSI_CTRLR0_DFS_OFFSET	0
>  
> +/*
> + * Bit fields in CTRLR0 for DWC_apb_ssi v4 32-bits ctrlr0.
> + * Based on DW_apb_ssi Databook v4.02a.
> + */
> +#define DWC_APB_CTRLR0_32_DFS_OFFSET	16
> +#define DWC_APB_CTRLR0_32_DFS_MASK	GENMASK(20, 16)
> +
>  /*
>   * For Keem Bay, CTRLR0[31] is used to select controller mode.
>   * 0: SSI is slave
> @@ -121,6 +129,7 @@ enum dw_ssi_type {
>  #define DW_SPI_CAP_CS_OVERRIDE		BIT(0)
>  #define DW_SPI_CAP_KEEMBAY_MST		BIT(1)
>  #define DW_SPI_CAP_DWC_SSI		BIT(2)
> +#define DW_SPI_CAP_DFS_32		BIT(3)
>  
>  /* Slave spi_transfer/spi_mem_op related */
>  struct dw_spi_cfg {
> -- 
> 2.28.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
