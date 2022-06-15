Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F97C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jun 2022 16:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SGgxKskuajrTuIL6EtV3mGWF11HVHsFBjZaZ+WEW7r8=; b=vpxqg4widRNwV/
	x2iD2izbpTt3XKRG/+DRf6R4oW6f3QAHHwkAMV1YZORiyveHyG0L7YeWPBpZ7ncQcZFPvcERcPolD
	jVxHLa0aGspRm8mhQTi+YO/Xu/5oE2GGRF+5Lv0BbC3WAEF0l1t25UCmxH4Hmx8Y6usjy0EUMQMI1
	gyTDQLHPvuTGuW7y43JWGeoYEbU1XUAVaOV4cKYiLJ3gg7MrNJfKNgA/FSP24KFPLog0VIGm5wNY4
	0WjnM3FHhPEBGF5+YauxksHeHtFXFy40yr7vCSHs6i7zAJOoacfHXCRB14RTx9MIksz1j6OZ1FyuX
	KH4BlCQAnBWMrGunpvhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1WK4-00FX0m-BC; Wed, 15 Jun 2022 16:56:52 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1WK1-00FWyo-0j
	for linux-riscv@lists.infradead.org; Wed, 15 Jun 2022 16:56:50 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1o1WJt-0008LU-1G; Wed, 15 Jun 2022 18:56:41 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Christoph Hellwig <hch@lst.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, wefu@redhat.com, guoren@kernel.org, cmuellner@linux.com, philipp.tomsich@vrull.eu, hch@lst.de, samuel@sholland.org, atishp@atishpatra.org, anup@brainfault.org, mick@ics.forth.gr, robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, drew@beagleboard.org, Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH 2/3] riscv: Implement Zicbom-based cache management operations
Date: Wed, 15 Jun 2022 18:56:40 +0200
Message-ID: <110361853.nniJfEyVGO@diego>
In-Reply-To: <20220610055608.GA24221@lst.de>
References: <20220610004308.1903626-1-heiko@sntech.de> <20220610004308.1903626-3-heiko@sntech.de> <20220610055608.GA24221@lst.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_095649_107231_3F8B7B18 
X-CRM114-Status: GOOD (  35.11  )
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

Hi Christoph,

Am Freitag, 10. Juni 2022, 07:56:08 CEST schrieb Christoph Hellwig:
> On Fri, Jun 10, 2022 at 02:43:07AM +0200, Heiko Stuebner wrote:
> > +config RISCV_ISA_ZICBOM
> > +	bool "Zicbom extension support for non-coherent dma operation"
> > +	select ARCH_HAS_DMA_PREP_COHERENT
> > +	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
> > +	select ARCH_HAS_SYNC_DMA_FOR_CPU
> > +	select ARCH_HAS_SETUP_DMA_OPS
> > +	select DMA_DIRECT_REMAP
> > +	select RISCV_ALTERNATIVE
> > +	default y
> > +	help
> > +	   Adds support to dynamically detect the presence of the ZICBOM extension
> 
> Overly long line here.

fixed

> 
> > +	   (Cache Block Management Operations) and enable its usage.
> > +
> > +	   If you don't know what to do here, say Y.
> 
> But more importantly I think the whole text here is not very helpful.
> What users care about is non-coherent DMA support.  What extension is
> used for that is rather secondary.

I guess it might make sense to split that in some way.
I.e. Zicbom provides one implementation for handling non-coherence,
the D1 uses different (but very similar) instructions while the SoC on the
Beagle-V does something completely different.

So I guess it could make sense to have a general DMA_NONCOHERENT option
and which gets selected by the relevant users.

This also fixes the issue that Zicbom needs a very new binutils
but if beagle-v support happens that wouldn't need that.


> Also please capitalize DMA.

fixed

> > +void arch_sync_dma_for_device(phys_addr_t paddr, size_t size, enum dma_data_direction dir)
> > +{
> > +	switch (dir) {
> > +	case DMA_TO_DEVICE:
> > +		ALT_CMO_OP(CLEAN, (unsigned long)phys_to_virt(paddr), size, riscv_cbom_block_size);
> > +		break;
> > +	case DMA_FROM_DEVICE:
> > +		ALT_CMO_OP(INVAL, (unsigned long)phys_to_virt(paddr), size, riscv_cbom_block_size);
> > +		break;
> > +	case DMA_BIDIRECTIONAL:
> > +		ALT_CMO_OP(FLUSH, (unsigned long)phys_to_virt(paddr), size, riscv_cbom_block_size);
> > +		break;
> > +	default:
> > +		break;
> > +	}
> 
> Pleae avoid all these crazy long lines.  and use a logical variable
> for the virtual address.  And why do you pass that virtual address
> as an unsigned long to ALT_CMO_OP?  You're going to make your life
> much easier if you simply always pass a pointer.

fixed all of those.
And of course you're right, not having the cast when calling ALT_CMO_OP
makes things definitly a lot nicer looking.

> Last but not last, does in RISC-V clean mean writeback and flush mean
> writeback plus invalidate?  If so the code is correct, but the choice
> of names in the RISC-V spec is extremely unfortunate.

clean: 
    makes data [...] visible to a set of non-coherent agents [...] by
    performing a write transfer of a copy of a cache block [...]

flush:
    performs a clean followed by an invalidate

So that's a yes to your question

> > +void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size, enum dma_data_direction dir)
> > +{
> > +	switch (dir) {
> > +	case DMA_TO_DEVICE:
> > +		break;
> > +	case DMA_FROM_DEVICE:
> > +	case DMA_BIDIRECTIONAL:
> > +		ALT_CMO_OP(INVAL, (unsigned long)phys_to_virt(paddr), size, riscv_cbom_block_size);
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +}
> 
> Same comment here and in few other places.

fixed

> > +
> > +void arch_dma_prep_coherent(struct page *page, size_t size)
> > +{
> > +	void *flush_addr = page_address(page);
> > +
> > +	memset(flush_addr, 0, size);
> > +	ALT_CMO_OP(FLUSH, (unsigned long)flush_addr, size, riscv_cbom_block_size);
> > +}
> 
> arch_dma_prep_coherent should never zero the memory, that is left
> for the upper layers.`

fixed

> > +void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
> > +		const struct iommu_ops *iommu, bool coherent)
> > +{
> > +	/* If a specific device is dma-coherent, set it here */
> 
> This comment isn't all that useful.

ok, I've dropped it

> > +	dev->dma_coherent = coherent;
> > +}
> 
> But more importantly, this assums that once this code is built all
> devices are non-coherent by default.  I.e. with this patch applied
> and the config option enabled we'll now suddenly start doing cache
> management operations or setups that didn't do it before.

If I'm reading things correctly [0], the default for those functions
is for those to be empty - but defined in the coherent case.

When you look at the definition of ALT_CMO_OP

#define ALT_CMO_OP(_op, _start, _size, _cachesize)                      \
asm volatile(ALTERNATIVE_2(                                             \
        __nops(6),                                                      \

 you'll see that it's default variant is to do nothing and it doing any
non-coherency voodoo is only patched in if the Zicbom extension
(or T-Head errata) is detected at runtime.

So in the coherent case (with the memset removed as you suggested),
the arch_sync_dma_* and arch_dma_prep_coherent functions end up as
something like

void arch_dma_prep_coherent(struct page *page, size_t size)
{
        void *flush_addr = page_address(page);

        nops(6);
}

which is very mich similar to the defaults [0] I guess, or am I
overlooking something?

Thanks for taking the time for that review
Heiko


[0] https://elixir.bootlin.com/linux/latest/source/include/linux/dma-map-ops.h#L293



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
