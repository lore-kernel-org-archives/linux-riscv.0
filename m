Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EF0CD1280
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 15:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tOpOjF+3dWdKl5Jq8HLBuimyYQGDtg9HA1ysNA4hydg=; b=BNodPxiMiqq3MG
	kVOccZztxoSePjM5Nl9OC2sYCXawF9h/DMlBkXhXFzqV+XRgjuINU5uzRCZwnjK3Xn9vD5F3iZ+E3
	t2eRWGn+2zkrDjK1Q+2jjcvQjAoC6+8SEEkjIA1k7mpbLvUufRJ7y6cCL0/qNw0AZe/dHDUGgQnrY
	6hPbAivi2/MsX1h4z3tMeDoATAqcgXOwqMWuSplDQO1P2IW9hUC6CR1iwUcRXOQSPYoc9mLey3b9S
	4UY9fewx+jz4b9W7F3E9rgwTA+VpaQ+8pzQjEtkmBYx+Ty/xH3m6EKs982SpuTTIup3XpMYSW+sOh
	nS9Ww8XJamTXJHLkXeaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpV7v-00000009lE9-0fo3;
	Wed, 27 Mar 2024 15:23:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpV7q-00000009l9f-3Iai
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 15:23:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QY8+yIZm1ve5QuiynFE7MjMximJHpz8noDQuYnaNKN8=;
	b=Esbwt1vzoKiRbSwFeQA3mApmKG0xnUIYry3Aps1G9dmr9I5n14dmseAN9JrBQMFi4LKFsY
	D9L0PMo754iZAdXruU8CunaGwTexaO63iUH4ijBuidWwDP35a9ykck6nZl/ZJEsML/JrZ8
	bGFYXbD0fQ/xpD6gOJCHnDUZw6zzskA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-oAiN6bWjPZyM6HovuC8pmA-1; Wed, 27 Mar 2024 11:23:36 -0400
X-MC-Unique: oAiN6bWjPZyM6HovuC8pmA-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-696a9c482a4so3595126d6.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 08:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711553015; x=1712157815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QY8+yIZm1ve5QuiynFE7MjMximJHpz8noDQuYnaNKN8=;
        b=GjGMAJ2A54LnWA3K07nSJcXUd+aZO0RmCot6CJTfcKz+t3MC0wKsXOEsRACxrVpKS7
         Foll7AOfBVm2Oz8J5v3vDQCIDjzYd3LFgtgdZDCr9eYUp0GR8in5EFSF5djF/jAgR6VW
         U572gct29394WWgedPHO5bJO4i1/oXPJmenQ1vBtWdPOC0N5rTHiwQBA7gvfLoJZ98oS
         FuX7LanNkS/obHF9b8j5gH8SM892+bSqMzqdC5j4ZrNAHsyq708Z9eUVAtumZxmThmxg
         itCEwcJrNjg5aFZWJ4QvUAY8qzzeJ5eSPaJW/Zt6tto0x+ob5eXDDdBbCEptBTi7AHbd
         9mjw==
X-Forwarded-Encrypted: i=1; AJvYcCWIRBfZYeLmbeP6/WWZYCW1lDD8MK7h2dzFT4d8vt/qdcwXZ1AC9FnHucLr4AXEl8UIH1wIt9o5C2KLkEM2V3ErsVehSUizsn2XBPddcw56
X-Gm-Message-State: AOJu0YwdTZ/4QhLgaQimvdiQ1t71ZifyixjpLKW6qJ3CsI1VrtdxJ5DE
	tP7z3Wgmo6tZ8FZce5SdtN7JUJEgQhwnUeErei0RYqzofo4RhLgKOtZfVRll7YNdHvY/0i3X/Ud
	Fv3IeaoVS9OkfGHlTY7P+yt+IwQAXC0o9NbFWFtMnunln5uyhSk+W2lLvLUKYqD5nDQ==
