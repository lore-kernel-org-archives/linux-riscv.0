Return-Path: <SRS0=QNeR=FD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 369A6C64E7C
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Nov 2020 17:26:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B71742080C
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Nov 2020 17:26:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MA/4ARlu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="VcPgX8dF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B71742080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Dlv+6mqCJL3YKriPNuXkkcyYHhcSIUWCHUssUrb7/XU=; b=MA/4ARlub2SlD3sYJownAWAAp
	+zVpyq+ZTLZG3K+LdkwPa7EM/AA8q0xQSH1tBQZZXWNbugPpNRFWhuaW+0cShoVpgA4UhNy2AbUCg
	uJX2mu7qfgJ6RXmSFwzY3Xee8G0VV7lkczMq0u7dw/e4zlE7BeTXYCI+7QE9PCFvcreb0UFscHAeG
	b2GFFEGZgByIZKWRgIgkGST1KWmhueWbflcbO8XnpeEsFbH+mfXGEF0fTCLaaXWDcFad8KWGEhsIE
	zZ3CmH53dTkHaWFFH53xmcWLZIoDmJZP2wNQGlEQkPYNz9todY42RitJU7FVTEKgUH83TtFiRrbh6
	ZHjwvRLuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjQTH-0003uX-PT; Sun, 29 Nov 2020 17:26:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjQTD-0003sl-0j; Sun, 29 Nov 2020 17:26:44 +0000
