Return-Path: <SRS0=TFiT=G7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C70C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 13:01:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4124B64DD8
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 13:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4124B64DD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jxyyJjvAZRqlZG0Q4GXjacbXxh/dRBXTiUqd37osikc=; b=F0ypJanpa1p7CzQ9XcMfqngle
	es2l1+/FKg6O4EO9xKBccGBN4CXXNw+gCr3z9QHyKkIcjJxE/nAbHf2gBfoPc9DJpSOIWvc971zHT
	frGBZae7dEsBJoq81iYD+0UQjraNh/H6Y7DQt2NRkibVa+H0ykglbY+tFORZKZ0I26IJPy/b7AjwE
	1u+W+Yd7iq6coKtrLff3yn8TaBX9GW6W+4l8TsbuSz3bf+qV9zSBwXp37oGD6BHnRxlSdoWsJZsoI
	SwaNWZbGyfmvLk3zjUI7EhM4i2RsC0wde4j4kmDOEwfRpEjefm29mgRxpsFv2fO5NRYUVHotn6paX
	0l+Z/LZng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l56vE-0004lR-Vh; Thu, 28 Jan 2021 13:01:17 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l56v8-0004jT-Gt; Thu, 28 Jan 2021 13:01:12 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1611838867; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vJt24NNAalCKv4rVDS2NDaUKT5dH4I+q/BbkjyVKFas=;
 b=rIpkGAScsHGELAFRulv4V5GPLX8Fe3xWhurZF6bgCmSiVv4UgjaRPQqEv2RCkHxJlrAsoN
 Lz5A7u3DqPIrgoJhJlC5dpcIL9LlLQGEGCmT7XeNDqmogifq0K6BdZXNTT0uXoQHYRUWbZ
 KvYFdrDmwtb1rJfxtMH3Yh/efBvnMhg=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A6D68AE47;
 Thu, 28 Jan 2021 13:01:07 +0000 (UTC)
Date: Thu, 28 Jan 2021 14:01:06 +0100
From: Michal Hocko <mhocko@suse.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v16 07/11] secretmem: use PMD-size pages to amortize
 direct map fragmentation
Message-ID: <YBK1kqL7JA7NePBQ@dhcp22.suse.cz>
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-8-rppt@kernel.org>
 <20210126114657.GL827@dhcp22.suse.cz>
 <303f348d-e494-e386-d1f5-14505b5da254@redhat.com>
 <20210126120823.GM827@dhcp22.suse.cz>
 <20210128092259.GB242749@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210128092259.GB242749@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_080110_798070_5F57D68C 
X-CRM114-Status: GOOD (  49.67  )
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

On Thu 28-01-21 11:22:59, Mike Rapoport wrote:
> On Tue, Jan 26, 2021 at 01:08:23PM +0100, Michal Hocko wrote:
> > On Tue 26-01-21 12:56:48, David Hildenbrand wrote:
> > > On 26.01.21 12:46, Michal Hocko wrote:
> > > > On Thu 21-01-21 14:27:19, Mike Rapoport wrote:
> > > > > From: Mike Rapoport <rppt@linux.ibm.com>
> > > > > 
> > > > > Removing a PAGE_SIZE page from the direct map every time such page is
> > > > > allocated for a secret memory mapping will cause severe fragmentation of
> > > > > the direct map. This fragmentation can be reduced by using PMD-size pages
> > > > > as a pool for small pages for secret memory mappings.
> > > > > 
> > > > > Add a gen_pool per secretmem inode and lazily populate this pool with
> > > > > PMD-size pages.
> > > > > 
> > > > > As pages allocated by secretmem become unmovable, use CMA to back large
> > > > > page caches so that page allocator won't be surprised by failing attempt to
> > > > > migrate these pages.
> > > > > 
> > > > > The CMA area used by secretmem is controlled by the "secretmem=" kernel
> > > > > parameter. This allows explicit control over the memory available for
> > > > > secretmem and provides upper hard limit for secretmem consumption.
> > > > 
> > > > OK, so I have finally had a look at this closer and this is really not
> > > > acceptable. I have already mentioned that in a response to other patch
> > > > but any task is able to deprive access to secret memory to other tasks
> > > > and cause OOM killer which wouldn't really recover ever and potentially
> > > > panic the system. Now you could be less drastic and only make SIGBUS on
> > > > fault but that would be still quite terrible. There is a very good
> > > > reason why hugetlb implements is non-trivial reservation system to avoid
> > > > exactly these problems.
> 
> So, if I understand your concerns correct this implementation has two
> issues:
> 1) allocation failure at page fault that causes unrecoverable OOM and
> 2) a possibility for an unprivileged user to deplete secretmem pool and
> cause (1) to others
> 
> I'm not really familiar with OOM internals, but when I simulated an
> allocation failure in my testing only the allocating process and it's
> parent were OOM-killed and then the system continued normally. 

