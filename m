Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECE3C67861
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 21:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hTco9cfJHEK8t/z45XFGE3KnwRhfZMZ0vR7ixmp8nQU=; b=yThYBh1tOQOdxa
	qrb8xHCXJ4FZRWFOK/32BBbBE7hQ2tpqzqvh7+zB6kUl2O9N45wQVsW6bsUMTRRisJkxvomWj6N7Q
	apZlJ/CbVsunv1MvYFlS/fH8sv+cSr/XEcBbTHrKKbbxma5AL7Ws2LCUPUM2FvKPQKSCtcxIfJY2v
	sETvRzSwK/sw8BvIdL7ejJUUeWUF5F359j3wu7yVLmM66WAr2l3Y+S5smeNL65WSYjS/mPrH3qLhE
	n4ZN6eS+EGrgXeT9j3foQRk5yTT9RYdqG7YZwbrUUjy5T47NBq921Zg6dlh5SsT+hjozyDa0gMqDi
	5Dd0bo7Qj9/qokVGGzBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsUwQ-00000004NN9-1Ivm;
	Thu, 04 Apr 2024 21:48:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsUwM-00000004NLg-0pIq
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 21:48:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712267288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d56SKhTEmtwwDufddPphJGQfZPKBUJnUzF2wWqxF3/c=;
	b=U4cl7svSlIK7RcjmgEdmdGc2rP4assD95p547ZSziMc3T4tfYTQxv+ScKab+haYTYNo7Vt
	R3WE+vIFpTo8SiXx0n4YzkXksCrsj8wEI1cUhrD+sT4hJX+L3kQ1j/GOYC9lTN3DXa/s5M
	UsYW5NdbrOllh8fYakYIWxjBpHttVNY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-270-XoGc45lxNqmXr64qVS3ZlQ-1; Thu, 04 Apr 2024 17:48:07 -0400
X-MC-Unique: XoGc45lxNqmXr64qVS3ZlQ-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-78d41af5bebso33977585a.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 14:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712267287; x=1712872087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d56SKhTEmtwwDufddPphJGQfZPKBUJnUzF2wWqxF3/c=;
        b=bFN/o/gNWV2ueo1BtKCQURTlipms3QS0yD9aLdEYKNybRlEjVg2XtL1SPtwHQ3UKSf
         DUdf2pOQCpyXiAp8V+sfgyPlYNMSlj05zylAdu5E92GHVOoj7e5By7VPGppT/EOrSj4F
         XNWIPifLDKySOoVRBwY1RiiuAdL8cDvXmVVY8g9E8lMBBT1E2x96YpIFnzT7Hs//zkzf
         ugg36eMePuQGqfLBAx7hm49b09F1MWLfddn++qO3pS8UmKnVJP2TSeWxxv72J6CyCN7O
         0u3Zcn99td8MyvKA/50KYfQtsbyzWyIG7wBGbsGQkplrMRkbDy0EUIRpeRIsAf2sBMe6
         tFhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAQnOxPO5z2PQomBB5gicFatzVTsV1llDLmgvmciDroMrkXfZvGUEKIF4hKyCvA090BeTSjIKSaPUWS9q9P4PjKc5meGdWGUtMbhpnBOk4
X-Gm-Message-State: AOJu0YxVSTz9q4sq2UbBLPlGpgRq+s+StQ1efJuWXcZkwNzVqIYHyrKK
	tjdrJz1ruTjrT5K9YEe6eul+Z9aRNoJayoGVybwDLC4bzYLojqVQ2AKJCzlWBWLachV0nvC3zwK
	CAkWKWUwG4wLu/qhKJ1pCAcaycS9RtYBNfW9knxQa/uZTByXXTez0+cCldenxYkEwCQ==
X-Received: by 2002:a05:620a:4710:b0:78d:3b13:f5ab with SMTP id bs16-20020a05620a471000b0078d3b13f5abmr4680983qkb.0.1712267286798;
        Thu, 04 Apr 2024 14:48:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGchKyZTo6ytc9p0sjvCKGDIoG+ERHoc+VJC1tNlLSTRdcMUNyMf3HEESrAIicSQ8HrtIJ6pQ==
