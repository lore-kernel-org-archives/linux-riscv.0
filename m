Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C81CDB474
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 18:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7IxTyEbvWhct/CdU1Iw8oEmrAzJXc+u5Z93OhigmMFI=; b=if8/kvjF8bG0Mr
	62FR/olKh0JhSOSEzBg6XY9wKPbYH1FavYDPKbb8r00wI4ufnAdMeC5KNL8/8N/PxwAeVaYMrpeCH
	eu1x/pCF/QDyn65+kMqzLdvCJdF9c5JC4LWIh+ALUNWlf6aXigobwZc50pC1Z7al3Ay5yrI85lnjL
	5aiVRxqpPt0C6c1AU+vHcZUIlOgN6V9JALuy2NAS2VWwLsTjLfKVevSIgfuBroxRg49HY/0MeB+O0
	Do4JXu4Rhh+2WFM4gPVgJkzbdPbCknPaYjAQKSzo/vYa7gkyvbRn496c4lojt6di3Idr1OBsfnj7a
	8LX+Tli9kWUCY0kXnmdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsosn-00Cz5D-2S;
	Tue, 17 Oct 2023 18:33:33 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsosl-00Cz4O-1W
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 18:33:32 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-775751c35d4so394254785a.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 11:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1697567609; x=1698172409; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AcBNvDPm+5lurRZbHk0V2IeK1x1A6vL27sfb3JeZGgA=;
        b=e854N4C8U+4Bp/sqpDqwM8ld2GO59zfKPGHXGaP1ayTEBNVJ03ocXHKeBsOt7a0MlV
         3XsfubldqgNS0YzdqW7Sh4l7ji2UtGTfXjeps/w4FXsFSWV4HoXzHBLxU015HWQPqqNf
         h8CJ98Rgc3X5t7G8F7FDW99x2QlpiZDHvxvhFHNOaIOfMpuF9BroPg+VffRfpbBRRmuT
         AUkxfeNDKhRUPdT/TQr9Wkz8ipoIfFDcc76WfxeGjumcQbR6mqG0jhdC9rgiAskyJALz
         KbX/cpIfCoPnO3vMvFLEgsHToaWsOFuUBk4SCoxaSMlGPV+Z8w3gyNqP6MrlPYt6V7tq
         X6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697567609; x=1698172409;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AcBNvDPm+5lurRZbHk0V2IeK1x1A6vL27sfb3JeZGgA=;
        b=Ju1QhE7g1N61HhaSgzphcMWnNXN41wGI/UGe+Py6zKTGE7hnsY7CVSSGktymfvgf/7
         biwAgZBFxBwUJWkmS/ISPuRqR6sElUFbbK0/TX1ztiIM54a/7M9ivpcAPlWipr9cxEfE
         PeHhFgY+reh+VVNu9nBhY1q3F49Pcoh4yAVZGlu1rGS/RdIucCnWey6jGPya6BvyySVi
         odmTWxCy+lbA9rKBhqOPAV6LQYPV9Ant6C65XIzaVMQ0FnWUjAgy7De5M3p8ZEIxWYkl
         Jnc58hFA/6VxovleQIt5fEuEWbUjbAk1032phBt47IT1xY4UwOVYtqsIkdUIMFNb/Dn4
         ydTw==
X-Gm-Message-State: AOJu0YxvHbCB/6G/EAv8PoVPNxnDZ5YHCx08eq7AFissnT6CY6dPOu1C
	BmAlv4Bg/U3Yclnvo31bzFpZbQ==
X-Google-Smtp-Source: AGHT+IEhq81kqSuzy5uDqP7PO49OdWiRqBLX172oxXpXHG/RYxZodn51GvnKH+ECpR7nbBAhO+94Bg==
X-Received: by 2002:a05:620a:1229:b0:76d:ada0:4c0 with SMTP id v9-20020a05620a122900b0076dada004c0mr2765787qkj.76.1697567608779;
        Tue, 17 Oct 2023 11:33:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:95cc:ccc5:95bc:7d2c? ([2600:1700:2000:b002:95cc:ccc5:95bc:7d2c])
        by smtp.gmail.com with ESMTPSA id f22-20020a05620a12f600b00765aa3ffa07sm866623qkl.98.2023.10.17.11.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 11:33:28 -0700 (PDT)
