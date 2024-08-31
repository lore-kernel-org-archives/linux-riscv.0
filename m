Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3F1CA101C
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Aug 2024 11:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sf1CoTBIblafgP4vLi387I8AiJC3+Sw8sjSMUQICkJs=; b=f/NaadPkhTpTMt
	9wpugbqig06+/iTxOrIZlT26KtebjR/peXjEGLiivVIze2Z3tgyQOkEq1IIEP33PQkmE6ARZoglCA
	fe9ZBasjYnhhbsObyf13YWnxA8VZXpj1inIAMDi7WB1wvetS8acugPQQx6SXJQazWBb1ge7Fqz3Aj
	bjAIY3sUnqxYtXae6budQS8kce/apP+WmaODae/XvSCT9asuLJPKKGt+eeli/5K3jMAHT/ueeVq9g
	WIpkvVWMRxYFMbCZc94rTtjO5OSmP7oyi+lQZwbVQta0MJFC7Q1GlzG2+Jbqs/FojoJHerFG+lpRx
	B42y1pmoONLk+ZaTp/Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skM1T-00000009BzH-0Cth;
	Sat, 31 Aug 2024 11:12:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skM0R-00000009Bn4-0f1i
	for linux-riscv@lists.infradead.org;
	Sat, 31 Aug 2024 11:11:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A9325C0FB5;
	Sat, 31 Aug 2024 11:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184D2C4CEC0;
	Sat, 31 Aug 2024 11:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725102658;
	bh=o+aySaL7w/0qvTUTmTKr4PdL//PX2C9y7fl4H4AiQnk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SCS1ylG/9h9cbIEWYjsDw7CkXk/d0CGO6MvG5TU8RtZbjpABTgjHmM78tjxN0PwVq
	 D9b9RV+IWQ4oanQXrXsCZ3mZJTk0W0DefGsnf4bwEDkik6fHCaaKOFxqFCjVv/HbLN
	 pqmBIpxx6YCJowVQONdODz4aBFTZdlXqtkamtaqjfP3ZU5NygwEsNwFqFDywlpe1+S
	 nX0bmPm5+5xiy07p8E+f8XAv4pxfrfESSPsuVgsmKxauKUPTyyh7R0zLHRiUjFw3qV
	 qOZqsKqRacnJu83H+e5dp1zKbILwLViFcLkV0Ebgr8s+m1DQN8Rqi1TBjxdTCIAGLm
	 pnOhGY6TJR3Qg==
Date: Sat, 31 Aug 2024 12:10:49 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?B?TWlxdcOobA==?= Raynal
 <miquel.raynal@bootlin.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 2/3] iio: adc: sophgo-saradc: Add driver for Sophgo
 CV1800B SARADC
Message-ID: <20240831121049.517c95f7@jic23-huawei>
In-Reply-To: <20240829-sg2002-adc-v5-2-aacb381e869b@bootlin.com>
References: <20240829-sg2002-adc-v5-0-aacb381e869b@bootlin.com>
	<20240829-sg2002-adc-v5-2-aacb381e869b@bootlin.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240831_041059_365673_7AEA8F16 
X-CRM114-Status: GOOD (  15.07  )
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

Minor stuff inline.

I'll fix up whilst applying.

Jonathan

> diff --git a/drivers/iio/adc/sophgo-cv1800b-adc.c b/drivers/iio/adc/sophgo-cv1800b-adc.c
> new file mode 100644
> index 000000000000..f4cdec966694
> --- /dev/null
> +++ b/drivers/iio/adc/sophgo-cv1800b-adc.c
> @@ -0,0 +1,218 @@

