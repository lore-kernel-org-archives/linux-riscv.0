Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C50C43458
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 03:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CLomc/aquC19w/8r4Ihaba3hGlAASJ6Ocj+/zfsuG7U=; b=oypfkX9QUWA8an
	9ta5X/EJ9e/Abaqc7aWM97fhiXP3FPkrEA13fo0t01iECwVKHtyrMQvFLr/fpnqyhGW9l0xI4bRfV
	asPyF5HM+2tAO64+gAwuD7E7yc5GEeTaCu+3wzgdv+Gsu0mCVZFF6jGgJi8vc2HJj6HhFTqXteLpR
	UYHeB284Twy90Cwy9Vf/lAkvRAIIH5CFsAR+WV9gxh1ITStceccVBdIYY+97fcN+QAtrm9ZRMEq8w
	NlNgMHEzzM+EhXsEkZXX2efjeQ8TBq7QgeCN3M6LAK9FrjERVNpRTI6civkEP2jd0vP8pskP+ug/2
	DX1/lC9Jyc2p9OpODsHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgZaR-0000000BRDo-2nLR;
	Mon, 06 Jul 2026 03:01:35 +0000
Received: from out-188.mta1.migadu.com ([2001:41d0:203:375::bc])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgZaP-0000000BRDB-2O0p
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 03:01:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783306878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5mNg8uTBUEP+kdeHtZVc8H2D2K8xV49JXzmGSxQo2r8=;
	b=h4WuptXJGTMFsEeIm0BZYZ4V0I4pmNKKI6vHYn577zDVcEx6pVWmMpEm1XnXvNhMPmL1J4
	/68NGmhYURhAKTNPgwIopj8EEMzZ/nF87Z2r5SgH/ICOONcUzE7D7oX7gTIyA9JoiJEBOE
	fte8zEQwW5s68CSiG75PABKsNuy2o2k=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v4] riscv: mm: Avoid spurious fault after hotplugging
 vmemmap
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260630-mark-after-vmemmap-populate-v4-1-febbc15da028@iscas.ac.cn>
Date: Mon, 6 Jul 2026 11:00:32 +0800
Cc: Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Message-Id: <7B0CB4ED-C190-4F49-97EE-E1F14F08DED2@linux.dev>
References: <20260630-mark-after-vmemmap-populate-v4-1-febbc15da028@iscas.ac.cn>
To: Vivian Wang <wangruikang@iscas.ac.cn>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_200133_779477_99FB7A73 
X-CRM114-Status: GOOD (  31.72  )
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



