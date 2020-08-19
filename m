Return-Path: <SRS0=trTC=B5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F9AC433DF
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2020 11:54:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98DC322D2B
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2020 11:54:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UjBpt+Ar";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XzrjsD+8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98DC322D2B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0rbZlGLF4uErw05TSYhS6ztAcg3s7SPltt3nv7PVebo=; b=UjBpt+Ar1VGS+8lOCwL/WsS2P
	MdC1WArYxDlJ7LNu/qBVZUhw/V1TFUx1qa4wkg25olBKIUkHqvghagn07m38IaTpg5fF3sxnYq4JP
	zrk0XZ1nWqxTiEaFtdSUUjycSE/tkeOhAaviyxi42SmPy+MMVGfox52IKAMogqzMuFEfUW2PHbRk5
	W4YrCmZ2H6TVg5w92wh7FCFnKPRl7PoNl7WCPN0+Xm+q6KDUdiYTqLUe2EWW/0RuiBrWl+p89s4F1
	POiujkysApqO1KU5gXZwK2eJFcILT993GgiSBt3ibK5oRrs8HSy2K1nRzu42wk7QuM+gOLFlZDPyf
	SqTlqmsYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8MfP-000786-RE; Wed, 19 Aug 2020 11:54:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8Mf7-0006yW-Py; Wed, 19 Aug 2020 11:53:55 +0000
