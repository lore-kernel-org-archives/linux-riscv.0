Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38A6C001B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VcUmoTiM39EhfsfG+XMcZglHyPQGofrcYuf6QN/eQp4=; b=yMid014AjFRYsQ
	OdZzswley4FMuTCxlJFqq/52ZcWy16frWw7g2KgbXr/eoZaF+U8EHs081QHiWQ92Yta4u7WTj+WMj
	6rqiyI0u7LRMsm5WQzMDyajiwLQek1omw0whpqxsa36dK6XxfLhRmV7TuUjNDJ5v8+HMNVhnWS3X6
	WmLX55dkMeFpek7OqGCnjO2Vp9UHUVrUkmDIKmri9MDG/DofIOxYe5iLWM/f6Hyaad7LKau4+Tbjb
	R7B8DsKNt7WmaWbsAwX1A1cuTisB2OVekQ+cHmTdPviudY3cC8ozAl/PXS8XHeGN2ZkHR4zKsIgep
	AG39IrSTIQwiFkCssA3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0kP-005mFR-0P;
	Wed, 19 Jul 2023 06:33:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0kN-005mE0-1C
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:33:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WwFgsHtnYs4vgy1uUmwNvq9pxJMaJ742fbuM/xMTD6o=; b=TC3w2CXZ2Ql2jNH56nMVA3i/4n
	6Y0gBMNMj2hgFLvIIPKxsazgUhnJeU9OiK/UWo6bheZU6PdNdKfmUvybbDCKbDt/437C9FYp99Qv/
	NquJU5QTRclOuSxwxOLt6QEnehwsRmon76SpJz/p2YnFhWifWsRDPZ7ZJf/c8sdJlqY2Q5f02+ILc
	zuhNEdLoB0SzLRLfz/CMPI1ClpBjZI/TWzZHagw6M2MRHFM8/m/TnQpTDg/b33R65u0za2J0DrrfP
	jz0Ij2ImO2YbeB22rtw1g7XP/z7HEUV32cVSmOvjzZt0I2aOw2E9yAZeMrW8mGQxfA5hvXpOn/k0c
	XJF1eZUw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLm3U-00BeQ3-2z
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 14:52:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DDECD615A2;
	Tue, 18 Jul 2023 14:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDAF1C433C8;
	Tue, 18 Jul 2023 14:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689691907;
	bh=gmjcvA7n5faDSrCMzbCX4megI4WqnvTMm5Hoj8Ds/LA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JZ8IfIIk0SYNpmlwNXsBWnNAHXr/ZWod5/c666cBApDXFwrSCsVUQzaKEG2A0NdMv
	 cg3FmVQPix8DgikdHM0CRLwbW7DNXZO3l5NvfwdOWsBdWUV20mt28HN1Bh0ck18saR
	 MyU5cO4CS8hMD6EiL1VmSp7V0Y2ExoTaNH3/pwi3g4Ew/RzCXzJbu2R7EIUAx+i27i
	 oXhMTseXhjezDRv3F1sklp5zSW8nlzLmsN2+FJoE3xxFP5D47eEi3s/GjuslHIC4qx
	 ltLYqUo7AHk0/scqq++iQ+txIXHHxe1MJhaPqRNxo7R6kgNYyFGz0J+VF5M+4HCVpx
	 1VV64+V6wduXw==
Date: Tue, 18 Jul 2023 22:40:11 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] riscv: allow kmalloc() caches aligned to the
 smallest value
Message-ID: <ZLakS3Ff91dSAgaV@xhacker>
References: <20230716165147.1897-1-jszhang@kernel.org>
 <20230716165147.1897-2-jszhang@kernel.org>
 <20230718-brook-engross-1e7c273facdb@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230718-brook-engross-1e7c273facdb@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_155201_303416_5CCEF64B 
X-CRM114-Status: GOOD (  40.78  )
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

On Tue, Jul 18, 2023 at 11:23:50AM +0100, Conor Dooley wrote:
> Hey Jisheng,
> 
> On Mon, Jul 17, 2023 at 12:51:46AM +0800, Jisheng Zhang wrote:
> > Currently, riscv defines ARCH_DMA_MINALIGN as L1_CACHE_BYTES, I.E
> > 64Bytes, if CONFIG_RISCV_DMA_NONCOHERENT=y. To support unified kernel
> > Image, usually we have to enable CONFIG_RISCV_DMA_NONCOHERENT, thus
> > it brings some bad effects to coherent platforms:
> > 
> > Firstly, it wastes memory, kmalloc-96, kmalloc-32, kmalloc-16 and
> > kmalloc-8 slab caches don't exist any more, they are replaced with
> > either kmalloc-128 or kmalloc-64.
> > 
> > Secondly, larger than necessary kmalloc aligned allocations results
> > in unnecessary cache/TLB pressure.
> > 
> > This issue also exists on arm64 platforms. From last year, Catalin
> > tried to solve this issue by decoupling ARCH_KMALLOC_MINALIGN from
> > ARCH_DMA_MINALIGN, limiting kmalloc() minimum alignment to
> > dma_get_cache_alignment() and replacing ARCH_KMALLOC_MINALIGN usage
> > in various drivers with ARCH_DMA_MINALIGN etc.[1]
> > 
> > One fact we can make use of for riscv: if the CPU doesn't support
> > ZICBOM or T-HEAD CMO, we know the platform is coherent. Based on
> > Catalin's work and above fact, we can easily solve the kmalloc align
> > issue for riscv: we can override dma_get_cache_alignment(), then let
> > it return ARCH_DMA_MINALIGN at the beginning and return 1 once we know
> > the underlying HW neither supports ZICBOM nor supports T-HEAD CMO.
> > 
> > So what about if the CPU supports ZICBOM and T-HEAD CMO, but all the
> > devices are dma coherent? Well, we use ARCH_DMA_MINALIGN as the
> > kmalloc minimum alignment, nothing changed in this case. This case
> > can be improved in the future.
> > 
> > After this patch, a simple test of booting to a small buildroot rootfs
> > on qemu shows:
> > 
> > kmalloc-96           5041    5041     96  ...
> > kmalloc-64           9606    9606     64  ...
> > kmalloc-32           5128    5128     32  ...
> > kmalloc-16           7682    7682     16  ...
> > kmalloc-8           10246   10246      8  ...
> > 
> > So we save about 1268KB memory. The saving will be much larger in normal
> > OS env on real HW platforms.
> > 
> > [1] Link: https://lore.kernel.org/linux-arm-kernel/20230524171904.3967031-1-catalin.marinas@arm.com/
> 
> In the future,
> 
> Link: https://lore.kernel.org/linux-arm-kernel/20230524171904.3967031-1-catalin.marinas@arm.com/ [1]
> 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > Change-Id: Ica249d0f8058a02bd4bc6543b4ffc2946a4734a2
> 
> How come this has ended up with a Change-ID? Checkpatch says this is
> something to do with Gerrit & needs to be removed.

