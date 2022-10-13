Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4435AC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 13:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GgX6vLe6wPQtYH5+QtwpDTWycrhYUxzXPeNeMxogbIw=; b=fKDh1UdYlDTxcB
	1xIj0ESmDLSEn6VQCSFGoSxGRwj+pkyd6SQuCWTWRTSislBbZJ1sUWw7pKvAc+CUttnJT+UBApBGK
	ZVbJBeLqT3fbBZDdWVS5kOrS7iOTcQCKpaNLrgxp9LLAfChFY73OHkBlzMXsuEUTwgrSvax+miGeG
	/YAeKqxrkRt+uBktS3NfVEtYfSSammytDbZ4HsMUQ2PRWmOCRC/DmXS2Hh6KEJ+Q2at2SYXTxDwrC
	Vqz76bEmAwYiNaXyVd9ILiW9J6uaqHDr2MlA24CBLnwu58jPXwxfbqPev/6YuIckR1Nm4j+QVQn80
	e4iQas2kbGwF1/5QwyAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiyg7-00C2KU-KS; Thu, 13 Oct 2022 13:55:15 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiyZH-00Bz7f-Lv
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 13:48:15 +0000
Received: by mail-ej1-x633.google.com with SMTP id 13so4068336ejn.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Oct 2022 06:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DUCcGIXmErJveULdDXREgya3/YQWQ/vRh29rZT1BtP4=;
        b=CWbieysZTt8IDm7cN5rrss4aemIlgRXG8FVb4Uxkaprs0xMgEG3allaZLGMryOsJoE
         ag2FLWrBoA4vO9UY+534HLsjoij+F/hbSnFwmuMT0h2/T0I8lB0tqw1e3CKTLhALeaD5
         zeSGrB3F5oYXF7cUTOYBMQwFAsyOW7T+9f4VXF6RVV9IiXpLLVMfkYKc30+KqIqJRUfB
         0SKNRooOCh88fkzRZPynLL6VDKzD16ISoerpd3NyhON/c5qJ8UDAxUbCLL+GS7DGa0ZZ
         q+8SmR3ZFtpH4/QKtf+GBLtvgwKTi4qifVzPYCIt4aSqIuhK43dNoFhJDCpiijH9IxSW
         6rng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUCcGIXmErJveULdDXREgya3/YQWQ/vRh29rZT1BtP4=;
        b=SJuuUEOz+2NR9vEL4195DDhqgvZ8Sp8jIKieUBba9vBEKM2sdsNNmTDGpv+O7kzqgy
         GAIdklje2IfUutgCueVPCxuqFNjZoSMjNsNxM1v2iX+0lP3JudN6pNVfnlqL+UdEQ4zj
         pIE9NyX4jPWfhDE+TvzfCU2KP1tN4cpRwoHRmdsdsOQBHWn4OOZTIZXfpSNK4cVryczn
         eGApvDItE6/DvOzo5cY74uyAMMHDOq+4BBIZOZqbAl3UCP5tF41Lo4DX1iPNyjhAcMon
         7jfyWArEP+UfooJay6FuPGwFscw8+ZApj3LDj73jLR/jd8arWrun0Df5sBPrXinUrJ+p
         65dg==
X-Gm-Message-State: ACrzQf1T4iHBj4j5dkGeKWE6DAhEVfoXUWx8vFQRClueXkhssUG/5MG7
	rABUBfAXwa/1P0HI9Hl1e+Ma8g==
X-Google-Smtp-Source: AMsMyM7N0zdKAzfeND48XojwM2SFVaJ3vcb6wBVmgri+Dt4+6xGPUaQBZlpWOSOZ8Z6MKXkvrz+xhw==
X-Received: by 2002:a17:907:968b:b0:78d:f5c2:70d8 with SMTP id hd11-20020a170907968b00b0078df5c270d8mr5756957ejc.564.1665668888832;
        Thu, 13 Oct 2022 06:48:08 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id f5-20020a170906390500b0073d9630cbafsm3023176eje.126.2022.10.13.06.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 06:48:08 -0700 (PDT)
Date: Thu, 13 Oct 2022 15:48:07 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
	conor.dooley@microchip.com, vernon2gm@gmail.com,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Fix compilation without RISCV_ISA_ZICBOM
Message-ID: <20221013134807.wi53dyogw36jqdgr@kamzik>
References: <20221013134217.1850349-1-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221013134217.1850349-1-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_064811_779166_304C41DF 
X-CRM114-Status: GOOD (  27.29  )
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
> riscv_cbom_block_size and riscv_init_cbom_blocksize() should always
> be available and riscv_init_cbom_blocksize() should always be
> invoked, even when compiling without RISCV_ISA_ZICBOM enabled. This
> is because disabling RISCV_ISA_ZICBOM means "don't use zicbom
> instructions in the kernel" not "pretend there isn't zicbom, even
> when there is". When zicbom is available, whether the kernel enables
> its use with RISCV_ISA_ZICBOM or not, KVM will offer it to guests.
> Ensure we can build KVM and that the block size is initialized even
> when compiling without RISCV_ISA_ZICBOM.
> 
> Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---

Grr... Second time I forgot my changelog on a patch this week...

v2:
 - Instead of #ifdefing the use of riscv_cbom_block_size in KVM always
   expose it by moving it to cacheflush.c and change Fixes commit. [Palmer]
 - Move riscv_init_cbom_blocksize() to cacheflush.c and always expose
   it since KVM can offer zicbom to guests even if the host kernel
   chooses not to use it (RISCV_ISA_ZICBOM=n) [drew]
 - Rewrote commit message

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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
