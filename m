Return-Path: <SRS0=yqCT=HA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD0AC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jan 2021 08:51:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A08D64E13
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jan 2021 08:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A08D64E13
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VVloBDQTlINlCbIM6eXUQuxPxL4ap70FmzMLIMcqSFY=; b=ySpgxhBxCz5BMfMGFXTh5G3n3
	EPgWfd6H9IOcRSwa5uuYVbvq9aTj7WlMmqfsk0rR0otCvhIcyAe/rkJZsSVhxR6Utnzxj8ocH0/Yw
	nkaPXidoxB1BYHQWR3A9tsT3Ad1Z1nq43MoInbkzTnKtYF4wngz3St5VFu26obozBlKm7I5lU5lXw
	+KMUpyFZowtaRyQrS+LD1bmwNgQ6Rz/9OtflhDFPWmwkw4cOPCNYfThtNTn1U3SFqnCR+wNUR0QYJ
	8XGC07QkyObm7MaZYQjbztDp7VxZDwDNFMtnN7sS+FNoWGVb7S5PmgIwO6fS3cXHadDE5NkEyP4qh
	lU6CP3jhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5PVD-0008N7-FD; Fri, 29 Jan 2021 08:51:39 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5PUs-0008Er-F6; Fri, 29 Jan 2021 08:51:21 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1611910277; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oz5cMvs61w9nxAoe4HzR3mysk0/Hr5mRI47kmCm2DS0=;
 b=JlAN3/6ogutWOafvXtaRPUY2CcqVH8YluGJuxVw3j5M8pdVfxjPuXWqJ1TpSUCsjvBL8Jh
 hawPaBwcHUKIexzg5OBrQB9L0nFn7he5WG1sTy30AdaWWlyFyJAU8bOKTbKEvAVjrh2dU9
 LZzhuvObvkNyN52W4YE1B2PWXA7ohhg=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C1ABBACB0;
 Fri, 29 Jan 2021 08:51:16 +0000 (UTC)
Date: Fri, 29 Jan 2021 09:51:15 +0100
From: Michal Hocko <mhocko@suse.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v16 07/11] secretmem: use PMD-size pages to amortize
 direct map fragmentation
Message-ID: <YBPMg/C5Sb78gFEB@dhcp22.suse.cz>
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-8-rppt@kernel.org>
 <20210126114657.GL827@dhcp22.suse.cz>
 <303f348d-e494-e386-d1f5-14505b5da254@redhat.com>
 <20210126120823.GM827@dhcp22.suse.cz>
 <20210128092259.GB242749@kernel.org>
 <YBK1kqL7JA7NePBQ@dhcp22.suse.cz>
 <20210129072128.GD242749@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210129072128.GD242749@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_035118_836103_B214B78D 
X-CRM114-Status: GOOD (  34.93  )
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

On Fri 29-01-21 09:21:28, Mike Rapoport wrote:
> On Thu, Jan 28, 2021 at 02:01:06PM +0100, Michal Hocko wrote:
> > On Thu 28-01-21 11:22:59, Mike Rapoport wrote:
> > 
> > > And hugetlb pools may be also depleted by anybody by calling
> > > mmap(MAP_HUGETLB) and there is no any limiting knob for this, while
> > > secretmem has RLIMIT_MEMLOCK.
> > 
> > Yes it can fail. But it would fail at the mmap time when the reservation
> > fails. Not during the #PF time which can be at any time.
> 
> It may fail at $PF time as well:
> 
> hugetlb_fault()
>         hugeltb_no_page()
>                 ...
>                 alloc_huge_page()
>                         alloc_gigantic_page()
>                                 cma_alloc()
>                                         -ENOMEM; 

I would have to double check. From what I remember cma allocator is an
optimization to increase chances to allocate hugetlb pages when
overcommiting because pages should be normally pre-allocated in the pool
and reserved during mmap time. But even if a hugetlb page is not pre
allocated then this will get propagated as SIGBUS unless that has
changed.
  
> > > That said, simply replacing VM_FAULT_OOM with VM_FAULT_SIGBUS makes
> > > secretmem at least as controllable and robust than hugeltbfs even without
> > > complex reservation at mmap() time.
> > 
> > Still sucks huge!
>  
> Any #PF can get -ENOMEM for whatever reason. Sucks huge indeed.

I certainly can. But it doesn't in practice because most allocations
will simply not fail and rather invoke OOM killer directly. Maybe there
are cases which still might fail (higher order, weaker reclaim
capabilities etc) but that would result in a bug in the end because the
#PF handler would trigger the oom killer.

[...]
> > I would still like to understand whether that data is actually
> > representative. With some underlying reasoning rather than I have run
> > these XYZ benchmarks and numbers do not look terrible.
> 
> I would also very much like to see, for example, reasoning to enabling 1GB
> pages in the direct map beyond "because we can" (commits 00d1c5e05736
> ("x86: add gbpages switches") and ef9257668e31 ("x86: do kernel direct
> mapping at boot using GB pages")).
> 
> The original Kconfig text for CONFIG_DIRECT_GBPAGES said
> 
>           Enable gigabyte pages support (if the CPU supports it). This can
>           improve the kernel's performance a tiny bit by reducing TLB
>           pressure.
> 
> So it is very interesting how tiny that bit was.

Yeah and that sucks! Because it is leaving us with speculations now. I
hope you do not want to repeat the same mistake now and leave somebody
in the future in the same situation.

> > > I like the idea to have a pool as an optimization rather than a hard
> > > requirement but I don't see why would it need a careful access control. As
> > > the direct map fragmentation is not necessarily degrades the performance
> > > (and even sometimes it actually improves it) and even then the degradation
> > > is small, trying a PMD_ORDER allocation for a pool and then falling back to
> > > 4K page may be just fine.
> > 
> > Well, as soon as this is a scarce resource then an access control seems
> > like a first thing to think of. Maybe it is not really necessary but
> > then this should be really justified.
> 
> And what being a scarce resource here?

A fixed size pool shared by all users of this feature.

> If we consider lack of the direct
> map fragmentation as this resource, there enough measures secretmem
> implements to limit user ability to fragment the direct map, as was already
> discussed several times. Global limit, memcg and rlimit provide enough
> access control already.

Try to do a simple excercise. You have X amout of secret memory. How do
you distribute that to all interested users (some of them adversaries)
based on the above. Global limit is a DoS vector potentially, memcg is a
mixed bag of all other memory and it would become really tricky to
enforece proportion of the X while having other memory consumed and
rlimit is per process rather than per user.

Look at how hugetlb had to develop its cgroup controler to distribute
the pool among workloads. Then it has turned out that even reservations
have to be per workload. Quite a convoluted stuff evolved around that
feature because it turned out that the initial assumption that only few
users would be using the pool simply didn't pass the reality check.

As I've mentioned in other response to James. If the direct map
manipulation is not as big of a problem as most of us dogmatically
believed then things become much simpler. There is no need for global
pool and you are back to mlock kinda model.
-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
