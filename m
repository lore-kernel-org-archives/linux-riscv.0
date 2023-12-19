Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31778C46CA2
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 07:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5FD/yU1GOF/96llzJMhlG+nIs2PlOPfLoCZWVUwE79o=; b=RAatRPLkRbLzRH
	x4AEng5doYyvu+MvNwXYul+n8sTeP7imMrwfg6NfK8y00jo60YBer6wIQ2xKilOggwwDeMlQuaivG
	Tzb9dEtvX/YzNjgx868OgxL86TrCk9VnP4Rq15DkH40goK/78Z4crPHrkvFNi6BQt8+CW8HqyUgy2
	Igqxh9Il1CIgvOwZwKqYltvwqMoqtR6RppVPYNMsA2ejOGRnjaCvg5mcWCGmD02oZvHtwBbjiKyjH
	VWKQ6b6/FHHCGk0Cor8lMSemwRkLmwinO0nv/W/baZasQv9XRnAA0rNaFKBP89kcMcvDAs1n/yio4
	R5Vfk9uXe8a1RPa/hhig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFUxO-00DAc7-0Q;
	Tue, 19 Dec 2023 07:56:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFUxK-00DAZM-2O
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 07:56:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702972556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+h83lLyn/5apLRr4X1Iml0TGvxqR5/pwpG6+wMVRoO8=;
	b=XR8GUsaluDchgruKmarqBEqjW3Wqmhwn4GplqLYMVIMv0CFAKTWmyjaZJ4QLKt6Y03shFw
	5SPz1ofzy3xk0tM53bvNAgaXdpVWJxzfVMba7MLpXt7SgdL9i/0dCMaKKz9fVEpw8TaBHi
	XD0l0+6cK3iff/FxWtQuYwIL0K3Oa2w=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-460-78fty2BGN2uAAfrfPZNG0g-1; Tue,
 19 Dec 2023 02:55:53 -0500
X-MC-Unique: 78fty2BGN2uAAfrfPZNG0g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 065E63C025C1;
	Tue, 19 Dec 2023 07:55:52 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 83B262026D66;
	Tue, 19 Dec 2023 07:55:40 +0000 (UTC)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: Matthew Wilcox <willy@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	John Hubbard <jhubbard@nvidia.com>,
	Andrew Jones <andrew.jones@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	linuxppc-dev@lists.ozlabs.org,
	Rik van Riel <riel@surriel.com>,
	linux-riscv@lists.infradead.org,
	Yang Shi <shy828301@gmail.com>,
	James Houghton <jthoughton@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	peterx@redhat.com,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: [PATCH 00/13] mm/gup: Unify hugetlb, part 2
Date: Tue, 19 Dec 2023 15:55:25 +0800
Message-ID: <20231219075538.414708-1-peterx@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_235558_852178_1ED762EE 
X-CRM114-Status: GOOD (  18.83  )
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

From: Peter Xu <peterx@redhat.com>

This is v1 of the series.  The series removes the hugetlb slow gup path
after a previous refactor work [1], so that slow gup now uses the exact
same path to handle all kinds of memory including hugetlb.

It's based on latest mm-unstalbe (c13bdc82ada9).

RFC->v1 (use old verion's patch index):
- Fix build for !THP and/or !HUGETLB
- Fix a bug in the hugepd path that can cause a loop
- patch 3:
  - Rename to "Make HPAGE_PXD_* macros visible even if !THP" [Christoph, MikeR]
- patch 5:
  - Posted separately as a devmap bugfix
- patch 6:
  - Add a comment above gup_huge_pd() explaining the file folio writeback
    issue, with references when anyone would extend hugepd to other types
    of file memories [Christoph]
- patch 7:
  - Keep parameter name as "page" in record_subpages(), modify the
    commit message by removing any assumption on head page. [Matthew]
- patch 12:
  - Rename to: "mm/gup: handle hugetlb in the generic follow_page_mask
    code" [Christoph]
- Added patch:
  - "mm/Kconfig: CONFIG_PGTABLE_HAS_HUGE_LEAVES", this helps to fix build
    for !THP and/or !HUGETLB
- Added patch
  - "mm/gup: Cache *pudp in follow_pud_mask()", as suggested by Christoph

For the long term, this is one small step towards merging hugetlb specific
codes into generic mm paths.  From that POV, this series removes one
reference to huge_pte_offset() out of many others.

To make it work, the generic code will need to at least understand hugepd,
which is already done like so in fast-gup.  Fortunately it seems that's the
only major thing I need to teach slow GUP to share the common path for now
besides normal huge PxD entries.  Non-gup can be more challenging, but
that's a question for later.

There's one major difference for slow-gup on cont_pte / cont_pmd handling,
currently supported on three architectures (aarch64, riscv, ppc).  Before
the series, slow gup will be able to recognize cont entries with the help
of huge_pte_offset().  Now it's gone but still working, by looking up
pgtable entries one by one.  It's not ideal, but hopefully this change
should not affect yet on major workloads.  There's some more information in
the commit message of the last patch.  If this would be a concern, we can
consider teaching slow gup to recognize cont pte/pmd entries, and that
should recover the lost performance.  But I doubt its necessity for now, so
I kept it as simple as it can be.

Test Done
=========

This v1 went through the normal GUP smoke tests over different memory
types on archs (using VM instances): x86_64, aarch64, ppc64le.  For
aarch64, tested over 64KB cont_pte huge pages.  For ppc64le, tested over
16MB hugepd entries (Power8 hash MMU on 4K base page size).

Patch layout
=============

Patch 1-7:    Preparation works, or cleanups in relevant code paths
Patch 8-12:   Teach slow gup with all kinds of huge entries (pXd, hugepd)
Patch 13:     Drop hugetlb_follow_page_mask()

More information can be found in the commit messages of each patch.  Any
comment will be welcomed.  Thanks.

[1] https://lore.kernel.org/all/20230628215310.73782-1-peterx@redhat.com

Peter Xu (13):
  mm/Kconfig: CONFIG_PGTABLE_HAS_HUGE_LEAVES
  mm/hugetlb: Declare hugetlbfs_pagecache_present() non-static
  mm: Provide generic pmd_thp_or_huge()
  mm: Make HPAGE_PXD_* macros even if !THP
  mm: Introduce vma_pgtable_walk_{begin|end}()
  mm/gup: Drop folio_fast_pin_allowed() in hugepd processing
  mm/gup: Refactor record_subpages() to find 1st small page
  mm/gup: Handle hugetlb for no_page_table()
  mm/gup: Cache *pudp in follow_pud_mask()
  mm/gup: Handle huge pud for follow_pud_mask()
  mm/gup: Handle huge pmd for follow_pmd_mask()
  mm/gup: Handle hugepd for follow_page()
  mm/gup: Handle hugetlb in the generic follow_page_mask code

 include/linux/huge_mm.h |  25 +--
 include/linux/hugetlb.h |  16 +-
 include/linux/mm.h      |   3 +
 include/linux/pgtable.h |   4 +
 mm/Kconfig              |   3 +
 mm/gup.c                | 362 ++++++++++++++++++++++++++++++++--------
 mm/huge_memory.c        | 133 +--------------
 mm/hugetlb.c            |  75 +--------
 mm/internal.h           |   7 +-
 mm/memory.c             |  12 ++
 10 files changed, 342 insertions(+), 298 deletions(-)

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
