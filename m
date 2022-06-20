Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6797BC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jun 2022 06:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gXG7BRTxI57FrPjA6liQVjyr/yl9REcgBW7jc1s5CBw=; b=IeEETZ3lEjSbxy
	d0yE8saoR3BfrZp+i1CMrepIWgp9napHT8k19EtT9cPK+VP+geIRhQ8VGGWTSkvcHayYYiI4WQGh5
	A2giQlnP4A+KRwMvwLAYNlP4S5CB3PKcE7kRZuHEc1k6pP8JkRFC0LntF99eM1h5eLZO4oBJM424H
	wU4gjvZaWVcCoIFkVf/Mn+T4csQa3/S/whiM0Ua1Xy3BlRL65jldFuqZ9rY2se6BqG9ukTjTzNVoB
	UNK1H2lYQAjytWrQ1cZ5yQIRUSW5ix/dEaCc4t5GjMf9uS6Y9hrU9QOQDSBP6SG/iJzjTlj/lc3BT
	T6xngUxUhnafCHeBfUiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Ahq-00GQDQ-Vd; Mon, 20 Jun 2022 06:16:14 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Ahn-00GQCO-Tb
	for linux-riscv@lists.infradead.org; Mon, 20 Jun 2022 06:16:13 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id DA9576732D; Mon, 20 Jun 2022 08:16:07 +0200 (CEST)
Date: Mon, 20 Jun 2022 08:16:07 +0200
From: Christoph Hellwig <hch@lst.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	wefu@redhat.com, guoren@kernel.org, cmuellner@linux.com,
	philipp.tomsich@vrull.eu, hch@lst.de, samuel@sholland.org,
	atishp@atishpatra.org, anup@brainfault.org, mick@ics.forth.gr,
	robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org,
	drew@beagleboard.org, rdunlap@infradead.org,
	Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH 3/4] riscv: Implement Zicbom-based cache management
 operations
Message-ID: <20220620061607.GB10485@lst.de>
References: <20220619203212.3604485-1-heiko@sntech.de> <20220619203212.3604485-4-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220619203212.3604485-4-heiko@sntech.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_231612_163096_D91C6355 
X-CRM114-Status: GOOD (  13.68  )
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

On Sun, Jun 19, 2022 at 10:32:11PM +0200, Heiko Stuebner wrote:
> +#ifdef CONFIG_RISCV_DMA_NONCOHERENT
> +#define ARCH_DMA_MINALIGN L1_CACHE_BYTES
> +#endif

This needs to be greater or equal to riscv_cbom_block_size, but the
core code requires a compile time constant here.  So we'll need a big
fat comment here, and panic if riscv_cbom_block_size is >
L1_CACHE_BYTES/ARCH_DMA_MINALIGN in the code that queries
riscv_cbom_block_size.

Note that the arm64 folks are looking into making this variable or
killing it off in this current form, so things might be getting better
soon.

> +void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> +			      enum dma_data_direction dir)
> +{
> +	void *vaddr = phys_to_virt(paddr);
> +
> +	switch (dir) {
> +	case DMA_TO_DEVICE:
> +		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
> +		break;
> +	case DMA_FROM_DEVICE:
> +		ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
> +		break;

For this also see:

https://lore.kernel.org/all/20220606152150.GA31568@willie-the-truck/

and

https://lore.kernel.org/linux-arm-kernel/20220610151228.4562-1-will@kernel.org/T/

> +void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
> +		const struct iommu_ops *iommu, bool coherent)
> +{
> +	dev->dma_coherent = coherent;
> +}

This probably wants a sanity check warn if coherent if false without
any support for cache flushing as that will cause data corruption.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
