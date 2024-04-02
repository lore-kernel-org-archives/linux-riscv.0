Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821F6CD1284
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 19:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jE3ctTHwm9qDDZ+7Wo04amMbysRsAKyzNKKfWjdM5Ak=; b=QSQvyGZDD2/FhU
	mFKp53nFGzp1KF6WNbaGb4eyVOtTBvDrcBhgrhFV0bkHmDcneNsrTtY+merhhJM5fJu0aG8+EQDfC
	9tedIeCkP2Hl6WmaSdhpTRD9xNEawKXo3rT6Sk/VnaviYYyEQWSxT0KH5X9KJ5Mf5uUkkWJCHMMMm
	5HeW3GxqryScsXKpt0zFxJXxz4wHqDd4PUDSWvZ/1ITjxKNfi9FlaEFkip7rH08/NwMionTaXfoft
	md9n8iVRpoY7B+rzNv1aImR4JlZYxysisqUwLnjuH42RpVmjnjCYjxAeDg8Cu9r0eGApRdKvdKySN
	RcsX93NyE+GK53CXhg4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrjSI-0000000CRzz-1db0;
	Tue, 02 Apr 2024 19:05:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrjSE-0000000CRxx-3JLv;
	Tue, 02 Apr 2024 19:05:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DCD8861069;
	Tue,  2 Apr 2024 19:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174E5C433C7;
	Tue,  2 Apr 2024 19:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712084752;
	bh=ivObVSKpIkBqCwHlwbBnTW/chcdv4hxzzU2Dqfw4oFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hwwp3R1q+T6P3wBULlM9JHA7unNDdzQ7FyQAUtX0BWJYLvoTcSvvCHVjCZCIVdCpp
	 P3hH9eiYczkxNqEPQVprmxEGBBjdTDkm2i0W/ywueVCqBxiyfNB/jd8/8ayTftnI02
	 M4H/eOWh4bn/Ygw7g56bJeYODFwZcPWGYCkn3uSNTytEJ/MI/De15gQoC2yuWB5IGj
	 wAuTXHpQOJnJxkjgdHehxG1bRSCJBtOySRaGeOy42ZdtKoUpS5CRRoEU1D0PnH0iBU
	 8Uk+I9y88XUSxVMrMygH39vnWX8Uwf8mWiw+V7NK/hpKeE+IqP03OkudSXAlGSwaK8
	 pTIHCarE2rCRw==
Date: Tue, 2 Apr 2024 12:05:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: peterx@redhat.com
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
Message-ID: <20240402190549.GA706730@dev-arch.thelio-3990X>
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-6-peterx@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240327152332.950956-6-peterx@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_120555_104269_2094613C 
X-CRM114-Status: GOOD (  23.48  )
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

Hi Peter (and LoongArch folks),

