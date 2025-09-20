Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B65CCAC5A5
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 16:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6MxXSlrsHdYmUiOVHeIaLSHW4YRNA04f5reZlHdQJaI=; b=I7Feqb7dhqa+m4
	jCFTQq6k8Q0GG4ZrA3JEAbzrJUKNb0SzQUX5csGSE1pDh5sLUw8/MYxV5RBj1l0A6HzzTdd/Wx59Y
	vT43Ns5GfmYCc+wGHaNcJZx/qH3gTQ7KwdkypBCUj6Yyg/dHnsc/S4UyJTUY+W3rvNo+oEuE3tRn1
	jB0Hk+2TXbLlX2yWs/vD4pd2N0bd09J6zdzDDwtluwGjtrRV0b6kwzkC8s6AXJ2e6bMPk04FJI/Uj
	fS33tSd8GRTSpefdBPZhFft2taziwKHvK3SdYLR2FrGaIluc+cLyUkkcxMDpdVSNXhvq3j+klOtpP
	2E5yQjH+xlzY/eG+ObAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v000M-00000005Zzl-0apA;
	Sat, 20 Sep 2025 16:00:06 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v000I-00000005Zy0-3wSC
	for linux-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 16:00:04 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-4242bb22132so29667555ab.3
        for <linux-riscv@lists.infradead.org>; Sat, 20 Sep 2025 09:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758384001; x=1758988801; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C6PlODS/te36zEm/c54Mnhcz+Tcquz9ec/vMr/RjPtI=;
        b=0oKE6jzEv2pQewAqa2pwXIUU5w1TK8kgQUhS/387vO9KBCaLjsSOjFT/wnpxaMHD2I
         gGoGIvfaCC7HmZV1+p9TVQrtOD1QNIKUiFeeM53MZJMUkGfQuz57gEPUDDqT4Rb0bQTr
         ufOGbIai8tIGp+auQfuTX/rHsXAcoU4+Vm/9qcAvvAvSOqPWTbVJsFL0TGu2pGht7RtQ
         A6UX9m+Ltnm8FZEC8sUt6wd+N9MHnsFLKzxLOmthIYAokswIXbC3GadmFFHPypAWTF05
         OQW1/6v2Sn1jPe2N0fEdcM4IJy6BwzryBxRnCVkjYntk2vWpsAp9y6DQYcdFBgVNOEqJ
         hqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758384001; x=1758988801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C6PlODS/te36zEm/c54Mnhcz+Tcquz9ec/vMr/RjPtI=;
        b=J7l/VFI/LaJf0v6rHY70qdsUjBptyQuEwG7k34nhxKcbHIQwnyEQ5NMDlQNeTLB16a
         eyNT64gwsAzxxgZU/FKiWPRYueer3+yA8UZ/rEXpUQ+p7h8NYDvCo8NXoRUzqait5eb5
         bYnON5Y77pQkiURqGKwt/1+ppIS/ZF1jkT0ye43+4VaEA65UR3So/LSrhWB9drOvJ7bK
         +GxK5f8lXlBeZDZYw4PJ1CQST2oPxJBeHgZJZ9g+l8LThv5bff8J6g3p/zjR5FjjKcim
         eiZUCeYKEtEC0faAT7ePdObc/Ngm3Tcv9ppeKEapWlggWf9OoGsErqT4m1aqkfLEga3l
         vbKg==
X-Forwarded-Encrypted: i=1; AJvYcCWhkS9ldKqhbGJ8PEHM6hcXsOlSgEzcP8gj4RGNrVAtjt63BqAlyU7emaTICzfM4qXhIpHdDHEfDcv3/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFhTSN34XjcWL/ektmeyfaZVtuNPYUNzdQqmNSzDYx4aHMVSQ5
	8a+uEgK0BSsnLR7LKGuKzs4cFXXrNX2O6WyJAX2KznLkSV7EWN+r2Ta9MRhwDZsZpvg=
