Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887DBC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Feb 2022 10:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:Subject:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WkB1ZRtn0dhZiYe3SoVQ4Fljv8jvoeYKKKo1lVVrhMk=; b=yF7cDtiiKTIX1V4deq8QouCpVC
	w2KfxOftRZ/0yyENRqkXd75zPKLIn4lhOrkPslDKpiR6RTWxKJPv8Y6t10zs4Ew/73h+qxT5MwzCQ
	C7opZZy8ZG+di8IrJElvYV1VGRb8QU2wc/l/cwFuKvz0t6jZ8CaD/W6ZKFRo5BlxXpnoyvHrBe/eZ
	7BCi4cArNFrLpZuDzjmuSRwFRY4vpPjMii6e7WB9LmWTiGLJQ4eZrsrc+6GyAL5L+lM6Ho//EcZKV
	DmR/QowzspQYKqgdNa7OP/b5Z+KO/4iD/m3iffFYBFn2WonaO9VxEr63hh9XjbtxK5kEn+LjaVqep
	lZGM8Omw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNBS9-000Myw-4D; Thu, 24 Feb 2022 10:34:29 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNBRn-000Mq1-NK; Thu, 24 Feb 2022 10:34:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8EB31476;
 Thu, 24 Feb 2022 02:34:06 -0800 (PST)
Received: from [10.163.48.178] (unknown [10.163.48.178])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6169E3F70D;
 Thu, 24 Feb 2022 02:34:00 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 03/11] swiotlb: simplify swiotlb_max_segment
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org
Cc: x86@kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hyperv@vger.kernel.org, tboot-devel@lists.sourceforge.net,
 linux-pci@vger.kernel.org
References: <20220222153514.593231-1-hch@lst.de>
 <20220222153514.593231-4-hch@lst.de>
Message-ID: <9ef33986-eba0-01ee-28b6-1104e60c313d@arm.com>
Date: Thu, 24 Feb 2022 16:04:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220222153514.593231-4-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_023407_898851_4123625F 
X-CRM114-Status: GOOD (  23.52  )
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



On 2/22/22 9:05 PM, Christoph Hellwig wrote:
> Remove the bogus Xen override that was usually larger than the actual
> size and just calculate the value on demand.  Note that
> swiotlb_max_segment still doesn't make sense as an interface and should
> eventually be removed.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/xen/swiotlb-xen.c |  2 --
>  include/linux/swiotlb.h   |  1 -
>  kernel/dma/swiotlb.c      | 20 +++-----------------
>  3 files changed, 3 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index 47aebd98f52f5..485cd06ed39e7 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -202,7 +202,6 @@ int xen_swiotlb_init(void)
>  	rc = swiotlb_late_init_with_tbl(start, nslabs);
>  	if (rc)
>  		return rc;
> -	swiotlb_set_max_segment(PAGE_SIZE);
>  	return 0;
>  error:
>  	if (nslabs > 1024 && repeat--) {
> @@ -254,7 +253,6 @@ void __init xen_swiotlb_init_early(void)
>  
>  	if (swiotlb_init_with_tbl(start, nslabs, true))
>  		panic("Cannot allocate SWIOTLB buffer");
> -	swiotlb_set_max_segment(PAGE_SIZE);
>  }
>  #endif /* CONFIG_X86 */
>  
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index f6c3638255d54..9fb3a568f0c51 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -164,7 +164,6 @@ static inline void swiotlb_adjust_size(unsigned long size)
>  #endif /* CONFIG_SWIOTLB */
>  
>  extern void swiotlb_print_info(void);
> -extern void swiotlb_set_max_segment(unsigned int);
>  
>  #ifdef CONFIG_DMA_RESTRICTED_POOL
>  struct page *swiotlb_alloc(struct device *dev, size_t size);
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 36fbf1181d285..519e363097190 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -75,12 +75,6 @@ struct io_tlb_mem io_tlb_default_mem;
>  
>  phys_addr_t swiotlb_unencrypted_base;
>  
> -/*
> - * Max segment that we can provide which (if pages are contingous) will
> - * not be bounced (unless SWIOTLB_FORCE is set).
> - */
> -static unsigned int max_segment;
> -
>  static unsigned long default_nslabs = IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
>  
>  static int __init
> @@ -104,18 +98,12 @@ early_param("swiotlb", setup_io_tlb_npages);
>  
>  unsigned int swiotlb_max_segment(void)
>  {
> -	return io_tlb_default_mem.nslabs ? max_segment : 0;
> +	if (!io_tlb_default_mem.nslabs)
> +		return 0;
> +	return rounddown(io_tlb_default_mem.nslabs << IO_TLB_SHIFT, PAGE_SIZE);
>  }
>  EXPORT_SYMBOL_GPL(swiotlb_max_segment);
>  
> -void swiotlb_set_max_segment(unsigned int val)
> -{
> -	if (swiotlb_force == SWIOTLB_FORCE)
> -		max_segment = 1;
> -	else
> -		max_segment = rounddown(val, PAGE_SIZE);
> -}
> -
>  unsigned long swiotlb_size_or_default(void)
>  {
>  	return default_nslabs << IO_TLB_SHIFT;
> @@ -267,7 +255,6 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
>  
>  	if (verbose)
>  		swiotlb_print_info();
> -	swiotlb_set_max_segment(mem->nslabs << IO_TLB_SHIFT);
>  	return 0;
>  }
>  
> @@ -368,7 +355,6 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
>  	swiotlb_init_io_tlb_mem(mem, virt_to_phys(tlb), nslabs, true);
>  
>  	swiotlb_print_info();
> -	swiotlb_set_max_segment(mem->nslabs << IO_TLB_SHIFT);
>  	return 0;
>  }
>  

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
