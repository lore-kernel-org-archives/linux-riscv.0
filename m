Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7CEC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 14:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d5yA235+i4oGKoozp4Mm2LCiN2nsUdVPFVWPUusvmmU=; b=Qweu+3jFlwJfDN
	El0MYaWvJNQYN4sYKu5H/AcEvyI68vImp+brgY//zuAI/FSGw9UWC/Sgbn1iYIgwOKWiV69esjStJ
	7vPdwX4KD7dfu0aF3xBnSzsSY0l0FVbAzOwTA6/B5aJA/Nvl2dpkjS4j1rN2wXmW3WiXcwI4FgEjL
	1Bu3ylR5IEt6EeMuKCoM00oQltpmw/m33scp5tdLTRqow+H5WOJOXDktRxIqrmu14RnkjVVEJDpug
	4S22Umram/ZQuRMwJVa3lf1IzmmKsn/SuKs/rPxIuUW/Q893cXdZUZRUdsYRgcHaIybqCMQzJ3ON0
	GiVGb3GI4nMyPasZaSxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiz6F-00C8Jf-G4; Thu, 13 Oct 2022 14:22:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiz6B-00C8I1-On; Thu, 13 Oct 2022 14:22:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1665670931; x=1697206931;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EXww/5jhYmqnWS0/STyr6L45WNPJbGQkdN5TY1R0mPs=;
  b=oVVB/gkWdxVElU52osgnUikIMHBtP8m0wPrS7GBI3DKjij6X46lkHDEX
   FBZnwuAurWHa3BqxyecUQgvhHMUowWIXBajehpD7rJHaZJzY5q5sgpmHM
   tgdlvcFEOz484NcipVh/sLwtSMB9M2DiipG3R7ut2ECqtAQlV4riBDSbI
   bTl4P9wb/ROAPn3sBEznGgpclaZQEMWuX8y5AxPD6C2lWJE3iYG7ctY7O
   I8l9fz4lwD4Qt9+KbwujqFSUsIVGUTIJZClfSMS3PPLTXMPyE4bnaY+nh
   mDI+X3vePCS1UMoI7/xGg9oDDf1F6BcFsB6TzSyPfLA73l8YeVbJbYS1h
   A==;
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; 
   d="scan'208";a="118405713"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Oct 2022 07:21:31 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 13 Oct 2022 07:21:29 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 13 Oct 2022 07:21:28 -0700
Date: Thu, 13 Oct 2022 15:21:06 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <anup@brainfault.org>, <atishp@atishpatra.org>,
	<vernon2gm@gmail.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Fix compilation without RISCV_ISA_ZICBOM
Message-ID: <Y0ge0mbur3HAJFdJ@wendy>
References: <20221013134217.1850349-1-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221013134217.1850349-1-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_072211_919709_EF3F108C 
X-CRM114-Status: GOOD (  29.12  )
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

On Thu, Oct 13, 2022 at 03:42:17PM +0200, Andrew Jones wrote:

> RISC-V: KVM: Fix compilation without RISCV_ISA_ZICBOM

nit: I know that this is what it fixes, but I think the commit subject
is a little misleading when it doesnt touch arch/riscv/kvm & has some
meaning for non-kvm too.

> riscv_cbom_block_size and riscv_init_cbom_blocksize() should always
> be available and riscv_init_cbom_blocksize() should always be invoked

Yup, I like where this is going...

> even when compiling without RISCV_ISA_ZICBOM enabled. This
> is because disabling RISCV_ISA_ZICBOM means "don't use zicbom
> instructions in the kernel" not "pretend there isn't zicbom, even
> when there is". When zicbom is available, whether the kernel enables
> its use with RISCV_ISA_ZICBOM or not, KVM will offer it to guests.

...right, I'll take your word for this part. You're the kvm people :)

