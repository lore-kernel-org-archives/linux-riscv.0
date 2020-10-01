Return-Path: <SRS0=Vlvd=DI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64CD5C4727C
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2020 08:15:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1198B20BED
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2020 08:15:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QGLmjz1H";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="k835WoUy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1198B20BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5UFrqCFUoKMl/E3AZahQEaoQwBjB1uts0bFOapScir8=; b=QGLmjz1HmRMqG6HrfI3q3CxpF
	CiwOoFgoEko1ZOZFU/bagZKdLM63p9LfwssaC+78ZkNgjc1tOwdFeozCkqQlIvE4t7cnkFTm+u/w+
	vXM9WkVHit8dJgbhid2TFqFat2fIqkLrAx1V8opA2GPlAMa96R3U10DM5xzSdAMlNW6i7wJ/Wq4la
	pSOMHwSCV1tlkSHT+1vm/hcwp7d6z8moTevZQgIaiY8MftfosPQqiQBB9NF9tz5UC+HlYS0PmmXqy
	eK+jh1iz/qQgpXaslhr3EVsKNhsVHjSfn9NSOD9Hvpp7zuyUYQF1MBd4bhbVKkf794gsAHDC/cfpa
	gN94pwnOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNtjo-000082-L7; Thu, 01 Oct 2020 08:14:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNtjk-00005u-CW; Thu, 01 Oct 2020 08:14:49 +0000
Received: from kernel.org (unknown [87.71.73.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4E72520BED;
 Thu,  1 Oct 2020 08:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601540087;
 bh=OQ5Rl7mvGEVxEAedAezsC2iYk6ORsvLvfeXsvmSGzK4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k835WoUyIOxQs1vszUiMSjhhSn11jUXQ4TGNaslDPJ9EKG6CIPIx1unOuP857BqXd
 F1ArPeyz1k6Gs5CuzXCCFTlGWQZkxC6BH30SPuw/qvNv/yezU2G1NGKT7Dtwd3B07I
 0dXT3c8NBDcUtoxf2jYtr1TPrqgIIGcfASC6m31I=
Date: Thu, 1 Oct 2020 11:14:30 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v6 5/6] mm: secretmem: use PMD-size pages to amortize
 direct map fragmentation
Message-ID: <20201001081430.GA3537283@kernel.org>
References: <20200924132904.1391-1-rppt@kernel.org>
 <20200924132904.1391-6-rppt@kernel.org>
 <20200925074125.GQ2628@hirez.programming.kicks-ass.net>
 <20200929130529.GE2142832@kernel.org>
 <20200929141216.GO2628@hirez.programming.kicks-ass.net>
 <20200929145813.GA3226834@linux.ibm.com>
 <20200929151552.GS2628@hirez.programming.kicks-ass.net>
 <20200930102745.GC3226834@linux.ibm.com>
 <20200930150928.GR20115@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930150928.GR20115@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_041448_564233_F5799FE6 
X-CRM114-Status: GOOD (  23.73  )
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
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Sep 30, 2020 at 04:09:28PM +0100, Matthew Wilcox wrote:
> On Wed, Sep 30, 2020 at 01:27:45PM +0300, Mike Rapoport wrote:
> > On Tue, Sep 29, 2020 at 05:15:52PM +0200, Peter Zijlstra wrote:
> > > On Tue, Sep 29, 2020 at 05:58:13PM +0300, Mike Rapoport wrote:
> > > > On Tue, Sep 29, 2020 at 04:12:16PM +0200, Peter Zijlstra wrote:
> > > 
> > > > > It will drop them down to 4k pages. Given enough inodes, and allocating
> > > > > only a single sekrit page per pmd, we'll shatter the directmap into 4k.
> > > > 
> > > > Why? Secretmem allocates PMD-size page per inode and uses it as a pool
> > > > of 4K pages for that inode. This way it ensures that
> > > > __kernel_map_pages() is always called on PMD boundaries.
> > > 
> > > Oh, you unmap the 2m page upfront? I read it like you did the unmap at
> > > the sekrit page alloc, not the pool alloc side of things.
> > > 
> > > Then yes, but then you're wasting gobs of memory. Basically you can pin
> > > 2M per inode while only accounting a single page.
> > 
> > Right, quite like THP :)
> 
> Huh?  THP accounts every page it allocates.  If you allocate 2MB,
> it accounts 512 pages.

I meant that secremem allocates 2M in advance like THP and not that it
similar because only page is accounted.
Anyway, the intention was to account the entrire 2M chunk (512 pages),
so I'll recheck the accounting and I'll fix it if I missed something.

> And THP are reclaimable by vmscan, this is obviously not.

True, this is more like mlock in that sense.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
