Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 379DEC388F9
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 13:29:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EF1E206ED
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 13:29:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZPa04hFb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPN5CiQP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EF1E206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Jsgle+s8Nzfs8YpW0Gg+zWbHukd4KmzthOuuajrFEA=; b=ZPa04hFbfZoK+GINTtxSQOyWOa
	Bt+2IzY+/1857+sBCA38NqBGkecojXPq9ZBqLgeCM+NyYTrxKRH1foQ/bQIlWXNlAWmzeXpdEpMJs
	ikVMmQjH5FewobnA29QNDI+E3apCuBXBASpNJSVvZyakplCqh2MGKj3ilW4sR7xlg/HOLS2g5ZJEu
	MTTKo/EUQ+piUlPApWiaTy/XOIeb2lWXxff65bPoBHN7LQqSROP0bWSLE1E3+XmqRdkHnOZvQCNRG
	bXjHFKJfNTc6TcixWyaNHTGVfVYkqIXhQz3xHPN7NSyCRJv3Us75NzUMEQ8Q8111RDqIiDBiyEbVL
	EIIh84tw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbOH6-0003PR-H6; Sat, 07 Nov 2020 13:29:00 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbOH2-0003Oy-Gh
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 13:28:58 +0000
Received: by mail-qt1-x844.google.com with SMTP id j31so2809464qtb.8
 for <linux-riscv@lists.infradead.org>; Sat, 07 Nov 2020 05:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dn/HeCtFRABC/ah/L2n0R362D6f38waNtj4v0HJdssk=;
 b=cPN5CiQPwqDFVdbga3mf9g1vnoSpLPtjYCc/HxBibpMnEaRnpr33do1VW5dfiICuTp
 jEtINCzgBVSdEirrEB2MkxaBSk3sStb8qRwNL7hYWpTOkvgQ+20uCjmn0LpUcuKXcB+8
 X7rcr9H67tt1H4y6iJA5ohPcnsjhX7Pj96O9PVwlO7GW/0btNxuCSsGormYU4UghSiNm
 kWCZQxZfYB/ZuVJZRPGfEW0lIKttInLPzFzvoVN0gneMKZEBF8di96124tIyDCQ3rFPC
 xo1e0R4v3NSrbz13WpomNhr9Ar9ViL/+HWYwYoaGTg4bOgPI7oAyUyZhN3jRF1C9KLup
 bEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dn/HeCtFRABC/ah/L2n0R362D6f38waNtj4v0HJdssk=;
 b=D68uF6JxUox75dTV4+jOl+lpx1zOfBpl9In/E8jlj/Zp3Dpp0ZWwskSI0CfkGaDxjV
 IP1gL52RGvx66rdOxBx8TNrXgNi11kFZHl8Hjk/+x0kyze3Ym9c+DpIpZNXy5xibOGmH
 h/SMWdbE69nCusCmAO4rI8m+tP5ehBmH6eex+SP/wSKr+oswjPbCQiws1DLXRMo64BDS
 /wupf3JQYBBJt/9uAuz6Q7+ve4zqy0q2zYYfQYvq0c5Q81Tqn9AOLkzfOW8vdkhY6oGH
 bL1ttJirK4erIrFpgaXzjisVtk2zDU0g3iX6yVCJRVHmHUHsg96bCiwPS5VX6WBxzvs/
 kRGQ==
X-Gm-Message-State: AOAM533Cc9EFERvHlwno2vY4qGr3Pk8BxzYU9eaj+QDcqYv/STSJIOSl
 Z6hw20pvsq8AELP16dZUlE3/XCBYDadp2Q==
X-Google-Smtp-Source: ABdhPJxa0jkI7jybW+0vygF/BSBlg4wHi5TOu+7IGUDmgwmNWnxQbSOqQzhXElvDte5P+hUZEBYnrg==
X-Received: by 2002:ac8:13c1:: with SMTP id i1mr5798465qtj.78.1604755733365;
 Sat, 07 Nov 2020 05:28:53 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id q1sm2346943qti.95.2020.11.07.05.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Nov 2020 05:28:52 -0800 (PST)
Subject: Re: [PATCH 02/32] spi: dw: Add support for 32-bits ctrlr0 layout
To: Damien Le Moal <damien.lemoal@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-3-damien.lemoal@wdc.com>
From: Sean Anderson <seanga2@gmail.com>
Autocrypt: addr=seanga2@gmail.com; prefer-encrypt=mutual; keydata=
 mQENBFe74PkBCACoLC5Zq2gwrDcCkr+EPGsT14bsxrW07GiYzQhLCgwnPdEpgU95pXltbFhw
 46GfyffABWxHKO2x+3L1S6ZxC5AiKbYXo7lpnTBYjamPWYouz+VJEVjUx9aaSEByBah5kX6a
 lKFZWNbXLAJh+dE1HFaMi3TQXXaInaREc+aO1F7fCa2zNE75ja+6ah8L4TPRFZ2HKQzve0/Y
 GXtoRw97qmnm3U36vKWT/m2AiLF619F4T1mHvlfjyd9hrVwjH5h/2rFyroXVXBZHGA9Aj8eN
 F2si35dWSZlIwXkNu9bXp0/pIu6FD0bI+BEkD5S7aH1G1iAcMFi5Qq2RNa041DfQSDDHABEB
 AAG0K1NlYW4gR2FsbGFnaGVyIEFuZGVyc29uIDxzZWFuZ2EyQGdtYWlsLmNvbT6JAVcEEwEK
 AEECGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4ACGQEWIQSQYR1bzo1I0gPoYCg+6I/stKEQ
 bgUCXT+S2AUJB2TlXwAKCRA+6I/stKEQbhNOB/9ooea0hU9Sgh7PBloU6CgaC5mlqPLB7NTp
 +JkB+nh3Fqhk+qLZwzEynnuDLl6ESpVHIc0Ym1lyF4gT3DsrlGT1h0Gzw7vUwd1+ZfN0CuIx
 Rn861U/dAUjvbtN5kMBqOI4/5ea+0r7MACcIVnKF/wMXBD8eypHsorT2sJTzwZ6DRCNP70C5
 N1ahpqqNmXe0uLdP0pu55JCqhrGw2SinkRMdWyhSxT56uNwIVHGhLTqH7Q4t1N6G1EH626qa
 SvIJsWlNpll6Y3AYLDw2/Spw/hqieS2PQ/Ky3rPZnvJt7/aSNYsKoFGX0yjkH67Uq8Lx0k1L
 w8jpXnbEPQN3A2ZJCbeM
Message-ID: <e166976c-5119-a63b-25ff-8c403e4fc0ae@gmail.com>
Date: Sat, 7 Nov 2020 08:28:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201107081420.60325-3-damien.lemoal@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_082856_580027_49C1BDFD 
X-CRM114-Status: GOOD (  24.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/7/20 3:13 AM, Damien Le Moal wrote:
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
> frame format field which resides in bits 16..20 instead of bits 3..0.
> 
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
> 

Reviewed-by: Sean Anderson <seanga2@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
