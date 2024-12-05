Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609D1E77178
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 10:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6ymWExUBQuZg9OU46o10vHav3/+PjMrS8bxWMqU5LX4=; b=kbN7AmUmU4avBZ
	35mvsdm0wotvepm/p56S03V0M8zeA+yvoSrE4lPRgXGSlRdaQm00g+RH5j8oKXPCLG81QaXryDjtc
	sdcViwfatlMj2UIXPv1ZVsPjW5tn4XEuxb3A3Ge3mM2P2QLSJN/e1bdDAGqTqXUGscJfMexEL9Fsy
	7yaybxHU1OC+YQGL4j4oT92Y0fxVvF0gZERn9Gz/wIpVkijtyIBxCeOq2aNo0lMGIBdGH83F7mtq+
	/1QrKMDtuKlknzqE1dgrFiROH/qrPgVcnj+WY11Q2MsKk6M6YWADVpL2KXwtC3cumb6YeE0OODQWR
	l7jr7klnS6sKDmI6/WwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Ll-0000000FaLw-10JJ;
	Thu, 05 Dec 2024 10:44:49 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Et-0000000FXuh-3TL4
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 10:37:45 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7256dc42176so802511b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 02:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1733395059; x=1733999859; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mx3bO1dHXrQFEcxzN7b+pxSxnpvefYStWIHaUWrn/y4=;
        b=Vyz/0FhEVWZIOIQFfXbys9plaMqM5LvxP7SjbeCqOKJ/Okz0jvqK0BhEx2elLC3JEI
         IOYZU7cGrB4tvw7QCkbzmbV5AEXzEZBBrdd4WzyBVkDLf24yb9cHIMOJny2KA8py4+He
         SlrZIatw9M8Fo/Bcuv+oQvs6UozwvMNraH3ALjLrdKKo59TnS/4lGlDHunnFa2htVX5e
         LtAiebHqAA0QEmcwOsvc4T8W+C5CXX7ifrvNTXl1j21bzmJ+ThgYR1+mXl/jCw0tB/mX
         F6eO8eFxY0C7kQeNm2Hg68DMYVp4WI7E5HFK8ItUxjoO6SapbBqEffFWW/Ak2Y4uhmvJ
         enng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733395059; x=1733999859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mx3bO1dHXrQFEcxzN7b+pxSxnpvefYStWIHaUWrn/y4=;
        b=J5jkPiyT+jN7iigOxb9RE1Wt7wfaasvDC9ekKMKgtNvD0DNdTL4Ho54ApSK6OQi07L
         zvQ0b1Wcd09FUgL1IwZK4IjKqdNz8mbyg43u0Vw/LT9nS+viPvJxj/nuCmEnw0r+Ya0W
         qeV8iBAB/FMmxliHGFzvG0Okk0qKjICTkypieVWzqTyKGZJI9THKOGs3YHhowDuSRps2
         bS8V6w9HzjOMOezF7uSW8zlPBfBJYXXhdiOdmfuJaXClxNxyB+3rxyEUJi9SfQXI/wyw
         mWmPtstqRu7f3Yax/mgqeBxv3wvrvK9OXRiCcBq3IAI4ExhcUNTXEYFrJAo4XRiDtwhX
         ZtfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpDV3IJq4JKN0ByZ2CWlQF7eJM8MDzYJYDoymRrvYFrCTANe4mc9n9gLoYpzFqnqYhX61b/95/5LHzsg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6W6ak6etNw/IYNukptaJ/CyLgtSVikvedc7YUukKo7ykwmYTR
	nsTueoKvlXWQZ1y+JZb92No6FInITPioQtIiWvAlczLcU9yVjIy6TkghvXd/DVY=
X-Gm-Gg: ASbGncuwzzqDUenLFg1STgu5XqazHykjs3YD6wubjsbhbnkqrXBHQUay6hlTrl2b6ZR
	ArsExCc1McvR7tz0+s5al993EcE3w4XElxU7GA4QVGqn4qTr3Jv49FUEvKBDQNjnVGJ8KOsOvCW
	w9N7iRwz+mVcV5meLypdc/WIZBlxy9cmvnBOixKgIqK0uTh4raZTgNaSLKZ4duMhAewMNDau+er
	BbqeQ4XnuYGVqSxH8rY6Td+1cBQDuhJMq6AY6oSZj+bhqrKPM83XIXhQu9KBcwb5zCmPi80LRzy
	U1IIcl98IwHTVTFnBBik3rH1BhVAYKcN
X-Google-Smtp-Source: AGHT+IHiqAXBvE3gLjiFeE5je7PXQUYt1a4jU3QlzDyqkveJzS+AyvksHc49kSByBz2ufFXcaypagw==
X-Received: by 2002:a05:6a00:92a3:b0:71e:79a9:ec47 with SMTP id d2e1a72fcca58-7257fa5708fmr12300993b3a.6.1733395058729;
        Thu, 05 Dec 2024 02:37:38 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156f048csm886826a12.39.2024.12.05.02.37.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Dec 2024 02:37:38 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	punit.agrawal@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH v2 00/21] riscv: Introduce 64K base page
