Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0533BC3DA5D
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 22:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dM7+cJq63gQlutbgKi32cWhx1iKe5ucFFSPewTeWYfc=; b=EhDf9Kzx59TTXw
	hYVtyciLHVqze0UTrqGxSvdya9kzkh3bfJsrI6MrnaDC2XDEckQYh0aTYaar/AbCk0PHs2Y3Gqq2F
	F1hI6osg9o+2/0LpjPlEGEbMirVLcxG95sBvXrZ3fJ3TPJjMQHH8GSTKiUm2jAMy7DNqnVtTFI1Z8
	/j4cMkeWhhTdTatVyeFZXMC1aSdWilOzTrAWcOeH7F7agLUzOYArUMj8rybth8ObmkuB7POLNmeaF
	RWwz5HrVAg5C/7m5JxI2uzHWvbWbMxOUxB10UGLh7XVitN/jyDQ+vgn6eSOo05blXwJDtPrfLdj7d
	lOY4aMpmtcWGqipuwe2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUCkl-0000000F3p3-0fv9;
	Wed, 17 Jul 2024 22:04:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUCjE-0000000F38d-0t9V
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 22:02:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721253746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=22URfq8NjvGndByOojJP9eQog6fnp2xGbHVHJb+hEIw=;
	b=ZZ55QWP+Jb9IXzzMGu2SHc1HRvrudcI/usrldFmwK92IX+V/OWLLdMHMy1PCXzMTDF79UT
	p9nFP2dwww6+nQdabO7kF1+5KwF2uRFvnYamJtdQnGIOPz9c+1XcSHtO4w/HAzcupCpC/z
	1KE3un0nVimNd+E6Ap8+v7ytU/jrfzI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-0bKwHi-JPz6Bh8JgKvjUfA-1; Wed, 17 Jul 2024 18:02:23 -0400
X-MC-Unique: 0bKwHi-JPz6Bh8JgKvjUfA-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6b7740643fbso589936d6.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jul 2024 15:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721253743; x=1721858543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=22URfq8NjvGndByOojJP9eQog6fnp2xGbHVHJb+hEIw=;
        b=xCxjy+NPG/dIWGwMWI2mBKRUto+IywmiIg6S9sstsFLA/ANoY9GE1tFKmzt3AUNn63
         ffuHvv0e+Nn2w2+mxvrvyKUg3CTOdGTAlGBRPfDu1jl5a1zq8oULQyGKw7z4J/UgLzmG
         HONaW0WVvF97KX3tm1gkufm+NrG4JbdyGpiM6/3cuhPi2lgb+/FRDvfxJEOpDtvBCu+2
         7okQJxgHNH3hm62ZPLIaj8x3++XJe3IQ9u8fkLO8FaxyDT/B59PuOSBqkbsbygbHwnW2
         QmHoen+9f8FLN7OwVuyIj+avD3YOgRVRzY81J53wQ0oediCZn5NBqqT/8N5oYWPzDkPn
         DTww==
X-Forwarded-Encrypted: i=1; AJvYcCU1wKNoIKYU8pa5qPLWrrz5Ek6JoItRZJCnMrvkNOL3VpsiL2H+IfrVWuzF93VvE192QDDiD6HcZSw9bw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxA4OI/tYDxG2+TyLZZQGyJ7cieeLmox0L/0sdOkwUMNa0wTo3P
	0P744CRvcwu5OljAxr35w3JG4jF3KRJYrQS3g8VH5YYyMPGuhqWLV9dGuH1BHKkX8k0HJuUItAG
	2jFta3ejMZcijJnObO1yGj/T4pkTGQw9+ViTiLLjhCCCOMxdWKQDzSa5ArVCDhntwLw==
X-Received: by 2002:ac8:5e4e:0:b0:44f:89e3:e8d2 with SMTP id d75a77b69052e-44f89e3ec09mr15923561cf.12.1721253742645;
        Wed, 17 Jul 2024 15:02:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH030U/0PuH20CJyPZJMzLVzXnymjVCbugSgXnKR5JUMtRiVtVl+1d1cBUhmI+Iq8e7T2bLTA==
X-Received: by 2002:ac8:5e4e:0:b0:44f:89e3:e8d2 with SMTP id d75a77b69052e-44f89e3ec09mr15923181cf.12.1721253742192;
        Wed, 17 Jul 2024 15:02:22 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44f5b83f632sm53071651cf.85.2024.07.17.15.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 15:02:21 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: Vlastimil Babka <vbabka@suse.cz>,
	peterx@redhat.com,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	linux-s390@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Michal Hocko <mhocko@kernel.org>,
	linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org,
	Alex Williamson <alex.williamson@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	x86@kernel.org,
	Alistair Popple <apopple@nvidia.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Ryan Roberts <ryan.roberts@arm.com>,
	Hugh Dickins <hughd@google.com>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: [PATCH RFC 0/6] mm: THP-agnostic refactor on huge mappings
