Return-Path: <SRS0=fdZL=ES=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF80AC2D0A3
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 08:55:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 294032100A
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 08:55:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OKyou/MR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 294032100A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7P6ng5CEQbMfoeQg1kiRE1rqv9/UkGGIKHVw0gjX5K8=; b=OKyou/MRmXswGvArGyBMUXeFQ
	H/GXG+bfg8mihnR3+/T/sZXs6niAxl71vw/8h4bv+yaYwCBlEoOY1Ui7qo7ysj0H6cBdYQzTWfXzP
	zT4yCirMZO3bngDlt1Owm//SWDuWmTi4CoF9VndN6x9dWEbBeRoBd5EFpqhtMDKkdfqMZ+mDc82KK
	QxGuzJY+Nu/QEQ32u2md+k5XriOWUKeaj79Yww+CvczGeXc/titSfcXDrBEADo1BS8l9oZq2T9UT6
	4y5qWfvvSz6aKfcPcOTDQRPaJnpkPPJ2o71ydELzZJLfEiewl/aSlGLamcTn5evR7arKbA4kThr2a
	9Vd8tRiDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kd8OM-0000T4-7A; Thu, 12 Nov 2020 08:55:42 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kd8OI-0000SC-UN
 for linux-riscv@lists.infradead.org; Thu, 12 Nov 2020 08:55:40 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CWwRG10cgz753R;
 Thu, 12 Nov 2020 16:55:22 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Thu, 12 Nov 2020 16:55:30 +0800
Subject: Re: [PATCH] riscv: Enable CMA support
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>
References: <20201031060112.151854-1-wangkefeng.wang@huawei.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <dfaee222-59a6-7a47-f174-046ff2c13e95@huawei.com>
Date: Thu, 12 Nov 2020 16:55:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20201031060112.151854-1-wangkefeng.wang@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_035539_287269_8BF19FBE 
X-CRM114-Status: GOOD (  14.56  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Any comments, kindly ping...

On 2020/10/31 14:01, Kefeng Wang wrote:
> riscv has selected HAVE_DMA_CONTIGUOUS, but don't call
> dma_contiguous_reserve(). let's enable CMA as expect.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>   arch/riscv/mm/init.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index ea933b789a88..87ae4b99442a 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -13,6 +13,7 @@
>   #include <linux/of_fdt.h>
>   #include <linux/libfdt.h>
>   #include <linux/set_memory.h>
> +#include <linux/dma-map-ops.h>
>   
>   #include <asm/fixmap.h>
>   #include <asm/tlbflush.h>
> @@ -41,13 +42,14 @@ struct pt_alloc_ops {
>   #endif
>   };
>   
> +static phys_addr_t dma32_phys_limit __ro_after_init;
> +
>   static void __init zone_sizes_init(void)
>   {
>   	unsigned long max_zone_pfns[MAX_NR_ZONES] = { 0, };
>   
>   #ifdef CONFIG_ZONE_DMA32
> -	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(min(4UL * SZ_1G,
> -			(unsigned long) PFN_PHYS(max_low_pfn)));
> +	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(dma32_phys_limit);
>   #endif
>   	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
>   
> @@ -185,6 +187,7 @@ void __init setup_bootmem(void)
>   
>   	max_pfn = PFN_DOWN(memblock_end_of_DRAM());
>   	max_low_pfn = max_pfn;
> +	dma32_phys_limit = min(4UL * SZ_1G, (unsigned long)PFN_PHYS(max_low_pfn));
>   	set_max_mapnr(max_low_pfn);
>   
>   #ifdef CONFIG_BLK_DEV_INITRD
> @@ -198,6 +201,7 @@ void __init setup_bootmem(void)
>   	memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
>   
>   	early_init_fdt_scan_reserved_mem();
> +	dma_contiguous_reserve(dma32_phys_limit);
>   	memblock_allow_resize();
>   	memblock_dump_all();
>   }

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
