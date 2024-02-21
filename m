Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4972C48BC3
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 11:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S91loozfKCbxJzEGjHq5Bn6cE59lRSAHp/fH2EJqzCY=; b=NAOyrAcHhEKbyc
	oqO5u6f9WZeTqEr5EeN/hKSZo5wAWw1vNqB1bI8X3+mpIDzhC47dLSkloTco0/gZzZAWBrhqgSs5v
	98L3R8N142sxbMV60TBILaQFQsaHIZ65qKndMRpHxH1WOVZ3FBR6LfCLExXKHsYBC7NX22aVUuO7k
	wonNBO/936y6GOXf7JVePFNzYzyEpeafhsQDKEEsVzTlGmdYdc7FAWyVb44vPMuPjhmMi3rD42vMu
	dzwc0Gp08oIu8lkFB3nVq1QBCT7puLICO9UBJeyrD0eCNkvu3Wewl+JtJ5jeArkUp695xL4k7xAZM
	TiouyCY1ixizcKYQmO4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcl6d-00000000lAU-3SLa;
	Wed, 21 Feb 2024 11:49:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcl6a-00000000l8w-3ZOT
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 11:49:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708516180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bin7AzDlChDSAGWFKufeiYIoVcIyTk+S1hiBB6egTbw=;
	b=TwtdKqhcXk+5x9U/s0uXYK2UwKi+ryAn152LJTpN9lwzZx3yePbRiXUcW8vs4yLFokD0qX
	1B3wEv02Hm3gdk62oSLSOTrO2EfSwGHbtB0hWffwQbWSqN3/rTymrNdI5tJNfjPOKIVUts
	JsrdV1Um+0VVm75sc7CIY/h+pPa2rBk=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554--PM-Aaf9N3y6M6fg3Tud4A-1; Wed, 21 Feb 2024 06:49:36 -0500
X-MC-Unique: -PM-Aaf9N3y6M6fg3Tud4A-1
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-5a0168a3df5so207256eaf.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Feb 2024 03:49:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708516175; x=1709120975;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bin7AzDlChDSAGWFKufeiYIoVcIyTk+S1hiBB6egTbw=;
        b=HcrlJoGjmgd8yTxmhRm19i3Qmlrm+09U0btiDnOw++SFFXqPUxY+VAiq+zffjk1vDZ
         MjtS/REpk0894D0YTZpGJtwslQ+bIfnVKAGeU2mr3J47bCOZfT/uG+pSsVU5vedDaGlL
         N4Un/m2JDnCyL4nq6FMGwdwZ/lZmYsqg4Su5YNU67rlr2N9LZOJa7I+aMqGcFFIoSROr
         u4vk4nfNoDDa+Nmv0qwEI/B4MhTww+WV+b64R3Kj+X/DywcaXsKkITfejjwTzaY5qrQU
         0qtDmMmW64Lwie5T5voqH04MoUT7tAoiRadOnbpG1HjbCn6exGew5k4nnEZJDemabtEg
         THSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvTy7H89dmq24FLN7a8jWGjILest+Pdh5t6hMo2IDuvj0ssEKLaPVngA5jETy/hHI5ePiqfWBqAgHfkKmL9eTGFz2nZcXSky5zf3jaXvWg
X-Gm-Message-State: AOJu0YwEey2qQlMbRxLuIIKQmSbtP/3vXg1XKRhXk+EOhe5Y9XlPcKl8
	HlyGaKQiQoMhawS3cU/9AnafcjHCY2EdlMfO8DaCqzgHLWDgZ8BZUWA1Nf0EKCnOOSmWHSeIlBp
	AdffUMhpaJe8XAjKUAP4d+Y+0rGvNpD64mlSlO3uaiYfF0n0oVTfgpn9zdCLQpYPNeg==
X-Received: by 2002:a05:6358:e49a:b0:178:9f1d:65e3 with SMTP id by26-20020a056358e49a00b001789f1d65e3mr16912418rwb.0.1708516175542;
        Wed, 21 Feb 2024 03:49:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzL228YTGBKB2uXR1bZQUntRIhXzOYaVH/u+cU7rZshqOXYoJ5XOeq8q0ePg1PQ/TTyms+Jw==
X-Received: by 2002:a05:6358:e49a:b0:178:9f1d:65e3 with SMTP id by26-20020a056358e49a00b001789f1d65e3mr16912401rwb.0.1708516175144;
        Wed, 21 Feb 2024 03:49:35 -0800 (PST)
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id w24-20020aa78598000000b006e4695e519csm5146763pfn.194.2024.02.21.03.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 03:49:34 -0800 (PST)
Date: Wed, 21 Feb 2024 19:49:22 +0800
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
Subject: Re: [PATCH v2 10/13] mm/gup: Handle huge pud for follow_pud_mask()
Message-ID: <ZdXjQjow4fa41ORD@x1n>
References: <20240103091423.400294-1-peterx@redhat.com>
 <20240103091423.400294-11-peterx@redhat.com>
 <20240115184900.GV734935@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240115184900.GV734935@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_034940_971308_879AA19D 
