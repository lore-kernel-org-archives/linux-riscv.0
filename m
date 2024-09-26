Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2596CDE01B
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 15:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZNNyOES+/FWVBm0VJzaefEzcyQg+D8NLf/WS8Xs6x60=; b=L8ow7n/koR6+xX
	a/xoEpR3EgFga4iVGT46ivs2m3oEaYoKBLtGGtsSPJikWJMgTG63Ky4GX1AIneRirG5BaJHNZRAEB
	n6AYxAqhghI4U3hHegUHG4/AgB7l2LuMWtg/sBRETHyV6J4IzTy04n0rjMakxSmSViduYJnGx+xpE
	umn0H2UcJbQg35lRe36XXE4YkgMzCcMWFL8R8M/QuZOkFGD05YjrjZ6/SD2dR8rxzv6K8L3icw6yn
	UbIzmjHcLPz9pLr5/0BdL/HhMd0eu4YaBLeV9s5N+m/78TC5zuDREZP7zXn0ZSi49G/E4tPVs8l42
	OTzPm9vINLxk+NN8Prqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stqqt-00000008oDr-1ZJ7;
	Thu, 26 Sep 2024 15:56:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stqqp-00000008oCH-3n00
	for linux-riscv@lists.infradead.org;
	Thu, 26 Sep 2024 15:56:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7924D14BF;
	Thu, 26 Sep 2024 08:56:47 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE13E3F587;
	Thu, 26 Sep 2024 08:56:16 -0700 (PDT)
Message-ID: <c9100637-663a-4307-9d59-deebcf9ad34c@arm.com>
Date: Thu, 26 Sep 2024 16:56:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: core: Only set maximum DMA segment size if DMA is
 supported
To: Guenter Roeck <linux@roeck-us.net>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
References: <20240924210123.2288529-1-linux@roeck-us.net>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20240924210123.2288529-1-linux@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_085620_019026_EBB54E12 
X-CRM114-Status: GOOD (  15.17  )
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

On 24/09/2024 10:01 pm, Guenter Roeck wrote:
> Since upstream commit 334304ac2bac ("dma-mapping: don't return errors
> from dma_set_max_seg_size") calling dma_set_max_seg_size() on a device
> not supporting DMA results in a warning traceback. This is seen when
> booting the sifive_u machine from SD. The underlying SPI controller
> (sifive,spi0 compatible) explicitly sets dma_mask to NULL.

Hmm, that driver probably shouldn't be doing that, but either way it's 
not actually relevant to this check - what's significant is that when 
the MMC host device is an "mmc-spi-slot" instance, its mmc_dev() ends up 
being the SPI *device* itself, not the grandparent SPI controller.

Thus the patch itself is appropriate on the basis that MMC hosts may 
exist on non-DMA-capable buses, so the subsystem needs to consider that.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Avoid the backtrace by only calling dma_set_max_seg_size() if DMA is
> supported.
> 
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   drivers/mmc/core/queue.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/core/queue.c b/drivers/mmc/core/queue.c
> index d0b3ca8a11f0..4d6844261912 100644
> --- a/drivers/mmc/core/queue.c
> +++ b/drivers/mmc/core/queue.c
> @@ -388,7 +388,8 @@ static struct gendisk *mmc_alloc_disk(struct mmc_queue *mq,
>   
>   	blk_queue_rq_timeout(mq->queue, 60 * HZ);
>   
> -	dma_set_max_seg_size(mmc_dev(host), queue_max_segment_size(mq->queue));
> +	if (mmc_dev(host)->dma_parms)
> +		dma_set_max_seg_size(mmc_dev(host), queue_max_segment_size(mq->queue));
>   
>   	INIT_WORK(&mq->recovery_work, mmc_mq_recovery_handler);
>   	INIT_WORK(&mq->complete_work, mmc_blk_mq_complete_work);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
