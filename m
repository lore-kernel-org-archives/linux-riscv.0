Return-Path: <SRS0=yqCT=HA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B7A4C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jan 2021 07:22:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF74664E02
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jan 2021 07:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF74664E02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rK4NSdRFarqVT27Y5Yb20rLiukCGBccvsYXLSv4Bc0E=; b=Ioym+9btn+0aXw1tj/zLhLZp1
	VFokofTgnCjCKnWvm7pxky4GMKqTHwzRgHv7Rjxk6QpC/NVCDUV5CCni8xMSdfwZOlasTAqiU0x96
	RE90dWiAMvdtOLck5U4BYQuHd4AiGOg4WpU+LHKeGCi1LjQMlIxzjd9HpJh+7zGy+zkZkQjNeX1od
	LPM4d/J3fvzUjR54rVUZ9H8j7t+kam5Rk8YJa7fr1BrTz3BEmEUofAQ88IF5R4aSZy0JV+MR4IW7/
	2wnOtpoppip28JzK3a+s8sNXnn2XunCsB5wCnUQiQbyFSgPee+EwajP6O2FWEhGKSoJHrycTiGRFp
	Ci38u8OXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5O6L-0001Ma-Uk; Fri, 29 Jan 2021 07:21:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5O6G-0001L2-5s; Fri, 29 Jan 2021 07:21:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AFF4764DFF;
 Fri, 29 Jan 2021 07:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611904906;
 bh=NGPVE0T2yDfzE3jsleZ51uyBOURj43/DKZo4DEUYgL4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a64cCYp6LVDN9rc75p+01u8IW5fw/bN2EdsNx+IABYTwj1i4JOBtzJvRknWyJc/J7
 T52AuZy7pyjPKZ7QZu+wKtBfqCmigfwc/Dvz3QN7mz43ePh5UhCDDbWOD1E5YGhGzV
 wPbtwiDgaLzyUeLcdUi+JOYIp31MvzVMMRWuhINnli/F66n9915eRLn0EOIFyB4ZO8
 wlmLxu9iLOV8KiftxFouX4rgVx232aCXqGGzNxLKwDd9wpXTDoFGFkXI0knbjgu+Ij
 uSrdbgHPpUkaQkJEWC9FddlNhYIa66q3F5imgc1LAIfa+9f41PojeHOXz2yia5DWYQ
 0OIfdJEzC+XGA==
Date: Fri, 29 Jan 2021 09:21:28 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v16 07/11] secretmem: use PMD-size pages to amortize
 direct map fragmentation
Message-ID: <20210129072128.GD242749@kernel.org>
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-8-rppt@kernel.org>
 <20210126114657.GL827@dhcp22.suse.cz>
 <303f348d-e494-e386-d1f5-14505b5da254@redhat.com>
 <20210126120823.GM827@dhcp22.suse.cz>
 <20210128092259.GB242749@kernel.org>
 <YBK1kqL7JA7NePBQ@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YBK1kqL7JA7NePBQ@dhcp22.suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_022148_442694_9FD393D7 
X-CRM114-Status: GOOD (  41.07  )
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

On Thu, Jan 28, 2021 at 02:01:06PM +0100, Michal Hocko wrote:
> On Thu 28-01-21 11:22:59, Mike Rapoport wrote:
> 
> > And hugetlb pools may be also depleted by anybody by calling
> > mmap(MAP_HUGETLB) and there is no any limiting knob for this, while
> > secretmem has RLIMIT_MEMLOCK.
> 
> Yes it can fail. But it would fail at the mmap time when the reservation
> fails. Not during the #PF time which can be at any time.

It may fail at $PF time as well:

hugetlb_fault()
        hugeltb_no_page()
                ...
                alloc_huge_page()
                        alloc_gigantic_page()
                                cma_alloc()
                                        -ENOMEM; 

 
> > That said, simply replacing VM_FAULT_OOM with VM_FAULT_SIGBUS makes
> > secretmem at least as controllable and robust than hugeltbfs even without
> > complex reservation at mmap() time.
> 
> Still sucks huge!
 
Any #PF can get -ENOMEM for whatever reason. Sucks huge indeed.

> > > > > So unless I am really misreading the code
> > > > > Nacked-by: Michal Hocko <mhocko@suse.com>
> > > > > 
> > > > > That doesn't mean I reject the whole idea. There are some details to
> > > > > sort out as mentioned elsewhere but you cannot really depend on
> > > > > pre-allocated pool which can fail at a fault time like that.
> > > > 
> > > > So, to do it similar to hugetlbfs (e.g., with CMA), there would have to be a
> > > > mechanism to actually try pre-reserving (e.g., from the CMA area), at which
> > > > point in time the pages would get moved to the secretmem pool, and a
> > > > mechanism for mmap() etc. to "reserve" from these secretmem pool, such that
> > > > there are guarantees at fault time?
> > > 
> > > yes, reserve at mmap time and use during the fault. But this all sounds
> > > like a self inflicted problem to me. Sure you can have a pre-allocated
> > > or more dynamic pool to reduce the direct mapping fragmentation but you
> > > can always fall back to regular allocatios. In other ways have the pool
> > > as an optimization rather than a hard requirement. With a careful access
> > > control this sounds like a manageable solution to me.
> > 
> > I'd really wish we had this discussion for earlier spins of this series,
> > but since this didn't happen let's refresh the history a bit.
> 
> I am sorry but I am really fighting to find time to watch for all the
> moving targets...
> 
> > One of the major pushbacks on the first RFC [1] of the concept was about
> > the direct map fragmentation. I tried really hard to find data that shows
> > what is the performance difference with different page sizes in the direct
> > map and I didn't find anything.
> > 
> > So presuming that large pages do provide advantage the first implementation
> > of secretmem used PMD_ORDER allocations to amortise the effect of the
> > direct map fragmentation and then handed out 4k pages at each fault. In
> > addition there was an option to reserve a finite pool at boot time and
> > limit secretmem allocations only to that pool.
> > 
> > At some point David suggested to use CMA to improve overall flexibility
> > [3], so I switched secretmem to use CMA.
> > 
> > Now, with the data we have at hand (my benchmarks and Intel's report David
> > mentioned) I'm even not sure this whole pooling even required.
> 
> I would still like to understand whether that data is actually
> representative. With some underlying reasoning rather than I have run
> these XYZ benchmarks and numbers do not look terrible.

I would also very much like to see, for example, reasoning to enabling 1GB
pages in the direct map beyond "because we can" (commits 00d1c5e05736
("x86: add gbpages switches") and ef9257668e31 ("x86: do kernel direct
mapping at boot using GB pages")).

The original Kconfig text for CONFIG_DIRECT_GBPAGES said

          Enable gigabyte pages support (if the CPU supports it). This can
          improve the kernel's performance a tiny bit by reducing TLB
          pressure.

So it is very interesting how tiny that bit was.
 
> > I like the idea to have a pool as an optimization rather than a hard
> > requirement but I don't see why would it need a careful access control. As
> > the direct map fragmentation is not necessarily degrades the performance
> > (and even sometimes it actually improves it) and even then the degradation
> > is small, trying a PMD_ORDER allocation for a pool and then falling back to
> > 4K page may be just fine.
> 
> Well, as soon as this is a scarce resource then an access control seems
> like a first thing to think of. Maybe it is not really necessary but
> then this should be really justified.

And what being a scarce resource here? If we consider lack of the direct
map fragmentation as this resource, there enough measures secretmem
implements to limit user ability to fragment the direct map, as was already
discussed several times. Global limit, memcg and rlimit provide enough
access control already.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
