Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FA1C48BF8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 08:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c9IubCM5y3saA3OmfEGfbRMg/xM46K7hkI6bM3HpVg4=; b=d3kF4On987kdD+
	/2VwAZk0xHfUiI6v+hPqiYrrTLB6xeCFf6n1vHd9kusmBHc7ELItcQWouRmnRaMZxyMzs03NWnoYb
	rNUl8ocxyV8lNFocNV/qNoJEqoAcD1ko5W53EiAcr4GwC/Z0VMnSDdUS/E3vbyXtFC1+o6Ew31wsj
	bQjd5ZAOUftUH6LvDNUYfCraApojx+1E31C01sy89/+R5cjbC/HCanEtCVQcQOkvveahuerVv7b/F
	dwAsv+dTEp2297afm/U5bNOIbw/aYSBNSd7ypBHlJDvcjPHXN4gs1ST6rbksk1xZIyM5Ll2AVEe/z
	yLFeR95DGxoQM8KrQRWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd45l-00000003vng-056M;
	Thu, 22 Feb 2024 08:06:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd45i-00000003vlg-0LTz
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 08:06:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708589161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2Qz0IA0kUehz+OG0swe7slV1s58KjzFRhgWAnSqUkqI=;
	b=AuD6+Io5sqJWAI+SCRmH030znA0I/k+Vt++jv2KkjHMIUXEXUjKhahmQ5ixCMSv1lVTYSU
	HGke7QT5fq/DZe0xIYb3X4L6Rv1XzZ0miA+OwadFyDRZm8OoYhyjWgtA0p4Vv5XGL/9deI
	qyq5gAXldeZIKVQpibPVsgZ1Cr0dMm8=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-iEVkpYYtNzyVAAcHZJYqSA-1; Thu, 22 Feb 2024 03:04:53 -0500
X-MC-Unique: iEVkpYYtNzyVAAcHZJYqSA-1
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6e430252451so2031466a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 00:04:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708589092; x=1709193892;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Qz0IA0kUehz+OG0swe7slV1s58KjzFRhgWAnSqUkqI=;
        b=ms25fvcpvGYl1wEQ4Ayo9aRiIqUbkEACdW4aD6pS6MWPQmS2bAtkxcXssd1RqNCb/K
         DN5Hm6yYN6eS7e773v8faT9HHHs9S40KuxHPTUpLrgysdP0naEZ2QlWI03Kg9Avaqa5e
         zTJ8d3b3t8+/L1eLlsF5sJm6mMr//UHWjcS3yh0CtJ9mhkClyUksl71SEMIJI36cFvlM
         e6CmiIKamBMs7bXyrXK3fFTbpyHv5erOjqzRg/a50ilS46J+oMzqFDvswhLphjDFcdch
         k0vp0MCmwWQZCVDNjtgoXDOhSSRH8UUFhbjzXe75NCJkoRsTs5N6ZB7Frn6AK1v2kNGZ
         oxKg==
X-Forwarded-Encrypted: i=1; AJvYcCUcZiviNNlTchGl+O4eC0w7CHYSp5KTj0U2YNiO5shBiLMlIMlYuoiRabffv6u0gaxz4EBaBGU4zM/2CnaJKvinLJOtyC/kmBFCCEehvwLw
X-Gm-Message-State: AOJu0YxYPs4Ez0WniUHGJYwG0t1nE8rtBy4+8YJUCxVbvpJr9eA46MVc
	DA4pQVnPre1tRiNMGGpdhyBdNeuXdTIik4/iERcMlR8VzrKL/B41Wohp+E/+9j/npm/5amp6isg
	vXlET1tAKiroA2K/W02/St5gMNh+vl3l9hzlpPIZf7OkAiKJWLc9YTBNqGbsA3ZAyzA==
X-Received: by 2002:a05:6359:4113:b0:176:6149:5558 with SMTP id kh19-20020a056359411300b0017661495558mr16051624rwc.1.1708589092270;
        Thu, 22 Feb 2024 00:04:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZ/pl9m1WfSqai2cvVXv5Lf1ZKvJ4xKR9ln5/WSKPeld/1kI04FNn1XDkCL6gJC29eFxMWrw==
X-Received: by 2002:a05:6359:4113:b0:176:6149:5558 with SMTP id kh19-20020a056359411300b0017661495558mr16051606rwc.1.1708589091922;
        Thu, 22 Feb 2024 00:04:51 -0800 (PST)
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id a21-20020a056a0011d500b006e0d1e6036bsm10300214pfu.129.2024.02.22.00.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 00:04:51 -0800 (PST)
Date: Thu, 22 Feb 2024 16:04:38 +0800
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
Message-ID: <ZdcAFpRijQdaYV2A@x1n>
References: <20240103091423.400294-1-peterx@redhat.com>
 <20240103091423.400294-4-peterx@redhat.com>
 <20240115175551.GP734935@nvidia.com>
 <ZdXEYfs_xhS_9gRo@x1n>
 <20240221125753.GQ13330@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240221125753.GQ13330@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_000602_200644_629ED81F 
