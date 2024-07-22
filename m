Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F11C3DA5D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 15:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7yGvfS5j8XljzrwIbnaFzpOQ3U/l+EMqvEdwvHPpeR4=; b=Zef4b+FJGi50lB
	YeuThAeMxvLEL86Fp7eeilOmoEKrx55h0bmgsF2GSvB5WdQKPwCkvMw0Edv9DNOFOypJMGkDOk5x3
	Z99Y5+UnawZfeOJIoyI1hRBRdmyoiJFV7+mlF0+OClULhPa/3KxhDi5UBiQfw1gLSkD7V0sHW5jOz
	VFiC9R+s1QMrt9F0I+avi8E8XZZtUqGPItpCRo9EFFeQ4XODe+8qxwiHX554BirfCi/GG3Bj2AjNR
	XezvbKb26yE8h7hE1quUWcW8xB3LLifxhxi88eH9Ylt7QbuSXSbf9E0L1H3sVpZmVqC0Md4b0cbBi
	+mRv86bAheAlMGb7SHQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVv1Q-00000009xq2-3tPs;
	Mon, 22 Jul 2024 15:32:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVv11-00000009xhK-24Hu
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 15:31:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721662314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jy2hKoepXG/rD4fs1gDu/NkLXDQ0MSD+ICWqPzfOpkw=;
	b=T+Dn4v7SbpLL5u5mlQYCPeYPbGJe8NS62iw+6OztSmSdEUjhqoj4UWRkSqxKhqRY59UgnO
	FhvXHgOTx3GLu5qfjys7a0b+36wM77ZHq7BkUQ1DAETUfJk7+BXOVZ9PJdwOIMgtt0jdKU
	joxacJgBNjCcwlWNOd7SFOt6X3unF58=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-hkKjvWnKNHmugInuoj815g-1; Mon, 22 Jul 2024 11:31:52 -0400
X-MC-Unique: hkKjvWnKNHmugInuoj815g-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-6657a405603so10591247b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jul 2024 08:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721662312; x=1722267112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jy2hKoepXG/rD4fs1gDu/NkLXDQ0MSD+ICWqPzfOpkw=;
        b=ogymEuN0HcWEg7Cg5fGfIDq8R4ND0rRlm7Mtby/0McMkh2fG/Nk88M+gl+5HOZCIaA
         r6WWVrXhIWoS3dHDGgS7abjVb7NYPziW2I4CvscVQFCVFTdYTt4qCvsU6suWOPGKe4r8
         mCw5LMUXoQ4n2osZt/5ssojFsdKqX3F85Oipl4v1Xz+GbDx2Hn6V7Gw++l6qmHxAC2Sx
         PEKi5BcScelxt3NI6n7ydGV0/ZUg6frZ8eJZKCcP+NVrO2Up3IEja3azAjDvPshar/Q9
         dYnFGOjtCtIXIq66Xk/g+/leyJGRqxtIpAK7ElI/8qzULVoxeIoaAdMyo9ASFQUierrn
         uaog==
X-Forwarded-Encrypted: i=1; AJvYcCVNqIYe5WQQMGJ8V7xhlq6kWBVBnUUxWSk3OGv5+KNQASYltA+gB7yyxOmkMpOXEXqOSqpycj37CWmGhrOoWC+v8EK7JgVdtWXpV2juT/NK
X-Gm-Message-State: AOJu0Yz4JPRDArXp3795Rzec0Fi/pH0e2i4WEJFA7rc0j6TfO4zF1q9K
	ir0M6HvqoF79BfFI+JXRbC7daVrK2KOgyynSe1YfkJ5fChGDXRam10YBjFdsmsdzCq6dTZj90B1
	W+BSTMsPTL7n/IFiu02kERN1ShKcqmeXVqoiHO65saOb/StiUShIkw4KWMCeTyE5J0w==
X-Received: by 2002:a05:690c:12:b0:62f:7951:fe4d with SMTP id 00721157ae682-66a6645377bmr38047577b3.4.1721662311580;
        Mon, 22 Jul 2024 08:31:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjAYBMqsJOtNPwFqnMhMAJ/HDPRITSVBivrOVSPNdHxvmNPnz6ZnQiqjkhPkHbmoLpOWtDQA==
X-Received: by 2002:a05:690c:12:b0:62f:7951:fe4d with SMTP id 00721157ae682-66a6645377bmr38047287b3.4.1721662311092;
        Mon, 22 Jul 2024 08:31:51 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a198fba6efsm372071285a.41.2024.07.22.08.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 08:31:50 -0700 (PDT)
