Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C5DC47077
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 09:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4nbQAhSg5tEI+O4D4iSHgKcHVYsRPHIXj0KpyiKPyXM=; b=mCvabDIMD7KmvA
	LVhJEkNCtmgvLQqxMyi/rmgkZOgvZ3mhObcfs2974XpRJxWfd9RgvSNKjtDn3jWwIvC9v/6wHAmHe
	OmEVTYCcMk/+v/7t7fsoUqAdHdh1TH5kAS/md40s31IwUuVYCCFrlI/jZKzvCa3nKX55Xs6Q8Jq0y
	8xDz5xQLRLwuV5eR7LAbtlmQab39+deH6iUoJpJfgyCLEDMVNfvrdLpZkXibBkmCrGHmOiGgAfSGO
	+u/NwbunIr/W+GpjcLC349XC7dkFa++1qKSAC7Xa63jnw46SIMwaGyBuWP1ftmo6NatAVL2oQuSDL
	Huy9rgK2eySIfKbBdnug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPfJh-00BUQb-0T;
	Tue, 16 Jan 2024 09:01:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPfJb-00BUPD-0Q
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jan 2024 09:01:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9939260C51;
	Tue, 16 Jan 2024 09:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F66C433F1;
	Tue, 16 Jan 2024 09:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705395628;
	bh=di/4fMjfr6Qyln0B/UJqaBwpqtAPoZXkJ8p/k1oNafw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hklNV1fFN5eLri4NfL+3V9gE5akiVw5GC5qfmWJrOJgIe/0OgrBA88PLZdwcQ2TnL
	 NMxykHRst2G33UAwtW2S+gB54g0d7ynHHt0jO3nkgPdZqDLpIHXN2oOFQYyY/dcq8O
	 7Bc/gn/BYJOZeNdfL3Da9m851xUT4LGjp53eu1Molfld2Rvde8QVQH1ACz1svNE1dd
	 83h8DAu8JipA583K64Q6n9I1e7YSEOpqLd88wt4yJk98ckAH05EKRkrifAvdlCT2D1
	 dnK4iCvRmz9AI7KT6yXVPmhhrrEK+L+mpgm/Kr0J9zdfUXqa7xUuOp00p3CQrptDmy
	 2MF0CJGGMq+3A==
Date: Tue, 16 Jan 2024 16:47:36 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: mm: still create swiotlb buffer for kmalloc()
 bouncing if required
Message-ID: <ZaZCqAir6BdiN80K@xhacker>
References: <20231202134224.4029-1-jszhang@kernel.org>
 <aea8222e-ec0a-4844-abd0-7fe102bc2bec@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aea8222e-ec0a-4844-abd0-7fe102bc2bec@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_010059_267428_51DE7A49 
X-CRM114-Status: GOOD (  30.38  )
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

On Tue, Jan 16, 2024 at 09:23:47AM +0100, Alexandre Ghiti wrote:
> Hi Jisheng,
> 
> On 02/12/2023 14:42, Jisheng Zhang wrote:
> > After commit f51f7a0fc2f4 ("riscv: enable DMA_BOUNCE_UNALIGNED_KMALLOC
> > for !dma_coherent"), for non-coherent platforms with less than 4GB
> > memory, we rely on users to pass "swiotlb=mmnn,force" kernel parameters
> > to enable DMA bouncing for unaligned kmalloc() buffers. Now let's go
> > further: If no bouncing needed for ZONE_DMA, let kernel automatically
> > allocate 1MB swiotlb buffer per 1GB of RAM for kmalloc() bouncing on
> > non-coherent platforms, so that no need to pass "swiotlb=mmnn,force"
> > any more.
> 
> IIUC, DMA_BOUNCE_UNALIGNED_KMALLOC is enabled for all non-coherent
> platforms, even those with less than 4GB of memory. But the DMA bouncing
> (which is necessary to enable kmalloc-8/16/32/96...) was not enabled unless
> the user specified "swiotlb=mmnn,force" on the kernel command line. But does
> that mean that if the user did not specify "swiotlb=mmnn,force", the
> kmalloc-8/16/32/96 were enabled anyway and the behaviour was wrong (by lack
> of DMA bouncing)?

Hi Alex,

For coherent platforms, kmalloc-8/16/32/96 was enabled.

For non-coherent platforms, if memory is more than 4GB, kmalloc-8/16/32/96 was enabled.

For non-coherent platforms, if memory is less than 4GB, kmalloc-8/16/32/96 was not
enabled. If users want kmalloc-8/16/32/96, we rely on users to pass "swiotlb=mmnn,force"

This patch tries to remove the "swiotlb=mmnn,force" requirement for the
last case. After this patch, kernel automatically uses "1MB swiotlb buffer per
1GB of RAM for kmalloc() bouncing" by default.

So this is an enhancement.

Thanks
> 
> I'm trying to understand if that's a fix or an enhancement.
> 
> Thanks,
> 
> Alex
> 
> 
> > 
> > The math of "1MB swiotlb buffer per 1GB of RAM for kmalloc() bouncing"
> > is taken from arm64. Users can still force smaller swiotlb buffer by
> > passing "swiotlb=mmnn".
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> > 
> > since v2:
> >   - fix build error if CONFIG_RISCV_DMA_NONCOHERENT=n
> > 
> >   arch/riscv/include/asm/cache.h |  2 +-
> >   arch/riscv/mm/init.c           | 16 +++++++++++++++-
> >   2 files changed, 16 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/cache.h b/arch/riscv/include/asm/cache.h
> > index 2174fe7bac9a..570e9d8acad1 100644
> > --- a/arch/riscv/include/asm/cache.h
> > +++ b/arch/riscv/include/asm/cache.h
> > @@ -26,8 +26,8 @@
> >   #ifndef __ASSEMBLY__
> > -#ifdef CONFIG_RISCV_DMA_NONCOHERENT
> >   extern int dma_cache_alignment;
> > +#ifdef CONFIG_RISCV_DMA_NONCOHERENT
> >   #define dma_get_cache_alignment dma_get_cache_alignment
> >   static inline int dma_get_cache_alignment(void)
> >   {
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index 2e011cbddf3a..cbcb9918f721 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -162,11 +162,25 @@ static void print_vm_layout(void) { }
> >   void __init mem_init(void)
> >   {
> > +	bool swiotlb = max_pfn > PFN_DOWN(dma32_phys_limit);
> >   #ifdef CONFIG_FLATMEM
> >   	BUG_ON(!mem_map);
> >   #endif /* CONFIG_FLATMEM */
> > -	swiotlb_init(max_pfn > PFN_DOWN(dma32_phys_limit), SWIOTLB_VERBOSE);
> > +	if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) && !swiotlb &&
> > +	    dma_cache_alignment != 1) {
> > +		/*
> > +		 * If no bouncing needed for ZONE_DMA, allocate 1MB swiotlb
> > +		 * buffer per 1GB of RAM for kmalloc() bouncing on
> > +		 * non-coherent platforms.
> > +		 */
> > +		unsigned long size =
> > +			DIV_ROUND_UP(memblock_phys_mem_size(), 1024);
> > +		swiotlb_adjust_size(min(swiotlb_size_or_default(), size));
> > +		swiotlb = true;
> > +	}
> > +
> > +	swiotlb_init(swiotlb, SWIOTLB_VERBOSE);
> >   	memblock_free_all();
> >   	print_vm_layout();

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