> On Jun 30, 2026, at 15:51, Vivian Wang <wangruikang@iscas.ac.cn> wrote:
> 
> section_activate() does not flush TLB after populating new vmemmap
> pages. On most architectures, this is okay. However it is a problem on
> RISC-V since there the TLB caching non-present entries is permitted,
> which causes spurious faults on some hardwares.
> 
> This seems to be most easily reproduced with DEBUG_VM=y and
> PAGE_POISONING=y, which causes these newly mapped struct pages to be
> poisoned i.e. written to immediately after mapping.
> 
> Add a hook vmemmap_populate_finalize() in __populate_section_memmap()
> after population, to allow architectures to handle such situations as
> needed. Then implement it on RISC-V to arrange for the existing
> exception handler code to deal with these faults if they happen.
> 
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
> Changes in v4:
> - Rebase on v7.2-rc1, drop dependencies
> - (No code changes otherwise)
> - (A concurrency fix for mark_new_valid_map was sent independently)
>  https://lore.kernel.org/linux-riscv/20260629-riscv-mm-new-valid-map-ordering-v1-1-60d8c10c6292@iscas.ac.cn/
> - Link to v3: https://patch.msgid.link/20260605-mark-after-vmemmap-populate-v3-1-a06001ac9264@iscas.ac.cn
> 
> Changes in v3:
> - Merged back into one patch (Mike)
> - (No code changes otherwise.)
> - Link to v2: https://patch.msgid.link/20260604-mark-after-vmemmap-populate-v2-0-ab6a7d03b434@iscas.ac.cn
> 
> Changes in v2:
> - Split patch in two, hook point and riscv hook 
> - Explain hook necessity in patch 1 message (Mike)
> - Make hook #define based (Mike)
> - Call finalize hook only on populate success
> - Link to v1: https://patch.msgid.link/20260525-mark-after-vmemmap-populate-v1-1-e698d859ba16@iscas.ac.cn
> ---
> arch/riscv/include/asm/pgtable.h | 4 ++++
> arch/riscv/mm/init.c             | 6 ++++++
> mm/sparse-vmemmap.c              | 8 ++++++++
> 3 files changed, 18 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 5d5756bda82e..6b000c990ba7 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -1253,6 +1253,10 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
> #define TASK_SIZE FIXADDR_START
> #endif
> 
> +/* Needed on SPARSEMEM_VMEMMAP */
> +#define vmemmap_populate_finalize vmemmap_populate_finalize
> +void __meminit vmemmap_populate_finalize(void);
> +
> #else /* CONFIG_MMU */
> 
> #define PAGE_SHARED __pgprot(0)
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 5b1b3c88b4d1..800cb5c007d1 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -1372,6 +1372,12 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
> */
> 	return vmemmap_populate_hugepages(start, end, node, altmap);
> }
> +
> +void __meminit vmemmap_populate_finalize(void)
> +{
> + 	/* Avoid faults on cached non-present TLB entries. */
> + 	mark_new_valid_map();
> +}
> #endif
> 
> #if defined(CONFIG_MMU) && defined(CONFIG_64BIT)
> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
> index 99e2be39671b..290cafcfd723 100644
> --- a/mm/sparse-vmemmap.c
> +++ b/mm/sparse-vmemmap.c
> @@ -544,6 +544,12 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
> 
> #endif
> 
> +#ifndef vmemmap_populate_finalize
> +static void __meminit vmemmap_populate_finalize(void)
> +{
> +}
> +#endif
> +
> struct page * __meminit __populate_section_memmap(unsigned long pfn,
> unsigned long nr_pages, int nid, struct vmem_altmap *altmap,
> struct dev_pagemap *pgmap)
> @@ -564,6 +570,8 @@ struct page * __meminit __populate_section_memmap(unsigned long pfn,
> 	if (r < 0)
> 		return NULL;
> 
> + 	vmemmap_populate_finalize();

Does the hook of flush_cache_vmap() work for you?  From the document of
cachetlb.rst, it said: 

	6) ``void flush_cache_vmap(unsigned long start, unsigned long end)``
	   ``void flush_cache_vunmap(unsigned long start, unsigned long end)``

		Here in these two interfaces we are flushing a specific range
		of (kernel) virtual addresses from the cache. After running,
		there will be no entries in the cache for the kernel address
		space for virtual addresses in the range 'start' to 'end-1'.

It seems that flush_cache_vmap() is supposed to be called after a new kernel
mapping has been installed, but before this address range is accessed.

Therefore, invoking flush_cache_vmap() here aligns perfectly with its interface
definition. But how would this change impact other architectures? Currently,
among architectures where CONFIG_SPARSEMEM=y, only RISC-V and PowerPC provide
a concrete implementation for flush_cache_vmap().

For PowerPC, the implementation is as follows:

	static inline void flush_cache_vmap(unsigned long start, unsigned long end)
	{
		asm volatile("ptesync" ::: "memory");
	}

Here, flush_cache_vmap() is also intended to supply the ptesync instruction
that the kernel address mapping lacks. However, flush_cache_vmap() is not
called in the __populate_section_memmap() path. So, how does PowerPC ensure
ptesync is executed there? The answer lies in the architecture-specific
vmemmap_set_pmd(), which injects the necessary ptesync.

If we choose to reuse flush_cache_vmap() in the generic path, it yields the
following benefits:

- Avoids architectural churn: We do not need to introduce a new hook
  like vmemmap_populate_finalize().
- Cleans up arch code: PowerPC can deprecate its custom vmemmap_set_pmd()
  and migrate to the generic implementation.

Let me know if this rationale makes sense, or if there are any hidden edge
cases I might have overlooked regarding other architectures.

Thanks,
Muchun

		
> +
> 	return pfn_to_page(pfn);
> }
> 
> 
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260525-mark-after-vmemmap-populate-68bd790839c9
> 
> Best regards,
> --  
> Vivian "dramforever" Wang
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