On Wed, Mar 27, 2024 at 11:23:24AM -0400, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> The comment in the code explains the reasons.  We took a different approach
> comparing to pmd_pfn() by providing a fallback function.
> 
> Another option is to provide some lower level config options (compare to
> HUGETLB_PAGE or THP) to identify which layer an arch can support for such
> huge mappings.  However that can be an overkill.
> 
> Cc: Mike Rapoport (IBM) <rppt@kernel.org>
> Cc: Matthew Wilcox <willy@infradead.org>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  arch/riscv/include/asm/pgtable.h    |  1 +
>  arch/s390/include/asm/pgtable.h     |  1 +
>  arch/sparc/include/asm/pgtable_64.h |  1 +
>  arch/x86/include/asm/pgtable.h      |  1 +
>  include/linux/pgtable.h             | 10 ++++++++++
>  5 files changed, 14 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 20242402fc11..0ca28cc8e3fa 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -646,6 +646,7 @@ static inline unsigned long pmd_pfn(pmd_t pmd)
>  
>  #define __pud_to_phys(pud)  (__page_val_to_pfn(pud_val(pud)) << PAGE_SHIFT)
>  
> +#define pud_pfn pud_pfn
>  static inline unsigned long pud_pfn(pud_t pud)
>  {
>  	return ((__pud_to_phys(pud) & PUD_MASK) >> PAGE_SHIFT);
> diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
> index 1a71cb19c089..6cbbe473f680 100644
> --- a/arch/s390/include/asm/pgtable.h
> +++ b/arch/s390/include/asm/pgtable.h
> @@ -1414,6 +1414,7 @@ static inline unsigned long pud_deref(pud_t pud)
>  	return (unsigned long)__va(pud_val(pud) & origin_mask);
>  }
>  
> +#define pud_pfn pud_pfn
>  static inline unsigned long pud_pfn(pud_t pud)
>  {
>  	return __pa(pud_deref(pud)) >> PAGE_SHIFT;
> diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
> index 4d1bafaba942..26efc9bb644a 100644
> --- a/arch/sparc/include/asm/pgtable_64.h
> +++ b/arch/sparc/include/asm/pgtable_64.h
> @@ -875,6 +875,7 @@ static inline bool pud_leaf(pud_t pud)
>  	return pte_val(pte) & _PAGE_PMD_HUGE;
>  }
>  
> +#define pud_pfn pud_pfn
>  static inline unsigned long pud_pfn(pud_t pud)
>  {
>  	pte_t pte = __pte(pud_val(pud));
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index cefc7a84f7a4..273f7557218c 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -234,6 +234,7 @@ static inline unsigned long pmd_pfn(pmd_t pmd)
>  	return (pfn & pmd_pfn_mask(pmd)) >> PAGE_SHIFT;
>  }
>  
> +#define pud_pfn pud_pfn
>  static inline unsigned long pud_pfn(pud_t pud)
>  {
>  	phys_addr_t pfn = pud_val(pud);
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 600e17d03659..75fe309a4e10 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1817,6 +1817,16 @@ typedef unsigned int pgtbl_mod_mask;
>  #define pte_leaf_size(x) PAGE_SIZE
>  #endif
>  
> +/*
> + * We always define pmd_pfn for all archs as it's used in lots of generic
> + * code.  Now it happens too for pud_pfn (and can happen for larger
> + * mappings too in the future; we're not there yet).  Instead of defining
> + * it for all archs (like pmd_pfn), provide a fallback.
> + */
> +#ifndef pud_pfn
> +#define pud_pfn(x) ({ BUILD_BUG(); 0; })
> +#endif
> +
>  /*
>   * Some architectures have MMUs that are configurable or selectable at boot
>   * time. These lead to variable PTRS_PER_x. For statically allocated arrays it
> -- 
> 2.44.0
> 

This BUILD_BUG() triggers for LoongArch with their defconfig, so it
seems like they need to provide an implementation of pud_pfn()?

  In function 'follow_huge_pud',
      inlined from 'follow_pud_mask' at mm/gup.c:1075:10,
      inlined from 'follow_p4d_mask' at mm/gup.c:1105:9,
      inlined from 'follow_page_mask' at mm/gup.c:1151:10:
  include/linux/compiler_types.h:460:45: error: call to '__compiletime_assert_382' declared with attribute error: BUILD_BUG failed
    460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
        |                                             ^
  include/linux/compiler_types.h:441:25: note: in definition of macro '__compiletime_assert'
    441 |                         prefix ## suffix();                             \
        |                         ^~~~~~
  include/linux/compiler_types.h:460:9: note: in expansion of macro '_compiletime_assert'
    460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
        |         ^~~~~~~~~~~~~~~~~~~
  include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
     39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
        |                                     ^~~~~~~~~~~~~~~~~~
  include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
        |                     ^~~~~~~~~~~~~~~~
  include/linux/pgtable.h:1887:23: note: in expansion of macro 'BUILD_BUG'
   1887 | #define pud_pfn(x) ({ BUILD_BUG(); 0; })
        |                       ^~~~~~~~~
  mm/gup.c:679:29: note: in expansion of macro 'pud_pfn'
    679 |         unsigned long pfn = pud_pfn(pud);
        |                             ^~~~~~~

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
