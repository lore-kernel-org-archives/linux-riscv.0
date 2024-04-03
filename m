Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9C5CD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 18:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2vuHycHvtrFrqj+8R6J4TZf5EYjuoMGho3gX4RrzcPs=; b=p3qVKh0jAep/1O
	zVFMcFMY9XtrUorFw70cqYTaN9qYoH/PWYLfCP0G2HYwe9/3WP8UU73D3qqBwQIZF4232ha+zbLvC
	s7cW6jrhw0qt1uoeVeHTEa80TxyPd/Z23IEjRnd1xH0FfckHDKuzTzdUh1+6ewjH3tjdr/Fwqpr9r
	12KRtmtGlmOEu9AT/QyNtQvj5QdWeL6Jdr2z8a//TGqisir+4ipiq3ATdk6LRRXFagzjCQft2hINl
	XFIfHP0graIUlwNICKb/4iWJ9ur1tZKzWI45znpatMU8e4ZrLVUDJOFV5W4hvazVJozURRMIC/1rT
	c//C0V7FqkusbM1E4Sig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs5Ij-0000000HNxP-0ibK;
	Wed, 03 Apr 2024 18:25:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs5Ie-0000000HNsI-14IT
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 18:25:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712168726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YXsmqoOHzY6mBushOHoxlZz3TK/EfZqT4lQukaq20AM=;
	b=P7wQeRaO8pvv+bsOulr62tjYpf9C/Ld0fZFLGcYNPH5EYnIjilLCjxadWI9eW7sFMOz2Sl
	YOtZmbPJrKk3igLm1q8w23oy+TciBsvtxjKiAoMtSgx1j9gd25lh9l5ZeYbV3Zmx4aZXY2
	s47pBu5TUZPUCNmoQImKpUIaxAbU+eE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-Udli9ZzJP9OF08TcIdcwtA-1; Wed, 03 Apr 2024 14:25:24 -0400
X-MC-Unique: Udli9ZzJP9OF08TcIdcwtA-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6991ad4ea9eso182586d6.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 11:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712168724; x=1712773524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXsmqoOHzY6mBushOHoxlZz3TK/EfZqT4lQukaq20AM=;
        b=Ulik++2OtfS7aOCvE1oUjHJONpnjDrGn6VjGX0MyWLLoVAyTuzqzC5w3wXt465XVAm
         Wp4rAHBjtNhI0YoRnew414rwxEL4yPYyKak7aW++FqHOVnHyKBhQ6126zLHTKBH7dGgC
         uM1p3Ue2Mh02I8CmN/2PE9g/8jdT3TglPohH1gdWI88IULh+TbNtMjjBGBH+vtqgYdzH
         yzpvKfT6e7cTbjShFUuQ1bgvJszjBWbcQ8u6G5fuv31AviuLR4AJgGT5OlA/L1PK0DVf
         WGUH6MiIFEH0GYjGxC3S5ujYXWHuAeNkOJ8JZkwt2GuHaP1y2usPU+nLL9VelmoQi0v2
         PStQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXCGsbFeLiC2sbsO9xrjnzJ8Ig9qdyMw3eZg68ZlTWCKqAf3n6TBfG0AKawVQ40rW0Qrkg7KHhn+WcxLssuXpBCQdXL1dYK/7ytC43+20w
X-Gm-Message-State: AOJu0Yy6f0MfoscPRNhRkMmaQdMHKEG+qdHqpfdgrNmOgPgdMANnqJF8
	j0OK6GrzLXBXRTliOcjitpctfsZIRqZAKdL42cWo/xiiIXSrCyUU0a9TcE/lqz72P+JmHJgEApN
	ONYY1ZXVzwLthqGo1x8vs6BircgfWzFyLHtHxqWuaL/zWt7I5fDf0sFZkWe3Rq2OfeA==
X-Received: by 2002:ad4:5cab:0:b0:699:2242:4ee8 with SMTP id q11-20020ad45cab000000b0069922424ee8mr129111qvh.3.1712168724113;
        Wed, 03 Apr 2024 11:25:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOuNMZozoa6aScFD4XBgyXphotERni3kWeSwgWQ4wF27W29jsLbCwW0feeq4rwhZfTMS4o4A==
