Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5A4C54E64
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2024 01:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=9HNhGmaUqAEZYIyP9/ckdUbOtJbNLvqV2tu1jvLv2wI=; b=Shct0l8kpVGux7
	f/GCrVSo9aP97nch40YvOUo1M2UIHlyduhj5QVzcz/0sNRvzsIcbV9otBkMnSQkBtwin0uSYyaK67
	p5ta7BDl6zgnMQkRclDoOL+sEGVHJe4GETMAijG0OdiSzHKBuAH1AFBRdvqd79nyQ1HBZ5Hmi2cdk
	ySxjAJYLl2b77HGZ7I7mgjbhCqBVyD83+b8oDdIfJNEqWGqBPXAYmPe5QL69FF3Tuxz+r+XzzCU4Z
	ZgCN/Pgrc4mKfQ0+IVAyuUlu9v852ZBdt7/sEdckYa+0HMc84gn+eyenW+huzXjmOQ4zdK7ru4USo
	ghOtcFOik9e+nmwRlOiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnppc-0000000965O-0GEw;
	Sat, 23 Mar 2024 01:05:56 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnppX-0000000963s-40vh;
	Sat, 23 Mar 2024 01:05:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7A37ECE18C7;
	Sat, 23 Mar 2024 01:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04826C433F1;
	Sat, 23 Mar 2024 01:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711155945;
	bh=3+zZh3XFJnxQpCAGDeyGmKq33BNtz2+66eAEGL4876Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:From;
	b=EcMiWiUkiXF0pmTkhVhDvP+BA3m6SBMpMePHLS3lgvhzbCdo9T5o6x2xTa8QoCvtQ
	 ZiIr3laXn2TxW1OUddMIfS1+bJqiPdQdS/W9Rj6yvZxknL1k5q/DKyC9sWIyvTCsmL
	 qjz9g+3k55UpMTkbn5Fmp2EPQC/vmOSHUkLHq5nPc1YFOdstql4q7f52P4kaf6kZOe
	 OK6Xw3iZcQy36q6zjiD/Nq4FMHprCktSrO9wXGQN1nYHgDgHW9odHpf0M4qlTAphIv
	 Qt9VjffONOVJFRHRVRK9EkkPxU/upViU53CWHBYVwXM057H2FC5cyRrlr1LY92qHmO
	 G5ofpS5wd8PeQ==
