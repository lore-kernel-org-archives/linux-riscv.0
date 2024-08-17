Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93407C52D7D
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Aug 2024 13:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ugb3E0mNrhWOIxW3tlIm2zmCOF3jKUrtHr0PvndxkbM=; b=hWNBASxqswitTq
	vAVCJLPJElaetxPmyPWIpl2ntXXjnNbCPZTI3O5rnaDfu9MnkJg4ETelSokVi9y6drkZ56icCgdDR
	asaLa947EEnf9lKfnOBBwxDoQKXdZxsG4MAdAhFKwenqY2QJIE2z1fBThdgWNi8s3OWLA2Sxccyw1
	PADEwFvC92yyieUDE7cr8Pee/hOSx/PRzU/2vintv+hrgw6wgrONjQ9T9CjglNuJ1iHfUgG8Oa8FC
	1aKDRNK5LnoupHqHn9tlsnF7uqdPgHLnsyRwa/6ulzoqHXVH45oPKXHSROJ7vJiT0NHgMimgLGEE1
	UnVV/9kMGmtx81U2mkgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfJ7l-0000000FEc0-02ZQ;
	Sat, 17 Aug 2024 13:05:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfJ7i-0000000FEba-1U45
	for linux-riscv@lists.infradead.org;
	Sat, 17 Aug 2024 13:05:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 185C2621B0;
	Sat, 17 Aug 2024 13:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9825BC116B1;
	Sat, 17 Aug 2024 13:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723899936;
	bh=ynNt+qJtq1GzV89D76JrRGwxuyN/mwj7wAUxZty0RdI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gtTbljhRNWfbu8mQXFzCcwJGFYssq8HLr5wsVb3erywUw3VacOH5pxZK1JQawlUr6
	 d5d67vkY2bgPhnNdGL3haWx5pS9xgW4Jbi8U7i7SByzD/Nrp4HUbTC0OqdJcDwH7zs
	 +8Q41T+TeLUUB87zsXFoZUf5V9sKpQYP2cbV8MlHKvmn3zEMjL1D2Ln9dL2SMgOifS
	 tHO5A4udD0eANPE+7bBUvLeoF6P9NA/2woXJVDBwmtnVT9cv/fb49F1xat8SZHSRAb
	 DJ6nqYVhT70Gi1NIslOd1AzSvQbg9QMOpkeAi9Pp91aoBCFpUHulTE5bfu7GgALMST
	 zCx9tTXAMyrQQ==
Date: Sat, 17 Aug 2024 14:05:26 +0100
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
Subject: Re: [PATCH v4 2/3] iio: adc: sophgo-saradc: Add driver for Sophgo
 CV18XX series SARADC
Message-ID: <20240817140526.579cd9cc@jic23-huawei>
In-Reply-To: <20240812-sg2002-adc-v4-2-599bdb67592f@bootlin.com>
References: <20240812-sg2002-adc-v4-0-599bdb67592f@bootlin.com>
	<20240812-sg2002-adc-v4-2-599bdb67592f@bootlin.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240817_060538_705418_4621ECA3 
X-CRM114-Status: GOOD (  16.62  )
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

On Mon, 12 Aug 2024 17:00:56 +0200
Thomas Bonnefille <thomas.bonnefille@bootlin.com> wrote:

> This adds a driver for the common Sophgo SARADC.
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Similar comment on wild cards to the one you resolved in the dt binding
applies to the driver.

So normally convention is pick a part and name after that for
all function names, parameters etc.

cv1800b seems appropriate given the binding.

Other than that, just one trivial comment from me.

Jonathan


> diff --git a/drivers/iio/adc/sophgo-cv18xx-adc.c b/drivers/iio/adc/sophgo-cv18xx-adc.c
> new file mode 100644
> index 000000000000..ab7ee0f482cc
> --- /dev/null
> +++ b/drivers/iio/adc/sophgo-cv18xx-adc.c
> @@ -0,0 +1,208 @@

> +static int cv18xx_adc_probe(struct platform_device *pdev)
> +{
> +	struct cv18xx_adc *saradc;
> +	struct iio_dev *indio_dev;
> +	struct clk *clk;
> +	int ret;
> +
> +	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*saradc));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	saradc = iio_priv(indio_dev);
> +	indio_dev->name = "sophgo-cv18xx-adc";
This definitely doesn't want to be wildcard based

> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +	indio_dev->info = &cv18xx_adc_info;
> +	indio_dev->num_channels = ARRAY_SIZE(sophgo_channels);
> +	indio_dev->channels = sophgo_channels;
> +
> +	clk = devm_clk_get_enabled(&pdev->dev, NULL);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	saradc->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(saradc->regs))
> +		return PTR_ERR(saradc->regs);
> +
> +	saradc->irq = platform_get_irq_optional(pdev, 0);
> +	if (saradc->irq >= 0) {
> +		init_completion(&saradc->completion);
> +		ret = devm_request_irq(&pdev->dev, saradc->irq,
> +				       cv18xx_adc_interrupt_handler, 0,
> +				       dev_name(&pdev->dev), saradc);
> +		if (ret)
> +			return ret;
> +
> +		writel(1, saradc->regs + CV18XX_ADC_INTR_EN_REG);
> +	}
> +
> +	ret = devm_mutex_init(&pdev->dev, &saradc->lock);
> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, indio_dev);

Is this used?

> +	writel(FIELD_PREP(CV18XX_ADC_DEF_STARTUP_CYCLE_MASK, 0xF) |
> +	       FIELD_PREP(CV18XX_ADC_DEF_SAMPLE_WINDOW_MASK, 0xF) |
> +	       FIELD_PREP(CV18XX_ADC_DEF_CLOCK_DIVIDER_MASK, 0x1) |
> +	       FIELD_PREP(CV18XX_ADC_DEF_COMPARE_CYCLE_MASK, 0xF),
> +	       saradc->regs + CV18XX_ADC_CYC_SET_REG);
> +
> +	return devm_iio_device_register(&pdev->dev, indio_dev);
> +}


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
