Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0722AC7EE22
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 13:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WyibrWEBvBaANIOeqxK8LHCYYBsGxQh5vptrh1Ro6Jg=; b=e3khhT6DWBBD0z
	DUczVzo/CjgrN3d/cFq4nQYxJ700bWaxkehJKJvre83gl1JWLh+qYsXQp7ULV2tZLlRuGhiMBTfDo
	PwcDm0U0cLvZnBue8N5452q7tF74KFKaehnjVbw3oB4tOps49ejeRem0EKXudjqreNBcDh+VqADMn
	jLqWp7g4UpJsh5WVh4Jymp371/ly0cqRFJKv85ln47JYeuLjy9ctYmH4EIz0ROGnJiIHcLz1Eo3oQ
	DVGcQ5eojlfShzYHPC+ZAB7rYl+6Ly575KlFKR8k3+blyQYuKWS7IE8WiuP25MEBRVEdtnoX8JUr9
	XSuXax1lCagbS4Y19LqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px6Yv-008upv-0T;
	Thu, 11 May 2023 13:42:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px6Yr-008uoX-04;
	Thu, 11 May 2023 13:42:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEDC6113E;
	Thu, 11 May 2023 06:43:03 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B86013F5A1;
	Thu, 11 May 2023 06:42:16 -0700 (PDT)
Date: Thu, 11 May 2023 14:42:14 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Maxime Ripard <mripard@kernel.org>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 3/5] spi: sun6i: add quirk for in-controller clock
 divider
Message-ID: <20230511144214.0731b371@donnerap.cambridge.arm.com>
In-Reply-To: <20230510081121.3463710-4-bigunclemax@gmail.com>
References: <20230510081121.3463710-1-bigunclemax@gmail.com>
	<20230510081121.3463710-4-bigunclemax@gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_064225_175092_B7036AFA 
X-CRM114-Status: GOOD (  29.90  )
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

On Wed, 10 May 2023 11:11:10 +0300
Maksim Kiselev <bigunclemax@gmail.com> wrote:

> Previously SPI controllers in Allwinner SoCs has a clock divider inside.
> However now the clock divider is removed and to set the transfer clock
> rate it's only needed to set the SPI module clock to the target value
> and configure a proper work mode.
> 
> According to the datasheet there are three work modes:
> 
> | SPI Sample Mode         | SDM(bit13) | SDC(bit11) | Run Clock |
> |-------------------------|------------|------------|-----------|
> | normal sample           |      1     |      0     | <= 24 MHz |
> | delay half cycle sample |      0     |      0     | <= 40 MHz |
> | delay one cycle sample  |      0     |      1     | >= 80 MHz |
> 
> Add a quirk for this kind of SPI controllers.
> 
> Co-developed-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>

