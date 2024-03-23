Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C47C54E64
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2024 00:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J1W0SghuTx9dOJsw5T+BH+zbu7BhGOEf1uIKlBMAAXU=; b=mPGZAhPmm5XOCJ
	5AFI1lFYii/hNi0KAu/h4kxR11rvT8VQLXxwuTkppKgq89QBQSEVfEMjK1jxC4iSoS19U3/auvWja
	oHtxVttc6j9A8eGgXBm4vG+mt8mNxj7XQFw64sbvmQXoi/WprkN4qzz6Dd53488xjKNu3QKah1SoV
	/zq+sxDlw3E9Up1notlNO4j1oAT6vuQLVmmtVhJb5njmDBSbV5oeLwBa1nZ6xwys+xss2CeEOLPpG
	1nHAQKaWd6kYW/hRS/q8ytcxwa0n+WUy1bbv3KjKInE0p4DeqoNJc1+N97gFEbaG0SsnsqK63+Xrs
	te9DEunp/oizLyR3IOgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnpWV-0000000948g-3SuF;
	Sat, 23 Mar 2024 00:46:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnpWR-0000000946P-1EZl
	for linux-riscv@lists.infradead.org;
	Sat, 23 Mar 2024 00:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711154766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1OPeHdcChNLXNL4AZVVP+Dj6erLbPxRFcj0CZKU2hHc=;
	b=Suxl2RdSBOkopv3J73sHPjioyuGHRS4/2uhrnSDvYT8JbetMM5yZ5o7woN6co+uKZr9IJB
	ggX1f15JnW3e6RCJQQTjNRDSIHA4XsXfna9LL9jHhTKaj37yPCaoznSXlBGdpNoKZigdxJ
	e9gV/uG2iamfDlVJHMXQ4pyJZs1se5w=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-2lmrfUnbMrOTeth_yQag1A-1; Fri, 22 Mar 2024 20:46:05 -0400
X-MC-Unique: 2lmrfUnbMrOTeth_yQag1A-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-430b9ee6bfbso5526121cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2024 17:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711154763; x=1711759563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OPeHdcChNLXNL4AZVVP+Dj6erLbPxRFcj0CZKU2hHc=;
        b=HY0auQSeBWL4FHs7j0DTgaBXIy6VORybpdVerkb0FJkVWliBwJKvOi2qSgW8Pb63en
         lV7trxhUuAFAYP1xqdBUs2yxPmHzm1EcoO0Ou9lKSNx5PJbFM3kJ48XmXliHACVd/+ij
         4A0ym9+UWy+ja2mXD32PQLv3Tq8bdtVlVxbSj0Lnr8gqip58MnhrsiGV0cLbZTUvsSvR
         rwQ8+Q5eZmmDeB5bAQP6zl07nWN4QXe90GyRen8s5kEZNuuKgPpxl7wE4FSB6aTOWQCo
         GZimhT3gXJj4pAtFIw7cNFZEbSEV6jIYPBHdyhz+LDULcBxzePWQzfNQZRgh/tC77Lpt
         e/JA==
X-Forwarded-Encrypted: i=1; AJvYcCWMLQAwmqOmx78LTMafHtN2BAquFgcgZ4iMWJi+gYCaHAilwNmzDYE1YLIUlNFVi8UOD1of+B9ZyWW9SqO1hf8hXOosIC4gZlgMuqGC22iX
X-Gm-Message-State: AOJu0Yzc1zNQHV2TuOaKwGZOwFyA3lPGr23xr+SHLv/QUFr31vENIt7c
	4LSjiFb9gs+CXXjWe8ivsr5xBgYoqcva2Y/U7lxOb1hD44wUIr4cQsRtgdw8vwd1B99rhkbHa+u
	uTJ48DwmgajeZKUnFjPCTA+b5ftsAQ8048NOI2MTYI74/Z2g2BFV1VImiNPPyAF5CZA==
X-Received: by 2002:a05:6214:3d8c:b0:696:1892:c19f with SMTP id om12-20020a0562143d8c00b006961892c19fmr1028536qvb.3.1711154762686;
        Fri, 22 Mar 2024 17:46:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxKOcFDVxpG3qeQleX58Tuq2r0TaBTmm4VWGOLqVds86GEmp/lVpAtwxST9mY/JIaYF94G+w==
X-Received: by 2002:a05:6214:3d8c:b0:696:1892:c19f with SMTP id om12-20020a0562143d8c00b006961892c19fmr1028507qvb.3.1711154762082;
        Fri, 22 Mar 2024 17:46:02 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id jf8-20020a0562142a4800b006942dcac56asm1567334qvb.103.2024.03.22.17.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 17:46:01 -0700 (PDT)
