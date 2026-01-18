Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023D5D4A5F4
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jan 2026 10:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PI0aFNJNdH2x3Mipyq0WxjH+N84PnKav0KJOrL8NwKA=; b=0ugVBN0sVz/bgi
	dQyYH7shG5fymiaCoT4d0jx2pwtSqe6/E9v3/zwgGvNdCb0C0rNroJgds6xfiDDoZow6EzlvoNlYs
	GfBBHX5x2fhz6ncpBwBQSMmgrFXGHEqBUV2dUPi/TRl4JPADH4KUn8A3PHIaBGhMxGcbS9q+R4J4C
	AEGr8ea4neMXo4etgUDfwYwbRakKCLHVfW6rviXrJE9rlLSNkH/BV8BDjBQ3Qy4f2TABeM7WrKJtP
	IzAQ9NBWx6jFdiLvDNIaxoL9zeY7gft5J3L8MfOTxAJ2b0u4otzTgDhDNrUDh3xHShXG9dEj3I51r
	kWge0IkoteRiGgqRznMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhPtR-0000000HJgB-2bxN;
	Sun, 18 Jan 2026 10:20:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhPtP-0000000HJfH-2nH0
	for linux-riscv@lists.infradead.org;
	Sun, 18 Jan 2026 10:20:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1EBFF4391C;
	Sun, 18 Jan 2026 10:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5E9C116D0;
	Sun, 18 Jan 2026 10:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768731623;
	bh=MCyGa/BUqs4R4ryirQHJ++YmqeUQEZA1xHvjnETicMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ae3ei5zdIw39P6bNqNxdvsMiP+MCPZPCguCBXVA8wzYYHAR4MwnRI0uemLElnFagJ
	 SGaR/TFJpMYXnqcD6rBYJGtCiPXiZFpAJbUOdfLgQaZ7kgw4rOlDVVtv+sOGTOY9K/
	 4/f74zA25kEY0h1mqB3TUKKJR5MhmGLTHvlp1VYoeHR2svDIlyzLLonbK71L7mtapC
	 l8gKdpLI55GtUc9agpaUx/+CdKTgH6npkT+BW+TWZpKvIWZb7sCHE+f4+uTPoyAsqb
	 a8ycyhVGf3A4EiPMM80AgMcE2rO3BaT7WpT92EBm26ZcqeTTKL6nNkMWggrxpxiVYS
	 DS4gp9KwWnfJw==
Date: Sun, 18 Jan 2026 11:20:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/7] ASoC: sophgo: add CV1800B I2S/TDM controller
 driver
Message-ID: <20260118-pastoral-resourceful-mandrill-47bda6@quoll>
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
 <20260118-cv1800b-i2s-driver-v2-2-d10055f68368@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260118-cv1800b-i2s-driver-v2-2-d10055f68368@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_022023_791012_43160A3C 
X-CRM114-Status: GOOD (  28.66  )
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

On Sun, Jan 18, 2026 at 12:18:54AM +0400, Anton D. Stavinskii wrote:
> The actual CPU DAI controller. The driver can be used with
> simple-audio-card. It respects fixed clock configuration
> from simple-audio-card. The card driver can request direction out,
> this will be interpreted as mclk out, the clock which can be used
> in other CPU or codecs. For example I2S3 generates clock for ADC.
> I2S was tested in S24_32 and S16 dual channel formats.
> 
> Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
> ---
>  sound/soc/Kconfig              |   1 +
>  sound/soc/Makefile             |   1 +
>  sound/soc/sophgo/Kconfig       |  20 ++
>  sound/soc/sophgo/Makefile      |   3 +
>  sound/soc/sophgo/cv1800b-tdm.c | 714 +++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 739 insertions(+)
> 
> diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
> index 36e0d443ba0e..edfdcbf734fe 100644
> --- a/sound/soc/Kconfig
> +++ b/sound/soc/Kconfig
> @@ -127,6 +127,7 @@ source "sound/soc/renesas/Kconfig"
>  source "sound/soc/rockchip/Kconfig"
>  source "sound/soc/samsung/Kconfig"
>  source "sound/soc/sdca/Kconfig"
> +source "sound/soc/sophgo/Kconfig"
>  source "sound/soc/spacemit/Kconfig"
>  source "sound/soc/spear/Kconfig"
>  source "sound/soc/sprd/Kconfig"
> diff --git a/sound/soc/Makefile b/sound/soc/Makefile
> index 8c0480e6484e..21d8406767fc 100644
> --- a/sound/soc/Makefile
> +++ b/sound/soc/Makefile
> @@ -70,6 +70,7 @@ obj-$(CONFIG_SND_SOC)	+= rockchip/
>  obj-$(CONFIG_SND_SOC)	+= samsung/
>  obj-$(CONFIG_SND_SOC)	+= sdca/
>  obj-$(CONFIG_SND_SOC)	+= sof/
> +obj-$(CONFIG_SND_SOC)   += sophgo/
>  obj-$(CONFIG_SND_SOC)	+= spacemit/
>  obj-$(CONFIG_SND_SOC)	+= spear/
>  obj-$(CONFIG_SND_SOC)	+= sprd/
> diff --git a/sound/soc/sophgo/Kconfig b/sound/soc/sophgo/Kconfig
> new file mode 100644
> index 000000000000..70f07d46c810
> --- /dev/null
> +++ b/sound/soc/sophgo/Kconfig
> @@ -0,0 +1,20 @@
> +menu "Sophgo"

