Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C033CDB482
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 12:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UjZZji04omAtaRDJA5QDIBET0unswGt8t5VLi5/RbY8=; b=01rK4f+nTIu4Q3
	BiUdRXmGML1EmJu8MehHHMIHUJEJcN2eJ0zn/NfIXgCKY5Yi1SXZc968yqdew1YevLxAg3fhXNF0t
	tlCjyoaEI/oVMG6TUxUGydROUe0MeEsTZ3j1ts/mbr9Mvx4Fx1Q9+3TA2YSsqyO1kNYba/4sjvOWG
	QiCl2/o2CnOQ4Nkb81+pJJLwxOaIxxQt5Bw2bfDVe3RbKFMrbHLWzNa8TbAsaI/mGeErRYFvpQ4vc
	P+380rTKQWlbJDFqmxJ6yUBN7r1Wvy75hKc0fj1X3ne9LE1a6Xp0eI0QtFhjYq/5KSMHJwuC6X1Vq
	aPX/BrvOUww/TjT8Qs4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSUQ-00HN7a-2Q;
	Thu, 19 Oct 2023 12:51:02 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSUO-00HN6e-0J
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 12:51:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EFCECCE2C53;
	Thu, 19 Oct 2023 12:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A383C433C8;
	Thu, 19 Oct 2023 12:50:53 +0000 (UTC)
Message-ID: <572668b5-48b5-4bac-8712-75a5e2c096bd@linux-m68k.org>
Date: Thu, 19 Oct 2023 22:50:50 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] m68k: use the coherent DMA code for coldfire
 without data cache
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Wei Fang <wei.fang@nxp.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-m68k@lists.linux-m68k.org,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, Jim Quinlan <james.quinlan@broadcom.com>
References: <20231016054755.915155-1-hch@lst.de>
 <20231016054755.915155-10-hch@lst.de>
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20231016054755.915155-10-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_055100_472682_8BAF8AF5 
X-CRM114-Status: GOOD (  20.12  )
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

Hi Christoph,

On 16/10/23 15:47, Christoph Hellwig wrote:
> Coldfire cores configured without a data cache are DMA coherent and
> should thus simply use the simple coherent version of dma-direct.
> 
> Introduce a new COLDFIRE_COHERENT_DMA Kconfig symbol as a convenient
> short hand for such configurations, and a M68K_NONCOHERENT_DMA symbol
> for all cases where we need to build non-coherent DMA infrastructure
> to simplify the Kconfig and code conditionals.
> 
> Not building the non-coherent DMA code slightly reduces the code
> size for such configurations.
> 
> Numers for m5249evb_defconfig below:
> 
>    text	   data	    bss	    dec	    hex	filename
> 2896158	 401052	  65392	3362602	 334f2a	vmlinux.before
> 2895166	 400988	  65392	3361546	 334b0a	vmlinux.after
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   arch/m68k/Kconfig         |  8 ++++----
>   arch/m68k/Kconfig.cpu     | 12 ++++++++++++
>   arch/m68k/kernel/Makefile |  2 +-
>   arch/m68k/kernel/dma.c    |  2 +-
>   4 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index 0430b8ba6b5cc6..6c585eae89f4dc 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -3,19 +3,19 @@ config M68K
>   	bool
>   	default y
>   	select ARCH_32BIT_OFF_T
> -	select ARCH_DMA_ALLOC if !MMU || COLDFIRE
> +	select ARCH_DMA_ALLOC if M68K_NONCOHERENT_DMA && COLDFIRE
>   	select ARCH_HAS_BINFMT_FLAT
>   	select ARCH_HAS_CPU_FINALIZE_INIT if MMU
>   	select ARCH_HAS_CURRENT_STACK_POINTER
> -	select ARCH_HAS_DMA_PREP_COHERENT if HAS_DMA && MMU && !COLDFIRE
> -	select ARCH_HAS_SYNC_DMA_FOR_DEVICE if HAS_DMA
> +	select ARCH_HAS_DMA_PREP_COHERENT if M68K_NONCOHERENT_DMA && !COLDFIRE
> +	select ARCH_HAS_SYNC_DMA_FOR_DEVICE if M68K_NONCOHERENT_DMA
>   	select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
>   	select ARCH_MIGHT_HAVE_PC_PARPORT if ISA
>   	select ARCH_NO_PREEMPT if !COLDFIRE
>   	select ARCH_USE_MEMTEST if MMU_MOTOROLA
>   	select ARCH_WANT_IPC_PARSE_VERSION
>   	select BINFMT_FLAT_ARGVP_ENVP_ON_STACK
> -	select DMA_DIRECT_REMAP if HAS_DMA && MMU && !COLDFIRE
> +	select DMA_DIRECT_REMAP if M68K_NONCOHERENT_DMA && !COLDFIRE
>   	select GENERIC_ATOMIC64
>   	select GENERIC_CPU_DEVICES
>   	select GENERIC_IOMAP
> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> index b826e9c677b2ae..e8905d38c714c4 100644
> --- a/arch/m68k/Kconfig.cpu
> +++ b/arch/m68k/Kconfig.cpu
> @@ -535,3 +535,15 @@ config CACHE_COPYBACK
>   	  The ColdFire CPU cache is set into Copy-back mode.
>   endchoice
>   endif # HAVE_CACHE_CB
> +
> +# Coldfire cores that do not have a data cache configured can do coherent DMA.
> +config COLDFIRE_COHERENT_DMA
> +	bool
> +	default y
> +	depends on COLDFIRE
> +	depends on !HAVE_CACHE_CB && !CONFIG_CACHE_D && !CONFIG_CACHE_BOTH
                                       ^^^^^^             ^^^^^^

This needs to be "depends on !HAVE_CACHE_CB && !CACHE_D && !CACHE_BOTH".

Regards
Greg


> +
> +config M68K_NONCOHERENT_DMA
> +	bool
> +	default y
> +	depends on HAS_DMA && !COLDFIRE_COHERENT_DMA
> diff --git a/arch/m68k/kernel/Makefile b/arch/m68k/kernel/Makefile
> index af015447dfb4c1..01fb69a5095f43 100644
> --- a/arch/m68k/kernel/Makefile
> +++ b/arch/m68k/kernel/Makefile
> @@ -23,7 +23,7 @@ obj-$(CONFIG_MMU_MOTOROLA) += ints.o vectors.o
>   obj-$(CONFIG_MMU_SUN3) += ints.o vectors.o
>   obj-$(CONFIG_PCI) += pcibios.o
>   
> -obj-$(CONFIG_HAS_DMA)	+= dma.o
> +obj-$(CONFIG_M68K_NONCOHERENT_DMA) += dma.o
>   
>   obj-$(CONFIG_KEXEC)		+= machine_kexec.o relocate_kernel.o
>   obj-$(CONFIG_BOOTINFO_PROC)	+= bootinfo_proc.o
> diff --git a/arch/m68k/kernel/dma.c b/arch/m68k/kernel/dma.c
> index 2e192a5df949bb..f83870cfa79b37 100644
> --- a/arch/m68k/kernel/dma.c
> +++ b/arch/m68k/kernel/dma.c
> @@ -17,7 +17,7 @@
>   
>   #include <asm/cacheflush.h>
>   
> -#if defined(CONFIG_MMU) && !defined(CONFIG_COLDFIRE)
> +#ifndef CONFIG_COLDFIRE
>   void arch_dma_prep_coherent(struct page *page, size_t size)
>   {
>   	cache_push(page_to_phys(page), size);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
