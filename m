Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D6BC3DA59
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 14:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YaQrQ7E5+BCTwQSa4z4olTUFHWOQxT3TgEdnU/TEcP4=; b=SysPNySxqdEuaa
	lHFX6cnso6HkYHBFU2Wp9HB0SLrQB9hVD3a7nofM5cPt68uRq7j3/xGUchpCvNTUjiFOzWePgDXX5
	Pr7iL3az+h1auLd0aoDqX9uhtC4AESXkuJuxmPuzpCAX2ALwy/dINYJOFEYhl/6BW9TUu2hBW7e79
	c7KtbT/QTufwuEVxhphyi5U+p8iVo6za7haSK23xpp03R0/kcNq7L6qz0tXWFGDpiEvMmgENXu7AD
	fAPBn7f+LokWKDSCHSWi88t6SyHUqWa00XFa2PvvcmiIHuSSMIRxd/SfIEFOUmjnZYZCVxn4CJJEq
	frBrWkkxOSVAv/++lL0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVuVA-00000009r9P-3dB8;
	Mon, 22 Jul 2024 14:59:00 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVuV4-00000009r7o-3jBD;
	Mon, 22 Jul 2024 14:58:54 +0000
Date: Mon, 22 Jul 2024 07:58:54 -0700
From: Christoph Hellwig <hch@infradead.org>
To: ysionneau@kalrayinc.com
Cc: linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Borne <jborne@kalrayinc.com>,
	Julian Vetter <jvetter@kalrayinc.com>,
	Clement Leger <clement@clement-leger.fr>,
	Guillaume Thouvenin <thouveng@gmail.com>,
	Jean-Christophe Pince <jcpince@gmail.com>,
	Jules Maselbas <jmaselbas@zdiv.net>,
	Julien Hascoet <jhascoet@kalrayinc.com>,
	Louis Morhet <lmorhet@kalrayinc.com>,
	Marc =?iso-8859-1?Q?Poulhi=E8s?= <dkm@kataplop.net>,
	Marius Gligor <mgligor@kalrayinc.com>,
	Vincent Chardon <vincent.chardon@elsys-design.com>,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [RFC PATCH v3 24/37] kvx: Add memory management
Message-ID: <Zp5zrkwyagnkoY7F@infradead.org>
References: <20240722094226.21602-1-ysionneau@kalrayinc.com>
 <20240722094226.21602-25-ysionneau@kalrayinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240722094226.21602-25-ysionneau@kalrayinc.com>
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

> +#include "../../../drivers/iommu/dma-iommu.h"

This is not a public header as you can guess from the file path.

> +	switch (dir) {
> +	case DMA_TO_DEVICE:
> +		break;
> +	case DMA_FROM_DEVICE:
> +		break;
> +
> +	case DMA_BIDIRECTIONAL:
> +		inval_dcache_range(paddr, size);

Doing this just for bidirectional is weird unless your architecture
never does any speculative prefetching.  Other architectures
include DMA_FROM_DEVICE here.

> +#ifdef CONFIG_IOMMU_DMA
> +void arch_teardown_dma_ops(struct device *dev)
> +{
> +	dev->dma_ops = NULL;
> +}
> +#endif /* CONFIG_IOMMU_DMA*/

This should not be needed right now.  And will be completley
useless once we do the direct calls to dma-iommu which we plan
to do for Linux 6.12.

> +void arch_setup_dma_ops(struct device *dev, bool coherent)
> +{
> +	dev->dma_coherent = coherent;
> +	if (device_iommu_mapped(dev))
> +		iommu_setup_dma_ops(dev);
> +}

And this seems odd, as iommu_setup_dma_ops is called from the iommu
code and you shouldn't need it here.

I also wonder if we can come up with a way to do the ->dma_coherent
setup in common code and remove a few of these arch hooks entirely.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
