Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765ADC48BF6
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 23:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rzPAOj0IKNb3ZLeGxIo/UmG1Dy+/Xvaxwij0RYg7okU=; b=ZSvruGVI0dGEra
	cxMO6jl+hZK5syov6BWA059S2Htu42IO2znd3WorihteVgXXaDBeRP6j4W+4NQ3v6dy86dMzDIu8M
	3/vpjhfXB2hbnDWtiVscIBXL6U0p8pEEvpJW7lQhsCcX1ztNLJmF72EGcR0439IqkzX4UufuMc3gO
	czFRCLMxxsb3WXojLPYKLBWCDObrVo2n/zMcjf+djrUYUxMeCtzaAb4YNtnzab5g6AQLYDlLX2L1X
	HmTHkzsVH33uvZ16R6CAodAjTrcXx/rCH8XQVb8S3rQW4of47IzlKkEjWqiXDnWuTfp/7swW4SInh
	tPp80WRr9haFbMI20MRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfpjI-0000000FZvj-2XWo;
	Thu, 29 Feb 2024 23:22:20 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfpjC-0000000FZsX-2lpt
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 23:22:17 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3bbbc6bcc78so1082650b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 15:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1709248933; x=1709853733; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gYpxFJdLsUY33jWloX4oa7IMcbdSQ5C7SOjzy7kQJJw=;
        b=R0wZKHnh8UEh7iSpc6Uo1tWOsPR5d6fHtD1ii9M6vuR2fdud5Il7zQ5OnpsDcPQiIM
         u6JFI3EtmTkHjnje+N3jYtHNUCNa3y6ItRV9L2T51a0JgzhjTwEGJZ++s5jzgUgia8q6
         y9Lq/5EEOL211GRPefbtDXdopUC8+nixUI9PLY08FvGxmN5/owDCOShzNGU/LLgB/F8L
         CPO9ePzvfQvflz/hTtAQ2lBQIyQ3+9XDzepMV1RW0vlqF89pfm3kcuxbRm9UmslF8J/7
         mN85JhPtnLVg19py9tHQpuUmpVVEKiCrm3HtCqjrwGkuE0nDJSxVe42OkEQXPvTOkkHk
         qy6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709248933; x=1709853733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gYpxFJdLsUY33jWloX4oa7IMcbdSQ5C7SOjzy7kQJJw=;
        b=uAVnIs6aLQByCa1CDXS7GjpA3m5eWJSQwecO8Nap9tg+1OyOg9lAsB4HHi8QSl4JRS
         OxAnuspkojsAb8ty/XehdJozv17dvKejwxLamtjUjQUO0Fn7c3IR6WcoWmcLgjU/WH7O
         IVhWVFOHUWYAs3tdEztz7K3c8QAiWBdzUqImJQnbSdc6gvWZPl996XQjKaX1Y0pNGANh
         j/O453aXW8VzSfWN+fI6J/8GgeyCL70LhsqEnyHgaBU+wFJSM3LZpmBgmLXKVWrWv/aC
         hxF9Yfr97qK5MDWWOTskmtydNbKfQLrgIfkn+LxrcvJmA71O83vPo35p+DMbc4f3pzPe
         ld/A==
X-Forwarded-Encrypted: i=1; AJvYcCWRvRDSl+vDGuux92MnSB5v89SfofcrsDmAIt1k74pksw3Fy8eMeOdqTlzqbgG5rhVAlVHcKyGLp8sPfvLvPEzRWVDbTwERW+eqLUWbwD42
X-Gm-Message-State: AOJu0YyrVk1nBL9vjjV28Semxjv52TQK9+8vYLSvUxSQX56GpK+w0VB9
	zZ+Au8YZ7RF5lyHH/6Tmq2Vi1/OGYyChFVV3Qj2Lbz7FivJFULHqexqUBgX+Jto=
X-Google-Smtp-Source: AGHT+IEbMzGg89JeXwrCbKoTrQtwzZydngrB60RIdlIeQk1Zbv0hmu3BVs2SCgNJATrXU3oE9uJ2wA==
X-Received: by 2002:a05:6808:1a83:b0:3c1:d0a2:9220 with SMTP id bm3-20020a0568081a8300b003c1d0a29220mr68801oib.24.1709248933079;
        Thu, 29 Feb 2024 15:22:13 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id c6-20020aa78806000000b006e55aa75d6csm1779719pfo.122.2024.02.29.15.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 15:22:12 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v5 00/13] riscv: ASID-related and UP-related TLB flush enhancements
Date: Thu, 29 Feb 2024 15:21:41 -0800
Message-ID: <20240229232211.161961-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_152214_855133_90F364DE 
X-CRM114-Status: GOOD (  14.33  )
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

v6.8-rc6 + riscv/fixes + riscv/for-next:
 System Benchmarks Partial Index              BASELINE       RESULT    INDEX
 Execl Throughput                                 43.0        223.5     52.0
 File Copy 1024 bufsize 2000 maxblocks          3960.0      62563.4    158.0
 File Copy 256 bufsize 500 maxblocks            1655.0      17869.2    108.0
 File Copy 4096 bufsize 8000 maxblocks          5800.0     164915.1    284.3
 Pipe Throughput                               12440.0     161368.5    129.7
 Pipe-based Context Switching                   4000.0      22247.1     55.6
 Process Creation                                126.0        546.9     43.4
 Shell Scripts (1 concurrent)                     42.4        599.6    141.4
 Shell Scripts (16 concurrent)                     ---         39.3      ---
 Shell Scripts (8 concurrent)                      6.0         79.1    131.9
 System Call Overhead                          15000.0     246019.0    164.0
								    ========
 System Benchmarks Index Score (Partial Only)                          109.2

v6.8-rc6 + riscv/fixes + riscv/for-next + this patch series:
 System Benchmarks Partial Index              BASELINE       RESULT    INDEX
 Execl Throughput                                 43.0        223.1     51.9
 File Copy 1024 bufsize 2000 maxblocks          3960.0      71982.9    181.8
 File Copy 256 bufsize 500 maxblocks            1655.0      18436.9    111.4
 File Copy 4096 bufsize 8000 maxblocks          5800.0     184955.2    318.9
 Pipe Throughput                               12440.0     162622.9    130.7
 Pipe-based Context Switching                   4000.0      22082.5     55.2
 Process Creation                                126.0        546.4     43.4
 Shell Scripts (1 concurrent)                     42.4        598.1    141.1
 Shell Scripts (16 concurrent)                     ---         38.8      ---
 Shell Scripts (8 concurrent)                      6.0         78.6    131.0
 System Call Overhead                          15000.0     258529.3    172.4
								    ========
 System Benchmarks Index Score (Partial Only)                          112.8

[1]: https://lore.kernel.org/linux-riscv/20231030133027.19542-1-alexghiti@rivosinc.com/

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
 arch/riscv/include/asm/tlbflush.h    | 51 ++++++++-----------
 arch/riscv/kernel/sbi-ipi.c          | 11 +++-
 arch/riscv/kernel/smp.c              | 11 +---
 arch/riscv/kernel/smpboot.c          |  7 +--
 arch/riscv/mm/Makefile               |  5 +-
 arch/riscv/mm/cacheflush.c           |  7 +--
 arch/riscv/mm/context.c              | 23 ++++-----
 arch/riscv/mm/tlbflush.c             | 75 ++++++++--------------------
 drivers/clocksource/timer-clint.c    |  2 +-
 16 files changed, 114 insertions(+), 151 deletions(-)

-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
