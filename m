Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF20C47DD9
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 15:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pb9PHh6puTH0IRK2HNQ+nOi31vKD03BWv1Yrv4dPq14=; b=loZUk866lgtGlt
	nBsauQ0vVN93+0JY+/7h0wkhsBshhYWyySV7eQNwq4n2qshLfpY2Yk+z7mVeQA2vkPw9me/+Cux9N
	i+1Z43IulF6e13DHOXqgoyOX8cbEWNXXExjjQEDXAvubBNc0B7LC6yAYDH/9Whr1r/7HAYYL05nPe
	J1L6yr8y4+xgA0iwKNolAm0GRuQ2sWJTd4+Bn4mU1Hw6mgHVvK+uY5CcnlVcVMvwUq+xX7q9TP8nq
	861ZaSR1RDRk43i+KE+ofbjCytO0OWeEg4gWA+7nYu7p8qOu83ly63q4z1Hp+ZlbVQWY7UwY9uDAM
	TByTl0WiiBtMUQeNuRKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnhEp-00000007ptE-3K5p;
	Fri, 22 Mar 2024 15:55:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnhEn-00000007ps2-0Bta
	for linux-riscv@lists.infradead.org;
	Fri, 22 Mar 2024 15:55:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711122920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QJLFb75dlh9Ilo5izUjxoeGL/8+am1RJvB8MBnP+8/Q=;
	b=fWVURMiQ5dd5Ao5d0q5LExeFJMB0B0t6ZIcm6V4PNGgLub9IQ5KCfo1oqiniA9YePKSTrj
	hWCS7CFqi4hDuMOfnKlsEx/9zRFaotgq70f5jvPN72QhOrvGWYMoQ9tYTtJfIVBGQjctgo
	wwdLR4zAh51n45sR6lbKHPc8UwI88Pk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-dPbukjC5Ple6j5fitMMYuw-1; Fri, 22 Mar 2024 11:55:16 -0400
X-MC-Unique: dPbukjC5Ple6j5fitMMYuw-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-69672754479so912106d6.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2024 08:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711122916; x=1711727716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJLFb75dlh9Ilo5izUjxoeGL/8+am1RJvB8MBnP+8/Q=;
        b=dnPYjJOTo/blTM8rD65XgXLnKcgXqVVg5CQEFgzWnbBIfNRQXgIgg2D+etyq6ZFqht
         p5KA+m0EjGKQStugyJvZ3rqw3YZDdgWGId1hIzh0CeAY6HMesfKSytbnZ9Y0kYltlOZN
         0GnFlCi5AdN/ku4smtR3eQs9aWlWoWR7F6e9rqN0/a6ddpBNtHL0PRcfVDsfwxtYy5Cl
         Njf4IoD6+yDM6Cl3qnK69oronNblaQ3v20NCoRMKah2qduJ9baB1iNMr+xZ9ZA6xz/xX
         s0ZuMOpC1FL9UIwQZj3KLJMmBYBBkVVhFnmdjbyvzg6Ubl6A825NQcA+g8RNLYszGhtS
         l9xw==
X-Forwarded-Encrypted: i=1; AJvYcCVxwODihPPKeuvIAiRO+StoShy5uCNCCnZPXWZQxjA3t70DcN7rOGz4PLi/mVi5lusrITM74wfbyMnUyHBTfDk4zgTMCvB0B9jrWwupcVXU
X-Gm-Message-State: AOJu0YwCEocsnb9UFllTC8elE+DTEQd2wFB8A0hvKsedWHYdvgYtMeVQ
	40HsQb7kHdlXd3qMDkjSIt+gwUmGtZTdMzVejB6OnKN8mFvxEN01xxprVIX+e3Bau0QnrXyzB0c
	Q5QNAvqOT5dutWd7zItGI9pTxeOTOg3k2crq9WWVxFLk6+VUtZwXbRwn/kZvKoVdMIg==
X-Received: by 2002:a05:6214:2b86:b0:696:732f:41ce with SMTP id kr6-20020a0562142b8600b00696732f41cemr1030618qvb.0.1711122916052;
        Fri, 22 Mar 2024 08:55:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcGgYl+6vk8GOgJHrnHh9Bk553GXwTOWFwJfwdxmayaEVIZH35b8wrrTSaV+/rgNR3L0gYLQ==
X-Received: by 2002:a05:6214:2b86:b0:696:732f:41ce with SMTP id kr6-20020a0562142b8600b00696732f41cemr1030577qvb.0.1711122915578;
        Fri, 22 Mar 2024 08:55:15 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id jx12-20020a0562142b0c00b0068ff8bda6c7sm1185452qvb.92.2024.03.22.08.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 08:55:14 -0700 (PDT)
Date: Fri, 22 Mar 2024 11:55:11 -0400
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
Subject: Re: [PATCH v3 12/12] mm/gup: Handle hugetlb in the generic
 follow_page_mask code
Message-ID: <Zf2p38Pb51T3e9uB@x1n>
References: <20240321220802.679544-1-peterx@redhat.com>
 <20240321220802.679544-13-peterx@redhat.com>
 <20240322133012.GI159172@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240322133012.GI159172@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_085521_163796_8C18A76F 
X-CRM114-Status: GOOD (  23.49  )
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

Jason,

On Fri, Mar 22, 2024 at 10:30:12AM -0300, Jason Gunthorpe wrote:
> On Thu, Mar 21, 2024 at 06:08:02PM -0400, peterx@redhat.com wrote:
> 
> > A quick performance test on an aarch64 VM on M1 chip shows 15% degrade over
> > a tight loop of slow gup after the path switched.  That shouldn't be a
> > problem because slow-gup should not be a hot path for GUP in general: when
> > page is commonly present, fast-gup will already succeed, while when the
> > page is indeed missing and require a follow up page fault, the slow gup
> > degrade will probably buried in the fault paths anyway.  It also explains
> > why slow gup for THP used to be very slow before 57edfcfd3419 ("mm/gup:
> > accelerate thp gup even for "pages != NULL"") lands, the latter not part of
> > a performance analysis but a side benefit.  If the performance will be a
> > concern, we can consider handle CONT_PTE in follow_page().
> 
> I think this is probably fine for the moment, at least for this
> series, as CONT_PTE is still very new.
> 
> But it will need to be optimized. "slow" GUP is the only GUP that is
> used by FOLL_LONGTERM and it still needs to be optimized because you
> can't assume a FOLL_LONGTERM user will be hitting the really slow
> fault path. There are enough important cases where it is just reading
> already populted page tables, and these days, often with large folios.

Ah, I thought FOLL_LONGTERM should work in most cases for fast-gup,
especially for hugetlb, but maybe I missed something?  I do see that devmap
skips fast-gup for LONGTERM, we also have that writeback issue but none of
those that I can find applies to hugetlb.  This might be a problem indeed
if we have hugetlb cont_pte pages that will constantly fallback to slow
gup.

OTOH, I also agree with you that such batching would be nice to have for
slow-gup, likely devmap or many fs (exclude shmem/hugetlb) file mappings
can at least benefit from it due to above.  But then that'll be a more
generic issue to solve, IOW, we still don't do that for !hugetlb cont_pte
large folios, before or after this series.

> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Thanks!

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
