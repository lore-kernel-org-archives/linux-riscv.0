Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB3DC9EC83
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 12:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xKYPB4gDY/8yNHsDzLim1BO8iv5FYhLUU1aVLrgCHZw=; b=TRLiw71+eVP18W
	UPQvXXSOqvl1O1CGgojnbp4XQtgXEBqBDG4SljvJIeKqb1m54Qcs9iB9FqT+vRajm4v29CJ5xNiCz
	kMqLmwLQcek6VUp+WTUL9mXHTnuVTHkRArnPh9FTM5zqh/9VUE60PBqObLwChJLzldLP45tGHN3pT
	RaMTMoUCECmkgeK+T01LGN6psJHo27VbFYmujKI0VwIlD0l/PvSmvowpMptB6bRcqTK+AkAmFj/2y
	drhsQMobpBM3uDoz+PnyuSuLFB5+pdxD3J+lasEfwT4U19IiTutXw2zKb62lOaZI4nR1e2rc+65HP
	OehwO++W1jPY/d/49K9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHHF-00000005L2a-0sgW;
	Mon, 12 Jan 2026 12:44:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHHC-00000005L1h-3Snn
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 12:44:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0F33497;
	Mon, 12 Jan 2026 04:43:56 -0800 (PST)
Received: from [10.57.48.115] (unknown [10.57.48.115])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B3C243F59E;
	Mon, 12 Jan 2026 04:44:00 -0800 (PST)
Message-ID: <03daf175-fcab-45a4-812b-9a338415565e@arm.com>
Date: Mon, 12 Jan 2026 12:43:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dma-pool: don't allocate DMA32 pool if no 32-bit
 memory
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, lkp@intel.com,
 mick@ics.forth.gr, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 akpm@linux-foundation.org, alex@ghiti.fr, aou@eecs.berkeley.edu,
 hch@infradead.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com
References: <202601120747.TAMpIDnI-lkp@intel.com>
 <20260112065857.3137331-1-vladimir.kondratiev@mobileye.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260112065857.3137331-1-vladimir.kondratiev@mobileye.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_044406_905953_85DD4D2A 
X-CRM114-Status: GOOD (  15.29  )
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

On 2026-01-12 6:58 am, Vladimir Kondratiev wrote:
> If system have no 32-bit memory, GFP_DMA32 pool allocation will
> obviously fail, so skip it.

Note that the rest of the code doesn't quite work right if 
CONFIG_ZONE_DMA32 is enabled but atomic_pool_dma32 is NULL - seems such 
a setup wasn't really anticipated. Funnily enough, I also recently wrote 
a patch series to improve this more generally, but hadn't got round to 
writing a cover letter yet - lemme finish that up and post it...

Thanks,
Robin.

> Changes in v2: use arch-independent "memblock_start_of_DRAM" to get
> DRAM base address
> 
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> ---
>   kernel/dma/pool.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
> index ee45dee33d49..ecd77a0272f2 100644
> --- a/kernel/dma/pool.c
> +++ b/kernel/dma/pool.c
> @@ -209,7 +209,7 @@ static int __init dma_atomic_pool_init(void)
>   		if (!atomic_pool_dma)
>   			ret = -ENOMEM;
>   	}
> -	if (IS_ENABLED(CONFIG_ZONE_DMA32)) {
> +	if (IS_ENABLED(CONFIG_ZONE_DMA32) && memblock_start_of_DRAM() < BIT_ULL(32)) {
>   		atomic_pool_dma32 = __dma_atomic_pool_init(atomic_pool_size,
>   						GFP_KERNEL | GFP_DMA32);
>   		if (!atomic_pool_dma32)
> 
> base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
