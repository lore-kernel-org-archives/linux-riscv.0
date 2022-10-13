Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC24C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 20:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=67hppTEODwF6gYAFeUH1zHSwqvD/adgIo6DMHokx92Q=; b=Ib/HBmUGXTAmRc
	9MN7PqiqAUfi1Kxrte5QcBWtBAR6BBhS/GL55YzeVPlUZ0hXYUUSikCWiAVHYXMu/qGikGIL4PHRe
	gqpfeEkfqb/Aq1KHRXNQF2ZZ15jQxKh3aFadJU0ywphNBJyP+OzR03WEVDPIZLJBoDmAmOoSEbEAk
	RRikCq5UqhESQtx/WiY9asqESgT3ASi3147ADVx54OrgWC6IAN65TtepuiNPNzRSJQCzCMzLOdwC9
	60BRHA2ZdJThLdoXN4wzGeaTvaADCE0N0NtbsGJdJstPtsEdntbXrC0Ef+R57ZDwMHN9/4RE14WIE
	oV9ng6l+2Eg3psHt2BJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj4Sg-00Ctdx-BF; Thu, 13 Oct 2022 20:05:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj4Sb-00Ctco-4L; Thu, 13 Oct 2022 20:05:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 68857B82023;
	Thu, 13 Oct 2022 20:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36FFEC433C1;
	Thu, 13 Oct 2022 20:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665691538;
	bh=WCGYTjAcBf9F06zjYkITF/gmUdVa1+87yndJoCjt/yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eg5MLzCIu53GIyAfdSp22tSeViCNgnazX87Ju7uTltAUKH2R45wWenptppeeOAeEV
	 0m0f2VjNo4x51/wSvs+aBRboWLo8d8smU2A46x703f7vE7DDaE2hSxtMzGplPZnGbf
	 D4mtWEF69gDsLOx5Cbt0bD3Z2Tqv4ma1PtKueIL+udo/wTzO5hTYzxbWrBIl9+q3W9
	 3E5ToNHfaDp9sXJdQKbNkXI3zCgTnfLCPyjk/dZiChvm2bzWSo5kB7pC7OVUpZmI1K
	 kEqq6DZpxnaUSSJxdNycxaKdo/t/JfKIQHHUBuojYMSC83zAwtBC7Sswu/z837BRVm
	 d/xf8MRzP6BkA==
Date: Thu, 13 Oct 2022 21:05:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
	vernon2gm@gmail.com, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Fix compilation without RISCV_ISA_ZICBOM
Message-ID: <Y0hvjdWlC7zOVJSa@spud>
References: <20221013134217.1850349-1-ajones@ventanamicro.com>
 <Y0ge0mbur3HAJFdJ@wendy>
 <20221013143931.vc662dbaboozjygy@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221013143931.vc662dbaboozjygy@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_130541_489763_1AF4A2D4 
X-CRM114-Status: GOOD (  40.65  )
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

On Thu, Oct 13, 2022 at 04:39:31PM +0200, Andrew Jones wrote:
> On Thu, Oct 13, 2022 at 03:21:06PM +0100, Conor Dooley wrote:
> > On Thu, Oct 13, 2022 at 03:42:17PM +0200, Andrew Jones wrote:
> > 
> > > RISC-V: KVM: Fix compilation without RISCV_ISA_ZICBOM
> > 
> > nit: I know that this is what it fixes, but I think the commit subject
> > is a little misleading when it doesnt touch arch/riscv/kvm & has some
> > meaning for non-kvm too.
> 
> Yeah, in hindsight I probably should have just dropped the "RISC-V: KVM:
> Fix compilation without RISCV_ISA_ZICBOM" patch and rebased and resent
> Anup's move patch. I still can, if that's what people would prefer.

I'd image that that can be done at application time? idk what I'd go for
though, I am sick so my heads a little groggy. Say along the lines of
"RISC-V: make cbom blocksize info unconditionally available"?
Feel free to hate that Drew...
Conor.