X-CRM114-Status: GOOD (  34.58  )
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

On Wed, Feb 21, 2024 at 08:57:53AM -0400, Jason Gunthorpe wrote:
> On Wed, Feb 21, 2024 at 05:37:37PM +0800, Peter Xu wrote:
> > On Mon, Jan 15, 2024 at 01:55:51PM -0400, Jason Gunthorpe wrote:
> > > On Wed, Jan 03, 2024 at 05:14:13PM +0800, peterx@redhat.com wrote:
> > > > From: Peter Xu <peterx@redhat.com>
> > > > 
> > > > ARM defines pmd_thp_or_huge(), detecting either a THP or a huge PMD.  It
> > > > can be a helpful helper if we want to merge more THP and hugetlb code
> > > > paths.  Make it a generic default implementation, only exist when
> > > > CONFIG_MMU.  Arch can overwrite it by defining its own version.
> > > > 
> > > > For example, ARM's pgtable-2level.h defines it to always return false.
> > > > 
> > > > Keep the macro declared with all config, it should be optimized to a false
> > > > anyway if !THP && !HUGETLB.
> > > > 
> > > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > > ---
> > > >  include/linux/pgtable.h | 4 ++++
> > > >  mm/gup.c                | 3 +--
> > > >  2 files changed, 5 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > > > index 466cf477551a..2b42e95a4e3a 100644
> > > > --- a/include/linux/pgtable.h
> > > > +++ b/include/linux/pgtable.h
> > > > @@ -1362,6 +1362,10 @@ static inline int pmd_write(pmd_t pmd)
> > > >  #endif /* pmd_write */
> > > >  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
> > > >  
> > > > +#ifndef pmd_thp_or_huge
> > > > +#define pmd_thp_or_huge(pmd)	(pmd_huge(pmd) || pmd_trans_huge(pmd))
> > > > +#endif
> > > 
> > > Why not just use pmd_leaf() ?
> > > 
> > > This GUP case seems to me exactly like what pmd_leaf() should really
> > > do and be used for..
> > 
> > I think I mostly agree with you, and these APIs are indeed confusing.  IMHO
> > the challenge is about the risk of breaking others on small changes in the
> > details where evil resides.
> 
> These APIs are super confusing, which is why I brought it up.. Adding
> even more subtly different variations is not helping.
> 
> I think pmd_leaf means the entry is present and refers to a physical
> page not another radix level.
> 
> > > eg x86 does:
> > > 
> > > #define pmd_leaf	pmd_large
> > > static inline int pmd_large(pmd_t pte)
> > > 	return pmd_flags(pte) & _PAGE_PSE;
> > > 
> > > static inline int pmd_trans_huge(pmd_t pmd)
> > > 	return (pmd_val(pmd) & (_PAGE_PSE|_PAGE_DEVMAP)) == _PAGE_PSE;
> > > 
> > > int pmd_huge(pmd_t pmd)
> > >         return !pmd_none(pmd) &&
> > >                 (pmd_val(pmd) & (_PAGE_PRESENT|_PAGE_PSE)) != _PAGE_PRESENT;
> > 
> > For example, here I don't think it's strictly pmd_leaf()? As pmd_huge()
> > will return true if PRESENT=0 && PSE=0 (as long as none pte ruled out
> > first), while pmd_leaf() will return false; I think that came from
> > cbef8478bee5. 
> 
> Yikes, but do you even want to handle non-present entries in GUP
> world? Isn't everything gated by !present in the first place?

I am as confused indeed.

> 
> > Besides that, there're also other cases where it's not clear of such direct
> > replacement, not until further investigated.  E.g., arm-3level has:
> > 
> > #define pmd_leaf(pmd)		pmd_sect(pmd)
> > #define pmd_sect(pmd)		((pmd_val(pmd) & PMD_TYPE_MASK) == \
> > 						 PMD_TYPE_SECT)
> > #define PMD_TYPE_SECT		(_AT(pmdval_t, 1) << 0)
> > 
> > While pmd_huge() there relies on PMD_TABLE_BIT ()
> 
> I looked at tht, it looked OK.. 
> 
> #define PMD_TYPE_MASK               (_AT(pmdval_t, 3) << 0)
> #define PMD_TABLE_BIT               (_AT(pmdval_t, 1) << 1)
> 
> It is the same stuff, just a little confusingly written

True, my eyes decided to skip all the shifts. :-( Ok then, let me see
whether I can give it a stab on the pXd_huge() mess.

Thanks,

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
