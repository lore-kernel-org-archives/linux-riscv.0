Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA64ECAAD1
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Sep 2022 15:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ua647vtPGYiv9JnaeOih0s84yU2mjIbap1No0AxNadM=; b=lq6XQqaWT50Rd2
	YWfdd6DSjUqmdtAlltFDPoDC5X1c967TlLOq4wEULpOcPjSiawbPFaGhXSb1LCxn4hQfMi63dk5/u
	36CE2IKBnMb467pAtJJO3tfcbSXnTmK2gWPv1TRnlmOeskreWTCCemPcIF5gAIlJulxw96+YAiE+U
	Uzlgecvnvq7zkNPrO10/u/5c1e45RtjX6M7eWWDvrLVdDiQ1i4ysSoYDxgIcbf/7Jn7/jTwKG6S8w
	mIrsxJtlncHeAhFrCijmTzKl0dQm5EJ4zuJEZbkAS1xQsL4xG2/OLH18/aABgfiBmUujxWl61vwbg
	zSMrrq5ayZl7IDgyBMkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTm7u-00CsAo-6d; Thu, 01 Sep 2022 15:29:06 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTm7r-00Cs9b-FO
	for linux-riscv@lists.infradead.org; Thu, 01 Sep 2022 15:29:05 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oTm7o-0005k8-P8; Thu, 01 Sep 2022 17:29:00 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>, Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: Re: [PATCH v2 2/4] RISC-V: Move riscv_init_cbom_blocksize() to cacheflush.c
Date: Thu, 01 Sep 2022 17:29:00 +0200
Message-ID: <5909904.6fTUFtlzNn@diego>
In-Reply-To: <20220830044642.566769-3-apatel@ventanamicro.com>
References: <20220830044642.566769-1-apatel@ventanamicro.com> <20220830044642.566769-3-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_082903_547496_1C010501 
X-CRM114-Status: GOOD (  23.67  )
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

Hi,

Am Dienstag, 30. August 2022, 06:46:40 CEST schrieb Anup Patel:
> The riscv_cbom_block_size parsing from DT belongs to cacheflush.c which
> is home for all cache maintenance related stuff so let us move the
> riscv_init_cbom_blocksize() and riscv_cbom_block_size to cacheflush.c.
> 
> Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Makes a lot of sense to keep stuff together.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>


Also, can we handle this as fix patch?

I.e. Currently the t-head code somewhat relies on the default value
set to L1_CACHE_BYTES. The cache-block-size is static there.

Palmers upcoming patch reworking the parsing [0], will remove that default,
so having the riscv_cbom_block_size defined in the cacheflush header
will allow an easy fix by setting that value from the t-head errata init
for those cores.


Heiko

[0] https://lore.kernel.org/r/20220812154010.18280-1-palmer@rivosinc.com

> ---
>  arch/riscv/include/asm/cacheflush.h |  2 ++
>  arch/riscv/mm/cacheflush.c          | 39 +++++++++++++++++++++++++++++
>  arch/riscv/mm/dma-noncoherent.c     | 38 ----------------------------
>  3 files changed, 41 insertions(+), 38 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> index a60acaecfeda..de55d6b8deeb 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -42,6 +42,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
>  
>  #endif /* CONFIG_SMP */
>  
> +extern unsigned int riscv_cbom_block_size;
> +
>  #ifdef CONFIG_RISCV_ISA_ZICBOM
>  void riscv_init_cbom_blocksize(void);
>  #else
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index 6cb7d96ad9c7..336c5deea870 100644
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
> @@ -86,3 +88,40 @@ void flush_icache_pte(pte_t pte)
>  		flush_icache_all();
>  }
>  #endif /* CONFIG_MMU */
> +
> +unsigned int riscv_cbom_block_size = L1_CACHE_BYTES;
> +
> +#ifdef CONFIG_RISCV_ISA_ZICBOM
> +void riscv_init_cbom_blocksize(void)
> +{
> +	struct device_node *node;
> +	int ret;
> +	u32 val;
> +
> +	for_each_of_cpu_node(node) {
> +		unsigned long hartid;
> +		int cbom_hartid;
> +
> +		ret = riscv_of_processor_hartid(node, &hartid);
> +		if (ret)
> +			continue;
> +
> +		if (hartid < 0)
> +			continue;
> +
> +		/* set block-size for cbom extension if available */
> +		ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
> +		if (ret)
> +			continue;
> +
> +		if (!riscv_cbom_block_size) {
> +			riscv_cbom_block_size = val;
> +			cbom_hartid = hartid;
> +		} else {
> +			if (riscv_cbom_block_size != val)
> +				pr_warn("cbom-block-size mismatched between harts %d and %lu\n",
> +					cbom_hartid, hartid);
> +		}
> +	}
> +}
> +#endif
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> index cd2225304c82..3f502a1a68b1 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -8,11 +8,8 @@
>  #include <linux/dma-direct.h>
>  #include <linux/dma-map-ops.h>
>  #include <linux/mm.h>
> -#include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <asm/cacheflush.h>
>  
> -static unsigned int riscv_cbom_block_size = L1_CACHE_BYTES;
>  static bool noncoherent_supported;
>  
>  void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> @@ -75,41 +72,6 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
>  	dev->dma_coherent = coherent;
>  }
>  
> -#ifdef CONFIG_RISCV_ISA_ZICBOM
> -void riscv_init_cbom_blocksize(void)
> -{
> -	struct device_node *node;
> -	int ret;
> -	u32 val;
> -
> -	for_each_of_cpu_node(node) {
> -		unsigned long hartid;
> -		int cbom_hartid;
> -
> -		ret = riscv_of_processor_hartid(node, &hartid);
> -		if (ret)
> -			continue;
> -
> -		if (hartid < 0)
> -			continue;
> -
> -		/* set block-size for cbom extension if available */
> -		ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
> -		if (ret)
> -			continue;
> -
> -		if (!riscv_cbom_block_size) {
> -			riscv_cbom_block_size = val;
> -			cbom_hartid = hartid;
> -		} else {
> -			if (riscv_cbom_block_size != val)
> -				pr_warn("cbom-block-size mismatched between harts %d and %lu\n",
> -					cbom_hartid, hartid);
> -		}
> -	}
> -}
> -#endif
> -
>  void riscv_noncoherent_supported(void)
>  {
>  	noncoherent_supported = true;
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
