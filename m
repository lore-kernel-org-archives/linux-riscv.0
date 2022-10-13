Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9012CC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 14:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nvgQ2ZLKq1fT86e9q5CPRGBFhkwERRs8kaOmfSYleBA=; b=XCJ40I3M8oLbLH
	UJxOpSYJnsQ1nc1Cyvi01a2cDGKYdjegp95t9L6PlxpYxvLl8mtljQYrgrlUA0sK9PQhqJ+8R8+wZ
	L0wjbviFjpR97Q2x2F23Bo+BhC8+Nl6B5vIFLTgFYVdPsEZ2U3fsAiiV4Ak/gbCIntVgijXZQK6ne
	rLgXJqsapycaU8UtWJL6WkOELhUpP31ua5pK0FByccxyViBfShpcORSBKjaN19wAiGUXBiYoP2U0I
	TDnGVDLO6zplcJzyh/6xg++/OlsyEZXpZgGhVFyQk3SUgpXl8S/HZSgBQduW/95lGPLdzJsUXyTC7
	3lC6xIUC1Hotrbkr8uDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oizN6-00CAoo-QK; Thu, 13 Oct 2022 14:39:40 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oizN3-00CAmE-Dw
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 14:39:39 +0000
Received: by mail-ej1-x632.google.com with SMTP id a26so4410073ejc.4
        for <linux-riscv@lists.infradead.org>; Thu, 13 Oct 2022 07:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S6n277l8dG1uK67vcI7lfFXB8kEYVx8Xpu2Zdehrtgg=;
        b=RYFR66azHri7d1JUdkKjy5dCK270Ode1DPJg+CWTpv3rlW9KjCKQp1cQY953sr6y5E
         tivfee6jEjmgqi2w8B4cBWHzRJZ5iyDo7TJFv6hbHAUaGld7b2bAteubtX+BTI68SA1w
         qpLG9PWZZVSxji/tO7PSuRSjQ415cD6sKLPFusPtVKeLTjuYRbx7Ap+cdU53aP/vbbmN
         N3HgYV4gQRgxAcGZOIQdqQ/csKiBGLJQRtSYx01eyLHiBiGFjQIzDBTGFq63jozPixWG
         h1mFFEJs0+5hbPywpsHxUsoLkN1U3AP0WRASfWwBDtFPUB8SgByynzvweAC836K9o2bw
         qiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S6n277l8dG1uK67vcI7lfFXB8kEYVx8Xpu2Zdehrtgg=;
        b=lUt3wHojkT3fo/f2ShAwYjdBHs2dFIH7BqI6Dq7QdRy1ZO4015cSbonUZek9CUmAWF
         8RYBjT3Wv4Or/8bBQ2enzvSr4zCxNbWVNhjDvTAalDh5bLgxL8I4gJfGmbCyNyq016At
         p3eFG9xQSzS6DCfHZMnt68a0dwSruziCm9Ho/gOnk0XlbwLTc1Yu4hqJEzUCEbIfn2iQ
         DTZsRqGvV0XMjy/ix9ZNb9fpbSA1xC3jn5co0lDbG5dJMX8CGPwBjDyobi+jlY3dh1Y/
         8e2N6aYS929JnIvkdD9HrZjWU0JjJXFUC2H8nqMRvWZqvlkq9XV91z3QO3GMVApAeePK
         znGQ==
X-Gm-Message-State: ACrzQf1aTCu1C9YU3ZD1WpyT/+xS3qU2wWpBML0jO+sfqcC68hTfHe2H
	M/AbD++z3HLJa8ERbQLIWz6J8g==
X-Google-Smtp-Source: AMsMyM6NzB+LgVcnGIVWzdmzOu74YqvcX5/7n9f6KgqCkXXclzdcrCs8PtYVzLHGyEbnXW5eVptPjw==
X-Received: by 2002:a17:907:2d89:b0:78d:9c30:452b with SMTP id gt9-20020a1709072d8900b0078d9c30452bmr41287ejc.533.1665671972944;
        Thu, 13 Oct 2022 07:39:32 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id f12-20020a17090631cc00b007836d075152sm3105748ejf.187.2022.10.13.07.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 07:39:32 -0700 (PDT)
Date: Thu, 13 Oct 2022 16:39:31 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
	vernon2gm@gmail.com, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Fix compilation without RISCV_ISA_ZICBOM
Message-ID: <20221013143931.vc662dbaboozjygy@kamzik>
References: <20221013134217.1850349-1-ajones@ventanamicro.com>
 <Y0ge0mbur3HAJFdJ@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y0ge0mbur3HAJFdJ@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_073937_479171_5D186DDC 
X-CRM114-Status: GOOD (  36.96  )
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

On Thu, Oct 13, 2022 at 03:21:06PM +0100, Conor Dooley wrote:
> On Thu, Oct 13, 2022 at 03:42:17PM +0200, Andrew Jones wrote:
> 
> > RISC-V: KVM: Fix compilation without RISCV_ISA_ZICBOM
> 
> nit: I know that this is what it fixes, but I think the commit subject
> is a little misleading when it doesnt touch arch/riscv/kvm & has some
> meaning for non-kvm too.

Yeah, in hindsight I probably should have just dropped the "RISC-V: KVM:
Fix compilation without RISCV_ISA_ZICBOM" patch and rebased and resent
Anup's move patch. I still can, if that's what people would prefer.

Thanks,
drew


