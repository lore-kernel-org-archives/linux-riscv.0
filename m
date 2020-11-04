Return-Path: <SRS0=Bqyv=EK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B3CC2D0A3
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 17:36:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4644C20658
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 17:36:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PGpb8HbL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4644C20658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O1ZdJncjaCM39UCpk14kE1fB4gsqQ3TU+wcWGX/OIVE=; b=PGpb8HbLesRFBJVMECda4aliU
	pEQnjMouybtAwCNqT2GojzEZMpSmb7kM5RkG2BWcTALWCzThkPLgZ+9/C7LGo6Dw67mJvB71q3VB4
	wGl+f2YoV2RDT6OHe4M9p72zlRv9W5BaKETUNzV/5zLs3PBirPbSRpXuZ/Uk1ZqjJYhWpYU6A+o/S
	kvxiEf1uvXyzMPtb6Fa8G9NbfFZfPtg5u0Ne6loGoVzdCyGeHuXwoO0nt/z2LCVI7I308Yw0OPu/0
	Qp18nYHnY8r8sw9VfN8mU21oRAjS/ChrFrwydUzvu25S+5KeUh4nGCDEdiKygOqxW9EU9y1NTDCcM
	JbjLkYI9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaMhb-0006vC-ON; Wed, 04 Nov 2020 17:36:07 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaMhR-0006pA-0Z; Wed, 04 Nov 2020 17:36:02 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 03279AD64;
 Wed,  4 Nov 2020 17:35:53 +0000 (UTC)
Subject: Re: [PATCH v4 1/4] mm: introduce debug_pagealloc_map_pages() helper
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
References: <20201103162057.22916-1-rppt@kernel.org>
 <20201103162057.22916-2-rppt@kernel.org>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <971e9638-2395-daf4-d19e-fe3cf5d34b98@suse.cz>
Date: Wed, 4 Nov 2020 18:35:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201103162057.22916-2-rppt@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_123557_294367_0BAE3425 
X-CRM114-Status: GOOD (  36.61  )
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Len Brown <len.brown@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Pekka Enberg <penberg@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/3/20 5:20 PM, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> When CONFIG_DEBUG_PAGEALLOC is enabled, it unmaps pages from the kernel
> direct mapping after free_pages(). The pages than need to be mapped back
> before they could be used. Theese mapping operations use
> __kernel_map_pages() guarded with with debug_pagealloc_enabled().
> 
> The only place that calls __kernel_map_pages() without checking whether
> DEBUG_PAGEALLOC is enabled is the hibernation code that presumes
> availability of this function when ARCH_HAS_SET_DIRECT_MAP is set.
> Still, on arm64, __kernel_map_pages() will bail out when DEBUG_PAGEALLOC is
> not enabled but set_direct_map_invalid_noflush() may render some pages not
> present in the direct map and hibernation code won't be able to save such
> pages.
> 
> To make page allocation debugging and hibernation interaction more robust,
> the dependency on DEBUG_PAGEALLOC or ARCH_HAS_SET_DIRECT_MAP has to be made
> more explicit.
> 
> Start with combining the guard condition and the call to
> __kernel_map_pages() into a single debug_pagealloc_map_pages() function to
> emphasize that __kernel_map_pages() should not be called without
> DEBUG_PAGEALLOC and use this new function to map/unmap pages when page
> allocation debug is enabled.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

Acked-by: Vlastimil Babka <vbabka@suse.cz>

But, the "enable" param is hideous. I would rather have map and unmap variants 
(and just did the same split for page poisoning) and this seems to be a good 
opportunity. If David didn't propose it already, I'm surprised ;)

