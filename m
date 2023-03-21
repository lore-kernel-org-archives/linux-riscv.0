Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEF9C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 16:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bxqTU052geU19SIBiYO0dTA1uvP8xSE++hi5HYwDhLc=; b=issjLJ/xNVCgOW
	42JBY2p8/2mqqWGuu6sn14QpImMJBbqw/lFTDyGmCAzEJahGLXZJrJ44miklfFeFImVs4QfmAe1Nc
	ECe+BnJ8YOZdDG/4mxLH3u/zY11qDMzK2CN+IoYvyWEbtK7cjBLJRN3WX2iVdbn4kJn5fr/UgzoQf
	ECcdUtJuVpCmz56BeHG5Xv2VgeCqUspBlqDyEyfouqAg2tnc2yrQSpsKiiFG/n5MGvLGq49wZvXJ0
	pm5mY4/O1KYqHN2gCuCY81rnGuV5bE7ZcrH+xeIiXWnMcGJm3hbSAywTohOlRqvKizoif4JMcHQP9
	uMgAGAAE0/Y1SbZQrP0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peeal-00D2Ub-25;
	Tue, 21 Mar 2023 16:12:07 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peeag-00D2S5-1M
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 16:12:06 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 36D8E1BF20C;
	Tue, 21 Mar 2023 16:11:50 +0000 (UTC)
Message-ID: <2408b5b7-821c-2461-a227-f364bce0f5e9@ghiti.fr>
Date: Tue, 21 Mar 2023 17:11:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] riscv: mm: execute local TLB flush after populating
 vmemmap
Content-Language: en-US
To: Vincent Chen <vincent.chen@sifive.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org
References: <20230320065324.1045276-1-vincent.chen@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230320065324.1045276-1-vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_091202_967384_A3E355D6 
X-CRM114-Status: GOOD (  18.79  )
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

Hi Vincent,

On 3/20/23 07:53, Vincent Chen wrote:
> The vmemmap_populate() creates VA to PA mapping for the VMEMMAP area, where
> all "strcut page" are located once CONFIG_SPARSEMEM_VMEMMAP is defined.
> These "struct page" are later initialized in the zone_sizes_init()
> function. However, during this process, no sfence.vma instruction is
> executed for this VMEMMAP area. This omission may cause the core to fail to
> perform page table work because some data related to the address
> translation is invisible to the core. To solve this issue, here let
> zone_sizes_init() call local_flush_tlb_kernel_range() to execute a
> sfence.vma instruction for the VMEMMAP area, ensuring that all data related
> to the address translation is visible to the core.
>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>   arch/riscv/include/asm/tlbflush.h | 7 +++++++
>   arch/riscv/mm/init.c              | 3 +++
>   2 files changed, 10 insertions(+)
>
> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
> index 801019381dea..b7696974e3c6 100644
> --- a/arch/riscv/include/asm/tlbflush.h
> +++ b/arch/riscv/include/asm/tlbflush.h
> @@ -59,4 +59,11 @@ static inline void flush_tlb_kernel_range(unsigned long start,
>   	flush_tlb_all();
>   }
>   
> +/* Flush a range of kernel pages without broadcasting */
> +static inline void local_flush_tlb_kernel_range(unsigned long start,
> +						unsigned long end)
> +{
> +	local_flush_tlb_all();
> +}
> +
>   #endif /* _ASM_RISCV_TLBFLUSH_H */
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 2c4a64e97aec..62eea656e341 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -72,6 +72,9 @@ static void __init zone_sizes_init(void)
>   #endif
>   	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
>   
> +#ifdef CONFIG_SPARSEMEM_VMEMMAP
> +	local_flush_tlb_kernel_range(VMEMMAP_START, VMEMMAP_END);
> +#endif
>   	free_area_init(max_zone_pfns);
>   }
>   

Just one nit: I would have added the flush to the vmemmap_populate 
function instead, so that we don't flush uselessly when !SPARSE_VMEMMAP 
and we know exactly why we flush.

Otherwise, you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
