Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224F3606CB3F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 12:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GearsWT1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=oFz0dNxn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dSJN4tML6VWjyS6YmC64zUYQdSf49B+CC2vMq/YAMdM=; b=GearsWT18/4GYrvOFUpzGs4NHW
	ynAWLUZhSDScX5uB5LsN2iNQs6l+Cccr0X/6IJt0ZzlfNh5VTVC7ViNVHeM7u9pH3JY0MMqaW/bKw
	RtrZEakgRmrGtk5epDLJFAOb0/nIlZsd+NnCesakF/14CsPTruX0Ko5cDvThtD/U0SS2cpef68y1e
	yS6GUQo8M1H5tupwF01hRlIX4puuNj6RTc1EFAWG3vWlTue2VPIbAQeCSGhjMivmW4/F2r5723WDb
	9W2tvU+8tTGUPkv9Lt4JaBTEudgZrvQgf//+8FCndbvsDvr8Leb4Cz39yY//V5sxHSwd9IoqLJ2rw
	tkziURmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgJR-00000004eo2-2z2t;
	Tue, 27 Oct 2026 12:29:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgJP-00000004ekv-2vz6
	for linux-riscv@bombadil.infradead.org;
	Tue, 27 Oct 2026 12:29:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TEtKC47I2aW92wCX8ceE3Qq4fHsnf6t3ajY/y/wrOAM=; b=oFz0dNxnz56JDogfZNZ3EcKBOe
	p/m3wd/aD1ouGh7D5TT4x8mldu1x54Im/ac1rqMMevZmEidyYtcN+ivOlf2Thn6SpMf5YxmBpAoTQ
	ACQ0QZ5dqhlqIrZJFZjdD32yrkKpxhlXJcDwBYr4es40imisWDbsX65FBBPCyvIXijJMwJJram/IE
	tBMccaHODu2a+6WaIkXlsMgQHpOeXupPOOVG2c+EnHZEn2cTe8Z/8tIneZpBMPZziWd0bkrYlaqgs
	dLt6KjEQnal4f+pZgXQXpUoSzeTKvhdXVCgTa2N2pkLnI3dPR2NYs/RNJlgEklMwTx88Hl7DsRiJc
	aetUoipA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgJJ-0000000DUxD-3wq1;
	Tue, 27 Oct 2026 12:29:50 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3EE4A300DB9; Tue, 27 Oct 2026 13:29:49 +0100 (CET)
Date: Tue, 27 Oct 2026 13:29:49 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Matthew Wilcox <willy@infradead.org>,
	Usama Arif <usamaarif642@gmail.com>,
	Frank van der Linden <fvdl@google.com>,
	Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	kernel-team@meta.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCHv7 13/18] mm: Drop fake head checks
Message-ID: <20261027122949.GB2668804@noisy.programming.kicks-ass.net>
References: <20260227194302.274384-1-kas@kernel.org>
 <20260227194302.274384-14-kas@kernel.org>
 <ebc7bde1-f52e-4da8-b16f-822d6c0a4d74@kernel.org>
 <at_f43oDv73y-t7O@thinkstation>
 <f97a8d33-50b2-4a86-8381-ee840cdfa2f9@kernel.org>
 <20261027110028.GH2668564@noisy.programming.kicks-ass.net>
 <auCKv_omLGRc6wv2@thinkstation>
 <20261027121323.GO2668564@noisy.programming.kicks-ass.net>
 <auCXVv9yXtaS42w8@thinkstation>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <auCXVv9yXtaS42w8@thinkstation>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 12:22:56PM +0000, Kiryl Shutsemau wrote:
> On Tue, Oct 27, 2026 at 01:13:23PM +0100, Peter Zijlstra wrote:
> > On Tue, Oct 27, 2026 at 12:00:47PM +0000, Kiryl Shutsemau wrote:
> > 
> > > Fair enough. Here's some context.
> > > 
> > > HVO (HugeTLB Vmemmap Optimization) frees most of the memmap of a hugetlb
> > > folio by remapping the struct pages after the first vmemmap page to a
> > > shared page, mapped read-only.
> > > 
> > > Every lockless get of a page reference (e.g. page cache lookup, PFN
> > > scanners) relies on page_ref_add_unless_zero(), which is
> > > atomic_add_unless(&page->_refcount, nr, 0).
> > > 
> > > The page can be freed and reused between finding it and the get; the
> > > zero refcount is what makes the get fail. The race:
> > > 
> > >   lockless get                        other CPU
> > >   c = atomic_read(&page->_refcount)
> > >   c != 0
> > >                                       page freed
> > >                                       page allocated as a hugetlb tail
> > >                                       HVO remaps it read-only
> > >   try_cmpxchg(&page->_refcount, &c, c + nr)
> > >     -> write fault on read-only vmemmap
> > 
> > I missed a little something here; page->_refcount is in the page-frame;
> > how does the page itself being RO affect this?
> 
> Emm. I am not sure I follow the question.
> 
> The memory itself is not touched. HVO remaps the vmemmap, the array of
> struct pages: the part that holds the folio's tail struct pages points
> to the shared page, mapped PAGE_KERNEL_RO. So it is the struct page,
> and its _refcount, that is read-only.
> 
> For a 2M folio with 4K pages, its struct pages take 8 pages of vmemmap;
> the last 7 of them map to that one RO page.

Like I just explain to David on IRC; my brain has a 1:1 relation between
PFN and struct page. It makes no sense for struct page to be RO, ever.

Anyway, let me try and figure out how all this works, this is 'weird'.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
