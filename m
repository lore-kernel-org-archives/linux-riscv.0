Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11F3C9832F
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jan 2026 12:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1HQSyzMqYjtFExpAgji1I8ssYsiYHPKp9sbQI42wjP8=; b=gG/Vh+hDBYiY4y
	Eh7i6GXy3D+/0Y+VI1jLCMepV8BoUXD5nNLe/XuGOCCbkwewLdPwOr87lT4WHcR6zd2I6Vn/VEZ37
	TBbqco5GlklY25MlxN8WNYfZv6AdNRggyehH8xRxeWoXdjBzMlQiREAO/Y0cslg9MwiInchsAY8I5
	WN9MxZuBHvWv3RkB6ovBocBs2BpCyHvHIBABsrRupbwd474E5wXxfF2jncwMMHwE4j9Q483QC5byc
	x1/oQgOYWIwq9bre4VCdIbUlWiR7+5uDT1sb93GVa7mhUImPHwKKvZiiDrm+V2LYPL78pLy5Cdfkw
	vkmOhXTLScvpGqH2vYOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhRsi-0000000HZtg-1uko;
	Sun, 18 Jan 2026 12:27:48 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhRsf-0000000HZsw-0VtC
	for linux-riscv@lists.infradead.org;
	Sun, 18 Jan 2026 12:27:46 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4801c1ad878so23143765e9.1
        for <linux-riscv@lists.infradead.org>; Sun, 18 Jan 2026 04:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768739263; x=1769344063; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9h5PT98oehXGGTuTpwmqI77fU/XEwWQyJVUHxiP7aU=;
        b=k//2r5sKq7RuIbhglG1oMBGJ3W3xM4myI9BcO0/0JepSj0S6hs7ooe2Qs9fAp7oOLy
         IJu4anuBASfw4uuf9LMRZHk2rfp9kicNzmyATlN4CHqCa1px/MK0s/xinO7+dsADHLSx
         4+xRCcvByydeN3nrORyaWyTeufGslmK4wKZPHqlXvgguqnQWOlNIFg4OrCSGeyKSPttF
         Z8+Qh9XTxumDwZBd9QGh44zN6n0uqYsR6apY655zBZIJE2HAQLbjP/Ln8cLDvLErm93R
         1u05pygN9exzIDJBbqt+SPoJhZpThYMbNEOWMc0StqMpJTGkmpLkCN3vKX1SgGGSaiit
         YdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768739263; x=1769344063;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t9h5PT98oehXGGTuTpwmqI77fU/XEwWQyJVUHxiP7aU=;
        b=iog7aemMiAiJhZazIhn22VZdokiS4qeLbGKd+Q6p9owXb3axN92/9ALIdILgynLuVU
         7EvIAUFxx1Mahwiu9ptV87oq51t819RwtnKTa69ncP/hEeUDwKEwoTdhKWNQ4DfgYVSZ
         aPrSXe2Hc8laU6EtaS4Ak3JrwRuU3rEUkA56O5tIi1U8qLkfEf/+zod8MIK+Q5yHPqFL
         X/yIGXlz76FHzx0X3rhwIgr+IXSn7ZrRxLTlvCJ2TdRNDMy2QdjkSFoDLjmkA72OkhkE
         NtihJ9ODjvfnsnhO2lSN6owMbcX244ON2LcIQEzlPvtDUNOwIJ7EtjT4OKogndd/c9+W
         qogg==
X-Forwarded-Encrypted: i=1; AJvYcCWAJtovUU/I4wWVHwitBm7w1BIZwhagMlGmNhJPrrpirz53UUWY91NuxLB1lANHwFhxsBTFbIjj8I7w8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzsveOFr6X/QcxCX7oPM2JskN/4u5tQgqWPruQZsABPc6mRlYv
	VTmls8msoc8wcgAs/VPDl7Yj7ViNkIPrs9CAXRjyXL7fTc984aRnWH1V
X-Gm-Gg: AY/fxX7bZn7dvxRiCEF/iDID5fEOD0mTxeMJXmKH9uawQT7NzMpyp5VvbSgoCPzD+nu
	PjR5I2OVVzL6lPeH21W4m/0P6/f0HtKsq+Pnn1Fx0xaJ//JcQfGYLa+DA6ylcJoMgupdDzU/0gx
	yY+Mi4zVHlB3cvE4zI09WHUSrPEqe1SIWSqD1RvznVK3uACRAmaYdMhar7tgreGX/vFrgO7pZap
	aXYVoVqS+NfPP7W/OKkUaL9UVnqKyihMk5qu9jCTqdToXbMhTFffmJbA+Tt1PxCP+sFUNcK8PPf
	EjZ0ZvW+tGnnBSwYuWK+a9y+FVfDfFPa3uUwjLeVE8Bz3wLh+tYNl3mmrGXEDW99GbCO094IVhv
	3esHeYluXrA27pSWBPHyweMTD7S6tjMqabSAFGhL80/KjBzOujGhUb0pp7sf2mMbNFFJ6gCuu6s
	JJKyVvj282bbaexwoapPsc3uywpTBnEgj1YaMlE9LkEeU=
X-Received: by 2002:a05:600c:820d:b0:477:58:7cf4 with SMTP id 5b1f17b1804b1-4802a29f85bmr44396165e9.4.1768739262625;
        Sun, 18 Jan 2026 04:27:42 -0800 (PST)
