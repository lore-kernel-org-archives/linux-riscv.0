Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA398C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 18:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=iuyNf2EhYws2BuMNaNfeNGHe4AaZ/vxg2qbo9QO9vHk=; b=xPn+glMF3OJXIjcJE+NiCyMu78
	OptnbRU9kKJ1aOiuBqdca5nXf086aZQL4TNigWc+Bfp9T1sDXPIYGo0A53qkMc8BirZZJjOObASjA
	KFg7+lAbM+zdOyC2q3iNn87JoDa/I4irxIHJxYEqYLTAfnizomHyO6MYjuUlQTh9qXQ22Na5VBPm9
	IWULcxgk6V01jHgW6IpJ+ooYr6WxqQW1ENVzjlr/DVeI9vu/eW79zgWWupRAtOpSokRsRo81eTrFF
	rPNPs9oRzJ1DjBIpi5fIpkLRCmOPg97bzzj6d6BBBPz6Vo3pMJ2pbJc6KiNyjPgZ/+bL76XRNrGli
	xPEYe4Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAcXY-00CrhM-BU; Thu, 20 Jan 2022 18:52:08 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAcXV-00Crd9-J9
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 18:52:07 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 s2-20020a17090ad48200b001b501977b23so6073483pju.2
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jan 2022 10:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=8EtW5aJUkZlLqS6KByBwT87+2IR1JSn6MQ8pl+a1L1I=;
 b=NQYgEA4M/w5/oPAMr8pOQ9c83buHBZm1EOwnhxvMJD73dViVTwW7SLmFSapT8MzP0k
 lp1qLzKIbojGpeLkOn1wqY9P1fr3M9lleuPC7xsasrVHWj2ODjuxoLGvzMVW6VwclLHu
 22vQjx+Zt/s4e0x5Fixv7T+W/WpFZC1ypEv9TEvEW0/cG+4OBEP2mLfdU5m4VnxRSq4h
 pZs5usczWpG+aEqvRpk0LiNJLQ7uKPzU/QjHZiFDQlWpbKtn0iSnaQDHbLBvkG6eQ9J2
 hOGCTa95y9r4vAvQ/OHyTOXA3RAGK8CF+2cQ2FazuMfX1SR+dfkWnCG33Gv/9XwxtBkk
 +sHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=8EtW5aJUkZlLqS6KByBwT87+2IR1JSn6MQ8pl+a1L1I=;
 b=VrCauo3iqPzM9WNrrg7dm6vFc5E3I4rrFLGhKxQWn3GR0JjVdQMC8pQqqHhqnqMymU
 JyV2IpFuIyI9/1F9EYv86gP8YTLmHj3qh2fA1DZt56pwJnRGo55VXAF4yfJX4E4jVMti
 jHhO19bTGdsKrfFIObfnbf3MUo9JisYLaBpfY4ElFFx4OOLMDi5wmZqnOjKkxJaO7RUJ
 GyOwSwQ4i8bYa6ZZs5oOQBgPiiZ76J1PRj8V7rA+Yt5ia+s2Zi9U/kbopTTaqK4JEHx2
 WkMQzQNGQff/5fTkwAvU6FoobPRB6BqpWGXT5w+occ11fQ8aXa/WPmDA2RmQW0yg59Lv
 P8FQ==
X-Gm-Message-State: AOAM531CT4VuCUKfky9u017FpmS0/3ob+nfwmgnE+1vVRnXodLRvlwk+
 0IRJnapxb6GwqFtBE23CiTntbA==
X-Google-Smtp-Source: ABdhPJwOcKX4q0aXSX3awK4t1GwYFAHIAnuIczRRG34WtbQiXod6hQvEiN93AyBbUWCvMdAzZb7Ngw==
X-Received: by 2002:a17:902:7401:b0:14b:1339:58cf with SMTP id
 g1-20020a170902740100b0014b133958cfmr81275pll.66.1642704719518; 
 Thu, 20 Jan 2022 10:51:59 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id q4sm4512124pfu.15.2022.01.20.10.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 10:51:59 -0800 (PST)
Date: Thu, 20 Jan 2022 10:51:59 -0800 (PST)
X-Google-Original-Date: Thu, 20 Jan 2022 10:51:23 PST (-0800)
Subject: Re: [PATCH v4 3/3] dmaengine: sf-pdma: Get number of channel by
 device tree
In-Reply-To: <0d0b0a3ad703f5ef50611e2dd80439675bda666a.1642383007.git.zong.li@sifive.com>
CC: robh+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, 
 geert@linux-m68k.org, bin.meng@windriver.com, green.wan@sifive.com,
 vkoul@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, zong.li@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com
