Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EFECD4F3B
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 09:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ZdNg9/bhaU9rbJ75Y9+FHcqpVHeo2/kGtDp7lrSrUA=; b=tMfAY7BuPxzB9I
	KZsUlMsRCUch8WctuUzZTVXQqSgDaERJ27jR9XNTgSMVcco9PKfXFHj4Bd1nzJ2ZCKhTQrfdk8RMF
	7KZMdAll0FzcVeqyxmBUDa3NNuq2U3LTZthB9+dAz9z0bE0w+b0DJxeVa5SHaS9UeLx1K3aZflPbb
	Wh4OGLSKceuTcW4WuhLOy2+n3mXM0aC1tuIaNymYb1RpmcdJnGZRZoc5z3Lf8V39HEQyzZ+LbDu4v
	Kb2FzZpQgVa9ZX4NC2hdx7zy3QZrTpEPdbMIUOyPboMXoFoy4wPPM9cb2Lqn7uRyzDw88NM4LoFwz
	zPza6JdsDa32hAAHyw5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcNa-008YvK-2H;
	Fri, 22 Sep 2023 09:23:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcNX-008Yto-0P;
	Fri, 22 Sep 2023 09:23:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4C159621B4;
	Fri, 22 Sep 2023 09:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32460C433C7;
	Fri, 22 Sep 2023 09:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695374593;
	bh=dXskQX5Hl5xkPtfaxV8tcYegxNU8vst41m8wxd6lccM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HC7A5qwRYefrtsRKDVgbV8LB3GlGNnwCiuzuBjBf//079Vr5pHlHx7w33piVwkMSg
	 KdakR66MrSNSkYJO3jbZwCr/w2VTw33wUH/TvBJA0dAAYl+WQ5Z5GVudGyrcU4/vOf
	 0KADD+v5vZCFHY1cz6sqX/igDr/hO6uHWrXxgxmY=
Date: Fri, 22 Sep 2023 11:23:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Muchun Song <muchun.song@linux.dev>, SeongJae Park <sj@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Peter Xu <peterx@redhat.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v1 0/8] Fix set_huge_pte_at() panic on arm64
Message-ID: <2023092208-sitcom-playpen-b62d@gregkh>
References: <20230921162007.1630149-1-ryan.roberts@arm.com>
 <20230921093026.230b2991be551093e397f462@linux-foundation.org>
 <7c5c2c00-d657-44fd-b478-743b43c57e8a@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7c5c2c00-d657-44fd-b478-743b43c57e8a@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_022315_244459_9C703942 
X-CRM114-Status: GOOD (  29.92  )
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

On Thu, Sep 21, 2023 at 05:35:54PM +0100, Ryan Roberts wrote:
> On 21/09/2023 17:30, Andrew Morton wrote:
> > On Thu, 21 Sep 2023 17:19:59 +0100 Ryan Roberts <ryan.roberts@arm.com> wrote:
> > 
> >> Hi All,
> >>
> >> This series fixes a bug in arm64's implementation of set_huge_pte_at(), which
> >> can result in an unprivileged user causing a kernel panic. The problem was
> >> triggered when running the new uffd poison mm selftest for HUGETLB memory. This
> >> test (and the uffd poison feature) was merged for v6.6-rc1. However, upon
> >> inspection there are multiple other pre-existing paths that can trigger this
> >> bug.
> >>
> >> Ideally, I'd like to get this fix in for v6.6 if possible? And I guess it should
> >> be backported too, given there are call sites where this can theoretically
> >> happen that pre-date v6.6-rc1 (I've cc'ed stable@vger.kernel.org).
> > 
> > This gets you a naggygram from Greg.  The way to request a backport is
> > to add cc:stable to all the changelogs.  I'll make that change to my copy.
> 
> Ahh, sorry about that... I just got the same moan from the kernel test robot too.
> 
> > 
> > 
> >> Ryan Roberts (8):
> >>   parisc: hugetlb: Convert set_huge_pte_at() to take vma
> >>   powerpc: hugetlb: Convert set_huge_pte_at() to take vma
> >>   riscv: hugetlb: Convert set_huge_pte_at() to take vma
> >>   s390: hugetlb: Convert set_huge_pte_at() to take vma
> >>   sparc: hugetlb: Convert set_huge_pte_at() to take vma
> >>   mm: hugetlb: Convert set_huge_pte_at() to take vma
> >>   arm64: hugetlb: Convert set_huge_pte_at() to take vma
> >>   arm64: hugetlb: Fix set_huge_pte_at() to work with all swap entries
> >>
> >>  arch/arm64/include/asm/hugetlb.h              |  2 +-
> >>  arch/arm64/mm/hugetlbpage.c                   | 22 ++++----------
> >>  arch/parisc/include/asm/hugetlb.h             |  2 +-
> >>  arch/parisc/mm/hugetlbpage.c                  |  4 +--
> >>  .../include/asm/nohash/32/hugetlb-8xx.h       |  3 +-
> >>  arch/powerpc/mm/book3s64/hugetlbpage.c        |  2 +-
> >>  arch/powerpc/mm/book3s64/radix_hugetlbpage.c  |  2 +-
> >>  arch/powerpc/mm/nohash/8xx.c                  |  2 +-
> >>  arch/powerpc/mm/pgtable.c                     |  7 ++++-
> >>  arch/riscv/include/asm/hugetlb.h              |  2 +-
> >>  arch/riscv/mm/hugetlbpage.c                   |  3 +-
> >>  arch/s390/include/asm/hugetlb.h               |  8 +++--
> >>  arch/s390/mm/hugetlbpage.c                    |  8 ++++-
> >>  arch/sparc/include/asm/hugetlb.h              |  8 +++--
> >>  arch/sparc/mm/hugetlbpage.c                   |  8 ++++-
> >>  include/asm-generic/hugetlb.h                 |  6 ++--
> >>  include/linux/hugetlb.h                       |  6 ++--
> >>  mm/damon/vaddr.c                              |  2 +-
> >>  mm/hugetlb.c                                  | 30 +++++++++----------
> >>  mm/migrate.c                                  |  2 +-
> >>  mm/rmap.c                                     | 10 +++----
> >>  mm/vmalloc.c                                  |  5 +++-
> >>  22 files changed, 80 insertions(+), 64 deletions(-)
> > 
> > Looks scary but it's actually a fairly modest patchset.  It could
> > easily be all rolled into a single patch for ease of backporting. 
> > Maybe Greg has an opinion?
> 
> Yes, I thought about doing that; or perhaps 2 patches - one for the interface
> change across all arches and core code, and one for the actual bug fix?

I have no issues with taking patch series, or one big patch, into stable
trees, they just have to match up with what is in Linus's tree.

so if it makes more sense to have this as a series (like you did here),
wonderful, make it a patch series.  Do not go out of your way to do
things differently just for stable kernels, that is not necessary or
needed at all.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