X-CRM114-Status: GOOD (  24.08  )
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

On Mon, Jan 15, 2024 at 02:49:00PM -0400, Jason Gunthorpe wrote:
> On Wed, Jan 03, 2024 at 05:14:20PM +0800, peterx@redhat.com wrote:
> > diff --git a/mm/gup.c b/mm/gup.c
> > index 63845b3ec44f..760406180222 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -525,6 +525,70 @@ static struct page *no_page_table(struct vm_area_struct *vma,
> >  	return NULL;
> >  }
> >  
> > +#ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
> > +static struct page *follow_huge_pud(struct vm_area_struct *vma,
> > +				    unsigned long addr, pud_t *pudp,
> > +				    int flags, struct follow_page_context *ctx)
> > +{
> > +	struct mm_struct *mm = vma->vm_mm;
> > +	struct page *page;
> > +	pud_t pud = *pudp;
> > +	unsigned long pfn = pud_pfn(pud);
> > +	int ret;
> > +
> > +	assert_spin_locked(pud_lockptr(mm, pudp));
> > +
> > +	if ((flags & FOLL_WRITE) && !pud_write(pud))
> > +		return NULL;
> > +
> > +	if (!pud_present(pud))
> > +		return NULL;
> > +
> > +	pfn += (addr & ~PUD_MASK) >> PAGE_SHIFT;
> > +
> > +#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
> > +	if (pud_devmap(pud)) {
> 
> Can this use IS_ENABLED(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD) ?

Sure.

> 
> > +		/*
> > +		 * device mapped pages can only be returned if the caller
> > +		 * will manage the page reference count.
> > +		 *
> > +		 * At least one of FOLL_GET | FOLL_PIN must be set, so
> > +		 * assert that here:
> > +		 */
> > +		if (!(flags & (FOLL_GET | FOLL_PIN)))
> > +			return ERR_PTR(-EEXIST);
> > +
> > +		if (flags & FOLL_TOUCH)
> > +			touch_pud(vma, addr, pudp, flags & FOLL_WRITE);
> > +
> > +		ctx->pgmap = get_dev_pagemap(pfn, ctx->pgmap);
> > +		if (!ctx->pgmap)
> > +			return ERR_PTR(-EFAULT);
> > +	}
> > +#endif	/* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
> > +	page = pfn_to_page(pfn);
> > +
> > +	if (!pud_devmap(pud) && !pud_write(pud) &&
> > +	    gup_must_unshare(vma, flags, page))
> > +		return ERR_PTR(-EMLINK);
> > +
> > +	ret = try_grab_page(page, flags);
> > +	if (ret)
> > +		page = ERR_PTR(ret);
> > +	else
> > +		ctx->page_mask = HPAGE_PUD_NR - 1;
> > +
> > +	return page;
> > +}
> > +#else  /* CONFIG_PGTABLE_HAS_HUGE_LEAVES */
> > +static struct page *follow_huge_pud(struct vm_area_struct *vma,
> > +				    unsigned long addr, pud_t *pudp,
> > +				    int flags, struct follow_page_context *ctx)
> > +{
> > +	return NULL;
> > +}
> > +#endif	/* CONFIG_PGTABLE_HAS_HUGE_LEAVES */
> > +
> >  static int follow_pfn_pte(struct vm_area_struct *vma, unsigned long address,
> >  		pte_t *pte, unsigned int flags)
> >  {
> > @@ -760,11 +824,11 @@ static struct page *follow_pud_mask(struct vm_area_struct *vma,
> >  
> >  	pudp = pud_offset(p4dp, address);
> >  	pud = READ_ONCE(*pudp);
> > -	if (pud_none(pud))
> > +	if (pud_none(pud) || !pud_present(pud))
> >  		return no_page_table(vma, flags, address);
> 
> Isn't 'pud_none() || !pud_present()' redundent? A none pud is
> non-present, by definition?

Hmm yes, seems redundant.  Let me drop it.

> 
> > -	if (pud_devmap(pud)) {
> > +	if (pud_huge(pud)) {
> >  		ptl = pud_lock(mm, pudp);
> > -		page = follow_devmap_pud(vma, address, pudp, flags, &ctx->pgmap);
> > +		page = follow_huge_pud(vma, address, pudp, flags, ctx);
> >  		spin_unlock(ptl);
> >  		if (page)
> >  			return page;
> 
> Otherwise it looks OK to me
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Thanks!

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