X-Received: by 2002:a05:620a:4710:b0:78d:3b13:f5ab with SMTP id bs16-20020a05620a471000b0078d3b13f5abmr4680952qkb.0.1712267286207;
        Thu, 04 Apr 2024 14:48:06 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id wg6-20020a05620a568600b00789e49808ffsm105555qkn.105.2024.04.04.14.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 14:48:05 -0700 (PDT)
Date: Thu, 4 Apr 2024 17:48:03 -0400
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
Message-ID: <Zg8gEyE4o_VJsTmx@x1n>
References: <20240321220802.679544-1-peterx@redhat.com>
 <20240322161000.GJ159172@nvidia.com>
 <ZgHJaJSpoeJVEccN@x1n>
 <20240326140252.GH6245@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240326140252.GH6245@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_144810_350207_A7FDC26A 
X-CRM114-Status: GOOD (  29.68  )
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

On Tue, Mar 26, 2024 at 11:02:52AM -0300, Jason Gunthorpe wrote:
> The more I look at this the more I think we need to get to Matthew's
> idea of having some kind of generic page table API that is not tightly
> tied to level. Replacing the hugetlb trick of 'everything is a PTE'
> with 5 special cases in every place seems just horrible.
> 
>    struct mm_walk_ops {
>        int (*leaf_entry)(struct mm_walk_state *state, struct mm_walk *walk);
>    }
> 
> And many cases really want something like:
>    struct mm_walk_state state;
> 
>    if (!mm_walk_seek_leaf(state, mm, address))
>           goto no_present
>    if (mm_walk_is_write(state)) ..
> 
> And detailed walking:
>    for_each_pt_leaf(state, mm, address) {
>        if (mm_walk_is_write(state)) ..
>    }
> 
> Replacing it with a mm_walk_state that retains the level or otherwise
> to allow decoding any entry composes a lot better. Forced Loop
> unrolling can get back to the current code gen in alot of places.
> 
> It also makes the power stuff a bit nicer as the mm_walk_state could
> automatically retain back pointers to the higher levels in the state
> struct too...
> 
> The puzzle is how to do it and still get reasonable efficient codegen,
> many operations are going to end up switching on some state->level to
> know how to decode the entry.

These discussions are definitely constructive, thanks Jason.  Very helpful.

I thought about this last week but got interrupted.  It does make sense to
me; it looks pretty generic and it is flexible enough as a top design.  At
least that's what I thought.

However now when I rethink about it, and look more into the code when I got
the chance, it turns out this will be a major rewrite of mostly every
walkers..  it doesn't mean that this is a bad idea, but then I'll need to
compare the other approach, because there can be a huge difference on when
we can get that code ready, I think. :)

Consider that what we (or.. I) want to teach the pXd layers are two things
right now: (1) hugetlb mappings (2) MMIO (PFN) mappings.  That mostly
shares the generic concept when working on the mm walkers no matter which
way to go, just different treatment on different type of mem.  (2) is on
top of current code and new stuff, while (1) is a refactoring to drop
hugetlb_entry() hook point as the goal.

Taking a simplest mm walker (smaps) as example, I think most codes are
ready thanks to THP's existance, and also like vm_normal_page[_pmd]() which
should even already work for pfnmaps; pud layer is missing but that should
be trivial.  It means we may have chance to drop hugetlb_entry() without an
huge overhaul yet.

Now the important question I'm asking myself is: do we really need huge p4d
or even bigger?  It's 512GB on x86, and we said "No 512 GiB pages yet"
(commit fe1e8c3e963) since 2017 - that is 7 years without chaning this
fact.  While on non-x86 p4d_leaf() never defined.  Then it's also
interesting to see how many codes are "ready" to handle p4d entries (by
looking at p4d_leaf() calls; much easier to see with the removal of the
rest huge apis..) even if none existed.

So, can we over-engineer too much if we go the generic route now?
Considering that we already have most of pmd/pud entries around in the mm
walker ops.  So far it sounds better we leave it for later, until further
justifed to be useful.  And that won't block it if it ever justified to be
needed, I'd say it can also be seen as a step forward if I can make it to
remove hugetlb_entry() first.

Comments welcomed (before I start to work on anything..).

Thanks,

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
