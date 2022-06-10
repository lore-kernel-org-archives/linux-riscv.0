Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6732C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jun 2022 05:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+9R2xqXYaoMrcr5eWIuVHIDJVBcQAcFrhkMXZOFgI3I=; b=HWD8cHHFcIlxNQ
	BsUbAczLdaDZFpIHpWtsQX+ipPWlKWc1kVs/GfrzLic/FcgSKVF2+dFdyLqvVnxsb3ZyeATlt0tsW
	M5j1dfB97qf7zH6x3wh5KjbJn8x0P8eG4Oe3HIXX6eze2mOR9xA5EJ/KFbcHoPn3RtGPC+cNCj38y
	0NoaL5Zwwa494UdQ2lTVg3ySlGx6GbBQGpk1KcDsTfjSrqCMzPajGZWIX8KGWMeKR96uZPT4DvhI4
	mep0LCII2KPf9xAznt9F7W48GSU9WSNPPtmhhwu3uEveHL50qZMqAnSL8Piy2qanBlrijcLIjfshI
	Yb8ttNUXSMYM1Ar1nZpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzXd9-0064AJ-8x; Fri, 10 Jun 2022 05:56:23 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzXd5-006480-IP
	for linux-riscv@lists.infradead.org; Fri, 10 Jun 2022 05:56:21 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 6394D67373; Fri, 10 Jun 2022 07:56:08 +0200 (CEST)
Date: Fri, 10 Jun 2022 07:56:08 +0200
From: Christoph Hellwig <hch@lst.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	wefu@redhat.com, guoren@kernel.org, cmuellner@linux.com,
	philipp.tomsich@vrull.eu, hch@lst.de, samuel@sholland.org,
	atishp@atishpatra.org, anup@brainfault.org, mick@ics.forth.gr,
	robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org,
	drew@beagleboard.org, Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH 2/3] riscv: Implement Zicbom-based cache management
 operations
Message-ID: <20220610055608.GA24221@lst.de>
References: <20220610004308.1903626-1-heiko@sntech.de> <20220610004308.1903626-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220610004308.1903626-3-heiko@sntech.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_225619_928970_469FC5F6 
X-CRM114-Status: GOOD (  19.42  )
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

On Fri, Jun 10, 2022 at 02:43:07AM +0200, Heiko Stuebner wrote:
> +config RISCV_ISA_ZICBOM
> +	bool "Zicbom extension support for non-coherent dma operation"
> +	select ARCH_HAS_DMA_PREP_COHERENT
> +	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
> +	select ARCH_HAS_SYNC_DMA_FOR_CPU
> +	select ARCH_HAS_SETUP_DMA_OPS
> +	select DMA_DIRECT_REMAP
> +	select RISCV_ALTERNATIVE
> +	default y
> +	help
> +	   Adds support to dynamically detect the presence of the ZICBOM extension

Overly long line here.

> +	   (Cache Block Management Operations) and enable its usage.
> +
> +	   If you don't know what to do here, say Y.

But more importantly I think the whole text here is not very helpful.
What users care about is non-coherent DMA support.  What extension is
used for that is rather secondary.  Also please capitalize DMA.

> +void arch_sync_dma_for_device(phys_addr_t paddr, size_t size, enum dma_data_direction dir)
> +{
> +	switch (dir) {
> +	case DMA_TO_DEVICE:
> +		ALT_CMO_OP(CLEAN, (unsigned long)phys_to_virt(paddr), size, riscv_cbom_block_size);
> +		break;
> +	case DMA_FROM_DEVICE:
> +		ALT_CMO_OP(INVAL, (unsigned long)phys_to_virt(paddr), size, riscv_cbom_block_size);
> +		break;
> +	case DMA_BIDIRECTIONAL:
> +		ALT_CMO_OP(FLUSH, (unsigned long)phys_to_virt(paddr), size, riscv_cbom_block_size);
> +		break;
> +	default:
> +		break;
> +	}

Pleae avoid all these crazy long lines.  and use a logical variable
for the virtual address.  And why do you pass that virtual address
as an unsigned long to ALT_CMO_OP?  You're going to make your life
much easier if you simply always pass a pointer.

Last but not last, does in RISC-V clean mean writeback and flush mean
writeback plus invalidate?  If so the code is correct, but the choice
of names in the RISC-V spec is extremely unfortunate.

> +void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size, enum dma_data_direction dir)
> +{
> +	switch (dir) {
> +	case DMA_TO_DEVICE:
> +		break;
> +	case DMA_FROM_DEVICE:
> +	case DMA_BIDIRECTIONAL:
> +		ALT_CMO_OP(INVAL, (unsigned long)phys_to_virt(paddr), size, riscv_cbom_block_size);
> +		break;
> +	default:
> +		break;
> +	}
> +}

Same comment here and in few other places.

> +
> +void arch_dma_prep_coherent(struct page *page, size_t size)
> +{
> +	void *flush_addr = page_address(page);
> +
> +	memset(flush_addr, 0, size);
> +	ALT_CMO_OP(FLUSH, (unsigned long)flush_addr, size, riscv_cbom_block_size);
> +}

arch_dma_prep_coherent should never zero the memory, that is left
for the upper layers.`

> +void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
> +		const struct iommu_ops *iommu, bool coherent)
> +{
> +	/* If a specific device is dma-coherent, set it here */

This comment isn't all that useful.

> +	dev->dma_coherent = coherent;
> +}

But more importantly, this assums that once this code is built all
devices are non-coherent by default.  I.e. with this patch applied
and the config option enabled we'll now suddenly start doing cache
management operations or setups that didn't do it before.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