> 
> > riscv_cbom_block_size and riscv_init_cbom_blocksize() should always
> > be available and riscv_init_cbom_blocksize() should always be invoked
> 
> Yup, I like where this is going...
> 
> > even when compiling without RISCV_ISA_ZICBOM enabled. This
> > is because disabling RISCV_ISA_ZICBOM means "don't use zicbom
> > instructions in the kernel" not "pretend there isn't zicbom, even
> > when there is". When zicbom is available, whether the kernel enables
> > its use with RISCV_ISA_ZICBOM or not, KVM will offer it to guests.
> 
> ...right, I'll take your word for this part. You're the kvm people :)
> 
> > Ensure we can build KVM and that the block size is initialized even
> > when compiling without RISCV_ISA_ZICBOM.
> > 
> > Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> 
> Is cacheflush.c the "right" place for it? idk. But shaving that yak is a
> waste of time imo. I like the unconditional availability & if ZICBOM is
> off in the kernel I figure it should not matter that we set the
> blocksize.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> > ---
> >  arch/riscv/include/asm/cacheflush.h |  8 ------
> >  arch/riscv/mm/cacheflush.c          | 38 ++++++++++++++++++++++++++
> >  arch/riscv/mm/dma-noncoherent.c     | 41 -----------------------------
> >  3 files changed, 38 insertions(+), 49 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> > index 273ece6b622f..1470e556cdb1 100644
> > --- a/arch/riscv/include/asm/cacheflush.h
> > +++ b/arch/riscv/include/asm/cacheflush.h
> > @@ -42,16 +42,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
> >  
> >  #endif /* CONFIG_SMP */
> >  
> > -/*
> > - * The T-Head CMO errata internally probe the CBOM block size, but otherwise
> > - * don't depend on Zicbom.
> > - */
> >  extern unsigned int riscv_cbom_block_size;
> > -#ifdef CONFIG_RISCV_ISA_ZICBOM
> >  void riscv_init_cbom_blocksize(void);
> > -#else
> > -static inline void riscv_init_cbom_blocksize(void) { }
> > -#endif
> >  
> >  #ifdef CONFIG_RISCV_DMA_NONCOHERENT
> >  void riscv_noncoherent_supported(void);
> > diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> > index 6cb7d96ad9c7..8525f4a2d598 100644
> > --- a/arch/riscv/mm/cacheflush.c
> > +++ b/arch/riscv/mm/cacheflush.c
> > @@ -3,6 +3,7 @@
> >   * Copyright (C) 2017 SiFive
> >   */
> >  
> > +#include <linux/of.h>
> >  #include <asm/cacheflush.h>
> >  
> >  #ifdef CONFIG_SMP
> > @@ -86,3 +87,40 @@ void flush_icache_pte(pte_t pte)
> >  		flush_icache_all();
> >  }
> >  #endif /* CONFIG_MMU */
> > +
> > +unsigned int riscv_cbom_block_size;
> > +EXPORT_SYMBOL(riscv_cbom_block_size);
> > +
> > +void riscv_init_cbom_blocksize(void)
> > +{
> > +	struct device_node *node;
> > +	unsigned long cbom_hartid;
> > +	u32 val, probed_block_size;
> > +	int ret;
> > +
> > +	probed_block_size = 0;
> > +	for_each_of_cpu_node(node) {
> > +		unsigned long hartid;
> > +
> > +		ret = riscv_of_processor_hartid(node, &hartid);
> > +		if (ret)
> > +			continue;
> > +
> > +		/* set block-size for cbom extension if available */
> > +		ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
> > +		if (ret)
> > +			continue;
> > +
> > +		if (!probed_block_size) {
> > +			probed_block_size = val;
> > +			cbom_hartid = hartid;
> > +		} else {
> > +			if (probed_block_size != val)
> > +				pr_warn("cbom-block-size mismatched between harts %lu and %lu\n",
> > +					cbom_hartid, hartid);
> > +		}
> > +	}
> > +
> > +	if (probed_block_size)
> > +		riscv_cbom_block_size = probed_block_size;
> > +}
> > diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> > index b0add983530a..d919efab6eba 100644
> > --- a/arch/riscv/mm/dma-noncoherent.c
> > +++ b/arch/riscv/mm/dma-noncoherent.c
> > @@ -8,13 +8,8 @@
> >  #include <linux/dma-direct.h>
> >  #include <linux/dma-map-ops.h>
> >  #include <linux/mm.h>
> > -#include <linux/of.h>
> > -#include <linux/of_device.h>
> >  #include <asm/cacheflush.h>
> >  
> > -unsigned int riscv_cbom_block_size;
> > -EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
> > -
> >  static bool noncoherent_supported;
> >  
> >  void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> > @@ -77,42 +72,6 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
> >  	dev->dma_coherent = coherent;
> >  }
> >  
> > -#ifdef CONFIG_RISCV_ISA_ZICBOM
> > -void riscv_init_cbom_blocksize(void)
> > -{
> > -	struct device_node *node;
> > -	unsigned long cbom_hartid;
> > -	u32 val, probed_block_size;
> > -	int ret;
> > -
> > -	probed_block_size = 0;
> > -	for_each_of_cpu_node(node) {
> > -		unsigned long hartid;
> > -
> > -		ret = riscv_of_processor_hartid(node, &hartid);
> > -		if (ret)
> > -			continue;
> > -
> > -		/* set block-size for cbom extension if available */
> > -		ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
> > -		if (ret)
> > -			continue;
> > -
> > -		if (!probed_block_size) {
> > -			probed_block_size = val;
> > -			cbom_hartid = hartid;
> > -		} else {
> > -			if (probed_block_size != val)
> > -				pr_warn("cbom-block-size mismatched between harts %lu and %lu\n",
> > -					cbom_hartid, hartid);
> > -		}
> > -	}
> > -
> > -	if (probed_block_size)
> > -		riscv_cbom_block_size = probed_block_size;
> > -}
> > -#endif
> > -
> >  void riscv_noncoherent_supported(void)
> >  {
> >  	WARN(!riscv_cbom_block_size,
> > -- 
> > 2.37.3
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