> 
> Thanks,
> drew
> 
> 
> > 
> > > riscv_cbom_block_size and riscv_init_cbom_blocksize() should always
> > > be available and riscv_init_cbom_blocksize() should always be invoked
> > 
> > Yup, I like where this is going...
> > 
> > > even when compiling without RISCV_ISA_ZICBOM enabled. This
> > > is because disabling RISCV_ISA_ZICBOM means "don't use zicbom
> > > instructions in the kernel" not "pretend there isn't zicbom, even
> > > when there is". When zicbom is available, whether the kernel enables
> > > its use with RISCV_ISA_ZICBOM or not, KVM will offer it to guests.
> > 
> > ...right, I'll take your word for this part. You're the kvm people :)
> > 
> > > Ensure we can build KVM and that the block size is initialized even
> > > when compiling without RISCV_ISA_ZICBOM.
> > > 
> > > Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing")
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > 
> > Is cacheflush.c the "right" place for it? idk. But shaving that yak is a
> > waste of time imo. I like the unconditional availability & if ZICBOM is
> > off in the kernel I figure it should not matter that we set the
> > blocksize.
> > 
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > 
> > > ---
> > >  arch/riscv/include/asm/cacheflush.h |  8 ------
> > >  arch/riscv/mm/cacheflush.c          | 38 ++++++++++++++++++++++++++
> > >  arch/riscv/mm/dma-noncoherent.c     | 41 -----------------------------
> > >  3 files changed, 38 insertions(+), 49 deletions(-)
> > > 
> > > diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> > > index 273ece6b622f..1470e556cdb1 100644
> > > --- a/arch/riscv/include/asm/cacheflush.h
> > > +++ b/arch/riscv/include/asm/cacheflush.h
> > > @@ -42,16 +42,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
> > >  
> > >  #endif /* CONFIG_SMP */
> > >  
> > > -/*
> > > - * The T-Head CMO errata internally probe the CBOM block size, but otherwise
> > > - * don't depend on Zicbom.
> > > - */
> > >  extern unsigned int riscv_cbom_block_size;
> > > -#ifdef CONFIG_RISCV_ISA_ZICBOM
> > >  void riscv_init_cbom_blocksize(void);
> > > -#else
> > > -static inline void riscv_init_cbom_blocksize(void) { }
> > > -#endif
> > >  
> > >  #ifdef CONFIG_RISCV_DMA_NONCOHERENT
> > >  void riscv_noncoherent_supported(void);
> > > diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> > > index 6cb7d96ad9c7..8525f4a2d598 100644
> > > --- a/arch/riscv/mm/cacheflush.c
> > > +++ b/arch/riscv/mm/cacheflush.c
> > > @@ -3,6 +3,7 @@
> > >   * Copyright (C) 2017 SiFive
> > >   */
> > >  
> > > +#include <linux/of.h>
> > >  #include <asm/cacheflush.h>
> > >  
> > >  #ifdef CONFIG_SMP
> > > @@ -86,3 +87,40 @@ void flush_icache_pte(pte_t pte)
> > >  		flush_icache_all();
> > >  }
> > >  #endif /* CONFIG_MMU */
> > > +
> > > +unsigned int riscv_cbom_block_size;
> > > +EXPORT_SYMBOL(riscv_cbom_block_size);
> > > +
> > > +void riscv_init_cbom_blocksize(void)
> > > +{
> > > +	struct device_node *node;
> > > +	unsigned long cbom_hartid;
> > > +	u32 val, probed_block_size;
> > > +	int ret;
> > > +
> > > +	probed_block_size = 0;
> > > +	for_each_of_cpu_node(node) {
> > > +		unsigned long hartid;
> > > +
> > > +		ret = riscv_of_processor_hartid(node, &hartid);
> > > +		if (ret)
> > > +			continue;
> > > +
> > > +		/* set block-size for cbom extension if available */
> > > +		ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
> > > +		if (ret)
> > > +			continue;
> > > +
> > > +		if (!probed_block_size) {
> > > +			probed_block_size = val;
> > > +			cbom_hartid = hartid;
> > > +		} else {
> > > +			if (probed_block_size != val)
> > > +				pr_warn("cbom-block-size mismatched between harts %lu and %lu\n",
> > > +					cbom_hartid, hartid);
> > > +		}
> > > +	}
> > > +
> > > +	if (probed_block_size)
> > > +		riscv_cbom_block_size = probed_block_size;
> > > +}
> > > diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> > > index b0add983530a..d919efab6eba 100644
> > > --- a/arch/riscv/mm/dma-noncoherent.c
> > > +++ b/arch/riscv/mm/dma-noncoherent.c
> > > @@ -8,13 +8,8 @@
> > >  #include <linux/dma-direct.h>
> > >  #include <linux/dma-map-ops.h>
> > >  #include <linux/mm.h>
> > > -#include <linux/of.h>
> > > -#include <linux/of_device.h>
> > >  #include <asm/cacheflush.h>
> > >  
> > > -unsigned int riscv_cbom_block_size;
> > > -EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
> > > -
> > >  static bool noncoherent_supported;
> > >  
> > >  void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> > > @@ -77,42 +72,6 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
> > >  	dev->dma_coherent = coherent;
> > >  }
> > >  
> > > -#ifdef CONFIG_RISCV_ISA_ZICBOM
> > > -void riscv_init_cbom_blocksize(void)
> > > -{
> > > -	struct device_node *node;
> > > -	unsigned long cbom_hartid;
> > > -	u32 val, probed_block_size;
> > > -	int ret;
> > > -
> > > -	probed_block_size = 0;
> > > -	for_each_of_cpu_node(node) {
> > > -		unsigned long hartid;
> > > -
> > > -		ret = riscv_of_processor_hartid(node, &hartid);
> > > -		if (ret)
> > > -			continue;
> > > -
> > > -		/* set block-size for cbom extension if available */
> > > -		ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
> > > -		if (ret)
> > > -			continue;
> > > -
> > > -		if (!probed_block_size) {
> > > -			probed_block_size = val;
> > > -			cbom_hartid = hartid;
> > > -		} else {
> > > -			if (probed_block_size != val)
> > > -				pr_warn("cbom-block-size mismatched between harts %lu and %lu\n",
> > > -					cbom_hartid, hartid);
> > > -		}
> > > -	}
> > > -
> > > -	if (probed_block_size)
> > > -		riscv_cbom_block_size = probed_block_size;
> > > -}
> > > -#endif
> > > -
> > >  void riscv_noncoherent_supported(void)
> > >  {
> > >  	WARN(!riscv_cbom_block_size,
> > > -- 
> > > 2.37.3
> > > 
> > > 
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