Oops, when amending, I forgot to add "-n". And I thought only amending
doesn't need to try checkpatch. Will fix it soon.

Thank you.

> 
> > ---
> >  arch/riscv/include/asm/cache.h      | 14 ++++++++++++++
> >  arch/riscv/include/asm/cacheflush.h |  2 ++
> >  arch/riscv/kernel/setup.c           |  1 +
> >  arch/riscv/mm/dma-noncoherent.c     |  8 ++++++++
> >  4 files changed, 25 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/cache.h b/arch/riscv/include/asm/cache.h
> > index d3036df23ccb..2174fe7bac9a 100644
> > --- a/arch/riscv/include/asm/cache.h
> > +++ b/arch/riscv/include/asm/cache.h
> > @@ -13,6 +13,7 @@
> >  
> >  #ifdef CONFIG_RISCV_DMA_NONCOHERENT
> >  #define ARCH_DMA_MINALIGN L1_CACHE_BYTES
> > +#define ARCH_KMALLOC_MINALIGN	(8)
> >  #endif
> >  
> >  /*
> > @@ -23,4 +24,17 @@
> >  #define ARCH_SLAB_MINALIGN	16
> >  #endif
> >  
> > +#ifndef __ASSEMBLY__
> > +
> > +#ifdef CONFIG_RISCV_DMA_NONCOHERENT
> > +extern int dma_cache_alignment;
> > +#define dma_get_cache_alignment dma_get_cache_alignment
> > +static inline int dma_get_cache_alignment(void)
> > +{
> > +	return dma_cache_alignment;
> > +}
> > +#endif
> > +
> > +#endif	/* __ASSEMBLY__ */
> > +
> >  #endif /* _ASM_RISCV_CACHE_H */
> > diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> > index 8091b8bf4883..c640ab6f843b 100644
> > --- a/arch/riscv/include/asm/cacheflush.h
> > +++ b/arch/riscv/include/asm/cacheflush.h
> > @@ -55,8 +55,10 @@ void riscv_init_cbo_blocksizes(void);
> >  
> >  #ifdef CONFIG_RISCV_DMA_NONCOHERENT
> >  void riscv_noncoherent_supported(void);
> > +void __init riscv_set_dma_cache_alignment(void);
> >  #else
> >  static inline void riscv_noncoherent_supported(void) {}
> > +static inline void riscv_set_dma_cache_alignment(void) {}
> >  #endif
> >  
> >  /*
> > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > index 971fe776e2f8..027879b1557a 100644
> > --- a/arch/riscv/kernel/setup.c
> > +++ b/arch/riscv/kernel/setup.c
> > @@ -311,6 +311,7 @@ void __init setup_arch(char **cmdline_p)
> >  	if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM) &&
> >  	    riscv_isa_extension_available(NULL, ZICBOM))
> >  		riscv_noncoherent_supported();
> > +	riscv_set_dma_cache_alignment();
> >  }
> >  
> >  static int __init topology_init(void)
> > diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> > index d51a75864e53..811227e54bbd 100644
> > --- a/arch/riscv/mm/dma-noncoherent.c
> > +++ b/arch/riscv/mm/dma-noncoherent.c
> > @@ -11,6 +11,8 @@
> >  #include <asm/cacheflush.h>
> >  
> >  static bool noncoherent_supported __ro_after_init;
> > +int dma_cache_alignment __ro_after_init = ARCH_DMA_MINALIGN;
> > +EXPORT_SYMBOL(dma_cache_alignment);
> 
> Why is this not EXPORT_SYMBOL_GPL()?
> 
> Otherwise, this is generally good to me, thanks.
> 
> Conor.
> 
> >  
> >  void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> >  			      enum dma_data_direction dir)
> > @@ -78,3 +80,9 @@ void riscv_noncoherent_supported(void)
> >  	     "Non-coherent DMA support enabled without a block size\n");
> >  	noncoherent_supported = true;
> >  }
> > +
> > +void __init riscv_set_dma_cache_alignment(void)
> > +{
> > +	if (!noncoherent_supported)
> > +		dma_cache_alignment = 1;
> > +}
> > -- 
> > 2.40.1
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