X-Received: by 2002:a05:6214:4a07:b0:696:8ecc:c368 with SMTP id pg7-20020a0562144a0700b006968eccc368mr9338928qvb.5.1711553015498;
        Wed, 27 Mar 2024 08:23:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIDOc++LqI5apT0o+E9CespyQta03LCPOzKebS/1UvNBD/Rvzf0d7U/D6UOW074NAt3LtIIw==
X-Received: by 2002:a05:6214:4a07:b0:696:8ecc:c368 with SMTP id pg7-20020a0562144a0700b006968eccc368mr9338893qvb.5.1711553014922;
        Wed, 27 Mar 2024 08:23:34 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hu4-20020a056214234400b00690dd47a41csm6412639qvb.86.2024.03.27.08.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 08:23:34 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Yang Shi <shy828301@gmail.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	peterx@redhat.com,
	Andrew Jones <andrew.jones@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	linux-riscv@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
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
	Jason Gunthorpe <jgg@nvidia.com>,
	Mike Rapoport <rppt@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: [PATCH v4 00/13] mm/gup: Unify hugetlb, part 2
Date: Wed, 27 Mar 2024 11:23:19 -0400
Message-ID: <20240327152332.950956-1-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_082338_915870_805F5EAB 
X-CRM114-Status: GOOD (  23.66  )
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

v4:
- Fix build issues, tested on more archs/configs ([x86_64, i386, arm, arm64,
  powerpc, riscv, s390] x [allno, alldef, allmod]).
  - Squashed the fixup series into v3, touched up commit messages [1]
  - Added the patch to fix pud_pfn() into the series [2]
  - Fixed one more build issue on arm+alldefconfig, where pgd_t is a
    two-item array.
- Manage R-bs: add some, remove some (due to the squashes above)
- Rebase to latest mm-unstable (2f6182cd23a7, March 26th)

rfc: https://lore.kernel.org/r/20231116012908.392077-1-peterx@redhat.com
v1:  https://lore.kernel.org/r/20231219075538.414708-1-peterx@redhat.com
v2:  https://lore.kernel.org/r/20240103091423.400294-1-peterx@redhat.com
v3:  https://lore.kernel.org/r/20240321220802.679544-1-peterx@redhat.com

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

Peter Xu (13):
  mm/Kconfig: CONFIG_PGTABLE_HAS_HUGE_LEAVES
  mm/hugetlb: Declare hugetlbfs_pagecache_present() non-static
  mm: Make HPAGE_PXD_* macros even if !THP
  mm: Introduce vma_pgtable_walk_{begin|end}()
  mm/arch: Provide pud_pfn() fallback
  mm/gup: Drop folio_fast_pin_allowed() in hugepd processing
  mm/gup: Refactor record_subpages() to find 1st small page
  mm/gup: Handle hugetlb for no_page_table()
  mm/gup: Cache *pudp in follow_pud_mask()
  mm/gup: Handle huge pud for follow_pud_mask()
  mm/gup: Handle huge pmd for follow_pmd_mask()
  mm/gup: Handle hugepd for follow_page()
  mm/gup: Handle hugetlb in the generic follow_page_mask code

 arch/riscv/include/asm/pgtable.h    |   1 +
 arch/s390/include/asm/pgtable.h     |   1 +
 arch/sparc/include/asm/pgtable_64.h |   1 +
 arch/x86/include/asm/pgtable.h      |   1 +
 include/linux/huge_mm.h             |  37 +-
 include/linux/hugetlb.h             |  16 +-
 include/linux/mm.h                  |   3 +
 include/linux/pgtable.h             |  10 +
 mm/Kconfig                          |   6 +
 mm/gup.c                            | 518 ++++++++++++++++++++--------
 mm/huge_memory.c                    | 133 +------
 mm/hugetlb.c                        |  75 +---
 mm/internal.h                       |   7 +-
 mm/memory.c                         |  12 +
 14 files changed, 441 insertions(+), 380 deletions(-)

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