X-Gm-Gg: ASbGnct/3qcW3LXu4K89dLLxlchZ2vz5LH2hdMu3Bln53psX5ilbAPrVcdjDsGv1Bk1
	N8ZKsfOB5dTxHqwk8Te/LcgWGHxoU59jvHF4PAZCWBDJ+ZGddPYCoYIo20cPy12Lu87+FGji59F
	B9KWZdzqOre8cBOJL8dUhvEc1vwwdsTcA7/6SpKhaVBTxjWyzx1Gkui2LSUcjVEcu4v9qNNNJOw
	bo7heCz3YdAwUY6hDpmlt5S2lB+CPmOsyR+/CMYQklO05JPSSK51HUxSMNuuIALW47DhnAlfcB6
	E6tzUUAowle0hZb1nAq+02oTtcSaOxuRWGm/alb/FZzqQwrBtVWfVOWQljafftcwY/o6WsCgT/C
	haAMcKu7gr23tSkL5K5RYt057SfmR8IY2uVY6Jy8Xt0SpxooqlqxeoMgYnlGlrg==
X-Google-Smtp-Source: AGHT+IEYudR+gY4osM7EXsgeTUGXkWk8dyLDUfBMwlEzSHDNS9I9DR2PejT5vWtn2160i7yeUhZThw==
X-Received: by 2002:a05:6e02:481c:b0:424:85b0:e1cb with SMTP id e9e14a558f8ab-42485b0e39amr80339845ab.31.1758384001381;
        Sat, 20 Sep 2025 09:00:01 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d5399014dsm3493825173.59.2025.09.20.08.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Sep 2025 09:00:00 -0700 (PDT)
Message-ID: <3c9aaa62-f685-47f7-a21c-00f51550f185@riscstar.com>
Date: Sat, 20 Sep 2025 10:59:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] spi: spacemit: introduce SpacemiT K1 SPI
 controller driver
To: Vivian Wang <wangruikang@iscas.ac.cn>, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dlan@gentoo.org, ziyao@disroot.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250919155914.935608-1-elder@riscstar.com>
 <20250919155914.935608-3-elder@riscstar.com>
 <a7070f3f-8857-4834-9e9e-02068637075c@iscas.ac.cn>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <a7070f3f-8857-4834-9e9e-02068637075c@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_090003_259775_248A5BA6 