Missing SPDX. Did you run checkpatch?

> +	depends on COMPILE_TEST || ARCH_SOPHGO
> +
> +config SND_SOC_CV1800B_TDM
> +	tristate "Sophgo CV1800B I2S/TDM support"
> +	depends on SND_SOC && OF
> +	select SND_SOC_GENERIC_DMAENGINE_PCM
> +	help
> +	  This option enables the I2S/TDM audio controller found in Sophgo
> +	  CV1800B / SG2002 SoCs. The controller supports standard I2S
> +	  audio modes for playback and capture.
> +
> +	  The driver integrates with the ASoC framework and uses the DMA
> +	  engine for audio data transfer. It is intended to be configured
> +	  via Device Tree along with simple-audio-card module.
> +
> +	  To compile the driver as a module, choose M here: the module will
> +	  be called cv1800b_tdm.
> +

...

> +static const struct snd_soc_dai_ops cv1800b_i2s_dai_ops = {
> +	.probe = cv1800b_i2s_dai_probe,
> +	.startup = cv1800b_i2s_startup,
> +	.hw_params = cv1800b_i2s_hw_params,
> +	.trigger = cv1800b_i2s_trigger,
> +	.set_fmt = cv1800b_i2s_dai_set_fmt,
> +	.set_bclk_ratio = cv1800b_i2s_dai_set_bclk_ratio,
> +	.set_sysclk = cv1800b_i2s_dai_set_sysclk,
> +};
> +
> +static struct snd_soc_dai_driver cv1800b_i2s_dai_template = {

Missing const

> +	.name = "cv1800b-i2s",
> +	.playback = {
> +		.stream_name = "Playback",
> +		.channels_min = 1,
> +		.channels_max = 2,
> +		.rates = SNDRV_PCM_RATE_8000_192000,
> +		.formats = SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S16_LE,
> +	},
> +	.capture = {
> +		.stream_name = "Capture",
> +		.channels_min = 1,
> +		.channels_max = 2,
> +		.rates = SNDRV_PCM_RATE_8000_192000,
> +		.formats = SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S16_LE,
> +	},
> +	.ops = &cv1800b_i2s_dai_ops,
> +};

....

> +static int cv1800b_i2s_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct cv1800b_i2s *i2s;
> +	struct resource *res;
> +	void __iomem *regs;
> +	struct snd_soc_dai_driver *dai;
> +	int ret;
> +
> +	i2s = devm_kzalloc(dev, sizeof(*i2s), GFP_KERNEL);
> +	if (!i2s)
> +		return -ENOMEM;
> +
> +	regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
> +	i2s->dev = &pdev->dev;
> +	i2s->base = regs;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -ENODEV;
> +	cv1800b_setup_dma_struct(i2s, res->start);
> +
> +	i2s->clk = devm_clk_get_enabled(dev, "i2s");
> +	if (IS_ERR(i2s->clk))
> +		return dev_err_probe(dev, PTR_ERR(i2s->clk),
> +				     "failed to get+enable i2s\n");
> +	i2s->sysclk = devm_clk_get_enabled(dev, "mclk");
> +	if (IS_ERR(i2s->sysclk))
> +		return dev_err_probe(dev, PTR_ERR(i2s->sysclk),
> +				     "failed to get+enable mclk\n");
> +
> +	platform_set_drvdata(pdev, i2s);
> +	cv1800b_i2s_setup_tdm(i2s);
> +
> +	dai = devm_kmemdup(dev, &cv1800b_i2s_dai_template, sizeof(*dai),
> +			   GFP_KERNEL);
> +	if (!dai)
> +		return -ENOMEM;
> +
> +	ret = devm_snd_soc_register_component(dev, &cv1800b_i2s_component, dai,
> +					      1);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_snd_dmaengine_pcm_register(dev, &cv1800b_i2s_pcm_config, 0);
> +	if (ret) {
> +		dev_err(dev, "dmaengine_pcm_register failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	dev_dbg(dev, "cv1800b I2S probed:\n");

Drop, drivers should be silent and probe success message does not
warrant even debug. What are you debugging - that you wrote correct DTS?
You can check in sysfs that device probed.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
