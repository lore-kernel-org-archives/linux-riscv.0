Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1DFCD11BF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 22:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HglrTn5YP25XMR6Gslh473KH/yznPaqRAH/XI7Bs2mg=; b=2n/dyXMyQUfbLA
	M5spIWThw3m4it2gEHACqpTrFcKf6/NofryhrcKWGgSt/eZ7u8UO9mKfs11+kXd16aMG5ls08b0p1
	0IryTfkj+RbmcDq72VT845bh1ZJzqRwzBn3sJwVytJe0lVXvU/RBWXhmBFiGmdZHqDzpyV2pkVMq2
	jKbF2XPm0F7/DnNnqveDrEZOSuzUFQTkOwodJI0dXv2XUbh7x1z1OXh9W5pdVGGhgCj9ff/wb9dMX
	qxqOWTlGnxbK1GN+MCPGtvfqceTAmWPKma0XJo1MWDwu8cmqGKbg6PGDRADOexJ9hY0S2f5rfblRj
	S0qdA8XyUx1Wo1/hPlzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnQa4-00000004qG8-1L5N;
	Thu, 21 Mar 2024 22:08:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnQa1-00000004qDy-32Mm
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 22:08:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qBwIOGN4e8d3gKHF9DSbgwYKpkkiYBwtwtMI0MG6X/U=;
	b=hQFPxs5Iqa8oOYU8tRI2nlJB0QOmVFUok4HpsJXkFgyakHkcrZTS/NKYw+xy2UuwBsHRX8
	BRGTwRqrNPHGYwzEqGl/EHCdIbmWh0tkIKbxRIM3JTQR6dhRCjC6t6cjlIZm8Os3r5Ci/p
	ivIlWX1DQekKCR1MHNFekxacTkFnb4w=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-du84_qM_NOCqpiFEAVRtJw-1; Thu, 21 Mar 2024 18:08:06 -0400
X-MC-Unique: du84_qM_NOCqpiFEAVRtJw-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-69651ab4c4fso3556466d6.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Mar 2024 15:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711058886; x=1711663686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBwIOGN4e8d3gKHF9DSbgwYKpkkiYBwtwtMI0MG6X/U=;
        b=B64yENH3acppF4jQ2NcLxoP06aDYVNiUPTE3lOlLQ382namkl8kjpjLbQrJxlqUF32
         OUM5RO+PU01gcOoazehed3h7Sa6ATL7gJ7rT35+HKzoWZh6N+LgSb8iBXjebhitQT/xU
         eCrFL/WiyqZcm+F2e4Dq7pbwvg+fLy7oyT7H0SKokz//Ihaa1Fq2gtbA7NtT4oIu2Xsl
         9uW1GFa7B7oDi0v0xJnkF5hA15n7rFGRvs19+9dFZoFIoA5do7lsSXwXhgkcWK84IKn8
         9ND7XLFfNnNDaHDzgzeKNzZ4Gs3pHhg/ziESuji7JUjfBz1lz4dkR36Ith4VnKGiy93n
         Ne9A==
X-Forwarded-Encrypted: i=1; AJvYcCU7FbXQQVRzFZfu2FdTl2hhyIj3FrKlQRKeGs+krgltxUilVFEykuJxx3oW1hIhjGbdEqQx+0WfsNlphqPdX2cenD9iht3gzbxfstMmQ8cQ
X-Gm-Message-State: AOJu0Yytl2eLaN7HZUefwVSz3JFmyYPecoSa+iMuipkNXH3hCi+T9Qo0
	NPufbJ9Zj6ljSUZYPZxnFvAuSTdJWKwpbtVOG9LggQQpticgTgJAfgmZeP0DGstzsvs416iRNCe
	v66LLbg0J9sLu9SGx6b8XwbWvNlD1gusLlS3aL8yjC6dRYb7Ndl32vDpEFrZkSHkwog==
X-Received: by 2002:a05:6214:4198:b0:695:c55d:fdf8 with SMTP id ld24-20020a056214419800b00695c55dfdf8mr219307qvb.1.1711058885671;
        Thu, 21 Mar 2024 15:08:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjJcDDJC7HZiortxxZHWVHGJUJGwG79NEWr9Sr06E8nvFXSb1um5gXNtJQjx6vxfyzbm5MLg==
X-Received: by 2002:a05:6214:4198:b0:695:c55d:fdf8 with SMTP id ld24-20020a056214419800b00695c55dfdf8mr219273qvb.1.1711058885190;
        Thu, 21 Mar 2024 15:08:05 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id o6-20020a0562140e4600b00690baf5cde9sm351663qvc.118.2024.03.21.15.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 15:08:04 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Matthew Wilcox <willy@infradead.org>,
	Rik van Riel <riel@surriel.com>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	peterx@redhat.com,
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
Subject: [PATCH v3 00/12] mm/gup: Unify hugetlb, part 2
Date: Thu, 21 Mar 2024 18:07:50 -0400
Message-ID: <20240321220802.679544-1-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_150809_935213_7F7E2609 
X-CRM114-Status: GOOD (  22.35  )
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