From: SeongJae Park <sj@kernel.org>
To: Peter Xu <peterx@redhat.com>
Cc: SeongJae Park <sj@kernel.org>,
	linux-mm@kvack.org,
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
Date: Fri, 22 Mar 2024 18:05:28 -0700
Message-Id: <20240323010528.10959-1-sj@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <Zf4ioDkuSNJ0f1vR@x1n>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_180552_366268_E1622D04 
X-CRM114-Status: GOOD (  42.20  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Peter,

On Fri, 22 Mar 2024 20:30:24 -0400 Peter Xu <peterx@redhat.com> wrote:

> On Fri, Mar 22, 2024 at 10:14:56AM -0700, SeongJae Park wrote:
> > Hi Peter,
> 
> Hi, SeongJae,
> 
> > 
> > On Thu, 21 Mar 2024 18:07:53 -0400 peterx@redhat.com wrote:
> > 
> > > From: Peter Xu <peterx@redhat.com>
> > > 
> > > These macros can be helpful when we plan to merge hugetlb code into generic
> > > code.  Move them out and define them even if !THP.
> > > 
> > > We actually already defined HPAGE_PMD_NR for other reasons even if !THP.
> > > Reorganize these macros.
> > > 
> > > Reviewed-by: Christoph Hellwig <hch@infradead.org>
> > > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > ---
> > >  include/linux/huge_mm.h | 17 ++++++-----------
> > >  1 file changed, 6 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> > > index de0c89105076..3bcdfc7e5d57 100644
> > > --- a/include/linux/huge_mm.h
> > > +++ b/include/linux/huge_mm.h
> > > @@ -64,9 +64,6 @@ ssize_t single_hugepage_flag_show(struct kobject *kobj,
> > >  				  enum transparent_hugepage_flag flag);
> > >  extern struct kobj_attribute shmem_enabled_attr;
> > >  
> > > -#define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
> > > -#define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
> > > -
> > >  /*
> > >   * Mask of all large folio orders supported for anonymous THP; all orders up to
> > >   * and including PMD_ORDER, except order-0 (which is not "huge") and order-1
> > > @@ -87,14 +84,19 @@ extern struct kobj_attribute shmem_enabled_attr;
> > >  #define thp_vma_allowable_order(vma, vm_flags, smaps, in_pf, enforce_sysfs, order) \
> > >  	(!!thp_vma_allowable_orders(vma, vm_flags, smaps, in_pf, enforce_sysfs, BIT(order)))
> > >  
> > > -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> > >  #define HPAGE_PMD_SHIFT PMD_SHIFT
> > >  #define HPAGE_PMD_SIZE	((1UL) << HPAGE_PMD_SHIFT)
> > >  #define HPAGE_PMD_MASK	(~(HPAGE_PMD_SIZE - 1))
> > > +#define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
> > > +#define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
> > >  
> > >  #define HPAGE_PUD_SHIFT PUD_SHIFT
> > >  #define HPAGE_PUD_SIZE	((1UL) << HPAGE_PUD_SHIFT)
> > >  #define HPAGE_PUD_MASK	(~(HPAGE_PUD_SIZE - 1))
> > > +#define HPAGE_PUD_ORDER (HPAGE_PUD_SHIFT-PAGE_SHIFT)
> > > +#define HPAGE_PUD_NR (1<<HPAGE_PUD_ORDER)
> > 
> > I just found latest mm-unstable fails one of my build configurations[1] with
> > below error.  'git bisect' says this is the first patch set started the
> > failure.  I haven't looked in deep, but just reporting first.
> > 
> >     In file included from .../include/linux/mm.h:1115,
> >                      from .../mm/vmstat.c:14:
> >     .../mm/vmstat.c: In function 'zoneinfo_show_print':
> >     .../include/linux/huge_mm.h:87:25: error: 'PMD_SHIFT' undeclared (first use in this function); did you mean 'PUD_SHIFT'?
> >        87 | #define HPAGE_PMD_SHIFT PMD_SHIFT
> >           |                         ^~~~~~~~~
> > 
> > [1] https://github.com/awslabs/damon-tests/blob/next/corr/tests/build_m68k.sh
> 
> Apologies for the issue.

No problem at all, this blocks nothing in real :)

> This is caused by !CONFIG_MMU, I think.
> 
> I thought this would be fairly easy to fix by putting these macros under
> CONFIG_PGTABLE_HAS_HUGE_LEAVES, however when doing this I could have found
> some other issue that violates this rule.. mm/vmstat.c has referenced
> HPAGE_PMD_NR even if vmstat_item_print_in_thp() wanted to guard it only
> with CONFIG_THP.
> 
> /home/peterx/git/linux/mm/vmstat.c: In function 'zoneinfo_show_print':
> /home/peterx/git/linux/mm/vmstat.c:1689:42: error: 'HPAGE_PMD_NR' undeclared (first use in this function)
>  1689 |                                 pages /= HPAGE_PMD_NR;
>       |                                          ^~~~~~~~~~~~
> /home/peterx/git/linux/mm/vmstat.c:1689:42: note: each undeclared identifier is reported only once for each function it appears in
>   CC      drivers/tty/tty_port.o
> /home/peterx/git/linux/mm/vmstat.c: In function 'vmstat_start':
> /home/peterx/git/linux/mm/vmstat.c:1822:33: error: 'HPAGE_PMD_NR' undeclared (first use in this function)
>  1822 |                         v[i] /= HPAGE_PMD_NR;
>       |                                 ^~~~~~~~~~~~
> make[4]: *** [/home/peterx/git/linux/scripts/Makefile.build:243: mm/vmstat.o] Error 1
> 
> static __always_inline bool vmstat_item_print_in_thp(enum node_stat_item item)
> {
>         if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
>                 return false;
>         ...
> }
> 
> I think the problem is vmstat_item_print_in_thp() uses IS_ENABLED() however
> that won't stop compiler from looking into the "if".. so it'll still try to
> find the HPAGE_PMD_NR macro.
> 
> It means, I may need to further change vmstat_item_print_in_thp() to make
> this work in the clean way.. by properly switching to a #ifdef.
> 
> For that I'll need to post a formal patch and add people to review.  I'll
> keep you posted.

Thank you for this kind explanation, all makes sense to me.  Looking forward to
the patch.

> 
> Side note: thank you for your script, just to mention make.cross has been
> moved to kbuild/, and it'll also need kbuild.sh now to work.  So you may
> want to fix your test script (and it worked for you because you kept the
> old make.cross around), like:
> 
>   wget https://raw.githubusercontent.com/intel/lkp-tests/master/kbuild/make.cross -O ./bin/make.cross
>   wget https://raw.githubusercontent.com/intel/lkp-tests/master/kbuild/kbuild.sh -O ./bin/kbuild.sh

And thank you so much for this nice suggestion.  I'll revisit the script soon.


Thanks,
SJ

> 
> Thanks,
> 
> -- 
> Peter Xu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
