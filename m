Return-Path: <SRS0=Z1AH=DC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 583C9C47420
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2020 09:50:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F8682074B
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2020 09:50:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TJ3HgWGb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F8682074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1PocxFZIkT9tCsHPGdZ8Dah0pCK56l1wuazNYTTHZCg=; b=TJ3HgWGbMIZ2bqgj2Jk8s8ULw
	t1Tv1fZTdoGdeg5H+QsdyBeYn64ydT9Y00Rvoyw8R9veUtKzYAa20YrQyhw5A1zm3OkwLdhmNBKfA
	RLU99RAcgMqZmPVy/U8H9TIcOVYYQSL8V4Ipm8hYeQZZCLpLd4IjSbco13ffLIMrV/tJIYInZfb88
	o/LSfb/ofnG6b3XjaqxhC11+VzfsaruqAfO4K6jfnN1nogpGzgVIOSpe6NvFP7sNcyXnRbdQFeV2f
	1U7tzRRbU+TTh80uXLePvfWFDATC+NtwoYjvCUzgjy/mqQV2sJHCQqbcD0nERcIphdpK1wKRpsuaD
	UZeibNaQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLkNB-00010S-Ez; Fri, 25 Sep 2020 09:50:37 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLkN6-0000zO-FY; Fri, 25 Sep 2020 09:50:32 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D5927301A27;
 Fri, 25 Sep 2020 11:50:29 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id BEFA320104626; Fri, 25 Sep 2020 11:50:29 +0200 (CEST)
Date: Fri, 25 Sep 2020 11:50:29 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v6 5/6] mm: secretmem: use PMD-size pages to amortize
 direct map fragmentation
Message-ID: <20200925095029.GX2628@hirez.programming.kicks-ass.net>
References: <20200924132904.1391-1-rppt@kernel.org>
 <20200924132904.1391-6-rppt@kernel.org>
 <20200925074125.GQ2628@hirez.programming.kicks-ass.net>
 <8435eff6-7fa9-d923-45e5-d8850e4c6d73@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8435eff6-7fa9-d923-45e5-d8850e4c6d73@redhat.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
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
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 25, 2020 at 11:00:30AM +0200, David Hildenbrand wrote:
> On 25.09.20 09:41, Peter Zijlstra wrote:
> > On Thu, Sep 24, 2020 at 04:29:03PM +0300, Mike Rapoport wrote:
> >> From: Mike Rapoport <rppt@linux.ibm.com>
> >>
> >> Removing a PAGE_SIZE page from the direct map every time such page is
> >> allocated for a secret memory mapping will cause severe fragmentation of
> >> the direct map. This fragmentation can be reduced by using PMD-size pages
> >> as a pool for small pages for secret memory mappings.
> >>
> >> Add a gen_pool per secretmem inode and lazily populate this pool with
> >> PMD-size pages.
> > 
> > What's the actual efficacy of this? Since the pmd is per inode, all I
> > need is a lot of inodes and we're in business to destroy the directmap,
> > no?
> > 
> > Afaict there's no privs needed to use this, all a process needs is to
> > stay below the mlock limit, so a 'fork-bomb' that maps a single secret
> > page will utterly destroy the direct map.
> > 
> > I really don't like this, at all.
> 
> As I expressed earlier, I would prefer allowing allocation of secretmem
> only from a previously defined CMA area. This would physically locally
> limit the pain.

Given that this thing doesn't have a migrate hook, that seems like an
eminently reasonable contraint. Because not only will it mess up the
directmap, it will also destroy the ability of the page-allocator /
compaction to re-form high order blocks by sprinkling holes throughout.

Also, this is all very close to XPFO, yet I don't see that mentioned
anywhere.

Further still, it has this HAVE_SECRETMEM_UNCACHED nonsense which is
completely unused. I'm not at all sure exposing UNCACHED to random
userspace is a sane idea.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
