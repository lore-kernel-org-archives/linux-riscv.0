Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D827CC3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 09:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h7m4Ckk1AVQ8bMw5IPBX9eqR8V0wFDTlgfjEW8/YfCA=; b=gyoL3OIMXer/7+
	+wnSKO9hoJ9Itomp0hEZtO7qynPL0a0b4WA1XBVv4sCDysqL3lRnFYgUWgZ3NG/e/MiMI7ICAe4V/
	i79a6scEnDnLtNskx0EVzPMBiJecJNyr6L0Zqw0IGfrqa3d8DClHmogOYYtCiKYxZneZ3askoksAm
	cB+EOT4jed5h+A/C4nUrjAOZGyBSmVLUzogxZnZCRdi6Mw/Y5Mi5F03BCZX9c5NKU161OPs36IJbg
	xOwrpQnkYt9e1Nv1g/UADNbi1YJrmXGocb/GVtCcEreYAHJRFkE3MMPDkgsfLuPIHrVilQtrtSf3R
	H5U8blmdHbB57BYKnyHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPJdW-008TnP-16;
	Mon, 15 Jan 2024 09:52:06 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPJdT-008Tmq-2b
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 09:52:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1DF94B80AB3;
	Mon, 15 Jan 2024 09:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA35C433C7;
	Mon, 15 Jan 2024 09:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705312321;
	bh=tq1LvtkAdS6HI+mHnlrvFlhiN8d0NA5zwM1YvZL8ZFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bgPQwTTe4RTIKeCVwYiJ3gZtH8k9IwZRLxoNXGyudIrDIPo/LLsrsqso1hKgHCCPq
	 3ycEzmBPIvjcFlId4OAnU/8rcFHZ8S5la9ja47trpHFwGG/xEECGvolMGVTokBMSf5
	 gauD6KYIiLtyPZhyLHM5P5l7Hi4VbI7/S7KgBk0DlqoUta773ywklm58ApKD0fuuYa
	 lj40KwuWtvA/NU3fSrmGMT2M3bXGuvhIRwJ0bQ7Il9eji6KbPt5vffEy0gRvnDU5mj
	 3jEjwqHl4/JuraOkUNVKyGJujHdmySkyx62VhL+oxI1huP7sIGyu/NRCbwpHCIndrY
	 SEWKxai0V+XHA==
Date: Mon, 15 Jan 2024 17:39:10 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: mm: still create swiotlb buffer for kmalloc()
 bouncing if required
Message-ID: <ZaT9Pi06h70LWVA+@xhacker>
References: <20231202134224.4029-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231202134224.4029-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_015204_172867_1918C970 
X-CRM114-Status: GOOD (  24.59  )
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

On Sat, Dec 02, 2023 at 09:42:24PM +0800, Jisheng Zhang wrote:
> After commit f51f7a0fc2f4 ("riscv: enable DMA_BOUNCE_UNALIGNED_KMALLOC
> for !dma_coherent"), for non-coherent platforms with less than 4GB
> memory, we rely on users to pass "swiotlb=mmnn,force" kernel parameters
> to enable DMA bouncing for unaligned kmalloc() buffers. Now let's go
> further: If no bouncing needed for ZONE_DMA, let kernel automatically
> allocate 1MB swiotlb buffer per 1GB of RAM for kmalloc() bouncing on
> non-coherent platforms, so that no need to pass "swiotlb=mmnn,force"
> any more.
> 
> The math of "1MB swiotlb buffer per 1GB of RAM for kmalloc() bouncing"
> is taken from arm64. Users can still force smaller swiotlb buffer by
> passing "swiotlb=mmnn".

and this one is missed either. let me know if there's something need to
be done for merging.

Thanks in advance,

> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
> 
> since v2:
>  - fix build error if CONFIG_RISCV_DMA_NONCOHERENT=n
> 
>  arch/riscv/include/asm/cache.h |  2 +-
>  arch/riscv/mm/init.c           | 16 +++++++++++++++-
>  2 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/cache.h b/arch/riscv/include/asm/cache.h
> index 2174fe7bac9a..570e9d8acad1 100644
> --- a/arch/riscv/include/asm/cache.h
> +++ b/arch/riscv/include/asm/cache.h
> @@ -26,8 +26,8 @@
>  
>  #ifndef __ASSEMBLY__
>  
> -#ifdef CONFIG_RISCV_DMA_NONCOHERENT
>  extern int dma_cache_alignment;
> +#ifdef CONFIG_RISCV_DMA_NONCOHERENT
>  #define dma_get_cache_alignment dma_get_cache_alignment
>  static inline int dma_get_cache_alignment(void)
>  {
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 2e011cbddf3a..cbcb9918f721 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -162,11 +162,25 @@ static void print_vm_layout(void) { }
>  
>  void __init mem_init(void)
>  {
> +	bool swiotlb = max_pfn > PFN_DOWN(dma32_phys_limit);
>  #ifdef CONFIG_FLATMEM
>  	BUG_ON(!mem_map);
>  #endif /* CONFIG_FLATMEM */
>  
> -	swiotlb_init(max_pfn > PFN_DOWN(dma32_phys_limit), SWIOTLB_VERBOSE);
> +	if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) && !swiotlb &&
> +	    dma_cache_alignment != 1) {
> +		/*
> +		 * If no bouncing needed for ZONE_DMA, allocate 1MB swiotlb
> +		 * buffer per 1GB of RAM for kmalloc() bouncing on
> +		 * non-coherent platforms.
> +		 */
> +		unsigned long size =
> +			DIV_ROUND_UP(memblock_phys_mem_size(), 1024);
> +		swiotlb_adjust_size(min(swiotlb_size_or_default(), size));
> +		swiotlb = true;
> +	}
> +
> +	swiotlb_init(swiotlb, SWIOTLB_VERBOSE);
>  	memblock_free_all();
>  
>  	print_vm_layout();
> -- 
> 2.42.0
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