Date: Fri, 22 Mar 2024 20:45:59 -0400
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
Message-ID: <Zf4mR_OxE5Ft4VJg@x1n>
References: <20240321220802.679544-1-peterx@redhat.com>
 <20240321220802.679544-13-peterx@redhat.com>
 <20240322134818.9b312f77629f79fcf1564b6f@linux-foundation.org>
MIME-Version: 1.0
In-Reply-To: <20240322134818.9b312f77629f79fcf1564b6f@linux-foundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_174607_506916_49612F33 
X-CRM114-Status: GOOD (  35.27  )
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

On Fri, Mar 22, 2024 at 01:48:18PM -0700, Andrew Morton wrote:
> On Thu, 21 Mar 2024 18:08:02 -0400 peterx@redhat.com wrote:
> 
> > From: Peter Xu <peterx@redhat.com>
> > 
> > Now follow_page() is ready to handle hugetlb pages in whatever form, and
> > over all architectures.  Switch to the generic code path.
> > 
> > Time to retire hugetlb_follow_page_mask(), following the previous
> > retirement of follow_hugetlb_page() in 4849807114b8.
> > 
> > There may be a slight difference of how the loops run when processing slow
> > GUP over a large hugetlb range on cont_pte/cont_pmd supported archs: each
> > loop of __get_user_pages() will resolve one pgtable entry with the patch
> > applied, rather than relying on the size of hugetlb hstate, the latter may
> > cover multiple entries in one loop.
> > 
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
> > 
> > Before that is justified to be necessary, keep everything clean and simple.
> > 
> 
> mm/gup.c:33:21: warning: 'follow_hugepd' declared 'static' but never defined [-Wunused-function]
>    33 | static struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
>       |                     ^~~~~~~~~~~~~
> 
> --- a/mm/gup.c~mm-gup-handle-hugepd-for-follow_page-fix
> +++ a/mm/gup.c
> @@ -30,10 +30,12 @@ struct follow_page_context {
>  	unsigned int page_mask;
>  };
>  
> +#ifdef CONFIG_HAVE_FAST_GUP
>  static struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
>  				  unsigned long addr, unsigned int pdshift,
>  				  unsigned int flags,
>  				  struct follow_page_context *ctx);
> +#endif
>  
>  static inline void sanity_check_pinned_pages(struct page **pages,
>  					     unsigned long npages)
> _
> 
> 
> This looks inelegant.
> 
> That's two build issues so far.  Please be more expansive in the
> Kconfig variations when testing.  Especially when mucking with pgtable
> macros.

Andrew,

Apologies for that, and also for a slightly late response.  Yeah it's time
I'll need my set of things to do serious build tests, and I'll at least
start to cover a few error prone configs/archs in with that.

I was trying to rely on the build bot in many of previous such cases, as
that was quite useful to me to cover many build issues without investing my
own test setups, but I think for some reason it retired and stopped working
for a while.  Maybe I shouldn't have relied on it at all.

For this specific issue, I'm not sure if CONFIG_HAVE_FAST_GUP is proper?
As follow_hugepd() is used in slow gup not fast.  So maybe we can put that
under CONFIG_MMU below that code (and I think we can drop "static" too as I
don't think it's anything useful).  My version of fixup attached at the end
of email, and I verified it on m68k build.

I do plan to post a small fixup series to fix these issues (so far it may
contain 1 formal patch to touch up vmstat_item_print_in_thp, and 2 fixups
where I'll mark the subject with "fixup!" properly).  Either you can pick
up below or you can wait for my small patchset, should be there either
today or tomorrow.

Thanks,

===8<===
diff --git a/mm/gup.c b/mm/gup.c
index 4cd349390477..a2ed8203495a 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -30,11 +30,6 @@ struct follow_page_context {
        unsigned int page_mask;
 };
 
-static struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
-                                 unsigned long addr, unsigned int pdshift,
-                                 unsigned int flags,
-                                 struct follow_page_context *ctx);
-
 static inline void sanity_check_pinned_pages(struct page **pages,
                                             unsigned long npages)
 {
@@ -505,6 +500,12 @@ static inline void mm_set_has_pinned_flag(unsigned long *mm_flags)
 }
 
 #ifdef CONFIG_MMU
+
+struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
+                          unsigned long addr, unsigned int pdshift,
+                          unsigned int flags,
+                          struct follow_page_context *ctx);
+
 static struct page *no_page_table(struct vm_area_struct *vma,
                                  unsigned int flags, unsigned long address)
 {
===8<===

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
