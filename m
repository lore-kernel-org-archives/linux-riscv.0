Return-Path: <SRS0=qpiA=EI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B43C388F9
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2020 17:43:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF03E21D91
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2020 17:43:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qNBRyvXo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WaQHhcNI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF03E21D91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iQ+/oLMjheeaQcY3vazGZnrcIFvxOdZuGOWYZl8HlP4=; b=qNBRyvXoDFwpbYZgO0CR46xwH
	oBwkbHTaCVKID8NSXeqB6ofC5f5nYISULukPdefsYEYpMk2kYjOQBZJl2D+ZKS71cI4tF+/ZHOUrt
	C0EjHfZEyplSmQUNOcs294+xGMT+gAMyf3eWi4cIJhZiVsgpz7RWHQUGIB5eBNbN0eKTRJ47ieuS6
	ESiZhdVn59TVPCYFQ+LlHAuj9eAFuSBZFyE9zPZBYdDSTLyvTxqWJ8e3UZShfexfFWu2HcdiuO6wn
	b7CKr0e9QCeG/IxYlt1st7bz0Zic77UkQ+lG04IDhqD01p2N/tku+iDg47AD22OEfYkktxs31ds5R
	JybJoZHrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZdrd-00044Y-IK; Mon, 02 Nov 2020 17:43:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZdrY-00042M-Mi; Mon, 02 Nov 2020 17:43:26 +0000
Received: from kernel.org (unknown [87.71.17.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F163621D91;
 Mon,  2 Nov 2020 17:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604339002;
 bh=4lTOK6nJwjmoOAObnnRBOTKd0fl9eQpxyGZlvj7NIPU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WaQHhcNIPlO/3Y1BDKIiRptwVm/gNfTOsggLuTFWgEEfzGk4JpghqGJiTK1uJXPww
 xcrmfo2wowW6SunTYD97zxQcWOPYPEwCUuK+Opbf1HTskJ6CenmFJitmkrFyumA+RF
 614VdGzOVlHHOfs2z6uhOZXESicNeUeTW56l5apA=
Date: Mon, 2 Nov 2020 19:43:08 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v6 0/6] mm: introduce memfd_secret system call to create
 "secret" memory areas
Message-ID: <20201102174308.GF4879@kernel.org>
References: <20200924132904.1391-1-rppt@kernel.org>
 <9c38ac3b-c677-6a87-ce82-ec53b69eaf71@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9c38ac3b-c677-6a87-ce82-ec53b69eaf71@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_124325_007440_A70648C5 
X-CRM114-Status: GOOD (  37.56  )
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
 Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Shuah Khan <shuah@kernel.org>, x86@kernel.org,
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

On Mon, Nov 02, 2020 at 10:11:12AM +0100, David Hildenbrand wrote:
> On 24.09.20 15:28, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > Hi,
> > 
> > This is an implementation of "secret" mappings backed by a file descriptor.
> > I've dropped the boot time reservation patch for now as it is not strictly
> > required for the basic usage and can be easily added later either with or
> > without CMA.
> 
> Hi Mike,
> 
> I'd like to stress again that I'd prefer *any* secretmem allocations going
> via CMA as long as these pages are unmovable. The user can allocate a
> non-significant amount of unmovable allocations only fenced by the mlock
> limit, which behave very different to mlocked pages - they are not movable
> for page compaction/migration.
> 
> Assume you have a system with quite some ZONE_MOVABLE memory (esp. in
> virtualized environments), eating up a significant amount of !ZONE_MOVABLE
> memory dynamically at runtime can lead to non-obvious issues. It looks like
> you have plenty of free memory, but the kernel might still OOM when trying
> to do kernel allocations e.g., for pagetables. With CMA we at least know
> what we're dealing with - it behaves like ZONE_MOVABLE except for the owner
> that can place unmovable pages there. We can use it to compute statically
> the amount of ZONE_MOVABLE memory we can have in the system without doing
> harm to the system.

Why would you say that secretmem allocates from !ZONE_MOVABLE?
If we put boot time reservations aside, the memory allocation for
secretmem follows the same rules as the memory allocations for any file
descriptor. That means we allocate memory with GFP_HIGHUSER_MOVABLE.
After the allocation the memory indeed becomes unmovable but it's not
like we are eating memory from other zones here.

Maybe I'm missing something, but it seems to me that using CMA for any
secretmem allocation would needlessly complicate things.

> Ideally, we would want to support page migration/compaction and allow for
> allocation from ZONE_MOVABLE as well. Would involve temporarily mapping,
> copying, unmapping. Sounds feasible, but not sure which roadblocks we would
> find on the way.

We can support migration/compaction with temporary mapping. The first
roadblock I've hit there was that migration allocates 4K destination
page and if we use it in secret map we are back to scrambling the direct
map into 4K pieces. It still sounds feasible but not as trivial :)

But again, there is nothing in the current form of secretmem that
prevents allocation from ZONE_MOVABLE.

> [...]
> 
> > I've hesitated whether to continue to use new flags to memfd_create() or to
> > add a new system call and I've decided to use a new system call after I've
> > started to look into man pages update. There would have been two completely
> > independent descriptions and I think it would have been very confusing.
> 
> This was also raised on lwn.net by "dullfire" [1]. I do wonder if it would
> be the right place as well.

I lean towards a dedicated syscall because, as I said, to me it would
seem less confusing.

> [1] https://lwn.net/Articles/835342/#Comments
> 
> > 
> > Hiding secret memory mappings behind an anonymous file allows (ab)use of
> > the page cache for tracking pages allocated for the "secret" mappings as
> > well as using address_space_operations for e.g. page migration callbacks.
> > 
> > The anonymous file may be also used implicitly, like hugetlb files, to
> > implement mmap(MAP_SECRET) and use the secret memory areas with "native" mm
> > ABIs in the future.
> > 
> > As the fragmentation of the direct map was one of the major concerns raised
> > during the previous postings, I've added an amortizing cache of PMD-size
> > pages to each file descriptor that is used as an allocation pool for the
> > secret memory areas.

-- 
Sincerely yours,
Mike.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
