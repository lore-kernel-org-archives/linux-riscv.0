Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22633C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 18:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kzQ8Er4YQT/vh1UFHQ4AzKl8ETTd2g58iDMJ5+n0v8o=; b=BWzhBuKTB3lDq8
	XpgciUay/k3a0EgFAs++6e0uTboul7Cx41Xs/9sTdAKqkLwCrmAspVSK7ACaPwN5FuI2v7VzfnfY8
	dApLOE4EU9vSDedKmnLDyh2ISgeBJS4JTrk/1re6FCFilB/Yw5U57X+LJgp1KwQpu0l7S0RtGhV+K
	7p6EV9kB1IZAmsQx7FF2ALszQdtlsRkfK7R0pFD01zlwsHV1j8MYGCLmof+Anp3rJIzoiMwhgHGZu
	kSVt5EqUm6/YFNsiOlYKZYdulk7buKqRks9w+21qHtTphmZJpitP1KRf3rgzS8nYgrhkSSTI19itS
	rfTo4qVal60KTKAVjgjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ropXA-00000001TMV-3UW6;
	Mon, 25 Mar 2024 18:59:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ropX7-00000001TK9-12b2
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 18:58:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711393134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lGdQaCGcBkbZ2z9bjtfUzgfe0ZmyyKivIRm0X4ayYz0=;
	b=aH1+Mc9CpYASsGoFVsnVCbCCgja9EgMjBlIKVAPyL9lf1nueTR2orBSGnKS67D39S/Om1v
	2pZpVmHkWUPgnK5z781yAsTWTsWfa9NZyXIIJSSk7cusvsJwc5QM09geTqEywAhjfupoq3
	2BCpIvlkmNiMOcuLkjfM5gjSg6Bhx7g=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-qRNDnc8ONja9dgaehOuTJg-1; Mon, 25 Mar 2024 14:58:53 -0400
X-MC-Unique: qRNDnc8ONja9dgaehOuTJg-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-69152af7760so17265586d6.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2024 11:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711393133; x=1711997933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGdQaCGcBkbZ2z9bjtfUzgfe0ZmyyKivIRm0X4ayYz0=;
        b=BD04MciToNRVvHxLNVma4JXSApdzM2KDJVBKSnPZoaXb513KheaPUe7emgBuKx3zqA
         txDFtdWy+6zKcst39FrEJbj05ruZms+yBbH1/ZOCGCpGp2AxZMIM0B95g/+eKyQY59NN
         C4I+jcHuZ2mr9/CIQrFPAnWTGyoCn3FF6JUzGKpPtUXgcaKeQ21iF2zYAktUGeYJlpO7
         Hbjjt59HA5TH7npbWEiQHJHVv/Oj6wkZYoFNzSucBRuu4wCyHQGp552mzeWcAI7R8zYR
         k4adAD3y6NudzNlBgcqN6e9fyr4QXUdfvcN8wzxVbsgtKoqwHZSoiTcv6fSknYlxhKb1
         UWAg==
X-Forwarded-Encrypted: i=1; AJvYcCWIbLR2wich5RWPJ0CQOhoSIhISD6ccKqlzibk2et0BikcFkWnBqoHnbB+dl84PrX7Z1svupjrKmCiUNgIltvfi9ZFy5+04A5AV1zJW02Y2
X-Gm-Message-State: AOJu0YwjVwKEDuiC30XujBHNzBzl9S66lDhCrhWzKgPyoGaPTzBWABN5
	DWNhwUzOUaa7+cIC4FX7WYe1L/zJqBPz9CE6qK7MyO5K6JyzxILTyZLdUygM3ESZifaP9Ib0lKY
	DgVppthj3iHwR/0Agy/zZdRU6rKvxWizF2vL7Za/+S2o/uv4vGnu39UWqeiItpk/Unw==
X-Received: by 2002:a05:6214:3d13:b0:696:7b12:3744 with SMTP id ol19-20020a0562143d1300b006967b123744mr8189341qvb.0.1711393132764;
        Mon, 25 Mar 2024 11:58:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE4pfdS6Owjbbcw6cCZoeZVpTG6xXlLRqHsMW/sJVGfLOPBLf6CMPjo5ntIkMeQpg5wPfu7g==
X-Received: by 2002:a05:6214:3d13:b0:696:7b12:3744 with SMTP id ol19-20020a0562143d1300b006967b123744mr8189311qvb.0.1711393132312;
        Mon, 25 Mar 2024 11:58:52 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id kd26-20020a056214401a00b006968e1bed43sm1380686qvb.79.2024.03.25.11.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 11:58:51 -0700 (PDT)
Date: Mon, 25 Mar 2024 14:58:48 -0400
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
Message-ID: <ZgHJaJSpoeJVEccN@x1n>
References: <20240321220802.679544-1-peterx@redhat.com>
 <20240322161000.GJ159172@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240322161000.GJ159172@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_115857_415958_418D501C 
X-CRM114-Status: GOOD (  47.70  )
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

