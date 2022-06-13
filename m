Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A86BC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 05:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xJ4D+ER4n4VkeyGLeFH+/qD99YZPQ+6njJcqsI0MjRM=; b=jjOW/t/3CQlxsR
	oWT32oOpwnQR0dgXzSpTD16cwoSNMaQVcSL4UtMF0AlYSffkbEe16CB/yt/ljPomsQJen3Smr2Z1i
	4fjajOcwgxqw8r0RhwaP0Kepnp5M5cJXDX0MILaSBwH8lnSpw5TW9kcuy44COhImui4ummbU82PNz
	1Oh6ozyfQskJH4oB68yrpUcHkVJ4ndb4df9cmQDQZ23wL9IrQAMVM8eM+TaWjiHhoLQ3I7PQMRnYZ
	PrhBjO875QsTuveqXjd7g4rkU0SD7l036R7MSrtzYpbTwZU4IVwP0+jeYdl8HxvS5Tnk0UDR6C0Kc
	JxeDiYWjhanFcQ9Pv4YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0cyI-001YVy-Lb; Mon, 13 Jun 2022 05:50:42 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0cyF-001YUM-RV
	for linux-riscv@lists.infradead.org; Mon, 13 Jun 2022 05:50:41 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 6161568AA6; Mon, 13 Jun 2022 07:50:29 +0200 (CEST)
Date: Mon, 13 Jun 2022 07:50:29 +0200
From: Christoph Hellwig <hch@lst.de>
To: Samuel Holland <samuel@sholland.org>
Cc: Heiko Stuebner <heiko@sntech.de>, palmer@dabbelt.com,
	paul.walmsley@sifive.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, wefu@redhat.com, guoren@kernel.org,
	cmuellner@linux.com, philipp.tomsich@vrull.eu, hch@lst.de,
	atishp@atishpatra.org, anup@brainfault.org, mick@ics.forth.gr,
	robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org,
	drew@beagleboard.org, Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH 2/3] riscv: Implement Zicbom-based cache management
 operations
Message-ID: <20220613055029.GA32155@lst.de>
References: <20220610004308.1903626-1-heiko@sntech.de> <20220610004308.1903626-3-heiko@sntech.de> <342e3c12-ebb0-badf-7d4c-c444a2b842b2@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <342e3c12-ebb0-badf-7d4c-c444a2b842b2@sholland.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220612_225040_075982_FC401A9F 
X-CRM114-Status: GOOD (  13.78  )
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

On Sun, Jun 12, 2022 at 02:15:00PM -0500, Samuel Holland wrote:
> > +config RISCV_ISA_ZICBOM
> > +	bool "Zicbom extension support for non-coherent dma operation"
> > +	select ARCH_HAS_DMA_PREP_COHERENT
> > +	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
> > +	select ARCH_HAS_SYNC_DMA_FOR_CPU
> > +	select ARCH_HAS_SETUP_DMA_OPS
> 
> ARCH_HAS_SETUP_DMA_OPS needs to be separate from the non-coherent DMA option,
> because iommu_setup_dma_ops() will need to be called from arch_setup_dma_ops()
> even on a fully-coherent system. (But this change is not strictly necessary for
> this series.)

It doesn't need to be separate, you can just add another select for
the symbol.

> > +	case DMA_FROM_DEVICE:
> > +		ALT_CMO_OP(INVAL, (unsigned long)phys_to_virt(paddr), size, riscv_cbom_block_size);
> > +		break;
> 
> arch_sync_dma_for_device(DMA_FROM_DEVICE) is a no-op from the CPU's perspective.
> Invalidating the CPU's cache goes in arch_sync_dma_for_cpu(DMA_FROM_DEVICE).

Only if you guarantee that there is never any speculation.  See:

https://lore.kernel.org/lkml/20180518175004.GF17671@n2100.armlinux.org.uk

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
