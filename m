Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0575CCD1284
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 22:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V3vAo6atkT9NyCtNaXOM5gjMqqZls3y79SVQBbO4fhI=; b=X+JtJj/eKLFKMI
	A+qW8Zy3h5yvrp+D1Im5h32EMqeLYPxA+yxOsyD3rqgPAUDk0XfrQaQX2jFsVVZ3wEDDYfPdCKxaj
	4X2Do1U9AFwEUDqxo31xrd/GhQ5DLaFJ9655OB2Ap/oWgGGxqDH7v62Eg3BOTkSSoF5kTAJflHAKG
	wBPa1GXVFJindB+XXYqXoqSthyYHM1qWMHyY/D3CGPs2AeSz1VZhRIGK8tI/wun+eAdbaEhLZmHAW
	1TdTKiUW0cuoIwpeQz2T0iz5nnCF/fhhR8LNX868JESkdYHX69dHsN5zaU21IJtbZf5VLkFZ7vfIv
	CgB6+luRcNxzEw985Ntw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrmrR-0000000D3Kx-17Oy;
	Tue, 02 Apr 2024 22:44:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrmrN-0000000D3I8-3dfE
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 22:44:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712097843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=msm30zqdysTm36DA/rZCqzTJxXxvA+rydv8lKPCKRNo=;
	b=S9PxDmS7cMP4xVVO6g3JrkBP3FB1ohuU/ePpi1mO0OcndetwgzH2rn7dZrTBVwyg//HdL9
	BqBBNxkQWVczr9dKhppoZH4dCphZ0+NFVi04ogbSa6UTEefj5OHhMrFWrm//sDLhwtJema
	1PfDFmObfd+ZUbne8wLNEPYpoRTI3V8=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-GXsw50GtNwizsQ0-zYJKgA-1; Tue, 02 Apr 2024 18:44:01 -0400
X-MC-Unique: GXsw50GtNwizsQ0-zYJKgA-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6e6b0efc193so2532562a34.0
        for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2024 15:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712097840; x=1712702640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msm30zqdysTm36DA/rZCqzTJxXxvA+rydv8lKPCKRNo=;
        b=BWqkQ/c+XrtzmgRYst1Xn9+WgmgMSHiR7ucCNK3XsO83LoycB/hmF+0Vy4bV30nK1k
         wEPl9bYa0I/dUtfNdOVDzB5oGh0zhNrcip/qMmNF+LGKUUfkMgrOqr9+OXlh/2X7PK/a
         fOl8H/hqn8J3EV4k7BVpxPA9sIFD2z77t0XKUv5bvom4+198DtMFtnwiTHIdCLNTWN4V
         A5xfy2KXrlYC9GXa3ecTPECw7ZW38SJjXWhvxbldL+0S1XgQz64l0PzTFLMT6vNdX2zI
         PP7za7LGFyoi7jfepnJu76GsaEVco1nnxtv0taVVrI2N5k9MosKzET9ch0G28u/DOU75
         DILQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgsIp6XY1cevhuM6IkLfYti+CdXgRB7K+ZeU0rQ8qD4zzFOZKMHCOEBJQlRvTaoPsUDMA6rLaAHX2vEop6sxg2JC9h2dkcusBYtlqsFfB2
X-Gm-Message-State: AOJu0YxlpspyBaFDMhQnSdI+JCTAf6jHsUzAqOGMtGKy846QNm8MnKd4
	bANylXhssWQyD7li1973WHbecvJFlL9zHHyNvrZGncJCUAeSx9C/8WTBE9QtjSKwpuCAESYNYRq
	+nWPtEfhVPOwHcp6bJ5JQzqz7d+5LUydwHEIihBSW6TaZPvV8dT1d5Mi76/ueT3I2Mg==
X-Received: by 2002:a05:6808:15a1:b0:3c4:f2b2:2c20 with SMTP id t33-20020a05680815a100b003c4f2b22c20mr4238907oiw.2.1712097840204;
        Tue, 02 Apr 2024 15:44:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6a1W8aoV0zchhQZ+4+B4MiM4kTW0SJ53OaThQIv9a42FW90adjoyx8moZXDxiuklchxwa7w==
X-Received: by 2002:a05:6808:15a1:b0:3c4:f2b2:2c20 with SMTP id t33-20020a05680815a100b003c4f2b22c20mr4238865oiw.2.1712097839620;
        Tue, 02 Apr 2024 15:43:59 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id u6-20020a05620a120600b00789e8860ef7sm4617106qkj.121.2024.04.02.15.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 15:43:59 -0700 (PDT)