On Fri, Mar 22, 2024 at 01:10:00PM -0300, Jason Gunthorpe wrote:
> On Thu, Mar 21, 2024 at 06:07:50PM -0400, peterx@redhat.com wrote:
> > From: Peter Xu <peterx@redhat.com>
> > 
> > v3:
> > - Rebased to latest mm-unstalbe (a824831a082f, of March 21th)
> > - Dropped patch to introduce pmd_thp_or_huge(), replace such uses (and also
> >   pXd_huge() users) with pXd_leaf() [Jason]
> > - Add a comment for CONFIG_PGTABLE_HAS_HUGE_LEAVES [Jason]
> > - Use IS_ENABLED() in follow_huge_pud() [Jason]
> > - Remove redundant none pud check in follow_pud_mask() [Jason]
> > 
> > rfc: https://lore.kernel.org/r/20231116012908.392077-1-peterx@redhat.com
> > v1:  https://lore.kernel.org/r/20231219075538.414708-1-peterx@redhat.com
> > v2:  https://lore.kernel.org/r/20240103091423.400294-1-peterx@redhat.com
> > 
> > The series removes the hugetlb slow gup path after a previous refactor work
> > [1], so that slow gup now uses the exact same path to process all kinds of
> > memory including hugetlb.
> > 
> > For the long term, we may want to remove most, if not all, call sites of
> > huge_pte_offset().  It'll be ideal if that API can be completely dropped
> > from arch hugetlb API.  This series is one small step towards merging
> > hugetlb specific codes into generic mm paths.  From that POV, this series
> > removes one reference to huge_pte_offset() out of many others.
> 
> This remark would be a little easier to understand if you refer to
> hugetlb_walk() not huge_pte_offset() - the latter is only used to
> implement hugetlb_walk() and isn't removed by this series, while a
> single hugetlb_walk() was removed.

Right.  Here huge_pte_offset() is the arch API that I hope we can remove,
the hugetlb_walk() is simply the wrapper.

> 
> Regardless, I think the point is spot on, the direction should be to
> make the page table reading generic with minimal/no interaction with
> hugetlbfs in the generic code.

Yes, and I also like your terms on calling them "pgtable readers".  It's a
better way to describe the difference in that regard between
huge_pte_offset() v.s. huge_pte_alloc().  Exactly that's my goal, that we
should start with the "readers".

The writters might change semantics when merge, and can be more
challenging, I'll need to look into details of each one, like page fault
handlers.  Such work may need to be analyzed case by case, and this GUP
part is definitely the low hanging fruit comparing to the rest.

> 
> After this series I would suggest doing the pagewalk.c stuff as it is
> very parallel to GUP slow (indeed it would be amazing to figure out a
> way to make GUP slow and pagewalk.c use the same code without a
> performance cost)

Yes.  I hope there shouldn't be much perf degrade, I can do some more
measurements too when getting there.  And btw, IIUC the major challenge of
pagewalk.c is not the removal of walk_hugetlb_range() alone - that may not
be that hard if that's the solo purpose.  The better way to go is to remove
mm_walk_ops.hugetlb_entry() altogether, which will cause a change in all
callers; that's "the challenge".. pretty much labor works, not a major
technical challenge it seems.  Not sure if it's a good news or bad..

One thing I'll soon look into is to allow huge mappings for PFNMAP; there's
one request from VFIO side for MMIO. Dropping mm_walk_ops.hugetlb_entry()
seems to be good for all such purposes; well, I may need to bite the bullet
here.. for either of the purposes to move on.

> 
> Some of the other core mm callers don't look too bad either, getting
> to the point where hugetlb_walk() is internal to hugetlb.c would be a
> nice step that looks reasonable size.

Agree.

> 
> > One goal of such a route is that we can reconsider merging hugetlb features
> > like High Granularity Mapping (HGM).  It was not accepted in the past
> > because it may add lots of hugetlb specific codes and make the mm code even
> > harder to maintain.  With a merged codeset, features like HGM can hopefully
> > share some code with THP, legacy (PMD+) or modern (continuous PTEs).
> 
> Yeah, if all the special hugetlb stuff is using generic arch code and
> generic page walkers (maybe with that special vma locking hook) it is
> much easier to swallow than adding yet another special class of code
> to all the page walkers.
> 
> > To make it work, the generic slow gup code will need to at least understand
> > hugepd, which is already done like so in fast-gup.  Due to the specialty of
> > hugepd to be software-only solution (no hardware recognizes the hugepd
> > format, so it's purely artificial structures), there's chance we can merge
> > some or all hugepd formats with cont_pte in the future.  That question is
> > yet unsettled from Power side to have an acknowledgement.  
> 
> At a minimum, I think we have a concurrence that the reading of the
> hugepd entries should be fine through the standard contig pte APIs and
> so all the page walkers doing read side operations could stop having
> special hugepd code. It is just an implementation of contig pte with
> the new property that the size of a PTE can be larger than a PMD
> entry.
> 
> If, or how much, the hugepd write side remains special is the open
> question, I think.

It seems balls are rolling in that aspect, I haven't looked in depth there
in Christophe's series but it's great to have started!

> 
> > this series, I kept the hugepd handling because we may still need to do so
> > before getting a clearer picture of the future of hugepd.  The other reason
> > is simply that we did it already for fast-gup and most codes are still
> > around to be reused.  It'll make more sense to keep slow/fast gup behave
> > the same before a decision is made to remove hugepd.
> 
> Yeah, I think that is right for this series. Lets get this done and
> then try to remove hugepd read side.

Thanks a bunch for the reviews.

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