Date: Mon, 22 Jul 2024 11:31:48 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Vlastimil Babka <vbabka@suse.cz>,
	Oscar Salvador <osalvador@suse.de>, linux-s390@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Michal Hocko <mhocko@kernel.org>, linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org,
	Alex Williamson <alex.williamson@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>, x86@kernel.org,
	Alistair Popple <apopple@nvidia.com>, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Ryan Roberts <ryan.roberts@arm.com>,
	Hugh Dickins <hughd@google.com>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: Re: [PATCH RFC 0/6] mm: THP-agnostic refactor on huge mappings
Message-ID: <Zp57ZLk2IQoHOI7u@x1n>
References: <20240717220219.3743374-1-peterx@redhat.com>
 <cf36725d-c197-4c07-8998-d34711335fdb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cf36725d-c197-4c07-8998-d34711335fdb@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_083155_616873_51DC62C8 
X-CRM114-Status: GOOD (  40.26  )
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

On Mon, Jul 22, 2024 at 03:29:43PM +0200, David Hildenbrand wrote:
> On 18.07.24 00:02, Peter Xu wrote:
> > This is an RFC series, so not yet for merging.  Please don't be scared by
> > the code changes: most of them are code movements only.
> > 
> > This series is based on the dax mprotect fix series here (while that one is
> > based on mm-unstable):
> > 
> >    [PATCH v3 0/8] mm/mprotect: Fix dax puds
> >    https://lore.kernel.org/r/20240715192142.3241557-1-peterx@redhat.com
> > 
> > Overview
> > ========
> > 
> > This series doesn't provide any feature change.  The only goal of this
> > series is to start decoupling two ideas: "THP" and "huge mapping".  We
> > already started with having PGTABLE_HAS_HUGE_LEAVES config option, and this
> > one extends that idea into the code.
> > 
> > The issue is that we have so many functions that only compile with
> > CONFIG_THP=on, even though they're about huge mappings, and huge mapping is
> > a pretty common concept, which can apply to many things besides THPs
> > nowadays.  The major THP file is mm/huge_memory.c as of now.
> > 
> > The first example of such huge mapping users will be hugetlb.  We lived
> > until now with no problem simply because Linux almost duplicated all the
> > logics there in the "THP" files into hugetlb APIs.  If we want to get rid
> > of hugetlb specific APIs and paths, this _might_ be the first thing we want
> > to do, because we want to be able to e.g., zapping a hugetlb pmd entry even
> > if !CONFIG_THP.
> > 
> > Then consider other things like dax / pfnmaps.  Dax can depend on THP, then
> > it'll naturally be able to use pmd/pud helpers, that's okay.  However is it
> > a must?  Do we also want to have every new pmd/pud mappings in the future
> > to depend on THP (like PFNMAP)?  My answer is no, but I'm open to opinions.
> > 
> > If anyone agrees with me that "huge mapping" (aka, PMD/PUD mappings that
> > are larger than PAGE_SIZE) is a more generic concept than THP, then I think
> > at some point we need to move the generic code out of THP code into a
> > common code base.
> > 
> > This is what this series does as a start.
> 
> Hi Peter!
> 
> From a quick glimpse, patch #1-#4 do make sense independent of patch #5.
> 
> I am not so sure about all of the code movement in patch #5. If large folios
> are the future, then likely huge_memory.c should simply be the home for all
> that logic.
> 
> Maybe the goal should better be to compile huge_memory.c not only for THP,
> but also for other use cases that require that logic, and fence off all THP
> specific stuff using #ifdef?
> 
> Not sure, though. But a lot of this code movements/churn might be avoidable.

I'm fine using ifdefs in the current fine, but IMHO it's a matter of
whether we want to keep huge_memory.c growing into even larger file, and
keep all large folio logics only in that file.  Currently it's ~4000 LOCs.

Nornally I don't see this as much of a "code churn" category, because it
doesn't changes the code itself but only move things.  I personally also
prefer without code churns, but only in the case where there'll be tiny
little functional changes here and there without real benefit.

It's pretty unavoidable to me when one file grows too large and we'll need
to split, and in this case git doesn't have a good way to track such
movement..

Irrelevant of this, just to mention I think there's still one option that I
at least can make the huge pfnmap depends on THP again which shouldn't be a
huge deal (I don't have any use case that needs huge pfnmap but disable
THP, anyway..), so this series isn't an immediate concern to me for that
route.  But for a hugetlb rework this might be something we need to do,
because we simplly can't make CONFIG_HUGETLB rely on CONFIG_THP..

Thanks,

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
