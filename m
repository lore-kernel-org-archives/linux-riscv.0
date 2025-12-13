Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B6ED59F6F
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Dec 2025 07:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wI1uE+wrIOiS2TSYeFJr87cgIGll1v+HRS2Ff3advX8=; b=NyWQ8Hb3vW0HOE
	tjPQRI9FRVTz9P6QkxClvr2ObCLY1vWvySWGkkzFI/T0IsF48ibAMQLIfbHBs3UpgJ74snoiRNdpE
	YEw0suTJnNnCNrGssxK8vWVRrWG5e6z2iPs//Je3E7bGpmzZaqmiTsyJcyBq+JeqqX0UcZm1zsSor
	MIEAgI0eJ2WLe75SWEKO/VS7hEbA7cxcYqoaTp+rWCsjWCf6vrfEh7iWGyfML98KQBg74Uv87oyFz
	P4snwz3brkG6ndYhEq+RQn4gEPe/203sCm23byHh8tGRLQJaP2TaW3uCWhHk6rz8vFRRagzliLhD0
	dmnniofB1ublruKwRaSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUKTF-00000001Vq5-1cMQ;
	Sat, 13 Dec 2025 07:55:17 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUKTC-00000001Vpa-1CkH
	for linux-riscv@lists.infradead.org;
	Sat, 13 Dec 2025 07:55:15 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7b9215e55e6so1414467b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 12 Dec 2025 23:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1765612513; x=1766217313; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PSg2TYT9sWOtcESEo56kzWemNLsi4EVpvVRgATHWE1A=;
        b=eV2erPYR7CZf6s9L/DEAybwmnmXu8rR1ip16YZquMutFHG1HqzQ5mleIwq3MieUUKx
         Bt83SHFSkEcr6BBZ9UhajlHnnwe7Cc2WkMkMD02V5vx/SOITbFohVvCJE0DwUB7Xv4Qw
         ps3/qkn/uM5iDnBwyhYfo6ZdZeJ9nmTiCYSt8pzMbqobC0REYjNOwVLXnzfEQo7GrC+I
         vIjGFi3hATUgblII8/BTO+w44tpQbUbva98c1Pq+jGDBQ1zlPVXIEjR4qh5L1XdNIMY4
         6Y9X3G/jr/gAe9MgawcHHXku0KHNokYWkYA6qeEfIZq0RMP6uCM0GKOvU21ptX/DX3H9
         nczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765612513; x=1766217313;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PSg2TYT9sWOtcESEo56kzWemNLsi4EVpvVRgATHWE1A=;
        b=W0jVThLh3KwVRq/7+LIi/HDwJdjIOmvxHEEa/RDI+6XWPYs9puzLNVnkZtN35h+xwo
         ckm9KMmA792OnVPHnOQPNgb/T9PZo9uBQcxKqJti+M0GlZ/VLp1Lw6DhNwmKcJW8ltyc
         qK5n16Tsq42PZ9pDXR/EVWOBrDpUA2h4y+E3ZrkSZHfT4wiU55VPLAppiXGmdKLD3BbQ
         n4rBOkmZg3Xy1PrrY242j/oLuyRWpwp/0VjjrciCIMsFnKj/xFTbutZPv1jzVDTGUZDd
         CX1VLiocdEfU8qJONe+FbuTjGmIQiF1c/uo9KxO8BXQzx0YldZbmtK56s87i0+JIALkD
         K9/w==
X-Forwarded-Encrypted: i=1; AJvYcCWgK8DKO3yPdzsrfEM1sYhJQyJbL8KSBNUsWnWpBgpeAe+Fs1oam0EPngJGL8uD4YRfVMAf+3gctaVa6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyY56yk2/1g9SHk+WzhweP709pPKstIbcfO8vOvxkuY7GUXAhbG
	YeSavg8L2VVbOAn0UcvYpuYGF1i9l8v4G5//MVJA8tqs0AsYGZ7CY2vlb2NtnfOnPmI=
X-Gm-Gg: AY/fxX4Hmu+DjRT9qI5Fo3ZYkWKcHCVTcbWrbtWuhOKSxp4uXT+f8a3qDNlQ7hqVteY
	6awUUt8DfiZO7yrJ2YHCOGx6Qmeyrb1kxZiRRFhH5UEH5AMsXV/r+0cq/ypKbri0DSp62hKRFjx
	by/42NbskE9EnByR0XDxZbKPRRfAFVac0Br96d1jPiM0nMAr5BxHNwaR0eV4B5J8EOzrePOCbUZ
	5XPHa7Rn5NUbDLHVMV6na3yaaHW/TM8i2aCJSyyzsUyT/K8GC4dew4G5bnKJ60q3tBQZrP7zODS
	8DhzmZsKMEuocv7znz2We0dxHD7ci2TZ56e8mqVgM2HOQTUmHZbvKvSHY7Ip7op3XcWxqLqmPAb
	0j4kzGoWiuHjH+1O+z1P/spo/o/feS97HjmsQIHViC8hQYwNzHnwl6SF1YrRim1Gj3ZWUV5+2m0
	TqCb7k9D0vBZ5fr0vfooFzXijbHi7T7g==