Received: from kernel.org (unknown [87.70.91.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7FB6322CB2;
 Wed, 19 Aug 2020 11:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597838028;
 bh=nB9SuwtUizzYREhBl09f96wwqfl+6v1Nki9XxEYxFmg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XzrjsD+88ReKpEKVPxcwBs0sO7/deF5YmgL8LgJvrSN6vKteBo3UksVlQ439kYefA
 pqi62Er1Ztem1X6xeUf0PcjYSye7F9ZeTEP4gsLHxxhVLZS4GHJvJhgTJYf67ZgHza
 yH2N2HWN3WZDusoyvsFWvEe6drqcLGHPLKWZz18o=
Date: Wed, 19 Aug 2020 14:53:35 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v4 6/6] mm: secretmem: add ability to reserve memory at
 boot
Message-ID: <20200819115335.GU752365@kernel.org>
References: <20200818141554.13945-1-rppt@kernel.org>
 <20200818141554.13945-7-rppt@kernel.org>
 <03ec586d-c00c-c57e-3118-7186acb7b823@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <03ec586d-c00c-c57e-3118-7186acb7b823@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_075350_077351_9FDB00D9 
X-CRM114-Status: GOOD (  38.58  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Aug 19, 2020 at 12:49:05PM +0200, David Hildenbrand wrote:
> On 18.08.20 16:15, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > Taking pages out from the direct map and bringing them back may create
> > undesired fragmentation and usage of the smaller pages in the direct
> > mapping of the physical memory.
> > 
> > This can be avoided if a significantly large area of the physical memory
> > would be reserved for secretmem purposes at boot time.
> > 
> > Add ability to reserve physical memory for secretmem at boot time using
> > "secretmem" kernel parameter and then use that reserved memory as a global
> > pool for secret memory needs.
> 
> Wouldn't something like CMA be the better fit? Just wondering. Then, the
> memory can actually be reused for something else while not needed.

The memory allocated as secret is removed from the direct map and the
boot time reservation is intended to reduce direct map fragmentatioan
and to avoid splitting 1G pages there. So with CMA I'd still need to
allocate 1G chunks for this and once 1G page is dropped from the direct
map it still cannot be reused for anything else until it is freed.

I could use CMA to do the boot time reservation, but doing the
reservesion directly seemed simpler and more explicit to me.


> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > ---
> >  mm/secretmem.c | 134 ++++++++++++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 126 insertions(+), 8 deletions(-)
> > 
> > diff --git a/mm/secretmem.c b/mm/secretmem.c
> > index 333eb18fb483..54067ea62b2d 100644
> > --- a/mm/secretmem.c
> > +++ b/mm/secretmem.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/pagemap.h>
> >  #include <linux/genalloc.h>
> >  #include <linux/syscalls.h>
> > +#include <linux/memblock.h>
> >  #include <linux/pseudo_fs.h>
> >  #include <linux/set_memory.h>
> >  #include <linux/sched/signal.h>
> > @@ -45,6 +46,39 @@ struct secretmem_ctx {
> >  	unsigned int mode;
> >  };
> >  
> > +struct secretmem_pool {
> > +	struct gen_pool *pool;
> > +	unsigned long reserved_size;
> > +	void *reserved;
> > +};
> > +
> > +static struct secretmem_pool secretmem_pool;
> > +
> > +static struct page *secretmem_alloc_huge_page(gfp_t gfp)
> > +{
> > +	struct gen_pool *pool = secretmem_pool.pool;
> > +	unsigned long addr = 0;
> > +	struct page *page = NULL;
> > +
> > +	if (pool) {
> > +		if (gen_pool_avail(pool) < PMD_SIZE)
> > +			return NULL;
> > +
> > +		addr = gen_pool_alloc(pool, PMD_SIZE);
> > +		if (!addr)
> > +			return NULL;
> > +
> > +		page = virt_to_page(addr);
> > +	} else {
> > +		page = alloc_pages(gfp, PMD_PAGE_ORDER);
> > +
> > +		if (page)
> > +			split_page(page, PMD_PAGE_ORDER);
> > +	}
> > +
> > +	return page;
> > +}
> > +
> >  static int secretmem_pool_increase(struct secretmem_ctx *ctx, gfp_t gfp)
> >  {
> >  	unsigned long nr_pages = (1 << PMD_PAGE_ORDER);
> > @@ -53,12 +87,11 @@ static int secretmem_pool_increase(struct secretmem_ctx *ctx, gfp_t gfp)
> >  	struct page *page;
> >  	int err;
> >  
> > -	page = alloc_pages(gfp, PMD_PAGE_ORDER);
> > +	page = secretmem_alloc_huge_page(gfp);
> >  	if (!page)
> >  		return -ENOMEM;
> >  
> >  	addr = (unsigned long)page_address(page);
> > -	split_page(page, PMD_PAGE_ORDER);
> >  
> >  	err = gen_pool_add(pool, addr, PMD_SIZE, NUMA_NO_NODE);
> >  	if (err) {
> > @@ -267,11 +300,13 @@ SYSCALL_DEFINE1(memfd_secret, unsigned long, flags)
> >  	return err;
> >  }
> >  
> > -static void secretmem_cleanup_chunk(struct gen_pool *pool,
> > -				    struct gen_pool_chunk *chunk, void *data)
> > +static void secretmem_recycle_range(unsigned long start, unsigned long end)
> > +{
> > +	gen_pool_free(secretmem_pool.pool, start, PMD_SIZE);
> > +}
> > +
> > +static void secretmem_release_range(unsigned long start, unsigned long end)
> >  {
> > -	unsigned long start = chunk->start_addr;
> > -	unsigned long end = chunk->end_addr;
> >  	unsigned long nr_pages, addr;
> >  
> >  	nr_pages = (end - start + 1) / PAGE_SIZE;
> > @@ -281,6 +316,18 @@ static void secretmem_cleanup_chunk(struct gen_pool *pool,
> >  		put_page(virt_to_page(addr));
> >  }
> >  
> > +static void secretmem_cleanup_chunk(struct gen_pool *pool,
> > +				    struct gen_pool_chunk *chunk, void *data)
> > +{
> > +	unsigned long start = chunk->start_addr;
> > +	unsigned long end = chunk->end_addr;
> > +
> > +	if (secretmem_pool.pool)
> > +		secretmem_recycle_range(start, end);
> > +	else
> > +		secretmem_release_range(start, end);
> > +}
> > +
> >  static void secretmem_cleanup_pool(struct secretmem_ctx *ctx)
> >  {
> >  	struct gen_pool *pool = ctx->pool;
> > @@ -320,14 +367,85 @@ static struct file_system_type secretmem_fs = {
> >  	.kill_sb	= kill_anon_super,
> >  };
> >  
> > +static int secretmem_reserved_mem_init(void)
> > +{
> > +	struct gen_pool *pool;
> > +	struct page *page;
> > +	void *addr;
> > +	int err;
> > +
> > +	if (!secretmem_pool.reserved)
> > +		return 0;
> > +
> > +	pool = gen_pool_create(PMD_SHIFT, NUMA_NO_NODE);
> > +	if (!pool)
> > +		return -ENOMEM;
> > +
> > +	err = gen_pool_add(pool, (unsigned long)secretmem_pool.reserved,
> > +			   secretmem_pool.reserved_size, NUMA_NO_NODE);
> > +	if (err)
> > +		goto err_destroy_pool;
> > +
> > +	for (addr = secretmem_pool.reserved;
> > +	     addr < secretmem_pool.reserved + secretmem_pool.reserved_size;
> > +	     addr += PAGE_SIZE) {
> > +		page = virt_to_page(addr);
> > +		__ClearPageReserved(page);
> > +		set_page_count(page, 1);
> > +	}
> > +
> > +	secretmem_pool.pool = pool;
> > +	page = virt_to_page(secretmem_pool.reserved);
> > +	__kernel_map_pages(page, secretmem_pool.reserved_size / PAGE_SIZE, 0);
> > +	return 0;
> > +
> > +err_destroy_pool:
> > +	gen_pool_destroy(pool);
> > +	return err;
> > +}
> > +
> >  static int secretmem_init(void)
> >  {
> > -	int ret = 0;
> > +	int ret;
> > +
> > +	ret = secretmem_reserved_mem_init();
> > +	if (ret)
> > +		return ret;
> >  
> >  	secretmem_mnt = kern_mount(&secretmem_fs);
> > -	if (IS_ERR(secretmem_mnt))
> > +	if (IS_ERR(secretmem_mnt)) {
> > +		gen_pool_destroy(secretmem_pool.pool);
> >  		ret = PTR_ERR(secretmem_mnt);
> > +	}
> >  
> >  	return ret;
> >  }
> >  fs_initcall(secretmem_init);
> > +
> > +static int __init secretmem_setup(char *str)
> > +{
> > +	phys_addr_t align = PMD_SIZE;
> > +	unsigned long reserved_size;
> > +	void *reserved;
> > +
> > +	reserved_size = memparse(str, NULL);
> > +	if (!reserved_size)
> > +		return 0;
> > +
> > +	if (reserved_size * 2 > PUD_SIZE)
> > +		align = PUD_SIZE;
> > +
> > +	reserved = memblock_alloc(reserved_size, align);
> > +	if (!reserved) {
> > +		pr_err("failed to reserve %lu bytes\n", secretmem_pool.reserved_size);
> > +		return 0;
> > +	}
> > +
> > +	secretmem_pool.reserved_size = reserved_size;
> > +	secretmem_pool.reserved = reserved;
> > +
> > +	pr_info("reserved %luM\n", reserved_size >> 20);
> > +
> > +	return 1;
> > +}
> > +__setup("secretmem=", secretmem_setup);
> > 
> 
> 
> -- 
> Thanks,
> 
> David / dhildenb
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