Date: Thu,  5 Dec 2024 18:37:08 +0800
Message-Id: <20241205103729.14798-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_023744_054866_70F46F6F 
X-CRM114-Status: GOOD (  11.96  )
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

This patch series attempts to break through the limitation of MMU and
supports larger base page on RISC-V, which only supports 4K page size
now. The key idea is to always manage and allocate memory at a
granularity of 64K and use SVNAPOT to accelerate address translation.
This is the second version and the detailed introduction can be found
in [1].

Changes from v1:
- Rebase on v6.12.

- Adjust the page table entry shift to reduce page table memory usage.
    For example, in SV39, the traditional va behaves as:

    ----------------------------------------------
    | pgd index | pmd index | pte index | offset |
    ----------------------------------------------
    | 38     30 | 29     21 | 20     12 | 11   0 |
    ----------------------------------------------

    When we choose 64K as basic software page, va now behaves as:

    ----------------------------------------------
    | pgd index | pmd index | pte index | offset |
    ----------------------------------------------
    | 38     34 | 33     25 | 24     16 | 15   0 |
    ----------------------------------------------

- Fix some bugs in v1.

Thanks in advance for comments.

[1] https://lwn.net/Articles/952722/

Xu Lu (21):
  riscv: mm: Distinguish hardware base page and software base page
  riscv: mm: Configure satp with hw page pfn
  riscv: mm: Reimplement page table entry structures
  riscv: mm: Reimplement page table entry constructor function
  riscv: mm: Reimplement conversion functions between page table entry
  riscv: mm: Avoid pte constructor during pte conversion
  riscv: mm: Reimplement page table entry get function
  riscv: mm: Reimplement page table entry atomic get function
  riscv: mm: Replace READ_ONCE with atomic pte get function
  riscv: mm: Reimplement PTE A/D bit check function
  riscv: mm: Reimplement mk_huge_pte function
  riscv: mm: Reimplement tlb flush function
  riscv: mm: Adjust PGDIR/P4D/PUD/PMD_SHIFT
  riscv: mm: Only apply svnapot region bigger than software page
  riscv: mm: Adjust FIX_BTMAPS_SLOTS for variable PAGE_SIZE
  riscv: mm: Adjust FIX_FDT_SIZE for variable PMD_SIZE
  riscv: mm: Apply Svnapot for base page mapping if possible
  riscv: Kconfig: Introduce 64K page size
  riscv: Kconfig: Adjust mmap rnd bits for 64K Page
  riscv: mm: Adjust address space layout and init page table for 64K
    Page
  riscv: mm: Update EXEC_PAGESIZE for 64K Page

 arch/riscv/Kconfig                    |  34 +-
 arch/riscv/include/asm/fixmap.h       |   3 +-
 arch/riscv/include/asm/hugetlb.h      |   5 +
 arch/riscv/include/asm/page.h         |  56 ++-
 arch/riscv/include/asm/pgtable-32.h   |  12 +-
 arch/riscv/include/asm/pgtable-64.h   | 128 ++++--
 arch/riscv/include/asm/pgtable-bits.h |   3 +-
 arch/riscv/include/asm/pgtable.h      | 564 +++++++++++++++++++++++---
 arch/riscv/include/asm/tlbflush.h     |  26 +-
 arch/riscv/include/uapi/asm/param.h   |  24 ++
 arch/riscv/kernel/head.S              |   4 +-
 arch/riscv/kernel/hibernate.c         |  21 +-
 arch/riscv/mm/context.c               |   7 +-
 arch/riscv/mm/fault.c                 |  15 +-
 arch/riscv/mm/hugetlbpage.c           |  30 +-
 arch/riscv/mm/init.c                  |  45 +-
 arch/riscv/mm/kasan_init.c            |   7 +-
 arch/riscv/mm/pgtable.c               | 111 ++++-
 arch/riscv/mm/tlbflush.c              |  31 +-
 arch/s390/include/asm/hugetlb.h       |   2 +-
 include/asm-generic/hugetlb.h         |   5 +-
 include/linux/pgtable.h               |  21 +
 kernel/events/core.c                  |   6 +-
 mm/debug_vm_pgtable.c                 |   6 +-
 mm/gup.c                              |  10 +-
 mm/hmm.c                              |   2 +-
 mm/hugetlb.c                          |   4 +-
 mm/mapping_dirty_helpers.c            |   2 +-
 mm/memory.c                           |   4 +-
 mm/mprotect.c                         |   2 +-
 mm/ptdump.c                           |   8 +-
 mm/sparse-vmemmap.c                   |   2 +-
 mm/vmscan.c                           |   2 +-
 33 files changed, 1029 insertions(+), 173 deletions(-)
 create mode 100644 arch/riscv/include/uapi/asm/param.h

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
