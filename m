Return-Path: <SRS0=HVPl=MS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FBBC4338F
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 07:01:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50B32603E7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 07:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50B32603E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fnH8rtIQj6JjpuCLzC8Zsay6o8X0NuR6o53EcOZRYVY=; b=epWQ1WklESZsDl
	ay3EBdfsL3YjsfUo5BMrYwA4AA2DMHg9CpJ2D8Xr4150oOePJmhgYDLpOAmKUgo+241r9WfKLl/e5
	rWLa6LQArcSWTf6fpemJK9djQ77Htkl2hLMN+PKOsRt9YeKrM7UUQFWLoV6z5tMQ4ma9Ia4LrL5Yw
	OovMiIqfHhMG8UXjopQUQzeC8pYGoIP2EnprNUEANSUIcyXSFH23HpqBSnoJZq2phdX/cDvRG0HAG
	kxJYvnTyAh13/GcqfG64aWvWSc/WUGbue81dCS2BTNJTmJQu329UeXBm1df7kc3aUQ9Up8Sy/1cij
	0HcH+t1Y706zHqX1P9RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7ubp-009nyB-By; Mon, 26 Jul 2021 07:01:05 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7ubn-009nxA-43
 for linux-riscv@lists.infradead.org; Mon, 26 Jul 2021 07:01:04 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id B117C68BEB; Mon, 26 Jul 2021 09:01:00 +0200 (CEST)
Date: Mon, 26 Jul 2021 09:01:00 +0200
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
Subject: Re: [RFC 4/5] dma-direct: Allocate dma pages directly if global
 pool allocation fails
Message-ID: <20210726070100.GC9035@lst.de>
References: <20210723214031.3251801-1-atish.patra@wdc.com>
 <20210723214031.3251801-5-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210723214031.3251801-5-atish.patra@wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_000103_402248_B7FAF538 
X-CRM114-Status: GOOD (  22.22  )
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

On Fri, Jul 23, 2021 at 02:40:30PM -0700, Atish Patra wrote:
> DMA_GLOBAL_POOL config may be enabled for platforms where global pool is
> not supported because a generic defconfig is expected to boot on different
> platforms. Specifically, some RISC-V platforms may use global pool for
> non-coherent devices while some other platforms are completely coherent.
> However, it is expected that single kernel image must boot on all the
> platforms.
> 
> Continue the dma direct allocation if a allocation from global pool failed.
> This indicates that the platform is relying on some other method (direct
> remap) or just have coherent devices.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  kernel/dma/direct.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index d1d0258ed6d0..984ea776f099 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -161,8 +161,11 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  		return arch_dma_alloc(dev, size, dma_handle, gfp, attrs);
>  
>  	if (IS_ENABLED(CONFIG_DMA_GLOBAL_POOL) &&
> -	    !dev_is_dma_coherent(dev))
> -		return dma_alloc_from_global_coherent(dev, size, dma_handle);
> +	    !dev_is_dma_coherent(dev)) {
> +		ret = dma_alloc_from_global_coherent(dev, size, dma_handle);
> +		if (ret)
> +			return ret;

This will now silently return normal non-cache coherent memory when
the global pool allocation fails, and thus is completely broken.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
