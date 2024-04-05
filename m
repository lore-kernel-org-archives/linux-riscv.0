Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9D7C67861
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 21:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kGNKoMRI7xnvhagiEEsyU7nVXGjV5d/wfCVcbL0L7Xg=; b=w8fq3Whq5LIDRs
	1usGFRUqk17KHLXM65z5ujRAmqf1eeGsgMKZND3v0M1Gc8YBa06p8wErVtVS0iyM0p4Z7m/N8NU0D
	6MlQ8AMNN51ama5rm55dAHfnp3iSbpgGQQTFJ6zO96tBK4r8acHB5IXEVtaStQAyokY7qBUke88CW
	619mQ94eMiCmgM9U9ovZo8qXdmwav+A2u3CZxiE4KWenRcRjYz8Mm6CP13jdXtFPJpZ1CMTl0S1ck
	ufjb7s0eUoeHLIv7Wr0GX7IGWE0pbHR8ptJxozzA1pJzu7DTli+TdKGkXCfdAROENUr6fM/Lr+p6i
	NUzSSn0Tr+u1BlkMYLLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsrKs-00000008tPb-02H4;
	Fri, 05 Apr 2024 21:42:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsrKo-00000008tNl-2suo
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 21:42:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712353371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nh8AZu/36vuzSfX/Je7NxWoNvpcer/hOQkOAQFaqnk4=;
	b=ZnnysDkV95d3IkZdTauVM8cFRBBoqq9y3PdiELk4lqvlnNWeBNLPE37OLq8KMpvsR+FmDj
	8kCti2lgZp9OCMg6qb2hnNvF1RagS4wNhD42eHq/ZS4Fv4whb7lGbYtRUUhfluofRNGLJj
	t6zeFeNaLQeq27wsHHGAX67eEzrL8fc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-NgDahckSPs68yIncOuI5nA-1; Fri, 05 Apr 2024 17:42:49 -0400
X-MC-Unique: NgDahckSPs68yIncOuI5nA-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-78d438954abso37597385a.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 Apr 2024 14:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712353369; x=1712958169;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nh8AZu/36vuzSfX/Je7NxWoNvpcer/hOQkOAQFaqnk4=;
        b=HZxjwT8AgkxYwtSPEmnhPWpLHiof6ioxyIoHjuTDCSslg5fk57PALUhkZXR1x6V4Km
         ZEX+AgsYpt+VK/0MPWR1ILQDP5yTNf4Oe6sovsidKw0tBMYIdC56NoGOZhJ3PkVdxlsj
         sqBxexM0Z7eB8IR0NWlhArs/z5R+yvwHAoYrU9MHgp5GYRB9LuN+sbdsfsq/9McHMjyH
         26qOHJbfGFha6gqp6640KcBhgPPcbqgaw8ZGQCk9gQzbhnS6nc7kAM8Tc2JuppSPFhXc
         B5dDT9OtZCVZq3ApKkhH6J6EM/jSqPX9wvCLfj8wLFJuJ3D2iXQRxW34pOoAG6WhA+W8
         kn9g==
X-Forwarded-Encrypted: i=1; AJvYcCUPPoHIclU+2CVaPcZLP2pdHWMX83/iALG0oRHabvRHALFBTq2lNtDUzUMQKOGqcM0qqPzwQ9uL55A8Lnle8i4CR66HfCLzvZBXM5riINCx
X-Gm-Message-State: AOJu0YyIITkVdqsNnLM4aHk/fB7BqmgCOpTNkuKXMw9holnjmMYJY68y
	ANlD//hfdB9dSfDQwQZ0vR+ebqo83TGN/Mv96euXtLX4BXdVN+MxXaUA9nORfkiIdLJFcrSHRK1
	3PguL/SNfeYn2Ya7IynV4VDjoXBiVgLtu4gNVwR+ynmmK0AsFDETih6HU5pCVYWjXUg==
X-Received: by 2002:a05:620a:24cb:b0:78b:ead0:4e98 with SMTP id m11-20020a05620a24cb00b0078bead04e98mr2827328qkn.5.1712353368800;
        Fri, 05 Apr 2024 14:42:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYTCLlC89IJBPyweOipCCmgbTuVze3tgI8H3RxcclvMtkthTW+/IyM+0zA0bT9pfKklVWVNA==
