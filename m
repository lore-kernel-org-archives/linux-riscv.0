Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FA0C25B10
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 09:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WFO8RLoj+C5eW3qk4RGHnMqIUxKn86/L9EdlIt+VIZc=; b=RyTfW2DXFNBVeC
	sEQsFgy3isuCa7d/CTq2Aa/2xVzkAEtmADizxmZPQPy474qDWg3iY7iDtlPazQRz+SonQsmoj7S9x
	sazwzikyJGyg4w19jomSyUniOQpbkIE+56g5szqy1k+zNAgfDuxptPmkQc/VDHyNpL/EB4CIv1zFZ
	tiiFcePsO6vHpwr3AFUh7PKEdjRhLWJnVcgnagCUd3CEEvrwBTnM57RHWORzUKLBJ6Qh2BlmRPNGI
	ozRIjFdlVxpnefvQQCoOJTWx6vlC9W7vemfGfgFvxjLXuE5t+hzA8fqYLb0bIO6/QqTHbYKvMgrYY
	73vuSBhhlDvsofdrxhhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5MCG-00000004aQE-1Vmf;
	Fri, 10 May 2024 09:05:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5MCC-00000004aOt-29DO
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 09:05:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67B2B106F;
	Fri, 10 May 2024 02:06:02 -0700 (PDT)
Received: from [10.57.65.1] (unknown [10.57.65.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E08003F762;
	Fri, 10 May 2024 02:05:34 -0700 (PDT)
Message-ID: <eb41fcb3-7207-40a8-9b49-0825a2e74e86@arm.com>
Date: Fri, 10 May 2024 10:05:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] mm: Add update_mmu_tlb_range()
Content-Language: en-GB
To: Bang Li <libang.li@antgroup.com>, akpm@linux-foundation.org,
 chenhuacai@kernel.org, tsbogend@alpha.franken.de, paul.walmsley@sifive.com,
 palmer@dabbelt.com, chris@zankel.net, jcmvbkbc@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 david@redhat.com, ioworker0@gmail.com, libang.linux@gmail.com
References: <20240506155120.83105-1-libang.li@antgroup.com>
 <20240506155120.83105-6-libang.li@antgroup.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20240506155120.83105-6-libang.li@antgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_020540_703794_EB8C4168 
X-CRM114-Status: GOOD (  21.18  )
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

On 06/05/2024 16:51, Bang Li wrote:
> After the commit 19eaf44954df ("mm: thp: support allocation of anonymous
> multi-size THP"), it may need to batch update tlb of an address range
> through the update_mmu_tlb function. We can simplify this operation by
> adding the update_mmu_tlb_range function, which may also reduce the
> execution of some unnecessary code in some architectures.
> 
> Signed-off-by: Bang Li <libang.li@antgroup.com>
> ---
>  include/linux/pgtable.h | 8 ++++++++
>  mm/memory.c             | 4 +---
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 18019f037bae..869bfe6054f1 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -737,6 +737,14 @@ static inline void update_mmu_tlb(struct vm_area_struct *vma,
>  #define __HAVE_ARCH_UPDATE_MMU_TLB
>  #endif

Given you are implementing update_mmu_tlb_range() in all the arches that
currently override update_mmu_tlb() I wonder if it would be cleaner to remove
update_mmu_tlb() from all those arches, and define generically, removing the
ability for arches to override it:

static inline void update_mmu_tlb(struct vm_area_struct *vma,
				unsigned long address, pte_t *ptep)
{
	update_mmu_tlb_range(vma, address, ptep, 1);
}

>  
> +#ifndef __HAVE_ARCH_UPDATE_MMU_TLB_RANGE
> +static inline void update_mmu_tlb_range(struct vm_area_struct *vma,
> +				unsigned long address, pte_t *ptep, unsigned int nr)
> +{
> +}
> +#define __HAVE_ARCH_UPDATE_MMU_TLB_RANGE
> +#endif

Then you could use the modern override scheme as Lance suggested and you won't
have any confusion with __HAVE_ARCH_UPDATE_MMU_TLB because it won't exist anymore.

> +
>  /*
>   * Some architectures may be able to avoid expensive synchronization
>   * primitives when modifications are made to PTE's which are already
> diff --git a/mm/memory.c b/mm/memory.c
> index eea6e4984eae..2d53e29cf76e 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4421,7 +4421,6 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
>  	vm_fault_t ret = 0;
>  	int nr_pages = 1;
>  	pte_t entry;
> -	int i;
>  
>  	/* File mapping without ->vm_ops ? */
>  	if (vma->vm_flags & VM_SHARED)
> @@ -4491,8 +4490,7 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
>  		update_mmu_tlb(vma, addr, vmf->pte);
>  		goto release;
>  	} else if (nr_pages > 1 && !pte_range_none(vmf->pte, nr_pages)) {
> -		for (i = 0; i < nr_pages; i++)
> -			update_mmu_tlb(vma, addr + PAGE_SIZE * i, vmf->pte + i);
> +		update_mmu_tlb_range(vma, addr, vmf->pte, nr_pages);

I certainly agree that this will be a useful helper to have. I expect there will
be more users in future.

>  		goto release;
>  	}
>  


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
