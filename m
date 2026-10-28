Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04644606A31D
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 13:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l5vzpl9B;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=WQTo7RRj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NV4/ZKNTqWxyZFit7+X9wpvOCX9r/P4caftOIJJFCO0=; b=l5vzpl9Bij3MaF5ucqckvYbLuu
	7yniZG/+MUyhXvB9C/RzWz68KU9o1NY3MWfc4Px1ef6VzeoG0oiJ8zZWc3L3IkHpPZ41siHWC9hAP
	2hqPv07grQl7b5DSP59LIj2pFpa625SDeBjU78JbS8NpIavFJk6B/Y0S6jGsL3SGS7MbYcU62bGvd
	dhWVLxCDPfvIAOlEhY/x5H4VFdOjQVZN5yO2iXq5Jl3xWijw+kyYStD6RFFEga1CMwLsj1YtNar4B
	Q2CqpOA9ZI7vjIiVW92iLuids1wz+iqwrR4PY73cKb6FI4JH5cJY494tnr91Ak9U818vRi+JF0pxN
	sn+PpsuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3nm-000000075Qg-0T8V;
	Wed, 28 Oct 2026 13:34:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3nk-000000075Q5-1fdf
	for linux-riscv@bombadil.infradead.org;
	Wed, 28 Oct 2026 13:34:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=K5sU8ZAJRz6gFhM4gDWxCHu2kvyqTC/PTTWhoAieCGY=; b=WQTo7RRjUws4wLzC6TxpAmx57w
	qcq5fCMagtfKad2FmcZhLNiyNmxBTF8/cvyU5FhHuyznlY2ota9MN31xYDxFIv2Erfp4aIicHdOEl
	E2jxLk1iu6UVgBFuNZDHQbP8i5O71tuJIGJbKRCf70a3PNnSQKK+sWlOzaRMzfKYFkbHgL5lDL9Vp
	ZvXgetdmOXoLVKHD/1ZDYuRo7eMc1PaJvukhM56Ia68PICeBLH2PimR6BGNHj7GsDJbTI86FtVG5t
	W0wLnsMXdRptmezamho6yQr8A3y96kAxjX7Nk07pkHXtbr6zoq0TtEiKMjF427WJnVaamNRv1dQ0Y
	/t33+Xow==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3ne-0000000G0rh-0VGE;
	Wed, 28 Oct 2026 13:34:43 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E42F1300DB9; Wed, 28 Oct 2026 14:34:39 +0100 (CET)
Date: Wed, 28 Oct 2026 14:34:39 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
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
Message-ID: <20261028133439.GK2668804@noisy.programming.kicks-ass.net>
References: <auCKv_omLGRc6wv2@thinkstation>
 <f3f3aca9-bdb7-4aec-9099-9fb63a60e61d@kernel.org>
 <auCZFckDfBMrlfxV@thinkstation>
 <070DDE5C-2183-4A8B-AC2D-891CAE15E581@linux.dev>
 <d7a634b6-8668-4753-8bfc-e9334dde705e@kernel.org>
 <4A32F5E6-977D-4720-8723-B19AFBC08FCF@linux.dev>
 <auDkbDlgSZxqlk2G@thinkstation>
 <7cb3dd91-f518-49b6-b311-9ec807b3c63b@linux.dev>
 <20261028080635.GD2668804@noisy.programming.kicks-ass.net>
 <auHxIORufMbldrBr@thinkstation>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <auHxIORufMbldrBr@thinkstation>
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
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 12:58:11PM +0000, Kiryl Shutsemau wrote:
> On Wed, Oct 28, 2026 at 09:06:35AM +0100, Peter Zijlstra wrote:
> > On Wed, Oct 28, 2026 at 10:38:22AM +0800, Muchun Song wrote:
> > > 
> > > 
> > > On 2026/10/28 01:51, Kiryl Shutsemau wrote:
> > > > On Tue, Oct 27, 2026 at 10:03:54PM +0800, Muchun Song wrote:
> > > > > Therefore, I am kind of leaning towards removing the RO protection
> > > > > and restoring RW permissions to solve the race.
> > > > Okay, what about this:
> > > > 
> > > >  From e23ab850837b53cc79d57d58f1cfb4266e745c3d Mon Sep 17 00:00:00 2001
> > > > From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> > > > Date: Tue, 27 Oct 2026 17:23:47 +0000
> > > > Subject: [PATCH] mm/hugetlb_vmemmap: map the shared tail page writable
> > > > 
> > > > page_ref_add_unless_zero() reads the refcount and then updates it with
> > > > a cmpxchg.  A lockless get, such as a page cache lookup or a PFN
> > > > scanner, can read a non-zero refcount from a page that is then freed
> > > > and reused as a hugetlb tail page.  If HVO remaps its struct page to
> > > > the shared tail page in between, the cmpxchg writes to read-only
> > > > vmemmap:
> > > > 
> > > >      CPU0 (lockless get)               CPU1
> > > >      c = atomic_read(&page->_refcount)
> > > >                                        page freed
> > > >                                        page allocated as a hugetlb tail
> > > >                                        HVO remaps the struct page RO
> > > >      try_cmpxchg(&page->_refcount, &c, c + 1)
> > > >        -> write fault on read-only vmemmap
> > > > 
> > > > The refcount is zero by then and the compare fails, but LOCK CMPXCHG on
> > > > x86 writes anyway.  The kernel oopses when hugetlb pages are allocated
> > > 
> > > Is this an X86-specific issue? If not, I suggest a more generic
> > > description.
> > 
> > AFAICT most architectures that implement single compare-and-swap
> > instructions are affected, with the possible exception of s390.
> > 
> > That is, sparc, arm64-lse, riscv-Zacas, loonarch-amocas, openrisc (and
> > ia64 for those people keeping the out-of-tree port alive) all require
> > write protection to begin cmpxchg.
> > 
> > All the LL/SC architectures should be fine, they'll never get to the SC
> > part.
> 
> Only architectures with HVO matter here: x86-64, riscv and loongarch.
> arm64 has had it disabled since 060a2c92d1b6.

Per that commit, could it be re-enabled now that its no longer marked RO?

> riscv and loongarch implement atomic_fetch_add_unless() with LL/SC only,
> no CAS variant, so they see the zero at the load. That leaves x86.

Ah yes, I only looked at the cmpxchg implementation rather than the
fetch_add_unless :/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
