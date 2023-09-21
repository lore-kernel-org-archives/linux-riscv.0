Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACB3E71094
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 16:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FnXXW7h6HCnyQT++NmWbuvnYRe5/MC9bYFLNn/jNVt4=; b=QFc9lY5WhLS0U2
	pfvD4yohKEG1kr5oIt9KV7wyH/sHZ+HdDFeC0bfzgFHuT69MBICrzAPVK1ZtYDH+QH8D0VCxz8K0r
	SJTlYF0eEJVtQuRBF5PGw6oE0LUI++92jlu47N6gIvWhbVCzkCV5hUap3Sw7JuS4BdraDXWl4yHbl
	1gzaX1wQwzA2cxR9cvg0ADRtg5gXTilvZVY4Zvoy+ZGgV/f6zQqFw0owT1uDRuYn01gw7OWchOOzA
	8AQqvLBCYcQ2w/qOojdk8XV+1aUGx4o/4oEAzEl0ZwLJnAmIyR04m5rhcnk2OO5T+99BenBnnLRVM
	Rw/4RVQ3QpPW/3fYzjdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjMZX-006WIK-2m;
	Thu, 21 Sep 2023 16:30:35 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjMZT-006WGj-2a;
	Thu, 21 Sep 2023 16:30:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C89DCB82159;
	Thu, 21 Sep 2023 16:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DD95C611AA;
	Thu, 21 Sep 2023 16:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1695313828;
	bh=Snl0TDHOoq+PcJkslOz6yzyz3jV/ILGMNVGDPT3ALVI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Sy+EhpEKmklRoXizWavrDSv+mOOfZ2nUh7nbNkMhlDLbnh4hSgBtM2DfmKEv4UzUL
	 Pv6q7E7wnTnnSz2jaiJSSK97ktzV1tSKKpfyQ3VEqmLQ/I+fVqkhoc6rt2Al+4iGM9
	 C9VSqdRkP4rrRuEL9YXgvk8jJTKJGqA4Ygoc1IFE=
Date: Thu, 21 Sep 2023 09:30:26 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Gerald
 Schaefer <gerald.schaefer@linux.ibm.com>, "David S. Miller"
 <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Mike Kravetz
 <mike.kravetz@oracle.com>, Muchun Song <muchun.song@linux.dev>, SeongJae
 Park <sj@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, Christoph
 Hellwig <hch@infradead.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Anshuman
 Khandual <anshuman.khandual@arm.com>, Peter Xu <peterx@redhat.com>, Axel
 Rasmussen <axelrasmussen@google.com>, Qi Zheng
 <zhengqi.arch@bytedance.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org,
 stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 0/8] Fix set_huge_pte_at() panic on arm64
Message-Id: <20230921093026.230b2991be551093e397f462@linux-foundation.org>
In-Reply-To: <20230921162007.1630149-1-ryan.roberts@arm.com>
References: <20230921162007.1630149-1-ryan.roberts@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_093032_158383_9C6C4574 
X-CRM114-Status: GOOD (  21.06  )
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

On Thu, 21 Sep 2023 17:19:59 +0100 Ryan Roberts <ryan.roberts@arm.com> wrote:

> Hi All,
> 
> This series fixes a bug in arm64's implementation of set_huge_pte_at(), which
> can result in an unprivileged user causing a kernel panic. The problem was
> triggered when running the new uffd poison mm selftest for HUGETLB memory. This
> test (and the uffd poison feature) was merged for v6.6-rc1. However, upon
> inspection there are multiple other pre-existing paths that can trigger this
> bug.
> 
> Ideally, I'd like to get this fix in for v6.6 if possible? And I guess it should
> be backported too, given there are call sites where this can theoretically
> happen that pre-date v6.6-rc1 (I've cc'ed stable@vger.kernel.org).

This gets you a naggygram from Greg.  The way to request a backport is
to add cc:stable to all the changelogs.  I'll make that change to my copy.


> Ryan Roberts (8):
>   parisc: hugetlb: Convert set_huge_pte_at() to take vma
>   powerpc: hugetlb: Convert set_huge_pte_at() to take vma
>   riscv: hugetlb: Convert set_huge_pte_at() to take vma
>   s390: hugetlb: Convert set_huge_pte_at() to take vma
>   sparc: hugetlb: Convert set_huge_pte_at() to take vma
>   mm: hugetlb: Convert set_huge_pte_at() to take vma
>   arm64: hugetlb: Convert set_huge_pte_at() to take vma
>   arm64: hugetlb: Fix set_huge_pte_at() to work with all swap entries
> 
>  arch/arm64/include/asm/hugetlb.h              |  2 +-
>  arch/arm64/mm/hugetlbpage.c                   | 22 ++++----------
>  arch/parisc/include/asm/hugetlb.h             |  2 +-
>  arch/parisc/mm/hugetlbpage.c                  |  4 +--
>  .../include/asm/nohash/32/hugetlb-8xx.h       |  3 +-
>  arch/powerpc/mm/book3s64/hugetlbpage.c        |  2 +-
>  arch/powerpc/mm/book3s64/radix_hugetlbpage.c  |  2 +-
>  arch/powerpc/mm/nohash/8xx.c                  |  2 +-
>  arch/powerpc/mm/pgtable.c                     |  7 ++++-
>  arch/riscv/include/asm/hugetlb.h              |  2 +-
>  arch/riscv/mm/hugetlbpage.c                   |  3 +-
>  arch/s390/include/asm/hugetlb.h               |  8 +++--
>  arch/s390/mm/hugetlbpage.c                    |  8 ++++-
>  arch/sparc/include/asm/hugetlb.h              |  8 +++--
>  arch/sparc/mm/hugetlbpage.c                   |  8 ++++-
>  include/asm-generic/hugetlb.h                 |  6 ++--
>  include/linux/hugetlb.h                       |  6 ++--
>  mm/damon/vaddr.c                              |  2 +-
>  mm/hugetlb.c                                  | 30 +++++++++----------
>  mm/migrate.c                                  |  2 +-
>  mm/rmap.c                                     | 10 +++----
>  mm/vmalloc.c                                  |  5 +++-
>  22 files changed, 80 insertions(+), 64 deletions(-)

Looks scary but it's actually a fairly modest patchset.  It could
easily be all rolled into a single patch for ease of backporting. 
Maybe Greg has an opinion?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
