Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD214C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 07:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q5jtpWifwWrE9HzwKKjJHHsyp+fFTVjPuKYA+dbO+bE=; b=1mgC0Rdv5Zyf2u
	3UNEYfd249lxAQ3oHQYgTb6n4c47/Ao37z6OjCHKR+tV971viyn6dYxm8b1xTljm785UmVxJwMXt0
	DDvrzCmKFkpvR1Cyo7w3XlABNGMJvi1ocvt2V7HkyZGgZULnq0nwYK5d5S0GvEqjzUK4cTd2ABOTO
	wnv5Q8xzg/cYo8kZTgFqPfcLPHDhxvpk2jU0RyrfZ0xyF71pC4BWNTV/VmmSRRwkzqEq2jjQ7VnZg
	fp0f8jABJbD6Sh6BbbSxZ71yuuMReOZdKNARXRAp381/QWchJ2tCm4WremUwy6yaWCeFo9prEi/Fj
	82hJBoF5bvf7BXsGthlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4e46-0012oa-L5; Fri, 24 Jun 2022 07:49:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4e43-0012nx-2c
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 07:49:16 +0000
Received: from p508fdadf.dip0.t-ipconnect.de ([80.143.218.223] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1o4e3z-0007Di-1E; Fri, 24 Jun 2022 09:49:11 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Christoph Hellwig <hch@lst.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, wefu@redhat.com, guoren@kernel.org, cmuellner@linux.com, philipp.tomsich@vrull.eu, hch@lst.de, samuel@sholland.org, atishp@atishpatra.org, anup@brainfault.org, mick@ics.forth.gr, robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, drew@beagleboard.org, rdunlap@infradead.org, Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH 3/4] riscv: Implement Zicbom-based cache management operations
Date: Fri, 24 Jun 2022 09:49:09 +0200
Message-ID: <4357313.8hb0ThOEGa@phil>
In-Reply-To: <20220620061607.GB10485@lst.de>
References: <20220619203212.3604485-1-heiko@sntech.de> <20220619203212.3604485-4-heiko@sntech.de> <20220620061607.GB10485@lst.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_004915_163096_A9EA1FB0 
X-CRM114-Status: GOOD (  21.87  )
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

Am Montag, 20. Juni 2022, 08:16:07 CEST schrieb Christoph Hellwig:
> On Sun, Jun 19, 2022 at 10:32:11PM +0200, Heiko Stuebner wrote:
> > +#ifdef CONFIG_RISCV_DMA_NONCOHERENT
> > +#define ARCH_DMA_MINALIGN L1_CACHE_BYTES
> > +#endif
> 
> This needs to be greater or equal to riscv_cbom_block_size, but the
> core code requires a compile time constant here.  So we'll need a big
> fat comment here, and panic if riscv_cbom_block_size is >
> L1_CACHE_BYTES/ARCH_DMA_MINALIGN in the code that queries
> riscv_cbom_block_size.

ARM people also had this nice WARN_TAINT to warn when the similar
case happens on ARM64 and the ARCH_DMA_MINALIGN is smaller than
the register value so I've added a similar mechanism.

I've read numerous mails from Torvalds over time that panic-ing should
only ever be the very very last resort, so that WARN_TAINT looks like
a less drastic option while still generating that big warning to users.


> Note that the arm64 folks are looking into making this variable or
> killing it off in this current form, so things might be getting better
> soon.
> 
> > +void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> > +			      enum dma_data_direction dir)
> > +{
> > +	void *vaddr = phys_to_virt(paddr);
> > +
> > +	switch (dir) {
> > +	case DMA_TO_DEVICE:
> > +		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
> > +		break;
> > +	case DMA_FROM_DEVICE:
> > +		ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
> > +		break;
> 
> For this also see:
> 
> https://lore.kernel.org/all/20220606152150.GA31568@willie-the-truck/
> 
> and
> 
> https://lore.kernel.org/linux-arm-kernel/20220610151228.4562-1-will@kernel.org/T/

so from that discussion, it looks like a "clean" should happen here to
prevent stale bytes (not written to by the dma transfer itself) in the
buffer area I guess.

I'll give that a spin :-)

> > +void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
> > +		const struct iommu_ops *iommu, bool coherent)
> > +{
> > +	dev->dma_coherent = coherent;
> > +}
> 
> This probably wants a sanity check warn if coherent if false without
> any support for cache flushing as that will cause data corruption.

I've added a riscv_noncoherent_supported() call that will track that
"somebody" implemented non-coherence functionality from their
setup function (zicbom_probe, thead_errata-probe) and a matching
second WARN_TAINT in arch_setup_dma_ops() when coherent value
and availability of non-coherence handling is not matched.

Heiko





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
