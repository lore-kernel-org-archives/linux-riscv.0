Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485BDC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 21:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d+lYiFBryu0UajvwOgHwoBeAQlbLadL0HdxRLGp49gg=; b=Y1qru9c5Gf/VY9
	6S+VXq1A9HijXQW6zHb5GNeFX8Uq/ZCnXKvHptdROGJ0ZW+wbeCdtZXWAznBwvAO/pL672SmuI1my
	tW4RYKTyt3BWxt69E7tYUK8bybSicjLU8BYr7C2A3X0UtHLfYHEO4zFjnX1TcwKZT7yUQLgFw8qp5
	DFiBd1EdBlXnO0t0z+lw5egraDrai5/Ooy4SLCAyOtycMRHwQSNJ0Fi0lzBvdOfMz4RHDW+RqlQ3S
	Nu5MZb6pIxRy/tQWz8HVK8DjnKTSJldZmTF1Q723fGEs6m5XAc77/Ek3zuCsuq85UQ/qFey1p+9SQ
	f4pHtuWtmo8AL20B7Qtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rG3yd-000urm-1c;
	Wed, 20 Dec 2023 21:19:39 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rG3ya-000upl-21
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 21:19:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 47B2E1C0003;
	Wed, 20 Dec 2023 21:19:32 +0000 (UTC)
Message-ID: <08dbe459-5174-44bc-b61d-a8acef96c763@ghiti.fr>
Date: Wed, 20 Dec 2023 22:19:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] riscv: mm: execute local TLB flush after populating
 vmemmap
Content-Language: en-US
To: Vincent Chen <vincent.chen@sifive.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, ajones@ventanamicro.com, alexghiti@rivosinc.com
Cc: linux-riscv@lists.infradead.org
References: <20231220024343.1547648-1-vincent.chen@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20231220024343.1547648-1-vincent.chen@sifive.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_131936_946848_DF9F49E3 
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

Hi Vincent,

On 20/12/2023 03:43, Vincent Chen wrote:
> The spare_init() calls memmap_populate() many times to create VA to PA
> mapping for the VMEMMAP area, where all "struct page" are located once
> CONFIG_SPARSEMEM_VMEMMAP is defined. These "struct page" are later
> initialized in the zone_sizes_init() function. However, during this
> process, no sfence.vma instruction is executed for this VMEMMAP area.
> This omission may cause the hart to fail to perform page table walk
> because some data related to the address translation is invisible to the
> hart. To solve this issue, the local_flush_tlb_kernel_range() is called
> right after the spare_init() to execute a sfence.vma instruction for this
> VMEMMAP area, ensuring that all data related to the address translation
> is visible to the hart.


s/spare_init/sparse_init


>
> Fixes: d95f1a542c3d ("RISC-V: Implement sparsemem")
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>   arch/riscv/include/asm/tlbflush.h | 2 ++
>   arch/riscv/mm/init.c              | 5 +++++
>   arch/riscv/mm/tlbflush.c          | 6 ++++++
>   3 files changed, 13 insertions(+)
>
> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
> index 8f3418c5f172..525267379ccb 100644
> --- a/arch/riscv/include/asm/tlbflush.h
> +++ b/arch/riscv/include/asm/tlbflush.h
> @@ -46,6 +46,7 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end);
>   void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
>   			unsigned long end);
>   #endif
> +void local_flush_tlb_kernel_range(unsigned long start, unsigned long end);
>   #else /* CONFIG_SMP && CONFIG_MMU */
>   
>   #define flush_tlb_all() local_flush_tlb_all()
> @@ -66,6 +67,7 @@ static inline void flush_tlb_kernel_range(unsigned long start,
>   
>   #define flush_tlb_mm(mm) flush_tlb_all()
>   #define flush_tlb_mm_range(mm, start, end, page_size) flush_tlb_all()
> +#define local_flush_tlb_kernel_range(start, end) flush_tlb_all()
>   #endif /* !CONFIG_SMP || !CONFIG_MMU */
>   
>   #endif /* _ASM_RISCV_TLBFLUSH_H */
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 2e011cbddf3a..cc56a0945120 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -1377,6 +1377,10 @@ void __init misc_mem_init(void)
>   	early_memtest(min_low_pfn << PAGE_SHIFT, max_low_pfn << PAGE_SHIFT);
>   	arch_numa_init();
>   	sparse_init();
> +#ifdef CONFIG_SPARSEMEM_VMEMMAP
> +	/* The entire VMEMMAP region has been populated. Flush TLB for this region */
> +	local_flush_tlb_kernel_range(VMEMMAP_START, VMEMMAP_END);
> +#endif
>   	zone_sizes_init();
>   	arch_reserve_crashkernel();
>   	memblock_dump_all();
> @@ -1386,6 +1390,7 @@ void __init misc_mem_init(void)
>   int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>   			       struct vmem_altmap *altmap)
>   {
> +	/* Defer the required TLB flush until the entire VMEMMAP region has been populated */
>   	return vmemmap_populate_basepages(start, end, node, NULL);
>   }
>   #endif
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index e6659d7368b3..d11a4ae87ec1 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -193,6 +193,12 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end)
>   	__flush_tlb_range(NULL, start, end - start, PAGE_SIZE);
>   }
>   
> +/* Flush a range of kernel pages without broadcasting */
> +void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
> +{
> +	local_flush_tlb_range_asid(start, end - start, PAGE_SIZE, FLUSH_TLB_NO_ASID);
> +}
> +
>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>   void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
>   			unsigned long end)


Otherwise, this looks good to me and should go to -fixes, you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks!

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
