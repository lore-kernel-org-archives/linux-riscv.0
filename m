Return-Path: <SRS0=TFiT=G7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD868C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 09:23:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78C7364DDA
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 09:23:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78C7364DDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GpqQCaxNVuvz1LKDoA+lHNQ9araeIMcRHsRzy55LoGg=; b=QxnTzDCzXh6Mx+zFEfS/Fa2FR
	dtiAvo9IaHUELClg+bZxH06zeKiETWDiAQBjuIq4ro+6MrhCW5QH5V1aoFkGixKcbrBg8fop49cFh
	X5gkGLziS9tXcB5CRRSMUUEN1Xa7+JqHJKZbPhWCkY5NkSbMBNEh3QzD7FdzWl7Z7h7XOY2fxFmWp
	9YAxatgpcwiUYhOqxy1JqnYcnwUbAS4OJi1Te1QFT2BDHl0D2+M+UKOC2OYCoBpna1kjXwNx++0yi
	zD0/ANTNY09ogTBnOY7jG0/53qF4k5/dqz3iaim8h1IAGHu/d6IaqET2GP2FY6P2zMXJJwPB/otIF
	PsouJb4TQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l53WR-0001YJ-Or; Thu, 28 Jan 2021 09:23:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l53WK-0001VL-8H; Thu, 28 Jan 2021 09:23:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDB2664DBD;
 Thu, 28 Jan 2021 09:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611825798;
 bh=wFG5EhdlVFCwH+afpQDALNPmvIOm44hDKteic5pytDI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rxsJaJjU3sN48PyjZmsBwjDAMzpV1mSDumbq6Vyhy1ylEqh17Y4BWGasGmEKM8wGb
 FFiXgqi9YKa2UW585N4J/UJUUiMSsvRqdthQ8lWnluP+x5F7LzK94JTif6Q9PlN4Qp
 0vTd4DdZTyxQs/VSO/swnV8HFYZgo19Bwx/Pip182+f3Fb3AxlbTFLjCdj8TdrjWSX
 h/qZFSgYAfnmiXoEsb6t5X8uFqRtKIMlLzCTMEcmb/dlZipJDPSJ67u+u2XAzNKw+U
 FwH99yq1Pt4VruScF6VwyzEABEVF5UHEXyz20348tQsQVXLyUoh3LOrNAXJp3tqz74
 76PCZTZpxL6Hg==
Date: Thu, 28 Jan 2021 11:22:59 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v16 07/11] secretmem: use PMD-size pages to amortize
 direct map fragmentation
Message-ID: <20210128092259.GB242749@kernel.org>
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-8-rppt@kernel.org>
 <20210126114657.GL827@dhcp22.suse.cz>
 <303f348d-e494-e386-d1f5-14505b5da254@redhat.com>
 <20210126120823.GM827@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210126120823.GM827@dhcp22.suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_042320_564595_C749D404 
X-CRM114-Status: GOOD (  40.19  )
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
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jan 26, 2021 at 01:08:23PM +0100, Michal Hocko wrote:
> On Tue 26-01-21 12:56:48, David Hildenbrand wrote:
> > On 26.01.21 12:46, Michal Hocko wrote:
> > > On Thu 21-01-21 14:27:19, Mike Rapoport wrote:
> > > > From: Mike Rapoport <rppt@linux.ibm.com>
> > > > 
> > > > Removing a PAGE_SIZE page from the direct map every time such page is
> > > > allocated for a secret memory mapping will cause severe fragmentation of
> > > > the direct map. This fragmentation can be reduced by using PMD-size pages
> > > > as a pool for small pages for secret memory mappings.
> > > > 
> > > > Add a gen_pool per secretmem inode and lazily populate this pool with
> > > > PMD-size pages.
> > > > 
> > > > As pages allocated by secretmem become unmovable, use CMA to back large
> > > > page caches so that page allocator won't be surprised by failing attempt to
> > > > migrate these pages.
> > > > 
> > > > The CMA area used by secretmem is controlled by the "secretmem=" kernel
> > > > parameter. This allows explicit control over the memory available for
> > > > secretmem and provides upper hard limit for secretmem consumption.
> > > 
> > > OK, so I have finally had a look at this closer and this is really not
> > > acceptable. I have already mentioned that in a response to other patch
> > > but any task is able to deprive access to secret memory to other tasks
> > > and cause OOM killer which wouldn't really recover ever and potentially
> > > panic the system. Now you could be less drastic and only make SIGBUS on
> > > fault but that would be still quite terrible. There is a very good
> > > reason why hugetlb implements is non-trivial reservation system to avoid
> > > exactly these problems.

