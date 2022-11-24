Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3114C43219
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 18:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ym8AhMarl5D80CGsPZvM75gMH78S8YKLsFSEIMbnyE=; b=mV2W5CJUUQwG14
	SB/9M42Ppd7ViTmES8UOThE2jYk5v2EfvtTC1PUd78HicQ0j6cdo5jYrTgqtQ2xoIoW4ezrOdr1OD
	5Wpl6etZfOnuQtkXeW/lzChiLnqMCIxMENzfftaGQCTyUvAy3RNvIzT/Gao91nsTsJVffZoNpIP6J
	l+VmcIZCDj8O3yhaasiSX6CZUTlAwckRR3cluc64rH18elPXdHQlDzQiW8VbhVyDBsBq23PO4aoWt
	J9MWdGK2bPNejutI8VuFTqekRlYkAOluDnRWC6vVNiESsnXlo6tWZNzDNj8wIAhnCqUKor9rpuNgq
	m1h7sqYn8VBbz0r9ccjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyGyu-00Auen-6T; Thu, 24 Nov 2022 18:29:52 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyGyr-00Auce-SZ
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 18:29:51 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oyGye-0007Ir-Oo; Thu, 24 Nov 2022 19:29:36 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Prabhakar <prabhakar.csengg@gmail.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, Nathan Chancellor <nathan@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 5/7] riscv: mm: dma-noncoherent: Pass direction and operation to ALT_CMO_OP()
Date: Thu, 24 Nov 2022 19:29:35 +0100
Message-ID: <3689906.Lt9SDvczpP@diego>
In-Reply-To: <20221124172207.153718-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221124172207.153718-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_102949_958730_30036F64 
X-CRM114-Status: GOOD (  18.11  )
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

Am Donnerstag, 24. November 2022, 18:22:05 CET schrieb Prabhakar:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Pass direction and operation to ALT_CMO_OP() macro.
> 
> This is in preparation for adding errata for the Andes CPU core.

can you provide more explanation why that is necessary please?
I guess you want to use different cache operations for some cases?


Thanks
Heiko

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> RFC v3 -> v4
> * New patch
> ---
>  arch/riscv/include/asm/cacheflush.h  |  4 ++++
>  arch/riscv/include/asm/errata_list.h |  8 ++++++--
>  arch/riscv/mm/dma-noncoherent.c      | 15 ++++++++++-----
>  3 files changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> index f6fbe7042f1c..4a04d1be7c67 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -8,6 +8,10 @@
>  
>  #include <linux/mm.h>
>  
> +#define NON_COHERENT_SYNC_DMA_FOR_DEVICE	0
> +#define NON_COHERENT_SYNC_DMA_FOR_CPU		1
> +#define NON_COHERENT_DMA_PREP			2
> +
>  static inline void local_flush_icache_all(void)
>  {
>  	asm volatile ("fence.i" ::: "memory");
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index 2ba7e6e74540..48e899a8e7a9 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -124,7 +124,7 @@ asm volatile(ALTERNATIVE(						\
>  #define THEAD_flush_A0	".long 0x0275000b"
>  #define THEAD_SYNC_S	".long 0x0190000b"
>  
> -#define ALT_CMO_OP(_op, _start, _size, _cachesize)			\
> +#define ALT_CMO_OP(_op, _start, _size, _cachesize, _dir, _ops)		\
>  asm volatile(ALTERNATIVE_2(						\
>  	__nops(6),							\
>  	"mv a0, %1\n\t"							\
> @@ -146,7 +146,11 @@ asm volatile(ALTERNATIVE_2(						\
>  			ERRATA_THEAD_CMO, CONFIG_ERRATA_THEAD_CMO)	\
>  	: : "r"(_cachesize),						\
>  	    "r"((unsigned long)(_start) & ~((_cachesize) - 1UL)),	\
> -	    "r"((unsigned long)(_start) + (_size))			\
> +	    "r"((unsigned long)(_start) + (_size)),			\
> +	    "r"((unsigned long)(_start)),				\
> +	    "r"((unsigned long)(_size)),				\
> +	    "r"((unsigned long)(_dir)),					\
> +	    "r"((unsigned long)(_ops))					\
>  	: "a0")
>  
>  #define THEAD_C9XX_RV_IRQ_PMU			17
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> index d919efab6eba..e2b82034f504 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -19,13 +19,16 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
>  
>  	switch (dir) {
>  	case DMA_TO_DEVICE:
> -		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
> +		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size,
> +			   dir, NON_COHERENT_SYNC_DMA_FOR_DEVICE);
>  		break;
>  	case DMA_FROM_DEVICE:
> -		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
> +		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size,
> +			   dir, NON_COHERENT_SYNC_DMA_FOR_DEVICE);
>  		break;
>  	case DMA_BIDIRECTIONAL:
> -		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size,
> +			   dir, NON_COHERENT_SYNC_DMA_FOR_DEVICE);
>  		break;
>  	default:
>  		break;
> @@ -42,7 +45,8 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
>  		break;
>  	case DMA_FROM_DEVICE:
>  	case DMA_BIDIRECTIONAL:
> -		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size,
> +			   dir, NON_COHERENT_SYNC_DMA_FOR_CPU);
>  		break;
>  	default:
>  		break;
> @@ -53,7 +57,8 @@ void arch_dma_prep_coherent(struct page *page, size_t size)
>  {
>  	void *flush_addr = page_address(page);
>  
> -	ALT_CMO_OP(flush, flush_addr, size, riscv_cbom_block_size);
> +	ALT_CMO_OP(flush, flush_addr, size, riscv_cbom_block_size,
> +		   0, NON_COHERENT_DMA_PREP);
>  }
>  
>  void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
