Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55F2CDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 12:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MkXAtO9ZbF7vBjjIFA5m0dDBWWv6fzDv4LcfiJ7qbRY=; b=d5sK3WvDfBxIwq
	v7HBDp/CXBRvOhS61waJjlRUue9D8KIsSA87D1K4ThFNfItleQcNfw1lAH5xKXyl45YTXcnNbzMmi
	SXy/OFNWEooWAP1Ojus+u3ZNZkHhguGKdnH6/NOvNOinDL+pVVOA8S36twjzTaU8LEK5tqSC19sZB
	napeMMQtR+EYMwdjjRk7kcGM90tVQ2t1jYr2mT71HtdE3yZPsLYVUSUm3gIn1b5OdJ/Hxk0iaw1wm
	0PvjYTm4q5KfCfCgXBqYImLZG3Bt22tEbg8nyA0VtSBolGz80J0h/0YzJNLwpg0HmJTvM1gOY7BPE
	nesl660a0vEaQcnALj6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsMGM-009XQR-2W;
	Mon, 16 Oct 2023 11:59:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsMGK-009XQ8-29
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 11:59:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B8461FB;
	Mon, 16 Oct 2023 05:00:33 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA1E43F5A1;
	Mon, 16 Oct 2023 04:59:49 -0700 (PDT)
Message-ID: <4f709c6d-0635-4136-9cfa-717484f47fde@arm.com>
Date: Mon, 16 Oct 2023 12:59:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] dma-direct: warn when coherent allocations aren't
 supported
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
 <20231016054755.915155-9-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20231016054755.915155-9-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_045956_753284_FEC7CE0A 
X-CRM114-Status: GOOD (  14.09  )
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
> Log a warning once when dma_alloc_coherent fails because the platform
> does not support coherent allocations at all.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   kernel/dma/direct.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 1327d04fa32a25..fddfea3b2fe173 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -240,8 +240,10 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>   		 */
>   		set_uncached = IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED);
>   		remap = IS_ENABLED(CONFIG_DMA_DIRECT_REMAP);
> -		if (!set_uncached && !remap)
> +		if (!set_uncached && !remap) {
> +			pr_warn_once("coherent DMA allocations not supported on this platform.\n");
>   			return NULL;
> +		}
>   	}
>   
>   	/*

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
