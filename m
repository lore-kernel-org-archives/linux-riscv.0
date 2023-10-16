Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3747ACDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 11:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uA2CluBuPJdxH59vOb/llmkd/NAGvbHBaSWmiFpTtpA=; b=ExCsZwPXQ6nilS
	sumz6b2SN4vBuk13UYvb3y4e1Kx0JQefJX885wTxq99lEMookZJ2ccGDlpU8FteGF1JVQANEpVZnZ
	AuSjyAXt6qus9DNBGM+vaiBm+UaSFbOhTLFY3mMN7WXF1xCptFiXs+/X7Ev+ptDGg/bmUbXrk0RcQ
	zL81mlTjJnZm2crsIue8WvZOtUckCl2wVf8D75WRUsFrzrJLFkoTq9PruKCmMR25pGbntVrJL+t6+
	I9QSnFd3cXc6mH6ZMXKQjbURHQiFYUGyquRu3wkfrUFtOAJUErhYm9sDaWtGvpSxYg0/BoneWSXqn
	sNHp7Pfk3V4jQ5XEyJ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsLr0-009Uem-1M;
	Mon, 16 Oct 2023 11:33:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsLqw-009UeJ-3A
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 11:33:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A18911FB;
	Mon, 16 Oct 2023 04:34:20 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6EA663F5A1;
	Mon, 16 Oct 2023 04:33:37 -0700 (PDT)
Message-ID: <bf6f7c39-9d8f-4a2d-bdd1-3e2a7de4b857@arm.com>
Date: Mon, 16 Oct 2023 12:33:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] dma-direct: add a CONFIG_ARCH_DMA_ALLOC symbol
Content-Language: en-GB
To: Christoph Hellwig <hch@lst.de>, Greg Ungerer <gerg@linux-m68k.org>,
 iommu@lists.linux.dev
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Wei Fang <wei.fang@nxp.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-m68k@lists.linux-m68k.org,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, Jim Quinlan <james.quinlan@broadcom.com>
References: <20231016054755.915155-1-hch@lst.de>
 <20231016054755.915155-7-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20231016054755.915155-7-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_043343_115265_ECEE6D6D 
X-CRM114-Status: GOOD (  18.42  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 16/10/2023 6:47 am, Christoph Hellwig wrote:
> Instead of using arch_dma_alloc if none of the generic coherent
> allocators are used, require the architectures to explicitly opt into
> providing it.  This will used to deal with the case of m68knommu and
> coldfire where we can't do any coherent allocations whatsoever, and
> also makes it clear that arch_dma_alloc is a last resort.

With one miniscule nit that possibly ARCH_HAS_DMA_ALLOC might be a 
little more consistent with other symbol names in this area (but feel 
free to disagree),

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   arch/arm/Kconfig    |  1 +
>   arch/m68k/Kconfig   |  1 +
>   arch/parisc/Kconfig |  1 +
>   kernel/dma/Kconfig  |  9 +++++++++
>   kernel/dma/direct.c | 12 ++----------
>   5 files changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 9557808e8937b1..a3fdf584278f86 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -4,6 +4,7 @@ config ARM
>   	default y
>   	select ARCH_32BIT_OFF_T
>   	select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE if HAVE_KRETPROBES && FRAME_POINTER && !ARM_UNWIND
> +	select ARCH_DMA_ALLOC if MMU
>   	select ARCH_HAS_BINFMT_FLAT
>   	select ARCH_HAS_CPU_FINALIZE_INIT if MMU
>   	select ARCH_HAS_CURRENT_STACK_POINTER
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index 3e318bf9504c5b..0430b8ba6b5cc6 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -3,6 +3,7 @@ config M68K
>   	bool
>   	default y
>   	select ARCH_32BIT_OFF_T
> +	select ARCH_DMA_ALLOC if !MMU || COLDFIRE
>   	select ARCH_HAS_BINFMT_FLAT
>   	select ARCH_HAS_CPU_FINALIZE_INIT if MMU
>   	select ARCH_HAS_CURRENT_STACK_POINTER
> diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
> index a15ab147af2e07..30a4916fa9b0cc 100644
> --- a/arch/parisc/Kconfig
> +++ b/arch/parisc/Kconfig
> @@ -3,6 +3,7 @@ config PARISC
>   	def_bool y
>   	select ALTERNATE_USER_ADDRESS_SPACE
>   	select ARCH_32BIT_OFF_T if !64BIT
> +	select ARCH_DMA_ALLOC if PA11
>   	select ARCH_MIGHT_HAVE_PC_PARPORT
>   	select HAVE_FUNCTION_TRACER
>   	select HAVE_FUNCTION_GRAPH_TRACER
> diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
> index 4524db877eba36..515d2063b509ac 100644
> --- a/kernel/dma/Kconfig
> +++ b/kernel/dma/Kconfig
> @@ -144,6 +144,15 @@ config DMA_DIRECT_REMAP
>   	select DMA_COHERENT_POOL
>   	select DMA_NONCOHERENT_MMAP
>   
> +#
> +# Fallback to arch code for DMA allocations.  This should eventually go away.
> +#
> +config ARCH_DMA_ALLOC
> +	depends on !ARCH_HAS_DMA_SET_UNCACHED
> +	depends on !DMA_DIRECT_REMAP
> +	depends on !DMA_GLOBAL_POOL
> +	bool
> +
>   config DMA_CMA
>   	bool "DMA Contiguous Memory Allocator"
>   	depends on HAVE_DMA_CONTIGUOUS && CMA
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 9596ae1aa0dacf..ec410af1d8a14e 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -220,13 +220,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>   		return dma_direct_alloc_no_mapping(dev, size, dma_handle, gfp);
>   
>   	if (!dev_is_dma_coherent(dev)) {
> -		/*
> -		 * Fallback to the arch handler if it exists.  This should
> -		 * eventually go away.
> -		 */
> -		if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
> -		    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> -		    !IS_ENABLED(CONFIG_DMA_GLOBAL_POOL) &&
> +		if (IS_ENABLED(CONFIG_ARCH_DMA_ALLOC) &&
>   		    !is_swiotlb_for_alloc(dev))
>   			return arch_dma_alloc(dev, size, dma_handle, gfp,
>   					      attrs);
> @@ -330,9 +324,7 @@ void dma_direct_free(struct device *dev, size_t size,
>   		return;
>   	}
>   
> -	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
> -	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> -	    !IS_ENABLED(CONFIG_DMA_GLOBAL_POOL) &&
> +	if (IS_ENABLED(CONFIG_ARCH_DMA_ALLOC) &&
>   	    !dev_is_dma_coherent(dev) &&
>   	    !is_swiotlb_for_alloc(dev)) {
>   		arch_dma_free(dev, size, cpu_addr, dma_addr, attrs);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