Message-ID: <e5d2e96b-9b16-4aaf-9291-76d1d2222c44@sifive.com>
Date: Tue, 17 Oct 2023 13:33:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dmaengine: sf-pdma: Support
 of_dma_controller_register()
Content-Language: en-US
To: shravan chippa <shravan.chippa@microchip.com>, green.wan@sifive.com,
 vkoul@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, conor+dt@kernel.org
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 nagasuresh.relli@microchip.com, praveen.kumar@microchip.com
References: <20231003042215.142678-1-shravan.chippa@microchip.com>
 <20231003042215.142678-2-shravan.chippa@microchip.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231003042215.142678-2-shravan.chippa@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_113331_542927_D29AECA1 
X-CRM114-Status: GOOD (  23.53  )
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

Hi,

On 2023-10-02 11:22 PM, shravan chippa wrote:
> From: Shravan Chippa <shravan.chippa@microchip.com>
> 
> Update sf-pdma driver to adopt generic DMA device tree bindings.
> It calls of_dma_controller_register() with sf-pdma specific
> of_dma_xlate to get the generic DMA device tree helper support
> and the DMA clients can look up the sf-pdma controller using
> standard APIs.
> 
> Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> ---
>  drivers/dma/sf-pdma/sf-pdma.c | 44 +++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
> index d1c6956af452..06a0912a12a1 100644
> --- a/drivers/dma/sf-pdma/sf-pdma.c
> +++ b/drivers/dma/sf-pdma/sf-pdma.c
> @@ -20,6 +20,7 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/of.h>
> +#include <linux/of_dma.h>
>  #include <linux/slab.h>
>  
>  #include "sf-pdma.h"
> @@ -490,6 +491,33 @@ static void sf_pdma_setup_chans(struct sf_pdma *pdma)
>  	}
>  }
>  
> +static struct dma_chan *sf_pdma_of_xlate(struct of_phandle_args *dma_spec,
> +					 struct of_dma *ofdma)
> +{
> +	struct sf_pdma *pdma = ofdma->of_dma_data;
> +	struct device *dev = pdma->dma_dev.dev;
> +	struct sf_pdma_chan  *chan;
> +	struct dma_chan *c;
> +	u32 channel_id;
> +
> +	if (dma_spec->args_count != 1) {
> +		dev_err(dev, "Bad number of cells\n");
> +		return NULL;
> +	}
> +
> +	channel_id = dma_spec->args[0];
> +
> +	chan = &pdma->chans[channel_id];
> +
> +	c = dma_get_slave_channel(&chan->vchan.chan);

This does not look right to me. All of the channels in the controller are
identical and support arbitrary addresses, so there is no need to use a specific
physical channel. And unless Microchip has added something on top, the only way
to trigger a transfer is through the MMIO interface, so there is no request ID
to differentiate virtual channels either.

So it seems to me that #dma-cells should really be 0, and this function should
just call dma_get_any_slave_channel().

Regards,
Samuel

> +	if (!c) {
> +		dev_err(dev, "No more channels available\n");
> +		return NULL;
> +	}
> +
> +	return c;
> +}
> +
>  static int sf_pdma_probe(struct platform_device *pdev)
>  {
>  	struct sf_pdma *pdma;
> @@ -563,7 +591,20 @@ static int sf_pdma_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	ret = of_dma_controller_register(pdev->dev.of_node,
> +					 sf_pdma_of_xlate, pdma);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev,
> +			"Can't register SiFive Platform OF_DMA. (%d)\n", ret);
> +		goto err_unregister;
> +	}
> +
>  	return 0;
> +
> +err_unregister:
> +	dma_async_device_unregister(&pdma->dma_dev);
> +
> +	return ret;
>  }
>  
>  static int sf_pdma_remove(struct platform_device *pdev)
> @@ -583,6 +624,9 @@ static int sf_pdma_remove(struct platform_device *pdev)
>  		tasklet_kill(&ch->err_tasklet);
>  	}
>  
> +	if (pdev->dev.of_node)
> +		of_dma_controller_free(pdev->dev.of_node);
> +
>  	dma_async_device_unregister(&pdma->dma_dev);
>  
>  	return 0;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