X-Received: by 2002:ad4:5cab:0:b0:699:2242:4ee8 with SMTP id q11-20020ad45cab000000b0069922424ee8mr129072qvh.3.1712168723495;
        Wed, 03 Apr 2024 11:25:23 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id s15-20020a0562140caf00b00698fd63d167sm4435500qvs.123.2024.04.03.11.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 11:25:23 -0700 (PDT)
Date: Wed, 3 Apr 2024 14:25:20 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Yang Shi <shy828301@gmail.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Andrew Jones <andrew.jones@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Rik van Riel <riel@surriel.com>,
	linux-arm-kernel@lists.infradead.org,
	Andrea Arcangeli <aarcange@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	James Houghton <jthoughton@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev
Subject: Re: [PATCH v4 05/13] mm/arch: Provide pud_pfn() fallback
Message-ID: <Zg2fEP4eEeLhgDwE@x1n>
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-6-peterx@redhat.com>
 <20240402190549.GA706730@dev-arch.thelio-3990X>
 <ZgyKLLVZ4vN56uZE@x1n>
 <20240402225320.GU946323@nvidia.com>
 <ZgyWUYVdUsAiXCC4@xz-m1.local>
 <20240403120841.GB1723999@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240403120841.GB1723999@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_112528_466416_0BCD3AB7 
X-CRM114-Status: GOOD (  29.05  )
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

On Wed, Apr 03, 2024 at 09:08:41AM -0300, Jason Gunthorpe wrote:
> On Tue, Apr 02, 2024 at 07:35:45PM -0400, Peter Xu wrote:
> > On Tue, Apr 02, 2024 at 07:53:20PM -0300, Jason Gunthorpe wrote:
> > > On Tue, Apr 02, 2024 at 06:43:56PM -0400, Peter Xu wrote:
> > > 
> > > > I actually tested this without hitting the issue (even though I didn't
> > > > mention it in the cover letter..).  I re-kicked the build test, it turns
> > > > out my "make alldefconfig" on loongarch will generate a config with both
> > > > HUGETLB=n && THP=n, while arch/loongarch/configs/loongson3_defconfig has
> > > > THP=y (which I assume was the one above build used).  I didn't further
> > > > check how "make alldefconfig" generated the config; a bit surprising that
> > > > it didn't fetch from there.
> > > 
> > > I suspect it is weird compiler variations.. Maybe something is not
> > > being inlined.
> > > 
> > > > (and it also surprises me that this BUILD_BUG can trigger.. I used to try
> > > >  triggering it elsewhere but failed..)
> > > 
> > > As the pud_leaf() == FALSE should result in the BUILD_BUG never being
> > > called and the optimizer removing it.
> > 
> > Good point, for some reason loongarch defined pud_leaf() without defining
> > pud_pfn(), which does look strange.
> > 
> > #define pud_leaf(pud)		((pud_val(pud) & _PAGE_HUGE) != 0)
> > 
> > But I noticed at least MIPS also does it..  Logically I think one arch
> > should define either none of both.
> 
> Wow, this is definately an arch issue. You can't define pud_leaf() and
> not have a pud_pfn(). It makes no sense at all..
> 
> I'd say the BUILD_BUG has done it's job and found an issue, fix it by
> not defining pud_leaf? I don't see any calls to pud_leaf in loongarch
> at least

Yes, that sounds better too to me, however it means we may also risk other
archs that can fail another defconfig build.. and I worry I bring trouble
to multiple such cases.  Fundamentally it's indeed my patch that broke
those builds, so I still sent the change and leave that for arch developers
to decide the best for the archs.

I think if wanted, we can add that BUILD_BUG() back when we're sure no arch
will break with it.  So such changes from arch can still be proposed
alongside of removal of BUILD_BUG() (and I'd guess some other arch will
start to notice such build issue soon if existed.. so it still more or less
has similar effect of a reminder..).

Thanks,

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
