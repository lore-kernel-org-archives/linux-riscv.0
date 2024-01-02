Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AC3C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 22:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=knPSzn2liOb9BoRX1M9bHHIXuOQxq+2t10Pyf+95xww=; b=ws0v33rn5XXwa/
	gmqN7kRnPVIa3KdpXCOUjTPXoaDjbt1MmLFHPcnsQ4Qt1c9cYXBi1DRN1fafAmj+A1VyLVY+ojck+
	z9SGu0c80dDGHGd4Hj/C70O1cbyru7qGJ4/wOOs1IW4/8v7QxqS3eDBR8d+MF6z1JXz/qS1HZFU5m
	q2Xc2aofrKThFswIVoHJN+ZAEzjwQI1GqzB+Niv9Qp/9OLmkNJd26Etk9AilvTCVL1vQpecCXnTVS
	rUJMS6UyaLf/3HBNrLYpsUc5zY/U7nFZ7ZsyPdEb75sdFp75p5R5wPscEsBUZ6ZbzJLYJa22t58ks
	qkxJpDZS8JCSSxaA2Y5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKmpU-0098Qz-1T;
	Tue, 02 Jan 2024 22:01:44 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKmpQ-0098NK-1S
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 22:01:42 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-28bd623c631so8055252a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jan 2024 14:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704232897; x=1704837697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8AiLZ+S8ss+wMnNlNoL9Dmtw+ys4LyrrpsDpp+lAvHs=;
        b=fE7e68DfukvbopLIcJLl2MoorKCamB1FpJmBMPlXiZ5GoUIyThY295BZLYhPtrZY8Q
         kJOEe4YIXIcWIPiKsFA/eQ0mXuTQCyZau3hLTUmoYZ6T/dpyFnS1Fx+DmW3A0/YniyTZ
         LO1jBzyxL5VJ1rbVXRO6SeczUr9FAo/XUhAgSQ3TW5g1oigsjp8dYZUEeqGReZrEcJ5p
         odK3gtKeUZoOqAbGoBM5IdJad3s/tkdNYGplwVtG2J9Ls9XSqZU1QFbuejGRCh1ErthM
         TtcjZDvXXuBdg6PNczyjWweNIGFI+35oYA0OIKBG/rgF5/gnA00Cc01gCXylkOouKozR
         WxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704232897; x=1704837697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8AiLZ+S8ss+wMnNlNoL9Dmtw+ys4LyrrpsDpp+lAvHs=;
        b=NQ8g+Zq7igkJSja1H1YAwDLm25OYtRd9jbtFjTNc2Dgey1CYAqP1SpbBZ1G5z217Oo
         L6tuStlrMXWqHL3zLhJCXF6B9THeI5Sj3SL1QY3jF0Upo+bH0mr/u5Gpjaw146B1klNb
         K9fNojHjhBE9cNlvIJ9sY8rD4RlbEoWAKZdGOeKaUAdrwmsgojU8Nty45ndxfADU+Hew
         g3IA4YL97W1zjibESF4dQ//0OpsbBbPJiZBvnLM5DTXrViQICgSmIUz6riuB29oy6bBY
         0QGShXjXqzJ/EMHY4lQBOvbYYWf7q8vW2c/HRpf0IDB3Zb/H0H3hw4np48Tn18289sMz
         uTgw==
X-Gm-Message-State: AOJu0YwuoOxFBUlj1pIoocYxnJpeTozYCob1gIZht5jkI/14RKMeYDRh
	t6fQZU0B+3T+0HRekOA8zSiafK4rKpsARg==
X-Google-Smtp-Source: AGHT+IFeov/gk3M9avfaoFHoq8DxqDNeNKONTMxG1L5Z5D7bNfNm3jHAFAoBaA7kbVFzjuOMQZ9Zxw==
X-Received: by 2002:a17:90a:5898:b0:28c:890f:f814 with SMTP id j24-20020a17090a589800b0028c890ff814mr5775390pji.29.1704232896832;
        Tue, 02 Jan 2024 14:01:36 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id r59-20020a17090a43c100b0028ce507cd7dsm101724pjg.55.2024.01.02.14.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 14:01:36 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v4 00/12] riscv: ASID-related and UP-related TLB flush enhancements
Date: Tue,  2 Jan 2024 14:00:37 -0800
Message-ID: <20240102220134.3229156-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_140140_541834_83315D5C 
X-CRM114-Status: GOOD (  13.66  )
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

While reviewing Alexandre Ghiti's "riscv: tlb flush improvements"
series[1], I noticed that most TLB flush functions end up as a call to
local_flush_tlb_all() when SMP is disabled. This series resolves that,
and also optimizes the scenario where SMP is enabled but only one CPU is
present or online. Along the way, I realized that we should be using
single-ASID flushes wherever possible, so I implemented that as well.

Here are some numbers from D1 (with SMP disabled) which show the
performance impact:

