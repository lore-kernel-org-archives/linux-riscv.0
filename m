Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0203CCD4F57
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 10:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8kZYf+4ugqzTs3csftDIRbfMHGFlsJnKrNL46wShZDc=; b=zm5lDPMQn8CUxlSiFJk3yw+DDy
	PlRAlin114kVGCsf9pGdatZEj8ON8d59RbuX+ufWMMzHXNVl3DVc8AmPI3wlofdSR02Ux6wPo2exz
	KGhtk9NeSSo3tfZGDDmCCdTCnZUc4trjerjuPndHDTF5jiPzjU2ovR57cqf5oefLNtaWMdbazlt1P
	y4U+p/9fc2fq5MTbhPGrP/8rulxgX2r7aaO6OrwluwYFfN05kuBt9gfZnr4C6SU2rzIDwZYGy7SHi
	nOf6WVLUk1eSjEx2yDVegqvEXWkQ3PO0MTi5yvldXv85Ot85NNEZulLzo6w7M/oYKkU7PBcJM8p27
	X8NMKZaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjdfm-008tBa-0n;
	Fri, 22 Sep 2023 10:46:10 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjdfi-008tAl-22
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 10:46:08 +0000
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 03C0341DC7
	for <linux-riscv@lists.infradead.org>; Fri, 22 Sep 2023 10:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1695379564;
	bh=t+yfri1GJX2TAqcf+QwODASIE2sxjrbU+UlJZ8d2HDM=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=W9atVzRnraNce/rhT4QaiY3HpJqg5wCOf5wA2XDqgTYjcSKNX+Zx+ol08sgAb4VwO
	 2BmyJWmxxgjMWMFhfFjApkw7gEm5ITqYjfIiTCzGY4tQddE+oEeQBrKGbxFq0triJX
	 4cLTqkQotMjgZL3uWmgnFFNaShznWSRSFI6otNR+Pes7RQXHW/k0nxlXEV2KLG3Mkz
	 qL6Ako6jQoGqbDf1mCVUqb0he15N06+x+J77du/ln7X6MXIZkspF+dBpgSw7k2Xi7b
	 im+gOAnoR5kRjy8l0ilMQOAC/nWtOHJrOGBaNSj0rAdLTwmPgdn0Hy1UKICR9DiVOj
	 Gg0+G7JKsAV+Q==
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-773c9836d91so221359285a.2
        for <linux-riscv@lists.infradead.org>; Fri, 22 Sep 2023 03:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695379562; x=1695984362;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t+yfri1GJX2TAqcf+QwODASIE2sxjrbU+UlJZ8d2HDM=;
        b=vH2DqXR1K4Zz0nYgkrqZFpHT+3cANiDTLNBjI6xiH32eK88ITgZVVARPTF6U/3v4Zy
         RSTbu8Zkvw3Lb7naMl7kgpMDvyM23cEdFfXgORcqbeyznjwwfYQlDFq3RMslLZW+xfQf
         lpI8WEzo927Zr4mJWC6FakXmFCTlWGxuT3mHgiiE2GCI/sKmEzf+qJaNAZlCXtp6mQg+
         5N1zOZ2x0haInGHj1pncuDQHKcPkfxJdoCi99ww+K/I3EWyLccQjNC28ihwzQaG7lEHl
         E8UzaRo5pzCgjCBuJLhTckz+4st4jiZsNl5cRB0WcNJIpD1Rqp/eTyt9iEAYKSMRlgq3
         NsWg==
X-Gm-Message-State: AOJu0YwHAuMvcmC0wtM+YhFCyLQCGYUcP6XkDoV1mPlM+ZtjnVsYU3zu
	B7at4cD0MHhd9ls3vmowQoAdsDYu77yKtCums2C+axkSufApnbtnZapYRTAXTZxUF5EeOVgnIo2
	6XfSS+CCRu02ZWAe5lQA+dPPc8tba6kuqTrGF0CnfMOZ0E+Ttr3osuAmuB8ScLQ==
X-Received: by 2002:a05:620a:2ac7:b0:76c:ad46:2683 with SMTP id bn7-20020a05620a2ac700b0076cad462683mr6971762qkb.16.1695379562236;
        Fri, 22 Sep 2023 03:46:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsox++PPWys6ngzHVyCF3Eihkl1gwpI0tFPIgNbTUyaezen3cYl9nj+cZZ23a8Pw9GmdY7EyJwq7TGifvy6yc=
X-Received: by 2002:a05:620a:2ac7:b0:76c:ad46:2683 with SMTP id
 bn7-20020a05620a2ac700b0076cad462683mr6971744qkb.16.1695379561942; Fri, 22
 Sep 2023 03:46:01 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 Sep 2023 03:46:01 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20230922095039.74878-2-shravan.chippa@microchip.com>
References: <20230922095039.74878-1-shravan.chippa@microchip.com> <20230922095039.74878-2-shravan.chippa@microchip.com>
Mime-Version: 1.0
Date: Fri, 22 Sep 2023 03:46:01 -0700
Message-ID: <CAJM55Z-NUwzo9SKtmV_5OegznDjSQEG9DVK7=5x4qnxUkk399A@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] dmaengine: sf-pdma: Support of_dma_controller_register()
To: shravan chippa <shravan.chippa@microchip.com>, green.wan@sifive.com, vkoul@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, conor+dt@kernel.org, palmer@sifive.com
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nagasuresh.relli@microchip.com, praveen.kumar@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_034606_823700_6631352B 
X-CRM114-Status: GOOD (  20.57  )
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

shravan chippa wrote:
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
>  drivers/dma/sf-pdma/sf-pdma.c | 41 +++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
> index d1c6956af452..c7558c9f9ac3 100644
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

Hi Shrivan,

Doesn't this need a matching unregister/free call in the
sf_pdma_remove function?

/Emil

>  	return 0;
> +
> +err_unregister:
> +	dma_async_device_unregister(&pdma->dma_dev);
> +
> +	return ret;
>  }
>
>  static int sf_pdma_remove(struct platform_device *pdev)
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