Date: Tue, 2 Apr 2024 18:43:56 -0400
From: Peter Xu <peterx@redhat.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Yang Shi <shy828301@gmail.com>,
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
	Jason Gunthorpe <jgg@nvidia.com>, Mike Rapoport <rppt@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev
Subject: Re: [PATCH v4 05/13] mm/arch: Provide pud_pfn() fallback
Message-ID: <ZgyKLLVZ4vN56uZE@x1n>
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-6-peterx@redhat.com>
 <20240402190549.GA706730@dev-arch.thelio-3990X>
MIME-Version: 1.0
In-Reply-To: <20240402190549.GA706730@dev-arch.thelio-3990X>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_154406_039867_968019D5 
X-CRM114-Status: GOOD (  40.91  )
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

On Tue, Apr 02, 2024 at 12:05:49PM -0700, Nathan Chancellor wrote:
> Hi Peter (and LoongArch folks),
> 
> On Wed, Mar 27, 2024 at 11:23:24AM -0400, peterx@redhat.com wrote:
> > From: Peter Xu <peterx@redhat.com>
> > 
> > The comment in the code explains the reasons.  We took a different approach
> > comparing to pmd_pfn() by providing a fallback function.
> > 
> > Another option is to provide some lower level config options (compare to
> > HUGETLB_PAGE or THP) to identify which layer an arch can support for such
> > huge mappings.  However that can be an overkill.
> > 
> > Cc: Mike Rapoport (IBM) <rppt@kernel.org>
> > Cc: Matthew Wilcox <willy@infradead.org>
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  arch/riscv/include/asm/pgtable.h    |  1 +
> >  arch/s390/include/asm/pgtable.h     |  1 +
> >  arch/sparc/include/asm/pgtable_64.h |  1 +
> >  arch/x86/include/asm/pgtable.h      |  1 +
> >  include/linux/pgtable.h             | 10 ++++++++++
> >  5 files changed, 14 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > index 20242402fc11..0ca28cc8e3fa 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -646,6 +646,7 @@ static inline unsigned long pmd_pfn(pmd_t pmd)
> >  
> >  #define __pud_to_phys(pud)  (__page_val_to_pfn(pud_val(pud)) << PAGE_SHIFT)
> >  
> > +#define pud_pfn pud_pfn
> >  static inline unsigned long pud_pfn(pud_t pud)
> >  {
> >  	return ((__pud_to_phys(pud) & PUD_MASK) >> PAGE_SHIFT);
> > diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
> > index 1a71cb19c089..6cbbe473f680 100644
> > --- a/arch/s390/include/asm/pgtable.h
> > +++ b/arch/s390/include/asm/pgtable.h
> > @@ -1414,6 +1414,7 @@ static inline unsigned long pud_deref(pud_t pud)
> >  	return (unsigned long)__va(pud_val(pud) & origin_mask);
> >  }
> >  
> > +#define pud_pfn pud_pfn
> >  static inline unsigned long pud_pfn(pud_t pud)
> >  {
> >  	return __pa(pud_deref(pud)) >> PAGE_SHIFT;
> > diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
> > index 4d1bafaba942..26efc9bb644a 100644
> > --- a/arch/sparc/include/asm/pgtable_64.h
> > +++ b/arch/sparc/include/asm/pgtable_64.h
> > @@ -875,6 +875,7 @@ static inline bool pud_leaf(pud_t pud)
> >  	return pte_val(pte) & _PAGE_PMD_HUGE;
> >  }
> >  
> > +#define pud_pfn pud_pfn
> >  static inline unsigned long pud_pfn(pud_t pud)
> >  {
> >  	pte_t pte = __pte(pud_val(pud));
> > diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> > index cefc7a84f7a4..273f7557218c 100644
> > --- a/arch/x86/include/asm/pgtable.h
> > +++ b/arch/x86/include/asm/pgtable.h
> > @@ -234,6 +234,7 @@ static inline unsigned long pmd_pfn(pmd_t pmd)
> >  	return (pfn & pmd_pfn_mask(pmd)) >> PAGE_SHIFT;
> >  }
> >  
> > +#define pud_pfn pud_pfn
> >  static inline unsigned long pud_pfn(pud_t pud)
> >  {
> >  	phys_addr_t pfn = pud_val(pud);
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index 600e17d03659..75fe309a4e10 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -1817,6 +1817,16 @@ typedef unsigned int pgtbl_mod_mask;
> >  #define pte_leaf_size(x) PAGE_SIZE
> >  #endif
> >  
> > +/*
> > + * We always define pmd_pfn for all archs as it's used in lots of generic
> > + * code.  Now it happens too for pud_pfn (and can happen for larger
> > + * mappings too in the future; we're not there yet).  Instead of defining
> > + * it for all archs (like pmd_pfn), provide a fallback.
> > + */
> > +#ifndef pud_pfn
> > +#define pud_pfn(x) ({ BUILD_BUG(); 0; })
> > +#endif
> > +
> >  /*
> >   * Some architectures have MMUs that are configurable or selectable at boot
> >   * time. These lead to variable PTRS_PER_x. For statically allocated arrays it
> > -- 
> > 2.44.0
> > 
> 
> This BUILD_BUG() triggers for LoongArch with their defconfig, so it
> seems like they need to provide an implementation of pud_pfn()?
> 
>   In function 'follow_huge_pud',
>       inlined from 'follow_pud_mask' at mm/gup.c:1075:10,
>       inlined from 'follow_p4d_mask' at mm/gup.c:1105:9,
>       inlined from 'follow_page_mask' at mm/gup.c:1151:10:
>   include/linux/compiler_types.h:460:45: error: call to '__compiletime_assert_382' declared with attribute error: BUILD_BUG failed
>     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>         |                                             ^
>   include/linux/compiler_types.h:441:25: note: in definition of macro '__compiletime_assert'
>     441 |                         prefix ## suffix();                             \
>         |                         ^~~~~~
>   include/linux/compiler_types.h:460:9: note: in expansion of macro '_compiletime_assert'
>     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>         |         ^~~~~~~~~~~~~~~~~~~
>   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
>      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>         |                                     ^~~~~~~~~~~~~~~~~~
>   include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
>         |                     ^~~~~~~~~~~~~~~~
>   include/linux/pgtable.h:1887:23: note: in expansion of macro 'BUILD_BUG'
>    1887 | #define pud_pfn(x) ({ BUILD_BUG(); 0; })
>         |                       ^~~~~~~~~
>   mm/gup.c:679:29: note: in expansion of macro 'pud_pfn'
>     679 |         unsigned long pfn = pud_pfn(pud);
>         |                             ^~~~~~~

I actually tested this without hitting the issue (even though I didn't
mention it in the cover letter..).  I re-kicked the build test, it turns
out my "make alldefconfig" on loongarch will generate a config with both
HUGETLB=n && THP=n, while arch/loongarch/configs/loongson3_defconfig has
THP=y (which I assume was the one above build used).  I didn't further
check how "make alldefconfig" generated the config; a bit surprising that
it didn't fetch from there.

(and it also surprises me that this BUILD_BUG can trigger.. I used to try
 triggering it elsewhere but failed..)

For loongarch the best thing is not compile in follow_huge_pud(), as it
doesn't support pud dax, neither does it support pud hugetlb.  However
again that may require some more CONFIG_* options to declare the level one
arch supports on HUGETLB_PAGE.  Here maybe the simplest (and it should also
cover all the rest archs on similar issues if ever possible to happen) is
we remove the BUILD_BUG() and explain why.  It should be safe for loongarch
too here in this case to not defined it until properly supported.

Thanks,

===8<===
From 585f34aa3d5b12cd2186367b0882d4293f792062 Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Tue, 2 Apr 2024 18:31:07 -0400
Subject: [PATCH] fixup! mm/arch: provide pud_pfn() fallback

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/pgtable.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index fa8f92f6e2d7..0f4b2faa1d71 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1882,9 +1882,13 @@ typedef unsigned int pgtbl_mod_mask;
  * code.  Now it happens too for pud_pfn (and can happen for larger
  * mappings too in the future; we're not there yet).  Instead of defining
  * it for all archs (like pmd_pfn), provide a fallback.
+ *
+ * Note that returning 0 here means any arch that didn't define this can
+ * get severely wrong when it hits a real pud leaf.  It's arch's
+ * responsibility to properly define it when a huge pud is possible.
  */
 #ifndef pud_pfn
-#define pud_pfn(x) ({ BUILD_BUG(); 0; })
+#define pud_pfn(x) 0
 #endif
 
 /*
-- 
2.44.0

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
