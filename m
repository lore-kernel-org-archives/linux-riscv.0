Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45315C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jun 2022 18:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U8weEG7GvWLC59OJYARTfJEPFngdSeGU7LKMIpuAl00=; b=mqA1usr7yOPLIX
	nfS/eZFdxJEfsYLAa8zcFZku2qk//NzUNXjlJJ7YOojKSz7QM0PeEUAfkOERaLJFYwx3QhmG7Knvc
	tjBs6YmDTcwvW/F6C3IFw4lEZMgdw0NciMbYPoBwB9dUW8NFUPoGJl9RShI+njhnMjLR6oq4Ih+/3
	M3C7J+JApgOZ+bvHOXuIY3uNaLxL8eJOpizOhVFTFC1CEfVydfbsb0y1R7/96iiA10ullLmyzcZ90
	FUss3xrrG5D96HuEqYOuMEN8CqUIgWfw9jqdhjhT/0S1d+xwLqaJrJFMjQaB9XnTx5AkchGW1WqMq
	fwAwRryxys1Th8kByXoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwTGU-0002ni-Tx; Wed, 01 Jun 2022 18:40:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwTGJ-0002jn-Ib; Wed, 01 Jun 2022 18:40:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B8B8761684;
	Wed,  1 Jun 2022 18:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E30C385B8;
	Wed,  1 Jun 2022 18:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654108806;
	bh=vpZ1oNTlay8NWlxGY9rUMzeRkjnKLNWUB5LHGYBDV9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SV4cmB3MpgVr8rN3mq/AgsHnJ59ZjgcffarURyAfkAdkEzNpXND21AvmUXs/TCSKG
	 JN6Kln9Qh2fKKoNGqhtzaeN3GVMD5O+WlHNEGZq1+TVFKTgXvUeTxpOC2opw2jzy3M
	 bzs+i28vGY/FzwHvhAo/7MfauYLqirVh5qrYbf/9uggvCsKOW9dGOrTbtu8Bly2ogq
	 gdOF0hMn+j3+XeZkNnzwCZiw7gyMKIj6V8TC3bRb8s5c+amjSWyv+xMo80ucbbrM+M
	 K8Ccnhjy4g9orAMgOh/NR3ZQR6ir+xGwf35PRNSGyFHOR15Ppn2g/2bRwSBc69z3WO
	 cpjY5uJWVEvrQ==
Date: Wed, 1 Jun 2022 11:40:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: iommu@lists.linux-foundation.org, x86@kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>, Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org, linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-hyperv@vger.kernel.org, tboot-devel@lists.sourceforge.net,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH 09/15] swiotlb: make the swiotlb_init interface more
 useful
Message-ID: <Ypeyg2Dm/WfoKDZt@dev-arch.thelio-3990X>
References: <20220404050559.132378-1-hch@lst.de>
 <20220404050559.132378-10-hch@lst.de>
 <YpehC7BwBlnuxplF@dev-arch.thelio-3990X>
 <20220601173441.GB27582@lst.de>
 <YpemDuzdoaO3rijX@Ryzen-9-3900X.>
 <20220601175743.GA28082@lst.de>
 <Yper7agk7XfCCQNa@dev-arch.thelio-3990X>
 <20220601182141.GA28309@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220601182141.GA28309@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_114007_734566_C2FC2DAA 
X-CRM114-Status: GOOD (  29.85  )
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

On Wed, Jun 01, 2022 at 08:21:41PM +0200, Christoph Hellwig wrote:
> On Wed, Jun 01, 2022 at 11:11:57AM -0700, Nathan Chancellor wrote:
> > On Wed, Jun 01, 2022 at 07:57:43PM +0200, Christoph Hellwig wrote:
> > > On Wed, Jun 01, 2022 at 10:46:54AM -0700, Nathan Chancellor wrote:
> > > > On Wed, Jun 01, 2022 at 07:34:41PM +0200, Christoph Hellwig wrote:
> > > > > Can you send me the full dmesg and the content of
> > > > > /sys/kernel/debug/swiotlb/io_tlb_nslabs for a good and a bad boot?
> > > > 
> > > > Sure thing, they are attached! If there is anything else I can provide
> > > > or test, I am more than happy to do so.
> > > 
> > > Nothing interesting.  But the performance numbers almost look like
> > > swiotlb=force got ignored before (even if I can't explain why).
> > 
> > I was able to get my performance back with this diff but I don't know if
> > this is a hack or a proper fix in the context of the series.
> 
> This looks good, but needs a little tweak.  I'd go for this variant of
> it:

Tested-by: Nathan Chancellor <nathan@kernel.org>

Thanks a lot for the quick fix!

> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index dfa1de89dc944..cb50f8d383606 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -192,7 +192,7 @@ void __init swiotlb_update_mem_attributes(void)
>  }
>  
>  static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
> -				    unsigned long nslabs, bool late_alloc)
> +		unsigned long nslabs, unsigned int flags, bool late_alloc)
>  {
>  	void *vaddr = phys_to_virt(start);
>  	unsigned long bytes = nslabs << IO_TLB_SHIFT, i;
> @@ -203,8 +203,7 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
>  	mem->index = 0;
>  	mem->late_alloc = late_alloc;
>  
> -	if (swiotlb_force_bounce)
> -		mem->force_bounce = true;
> +	mem->force_bounce = swiotlb_force_bounce || (flags & SWIOTLB_FORCE);
>  
>  	spin_lock_init(&mem->lock);
>  	for (i = 0; i < mem->nslabs; i++) {
> @@ -275,8 +274,7 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
>  		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
>  		      __func__, alloc_size, PAGE_SIZE);
>  
> -	swiotlb_init_io_tlb_mem(mem, __pa(tlb), nslabs, false);
> -	mem->force_bounce = flags & SWIOTLB_FORCE;
> +	swiotlb_init_io_tlb_mem(mem, __pa(tlb), nslabs, flags, false);
>  
>  	if (flags & SWIOTLB_VERBOSE)
>  		swiotlb_print_info();
> @@ -348,7 +346,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
>  
>  	set_memory_decrypted((unsigned long)vstart,
>  			     (nslabs << IO_TLB_SHIFT) >> PAGE_SHIFT);
> -	swiotlb_init_io_tlb_mem(mem, virt_to_phys(vstart), nslabs, true);
> +	swiotlb_init_io_tlb_mem(mem, virt_to_phys(vstart), nslabs, 0, true);
>  
>  	swiotlb_print_info();
>  	return 0;
> @@ -835,8 +833,8 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
>  
>  		set_memory_decrypted((unsigned long)phys_to_virt(rmem->base),
>  				     rmem->size >> PAGE_SHIFT);
> -		swiotlb_init_io_tlb_mem(mem, rmem->base, nslabs, false);
> -		mem->force_bounce = true;
> +		swiotlb_init_io_tlb_mem(mem, rmem->base, nslabs, SWIOTLB_FORCE,
> +				false);
>  		mem->for_alloc = true;
>  
>  		rmem->priv = mem;
> 

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
