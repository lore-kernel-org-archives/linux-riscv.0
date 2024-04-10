Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77481CD1299
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 15:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hf9T91rZV3bTwwnsTYLbmI/lBQ33YOKSb5CXjP5CCHU=; b=RMpD1WgW3xXlAR
	Wxn1uqbnCNFn6u2atpk6+2BI3MwX4cWa/0nWcUAyCOYCFAneViDA7KtaIXt6r/yt7xWzekDz4SInm
	dEJwPX1+tPXtnAibOjUG0Jk0X1D7+b/jW3HTGKCdXU+QpC8jSo1Cc1clIoNsduoRHa+AZMOG7/Iyg
	BbrNl+/4Mdod4azX+MnwkSaHkJ7nkZc5WfnzqMItRHHXy/Qld+40w9/r1uc+1NlGfPnCsPtVuDB4e
	qm6at/8XSIiX74U2PkEY8p+VVZw/DM8aawYRY8yMHt9FUoWqhHKwljIo3GQhUIAnbuMu5u2aDz0en
	utJ25BCR9OfZ8xw/FZhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZsi-00000007mHv-1ELX;
	Wed, 10 Apr 2024 15:29:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZsc-00000007mDn-0WZt
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 15:28:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712762933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ci1baLlwDbOm6Wup8/nHleUUTbOV/R7CG6mxApYjz0M=;
	b=eaActkU+0iuCIKN1UtzhnOPW3PrvAQBvA6rHVjQkAnbIXvivOMfb3Z8Vy+yZai2JefaURB
	cLCWrquvEUihEyo2WTKsG+e/XBAiAUjorWnTV3zH4KHap3aiuYRPnhOGfUc7rBujhLdN60
	4yWHXiuAu7M+cQDWXhtZwSk9Kc12/80=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-IFaPWbhTPQOJnBHnrd9JKQ-1; Wed, 10 Apr 2024 11:28:49 -0400
X-MC-Unique: IFaPWbhTPQOJnBHnrd9JKQ-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-434ed2e412fso6707341cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 08:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712762923; x=1713367723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ci1baLlwDbOm6Wup8/nHleUUTbOV/R7CG6mxApYjz0M=;
        b=oxqZdf6wWG6AX6A/Igr3E6gVajd9NfNgIpfRLgB+dQPwKwC/dk7wXWvAednwjf2jiv
         1dhOLcX7efGXt+khmwuCFqxQzU2v/HXKRmQbHBROaSaHicQbih8euI8g8Fv7OzozhoOd
         Ehkp41W0dkJ0dPWQDcBTVjdePa4BQuxu0HQxTZI8GOFB4g458ZTHrjNWn32AAJx81xYR
         sGjG9O5vjPMo2uVrzdg41Sq8/Y3EpkpxIZUUiwajNwUITIyaPbqckaqrEwp2w6ZkNtD1
         gBZP3bS4vgdEsIEUYhweExdGxj4sB/lQ23pSCmbeZyPljUF2/xMWDUlMEv1Q/wNE+Lc7
         iUbw==
X-Forwarded-Encrypted: i=1; AJvYcCWGit7mkN6PW1/ydH+l9zLpCA6nOq6A/zkvbbKZZrUg8buVLTYTMMXiUl6C0xAp8nIYiuxoDPbvhaGXJSpDV4HntTYp57VadFWn0EsDlJ4K
X-Gm-Message-State: AOJu0YxTNaLn8By1dOYxi/34JRTKI/nNJ8BhI9/x7EaVoj4fRKvSSBmO
	pXsC1JIHE725llAJOKNLiF7Kjz1iF7BzHuaGSC2eRtwpEJo3jZ3D33nd5tXEN+2p6ybeJiT1bT/
	LyRvufuAvrnnZiQiNY8XqFoYlEGdEWtEXQw47ml0XRSBigI+sSPQubQWInru1mkb87A==
X-Received: by 2002:a05:6214:5090:b0:69b:ce6:271b with SMTP id kk16-20020a056214509000b0069b0ce6271bmr3168084qvb.2.1712762923245;
        Wed, 10 Apr 2024 08:28:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZs5MCkL0IJwntJvXwMvElTS5kl/yk1ExPO6tDqr2NK62DfB6pdbW0p2/DjTaMvJz9lDcKPw==
X-Received: by 2002:a05:6214:5090:b0:69b:ce6:271b with SMTP id kk16-20020a056214509000b0069b0ce6271bmr3168047qvb.2.1712762922544;
        Wed, 10 Apr 2024 08:28:42 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id ek1-20020ad45981000000b00699032e555bsm5208543qvb.127.2024.04.10.08.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 08:28:42 -0700 (PDT)
Date: Wed, 10 Apr 2024 11:28:39 -0400
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
Message-ID: <ZhawJ-VD6DtLZ2Zm@x1n>
References: <20240321220802.679544-1-peterx@redhat.com>
 <20240322161000.GJ159172@nvidia.com>
 <ZgHJaJSpoeJVEccN@x1n>
 <20240326140252.GH6245@nvidia.com>
 <Zg8gEyE4o_VJsTmx@x1n>
 <20240405181633.GH5383@nvidia.com>
 <ZhBwVLyHr8WEKSx2@x1n>
 <20240409234355.GJ5383@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240409234355.GJ5383@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_082854_264163_7D4F3884 
X-CRM114-Status: GOOD (  37.94  )
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

