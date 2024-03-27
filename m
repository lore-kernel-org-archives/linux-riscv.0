Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42335C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 04:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Oh18NFXxNiXwZBBDFuv1HEfJ2gGdIlZGOPmY43jPO2Y=; b=1K9gC4pL7/vhLe
	70edTIw7XfdJEueYpMIF7qgGtxn0x3Acbge552vuMM58dBw0LmPf+Vxqjx5+iP/VlaEQIUMMSXmVS
	OGYAD/g51BRZPgTL+MEwIep5EsMJhrQtRbpLDwWIRGcCwAzG3aS2dzOqyKoY1b5dkpjnARNigGW4d
	kRMPZSA4yJ83TeTVDSaVcrDsQVH85TODZsq9yXm+s3j+Z1KRHj3ke4S++eJZXkmk4Whi7GTOmCeq8
	aviDivT3zwIIh9SRPFl5ndofmx04XSdLl/lnLb+Xya+i3F3m+2z/CIML8ymcRm4HuVqmwzTDdfvXp
	+S0H3dLmEIy0c9dp8nFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpLFQ-00000007S4i-0PDh;
	Wed, 27 Mar 2024 04:50:48 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpLFL-00000007S1x-3LH4
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 04:50:45 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-5a5272035d3so2324893eaf.1
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 21:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711515038; x=1712119838; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6CpKiyiacN2I6+hFCujZLl+xL41sMj3x+fr/3v5LupU=;
        b=cJSlLJtc2rjfg4v4zgS9yDcVgtHX9QlW9OvvAHyb9xAk1OHlvbq00XJIcZJZAkKYbi
         8QtOqrvtnbB262lKwx6DqrImQDfnJvq2kHYx0OtA/evIeq0GinqkLkrZKZP6zlbFv6Qz
         /n1Wr8u0DoRj/tSR+9GHDd9i6jrXyS2ndXQmXUu1sYPGBqH/mddbv3D1UYuEC6D8uXDG
         PTG8cmkg8NTxGKVa2rY2A3I0vtW9Cd8nNOdX9aVeUTIwDr9rzmRsmFT5ybfluy0lKqi6
         rONx6OPy1keNp/sx/ux/EcoSEBF/ClSIQOXGJGc040cD0TYSYyIqFX+RK3KqkUdh6yCc
         JoAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711515038; x=1712119838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CpKiyiacN2I6+hFCujZLl+xL41sMj3x+fr/3v5LupU=;
        b=YJc21Iffjiy098vnhHMlbmcDFtg6KP+HxWH411DmMxoo4BOQM42IXUcdxjONe0P4Mm
         BWXorpMELzwh+0yA9v9pXmrhT34yPLWhxnKGv2HFKub3XP3TGxP150YG3CBK3nA0vRqP
         U5kZ20gMgBbIgPJ41UNYGVtY2AtLVbwLAFribdVq+8+sJOgUx6NCOITkRhIH3T4dkACD
         S+9u1VOIIsjyC4o0qTc2LYseO+tsXgmop5JzEXmvloUYaLJ3E6S1FQ9fPa91gJreD9Ni
         W+ROHHGxIOp7AgyQEhj+9o/dnbFLjmz9xwZ0krlLslDTE6s2JJp7Brbq74DO74xUuANv
         6lCw==
X-Forwarded-Encrypted: i=1; AJvYcCWfZvY4cuVsfCW5cgsiQj2czEeL1c2iatp/hZtDIZBNE/0YWRnSMWLPW3oc1jwgux16rsoWsfr+/TH/kTjoyORbLPHKYFnFojmpyKNPo/zu
X-Gm-Message-State: AOJu0Yy3gBDhwKwe+qPW5nsywMCtFWatx6rO7xQpP3SQLRPrgfx8dRlN
	yNGyyHjVIpdxpMLlNIEVIzKUw55s8es0HeqeyYT7AkkbUN9wQ8WomFK3BA3NILs=
X-Google-Smtp-Source: AGHT+IHtgqVc4dGRodfUI+5mrwigf1xOqOoq1XaZ686TNbdNzvm3dDCitVqVj7iIe7hadKDURImf9g==
X-Received: by 2002:a05:6870:a118:b0:22a:1ce4:c0cf with SMTP id m24-20020a056870a11800b0022a1ce4c0cfmr3722861oae.55.1711515037957;
        Tue, 26 Mar 2024 21:50:37 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id e31-20020a63501f000000b005e4666261besm8351500pgb.50.2024.03.26.21.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 21:50:37 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v6 00/13] riscv: ASID-related and UP-related TLB flush enhancements
Date: Tue, 26 Mar 2024 21:49:41 -0700
Message-ID: <20240327045035.368512-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_215043_910868_222DC6FA 
X-CRM114-Status: GOOD (  16.03  )
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