Date: Wed, 17 Jul 2024 18:02:13 -0400
Message-ID: <20240717220219.3743374-1-peterx@redhat.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_150228_328849_481DDAD6 
X-CRM114-Status: GOOD (  22.02  )
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

This is an RFC series, so not yet for merging.  Please don't be scared by
the code changes: most of them are code movements only.

This series is based on the dax mprotect fix series here (while that one is
based on mm-unstable):

  [PATCH v3 0/8] mm/mprotect: Fix dax puds
  https://lore.kernel.org/r/20240715192142.3241557-1-peterx@redhat.com

Overview
========

This series doesn't provide any feature change.  The only goal of this
series is to start decoupling two ideas: "THP" and "huge mapping".  We
already started with having PGTABLE_HAS_HUGE_LEAVES config option, and this
one extends that idea into the code.

The issue is that we have so many functions that only compile with
CONFIG_THP=on, even though they're about huge mappings, and huge mapping is
a pretty common concept, which can apply to many things besides THPs
nowadays.  The major THP file is mm/huge_memory.c as of now.

The first example of such huge mapping users will be hugetlb.  We lived
until now with no problem simply because Linux almost duplicated all the
logics there in the "THP" files into hugetlb APIs.  If we want to get rid
of hugetlb specific APIs and paths, this _might_ be the first thing we want
to do, because we want to be able to e.g., zapping a hugetlb pmd entry even
if !CONFIG_THP.

Then consider other things like dax / pfnmaps.  Dax can depend on THP, then
it'll naturally be able to use pmd/pud helpers, that's okay.  However is it
a must?  Do we also want to have every new pmd/pud mappings in the future
to depend on THP (like PFNMAP)?  My answer is no, but I'm open to opinions.

If anyone agrees with me that "huge mapping" (aka, PMD/PUD mappings that
are larger than PAGE_SIZE) is a more generic concept than THP, then I think
at some point we need to move the generic code out of THP code into a
common code base.

This is what this series does as a start.

In general, this series tries to move many THP things (mostly resides in
huge_memory.c right now) into two new files: huge_mapping_{pmd|pud}.c.
When I move them out, I also put them separately into different files for
different layers.  Then if an arch supports e.g. only PMD, it can avoid
compile the PUD helpers, with things like:

        CONFIG_PGTABLE_HAS_PUD_LEAVES=n
        obj-$(CONFIG_PGTABLE_HAS_PUD_LEAVES) += huge_mapping_pud.o

Note that there're a few tree-wide changes into arch/, but that's not a
lot, to make this not disturbing too much people, I only copied the open
lists of each arch not yet the arch maintainers.

Tests
=====

My normal 19-archs cross-compilation tests pass with it, and smoke tested
on x86_64 with a local config of mine.

Comments welcomed, thanks.

Peter Xu (6):
  mm/treewide: Remove pgd_devmap()
  mm: PGTABLE_HAS_P[MU]D_LEAVES config options
  mm/treewide: Make pgtable-generic.c THP agnostic
  mm: Move huge mapping declarations from internal.h to huge_mm.h
  mm/huge_mapping: Create huge_mapping_pxx.c
  mm: Convert "*_trans_huge() || *_devmap()" to use *_leaf()

 arch/arm64/include/asm/pgtable.h             |   11 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h |    7 +-
 arch/powerpc/mm/book3s64/pgtable.c           |    2 +-
 arch/riscv/include/asm/pgtable.h             |    4 +-
 arch/s390/include/asm/pgtable.h              |    2 +-
 arch/s390/mm/pgtable.c                       |    4 +-
 arch/sparc/mm/tlb.c                          |    2 +-
 arch/x86/include/asm/pgtable.h               |    5 -
 arch/x86/mm/pgtable.c                        |   15 +-
 include/linux/huge_mm.h                      |  332 ++++--
 include/linux/mm.h                           |   18 +
 include/linux/mm_types.h                     |    2 +-
 include/linux/pgtable.h                      |   61 +-
 include/trace/events/huge_mapping.h          |   41 +
 include/trace/events/thp.h                   |   28 -
 mm/Kconfig                                   |    6 +
 mm/Makefile                                  |    2 +
 mm/gup.c                                     |    2 -
 mm/hmm.c                                     |    4 +-
 mm/huge_mapping_pmd.c                        |  976 +++++++++++++++
 mm/huge_mapping_pud.c                        |  235 ++++
 mm/huge_memory.c                             | 1125 +-----------------
 mm/internal.h                                |   33 -
 mm/mapping_dirty_helpers.c                   |    4 +-
 mm/memory.c                                  |   16 +-
 mm/migrate_device.c                          |    2 +-
 mm/mprotect.c                                |    4 +-
 mm/mremap.c                                  |    5 +-
 mm/page_vma_mapped.c                         |    5 +-
 mm/pgtable-generic.c                         |   37 +-
 30 files changed, 1595 insertions(+), 1395 deletions(-)
 create mode 100644 include/trace/events/huge_mapping.h
 create mode 100644 mm/huge_mapping_pmd.c
 create mode 100644 mm/huge_mapping_pud.c

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
