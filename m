Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F59C47DD9
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 17:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PrnkoGVHC2lcw1DP2H8Hh0vcB4nlnfhMlC/fqULTtEM=; b=o3q1hrUC55ZCqh
	KugUUDPTLjXrUxGGlJQJeZvQaEqM/SS4Y2H0c5nAyMUhsp9Anqk1atWRdtAxdLpSlJIevCJ787IH2
	lkOLO3OJAfXDYDQV5/JwZ32J1uAh/ET+yXApulhVFbADQmWuK1E7XnpoURNDQi5v7kTZ1sGRBJl0t
	wpyIK3qnHvQctwwh8TOqOxQzNLX+vfn3u06Sya6dGi3PCQlobCqjLJFlpk4TTZcvkU341sJ6TffoX
	j7Ts+aZi+9ujE9rqpOt8IH5IBSNyvtJyWpwYjYkWSdRuQomf8/4ydW+wqjxSakU/kXLZHVEeyT5L/
	Z/jF4PzK6pT4Dvd3Av9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rniTz-0000000887R-3Vqw;
	Fri, 22 Mar 2024 17:15:07 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rniTu-0000000884q-46Zy;
	Fri, 22 Mar 2024 17:15:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B25E0CE0C47;
	Fri, 22 Mar 2024 17:15:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE9BC433F1;
	Fri, 22 Mar 2024 17:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711127699;
	bh=C8GD9fG22TLIZK0yuUnEPTKbqHoBiCuXP/x09X9W/Os=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cp+0MqbN/avd7Y97uUQSY5e3e9KLVDxkhGPn+yWRI0D04F60iun6Ic766AOtiq+Md
	 hbLUwftVGSSMtsA0ZZKPudwZqFCd+lo0SsIZJB1oXC/WFV4GXZB8YLu5zC2yPiOhjr
	 5BMLpXMMG1ZsWtHf0qcbGDiiKeFIJqzhIDyOUzJVdE/6IImQGRiyzKh9HaM766Mex1
	 s+nFrDQl3Y7IMmiSt07qyqGMJr3O/WR4llweHd32XwKcWLG0J7BQM/mZ/iBnSlmSeA
	 p28TSop2p+oI1SaFWDwF3ryu/RLJndxMfx3mRvQNCX5A2N3t/GOQPwJibZJp9E2p5n
	 mg6iv/YIR0f1w==
From: SeongJae Park <sj@kernel.org>
To: peterx@redhat.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Matthew Wilcox <willy@infradead.org>,
	Rik van Riel <riel@surriel.com>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yang Shi <shy828301@gmail.com>,
	John Hubbard <jhubbard@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Andrew Jones <andrew.jones@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Christoph Hellwig <hch@infradead.org>,
	linux-riscv@lists.infradead.org,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH v3 03/12] mm: Make HPAGE_PXD_* macros even if !THP
Date: Fri, 22 Mar 2024 10:14:56 -0700
Message-Id: <20240322171456.118997-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240321220802.679544-4-peterx@redhat.com>
References: 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_101503_413946_A73C802C 
X-CRM114-Status: GOOD (  19.54  )
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

Hi Peter,

On Thu, 21 Mar 2024 18:07:53 -0400 peterx@redhat.com wrote:

> From: Peter Xu <peterx@redhat.com>
> 
> These macros can be helpful when we plan to merge hugetlb code into generic
> code.  Move them out and define them even if !THP.
> 
> We actually already defined HPAGE_PMD_NR for other reasons even if !THP.
> Reorganize these macros.
> 
> Reviewed-by: Christoph Hellwig <hch@infradead.org>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  include/linux/huge_mm.h | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index de0c89105076..3bcdfc7e5d57 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -64,9 +64,6 @@ ssize_t single_hugepage_flag_show(struct kobject *kobj,
>  				  enum transparent_hugepage_flag flag);
>  extern struct kobj_attribute shmem_enabled_attr;
>  
> -#define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
> -#define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
> -
>  /*
>   * Mask of all large folio orders supported for anonymous THP; all orders up to
>   * and including PMD_ORDER, except order-0 (which is not "huge") and order-1
> @@ -87,14 +84,19 @@ extern struct kobj_attribute shmem_enabled_attr;
>  #define thp_vma_allowable_order(vma, vm_flags, smaps, in_pf, enforce_sysfs, order) \
>  	(!!thp_vma_allowable_orders(vma, vm_flags, smaps, in_pf, enforce_sysfs, BIT(order)))
>  
> -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  #define HPAGE_PMD_SHIFT PMD_SHIFT
>  #define HPAGE_PMD_SIZE	((1UL) << HPAGE_PMD_SHIFT)
>  #define HPAGE_PMD_MASK	(~(HPAGE_PMD_SIZE - 1))
> +#define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
> +#define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
>  
>  #define HPAGE_PUD_SHIFT PUD_SHIFT
>  #define HPAGE_PUD_SIZE	((1UL) << HPAGE_PUD_SHIFT)
>  #define HPAGE_PUD_MASK	(~(HPAGE_PUD_SIZE - 1))
> +#define HPAGE_PUD_ORDER (HPAGE_PUD_SHIFT-PAGE_SHIFT)
> +#define HPAGE_PUD_NR (1<<HPAGE_PUD_ORDER)

I just found latest mm-unstable fails one of my build configurations[1] with
below error.  'git bisect' says this is the first patch set started the
failure.  I haven't looked in deep, but just reporting first.

    In file included from .../include/linux/mm.h:1115,
                     from .../mm/vmstat.c:14:
    .../mm/vmstat.c: In function 'zoneinfo_show_print':
    .../include/linux/huge_mm.h:87:25: error: 'PMD_SHIFT' undeclared (first use in this function); did you mean 'PUD_SHIFT'?
       87 | #define HPAGE_PMD_SHIFT PMD_SHIFT
          |                         ^~~~~~~~~

[1] https://github.com/awslabs/damon-tests/blob/next/corr/tests/build_m68k.sh


Thanks,
SJ

[...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
