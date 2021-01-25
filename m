Return-Path: <SRS0=syY9=G4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26DAEC433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Jan 2021 16:17:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E27922583
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Jan 2021 16:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E27922583
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+RkKAL46vPjJpa43QxRZM+iRRfHTqkWbEfQcZIeOzBA=; b=tJrGPPzUqaOn25ZOFfKyPSYdw
	WNkyPKQIryhjHOYyXaL8NcIKCVxTF+3i08gYCNEUswYtAFwtPV5ERwSh7KowU6r90vxl6it7R5kIY
	b049RD+M/jD1q7bK7rB4CFIFWh4leXquAq25jMdVfZ6AtNp5AEx9Xh07dNv9fYwaEfT37K2RJDnps
	qbP+A2o0lTaO5A+QypkCrDoNOjhYRrWpx7a8VjuJDN/PgyU4jVtREt+tJFJK2d7xdTE18WUkkanMT
	2/+0YdiQzIFfsJnlSQkYZXnwlhN5BfN5fHEaE9/G49Ve8N8Fp2ll29XMlW7l/gILWZnT2JV+t4Tvo
	7g5Y4WHfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l44Yd-00011M-TD; Mon, 25 Jan 2021 16:17:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l44Ya-00010i-Rq; Mon, 25 Jan 2021 16:17:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=IJWSMxQ0cSD59sZdRy00Q/p6Rk88W9Y0AQrU4XxStZg=; b=PuPaQ600mHPoHQdKyO6XI5TBrm
 CnXgjHw3HKWzCm5rtjfhkN6pBiyt2h/9yeDanzks13gq46MuMu5ie6WAiuNN2m/RkKR/rpK0Ta+ng
 fHJqJV/J5ZL7Mm56BAbERsDJQvtiznZxtFYP1h0WIVW4cRUSWOgeXte9ZAwEUfG7Limi/SljDPwHf
 3LMXYk3STX6IxUUL3ZYWCYEFfmPendGeUlO+ZrAdcgyCMSmB3rEIdQrHxVOnGrHC53/rZBPfRUW94
 buoqllvpB2FvdrEAlQBBWi7qPaBsXDmTgOiFPH1Y4lZIdk+po0IBNUEGXYPVncthQFPVdxLrQWtZK
 FRfe61ig==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1l44Y6-004OSf-8C; Mon, 25 Jan 2021 16:17:11 +0000
Date: Mon, 25 Jan 2021 16:17:06 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v16 08/11] secretmem: add memcg accounting
Message-ID: <20210125161706.GE308988@casper.infradead.org>
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-9-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210121122723.3446-9-rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org, linux-riscv@lists.infradead.org,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-fsdevel@vger.kernel.org,
 Shakeel Butt <shakeelb@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 21, 2021 at 02:27:20PM +0200, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> Account memory consumed by secretmem to memcg. The accounting is updated
> when the memory is actually allocated and freed.

I think this is wrong.  It fails to account subsequent allocators from
the same PMD.  If you want to track like this, you need separate pools
per memcg.

I think you shouldn't try to track like this; better to just track on
a per-page basis.  After all, the page allocator doesn't track order-10
pages to the memcg that initially caused them to be split.

> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> Acked-by: Roman Gushchin <guro@fb.com>
> Reviewed-by: Shakeel Butt <shakeelb@google.com>
> Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Christopher Lameter <cl@linux.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Elena Reshetova <elena.reshetova@intel.com>
> Cc: Hagen Paul Pfeifer <hagen@jauu.net>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: James Bottomley <jejb@linux.ibm.com>
> Cc: "Kirill A. Shutemov" <kirill@shutemov.name>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Tycho Andersen <tycho@tycho.ws>
> Cc: Will Deacon <will@kernel.org>
> ---
>  mm/filemap.c   |  3 ++-
>  mm/secretmem.c | 36 +++++++++++++++++++++++++++++++++++-
>  2 files changed, 37 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/filemap.c b/mm/filemap.c
> index 2d0c6721879d..bb28dd6d9e22 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -42,6 +42,7 @@
>  #include <linux/psi.h>
>  #include <linux/ramfs.h>
>  #include <linux/page_idle.h>
> +#include <linux/secretmem.h>
>  #include "internal.h"
>  
>  #define CREATE_TRACE_POINTS
> @@ -839,7 +840,7 @@ noinline int __add_to_page_cache_locked(struct page *page,
>  	page->mapping = mapping;
>  	page->index = offset;
>  
> -	if (!huge) {
> +	if (!huge && !page_is_secretmem(page)) {
>  		error = mem_cgroup_charge(page, current->mm, gfp);
>  		if (error)
>  			goto error;
> diff --git a/mm/secretmem.c b/mm/secretmem.c
> index 469211c7cc3a..05026460e2ee 100644
> --- a/mm/secretmem.c
> +++ b/mm/secretmem.c
> @@ -18,6 +18,7 @@
>  #include <linux/memblock.h>
>  #include <linux/pseudo_fs.h>
>  #include <linux/secretmem.h>
> +#include <linux/memcontrol.h>
>  #include <linux/set_memory.h>
>  #include <linux/sched/signal.h>
>  
> @@ -44,6 +45,32 @@ struct secretmem_ctx {
>  
>  static struct cma *secretmem_cma;
>  
> +static int secretmem_account_pages(struct page *page, gfp_t gfp, int order)
> +{
> +	int err;
> +
> +	err = memcg_kmem_charge_page(page, gfp, order);
> +	if (err)
> +		return err;
> +
> +	/*
> +	 * seceremem caches are unreclaimable kernel allocations, so treat
> +	 * them as unreclaimable slab memory for VM statistics purposes
> +	 */
> +	mod_lruvec_page_state(page, NR_SLAB_UNRECLAIMABLE_B,
> +			      PAGE_SIZE << order);
> +
> +	return 0;
> +}
> +
> +static void secretmem_unaccount_pages(struct page *page, int order)
> +{
> +
> +	mod_lruvec_page_state(page, NR_SLAB_UNRECLAIMABLE_B,
> +			      -PAGE_SIZE << order);
> +	memcg_kmem_uncharge_page(page, order);
> +}
> +
>  static int secretmem_pool_increase(struct secretmem_ctx *ctx, gfp_t gfp)
>  {
>  	unsigned long nr_pages = (1 << PMD_PAGE_ORDER);
> @@ -56,6 +83,10 @@ static int secretmem_pool_increase(struct secretmem_ctx *ctx, gfp_t gfp)
>  	if (!page)
>  		return -ENOMEM;
>  
> +	err = secretmem_account_pages(page, gfp, PMD_PAGE_ORDER);
> +	if (err)
> +		goto err_cma_release;
> +
>  	/*
>  	 * clear the data left from the prevoius user before dropping the
>  	 * pages from the direct map
> @@ -65,7 +96,7 @@ static int secretmem_pool_increase(struct secretmem_ctx *ctx, gfp_t gfp)
>  
>  	err = set_direct_map_invalid_noflush(page, nr_pages);
>  	if (err)
> -		goto err_cma_release;
> +		goto err_memcg_uncharge;
>  
>  	addr = (unsigned long)page_address(page);
>  	err = gen_pool_add(pool, addr, PMD_SIZE, NUMA_NO_NODE);
> @@ -83,6 +114,8 @@ static int secretmem_pool_increase(struct secretmem_ctx *ctx, gfp_t gfp)
>  	 * won't fail
>  	 */
>  	set_direct_map_default_noflush(page, nr_pages);
> +err_memcg_uncharge:
> +	secretmem_unaccount_pages(page, PMD_PAGE_ORDER);
>  err_cma_release:
>  	cma_release(secretmem_cma, page, nr_pages);
>  	return err;
> @@ -314,6 +347,7 @@ static void secretmem_cleanup_chunk(struct gen_pool *pool,
>  	int i;
>  
>  	set_direct_map_default_noflush(page, nr_pages);
> +	secretmem_unaccount_pages(page, PMD_PAGE_ORDER);
>  
>  	for (i = 0; i < nr_pages; i++)
>  		clear_highpage(page + i);
> -- 
> 2.28.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