Message-ID: <mhng-5b3e2596-3558-4534-9229-26885ee4cc5c@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_105205_659506_20ECAB4A 
X-CRM114-Status: GOOD (  26.07  )
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

On Sun, 16 Jan 2022 17:35:28 PST (-0800), zong.li@sifive.com wrote:
> It currently assumes that there are always four channels, it would
> cause the error if there is actually less than four channels. Change
> that by getting number of channel from device tree.
>
> For backwards-compatible, it uses the default value (i.e. 4) when there
> is no 'dma-channels' information in dts.

Some of the same wording issues here as those I pointed out in the DT 
bindings patch.

> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  drivers/dma/sf-pdma/sf-pdma.c | 20 +++++++++++++-------
>  drivers/dma/sf-pdma/sf-pdma.h |  8 ++------
>  2 files changed, 15 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
> index f12606aeff87..1264add9897e 100644
> --- a/drivers/dma/sf-pdma/sf-pdma.c
> +++ b/drivers/dma/sf-pdma/sf-pdma.c
> @@ -482,9 +482,7 @@ static void sf_pdma_setup_chans(struct sf_pdma *pdma)
>  static int sf_pdma_probe(struct platform_device *pdev)
>  {
>  	struct sf_pdma *pdma;
> -	struct sf_pdma_chan *chan;
>  	struct resource *res;
> -	int len, chans;
>  	int ret;
>  	const enum dma_slave_buswidth widths =
>  		DMA_SLAVE_BUSWIDTH_1_BYTE | DMA_SLAVE_BUSWIDTH_2_BYTES |
> @@ -492,13 +490,21 @@ static int sf_pdma_probe(struct platform_device *pdev)
>  		DMA_SLAVE_BUSWIDTH_16_BYTES | DMA_SLAVE_BUSWIDTH_32_BYTES |
>  		DMA_SLAVE_BUSWIDTH_64_BYTES;
>
> -	chans = PDMA_NR_CH;
> -	len = sizeof(*pdma) + sizeof(*chan) * chans;
> -	pdma = devm_kzalloc(&pdev->dev, len, GFP_KERNEL);
> +	pdma = devm_kzalloc(&pdev->dev, sizeof(*pdma), GFP_KERNEL);
>  	if (!pdma)
>  		return -ENOMEM;
>
> -	pdma->n_chans = chans;
> +	ret = of_property_read_u32(pdev->dev.of_node, "dma-channels",
> +				   &pdma->n_chans);
> +	if (ret) {
> +		dev_notice(&pdev->dev, "set number of channels to default value: 4\n");
> +		pdma->n_chans = PDMA_MAX_NR_CH;
> +	}
> +
> +	if (pdma->n_chans > PDMA_MAX_NR_CH) {
> +		dev_err(&pdev->dev, "the number of channels exceeds the maximum\n");
> +		return -EINVAL;

Can we get away with just using only the number of channels the driver 
actually supports?  ie, just never sending an op to the channels above 
MAX_NR_CH?  That should leave us with nothing to track.

> +	}
>
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	pdma->membase = devm_ioremap_resource(&pdev->dev, res);
> @@ -556,7 +562,7 @@ static int sf_pdma_remove(struct platform_device *pdev)
>  	struct sf_pdma_chan *ch;
>  	int i;
>
> -	for (i = 0; i < PDMA_NR_CH; i++) {
> +	for (i = 0; i < pdma->n_chans; i++) {
>  		ch = &pdma->chans[i];
>
>  		devm_free_irq(&pdev->dev, ch->txirq, ch);
> diff --git a/drivers/dma/sf-pdma/sf-pdma.h b/drivers/dma/sf-pdma/sf-pdma.h
> index 0c20167b097d..8127d792f639 100644
> --- a/drivers/dma/sf-pdma/sf-pdma.h
> +++ b/drivers/dma/sf-pdma/sf-pdma.h
> @@ -22,11 +22,7 @@
>  #include "../dmaengine.h"
>  #include "../virt-dma.h"
>
> -#define PDMA_NR_CH					4
> -
> -#if (PDMA_NR_CH != 4)
> -#error "Please define PDMA_NR_CH to 4"
> -#endif
> +#define PDMA_MAX_NR_CH					4
>
>  #define PDMA_BASE_ADDR					0x3000000
>  #define PDMA_CHAN_OFFSET				0x1000
> @@ -118,7 +114,7 @@ struct sf_pdma {
>  	void __iomem            *membase;
>  	void __iomem            *mappedbase;
>  	u32			n_chans;
> -	struct sf_pdma_chan	chans[PDMA_NR_CH];
> +	struct sf_pdma_chan	chans[PDMA_MAX_NR_CH];
>  };
>
>  #endif /* _SF_PDMA_H */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