X-Google-Smtp-Source: AGHT+IHOWrUINqZuvftQzED4J6JEOwCF3MwpJCzvYtbDq2TpenTmo8Kz5bbfjFWruq5ev9Hib6L/8Q==
X-Received: by 2002:a05:6a00:1f13:b0:7f6:3f21:7d22 with SMTP id d2e1a72fcca58-7f6693a69e9mr3821365b3a.45.1765612512724;
        Fri, 12 Dec 2025 23:55:12 -0800 (PST)
Received: from [100.64.0.1] ([167.103.29.104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c27733edsm7218185b3a.20.2025.12.12.23.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Dec 2025 23:55:12 -0800 (PST)
Message-ID: <8a3d3db6-6614-42f7-a271-e6188391daf6@sifive.com>
Date: Sat, 13 Dec 2025 16:55:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dmaengine: dw-axi-dmac: Add support for CV1800B DMA
To: Inochi Amaoto <inochiama@gmail.com>
Cc: "Anton D . Stavinskii" <stavinsky@gmail.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, sophgo@lists.linux.dev,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
 <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <unicorn_wang@outlook.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Longbin Li <looong.bin@gmail.com>, Yixun Lan <dlan@gentoo.org>,
 Ze Huang <huangze@whut.edu.cn>
References: <20251212020504.915616-1-inochiama@gmail.com>
 <20251212020504.915616-3-inochiama@gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20251212020504.915616-3-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_235514_379558_77A74ED2 
X-CRM114-Status: GOOD (  23.09  )
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

Hi Inochi,

On 2025-12-12 11:05 AM, Inochi Amaoto wrote:
> As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
> the SoC provides a dma multiplexer to reuse the DMA channel. However,
> the dma multiplexer also controlls the DMA interrupt multiplexer, which

typo: controls

> means that the dma multiplexer needs to know the channel number.
> 
> Allow the driver to use DMA phandle args as the channel number, so the
> DMA multiplexer can route the DMA interrupt correctly.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 23 ++++++++++++++++---
>  drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  1 +
>  2 files changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> index b23536645ff7..62bf0d0dc354 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -50,6 +50,7 @@
>  #define AXI_DMA_FLAG_HAS_APB_REGS	BIT(0)
>  #define AXI_DMA_FLAG_HAS_RESETS		BIT(1)
>  #define AXI_DMA_FLAG_USE_CFG2		BIT(2)
> +#define AXI_DMA_FLAG_HANDSHAKE_AS_CHAN	BIT(3)
> 
>  static inline void
>  axi_dma_iowrite32(struct axi_dma_chip *chip, u32 reg, u32 val)
> @@ -1361,15 +1362,26 @@ static struct dma_chan *dw_axi_dma_of_xlate(struct of_phandle_args *dma_spec,
>  					    struct of_dma *ofdma)
>  {
>  	struct dw_axi_dma *dw = ofdma->of_dma_data;
> +	unsigned int handshake = dma_spec->args[0];
>  	struct axi_dma_chan *chan;
>  	struct dma_chan *dchan;
> 
> -	dchan = dma_get_any_slave_channel(&dw->dma);
> +	if (dw->hdata->use_handshake_as_channel_number) {
> +		if (handshake >= dw->hdata->nr_channels)
> +			return NULL;
> +
> +		chan = &dw->chan[handshake];
> +		dchan = dma_get_slave_channel(&chan->vc.chan);
> +	} else {
> +		dchan = dma_get_any_slave_channel(&dw->dma);
> +	}
> +
>  	if (!dchan)
>  		return NULL;
> 
> -	chan = dchan_to_axi_dma_chan(dchan);
> -	chan->hw_handshake_num = dma_spec->args[0];
> +	if (!chan)

When use_handshake_as_channel_number is false, chan is uninitialized here.

Regards,
Samuel

> +		chan = dchan_to_axi_dma_chan(dchan);
> +	chan->hw_handshake_num = handshake;
>  	return dchan;
>  }
> 
> @@ -1508,6 +1520,8 @@ static int dw_probe(struct platform_device *pdev)
>  			return ret;
>  	}
> 
> +	chip->dw->hdata->use_handshake_as_channel_number = !!(flags & AXI_DMA_FLAG_HANDSHAKE_AS_CHAN);
> +
>  	chip->dw->hdata->use_cfg2 = !!(flags & AXI_DMA_FLAG_USE_CFG2);
> 
>  	chip->core_clk = devm_clk_get(chip->dev, "core-clk");
> @@ -1663,6 +1677,9 @@ static const struct of_device_id dw_dma_of_id_table[] = {
>  	}, {
>  		.compatible = "intel,kmb-axi-dma",
>  		.data = (void *)AXI_DMA_FLAG_HAS_APB_REGS,
> +	}, {
> +		.compatible = "sophgo,cv1800b-axi-dma",
> +		.data = (void *)AXI_DMA_FLAG_HANDSHAKE_AS_CHAN,
>  	}, {
>  		.compatible = "starfive,jh7110-axi-dma",
>  		.data = (void *)(AXI_DMA_FLAG_HAS_RESETS | AXI_DMA_FLAG_USE_CFG2),
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> index b842e6a8d90d..67cc199e24d1 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> @@ -34,6 +34,7 @@ struct dw_axi_dma_hcfg {
>  	bool	reg_map_8_channels;
>  	bool	restrict_axi_burst_len;
>  	bool	use_cfg2;
> +	bool	use_handshake_as_channel_number;
>  };
> 
>  struct axi_dma_chan {
> --
> 2.52.0
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