Received: from kernel.org (unknown [87.71.85.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 422E9206F4;
 Sun, 29 Nov 2020 17:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606670801;
 bh=193fTdj4a0UGUIyrwcsvt+1ylSiVDeNw4WwJgyyeI0o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VcPgX8dFSy9Ib9kWnBH2tRtaSziWbjbmm/b3KwtE1n5ZeUaApS9TIAbB17gPzKn16
 16Tdha8Hm4Jgj6OkL5MJvDw7grmc3v+aPRxni9lGCOKPmW+seMn30mlZzbCH+CCfcq
 1IVHreDWn8hVqwZBOZMP3h7CF/w11Dl4ALLVGb3o=
Date: Sun, 29 Nov 2020 19:26:25 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Shakeel Butt <shakeelb@google.com>
Subject: Re: [PATCH v12 07/10] secretmem: add memcg accounting
Message-ID: <20201129172625.GD557259@kernel.org>
References: <20201125092208.12544-1-rppt@kernel.org>
 <20201125092208.12544-8-rppt@kernel.org>
 <CALvZod4MoXod_YkbO+4k2=PS=xdMVbZa2HWWuUnMZ1G9hSr+Jw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALvZod4MoXod_YkbO+4k2=PS=xdMVbZa2HWWuUnMZ1G9hSr+Jw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201129_122643_305440_F01E62AB 
X-CRM114-Status: GOOD (  31.58  )
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
 Dave Hansen <dave.hansen@linux.intel.com>, Linux MM <linux-mm@kvack.org>,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
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
 linux-api@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Nov 29, 2020 at 07:53:45AM -0800, Shakeel Butt wrote:
> On Wed, Nov 25, 2020 at 1:51 AM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > From: Mike Rapoport <rppt@linux.ibm.com>
> >
> > Account memory consumed by secretmem to memcg. The accounting is updated
> > when the memory is actually allocated and freed.
> >
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > Acked-by: Roman Gushchin <guro@fb.com>
> > ---
> >  mm/filemap.c   |  3 ++-
> >  mm/secretmem.c | 36 +++++++++++++++++++++++++++++++++++-
> >  2 files changed, 37 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/filemap.c b/mm/filemap.c
> > index 249cf489f5df..cf7f1dc9f4b8 100644
> > --- a/mm/filemap.c
> > +++ b/mm/filemap.c
> > @@ -42,6 +42,7 @@
> >  #include <linux/psi.h>
> >  #include <linux/ramfs.h>
> >  #include <linux/page_idle.h>
> > +#include <linux/secretmem.h>
> >  #include "internal.h"
> >
> >  #define CREATE_TRACE_POINTS
> > @@ -844,7 +845,7 @@ static noinline int __add_to_page_cache_locked(struct page *page,
> >         page->mapping = mapping;
> >         page->index = offset;
> >
> > -       if (!huge) {
> > +       if (!huge && !page_is_secretmem(page)) {
> >                 error = mem_cgroup_charge(page, current->mm, gfp);
> >                 if (error)
> >                         goto error;
> > diff --git a/mm/secretmem.c b/mm/secretmem.c
> > index 52a900a135a5..eb6628390444 100644
> > --- a/mm/secretmem.c
> > +++ b/mm/secretmem.c
> > @@ -18,6 +18,7 @@
> >  #include <linux/memblock.h>
> >  #include <linux/pseudo_fs.h>
> >  #include <linux/secretmem.h>
> > +#include <linux/memcontrol.h>
> >  #include <linux/set_memory.h>
> >  #include <linux/sched/signal.h>
> >
> > @@ -44,6 +45,32 @@ struct secretmem_ctx {
> >
> >  static struct cma *secretmem_cma;
> >
> > +static int secretmem_account_pages(struct page *page, gfp_t gfp, int order)
> > +{
> > +       int err;
> > +
> > +       err = memcg_kmem_charge_page(page, gfp, order);
> > +       if (err)
> > +               return err;
> > +
> > +       /*
> > +        * seceremem caches are unreclaimable kernel allocations, so treat
> > +        * them as unreclaimable slab memory for VM statistics purposes
> > +        */
> > +       mod_node_page_state(page_pgdat(page), NR_SLAB_UNRECLAIMABLE_B,
> > +                           PAGE_SIZE << order);
> 
> Please use mod_lruvec_page_state() instead, so we get the memcg stats too.

Ok

> BTW I think secretmem deserves a vmstat entry instead of overloading
> NR_SLAB_UNRECLAIMABLE_B.

I'd prefer to wait with a dedicated vmstat for now. We can always add it
later, once we have better picture of secremem usage.

> > +
> > +       return 0;
> > +}
> > +
> > +static void secretmem_unaccount_pages(struct page *page, int order)
> > +{
> > +
> > +       mod_node_page_state(page_pgdat(page), NR_SLAB_UNRECLAIMABLE_B,
> > +                           -PAGE_SIZE << order);
> > +       memcg_kmem_uncharge_page(page, order);
> > +}
> > +
> >  static int secretmem_pool_increase(struct secretmem_ctx *ctx, gfp_t gfp)
> >  {
> >         unsigned long nr_pages = (1 << PMD_PAGE_ORDER);
> > @@ -56,10 +83,14 @@ static int secretmem_pool_increase(struct secretmem_ctx *ctx, gfp_t gfp)
> >         if (!page)
> >                 return -ENOMEM;
> >
> > -       err = set_direct_map_invalid_noflush(page, nr_pages);
> > +       err = secretmem_account_pages(page, gfp, PMD_PAGE_ORDER);
> >         if (err)
> >                 goto err_cma_release;
> >
> > +       err = set_direct_map_invalid_noflush(page, nr_pages);
> > +       if (err)
> > +               goto err_memcg_uncharge;
> > +
> >         addr = (unsigned long)page_address(page);
> >         err = gen_pool_add(pool, addr, PMD_SIZE, NUMA_NO_NODE);
> >         if (err)
> > @@ -76,6 +107,8 @@ static int secretmem_pool_increase(struct secretmem_ctx *ctx, gfp_t gfp)
> >          * won't fail
> >          */
> >         set_direct_map_default_noflush(page, nr_pages);
> > +err_memcg_uncharge:
> > +       secretmem_unaccount_pages(page, PMD_PAGE_ORDER);
> >  err_cma_release:
> >         cma_release(secretmem_cma, page, nr_pages);
> >         return err;
> > @@ -302,6 +335,7 @@ static void secretmem_cleanup_chunk(struct gen_pool *pool,
> >         int i;
> >
> >         set_direct_map_default_noflush(page, nr_pages);
> > +       secretmem_unaccount_pages(page, PMD_PAGE_ORDER);
> >
> >         for (i = 0; i < nr_pages; i++)
> >                 clear_highpage(page + i);
> > --
> > 2.28.0
> >

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
