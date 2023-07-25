Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75327C0015E
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 15:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Qb2Sjo4q0Dlj51AWIEcLUc8hMW8q3kBTIhsr9KJIKg=; b=Eho4BShybgykqt
	nqKLvPyHuNGhsar3baDdhfMOgBueLpP712Eqc+fp6d46PD4YsRhtWvE/925LTmXMwmayYKt+HClVN
	LK3MEuYeff2HeSeDU1Qdhh3E5NAEOJjibi6SORG+rT3PnkJIpkKvoIaYoFAW8RbgTfNs9skWd1nhb
	LKjgahGVlBNSl34g3iralEoH/FXOrWk4RmkZLgEudg7jEIrv5liOE5mSh48pk4qWsCl2qj1EPsGhR
	QE7mEKmIQPEDE2Zc4ETmDD8VVKIyQOylJvy2C+GWrQesME5O6wghxOuJ0bmk1CE8RoRt1gSqMw4Hb
	NCf+lOekGz64kRV2ImRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOJl2-007tla-1n;
	Tue, 25 Jul 2023 15:15:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOJky-007tjm-2G
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 15:15:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DFE8A617A9;
	Tue, 25 Jul 2023 15:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D457AC433C7;
	Tue, 25 Jul 2023 15:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690298122;
	bh=uXKJ00uasfRVR16k4FOy30lC5u9cvvfPEmi295ROSWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fTH8UPAM+yn81R7Z0KXVtP8plOMp2TcJp0PSNVyugUwDyax88EbHRxI8m3I4eBcPe
	 eCUj3cznRsiQJPalXVlO1yJwcrPx1GgSKlTsZyrW8dttQooC1l9Z3xIxmzxrrkuF7d
	 BjQlmEtI/Wl52M+s6tiFDpazwACyKEJ0Coprc0z7wWUm08GqlSodUDVzyJ9fLTfhMe
	 v+kB9e1cPeBd6ISw2Tay9SDLaUykUHhD3+pMt7p9WWVOh0uG3TJYYR0fndhiQKwoSR
	 Q88j5PyK4KPrdVMx1vKzfwgcsCGmTcSzMiUUODzInRjVYgm/y56VRwPFXwZ6cGFg62
	 0vVfY0WzOcw9Q==
Date: Tue, 25 Jul 2023 23:03:44 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Drew Fustini <dfustini@baylibre.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	Robert Nelson <robertcnelson@beagleboard.org>,
	Jason Kridner <jkridner@beagleboard.org>
Subject: Re: [PATCH RFC 4/4] mmc: sdhci-of-dwcmshc: Add support for T-Head
 TH1520
Message-ID: <ZL/kUPicOEPWz5NP@xhacker>
References: <20230724-th1520-emmc-v1-0-cca1b2533da2@baylibre.com>
 <20230724-th1520-emmc-v1-4-cca1b2533da2@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230724-th1520-emmc-v1-4-cca1b2533da2@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_081524_832305_D3081801 
X-CRM114-Status: GOOD (  27.59  )
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

On Mon, Jul 24, 2023 at 05:59:18PM -0700, Drew Fustini wrote:
> Add basic support for the T-Head TH1520 SoC mmc controller. The new
> compatible "thead,th1520-dwcmshc" enables basic support by:

Hi Drew,

> 
>  - Enabling v4 mode to properly communicate with the mmc device
>  - Setting quirk to disable ADMA
>  - Setting flag to disable SDMA and force PIO mode
>  - Turing .reset op into a no-op as the driver does not yet know how to
>    configure the phy. Rely on the vendor u-boot to have configured the
>    phy and do not reset the controller in Linux.

The last three itmes are not acceptable. The controller supports ADMA
well, can you plz bring in the phy driver? We can't rely on bootloader to
configure phy.

> 
> Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> ---
>  drivers/mmc/host/sdhci-of-dwcmshc.c | 42 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
> index e68cd87998c8..8573aff25a81 100644
> --- a/drivers/mmc/host/sdhci-of-dwcmshc.c
> +++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
> @@ -337,6 +337,14 @@ static void rk35xx_sdhci_reset(struct sdhci_host *host, u8 mask)
>  	sdhci_reset(host, mask);
>  }
>  
> +static void th1520_sdhci_reset(struct sdhci_host *host, u8 mask)
> +{
> +	/*
> +	 * MMC controller and phy is configured by vendor u-boot so
> +	 * take the simplistic approach of not doing reset in Linux.
> +	 */
> +}
> +
>  static const struct sdhci_ops sdhci_dwcmshc_ops = {
>  	.set_clock		= sdhci_set_clock,
>  	.set_bus_width		= sdhci_set_bus_width,
> @@ -355,6 +363,15 @@ static const struct sdhci_ops sdhci_dwcmshc_rk35xx_ops = {
>  	.adma_write_desc	= dwcmshc_adma_write_desc,
>  };
>  
> +static const struct sdhci_ops sdhci_dwcmshc_th1520_ops = {
> +	.set_clock		= sdhci_set_clock,
> +	.set_bus_width		= sdhci_set_bus_width,
> +	.set_uhs_signaling	= dwcmshc_set_uhs_signaling,
> +	.get_max_clock		= dwcmshc_get_max_clock,
> +	.reset			= th1520_sdhci_reset,
> +	.adma_write_desc	= dwcmshc_adma_write_desc,
> +};
> +
>  static const struct sdhci_pltfm_data sdhci_dwcmshc_pdata = {
>  	.ops = &sdhci_dwcmshc_ops,
>  	.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
> @@ -378,6 +395,13 @@ static const struct sdhci_pltfm_data sdhci_dwcmshc_rk35xx_pdata = {
>  		   SDHCI_QUIRK2_CLOCK_DIV_ZERO_BROKEN,
>  };
>  
> +static const struct sdhci_pltfm_data sdhci_dwcmshc_th1520_pdata = {
> +	.ops = &sdhci_dwcmshc_th1520_ops,
> +	.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN | SDHCI_QUIRK_BROKEN_DMA |
> +		  SDHCI_QUIRK_BROKEN_ADMA,
> +	.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
> +};
> +
>  static int dwcmshc_rk35xx_init(struct sdhci_host *host, struct dwcmshc_priv *dwc_priv)
>  {
>  	int err;
> @@ -434,6 +458,10 @@ static void dwcmshc_rk35xx_postinit(struct sdhci_host *host, struct dwcmshc_priv
>  }
>  
>  static const struct of_device_id sdhci_dwcmshc_dt_ids[] = {
> +	{
> +		.compatible = "thead,th1520-dwcmshc",
> +		.data = &sdhci_dwcmshc_th1520_pdata,
> +	},
>  	{
>  		.compatible = "rockchip,rk3588-dwcmshc",
>  		.data = &sdhci_dwcmshc_rk35xx_pdata,
> @@ -546,6 +574,20 @@ static int dwcmshc_probe(struct platform_device *pdev)
>  		sdhci_enable_v4_mode(host);
>  #endif
>  
> +	if (pltfm_data == &sdhci_dwcmshc_th1520_pdata) {
> +		/*
> +		 * The controller needs v4 mode enabled to properly
> +		 * communicate with the mmc device.
> +		 */
> +		sdhci_enable_v4_mode(host);
> +
> +		/*
> +		 * Set flag so the SDHCI host core will disable DMA
> +		 * and use PIO mode.
> +		 */
> +		host->flags &= ~SDHCI_USE_SDMA;
> +	}
> +
>  	host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY;
>  
>  	err = sdhci_setup_host(host);
> 
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
