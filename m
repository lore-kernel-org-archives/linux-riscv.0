Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58819E75432
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 07:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kFAL9zP1CAIGEeQILZGHTmk1NjPIDfHvYoykRVEAuo0=; b=gHU6k1C3lC0lEn4cy3QD6AEpo4
	ej9lUJcTgp9vzQSENTRPcGbdsqL98BQhYZh46VNvZScoWUOj8qsO7RjkWpKnWFUrjTItrQBkPrNbY
	edthAvr74MhvXqlRWSBwzXs09WDWLca1bov5DHhfx6czLd/UxzWIxdXKUg1AncCawbJWvWtFyqS4Z
	JbZ6tOPMmxPR+Gy1iWW+13gvMwrdNaO221oPbqyZD8/JebeDJti+JTDICSthB409WkEw7W6wwQ9zm
	vT8Ld1NZq2rljje0vemFx7BdsU+1A4ohpTyrxfK4o1dyAdnB2bqqZFjPl2ph4T1ZlNpXagWByruOu
	A1DE3FwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnZxL-00E0EJ-2w;
	Tue, 03 Oct 2023 07:36:35 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnZxI-00E0DR-2Z
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 07:36:34 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6C1EC3F627
	for <linux-riscv@lists.infradead.org>; Tue,  3 Oct 2023 07:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1696318589;
	bh=lZyLBflGA1l7hiEVfFkxQiwJT+7Gv/7fvNwXxJdKogA=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=qNY7pjybc3zm12mC52FOkh52cWM8hkbLg4dMDB6KwDmyKCwzcnvyCS27gww+dv79x
	 r8pPGyUks6pR0DDgEq5yMIhmTJK+bsGEOXSnSNDIXJtrnrkDUJuAmC5UV53VM4FsCP
	 3GS15c04z7SiDYhwlGhRr4qxI/r0tJUUihYbos7AqBOBYkc8MOlOaalgeZKjUkhFv3
	 H7J9ojMxoqOJCUjrfFRLCsYZJqoyulJOPJBPmtmMBsqRUXQ9r+Hklr33bqGXWckPin
	 ZZe0khc1dkMiSbcA7OaOt9aMWlwqRCRlfIHiJ2ec8g74tTwo1fGRd3/+z16I2VnGJq
	 K93nk6IO7CF0Q==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-418116b13a7so7614981cf.3
        for <linux-riscv@lists.infradead.org>; Tue, 03 Oct 2023 00:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696318588; x=1696923388;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lZyLBflGA1l7hiEVfFkxQiwJT+7Gv/7fvNwXxJdKogA=;
        b=YCha0ittmvvRb4reiJxfpa4WIy5duhCQ0HRhED25rvMN1c5QWnfgsnlNwz2IlSziF+
         4RVWh4KkOSw8elrVVQVaSqvao8fEbiC42licJnU+MARcZ5kSSw0HXCZFNwgBTzSPXH0y
         Mr55OnTAQVmw1QeTObxNgpdNm7HzG71doEq5gDZyjuXwqCXM7EQISV1W9P4fbfD//+nD
         WH+f9JJZsl2szJHEZYepiHb7Oj4Udtqud95EyH7GLpeN/YCxCxuoK+GbQ2JYHSQ3hY34
         cbSKAYH5IHU64aejoLZBCmzxDIQlsQi6TBDbxP+iBIiSIphX1Le/rDgoerxo6gyVAX2c
         O9BQ==
X-Gm-Message-State: AOJu0Yz+OeXMx0RAYqYUG88FNKL4BexrDXVLb19BLFfeO32T4uCB3Vz1
	27pIuJC8P7kVc3f8Kngw0R2kscLFrmNJYaLcmFotOC2LNu+4AG2Wp45vmoc6BO3qx7zynqvgiDE
	xd3kOZu80a2blQS+qa/amW5KGtQrEJR5aOBNXGXCGrN8l2RY7HWOZkeTUNEfn/Q==
X-Received: by 2002:ac8:5990:0:b0:417:eb3c:494e with SMTP id e16-20020ac85990000000b00417eb3c494emr16180652qte.59.1696318587821;
        Tue, 03 Oct 2023 00:36:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj6SIXevimzokJVJXdsT4sE7rHESw1Wq+iHG4vgfpb3Vs/mWTK4xl1+YKBWHa12KFSBQhHVO0+qIfHciWDbuM=
X-Received: by 2002:ac8:5990:0:b0:417:eb3c:494e with SMTP id
 e16-20020ac85990000000b00417eb3c494emr16180640qte.59.1696318587540; Tue, 03
 Oct 2023 00:36:27 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 3 Oct 2023 00:36:27 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231003042215.142678-2-shravan.chippa@microchip.com>
References: <20231003042215.142678-1-shravan.chippa@microchip.com> <20231003042215.142678-2-shravan.chippa@microchip.com>
Mime-Version: 1.0
Date: Tue, 3 Oct 2023 00:36:27 -0700
Message-ID: <CAJM55Z9ae_W7JvOHEFPNP491cexz5MbpBSFUOzuvbQK=HiftOw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dmaengine: sf-pdma: Support of_dma_controller_register()
To: shravan chippa <shravan.chippa@microchip.com>, green.wan@sifive.com, vkoul@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, conor+dt@kernel.org
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nagasuresh.relli@microchip.com, praveen.kumar@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_003632_976518_F847D207 
X-CRM114-Status: GOOD (  21.15  )
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

If you're respinning this series anyway, you have two spaces here.

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
> +	dev_err(dev, "No more channels available\n");
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