X-Received: by 2002:a05:620a:24cb:b0:78b:ead0:4e98 with SMTP id m11-20020a05620a24cb00b0078bead04e98mr2827279qkn.5.1712353368024;
        Fri, 05 Apr 2024 14:42:48 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id bl40-20020a05620a1aa800b00789e8405843sm971843qkb.32.2024.04.05.14.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 14:42:47 -0700 (PDT)
Date: Fri, 5 Apr 2024 17:42:44 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Matthew Wilcox <willy@infradead.org>,
	Rik van Riel <riel@surriel.com>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yang Shi <shy828301@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Andrew Jones <andrew.jones@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Christoph Hellwig <hch@infradead.org>,
	linux-riscv@lists.infradead.org,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@redhat.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH v3 00/12] mm/gup: Unify hugetlb, part 2
Message-ID: <ZhBwVLyHr8WEKSx2@x1n>
References: <20240321220802.679544-1-peterx@redhat.com>
 <20240322161000.GJ159172@nvidia.com>
 <ZgHJaJSpoeJVEccN@x1n>
 <20240326140252.GH6245@nvidia.com>
 <Zg8gEyE4o_VJsTmx@x1n>
 <20240405181633.GH5383@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240405181633.GH5383@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_144254_825467_C3A6553E 
X-CRM114-Status: GOOD (  54.89  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Apr 05, 2024 at 03:16:33PM -0300, Jason Gunthorpe wrote:
> On Thu, Apr 04, 2024 at 05:48:03PM -0400, Peter Xu wrote:
> > On Tue, Mar 26, 2024 at 11:02:52AM -0300, Jason Gunthorpe wrote:
> > > The more I look at this the more I think we need to get to Matthew's
> > > idea of having some kind of generic page table API that is not tightly
> > > tied to level. Replacing the hugetlb trick of 'everything is a PTE'
> > > with 5 special cases in every place seems just horrible.
> > > 
> > >    struct mm_walk_ops {
> > >        int (*leaf_entry)(struct mm_walk_state *state, struct mm_walk *walk);
> > >    }
> > > 
> > > And many cases really want something like:
> > >    struct mm_walk_state state;
> > > 
> > >    if (!mm_walk_seek_leaf(state, mm, address))
> > >           goto no_present
> > >    if (mm_walk_is_write(state)) ..
> > > 
> > > And detailed walking:
> > >    for_each_pt_leaf(state, mm, address) {
> > >        if (mm_walk_is_write(state)) ..
> > >    }
> > > 
> > > Replacing it with a mm_walk_state that retains the level or otherwise
> > > to allow decoding any entry composes a lot better. Forced Loop
> > > unrolling can get back to the current code gen in alot of places.
> > > 
> > > It also makes the power stuff a bit nicer as the mm_walk_state could
> > > automatically retain back pointers to the higher levels in the state
> > > struct too...
> > > 
> > > The puzzle is how to do it and still get reasonable efficient codegen,
> > > many operations are going to end up switching on some state->level to
> > > know how to decode the entry.
> > 
> > These discussions are definitely constructive, thanks Jason.  Very helpful.
> > 
> > I thought about this last week but got interrupted.  It does make sense to
> > me; it looks pretty generic and it is flexible enough as a top design.  At
> > least that's what I thought.
> 
> Yeah, exactly..
> 
> > However now when I rethink about it, and look more into the code when I got
> > the chance, it turns out this will be a major rewrite of mostly every
> > walkers..  
> 
> Indeed, it is why it may not be reasonable.
> 
> > Consider that what we (or.. I) want to teach the pXd layers are two things
> > right now: (1) hugetlb mappings (2) MMIO (PFN) mappings.  That mostly
> > shares the generic concept when working on the mm walkers no matter which
> > way to go, just different treatment on different type of mem.  (2) is on
> > top of current code and new stuff, while (1) is a refactoring to drop
> > hugetlb_entry() hook point as the goal.
> 
> Right, I view this as a two pronged attack
> 
> One one front you teach the generic pXX_* macros to process huge pages
> and push that around to the performance walkers like GUP
> 
> On another front you want to replace use of the hugepte with the new
> walkers.
> 
> The challenge with the hugepte code is that it is all structured to
> assume one API that works at all levels and that may be a hard fit to
> replace with pXX_* functions.

That's the core of problem, or otherwise I feel like I might be doing
something else already.  I had a feeling even if it's currently efficient
for hugetlb, we'll drop that sooner or later.

The issue is at least hugetlb pgtable format is exactly the same as the
rest, as large folio grows it will reach the point that we complain more
than before on having hugetlb does its smart things on its own.

> 
> The places that are easy to switch from hugetlb to pXX_* may as well
> do so.
> 
> Other places maybe need a hugetlb replacement that has a similar
> abstraction level of pointing to any page table level.

IMHO this depends.

Per my current knowledge, hugetlb is only special in three forms:

- huge mapping (well, this isn't that special..)
- cont pte/pmd/...
- hugepd

The most fancy one is actually hugepd.. but I plan to put that temporarily
aside - I haven't look at Christophe's series yet, however I think we're
going to solve orthogonal issues but his work will definitely help me on
reaching mine, and I want to think through first on my end of things to
know a plan.  If hugepd has its chance to be generalized, the worst case is
I'll leverage CONFIG_ARCH_HAS_HUGEPD and only keep hugetlb_entry() for them
until hugepd became some cont-pxx variance.  Then when I put HAS_HUGEPD
aside, I don't think it's very complicated, perhaps?

In short, hugetlb mappings shouldn't be special comparing to other huge pXd
and large folio (cont-pXd) mappings for most of the walkers in my mind, if
not all.  I need to look at all the walkers and there can be some tricky
ones, but I believe that applies in general.  It's actually similar to what
I did with slow gup here.

Like this series, for cont-pXd we'll need multiple walks comparing to
before (when with hugetlb_entry()), but for that part I'll provide some
performance tests too, and we also have a fallback plan, which is to detect
cont-pXd existance, which will also work for large folios.

> 
> I think if you do the easy places for pXX conversion you will have a
> good idea about what is needed for the hard places.

Here IMHO we don't need to understand "what is the size of this hugetlb
vma", or "which level of pgtable does this hugetlb vma pages locate",
because we may not need that, e.g., when we only want to collect some smaps
statistics.  "whether it's hugetlb" may matter, though. E.g. in the mm
walker we see a huge pmd, it can be a thp, it can be a hugetlb (when
hugetlb_entry removed), we may need extra check later to put things into
the right bucket, but for the walker itself it doesn't necessarily need
hugetlb_entry().

> 
> > Now the important question I'm asking myself is: do we really need huge p4d
> > or even bigger?
> 
> Do we need huge p4d support with folios? Probably not..
> 
> huge p4d support for pfnmap, eg in VFIO. Yes I think that is possibly
> interesting - but I wouldn't ask anyone to do the work :)

Considering it does not yet exist, and we don't have plan to work it out
(so far), maybe I can see this as a very implicit ack that I can put that
aside at least of now. :)

> 
> But then again we come back to power and its big list of page sizes
> and variety :( Looks like some there have huge sizes at the pgd level
> at least.

Yeah this is something I want to be super clear, because I may miss
something: we don't have real pgd pages, right?  Powerpc doesn't even
define p4d_leaf(), AFAICT.

$ git grep p4d_leaf
arch/powerpc/mm/book3s64/radix_pgtable.c:               if (p4d_leaf(*p4d)) {
arch/powerpc/mm/pgtable.c:      if (p4d_leaf(p4d)) {
arch/powerpc/mm/pgtable_64.c:   if (p4d_leaf(p4d)) {
arch/powerpc/mm/pgtable_64.c:                   VM_WARN_ON(!p4d_leaf(p4d));
arch/powerpc/xmon/xmon.c:       if (p4d_leaf(*p4dp)) {

They all constantly return false (which is the fallback)?

> 
> > So, can we over-engineer too much if we go the generic route now?
> 
> Yes we can, and it will probably be slow as well. The pXX macros are
> the most efficient if code can be adapted to use them.
> 
> > Considering that we already have most of pmd/pud entries around in the mm
> > walker ops.
> 
> Yeah, so you add pgd and maybe p4d and then we can don't need any
> generic thing. If it is easy it would be nice.

I want to double check on above on PowerPC first, otherwise I'd consider
leaving p4d+ alone, if that looks ok.  It could be that I missed something
important, Christophe may want to chim in if he has any thoughts or just to
clarify my mistakes.

Thanks,

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
