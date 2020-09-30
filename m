Return-Path: <SRS0=Qujn=DH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F93C4727C
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2020 15:09:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B64F206FC
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2020 15:09:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wHHMLmO8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BuH49sEn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B64F206FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m0XU5sCJ8S/vdpghH0gO5ZYxlNnUGrH1euI8HW7AZFs=; b=wHHMLmO8hapRwsccKeKPuRMWV
	n4k9nDrZh9tnO0YdTsQ31Hef0uuBWA9RzoC75fnayiyYNduLna+TgwNDOE+/tRGHye2ht/awtg0LQ
	lEFUeuRoyUfYbftqqeOfO0rUr+5FvY243HMEbzCpd1Dj+Uv6FP24/4lo3cvhpHuLU8qXdjn+dWpe7
	X65TviGwrb17aYEJxDHufl5Y+A8DMxfGWj4sbB7r77JZUON29Bmru3Mp3Hr1VI1yRvBfMmaaHR5/o
	fiUHPu0EKlD86a7vMZnhFzPFvPE2BYy8NBQwB3DOGtFpDq165odYZge+c3yneBaMo82ECPB8onuvd
	8a6OrvsgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNdje-00038T-QH; Wed, 30 Sep 2020 15:09:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNdjb-00037i-3e; Wed, 30 Sep 2020 15:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=5MQ9wWjMl2wFlC5FFeBBoGdxqFKxERQlgHCfOe6SJqc=; b=BuH49sEnpXdPdqBuzbVs2V633x
 nj0QNsnZGyV7Ur1XjcD+GgLOUPiioSSgYAd5LQANsJHnqdR8DPJWazR4b6fyMIXitNoG7i2qACEk+
 x90zdteFRAk01MpO/bR6H/INrJI1XI2Z43TfeD0w4o67kW8JKU7F7v72SRgVVditUoo8hvSGVzDht
 IAsFpsrXy2rohggWiPlFlZ49/3gB8uDSMyALzcjv+0EyTng6cu9mrYkRLaKyDQJSYJSgaeqtXpg7T
 r4qwLvOvtVk6qnTcZdu5tJ+aiAkiq/I/XPzY9EzutGsKlZpzzVHG+lZEakQO08fZJbB9Z3UwWnHbB
 qlCH3W+Q==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kNdjU-0007EC-6u; Wed, 30 Sep 2020 15:09:28 +0000
Date: Wed, 30 Sep 2020 16:09:28 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH v6 5/6] mm: secretmem: use PMD-size pages to amortize
 direct map fragmentation
Message-ID: <20200930150928.GR20115@casper.infradead.org>
References: <20200924132904.1391-1-rppt@kernel.org>
 <20200924132904.1391-6-rppt@kernel.org>
 <20200925074125.GQ2628@hirez.programming.kicks-ass.net>
 <20200929130529.GE2142832@kernel.org>
 <20200929141216.GO2628@hirez.programming.kicks-ass.net>
 <20200929145813.GA3226834@linux.ibm.com>
 <20200929151552.GS2628@hirez.programming.kicks-ass.net>
 <20200930102745.GC3226834@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930102745.GC3226834@linux.ibm.com>
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
 Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Shuah Khan <shuah@kernel.org>, x86@kernel.org, linux-riscv@lists.infradead.org,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Sep 30, 2020 at 01:27:45PM +0300, Mike Rapoport wrote:
> On Tue, Sep 29, 2020 at 05:15:52PM +0200, Peter Zijlstra wrote:
> > On Tue, Sep 29, 2020 at 05:58:13PM +0300, Mike Rapoport wrote:
> > > On Tue, Sep 29, 2020 at 04:12:16PM +0200, Peter Zijlstra wrote:
> > 
> > > > It will drop them down to 4k pages. Given enough inodes, and allocating
> > > > only a single sekrit page per pmd, we'll shatter the directmap into 4k.
> > > 
> > > Why? Secretmem allocates PMD-size page per inode and uses it as a pool
> > > of 4K pages for that inode. This way it ensures that
> > > __kernel_map_pages() is always called on PMD boundaries.
> > 
> > Oh, you unmap the 2m page upfront? I read it like you did the unmap at
> > the sekrit page alloc, not the pool alloc side of things.
> > 
> > Then yes, but then you're wasting gobs of memory. Basically you can pin
> > 2M per inode while only accounting a single page.
> 
> Right, quite like THP :)

Huh?  THP accounts every page it allocates.  If you allocate 2MB,
it accounts 512 pages.  And THP are reclaimable by vmscan, this is
obviously not.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