If you kill the allocating process then yes, it would work, but your
process might be the very last to be selected.

> You are right, it would be better if we SIGBUS instead of OOM but I don't
> agree SIGBUS is terrible. As we started to draw parallels with hugetlbfs
> even despite it's complex reservation system, hugetlb_fault() may fail to
> allocate pages from CMA and this still will cause SIGBUS.

This is an unexpected runtime error. Unless you make it an integral part
of the API design.

> And hugetlb pools may be also depleted by anybody by calling
> mmap(MAP_HUGETLB) and there is no any limiting knob for this, while
> secretmem has RLIMIT_MEMLOCK.

Yes it can fail. But it would fail at the mmap time when the reservation
fails. Not during the #PF time which can be at any time.

> That said, simply replacing VM_FAULT_OOM with VM_FAULT_SIGBUS makes
> secretmem at least as controllable and robust than hugeltbfs even without
> complex reservation at mmap() time.

Still sucks huge!

> > > > So unless I am really misreading the code
> > > > Nacked-by: Michal Hocko <mhocko@suse.com>
> > > > 
> > > > That doesn't mean I reject the whole idea. There are some details to
> > > > sort out as mentioned elsewhere but you cannot really depend on
> > > > pre-allocated pool which can fail at a fault time like that.
> > > 
> > > So, to do it similar to hugetlbfs (e.g., with CMA), there would have to be a
> > > mechanism to actually try pre-reserving (e.g., from the CMA area), at which
> > > point in time the pages would get moved to the secretmem pool, and a
> > > mechanism for mmap() etc. to "reserve" from these secretmem pool, such that
> > > there are guarantees at fault time?
> > 
> > yes, reserve at mmap time and use during the fault. But this all sounds
> > like a self inflicted problem to me. Sure you can have a pre-allocated
> > or more dynamic pool to reduce the direct mapping fragmentation but you
> > can always fall back to regular allocatios. In other ways have the pool
> > as an optimization rather than a hard requirement. With a careful access
> > control this sounds like a manageable solution to me.
> 
> I'd really wish we had this discussion for earlier spins of this series,
> but since this didn't happen let's refresh the history a bit.

I am sorry but I am really fighting to find time to watch for all the
moving targets...

> One of the major pushbacks on the first RFC [1] of the concept was about
> the direct map fragmentation. I tried really hard to find data that shows
> what is the performance difference with different page sizes in the direct
> map and I didn't find anything.
> 
> So presuming that large pages do provide advantage the first implementation
> of secretmem used PMD_ORDER allocations to amortise the effect of the
> direct map fragmentation and then handed out 4k pages at each fault. In
> addition there was an option to reserve a finite pool at boot time and
> limit secretmem allocations only to that pool.
> 
> At some point David suggested to use CMA to improve overall flexibility
> [3], so I switched secretmem to use CMA.
> 
> Now, with the data we have at hand (my benchmarks and Intel's report David
> mentioned) I'm even not sure this whole pooling even required.

I would still like to understand whether that data is actually
representative. With some underlying reasoning rather than I have run
these XYZ benchmarks and numbers do not look terrible.

> I like the idea to have a pool as an optimization rather than a hard
> requirement but I don't see why would it need a careful access control. As
> the direct map fragmentation is not necessarily degrades the performance
> (and even sometimes it actually improves it) and even then the degradation
> is small, trying a PMD_ORDER allocation for a pool and then falling back to
> 4K page may be just fine.

Well, as soon as this is a scarce resource then an access control seems
like a first thing to think of. Maybe it is not really necessary but
then this should be really justified.

I am also still not sure why this whole thing is not just a
ramdisk/ramfs which happens to unmap its pages from the direct
map. Wouldn't that be a much more easier model to work with? You would
get an access control for free as well.
-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
