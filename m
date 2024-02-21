Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18AFC48BC3
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 09:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/hOqQwxiu3LLedF3EAUnUIH0ArfoG1HdXsFZ6e8XFyE=; b=Vc16jFnwdKV/y8
	V5HlNYLYMXpyQKerV6naun8c9VkGdKcieRygKJ5dbDr2U9G2RtWWN7w1EzuW/2BrDyRnQQLisn0yp
	nstaBU8RBO/7UtIP7luD60oXkZC8jp0NxbnfWyUOgfe4bxwvSYh7Y6aaZiR84t4eoIv/BRuTzZ1FH
	brUQOexWJMobA+C9WvSbOMCe0eHHx1iBMnE7brvUInM+k5M6xzZDUmTL/jN0djRBWbdOTGeZZy4tV
	L9SP8KR3PFj7OcTDexaYskiMMi6Y+DzAfkeGq3hR0oEsbODOMWDx8DQ5u3jGytydGZRxj32+BAkAk
	wWdC4138x7cxeyXYJtDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcj37-00000000I0d-0YEj;
	Wed, 21 Feb 2024 09:37:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcj34-00000000Hy7-33ZA
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 09:37:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708508272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BdaKpo1zKogZCn5PWAqhqXGnoFVUrqpY1LtEmaKu+FM=;
	b=UFHnGmnLLF1dyPsTJH5oE/3mBxEFT/++jT/G+HjD7XNGKQ3fM50r6Ae/bvTlMF2ZPJ50sA
	u4HFcu/ZT+AYd4PF/tCzxX75rWp8XDI2yzbRON2gREhNo/34KFrv5SRAVpeLgG8bJJHgaT
	AYFbp2Yq5fFDoJfM16nbxysxbaKm4+E=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-4ET42IxAMyijlcUM-uXXvQ-1; Wed, 21 Feb 2024 04:37:51 -0500
X-MC-Unique: 4ET42IxAMyijlcUM-uXXvQ-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-6db0e05548fso1863906b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Feb 2024 01:37:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708508270; x=1709113070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdaKpo1zKogZCn5PWAqhqXGnoFVUrqpY1LtEmaKu+FM=;
        b=PSBVPuHgy3yovYf88bBoMDHcOjIjGbt/WUbhA5BDBGwcCIHXQ6coJxQp6eTo8N+EhJ
         ook3bBxF4rV2BiHLkoUgs/BUZUllZVGQ90rg2hZXxnlGANdSWUvmz+BJg02FWAlpoccq
         byDuKAlS06srzYL83tmwhZxgoMPnjXWcdiksvheurrIXxetrrDk57dq5G4XmCM4VsP4f
         lV+8OrjAdW0pX7JVIHzmfVtR02Sw/RiNgvNejArA+zXPJNTuY+GZFyuykx3KKQ8T51nq
         G+GJ17FJ/Axp84tyfS3gyi4RuLNyd3x74IqNeAwLKXo4S85Uu4ElkzLr8ret/NCLjW2T
         mBAg==
X-Forwarded-Encrypted: i=1; AJvYcCVpQmM4RAEzf8cqPZinsbOlMcis06f6jEeNqJaouBG6BwqLsjbSeSNyvDGmjM7djMYuffZIjygMrXehw+p9qbgxfTgr3P2dSOJdOCiDRyKl
X-Gm-Message-State: AOJu0YwACb7W55ZRz7IzQs3NTOr+rJc9bVXC7UXTYXlUDEznElrE1bT7
	8PgZub9CEdyzBZLzXZOqe+YPQGmz1g20WG4rqxDda0TiOC6w4PGun9vP1G+WkFZB+ijNMLuQ1cG
	obJpdr/7pIeY2UP5Rwv7pkyur6JwUUQFY4XfnvuSr1eQ2Ry669t5cV2H7RTIfW4ecNw==
X-Received: by 2002:a05:6a00:3d13:b0:6e4:672b:f384 with SMTP id lo19-20020a056a003d1300b006e4672bf384mr7669542pfb.2.1708508269926;
        Wed, 21 Feb 2024 01:37:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnK/5Xc9SKm0wQPEnUuYiqinVCHstqfWVnR5OuYxZ4xQLJmopCSPYZqNRQ2oNZWFAP27lsbg==
X-Received: by 2002:a05:6a00:3d13:b0:6e4:672b:f384 with SMTP id lo19-20020a056a003d1300b006e4672bf384mr7669524pfb.2.1708508269578;
        Wed, 21 Feb 2024 01:37:49 -0800 (PST)
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id e11-20020aa7980b000000b006e4698d53casm4990624pfl.140.2024.02.21.01.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 01:37:49 -0800 (PST)
Date: Wed, 21 Feb 2024 17:37:37 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@redhat.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Yang Shi <shy828301@gmail.com>, linux-riscv@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Rik van Riel <riel@surriel.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Mike Rapoport <rppt@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andrew Jones <andrew.jones@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Muchun Song <muchun.song@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2 03/13] mm: Provide generic pmd_thp_or_huge()
Message-ID: <ZdXEYfs_xhS_9gRo@x1n>
References: <20240103091423.400294-1-peterx@redhat.com>
 <20240103091423.400294-4-peterx@redhat.com>
 <20240115175551.GP734935@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240115175551.GP734935@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_013754_887950_03861A9B 
