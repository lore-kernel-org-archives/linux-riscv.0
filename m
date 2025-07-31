Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E22C87FCA
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 16:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lo8jUkNwSfR2g2DLZ4Moqw8grCcXn1fZDlOy4VKO/S8=; b=HZzFFazsUXrreq
	Sflvmf/tWm+la23DxwrhvG5Q5/P29Td1dA7cYmByzjWmvG434y23eb/zCzJ/KTjw8wW1pc22rrkKo
	GopjdvubDUBYcqZnmabOc4xDs0T4FdBWtRK4VVtPK7BseFRHFZgcoHTH7md7ibeLju1wN8pFiJuub
	8GHMJiBrYv20G1hWhAlEQkgnkp9rQ3OeO1E/STm6mWWqJ4vg/3RqBoHSFRBipt2mMzm9wQmWJ5mag
	Z4rEsBBnvslrVafelZ/pXMr1M7mQdVZyAfTg+8Scz4XuImcYDdEde3ZDa+WguUGxkPt+RRWWT1ZES
	IYie45WCvSlZHKiR1WFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhVk2-000000041jF-1AFW;
	Thu, 31 Jul 2025 16:02:50 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhVjz-000000041i8-375L
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 16:02:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753977731; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZEWeWRS9NSRtAoYJxrk6zRnSS7qa1OVpBdM2SJ3xXuAG6R+eXaSMCIA8RNptxud6zJNpzEJC5teZqBpSmHzg8QBojAmMCg/fxqV2N8FDI/+fAZy01OKFsin5Ai4uGkvKTtO8U9wrHCbcJg1hK6DcO0uC06o2t0tEApFWiaylDDU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753977731; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=meNELh8LR1NAeAvdziO/ZgYgHuiniypSBrawhPsx+G4=; 
	b=jHVH1kgjVLXRvCR1F5I0VoPOPqohdomaXMIZAhRmwEtfMjpLxBCNC/mepNDk3dJdLvqCyO29aEzfE010htlexxv9SyI4l+/nXqZq6pZa5UuBftOcXTj8quN2lBKIuAJWbOOAyFPRWtHm0iydZq7ygxyLuea7862o7QbiHn3R7UM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753977731;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=meNELh8LR1NAeAvdziO/ZgYgHuiniypSBrawhPsx+G4=;
	b=kBCYLhCZOgzVeWLofV1x57vA+k/CUZJZToOl5buYcqBdy2YTFJGa6G+bdE2wyS7g
	LN6BRD4KO/J+zQ/2kjx2Qz6vDoj0JQIIzGh+lG55+SYCNMDIx1VlY8YgwgWJbVtyDT2
	uj+RMFayNJ6gciYtQVYIp+1rscQQVv2cQUoqxLe4=
Received: by mx.zohomail.com with SMTPS id 1753977728569555.2914754706031;
	Thu, 31 Jul 2025 09:02:08 -0700 (PDT)
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Leon Romanovsky <leon@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Shuah Khan <shuah@kernel.org>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v2 0/8] selftests/mm: Add compiler flags and fix found warnings
Date: Thu, 31 Jul 2025 21:01:24 +0500
Message-Id: <20250731160132.1795351-1-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_090247_805688_1C777A06 
X-CRM114-Status: GOOD (  12.86  )
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

Recently, I reviewed a patch on the mm/kselftest mailing list about a
test which had obvious type mismatch fix in it. It was strange why that
wasn't caught during development and when patch was accepted. This led
me to discover that those extra compiler options to catch these warnings
aren't being used. When I added them, I found tens of warnings in just
mm suite.

In this series, I'm adding these flags and fixing those warnings. In the
last try several months ago [1], I'd patches for individual tests. I've
made patches better by grouping the same type of fixes together. Hence
there is no changelog for individual patches.

The changes have been build tested on x86_64, arm64, powerpc64 and partially
on riscv64. The test run with and without this series has been done on
x86_64.

---
Changes since v1:
- Drop test harness patch which isn't needed anymore
- Revamp how patches are written per same kind of failure

Muhammad Usama Anjum (8):
  selftests/mm: Add -Wunreachable-code and fix warnings
  selftests/mm: protection_keys: Fix dead code
  selftests: kselftest.h: Add __unused macro
  selftests/mm: Add -Wunused family of flags
  selftests/mm: Remove unused parameters
  selftests/mm: Mark unused arguments with __unused
  selftests/mm: Mark unused arguments with __unused
  selftests/mm: Fix unused parameter warnings for different
    architectures

 tools/testing/selftests/kselftest.h           |  4 ++
 tools/testing/selftests/mm/Makefile           |  3 +-
 tools/testing/selftests/mm/compaction_test.c  |  2 +-
 tools/testing/selftests/mm/cow.c              | 22 +++++------
 tools/testing/selftests/mm/droppable.c        |  2 +-
 tools/testing/selftests/mm/gup_longterm.c     |  2 +-
 tools/testing/selftests/mm/hmm-tests.c        |  5 +--
 tools/testing/selftests/mm/hugepage-vmemmap.c |  2 +-
 tools/testing/selftests/mm/hugetlb-madvise.c  |  2 +-
 .../selftests/mm/hugetlb-soft-offline.c       |  2 +-
 .../selftests/mm/hugetlb_fault_after_madv.c   |  4 +-
 .../selftests/mm/hugetlb_madv_vs_map.c        |  6 +--
 tools/testing/selftests/mm/ksm_tests.c        | 17 ++++-----
 tools/testing/selftests/mm/madv_populate.c    |  2 +-
 tools/testing/selftests/mm/map_populate.c     |  2 +-
 tools/testing/selftests/mm/memfd_secret.c     |  6 +--
 .../testing/selftests/mm/mlock-random-test.c  |  2 +-
 tools/testing/selftests/mm/mlock2-tests.c     |  2 +-
 tools/testing/selftests/mm/mseal_test.c       |  8 +++-
 tools/testing/selftests/mm/on-fault-limit.c   |  2 +-
 tools/testing/selftests/mm/pfnmap.c           |  2 +-
 tools/testing/selftests/mm/pkey-arm64.h       |  5 ++-
 tools/testing/selftests/mm/pkey-powerpc.h     |  2 +-
 tools/testing/selftests/mm/pkey-x86.h         |  3 +-
 .../selftests/mm/pkey_sighandler_tests.c      | 35 ++++++++++++-----
 tools/testing/selftests/mm/protection_keys.c  | 22 +++++------
 tools/testing/selftests/mm/soft-dirty.c       |  6 +--
 .../selftests/mm/split_huge_page_test.c       |  8 ++--
 tools/testing/selftests/mm/uffd-common.c      | 15 ++++----
 tools/testing/selftests/mm/uffd-common.h      |  2 +-
 tools/testing/selftests/mm/uffd-stress.c      |  2 +-
 tools/testing/selftests/mm/uffd-unit-tests.c  | 38 +++++++++----------
 tools/testing/selftests/mm/uffd-wp-mremap.c   |  2 +-
 .../selftests/mm/virtual_address_range.c      |  2 +-
 34 files changed, 130 insertions(+), 111 deletions(-)

-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
