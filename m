Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CC3C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Oct 2022 12:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R6vbgV9EhE9b9LtEwYIfwvqT7+LC3bV8xuMYSnEZjHc=; b=SMgtxOlS9hFCkZ
	sQPPMYc+lMl555cZUPD1C1YM2hLYtHPR9msnKzY1Fjqv43nuMytyoG88CBiX8GloTrcJsY1lG6L5g
	zA2Yyh/AUKjKFVq7YzTY8Rg3Uvnsw8qcL2E8cJ+twRQgtLeRAaz2kP8yaV2qIWR6e3sgwYpf2cmsg
	2QyYQ+l1iKWM5GIgzpAZNR6APvhQG/EPs9DF+Bbz05GQA9yJAFyJHPk8K7kVTT0vJ4LsYNYO0maju
	dykrOktKN5qA79d5UiaYoiZByhlxAkRVAYti5rDF5FKidKVo7gAay568BhgtXkSc4eysBcSXdi3Wi
	76HQ3j11Zi+JE6D+6RVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol8Du-001VjE-3x; Wed, 19 Oct 2022 12:31:02 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol8Dq-001VfS-Hk
	for linux-riscv@lists.infradead.org; Wed, 19 Oct 2022 12:31:00 +0000
Received: from p508fdae2.dip0.t-ipconnect.de ([80.143.218.226] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ol8Dj-0005cC-Eg; Wed, 19 Oct 2022 14:30:51 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, kernel test robot <lkp@intel.com>, Anup Patel <apatel@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/4] RISC-V: Fix compilation without RISCV_ISA_ZICBOM
Date: Wed, 19 Oct 2022 14:30:50 +0200
Message-ID: <5869751.lOV4Wx5bFT@phil>
In-Reply-To: <20221019121622.179024-2-apatel@ventanamicro.com>
References: <20221019121622.179024-1-apatel@ventanamicro.com> <20221019121622.179024-2-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_053058_639063_8B71DF3A 
X-CRM114-Status: GOOD (  25.13  )
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

Hi Anup,

Am Mittwoch, 19. Oktober 2022, 14:16:19 CEST schrieb Anup Patel:
> From: Andrew Jones <ajones@ventanamicro.com>
> 
> riscv_cbom_block_size and riscv_init_cbom_blocksize() should always
> be available and riscv_init_cbom_blocksize() should always be
> invoked, even when compiling without RISCV_ISA_ZICBOM enabled. This
> is because disabling RISCV_ISA_ZICBOM means "don't use zicbom
> instructions in the kernel" not "pretend there isn't zicbom, even
> when there is". When zicbom is available, whether the kernel enables
> its use with RISCV_ISA_ZICBOM or not, KVM will offer it to guests.
> Ensure we can build KVM and that the block size is initialized even
> when compiling without RISCV_ISA_ZICBOM.

either I'm way very low on coffee or something is strange here :-) .

I can fully grasp the need to init the cbom blocksize for guests, even when
the main kernel isn't using it, but below in the patch itself it is still:

+#ifdef CONFIG_RISCV_ISA_ZICBOM
+void riscv_init_cbom_blocksize(void)
+{
[...]

so the init_cbom_blocksize function is still inside a RISCV_ISA_ZICBOM
ifdef?


Heiko


> 
> Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/mm/cacheflush.c      | 41 +++++++++++++++++++++++++++++++++
>  arch/riscv/mm/dma-noncoherent.c | 41 ---------------------------------
>  2 files changed, 41 insertions(+), 41 deletions(-)
> 
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index 6cb7d96ad9c7..f318b2553612 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -3,6 +3,8 @@
>   * Copyright (C) 2017 SiFive
>   */
>  
> +#include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <asm/cacheflush.h>
>  
>  #ifdef CONFIG_SMP
> @@ -86,3 +88,42 @@ void flush_icache_pte(pte_t pte)
>  		flush_icache_all();
>  }
>  #endif /* CONFIG_MMU */
> +
> +unsigned int riscv_cbom_block_size;
> +EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
> +
> +#ifdef CONFIG_RISCV_ISA_ZICBOM
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
> +#endif
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
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