Received: from anton.local (vps-58d0fbce.vps.ovh.net. [51.178.29.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c0475sm169474355e9.10.2026.01.18.04.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 04:27:42 -0800 (PST)
Date: Sun, 18 Jan 2026 16:27:37 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Message-ID: <aWzP-rRNKPHlWaWO@anton.local>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
 <20260118-cv1800b-i2s-driver-v2-2-d10055f68368@gmail.com>
 <20260118-pastoral-resourceful-mandrill-47bda6@quoll>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260118-pastoral-resourceful-mandrill-47bda6@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_042745_595790_6C10CF2A 
X-CRM114-Status: GOOD (  22.68  )
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

> > +++ b/sound/soc/sophgo/Kconfig
> > @@ -0,0 +1,20 @@
> > +menu "Sophgo"
> 
> Missing SPDX. Did you run checkpatch?

Actually I did. I will add SPDX and recheck again. 
Also I will take a look why checkpatch missed this. 

> 
> > +	depends on COMPILE_TEST || ARCH_SOPHGO
> > +
> > +config SND_SOC_CV1800B_TDM
> > +	tristate "Sophgo CV1800B I2S/TDM support"
> > +	depends on SND_SOC && OF
> > +	select SND_SOC_GENERIC_DMAENGINE_PCM
> > +	help
> > +	  This option enables the I2S/TDM audio controller found in Sophgo
> > +	  CV1800B / SG2002 SoCs. The controller supports standard I2S
> > +	  audio modes for playback and capture.
> > +
> > +	  The driver integrates with the ASoC framework and uses the DMA
> > +	  engine for audio data transfer. It is intended to be configured
> > +	  via Device Tree along with simple-audio-card module.
> > +
> > +	  To compile the driver as a module, choose M here: the module will
> > +	  be called cv1800b_tdm.
> > +
> 
> ...
> 
> > +static const struct snd_soc_dai_ops cv1800b_i2s_dai_ops = {
> > +	.probe = cv1800b_i2s_dai_probe,
> > +	.startup = cv1800b_i2s_startup,
> > +	.hw_params = cv1800b_i2s_hw_params,
> > +	.trigger = cv1800b_i2s_trigger,
> > +	.set_fmt = cv1800b_i2s_dai_set_fmt,
> > +	.set_bclk_ratio = cv1800b_i2s_dai_set_bclk_ratio,
> > +	.set_sysclk = cv1800b_i2s_dai_set_sysclk,
> > +};
> > +
> > +static struct snd_soc_dai_driver cv1800b_i2s_dai_template = {
> 
> Missing const
> 
> > +	.name = "cv1800b-i2s",
> > +	.playback = {
> > +		.stream_name = "Playback",
> > +		.channels_min = 1,
> > +		.channels_max = 2,
> > +		.rates = SNDRV_PCM_RATE_8000_192000,
> > +		.formats = SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S16_LE,
> > +	},
> > +	.capture = {
> > +		.stream_name = "Capture",
> > +		.channels_min = 1,
> > +		.channels_max = 2,
> > +		.rates = SNDRV_PCM_RATE_8000_192000,
> > +		.formats = SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S16_LE,
> > +	},
> > +	.ops = &cv1800b_i2s_dai_ops,
> > +};
> 
> ....
> 
> > +static int cv1800b_i2s_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct cv1800b_i2s *i2s;
> > +	struct resource *res;
> > +	void __iomem *regs;
> > +	struct snd_soc_dai_driver *dai;
> > +	int ret;
> > +
> > +	i2s = devm_kzalloc(dev, sizeof(*i2s), GFP_KERNEL);
> > +	if (!i2s)
> > +		return -ENOMEM;
> > +
> > +	regs = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(regs))
> > +		return PTR_ERR(regs);
> > +	i2s->dev = &pdev->dev;
> > +	i2s->base = regs;
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	if (!res)
> > +		return -ENODEV;
> > +	cv1800b_setup_dma_struct(i2s, res->start);
> > +
> > +	i2s->clk = devm_clk_get_enabled(dev, "i2s");
> > +	if (IS_ERR(i2s->clk))
> > +		return dev_err_probe(dev, PTR_ERR(i2s->clk),
> > +				     "failed to get+enable i2s\n");
> > +	i2s->sysclk = devm_clk_get_enabled(dev, "mclk");
> > +	if (IS_ERR(i2s->sysclk))
> > +		return dev_err_probe(dev, PTR_ERR(i2s->sysclk),
> > +				     "failed to get+enable mclk\n");
> > +
> > +	platform_set_drvdata(pdev, i2s);
> > +	cv1800b_i2s_setup_tdm(i2s);
> > +
> > +	dai = devm_kmemdup(dev, &cv1800b_i2s_dai_template, sizeof(*dai),
> > +			   GFP_KERNEL);
> > +	if (!dai)
> > +		return -ENOMEM;
> > +
> > +	ret = devm_snd_soc_register_component(dev, &cv1800b_i2s_component, dai,
> > +					      1);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = devm_snd_dmaengine_pcm_register(dev, &cv1800b_i2s_pcm_config, 0);
> > +	if (ret) {
> > +		dev_err(dev, "dmaengine_pcm_register failed: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	dev_dbg(dev, "cv1800b I2S probed:\n");
> 
> Drop, drivers should be silent and probe success message does not
> warrant even debug. What are you debugging - that you wrote correct DTS?
> You can check in sysfs that device probed.

Will do, thanks. 

> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
