Return-Path: <SRS0=aBv4=DG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F99C4727D
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2020 14:12:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C1A6206C1
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2020 14:12:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GpNZuH//"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C1A6206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UPOvp6YMjpTA40A7GcVpem+kmr5GeYsDUdL17xeNlR8=; b=GpNZuH//JsyN1dWBkvn/zd5UF
	6rJSNZvuNIZLHoCpIhVMvMeqljJnTmg/hRTV30iuqNCHARBMe2LKvO070rrwzcicRG3qZtmHYjDFX
	//+RzNM3SAfAsF01aopdHcglPrdn+TYX4XkLJ4BvVKcY3WKmgNmOyRB6yfybh+bK+avKM643ax4M1
	qIXzLkqsfUS0cz8Mog46rocNF6wgk95J17WA7ocIVf3h9HbCdv5izKUSXK1ZR2reypCuVOj0jWD9/
	wWpKhMaZde46XFGmTa/YJhY5fit5PbZlAGekPEDw7yw4xAAIf84wdwMKhAJLr9yh28drMLfSJf8dx
	LTF2Z9xHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNGMn-0006bO-Ad; Tue, 29 Sep 2020 14:12:29 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNGMf-0006Z5-8p; Tue, 29 Sep 2020 14:12:21 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 2E2C9303F45;
 Tue, 29 Sep 2020 16:12:16 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 1F4DD2022B66B; Tue, 29 Sep 2020 16:12:16 +0200 (CEST)
Date: Tue, 29 Sep 2020 16:12:16 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v6 5/6] mm: secretmem: use PMD-size pages to amortize
 direct map fragmentation
Message-ID: <20200929141216.GO2628@hirez.programming.kicks-ass.net>
References: <20200924132904.1391-1-rppt@kernel.org>
 <20200924132904.1391-6-rppt@kernel.org>
 <20200925074125.GQ2628@hirez.programming.kicks-ass.net>
 <20200929130529.GE2142832@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929130529.GE2142832@kernel.org>
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

On Tue, Sep 29, 2020 at 04:05:29PM +0300, Mike Rapoport wrote:
> On Fri, Sep 25, 2020 at 09:41:25AM +0200, Peter Zijlstra wrote:
> > On Thu, Sep 24, 2020 at 04:29:03PM +0300, Mike Rapoport wrote:
> > > From: Mike Rapoport <rppt@linux.ibm.com>
> > > 
> > > Removing a PAGE_SIZE page from the direct map every time such page is
> > > allocated for a secret memory mapping will cause severe fragmentation of
> > > the direct map. This fragmentation can be reduced by using PMD-size pages
> > > as a pool for small pages for secret memory mappings.
> > > 
> > > Add a gen_pool per secretmem inode and lazily populate this pool with
> > > PMD-size pages.
> > 
> > What's the actual efficacy of this? Since the pmd is per inode, all I
> > need is a lot of inodes and we're in business to destroy the directmap,
> > no?
> > 
> > Afaict there's no privs needed to use this, all a process needs is to
> > stay below the mlock limit, so a 'fork-bomb' that maps a single secret
> > page will utterly destroy the direct map.
> 
> This indeed will cause 1G pages in the direct map to be split into 2M
> chunks, but I disagree with 'destroy' term here. Citing the cover letter
> of an earlier version of this series:

It will drop them down to 4k pages. Given enough inodes, and allocating
only a single sekrit page per pmd, we'll shatter the directmap into 4k.

>   I've tried to find some numbers that show the benefit of using larger
>   pages in the direct map, but I couldn't find anything so I've run a
>   couple of benchmarks from phoronix-test-suite on my laptop (i7-8650U
>   with 32G RAM).

Existing benchmarks suck at this, but FB had a load that had a
deterministic enough performance regression to bisect to a directmap
issue, fixed by:

  7af0145067bc ("x86/mm/cpa: Prevent large page split when ftrace flips RW on kernel text")

>   I've tested three variants: the default with 28G of the physical
>   memory covered with 1G pages, then I disabled 1G pages using
>   "nogbpages" in the kernel command line and at last I've forced the
>   entire direct map to use 4K pages using a simple patch to
>   arch/x86/mm/init.c.  I've made runs of the benchmarks with SSD and
>   tmpfs.
>   
>   Surprisingly, the results does not show huge advantage for large
>   pages. For instance, here the results for kernel build with
>   'make -j8', in seconds:

Your benchmark should stress the TLB of your uarch, such that additional
pressure added by the shattered directmap shows up.

And no, I don't have one either.

>                         |  1G    |  2M    |  4K
>   ----------------------+--------+--------+---------
>   ssd, mitigations=on	| 308.75 | 317.37 | 314.9
>   ssd, mitigations=off	| 305.25 | 295.32 | 304.92
>   ram, mitigations=on	| 301.58 | 322.49 | 306.54
>   ram, mitigations=off	| 299.32 | 288.44 | 310.65

These results lack error data, but assuming the reults are significant,
then this very much makes a case for 1G mappings. 5s on a kernel builds
is pretty good.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