X-CRM114-Status: GOOD (  44.44  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 9/19/25 10:52 PM, Vivian Wang wrote:
> Hi Alex,
> 
> On 9/19/25 23:59, Alex Elder wrote:
>> [...]
>>
>> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
>> index 82fa5eb3b8684..4f6c446c6bc16 100644
>> --- a/drivers/spi/Kconfig
>> +++ b/drivers/spi/Kconfig
>> @@ -1071,6 +1071,14 @@ config SPI_SG2044_NOR
>>   	  also supporting 3Byte address devices and 4Byte address
>>   	  devices.
>>   
>> +config SPI_SPACEMIT_K1
>> +	tristate "K1 SPI Controller"
>> +	depends on ARCH_SPACEMIT || COMPILE_TEST
>> +	depends on OF
>> +	default ARCH_SPACEMIT
>> +	help
>> +	  Enable support for the SpacemiT K1 SPI controller.
>> +
> 
> We could still add:
> 
> 	imply MMP_PDMA if ARCH_SPACEMIT

I have never used "imply", I guess it's new (as of 2016)...

This sounds like a good suggestion.  This would mean MMP_PDMA
would by default take the same value as SPI_SPACEMIT_K1 (if
the former's dependencies were met), while allowing it to be
deselected for the configuration.
  > To add a "recommended" dependency. This way, enabling SPI_SPACEMIT_K1
> automatically enables MMP_PDMA, but if the user is willing to fiddle
> around, they can explicitly disable it. What do you think?

I like it.

>>   config SPI_SPRD
>>   	tristate "Spreadtrum SPI controller"
>>   	depends on ARCH_SPRD || COMPILE_TEST
>>
>> [...]
>>
>> diff --git a/drivers/spi/spi-spacemit-k1.c b/drivers/spi/spi-spacemit-k1.c
>> new file mode 100644
>> index 0000000000000..8d564fe6c4303
>> --- /dev/null
>> +++ b/drivers/spi/spi-spacemit-k1.c
>> @@ -0,0 +1,968 @@
>>
>> [...]
>>
>> +static void k1_spi_read_word(struct k1_spi_driver_data *drv_data)
>> +{
>> +	struct k1_spi_io *rx = &drv_data->rx;
>> +	u32 bytes = drv_data->bytes;
>> +	u32 val;
>> +
>> +	val = readl(drv_data->base + SSP_DATAR);
>> +	rx->resid -= bytes;
>> +
>> +	if (!rx->buf)
>> +		return;	/* Null reader: discard the data */
>> +
>> +	if (bytes == 1)
>> +		*(u8 *)rx->buf = val;
>> +	else if (bytes == 1)
> 
> Typo? else if (bytes == 2)

Wow.  Yes that is an error that I'll correct.

>> +		*(u16 *)rx->buf = val;
>> +	else
>> +		*(u32 *)rx->buf = val;
> 
> Maybe
> 
> 	else if (bytes == 4)
> 		*(u32 *)rx->buf = val;
> 	else
> 		WARN_ON_ONCE(1);

The value of bytes will be 1, 2, or 4, which we can tell
by inspection.  At one time I had a switch statement with
a default, but I decided to leave out the default, which
won't happen.

> Just to make the pattern consistent? Same for k1_spi_write_word.

Consistent with what?

>> +	rx->buf += bytes;
>> +}
>>
>> [...]
>>
>> +static int k1_spi_dma_setup(struct k1_spi_driver_data *drv_data)
>> +{
>> +	struct device *dev = drv_data->dev;
>> +	int rx_ret;
>> +	int tx_ret;
>> +
>> +	/* We must get both DMA channels, or neither of them */
>> +	rx_ret = k1_spi_dma_setup_io(drv_data, true);
>> +	if (rx_ret == -EPROBE_DEFER)
>> +		return -EPROBE_DEFER;
>> +
>> +	tx_ret = k1_spi_dma_setup_io(drv_data, false);
>> +
>> +	/* If neither is specified, we don't use DMA */
>> +	if (rx_ret == -ENODEV && tx_ret == -ENODEV)
>> +		return 0;
>> +
>> +	if (rx_ret || tx_ret)
>> +		goto err_cleanup;
> 
> This seems a bit convoluted. I'm wondering if all this explicit handling
> really is necessary - if we get an error at probe time, can we just
> return that error and let devres handle the rest? With the special case
> that if we get both -ENODEV then disable DMA.

I agree it seems it should be less complex.

I'm trying to ensure that both channels are set up, or
that neither channel is set up, or that we try again if
we get -EPROBE_DEFER.  And if there's something wrong
with the configuration (only one of TX and RX is set up
successfully), an error occurs.

RX		TX		Result
--		--		------
0		0		0	(DMA)
-ENODEV		-ENODEV		0	(PIO)
-EPROBE_DEFER	(anything)	-EPROBE_DEFER (try again)
(anything)	-EPROBE_DEFER	-EPROBE_DEFER (try again)
0		-ENODEV		-ENODEV	(error, abort probe)
-ENODEV		0		-ENODEV	(error, abort probe)
error		(anything)	error	(error, abort probe)
(anything)	error		error	(error, abort probe)

Finally, if the buffer allocation fails:
0		0		0	(PIO; clean up TX and RX)

Let me think about this.  I'll see if I can find a simpler way
to achieve the above result, relying on devres to clean things
up.  I'd have to change k1_spi_dma_cleanup(), but you might be
right that it could be done more simply.

> k1_spi_dma_cleanup_io seems to handle unmapping and termination of DMA,
> which we... don't need, right?
> 
>> +
>> +	drv_data->dummy = devm_kzalloc(dev, SZ_2K, GFP_KERNEL);
>> +	if (drv_data->dummy)
>> +		return 0;		/* Success! */
>> +
>> +	dev_warn(dev, "error allocating DMA dummy buffer; DMA disabled\n");
> 
> Just return -ENOMEM. If we can't even allocate 2K of buffer, we're
> doomed anyway.

You're generally right, but I don't want my code to assume that.

>> +err_cleanup:
>> +	if (tx_ret) {
>> +		if (tx_ret != -EPROBE_DEFER)
>> +			dev_err(dev, "error requesting DMA TX DMA channel\n");
>> +	} else {
>> +		k1_spi_dma_cleanup_io(drv_data, false);
>> +	}
>> +
>> +	if (rx_ret)
>> +		dev_err(dev, "error requesting DMA RX DMA channel\n");
>> +	else
>> +		k1_spi_dma_cleanup_io(drv_data, true);
>> +
>> +	if (tx_ret == -EPROBE_DEFER)
>> +		return -EPROBE_DEFER;
>> +
>> +	/* Return success if we don't get the dummy buffer; PIO will be used */
>> +
>> +	return rx_ret ? : tx_ret ? : 0;
>> +}
>>
>> [...]
>>
>> +static int devm_k1_spi_dma_setup(struct k1_spi_driver_data *drv_data)
>> +{
>> +	struct k1_spi_driver_data **ptr;
>> +	int ret;
>> +
>> +	if (!IS_ENABLED(CONFIG_MMP_PDMA)) {
>> +		dev_warn(drv_data->dev, "DMA not available; using PIO\n");
>> +		return 0;
>> +	}
>> +
> 
> Shouldn't be necessary if we do the "imply" thing in Kconfig.

The messages I provide are based on an assumption that using
DMA is desirable and it will normally be used by this driver.
So if it won't be used, I'd like to provide that information.

On the other hand, I don't issue a warning if neither of
the channels is configured in the DTB.

I'm not going to commit either way on keeping/removing this.
If someone else weighs in I'm open to changing it.

>> [...]
>>
>> +static void k1_spi_host_init(struct k1_spi_driver_data *drv_data)
>> +{
>>
>> [...]
>>
>> +
>> +	ret = of_property_read_u32(np, "spi-max-frequency", &max_speed_hz);
>> +	if (!ret) {
>> +		host->max_speed_hz = clamp(max_speed_hz, K1_SPI_MIN_SPEED_HZ,
>> +					   K1_SPI_MAX_SPEED_HZ);
>> +		if (host->max_speed_hz != max_speed_hz)
>> +			dev_warn(dev, "spi-max-frequency %u out of range, using %u\n",
>> +				max_speed_hz, host->max_speed_hz);
>> +	} else {
>> +		if (ret != -EINVAL)
>> +			dev_warn(dev, "bad spi-max-frequency, using %u\n",
>> +				 K1_SPI_DEFAULT_MAX_SPEED_HZ);
>> +		host->max_speed_hz = K1_SPI_DEFAULT_MAX_SPEED_HZ;
>> +	}
> 
> I think it makes sense to have spi-max-frequency default to
> K1_SPI_DEFAULT_MAX_SPEED_HZ, but if the value is out of range just print
> a message and return an error, to get whoever wrote the bad value to fix it.

These errors just shouldn't happen.  But the way I handle this,
it allows the SPI controller to still be used, even if the
administrator can't really update the DTB.

> This range seems to be fixed by hardware, so, it should also be
> specified in the bindings.

I define the hardware limits here, and enforce
them, in case the bindings specify an out-of-range
value.  Again, this is an error that just shouldn't
occur in practice, but the code is defensive.

Most of your comments really made me think about how
errors are handled.  I appreciate it.

					-Alex

> 
>> +}
>> +
>>
>> [...]
>>
>> +
>> +static int k1_spi_probe(struct platform_device *pdev)
>> +{
>> +	struct k1_spi_driver_data *drv_data;
>> +	struct device *dev = &pdev->dev;
>> +	struct reset_control *reset;
>> +	struct spi_controller *host;
>> +	struct resource *iores;
>> +	struct clk *clk_bus;
>> +	int ret;
>> +
>> +	host = devm_spi_alloc_host(dev, sizeof(*drv_data));
>> +	if (!host)
>> +		return -ENOMEM;
>> +	drv_data = spi_controller_get_devdata(host);
>> +	drv_data->controller = host;
>> +	platform_set_drvdata(pdev, drv_data);
>> +	drv_data->dev = dev;
>> +	init_completion(&drv_data->completion);
>> +
>> +	drv_data->base = devm_platform_get_and_ioremap_resource(pdev, 0,
>> +								&iores);
> 
> Maybe
> 
>      devm_platform_ioremap_resource(pdev, 0);
> 
>> [...]
>>
>> +
>> +MODULE_DESCRIPTION("SpacemiT K1 SPI controller driver");
>> +MODULE_LICENSE("GPL");
> 
> Maybe MODULE_AUTHOR()?
> 
> Vivian "dramforever" Wang
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