> ---
>   include/linux/mm.h  | 10 ++++++++++
>   mm/memory_hotplug.c |  3 +--
>   mm/page_alloc.c     |  6 ++----
>   mm/slab.c           |  8 +++-----
>   4 files changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index ef360fe70aaf..1fc0609056dc 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2936,12 +2936,22 @@ kernel_map_pages(struct page *page, int numpages, int enable)
>   {
>   	__kernel_map_pages(page, numpages, enable);
>   }
> +
> +static inline void debug_pagealloc_map_pages(struct page *page,
> +					     int numpages, int enable)
> +{
> +	if (debug_pagealloc_enabled_static())
> +		__kernel_map_pages(page, numpages, enable);
> +}
> +
>   #ifdef CONFIG_HIBERNATION
>   extern bool kernel_page_present(struct page *page);
>   #endif	/* CONFIG_HIBERNATION */
>   #else	/* CONFIG_DEBUG_PAGEALLOC || CONFIG_ARCH_HAS_SET_DIRECT_MAP */
>   static inline void
>   kernel_map_pages(struct page *page, int numpages, int enable) {}
> +static inline void debug_pagealloc_map_pages(struct page *page,
> +					     int numpages, int enable) {}
>   #ifdef CONFIG_HIBERNATION
>   static inline bool kernel_page_present(struct page *page) { return true; }
>   #endif	/* CONFIG_HIBERNATION */
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index b44d4c7ba73b..e2b6043a4428 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -614,8 +614,7 @@ void generic_online_page(struct page *page, unsigned int order)
>   	 * so we should map it first. This is better than introducing a special
>   	 * case in page freeing fast path.
>   	 */
> -	if (debug_pagealloc_enabled_static())
> -		kernel_map_pages(page, 1 << order, 1);
> +	debug_pagealloc_map_pages(page, 1 << order, 1);
>   	__free_pages_core(page, order);
>   	totalram_pages_add(1UL << order);
>   #ifdef CONFIG_HIGHMEM
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 23f5066bd4a5..9a66a1ff9193 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -1272,8 +1272,7 @@ static __always_inline bool free_pages_prepare(struct page *page,
>   	 */
>   	arch_free_page(page, order);
>   
> -	if (debug_pagealloc_enabled_static())
> -		kernel_map_pages(page, 1 << order, 0);
> +	debug_pagealloc_map_pages(page, 1 << order, 0);
>   
>   	kasan_free_nondeferred_pages(page, order);
>   
> @@ -2270,8 +2269,7 @@ inline void post_alloc_hook(struct page *page, unsigned int order,
>   	set_page_refcounted(page);
>   
>   	arch_alloc_page(page, order);
> -	if (debug_pagealloc_enabled_static())
> -		kernel_map_pages(page, 1 << order, 1);
> +	debug_pagealloc_map_pages(page, 1 << order, 1);
>   	kasan_alloc_pages(page, order);
>   	kernel_poison_pages(page, 1 << order, 1);
>   	set_page_owner(page, order, gfp_flags);
> diff --git a/mm/slab.c b/mm/slab.c
> index b1113561b98b..340db0ce74c4 100644
> --- a/mm/slab.c
> +++ b/mm/slab.c
> @@ -1431,10 +1431,8 @@ static bool is_debug_pagealloc_cache(struct kmem_cache *cachep)
>   #ifdef CONFIG_DEBUG_PAGEALLOC
>   static void slab_kernel_map(struct kmem_cache *cachep, void *objp, int map)
>   {
> -	if (!is_debug_pagealloc_cache(cachep))
> -		return;
> -
> -	kernel_map_pages(virt_to_page(objp), cachep->size / PAGE_SIZE, map);
> +	debug_pagealloc_map_pages(virt_to_page(objp),
> +				  cachep->size / PAGE_SIZE, map);
>   }
>   
>   #else
> @@ -2062,7 +2060,7 @@ int __kmem_cache_create(struct kmem_cache *cachep, slab_flags_t flags)
>   
>   #if DEBUG
>   	/*
> -	 * If we're going to use the generic kernel_map_pages()
> +	 * If we're going to use the generic debug_pagealloc_map_pages()
>   	 * poisoning, then it's going to smash the contents of
>   	 * the redzone and userword anyhow, so switch them off.
>   	 */
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
