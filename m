Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006AEC47DD9
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2024 02:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2dEQLg+MORr8ylIdCF4ge125aDswIbnvt8m7VTCL+rg=; b=ZjKxNXMZ5Tw5MI
	rvOvymf2e9tDTP/9EFncB/NzTSrlTET2OlVQ65lzAdvDh/VG3oxlZoXhfS9C/rF5rsVXzOe1J0bLV
	C16fW704l+IC91ilkrns4Ni79zsWbgoHuxUqUN8Wqo1U4Dq2O9tYDXYDuO9WhbCn1sBkJsP7AY8pE
	d/6aItJOwy5D0sgr5c1tgWdw9VFvr1rJ9QJ/bt54nQ92e4NasR28gTjc+mx0pi7Q6+nVpIgeyxI0f
	BhMtrYxUax/Q+ty930kqbx8c2jiFvub6FaLG/fLfD9QdvRv4KFpTp8OXeDqCESEIOfgioe/Ph2COy
	tfPdyF7vCEtS9Z9/1RqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnqv5-00000009Db1-1aVL;
	Sat, 23 Mar 2024 02:15:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnqv2-00000009DYO-0nUw
	for linux-riscv@lists.infradead.org;
	Sat, 23 Mar 2024 02:15:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711160128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pAkp5p3e769nx5gm8jMLR0gRsGSeiOkGgQjUssudat0=;
	b=jD9FrBoOpF1ijMzmHMb4WTjaTY7ga8/Oh5XO9n3zvRSYSzKBGUZgWwSp5TGyGR3pA/gYPM
	e6Jtw2eCxql5/3Fz9AB07i57HMBr4ELth4Nk7oqn02bAubVjWAn89cTvkL/VAXZGizvtvU
	lz1XGTeNZdP0zAqguCMwY0YdF2U4HG0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-sj_844cgMEqM1NPUhyQOCw-1; Fri, 22 Mar 2024 22:15:27 -0400
X-MC-Unique: sj_844cgMEqM1NPUhyQOCw-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-430c9bbe925so5082281cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2024 19:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711160124; x=1711764924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAkp5p3e769nx5gm8jMLR0gRsGSeiOkGgQjUssudat0=;
        b=LIVpXZGerUoUm3IhpRL156a0hz1SW/81LEv6ZPcUzyjvKgWW9hY1pg39rT0GoF74Gs
         G7trkWJyAgMIMTCWH1+g0lctKMzt7VHWq0a7eioieKw7ATKCisa2rNihhC4OnMLfBdof
         uT2OlJGGBNt75RcnG1P7ogzopUOfCJcEHoOzXRvhnzwbW1yQPw0gcachMA4RxLRxzilD
         +WT9ZiBuclDAn55pVrdanP1+kcHLto3+0l5lHWlDyxV1ELZmLx4fQmZmNYp1+tf/pLIv
         Rb6Fto4VSzCwSUfs1AoTL/sl82B9bAxhPuPaX8v5fukrMzU6D68qQSfdqLup0x6A0hAJ
         b+Yg==
X-Forwarded-Encrypted: i=1; AJvYcCV23e+TM2oIkPz5FMSOo7k/XWypZXJ5e4/+dvHoWLPJh4T4z96ixpnwIXdWrOgzIYUFNAZ5lI2yMGsjJAIHR4qhBVmnwMNPtcKYNXM7HOhp
X-Gm-Message-State: AOJu0Yy1hBIq9sbVxyqKD1nxabsPIIowqz/cWYLwhLS/mh2QXbo23tVe
	+APzecXZ0lENYVRmRzhSofi4116OiKaIxwaOnV1OKhUl0z8pu2VtSQ0y9I3hvAaBhlVUlmIdMiD
	oUA4i9R1hlfl6fiY8gV4bl1WjfnpJ6f6ma8D43JSygaacjkuRia0UC+8TlYfzYvxecg==
X-Received: by 2002:a05:622a:528b:b0:431:3e97:fb0b with SMTP id dr11-20020a05622a528b00b004313e97fb0bmr799008qtb.3.1711160124070;
        Fri, 22 Mar 2024 19:15:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSSiaxwf9qVJ61bWD658BkK6bIoISbqMAPHSz2R/uod8u0yF1+dnf1k4ZlNnixmtjYf7I/qg==
X-Received: by 2002:a05:622a:528b:b0:431:3e97:fb0b with SMTP id dr11-20020a05622a528b00b004313e97fb0bmr798965qtb.3.1711160123562;
        Fri, 22 Mar 2024 19:15:23 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id f9-20020a05622a114900b0043140cd9996sm152221qty.38.2024.03.22.19.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 19:15:23 -0700 (PDT)
Date: Fri, 22 Mar 2024 22:15:20 -0400
From: Peter Xu <peterx@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
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
	Muchun Song <muchun.song@linux.dev>,
	Christoph Hellwig <hch@infradead.org>,
	linux-riscv@lists.infradead.org,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH v3 12/12] mm/gup: Handle hugetlb in the generic
 follow_page_mask code
Message-ID: <Zf47OKjYjkUhs6AT@x1n>
References: <20240321220802.679544-1-peterx@redhat.com>
 <20240321220802.679544-13-peterx@redhat.com>
 <20240322134818.9b312f77629f79fcf1564b6f@linux-foundation.org>
 <Zf4mR_OxE5Ft4VJg@x1n>
MIME-Version: 1.0
In-Reply-To: <Zf4mR_OxE5Ft4VJg@x1n>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_191536_334362_12A9B91F 
X-CRM114-Status: GOOD (  47.81  )
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