This series converts uniprocessor kernel builds to use the same TLB
flushing code as SMP builds, to take advantage of batching and existing
range- and ASID-based TLB flush optimizations. It optimizes out IPIs and
SBI calls based on the online CPU count, which also covers the scenario
where SMP was enabled at build time but only one CPU is present/online.
A final optimization is to use single-ASID flushes wherever possible, to
avoid unnecessary TLB misses for kernel mappings.

This series has a semantic conflict with the AIA patches that are in
linux-next due to the removal of the third parameter of
riscv_ipi_set_virq_range(), which is called from imsic_ipi_domain_init()
in drivers/irqchip/irq-riscv-imsic-early.c. The resolution is to remove
the extra argument from the call site.

Here are some numbers from D1 which show the performance impact:

v6.9-rc1:
 System Benchmarks Partial Index              BASELINE       RESULT    INDEX
 Execl Throughput                                 43.0        198.5     46.2
 File Copy 1024 bufsize 2000 maxblocks          3960.0      73934.4    186.7
 File Copy 256 bufsize 500 maxblocks            1655.0      20242.6    122.3
 File Copy 4096 bufsize 8000 maxblocks          5800.0     197706.4    340.9
 Pipe Throughput                               12440.0     176974.2    142.3
 Pipe-based Context Switching                   4000.0      23626.8     59.1
 Process Creation                                126.0        449.9     35.7
 Shell Scripts (1 concurrent)                     42.4        544.4    128.4
 Shell Scripts (16 concurrent)                     ---         35.3      ---
 Shell Scripts (8 concurrent)                      6.0         71.6    119.3
 System Call Overhead                          15000.0     248072.6    165.4
                                                                    ========
 System Benchmarks Index Score (Partial Only)                          110.6

v6.9-rc1 + this patch series:
 System Benchmarks Partial Index              BASELINE       RESULT    INDEX
 Execl Throughput                                 43.0        196.8     45.8
 File Copy 1024 bufsize 2000 maxblocks          3960.0      71782.2    181.3
 File Copy 256 bufsize 500 maxblocks            1655.0      21269.4    128.5
 File Copy 4096 bufsize 8000 maxblocks          5800.0     199424.0    343.8
 Pipe Throughput                               12440.0     196468.6    157.9
 Pipe-based Context Switching                   4000.0      24261.8     60.7
 Process Creation                                126.0        459.0     36.4
 Shell Scripts (1 concurrent)                     42.4        543.8    128.2
 Shell Scripts (16 concurrent)                     ---         35.5      ---
 Shell Scripts (8 concurrent)                      6.0         71.7    119.6
 System Call Overhead                          15000.0     259415.2    172.9
                                                                    ========
 System Benchmarks Index Score (Partial Only)                          113.0

Changes in v6:
 - Move riscv_tlb_remove_ptdesc() definition to fix 32-bit build
 - Clarify the commit message for patch 3 based on ML discussion
 - Clarify the commit message for patch 8 based on ML discussion
 - Rebased on v6.9-rc1

Changes in v5:
 - Rebase on v6.8-rc1 + riscv/for-next (for the fast GUP implementation)
 - Add patch for minor refactoring in asm/pgalloc.h
 - Also switch to riscv_use_sbi_for_rfence() in asm/pgalloc.h
 - Leave use_asid_allocator declared in asm/mmu_context.h

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

Samuel Holland (13):
  riscv: Flush the instruction cache during SMP bringup
  riscv: Factor out page table TLB synchronization
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

 arch/riscv/Kconfig                   |  2 +-
 arch/riscv/errata/sifive/errata.c    |  5 ++
 arch/riscv/include/asm/errata_list.h | 12 ++++-
 arch/riscv/include/asm/mmu.h         |  3 ++
 arch/riscv/include/asm/pgalloc.h     | 32 ++++++------
 arch/riscv/include/asm/sbi.h         |  4 ++
 arch/riscv/include/asm/smp.h         | 15 +-----
 arch/riscv/include/asm/tlbflush.h    | 52 ++++++++-----------
 arch/riscv/kernel/sbi-ipi.c          | 11 +++-
 arch/riscv/kernel/smp.c              | 11 +---
 arch/riscv/kernel/smpboot.c          |  7 +--
 arch/riscv/mm/Makefile               |  5 +-
 arch/riscv/mm/cacheflush.c           |  7 +--
 arch/riscv/mm/context.c              | 23 ++++-----
 arch/riscv/mm/tlbflush.c             | 75 ++++++++--------------------
 drivers/clocksource/timer-clint.c    |  2 +-
 16 files changed, 114 insertions(+), 152 deletions(-)

-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