On Tue, Apr 09, 2024 at 08:43:55PM -0300, Jason Gunthorpe wrote:
> On Fri, Apr 05, 2024 at 05:42:44PM -0400, Peter Xu wrote:
> > In short, hugetlb mappings shouldn't be special comparing to other huge pXd
> > and large folio (cont-pXd) mappings for most of the walkers in my mind, if
> > not all.  I need to look at all the walkers and there can be some tricky
> > ones, but I believe that applies in general.  It's actually similar to what
> > I did with slow gup here.
> 
> I think that is the big question, I also haven't done the research to
> know the answer.
> 
> At this point focusing on moving what is reasonable to the pXX_* API
> makes sense to me. Then reviewing what remains and making some
> decision.
> 
> > Like this series, for cont-pXd we'll need multiple walks comparing to
> > before (when with hugetlb_entry()), but for that part I'll provide some
> > performance tests too, and we also have a fallback plan, which is to detect
> > cont-pXd existance, which will also work for large folios.
> 
> I think we can optimize this pretty easy.
>  
> > > I think if you do the easy places for pXX conversion you will have a
> > > good idea about what is needed for the hard places.
> > 
> > Here IMHO we don't need to understand "what is the size of this hugetlb
> > vma"
> 
> Yeh, I never really understood why hugetlb was linked to the VMA.. The
> page table is self describing, obviously.

Attaching to vma still makes sense to me, where we should definitely avoid
a mixture of hugetlb and !hugetlb pages in a single vma - hugetlb pages are
allocated, managed, ...  totally differently.

And since hugetlb is designed as file-based (which also makes sense to me,
at least for now), it's also natural that it's vma-attached.

> 
> > or "which level of pgtable does this hugetlb vma pages locate",
> 
> Ditto
> 
> > because we may not need that, e.g., when we only want to collect some smaps
> > statistics.  "whether it's hugetlb" may matter, though. E.g. in the mm
> > walker we see a huge pmd, it can be a thp, it can be a hugetlb (when
> > hugetlb_entry removed), we may need extra check later to put things into
> > the right bucket, but for the walker itself it doesn't necessarily need
> > hugetlb_entry().
> 
> Right, places may still need to know it is part of a huge VMA because we
> have special stuff linked to that.
> 
> > > But then again we come back to power and its big list of page sizes
> > > and variety :( Looks like some there have huge sizes at the pgd level
> > > at least.
> > 
> > Yeah this is something I want to be super clear, because I may miss
> > something: we don't have real pgd pages, right?  Powerpc doesn't even
> > define p4d_leaf(), AFAICT.
> 
> AFAICT it is because it hides it all in hugepd.

IMHO one thing we can benefit from such hugepd rework is, if we can squash
all the hugepds like what Christophe does, then we push it one more layer
down, and we have a good chance all things should just work.

So again my Power brain is close to zero, but now I'm referring to what
Christophe shared in the other thread:

https://github.com/linuxppc/wiki/wiki/Huge-pages

Together with:

https://lore.kernel.org/r/288f26f487648d21fd9590e40b390934eaa5d24a.1711377230.git.christophe.leroy@csgroup.eu

Where it has:

--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -98,6 +98,7 @@ config PPC_BOOK3S_64
        select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
        select ARCH_ENABLE_SPLIT_PMD_PTLOCK
        select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
+       select ARCH_HAS_HUGEPD if HUGETLB_PAGE
        select ARCH_SUPPORTS_HUGETLBFS
        select ARCH_SUPPORTS_NUMA_BALANCING
        select HAVE_MOVE_PMD
@@ -290,6 +291,7 @@ config PPC_BOOK3S
 config PPC_E500
        select FSL_EMB_PERFMON
        bool
+       select ARCH_HAS_HUGEPD if HUGETLB_PAGE
        select ARCH_SUPPORTS_HUGETLBFS if PHYS_64BIT || PPC64
        select PPC_SMP_MUXED_IPI
        select PPC_DOORBELL

So I think it means we have three PowerPC systems that supports hugepd
right now (besides the 8xx which Christophe is trying to drop support
there), besides 8xx we still have book3s_64 and E500.

Let's check one by one:

  - book3s_64

    - hash

      - 64K: p4d is not used, largest pgsize pgd 16G @pud level.  It
        means after squashing it'll be a bunch of cont-pmd, all good.

      - 4K: p4d also not used, largest pgsize pgd 128G, after squashed
        it'll be cont-pud. all good.

    - radix

      - 64K: largest 1G @pud, then cont-pmd after squashed. all good.

      - 4K: largest 1G @pud, then cont-pmd, all good.

  - e500 & 8xx

    - both of them use 2-level pgtables (pgd + pte), after squashed hugepd
      @pgd level they become cont-pte. all good.

I think the trick here is there'll be no pgd leaves after hugepd squashing
to lower levels, then since PowerPC seems to never have p4d, then all
things fall into pud or lower.  We seem to be all good there?

> 
> If the goal is to purge hugepd then some of the options might turn out
> to convert hugepd into huge p4d/pgd, as I understand it. It would be
> nice to have certainty on this at least.

Right.  I hope the pmd/pud plan I proposed above can already work too with
such ambicious goal too.  But review very welcomed from either you or
Christophe.

PS: I think I'll also have a closer look at Christophe's series this week
or next.

> 
> We have effectively three APIs to parse a single page table and
> currently none of the APIs can return 100% of the data for power.

Thanks,

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
