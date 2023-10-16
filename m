Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5DECDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 11:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7I+XMFK9x5xdLbzgKt57RJf/7fBRgjtjYhF/+DpijWA=; b=YII45rsyK131nu
	YY5eAGNd1t9XJww1DyfVMZ1FOAHVJq7Cp+uLrC1qYYVMIJsfHIAPzFlx93V/BuAtBV/ldOBAv8ihe
	zmseGFDRzQZ12HChIY8YSjpb5qckhUGBr0a1wr2vUTBSYbxX4W4qabpNRjdxxOvzgIh5zxuLOQ6ib
	OdQ3lm2zLF05ry1bFfoXgaQDN1KcBmRw/66neC5SDs7v1xQ6lq9+xunnrZS2J8swI66RGpvK7rhbE
	vNFejv/Rz13aGaXzSIBhuQVvCcjuBMz7zwisrz8ku9JViixsYT+Ssqtsvuj7lZpqWCE/sGBPOB0cY
	5Nru75Z+OLidaYqYBdOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsMFM-009XJ9-1o;
	Mon, 16 Oct 2023 11:58:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsMFJ-009XIS-0z
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 11:58:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 616F01FB;
	Mon, 16 Oct 2023 04:59:31 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 698A83F5A1;
	Mon, 16 Oct 2023 04:58:48 -0700 (PDT)
Message-ID: <fffcf35b-0da5-4df5-9224-5ac4e28b5f3a@arm.com>
Date: Mon, 16 Oct 2023 12:58:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] dma-direct: simplify the use atomic pool logic in
 dma_direct_alloc
Content-Language: en-GB
To: Christoph Hellwig <hch@lst.de>, Greg Ungerer <gerg@linux-m68k.org>,
 iommu@lists.linux.dev
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Wei Fang <wei.fang@nxp.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-m68k@lists.linux-m68k.org,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, Jim Quinlan <james.quinlan@broadcom.com>
References: <20231016054755.915155-1-hch@lst.de>
 <20231016054755.915155-8-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20231016054755.915155-8-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_045853_391921_F8841C13 
X-CRM114-Status: GOOD (  20.59  )
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

On 16/10/2023 6:47 am, Christoph Hellwig wrote:
> The logic in dma_direct_alloc when to use the atomic pool vs remapping
> grew a bit unreadable.  Consolidate it into a single check, and clean
> up the set_uncached vs remap logic a bit as well.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   kernel/dma/direct.c | 25 ++++++++++---------------
>   1 file changed, 10 insertions(+), 15 deletions(-)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index ec410af1d8a14e..1327d04fa32a25 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -234,27 +234,22 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>   					dma_handle);
>   
>   		/*
> -		 * Otherwise remap if the architecture is asking for it.  But
> -		 * given that remapping memory is a blocking operation we'll
> -		 * instead have to dip into the atomic pools.
> +		 * Otherwise we require the architecture to either be able to
> +		 * mark arbitrary parts of the kernel direct mapping uncached,
> +		 * or remapped it uncached.
>   		 */
> +		set_uncached = IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED);
>   		remap = IS_ENABLED(CONFIG_DMA_DIRECT_REMAP);
> -		if (remap) {
> -			if (dma_direct_use_pool(dev, gfp))
> -				return dma_direct_alloc_from_pool(dev, size,
> -						dma_handle, gfp);
> -		} else {
> -			if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED))
> -				return NULL;
> -			set_uncached = true;
> -		}
> +		if (!set_uncached && !remap)
> +			return NULL;
>   	}
>   
>   	/*
> -	 * Decrypting memory may block, so allocate the memory from the atomic
> -	 * pools if we can't block.
> +	 * Remapping or decrypting memory may block, allocate the memory from
> +	 * the atomic pools instead if we aren't allowed block.
>   	 */
> -	if (force_dma_unencrypted(dev) && dma_direct_use_pool(dev, gfp))
> +	if ((remap || force_dma_unencrypted(dev)) &&
> +	    dma_direct_use_pool(dev, gfp))
>   		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
>   
>   	/* we always manually zero the memory once we are done */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