On Fri, Mar 22, 2024 at 08:45:59PM -0400, Peter Xu wrote:
> On Fri, Mar 22, 2024 at 01:48:18PM -0700, Andrew Morton wrote:
> > On Thu, 21 Mar 2024 18:08:02 -0400 peterx@redhat.com wrote:
> > 
> > > From: Peter Xu <peterx@redhat.com>
> > > 
> > > Now follow_page() is ready to handle hugetlb pages in whatever form, and
> > > over all architectures.  Switch to the generic code path.
> > > 
> > > Time to retire hugetlb_follow_page_mask(), following the previous
> > > retirement of follow_hugetlb_page() in 4849807114b8.
> > > 
> > > There may be a slight difference of how the loops run when processing slow
> > > GUP over a large hugetlb range on cont_pte/cont_pmd supported archs: each
> > > loop of __get_user_pages() will resolve one pgtable entry with the patch
> > > applied, rather than relying on the size of hugetlb hstate, the latter may
> > > cover multiple entries in one loop.
> > > 
> > > A quick performance test on an aarch64 VM on M1 chip shows 15% degrade over
> > > a tight loop of slow gup after the path switched.  That shouldn't be a
> > > problem because slow-gup should not be a hot path for GUP in general: when
> > > page is commonly present, fast-gup will already succeed, while when the
> > > page is indeed missing and require a follow up page fault, the slow gup
> > > degrade will probably buried in the fault paths anyway.  It also explains
> > > why slow gup for THP used to be very slow before 57edfcfd3419 ("mm/gup:
> > > accelerate thp gup even for "pages != NULL"") lands, the latter not part of
> > > a performance analysis but a side benefit.  If the performance will be a
> > > concern, we can consider handle CONT_PTE in follow_page().
> > > 
> > > Before that is justified to be necessary, keep everything clean and simple.
> > > 
> > 
> > mm/gup.c:33:21: warning: 'follow_hugepd' declared 'static' but never defined [-Wunused-function]
> >    33 | static struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
> >       |                     ^~~~~~~~~~~~~
> > 
> > --- a/mm/gup.c~mm-gup-handle-hugepd-for-follow_page-fix
> > +++ a/mm/gup.c
> > @@ -30,10 +30,12 @@ struct follow_page_context {
> >  	unsigned int page_mask;
> >  };
> >  
> > +#ifdef CONFIG_HAVE_FAST_GUP
> >  static struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
> >  				  unsigned long addr, unsigned int pdshift,
> >  				  unsigned int flags,
> >  				  struct follow_page_context *ctx);
> > +#endif
> >  
> >  static inline void sanity_check_pinned_pages(struct page **pages,
> >  					     unsigned long npages)
> > _
> > 
> > 
> > This looks inelegant.
> > 
> > That's two build issues so far.  Please be more expansive in the
> > Kconfig variations when testing.  Especially when mucking with pgtable
> > macros.
> 
> Andrew,
> 
> Apologies for that, and also for a slightly late response.  Yeah it's time
> I'll need my set of things to do serious build tests, and I'll at least
> start to cover a few error prone configs/archs in with that.
> 
> I was trying to rely on the build bot in many of previous such cases, as
> that was quite useful to me to cover many build issues without investing my
> own test setups, but I think for some reason it retired and stopped working
> for a while.  Maybe I shouldn't have relied on it at all.
> 
> For this specific issue, I'm not sure if CONFIG_HAVE_FAST_GUP is proper?
> As follow_hugepd() is used in slow gup not fast.  So maybe we can put that
> under CONFIG_MMU below that code (and I think we can drop "static" too as I
> don't think it's anything useful).  My version of fixup attached at the end

the static is useful; below patch did pass on m68k but won't on
x86.. ignore that please.

> of email, and I verified it on m68k build.
> 
> I do plan to post a small fixup series to fix these issues (so far it may
> contain 1 formal patch to touch up vmstat_item_print_in_thp, and 2 fixups
> where I'll mark the subject with "fixup!" properly).  Either you can pick
> up below or you can wait for my small patchset, should be there either
> today or tomorrow.

I changed plan here too; I found more users of HPAGE_PMD_NR assuming it's
defined even if !CONFIG_MMU.  That's weird, as CONFIG_MMU doesn't even
define PMD_SHIFT...  To fix this I decided to use the old trick on using
BUILD_BUG() like it used to work before; frankly I don't know how that
didn't throw warnings, but i'll make sure it passes all known builds (ps: I
still haven't got my build harness ready, so that will still be limited but
should solve known issues).

In short: please wait for my fixup series.  Thanks.

> 
> Thanks,
> 
> ===8<===
> diff --git a/mm/gup.c b/mm/gup.c
> index 4cd349390477..a2ed8203495a 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -30,11 +30,6 @@ struct follow_page_context {
>         unsigned int page_mask;
>  };
>  
> -static struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
> -                                 unsigned long addr, unsigned int pdshift,
> -                                 unsigned int flags,
> -                                 struct follow_page_context *ctx);
> -
>  static inline void sanity_check_pinned_pages(struct page **pages,
>                                              unsigned long npages)
>  {
> @@ -505,6 +500,12 @@ static inline void mm_set_has_pinned_flag(unsigned long *mm_flags)
>  }
>  
>  #ifdef CONFIG_MMU
> +
> +struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
> +                          unsigned long addr, unsigned int pdshift,
> +                          unsigned int flags,
> +                          struct follow_page_context *ctx);
> +
>  static struct page *no_page_table(struct vm_area_struct *vma,
>                                   unsigned int flags, unsigned long address)
>  {
> ===8<===
> 
> -- 
> Peter Xu

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