> Ensure we can build KVM and that the block size is initialized even
> when compiling without RISCV_ISA_ZICBOM.
> 
> Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Is cacheflush.c the "right" place for it? idk. But shaving that yak is a
waste of time imo. I like the unconditional availability & if ZICBOM is
off in the kernel I figure it should not matter that we set the
blocksize.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  arch/riscv/include/asm/cacheflush.h |  8 ------
>  arch/riscv/mm/cacheflush.c          | 38 ++++++++++++++++++++++++++
>  arch/riscv/mm/dma-noncoherent.c     | 41 -----------------------------
>  3 files changed, 38 insertions(+), 49 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> index 273ece6b622f..1470e556cdb1 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -42,16 +42,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
>  
>  #endif /* CONFIG_SMP */
>  
> -/*
> - * The T-Head CMO errata internally probe the CBOM block size, but otherwise
> - * don't depend on Zicbom.
> - */
>  extern unsigned int riscv_cbom_block_size;
> -#ifdef CONFIG_RISCV_ISA_ZICBOM
>  void riscv_init_cbom_blocksize(void);
> -#else
> -static inline void riscv_init_cbom_blocksize(void) { }
> -#endif
>  
>  #ifdef CONFIG_RISCV_DMA_NONCOHERENT
>  void riscv_noncoherent_supported(void);
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index 6cb7d96ad9c7..8525f4a2d598 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -3,6 +3,7 @@
>   * Copyright (C) 2017 SiFive
>   */
>  
> +#include <linux/of.h>
>  #include <asm/cacheflush.h>
>  
>  #ifdef CONFIG_SMP
> @@ -86,3 +87,40 @@ void flush_icache_pte(pte_t pte)
>  		flush_icache_all();
>  }
>  #endif /* CONFIG_MMU */
> +
> +unsigned int riscv_cbom_block_size;
> +EXPORT_SYMBOL(riscv_cbom_block_size);
> +
> +void riscv_init_cbom_blocksize(void)
> +{
> +	struct device_node *node;
> +	unsigned long cbom_hartid;
> +	u32 val, probed_block_size;
> +	int ret;
> +
> +	probed_block_size = 0;
> +	for_each_of_cpu_node(node) {
> +		unsigned long hartid;
> +
> +		ret = riscv_of_processor_hartid(node, &hartid);
> +		if (ret)
> +			continue;
> +
> +		/* set block-size for cbom extension if available */
> +		ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
> +		if (ret)
> +			continue;
> +
> +		if (!probed_block_size) {
> +			probed_block_size = val;
> +			cbom_hartid = hartid;
> +		} else {
> +			if (probed_block_size != val)
> +				pr_warn("cbom-block-size mismatched between harts %lu and %lu\n",
> +					cbom_hartid, hartid);
> +		}
> +	}
> +
> +	if (probed_block_size)
> +		riscv_cbom_block_size = probed_block_size;
> +}
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> index b0add983530a..d919efab6eba 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -8,13 +8,8 @@
>  #include <linux/dma-direct.h>
>  #include <linux/dma-map-ops.h>
>  #include <linux/mm.h>
> -#include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <asm/cacheflush.h>
>  
> -unsigned int riscv_cbom_block_size;
> -EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
> -
>  static bool noncoherent_supported;
>  
>  void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> @@ -77,42 +72,6 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
>  	dev->dma_coherent = coherent;
>  }
>  
> -#ifdef CONFIG_RISCV_ISA_ZICBOM
> -void riscv_init_cbom_blocksize(void)
> -{
> -	struct device_node *node;
> -	unsigned long cbom_hartid;
> -	u32 val, probed_block_size;
> -	int ret;
> -
> -	probed_block_size = 0;
> -	for_each_of_cpu_node(node) {
> -		unsigned long hartid;
> -
> -		ret = riscv_of_processor_hartid(node, &hartid);
> -		if (ret)
> -			continue;
> -
> -		/* set block-size for cbom extension if available */
> -		ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
> -		if (ret)
> -			continue;
> -
> -		if (!probed_block_size) {
> -			probed_block_size = val;
> -			cbom_hartid = hartid;
> -		} else {
> -			if (probed_block_size != val)
> -				pr_warn("cbom-block-size mismatched between harts %lu and %lu\n",
> -					cbom_hartid, hartid);
> -		}
> -	}
> -
> -	if (probed_block_size)
> -		riscv_cbom_block_size = probed_block_size;
> -}
> -#endif
> -
>  void riscv_noncoherent_supported(void)
>  {
>  	WARN(!riscv_cbom_block_size,
> -- 
> 2.37.3
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