> +static int cv1800b_adc_read_raw(struct iio_dev *indio_dev,
> +				struct iio_chan_spec const *chan,
> +				int *val, int *val2, long mask)
> +{
> +	struct cv1800b_adc *saradc = iio_priv(indio_dev);
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:{
> +		u32 sample;
> +
> +		scoped_guard(mutex, &saradc->lock) {
> +			int ret;
> +
> +			cv1800b_adc_start_measurement(saradc, chan->scan_index);
> +			ret = cv1800b_adc_wait(saradc);
> +			if (ret < 0)
> +				return ret;
> +
> +			sample = readl(saradc->regs + CV1800B_ADC_CH_RESULT_REG(chan->scan_index));
> +		}
> +		if (!(sample & CV1800B_ADC_CH_VALID))
> +			return -ENODATA;
> +
> +		*val = sample & CV1800B_ADC_CH_RESULT;
> +		return IIO_VAL_INT;
> +		}
> +	case IIO_CHAN_INFO_SCALE:
> +		*val = 3300;
> +		*val2 = 12;
> +		return IIO_VAL_FRACTIONAL_LOG2;
> +	case IIO_CHAN_INFO_SAMP_FREQ:

This needs  {} as per the build bot.
If nothing major comes up, I'll tweak whilst applying.

> +		u32 status_reg = readl(saradc->regs + CV1800B_ADC_CYC_SET_REG);
> +		int clk_div = (1 + FIELD_GET(CV1800B_MASK_CLKDIV, status_reg));
> +		int freq = clk_get_rate(saradc->clk) / clk_div;
> +		int nb_startup_cycle = 1 + FIELD_GET(CV1800B_MASK_STARTUP_CYCLE, status_reg);
> +		int nb_sample_cycle = 1 + FIELD_GET(CV1800B_MASK_SAMPLE_WINDOW, status_reg);
> +		int nb_compare_cycle = 1 + FIELD_GET(CV1800B_MASK_COMPARE_CYCLE, status_reg);
> +
> +		*val = freq / (nb_startup_cycle + nb_sample_cycle + nb_compare_cycle);
> +		return IIO_VAL_INT;
> +	default:
> +		return -EINVAL;
> +	}
> +}

> +static int cv1800b_adc_probe(struct platform_device *pdev)
> +{
> +	struct cv1800b_adc *saradc;
> +	struct iio_dev *indio_dev;
> +	int ret;
> +
> +	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*saradc));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	saradc = iio_priv(indio_dev);
> +	indio_dev->name = "sophgo-cv1800b-adc";
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +	indio_dev->info = &cv1800b_adc_info;
> +	indio_dev->num_channels = ARRAY_SIZE(sophgo_channels);
> +	indio_dev->channels = sophgo_channels;
> +
> +	saradc->clk = devm_clk_get_enabled(&pdev->dev, NULL);
> +	if (IS_ERR(saradc->clk))
> +		return PTR_ERR(saradc->clk);
> +
> +	saradc->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(saradc->regs))
> +		return PTR_ERR(saradc->regs);
> +
> +	saradc->irq = platform_get_irq_optional(pdev, 0);
> +	if (saradc->irq >= 0) {
> +		init_completion(&saradc->completion);
> +		ret = devm_request_irq(&pdev->dev, saradc->irq,
> +				       cv1800b_adc_interrupt_handler, 0,
> +				       dev_name(&pdev->dev), saradc);
> +		if (ret)
> +			return ret;
> +
> +		writel(1, saradc->regs + CV1800B_ADC_INTR_EN_REG);
> +	}
> +
> +	ret = devm_mutex_init(&pdev->dev, &saradc->lock);
> +	if (ret)
> +		return ret;

Blank line here slightly helps readability as two unrelated blocks of code.

> +	writel(FIELD_PREP(CV1800B_MASK_STARTUP_CYCLE, 15) |
> +	       FIELD_PREP(CV1800B_MASK_SAMPLE_WINDOW, 15) |
> +	       FIELD_PREP(CV1800B_MASK_CLKDIV, 1) |
> +	       FIELD_PREP(CV1800B_MASK_COMPARE_CYCLE, 15),
> +	       saradc->regs + CV1800B_ADC_CYC_SET_REG);
> +
> +	return devm_iio_device_register(&pdev->dev, indio_dev);
> +}


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