v6.7-rc8:
 System Benchmarks Partial Index              BASELINE       RESULT    INDEX
 Execl Throughput                                 43.0        207.4     48.2
 File Copy 1024 bufsize 2000 maxblocks          3960.0      52187.4    131.8
 File Copy 256 bufsize 500 maxblocks            1655.0      14872.6     89.9
 File Copy 4096 bufsize 8000 maxblocks          5800.0     146597.8    252.8
 Pipe Throughput                               12440.0     125318.4    100.7
 Pipe-based Context Switching                   4000.0      17804.2     44.5
 Process Creation                                126.0        479.2     38.0
 Shell Scripts (1 concurrent)                     42.4        564.5    133.1
 Shell Scripts (16 concurrent)                     ---         36.8      ---
 Shell Scripts (8 concurrent)                      6.0         74.3    123.9
 System Call Overhead                          15000.0     182050.7    121.4
                                                                    ========
 System Benchmarks Index Score (Partial Only)                           93.2

v6.7-rc8 plus this patch series:
 System Benchmarks Partial Index              BASELINE       RESULT    INDEX
 Execl Throughput                                 43.0        208.5     48.5
 File Copy 1024 bufsize 2000 maxblocks          3960.0      56847.0    143.6
 File Copy 256 bufsize 500 maxblocks            1655.0      17728.9    107.1
 File Copy 4096 bufsize 8000 maxblocks          5800.0     168016.2    289.7
 Pipe Throughput                               12440.0     133376.2    107.2
 Pipe-based Context Switching                   4000.0      19736.3     49.3
 Process Creation                                126.0        484.5     38.4
 Shell Scripts (1 concurrent)                     42.4        564.1    133.0
 Shell Scripts (16 concurrent)                     ---         36.6      ---
 Shell Scripts (8 concurrent)                      6.0         74.1    123.5
 System Call Overhead                          15000.0     210181.8    140.1
                                                                    ========
 System Benchmarks Index Score (Partial Only)                          100.1

[1]: https://lore.kernel.org/linux-riscv/20231030133027.19542-1-alexghiti@rivosinc.com/

Changes in v4:
 - Fix a possible race between flush_icache_*() and SMP bringup
 - Refactor riscv_use_ipi_for_rfence() to make later changes cleaner
 - Optimize kernel TLB flushes with only one CPU online
 - Optimize global cache/TLB flushes with only one CPU online
 - Merge the two copies of __flush_tlb_range() and rely on the compiler
   to optimize out the broadcast path (both clang and gcc do this)
 - Merge the two copies of flush_tlb_all() and rely on constant folding
 - Only set tlb_flush_all_threshold when CONFIG_MMU=y.

Changes in v3:
 - Fixed a performance regression caused by executing sfence.vma in a
   loop on implementations affected by SiFive CIP-1200
 - Rebased on v6.7-rc1

Changes in v2:
 - Move the SMP/UP merge earlier in the series to avoid build issues
 - Make a copy of __flush_tlb_range() instead of adding ifdefs inside
 - local_flush_tlb_all() is the only function used on !MMU (smpboot.c)

Samuel Holland (12):
  riscv: Flush the instruction cache during SMP bringup
  riscv: Use IPIs for remote cache/TLB flushes by default
  riscv: mm: Broadcast kernel TLB flushes only when needed
  riscv: Only send remote fences when some other CPU is online
  riscv: mm: Combine the SMP and UP TLB flush code
  riscv: Apply SiFive CIP-1200 workaround to single-ASID sfence.vma
  riscv: Avoid TLB flush loops when affected by SiFive CIP-1200
  riscv: mm: Introduce cntx2asid/cntx2version helper macros
  riscv: mm: Use a fixed layout for the MM context ID
  riscv: mm: Make asid_bits a local variable
  riscv: mm: Preserve global TLB entries when switching contexts
  riscv: mm: Always use an ASID to flush mm contexts

 arch/riscv/errata/sifive/errata.c    |  5 ++
 arch/riscv/include/asm/errata_list.h | 12 ++++-
 arch/riscv/include/asm/mmu.h         |  3 ++
 arch/riscv/include/asm/mmu_context.h |  2 -
 arch/riscv/include/asm/sbi.h         |  4 ++
 arch/riscv/include/asm/smp.h         | 15 +-----
 arch/riscv/include/asm/tlbflush.h    | 50 ++++++++----------
 arch/riscv/kernel/sbi-ipi.c          | 11 +++-
 arch/riscv/kernel/smp.c              | 11 +---
 arch/riscv/kernel/smpboot.c          |  7 +--
 arch/riscv/mm/Makefile               |  5 +-
 arch/riscv/mm/cacheflush.c           |  7 +--
 arch/riscv/mm/context.c              | 26 ++++------
 arch/riscv/mm/tlbflush.c             | 76 +++++++++-------------------
 drivers/clocksource/timer-clint.c    |  2 +-
 15 files changed, 102 insertions(+), 134 deletions(-)

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