v3:
- Rebased to latest mm-unstalbe (a824831a082f, of March 21th)
- Dropped patch to introduce pmd_thp_or_huge(), replace such uses (and also
  pXd_huge() users) with pXd_leaf() [Jason]
- Add a comment for CONFIG_PGTABLE_HAS_HUGE_LEAVES [Jason]
- Use IS_ENABLED() in follow_huge_pud() [Jason]
- Remove redundant none pud check in follow_pud_mask() [Jason]

rfc: https://lore.kernel.org/r/20231116012908.392077-1-peterx@redhat.com
v1:  https://lore.kernel.org/r/20231219075538.414708-1-peterx@redhat.com
v2:  https://lore.kernel.org/r/20240103091423.400294-1-peterx@redhat.com

The series removes the hugetlb slow gup path after a previous refactor work
[1], so that slow gup now uses the exact same path to process all kinds of
memory including hugetlb.

For the long term, we may want to remove most, if not all, call sites of
huge_pte_offset().  It'll be ideal if that API can be completely dropped
from arch hugetlb API.  This series is one small step towards merging
hugetlb specific codes into generic mm paths.  From that POV, this series
removes one reference to huge_pte_offset() out of many others.

One goal of such a route is that we can reconsider merging hugetlb features
like High Granularity Mapping (HGM).  It was not accepted in the past
because it may add lots of hugetlb specific codes and make the mm code even
harder to maintain.  With a merged codeset, features like HGM can hopefully
share some code with THP, legacy (PMD+) or modern (continuous PTEs).

To make it work, the generic slow gup code will need to at least understand
hugepd, which is already done like so in fast-gup.  Due to the specialty of
hugepd to be software-only solution (no hardware recognizes the hugepd
format, so it's purely artificial structures), there's chance we can merge
some or all hugepd formats with cont_pte in the future.  That question is
yet unsettled from Power side to have an acknowledgement.  As of now for
this series, I kept the hugepd handling because we may still need to do so
before getting a clearer picture of the future of hugepd.  The other reason
is simply that we did it already for fast-gup and most codes are still
around to be reused.  It'll make more sense to keep slow/fast gup behave
the same before a decision is made to remove hugepd.

There's one major difference for slow-gup on cont_pte / cont_pmd handling,
currently supported on three architectures (aarch64, riscv, ppc).  Before
the series, slow gup will be able to recognize e.g. cont_pte entries with
the help of huge_pte_offset() when hstate is around.  Now it's gone but
still working, by looking up pgtable entries one by one.

It's not ideal, but hopefully this change should not affect yet on major
workloads.  There's some more information in the commit message of the last
patch.  If this would be a concern, we can consider teaching slow gup to
recognize cont pte/pmd entries, and that should recover the lost
performance.  But I doubt its necessity for now, so I kept it as simple as
it can be.

Test Done
=========

For x86_64, tested full gup_test matrix over 2MB huge pages. For aarch64,
tested the same over 64KB cont_pte huge pages.

One note is that this v3 didn't go through any ppc test anymore, as finding
such system can always take time.  It's based on the fact that it was
tested in previous versions, and this version should have zero change
regarding to hugepd sections.

If anyone (Christophe?) wants to give it a shot on PowerPC, please do and I
would appreciate it: "./run_vmtests.sh -a -t gup_test" should do well
enough (please consider [2] applied if hugepd is <1MB), as long as we're
sure the hugepd pages are touched as expected.

Patch layout
=============

Patch 1-8:    Preparation works, or cleanups in relevant code paths
Patch 9-11:   Teach slow gup with all kinds of huge entries (pXd, hugepd)
Patch 12:     Drop hugetlb_follow_page_mask()

More information can be found in the commit messages of each patch.  Any
comment will be welcomed.  Thanks.

[1] https://lore.kernel.org/all/20230628215310.73782-1-peterx@redhat.com
[2] https://lore.kernel.org/r/20240321215047.678172-1-peterx@redhat.com

Peter Xu (12):
  mm/Kconfig: CONFIG_PGTABLE_HAS_HUGE_LEAVES
  mm/hugetlb: Declare hugetlbfs_pagecache_present() non-static
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
 mm/Kconfig              |   6 +
 mm/gup.c                | 354 +++++++++++++++++++++++++++++++++-------
 mm/huge_memory.c        | 133 +--------------
 mm/hugetlb.c            |  75 +--------
 mm/internal.h           |   7 +-
 mm/memory.c             |  12 ++
 9 files changed, 337 insertions(+), 294 deletions(-)

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