Looks good now.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  drivers/spi/spi-sun6i.c | 91 +++++++++++++++++++++++++++--------------
>  1 file changed, 61 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
> index 01a01cd86db5..e4efab310469 100644
> --- a/drivers/spi/spi-sun6i.c
> +++ b/drivers/spi/spi-sun6i.c
> @@ -42,7 +42,9 @@
>  #define SUN6I_TFR_CTL_CS_MANUAL			BIT(6)
>  #define SUN6I_TFR_CTL_CS_LEVEL			BIT(7)
>  #define SUN6I_TFR_CTL_DHB			BIT(8)
> +#define SUN6I_TFR_CTL_SDC			BIT(11)
>  #define SUN6I_TFR_CTL_FBS			BIT(12)
> +#define SUN6I_TFR_CTL_SDM			BIT(13)
>  #define SUN6I_TFR_CTL_XCH			BIT(31)
>  
>  #define SUN6I_INT_CTL_REG		0x10
> @@ -87,6 +89,7 @@
>  
>  struct sun6i_spi_cfg {
>  	unsigned long		fifo_depth;
> +	bool			has_clk_ctl;
>  };
>  
>  struct sun6i_spi {
> @@ -260,7 +263,7 @@ static int sun6i_spi_transfer_one(struct spi_master *master,
>  				  struct spi_transfer *tfr)
>  {
>  	struct sun6i_spi *sspi = spi_master_get_devdata(master);
> -	unsigned int mclk_rate, div, div_cdr1, div_cdr2, timeout;
> +	unsigned int div, div_cdr1, div_cdr2, timeout;
>  	unsigned int start, end, tx_time;
>  	unsigned int trig_level;
>  	unsigned int tx_len = 0, rx_len = 0;
> @@ -350,39 +353,65 @@ static int sun6i_spi_transfer_one(struct spi_master *master,
>  
>  	sun6i_spi_write(sspi, SUN6I_TFR_CTL_REG, reg);
>  
> -	/* Ensure that we have a parent clock fast enough */
> -	mclk_rate = clk_get_rate(sspi->mclk);
> -	if (mclk_rate < (2 * tfr->speed_hz)) {
> -		clk_set_rate(sspi->mclk, 2 * tfr->speed_hz);
> -		mclk_rate = clk_get_rate(sspi->mclk);
> -	}
> +	if (sspi->cfg->has_clk_ctl) {
> +		unsigned int mclk_rate = clk_get_rate(sspi->mclk);
>  
> -	/*
> -	 * Setup clock divider.
> -	 *
> -	 * We have two choices there. Either we can use the clock
> -	 * divide rate 1, which is calculated thanks to this formula:
> -	 * SPI_CLK = MOD_CLK / (2 ^ cdr)
> -	 * Or we can use CDR2, which is calculated with the formula:
> -	 * SPI_CLK = MOD_CLK / (2 * (cdr + 1))
> -	 * Wether we use the former or the latter is set through the
> -	 * DRS bit.
> -	 *
> -	 * First try CDR2, and if we can't reach the expected
> -	 * frequency, fall back to CDR1.
> -	 */
> -	div_cdr1 = DIV_ROUND_UP(mclk_rate, tfr->speed_hz);
> -	div_cdr2 = DIV_ROUND_UP(div_cdr1, 2);
> -	if (div_cdr2 <= (SUN6I_CLK_CTL_CDR2_MASK + 1)) {
> -		reg = SUN6I_CLK_CTL_CDR2(div_cdr2 - 1) | SUN6I_CLK_CTL_DRS;
> -		tfr->effective_speed_hz = mclk_rate / (2 * div_cdr2);
> +		/* Ensure that we have a parent clock fast enough */
> +		if (mclk_rate < (2 * tfr->speed_hz)) {
> +			clk_set_rate(sspi->mclk, 2 * tfr->speed_hz);
> +			mclk_rate = clk_get_rate(sspi->mclk);
> +		}
> +
> +		/*
> +		 * Setup clock divider.
> +		 *
> +		 * We have two choices there. Either we can use the clock
> +		 * divide rate 1, which is calculated thanks to this formula:
> +		 * SPI_CLK = MOD_CLK / (2 ^ cdr)
> +		 * Or we can use CDR2, which is calculated with the formula:
> +		 * SPI_CLK = MOD_CLK / (2 * (cdr + 1))
> +		 * Wether we use the former or the latter is set through the
> +		 * DRS bit.
> +		 *
> +		 * First try CDR2, and if we can't reach the expected
> +		 * frequency, fall back to CDR1.
> +		 */
> +		div_cdr1 = DIV_ROUND_UP(mclk_rate, tfr->speed_hz);
> +		div_cdr2 = DIV_ROUND_UP(div_cdr1, 2);
> +		if (div_cdr2 <= (SUN6I_CLK_CTL_CDR2_MASK + 1)) {
> +			reg = SUN6I_CLK_CTL_CDR2(div_cdr2 - 1) | SUN6I_CLK_CTL_DRS;
> +			tfr->effective_speed_hz = mclk_rate / (2 * div_cdr2);
> +		} else {
> +			div = min(SUN6I_CLK_CTL_CDR1_MASK, order_base_2(div_cdr1));
> +			reg = SUN6I_CLK_CTL_CDR1(div);
> +			tfr->effective_speed_hz = mclk_rate / (1 << div);
> +		}
> +
> +		sun6i_spi_write(sspi, SUN6I_CLK_CTL_REG, reg);
>  	} else {
> -		div = min(SUN6I_CLK_CTL_CDR1_MASK, order_base_2(div_cdr1));
> -		reg = SUN6I_CLK_CTL_CDR1(div);
> -		tfr->effective_speed_hz = mclk_rate / (1 << div);
> +		clk_set_rate(sspi->mclk, tfr->speed_hz);
> +		tfr->effective_speed_hz = clk_get_rate(sspi->mclk);
> +
> +		/*
> +		 * Configure work mode.
> +		 *
> +		 * There are three work modes depending on the controller clock
> +		 * frequency:
> +		 * - normal sample mode           : CLK <= 24MHz SDM=1 SDC=0
> +		 * - delay half-cycle sample mode : CLK <= 40MHz SDM=0 SDC=0
> +		 * - delay one-cycle sample mode  : CLK >= 80MHz SDM=0 SDC=1
> +		 */
> +		reg = sun6i_spi_read(sspi, SUN6I_TFR_CTL_REG);
> +		reg &= ~(SUN6I_TFR_CTL_SDM | SUN6I_TFR_CTL_SDC);
> +
> +		if (tfr->effective_speed_hz <= 24000000)
> +			reg |= SUN6I_TFR_CTL_SDM;
> +		else if (tfr->effective_speed_hz >= 80000000)
> +			reg |= SUN6I_TFR_CTL_SDC;
> +
> +		sun6i_spi_write(sspi, SUN6I_TFR_CTL_REG, reg);
>  	}
>  
> -	sun6i_spi_write(sspi, SUN6I_CLK_CTL_REG, reg);
>  	/* Finally enable the bus - doing so before might raise SCK to HIGH */
>  	reg = sun6i_spi_read(sspi, SUN6I_GBL_CTL_REG);
>  	reg |= SUN6I_GBL_CTL_BUS_ENABLE;
> @@ -701,10 +730,12 @@ static void sun6i_spi_remove(struct platform_device *pdev)
>  
>  static const struct sun6i_spi_cfg sun6i_a31_spi_cfg = {
>  	.fifo_depth	= SUN6I_FIFO_DEPTH,
> +	.has_clk_ctl	= true,
>  };
>  
>  static const struct sun6i_spi_cfg sun8i_h3_spi_cfg = {
>  	.fifo_depth	= SUN8I_FIFO_DEPTH,
> +	.has_clk_ctl	= true,
>  };
>  
>  static const struct of_device_id sun6i_spi_match[] = {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