X-CRM114-Status: GOOD (  35.23  )
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

On Mon, Jan 15, 2024 at 01:55:51PM -0400, Jason Gunthorpe wrote:
> On Wed, Jan 03, 2024 at 05:14:13PM +0800, peterx@redhat.com wrote:
> > From: Peter Xu <peterx@redhat.com>
> > 
> > ARM defines pmd_thp_or_huge(), detecting either a THP or a huge PMD.  It
> > can be a helpful helper if we want to merge more THP and hugetlb code
> > paths.  Make it a generic default implementation, only exist when
> > CONFIG_MMU.  Arch can overwrite it by defining its own version.
> > 
> > For example, ARM's pgtable-2level.h defines it to always return false.
> > 
> > Keep the macro declared with all config, it should be optimized to a false
> > anyway if !THP && !HUGETLB.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  include/linux/pgtable.h | 4 ++++
> >  mm/gup.c                | 3 +--
> >  2 files changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index 466cf477551a..2b42e95a4e3a 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -1362,6 +1362,10 @@ static inline int pmd_write(pmd_t pmd)
> >  #endif /* pmd_write */
> >  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
> >  
> > +#ifndef pmd_thp_or_huge
> > +#define pmd_thp_or_huge(pmd)	(pmd_huge(pmd) || pmd_trans_huge(pmd))
> > +#endif
> 
> Why not just use pmd_leaf() ?
> 
> This GUP case seems to me exactly like what pmd_leaf() should really
> do and be used for..

I think I mostly agree with you, and these APIs are indeed confusing.  IMHO
the challenge is about the risk of breaking others on small changes in the
details where evil resides.

> 
> eg x86 does:
> 
> #define pmd_leaf	pmd_large
> static inline int pmd_large(pmd_t pte)
> 	return pmd_flags(pte) & _PAGE_PSE;
> 
> static inline int pmd_trans_huge(pmd_t pmd)
> 	return (pmd_val(pmd) & (_PAGE_PSE|_PAGE_DEVMAP)) == _PAGE_PSE;
> 
> int pmd_huge(pmd_t pmd)
>         return !pmd_none(pmd) &&
>                 (pmd_val(pmd) & (_PAGE_PRESENT|_PAGE_PSE)) != _PAGE_PRESENT;

For example, here I don't think it's strictly pmd_leaf()? As pmd_huge()
will return true if PRESENT=0 && PSE=0 (as long as none pte ruled out
first), while pmd_leaf() will return false; I think that came from
cbef8478bee5.  I'm not sure whether that is the best solution, e.g., from a
1st glance it seems better to me to process swap entries separately
(including both migration and poisoned entries)..

Sparc has similar things there, which in that case I'm not sure whether a
direct replace is always safe.

Besides that, there're also other cases where it's not clear of such direct
replacement, not until further investigated.  E.g., arm-3level has:

#define pmd_leaf(pmd)		pmd_sect(pmd)
#define pmd_sect(pmd)		((pmd_val(pmd) & PMD_TYPE_MASK) == \
						 PMD_TYPE_SECT)
#define PMD_TYPE_SECT		(_AT(pmdval_t, 1) << 0)

While pmd_huge() there relies on PMD_TABLE_BIT ()

int pmd_huge(pmd_t pmd)
{
	return pmd_val(pmd) && !(pmd_val(pmd) & PMD_TABLE_BIT);
}

#define PMD_TABLE_BIT		(_AT(pmdval_t, 1) << 1)

These are just the trivial details that I wanted to avoid to touch in this
series, so as to resolve the hugetlb issue separately from others.

The new pmd_huge_or_thp() is not ideal, but that easily isolates all these
trivial details / evils out of the picture, so that we can tackle them one
by one.  It is strictly an OR or huge||thp, so it's hopefully safe to not
break anything yet from that regard.

> 
> I spot checked a couple arches and it looks like it holds up.
> 
> Further, it looks to me like this site in GUP is the only core code
> caller..
> 
> So, I'd suggest a small series to go arch by arch and convert the arch
> to use pmd_huge() == pmd_leaf(). Then retire pmd_huge() as a public
> API.
> 
> > diff --git a/mm/gup.c b/mm/gup.c
> > index df83182ec72d..eebae70d2465 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -3004,8 +3004,7 @@ static int gup_pmd_range(pud_t *pudp, pud_t pud, unsigned long addr, unsigned lo
> >  		if (!pmd_present(pmd))
> >  			return 0;
> >  
> > -		if (unlikely(pmd_trans_huge(pmd) || pmd_huge(pmd) ||
> > -			     pmd_devmap(pmd))) {
> > +		if (unlikely(pmd_thp_or_huge(pmd) || pmd_devmap(pmd))) {
> >  			/* See gup_pte_range() */
> >  			if (pmd_protnone(pmd))
> >  				return 0;
> 
> And the devmap thing here doesn't make any sense either. The arch
> should ensure that pmd_devmap() implies pmd_leaf(). Since devmap is a
> purely SW construct it almost certainly does already anyhow.

Yep, but only if pmd_leaf() is safe to be put here. A pmd devmap should
always imply as a pmd_leaf() indeed.

Thanks,

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
