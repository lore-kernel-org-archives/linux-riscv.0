Return-Path: <SRS0=cAep=XA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA8A8C43331
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2019 17:19:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C749820828
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2019 17:19:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kEq+2oMi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C749820828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ylPYj0u58T40Hy7oT6gMEUMFvZu+ylX8bWgTjqWW5U=; b=kEq+2oMiQdfBRj
	4eMRdTbQ8YSGgLMTZ78PQzFKq75z//yTLmsOJKFCJ+EXvMygUz2zAQsRHo834jdS1hSjnY/cQswAZ
	49oDtH2KsXSHwgfivkaWauVZwlzaaxGeyWSYgWNL+sdp3xFrkw+JsTwG1shNZMCSpsD+EaLKs2HEW
	v1d13jdkmJGgC8cFzTYwYzbZB5FNsQcXXALvyWFE8c4ZJ+3/qDyFFLS28+Mb4QwcF492dRT28YH2H
	1Ncqf/QzN9CCPeGlt7JLZIl3G9G0fQYkjd5448d+3s7c22vjqllHN2kOZoLT3gjfL2/q5vcZYAUIb
	96qfjAyVm8xeTIttpt2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5vQI-0001XM-He; Thu, 05 Sep 2019 17:19:54 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1i5vQ8-0001OC-Kb; Thu, 05 Sep 2019 17:19:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52F09337;
 Thu,  5 Sep 2019 10:19:43 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 5215C3F718; Thu,  5 Sep 2019 10:19:41 -0700 (PDT)
Date: Thu, 5 Sep 2019 18:19:39 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH v3 3/4] arm64: use both ZONE_DMA and ZONE_DMA32
Message-ID: <20190905171939.GF31268@arrakis.emea.arm.com>
References: <20190902141043.27210-1-nsaenzjulienne@suse.de>
 <20190902141043.27210-4-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190902141043.27210-4-nsaenzjulienne@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_101944_764327_8509D27C 
X-CRM114-Status: GOOD (  16.89  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: f.fainelli@gmail.com, mbrugger@suse.com, marc.zyngier@arm.com,
 robin.murphy@arm.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 robh+dt@kernel.org, wahrenst@gmx.net, m.szyprowski@samsung.com,
 linux-riscv@lists.infradead.org, phill@raspberrypi.org,
 Will Deacon <will@kernel.org>, hch@lst.de,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Sep 02, 2019 at 04:10:41PM +0200, Nicolas Saenz Julienne wrote:
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 8956c22634dd..f02a4945aeac 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -50,6 +50,13 @@
>  s64 memstart_addr __ro_after_init = -1;
>  EXPORT_SYMBOL(memstart_addr);
>  
> +/*
> + * We create both ZONE_DMA and ZONE_DMA32. ZONE_DMA covers the first 1G of
> + * memory as some devices, namely the Raspberry Pi 4, have peripherals with
> + * this limited view of the memory. ZONE_DMA32 will cover the rest of the 32
> + * bit addressable memory area.
> + */
> +phys_addr_t arm64_dma_phys_limit __ro_after_init;
>  phys_addr_t arm64_dma32_phys_limit __ro_after_init;
>  
>  #ifdef CONFIG_KEXEC_CORE
> @@ -164,9 +171,9 @@ static void __init reserve_elfcorehdr(void)
>  }
>  #endif /* CONFIG_CRASH_DUMP */
>  /*
> - * Return the maximum physical address for ZONE_DMA32 (DMA_BIT_MASK(32)). It
> - * currently assumes that for memory starting above 4G, 32-bit devices will
> - * use a DMA offset.
> + * Return the maximum physical address for ZONE_DMA32 (DMA_BIT_MASK(32)) and
> + * ZONE_DMA (DMA_BIT_MASK(30)) respectively. It currently assumes that for
> + * memory starting above 4G, 32-bit devices will use a DMA offset.
>   */
>  static phys_addr_t __init max_zone_dma32_phys(void)
>  {
> @@ -174,12 +181,23 @@ static phys_addr_t __init max_zone_dma32_phys(void)
>  	return min(offset + (1ULL << 32), memblock_end_of_DRAM());
>  }
>  
> +static phys_addr_t __init max_zone_dma_phys(void)
> +{
> +	phys_addr_t offset = memblock_start_of_DRAM() & GENMASK_ULL(63, 32);
> +
> +	return min(offset + (1ULL << ARCH_ZONE_DMA_BITS),
> +		   memblock_end_of_DRAM());
> +}

I think we could squash these two functions into a single one with a
"bits" argument that is either 32 or ARCH_ZONE_DMA_BITS.

> +
>  #ifdef CONFIG_NUMA
>  
>  static void __init zone_sizes_init(unsigned long min, unsigned long max)
>  {
>  	unsigned long max_zone_pfns[MAX_NR_ZONES]  = {0};
>  
> +#ifdef CONFIG_ZONE_DMA
> +	max_zone_pfns[ZONE_DMA] = PFN_DOWN(arm64_dma_phys_limit);
> +#endif
>  #ifdef CONFIG_ZONE_DMA32
>  	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(arm64_dma32_phys_limit);
>  #endif
> @@ -195,13 +213,17 @@ static void __init zone_sizes_init(unsigned long min, unsigned long max)
>  	struct memblock_region *reg;
>  	unsigned long zone_size[MAX_NR_ZONES], zhole_size[MAX_NR_ZONES];
>  	unsigned long max_dma32 = min;
> +	unsigned long max_dma = min;
>  
>  	memset(zone_size, 0, sizeof(zone_size));
>  
> -	/* 4GB maximum for 32-bit only capable devices */
> +#ifdef CONFIG_ZONE_DMA
> +	max_dma = PFN_DOWN(arm64_dma_phys_limit);
> +	zone_size[ZONE_DMA] = max_dma - min;
> +#endif
>  #ifdef CONFIG_ZONE_DMA32
>  	max_dma32 = PFN_DOWN(arm64_dma32_phys_limit);
> -	zone_size[ZONE_DMA32] = max_dma32 - min;
> +	zone_size[ZONE_DMA32] = max_dma32 - max_dma;
>  #endif
>  	zone_size[ZONE_NORMAL] = max - max_dma32;

Does this still work if we have ZONE_DMA32 disabled but ZONE_DMA
enabled? You could use a max(max_dma32, max_dma) or just update
max_dma32 to max_dma in the CONFIG_ZONE_DMA block.

> @@ -213,11 +235,17 @@ static void __init zone_sizes_init(unsigned long min, unsigned long max)
>  
>  		if (start >= max)
>  			continue;
> -
> +#ifdef CONFIG_ZONE_DMA
> +		if (start < max_dma) {
> +			unsigned long dma_end = min_not_zero(end, max_dma);
> +			zhole_size[ZONE_DMA] -= dma_end - start;
> +		}
> +#endif
>  #ifdef CONFIG_ZONE_DMA32
>  		if (start < max_dma32) {
> -			unsigned long dma_end = min(end, max_dma32);
> -			zhole_size[ZONE_DMA32] -= dma_end - start;
> +			unsigned long dma32_end = min(end, max_dma32);
> +			unsigned long dma32_start = max(start, max_dma);
> +			zhole_size[ZONE_DMA32] -= dma32_end - dma32_start;
>  		}
>  #endif
>  		if (end > max_dma32) {

Similar comment here.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
