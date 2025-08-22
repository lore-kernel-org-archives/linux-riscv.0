Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0ADCA0EED
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 15:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Znv33+XZH5HFFAJoFg4bYT2n9jOic5j3bXNeip6hk/4=; b=Arb/tZdokzAvTn
	ZrVqrRWNg+MjRtidwQVVCSNB72nrvdOxy3nbZ3cC8FWfxqVDPKhuk4K1DJCeRLnmpDtmtxm7ATI4Z
	y8BBleaJTDc3ZntOBtfZM74NL1AioEMOV6lh5Zx71AWwCICsfx6twDr2JVPZQyrmQSs29nydjeHkM
	gHMDgo/Si9Q4eoELCZNnuXm/jGzLGlmWROL8W3c+ma14YKxjgz7TsK/5GTpzxK9fpmzOnVKM6JGKg
	5IxnuxyPRAuwPPAVLykjFyj1x6Hi1zhOBqL1bBU56No9DtxEW518Cc/PFKNiE5/z6/IaIZAdv7COq
	0IoF7pGj1laipgWt3M6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTmb-000000032IK-0j6P;
	Fri, 22 Aug 2025 15:34:25 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upN38-00000001vWZ-14bG
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 08:23:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755850979;
	bh=hVavycqMrPemBzWjKcAFiAsh6MQHU/3hvyOrGOvCTsk=;
	h=From:To:Cc:Subject:Date:From;
	b=n3hw1yrzFgymnMe6I39Ns8dAbaU8ke443nB8cex/RWNnDprZnhw0sqOPfZd4Le99v
	 hPXcfKSRVBu4C6xGfAg4cssdVFfafUv8ugUAapbCOl2TmLMVFQYQoD3oEtLxbl/zeS
	 GciTxfY981eGp4kmylCkGfyZ0M6ADazxeVrzmuxE/QNBk3KBbYFFbBTs1N8z7AItg+
	 CFWwaYpj/vmujGXXm52IYTyLG+3fQi2RpwYFpU+LCXWvvfA71bg53Sp49dPSse3sG7
	 cI7woKUzjOu2DCLTMz2L5ky4xCn+DNnWh12gWAzbToSFmmrV3Yzfm4b9qBiaZSCQT1
	 /UcWVZwNiAf/w==
Received: from mt.tail9873f4.ts.net (unknown [103.151.43.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6910617E12FF;
	Fri, 22 Aug 2025 10:22:54 +0200 (CEST)
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
To: Shuah Khan <shuah@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
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
	kevin.brodsky@arm.com
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v3 0/8] selftests/mm: Add compiler flags and fix found warnings
Date: Fri, 22 Aug 2025 13:20:57 +0500
Message-ID: <20250822082145.4145617-1-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_012302_489493_FC5CE37A 
X-CRM114-Status: GOOD (  13.82  )
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

The changes have been build tested on x86_64, arm64, powerpc64 and
partially
on riscv64. The test run with and without this series has been done on
x86_64.

---
Changes since v1:
- Drop test harness patch which isn't needed anymore
- Revamp how patches are written per same kind of failure

Changes since v2:
- split_huge_page_test.c: better deadcode removal
- Drop -Wunused-parameter flag as kernel also doesn't enable it and it
  causes too much hassle
- Drop previous patches 6 and 7 as they are just marking unused parameters
  with unused flag
- Rename __unused to __always_unused and also add __maybe_unused

Muhammad Usama Anjum (8):
  selftests/mm: Add -Wunreachable-code and fix warnings
  selftests/mm: protection_keys: Fix dead code
  selftests: kselftest.h: Add unused macro
  selftests/mm: Add -Wunused family of flags
  selftests/mm: Remove unused parameters
  selftests/mm: Fix unused parameter warnings for different
    architectures
  selftests/mm: mark variable unused with macro
  selftests/mm: pkey-helpers: Remove duplicate __maybe_unused

 tools/testing/selftests/kselftest.h           |  8 ++++++
 tools/testing/selftests/mm/Makefile           |  2 +-
 tools/testing/selftests/mm/compaction_test.c  |  2 +-
 tools/testing/selftests/mm/cow.c              |  2 +-
 tools/testing/selftests/mm/droppable.c        |  2 +-
 tools/testing/selftests/mm/gup_longterm.c     |  2 +-
 tools/testing/selftests/mm/hmm-tests.c        |  5 ++--
 tools/testing/selftests/mm/hugepage-vmemmap.c |  2 +-
 tools/testing/selftests/mm/hugetlb-madvise.c  |  2 +-
 .../selftests/mm/hugetlb-soft-offline.c       |  2 +-
 tools/testing/selftests/mm/ksm_tests.c        | 17 ++++++-------
 tools/testing/selftests/mm/madv_populate.c    |  2 +-
 tools/testing/selftests/mm/map_populate.c     |  2 +-
 tools/testing/selftests/mm/memfd_secret.c     |  2 +-
 .../testing/selftests/mm/mlock-random-test.c  |  2 +-
 tools/testing/selftests/mm/mlock2-tests.c     |  2 +-
 tools/testing/selftests/mm/mseal_test.c       |  8 ++++--
 tools/testing/selftests/mm/on-fault-limit.c   |  2 +-
 tools/testing/selftests/mm/pkey-helpers.h     |  3 ---
 .../selftests/mm/pkey_sighandler_tests.c      | 25 +++++++++++++++----
 tools/testing/selftests/mm/protection_keys.c  |  6 ++---
 tools/testing/selftests/mm/soft-dirty.c       |  6 ++---
 .../selftests/mm/split_huge_page_test.c       |  2 +-
 tools/testing/selftests/mm/uffd-common.c      |  4 +--
 tools/testing/selftests/mm/uffd-common.h      |  2 +-
 tools/testing/selftests/mm/uffd-stress.c      |  2 +-
 tools/testing/selftests/mm/uffd-unit-tests.c  |  8 +++---
 tools/testing/selftests/mm/uffd-wp-mremap.c   |  2 +-
 .../selftests/mm/virtual_address_range.c      |  2 +-
 29 files changed, 73 insertions(+), 55 deletions(-)

-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
