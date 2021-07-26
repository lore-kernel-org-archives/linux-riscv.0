Return-Path: <SRS0=HVPl=MS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C25F6C4338F
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 06:58:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EF9460F23
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 06:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5EF9460F23
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XnYzEaSvWBQ/4xV1clPlQRyCyz4tAIHDwoc9vNiLOfE=; b=nVpoCPQIg/p1rQ
	KZHEhZ963Y66FvajiXliT7r+Bv70WSVbKMmsLU0EMv0EZDhd9LLMFzRyOi+K7dM9ZvzCD+yD/nerV
	/PjESQCaoFWxlVXQKAIoTdP7dcuT/6/RfizdINl9NU5z1vRbkpeDAtTGn7a0sDlWg9F2DCNS1Y0kw
	XDDEycBzgRHEDPjxw/RbGIzvI3Bx6uiHcvePr4/41sCGPtL6KbVCHDX9XZ5VnGszYq9GK9Qg/03t3
	v+iIinjxMHjTv0GEkdQbMJM/WaI618c4yR6tNhn2D41vKaoAcl4e8mhVrHRExtoc0TlKP08AsFtTP
	wFHJivGzNLXM4YpKuc6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7uY1-009nAC-4B; Mon, 26 Jul 2021 06:57:09 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7uXx-009n8V-LN
 for linux-riscv@lists.infradead.org; Mon, 26 Jul 2021 06:57:07 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 408B168AFE; Mon, 26 Jul 2021 08:56:58 +0200 (CEST)
Date: Mon, 26 Jul 2021 08:56:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: Atish Patra <atish.patra@wdc.com>
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Christoph Hellwig <hch@lst.de>, devicetree@vger.kernel.org,
 Dmitry Vyukov <dvyukov@google.com>, Frank Rowand <frowand.list@gmail.com>,
 Guo Ren <guoren@linux.alibaba.com>,
 iommu@lists.linux-foundation.org, linux-riscv@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Tobias Klauser <tklauser@distanz.ch>
Subject: Re: [RFC 1/5] RISC-V: Implement arch_sync_dma* functions
Message-ID: <20210726065657.GA9035@lst.de>
References: <20210723214031.3251801-1-atish.patra@wdc.com>
 <20210723214031.3251801-2-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210723214031.3251801-2-atish.patra@wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210725_235705_906126_39CB2375 
X-CRM114-Status: GOOD (  13.43  )
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

> +#ifdef CONFIG_RISCV_DMA_NONCOHERENT
> +struct riscv_dma_cache_sync {
> +	void (*cache_invalidate)(phys_addr_t paddr, size_t size);
> +	void (*cache_clean)(phys_addr_t paddr, size_t size);
> +	void (*cache_flush)(phys_addr_t paddr, size_t size);
> +};
> +
> +void riscv_dma_cache_sync_set(struct riscv_dma_cache_sync *ops);
> +#endif

As told a bunch of times before: doing indirect calls here is a
performance nightmare.  Use something that actually does perform
horribly like alternatives.  Or even delay implementing that until
we need it and do a plain direct call for now.

static void __dma_sync(phys_addr_t paddr, size_t size, enum dma_data_direction dir)
> +{
> +	if ((dir == DMA_FROM_DEVICE) && (dma_cache_sync->cache_invalidate))
> +		dma_cache_sync->cache_invalidate(paddr, size);
> +	else if ((dir == DMA_TO_DEVICE) && (dma_cache_sync->cache_clean))
> +		dma_cache_sync->cache_clean(paddr, size);
> +	else if ((dir == DMA_BIDIRECTIONAL) && dma_cache_sync->cache_flush)
> +		dma_cache_sync->cache_flush(paddr, size);
> +}

The seletion of flush types is completely broken.  Take a look at the
comment in arch/arc/mm/dma.c above arch_sync_dma_for_device for a good
explanation.

> +void arch_dma_prep_coherent(struct page *page, size_t size)
> +{
> +	void *flush_addr = page_address(page);
> +
> +	memset(flush_addr, 0, size);

arch_dma_prep_coherent is not supposed to modify the content of
the data.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