So, if I understand your concerns correct this implementation has two
issues:
1) allocation failure at page fault that causes unrecoverable OOM and
2) a possibility for an unprivileged user to deplete secretmem pool and
cause (1) to others

I'm not really familiar with OOM internals, but when I simulated an
allocation failure in my testing only the allocating process and it's
parent were OOM-killed and then the system continued normally. 

You are right, it would be better if we SIGBUS instead of OOM but I don't
agree SIGBUS is terrible. As we started to draw parallels with hugetlbfs
even despite it's complex reservation system, hugetlb_fault() may fail to
allocate pages from CMA and this still will cause SIGBUS.

And hugetlb pools may be also depleted by anybody by calling
mmap(MAP_HUGETLB) and there is no any limiting knob for this, while
secretmem has RLIMIT_MEMLOCK.

That said, simply replacing VM_FAULT_OOM with VM_FAULT_SIGBUS makes
secretmem at least as controllable and robust than hugeltbfs even without
complex reservation at mmap() time.

> > > So unless I am really misreading the code
> > > Nacked-by: Michal Hocko <mhocko@suse.com>
> > > 
> > > That doesn't mean I reject the whole idea. There are some details to
> > > sort out as mentioned elsewhere but you cannot really depend on
> > > pre-allocated pool which can fail at a fault time like that.
> > 
> > So, to do it similar to hugetlbfs (e.g., with CMA), there would have to be a
> > mechanism to actually try pre-reserving (e.g., from the CMA area), at which
> > point in time the pages would get moved to the secretmem pool, and a
> > mechanism for mmap() etc. to "reserve" from these secretmem pool, such that
> > there are guarantees at fault time?
> 
> yes, reserve at mmap time and use during the fault. But this all sounds
> like a self inflicted problem to me. Sure you can have a pre-allocated
> or more dynamic pool to reduce the direct mapping fragmentation but you
> can always fall back to regular allocatios. In other ways have the pool
> as an optimization rather than a hard requirement. With a careful access
> control this sounds like a manageable solution to me.

I'd really wish we had this discussion for earlier spins of this series,
but since this didn't happen let's refresh the history a bit.

One of the major pushbacks on the first RFC [1] of the concept was about
the direct map fragmentation. I tried really hard to find data that shows
what is the performance difference with different page sizes in the direct
map and I didn't find anything.

So presuming that large pages do provide advantage the first implementation
of secretmem used PMD_ORDER allocations to amortise the effect of the
direct map fragmentation and then handed out 4k pages at each fault. In
addition there was an option to reserve a finite pool at boot time and
limit secretmem allocations only to that pool.

At some point David suggested to use CMA to improve overall flexibility
[3], so I switched secretmem to use CMA.

Now, with the data we have at hand (my benchmarks and Intel's report David
mentioned) I'm even not sure this whole pooling even required.

I like the idea to have a pool as an optimization rather than a hard
requirement but I don't see why would it need a careful access control. As
the direct map fragmentation is not necessarily degrades the performance
(and even sometimes it actually improves it) and even then the degradation
is small, trying a PMD_ORDER allocation for a pool and then falling back to
4K page may be just fine.

I think we could have something like this (error handling is mostly
omitted):

static int secretmem_pool_increase(struct secretmem_ctx *ctx, gfp_t gfp)
{
	struct page *page = alloc_pages(gfp, PMD_PAGE_ORDER);

	if (!page)
		return -ENOMEM;

	/* add large page to pool */
	
	return 0;
}

static struct page *secretmem_alloc_page(struct secretmem_ctx *ctx,
					 gfp_t gfp)
{
	struct page *page;
	...

	if (gen_pool_avail(pool) < PAGE_SIZE) {
		err = secretmem_pool_increase(ctx, gfp);
		if (!err) {
			addr = gen_pool_alloc(pool, PAGE_SIZE);
			if (addr)
				page = virt_to_page(addr);
		}
	}

	if (!page)
		page = alloc_page(gfp);

	return page;	
}

[1] https://lore.kernel.org/lkml/1572171452-7958-1-git-send-email-rppt@kernel.org/
[2] https://lore.kernel.org/lkml/20200720092435.17469-1-rppt@kernel.org/
[3] https://lore.kernel.org/lkml/03ec586d-c00c-c57e-3118-7186acb7b823@redhat.com/#t

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
