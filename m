Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393D6CD4F38
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 01:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OJKtBElqLAWz6r2Q5vyLVW+I0LUgPdyTk4Kvkt8pTHc=; b=d/L67mblFUKgsQ
	KHtIpJRq8fmqWW41cFAJhInqTHU8jEN5zHsEE0LCcQ6rP8L3sUN+U4494bK+pjVOR6aySIsWt+swo
	RmSN3MQC8/5X0M36ReqUEP8oLFs0wDGMcvrCSx9Q/BYeEP2MUuEUsF/cP1ffMBamqED7CCtFrjUUS
	yJtpqVMiqYU/tcQ1n3vTqVAMEpXZAsEI2BTivOA8mcK7t3tH70PDED4ylkbPR7HUTjQHiKa3D+E80
	VbPrMb0UrZ2EbSXOFlAK6iLhN8xOuE2CIDlUsW3BRce1HglxlbmCAGuHi69aFexjOHPtIRxqSXgy1
	rOfrayECINoVu7X2ihrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQQ-00000009jeq-2BEO;
	Thu, 13 Nov 2025 01:47:02 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQO-00000009je3-0GBy
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 01:47:01 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-793021f348fso212017b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Nov 2025 17:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1762998419; x=1763603219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GSzIa/C5f6OJIgZm6PYuMbKgOcm8FD5PfqT1N2NRHyU=;
        b=eRvUaum32wv8lBL9nKEBeYcC6/Mkqq+iL7KZGBdev7d9T+RqXdiQL+xHtDjeV7tTgQ
         0irt+JocATNlOABWSKD0fGkIkhm8okZjG5U12w1/3mT1+llHrgZsQG6clCVfDpDqmrga
         UDXvBuxifqN23j3atsrA7CvbDI68y6Va0X4esUmaZa8NQUQvm4+kdIWV03dMC6b4iJ8O
         FEyW0m4EuHfVzoZBdtA4v3k5FZd0QMKoHsOuymNnW5LF2E7/OiEvFHfa/UKZ5UbW+LuC
         pmbHFoe58fCUykZ4l4ep/YvqFM5d7En5M5p+kE5L4NVYep6GncFBoXiSQA+qYGu49Q/3
         Phzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762998419; x=1763603219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSzIa/C5f6OJIgZm6PYuMbKgOcm8FD5PfqT1N2NRHyU=;
        b=TAUc1to2St+81Nsvi2U0+ksv1euMoFVFI8r6v8rXKnVjeRUIJ9NTndvYda1FI79LI6
         lYwDF9Az60kxPHMCs4+41UO1E4harJy7zJeU17IGUAs7r8+Bj+OGgSvhrod2FCYy0cbk
         QBEf4jUNnRPwrMEEv8tRFWxJ7ek3Bhr7qvzcvlyIcgC9dKxP8wFNCdnJ70b9PxtuD+gU
         0f61SS3kgVSTXx8YC09A/D8v9Xx9rXsJ+/ZweOyCf6UBpKCws/e2L1uy5dMSAbk/797V
         4fiKuVN4b4gHT68fVP/eO9ex+oGnlkqAa0a16Aicvs23P4ps2njIscpT9fHm/lUcqDMM
         0QJg==
X-Forwarded-Encrypted: i=1; AJvYcCUCqqD5VVkswZ9/eka70bFr2rUG+yZmwlGvs8l8Stlb9n/kE2rHK7RQ7Q8RXie2McaQG/PBe7rj8Eru3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOmMo2AqajTcTzsif67K/mdK92ZXB0bLKY2FdxZoGjMdVhAhay
	hTzdcOsiwYISKeVaC4dN+JgyoRBuREeh07QJJZKignG9SmM2lpcFhcWGnp2d1PBhWMg=
X-Gm-Gg: ASbGncu5/lLOVl9ZWjAyN67BZu5MWPgHhU7iuw0v/e+mmYIAxXECCtyJ2Q3F4qsVCkQ
	KhFKgVhTMb+9/fnHvb7QK+MJiNtlzwSuNiUCRG4/htPGl/D27P6RGvVPp7Kvt5L+GMhacfNKCue
	UwRso+nQ+7DOC3NwvwGig7RQsgCAzzbD6OQ12bIL/3UtLOgS7E2fdr0bZ3d7WkauKtNDMtt8TYL
	25Xw3eaGnSW8wrS/53n7jdDwVDYw6Dt53Ej+hclRh+hd4YtHr8sL6LUtOf3KpUP0x4KIn4RTKjd
	cYgvutbFp5382qyS4iDAmTHVQH2fJ2ZDGdhf69gc97m48ze0XteDDB8G8fx4Ax6ep52V/fXzczM
	16fj0Y4+NhNv+BRvIRgBvkIGWVNVKZ3EU31zbwoDHiTbVUxAvvhHnNSbh555U++pmWZi/MvsfPG
	OsRJeWKBTUpS6OACySLbS7bZ6kGtr4cvgo
X-Google-Smtp-Source: AGHT+IGQ1oJIJsgSbTE25rUPYQbOXvZA9fZDeWGgVb5ZU8Gh8y0+bI+696VC2IPvCWeUs/WTbPO2dg==
X-Received: by 2002:a17:903:8cb:b0:295:6427:87d4 with SMTP id d9443c01a7336-2984ee18d1cmr62642185ad.50.1762998418704;
        Wed, 12 Nov 2025 17:46:58 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2ccae8sm4986485ad.98.2025.11.12.17.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 17:46:58 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Cc: devicetree@vger.kernel.org,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org,
	Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Conor Dooley <conor@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andy Whitcroft <apw@canonical.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Joe Perches <joe@perches.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Nicolas Palix <nicolas.palix@imag.fr>
Subject: [PATCH v3 00/22] riscv: Memory type control for platforms with physical memory aliases
Date: Wed, 12 Nov 2025 17:45:13 -0800
Message-ID: <20251113014656.2605447-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_174700_131540_DA23CFD1 
X-CRM114-Status: GOOD (  27.93  )
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


On some RISC-V platforms, including StarFive JH7100 and ESWIN EIC7700,
DRAM is mapped to multiple physical address ranges, with each alias
having a different set of statically-determined Physical Memory
Attributes (PMAs), such as cacheability. Software can alter the PMAs for
a page by selecting a PFN from the corresponding physical address range.
On these platforms, this is the only way to allocate noncached memory
for use with noncoherent DMA.

These physical memory aliases are only visible to architecture code.
Generic MM code only ever sees the primary (cacheable) alias. The major
change from v1 of this series is that I was asked to move the hooks from
pfn_pXX()/pXX_pfn() to set_pXX()/pXXp_get().

 - Patches 1-10 ensure that architecture-specific code that hooks page
   table reads and writes is always called, and the calls are balanced.
 - Patches 11-14 refactor existing platform-specific memory type support
   to be modeled as variants on top of the standard Svpbmt extension,
   and apply the memory type transformation during PTE reads/writes.
 - Patches 15-20 add a new DT binding to describe physical memory
   regions, and implement a new memory type variant that transforms the
   PFN to use the desired alias when reading/writing page tables.
 - Patches 21-22 enable this new memory type variant on StarFive JH7100
   and ESWIN EIC7700.

I have boot-tested this series and tested DMA on SoCs with each of the
four ways to select a memory type: SiFive FU740 (none), SiFive
P470-based SoC (Svpbmt), Allwinner D1 (XTheadMae), StarFive JH7100
(aliases), and ESWIN EIC7700 (aliases).

Here is some basic `perf benchmark` data comparing relative performance
between v6.17 and either the generic MM changes or the whole series:

 Test        | Scenario   |  FU740 |   P470 |    D1  | EIC7700
 =============================================================
 syscall     | patch 1-10 | +3.17% | +0.89% | +2.60% |  +0.68%
   basic     |     series | -2.52% | -1.41% | +1.37% |  -0.64%
 -------------------------------------------------------------
 syscall     | patch 1-10 | +0.17% | -0.57% | +2.79% |  -1.12%
   fork      |     series | -1.31% | -5.91% | -1.50% |  -2.73%
 -------------------------------------------------------------
 syscall     | patch 1-10 | -0.24% | -0.30% | +2.76% |  +1.32%
   execve    |     series | -1.65% | -4.82% | -1.38% |  -0.66%
 -------------------------------------------------------------
 sched       | patch 1-10 | +1.54% | -5.76% | -5.09% |  -1.04%
   messaging |     series | +0.66% | +2.00% | +1.40% |  +1.97%
 -------------------------------------------------------------

The benchmark results are stable within each machine, and the same
binary was used on all machines. I would have expected the preparatory
changes (patch 1-10) to hurt performance somewhat, due to READ_ONCE/
WRITE_ONCE generating additional loads/stores, but surprisingly
performance was improved in some cases. The variation across machines
in response to the entire series is expected, as each of these machines
gets a different version of the alternative block.

Changes in v3:
 - Use upstream commit/patch for Anshuman Khandual's changes
 - Rebased on top of torvalds/master (v6.18-rc5+)
 - Add a checkpatch rule to warn on page table pointer dereference
 - Select DMA_DIRECT_REMAP when any memory type extension is enabled
 - Split PMR_IS_ALIAS flag from PMR_ALIAS_MASK number
 - Add "model" property to DT binding example to fix validation
 - Fix the logic to allow an alias to be paired with region entry 0
 - Fix the entry number of the paired region in the DT
 - Keep the ERRATA_STARFIVE_JH7100 option but update its description
 - CC all core MM reviewers

Changes in v2:
 - Keep Kconfig options for each PBMT variant separate/non-overlapping
 - Move fixup code sequences to set_pXX() and pXXp_get()
 - Only define ALT_UNFIX_MT in configurations that need it
 - Improve inline documentation of ALT_FIXUP_MT/ALT_UNFIX_MT
 - Fix erroneously-escaped newline in assembly ALTERNATIVE_CFG_3 macro
 - Remove references to Physical Address Width (no longer part of Smmpt)
 - Remove special first entry from the list of physical memory regions
 - Fix compatible string in DT binding example
 - Put new code behind a new Kconfig option RISCV_ISA_XLINUXMEMALIAS
 - Document the calling convention of riscv_fixup/unfix_memory_alias()
 - Do not transform !pte_present() (e.g. swap) PTEs
 - Export riscv_fixup/unfix_memory_alias() to fix module compilation
 - Move the JH7100 DT changes from jh7100-common.dtsi to jh7100.dtsi
 - Keep RISCV_DMA_NONCOHERENT and RISCV_NONSTANDARD_CACHE_OPS selected

Anshuman Khandual (4):
  mm/ptdump: replace READ_ONCE() with standard page table accessors
  mm: replace READ_ONCE() with standard page table accessors
  mm/dirty: replace READ_ONCE() with pudp_get()
  perf/events: replace READ_ONCE() with standard page table accessors

Samuel Holland (18):
  mm: Move the fallback definitions of pXXp_get()
  mm: Always use page table accessor functions
  checkpatch: Warn on page table access without accessors
  mm: Allow page table accessors to be non-idempotent
  riscv: hibernate: Replace open-coded pXXp_get()
  riscv: mm: Always use page table accessor functions
  riscv: mm: Simplify set_p4d() and set_pgd()
  riscv: mm: Deduplicate _PAGE_CHG_MASK definition
  riscv: ptdump: Only show N and MT bits when enabled in the kernel
  riscv: mm: Fix up memory types when writing page tables
  riscv: mm: Expose all page table bits to assembly code
  riscv: alternative: Add an ALTERNATIVE_3 macro
  riscv: alternative: Allow calls with alternate link registers
  riscv: Fix logic for selecting DMA_DIRECT_REMAP
  dt-bindings: riscv: Describe physical memory regions
  riscv: mm: Use physical memory aliases to apply PMAs
  riscv: dts: starfive: jh7100: Use physical memory ranges for DMA
  riscv: dts: eswin: eic7700: Use physical memory ranges for DMA

 .../bindings/riscv/physical-memory.yaml       |  92 +++++++
 arch/riscv/Kconfig                            |  19 +-
 arch/riscv/Kconfig.errata                     |  11 +-
 arch/riscv/Kconfig.socs                       |   4 +
 arch/riscv/boot/dts/eswin/eic7700.dtsi        |   5 +
 .../boot/dts/starfive/jh7100-common.dtsi      |  24 --
 arch/riscv/boot/dts/starfive/jh7100.dtsi      |   4 +
 arch/riscv/include/asm/alternative-macros.h   |  45 +++-
 arch/riscv/include/asm/errata_list.h          |  45 ----
 arch/riscv/include/asm/hwcap.h                |   1 +
 arch/riscv/include/asm/pgtable-32.h           |  17 +-
 arch/riscv/include/asm/pgtable-64.h           | 228 +++++++++++++-----
 arch/riscv/include/asm/pgtable-bits.h         |  43 +++-
 arch/riscv/include/asm/pgtable.h              |  67 ++---
 arch/riscv/kernel/alternative.c               |   4 +-
 arch/riscv/kernel/cpufeature.c                |   6 +
 arch/riscv/kernel/hibernate.c                 |  18 +-
 arch/riscv/kernel/setup.c                     |   1 +
 arch/riscv/kvm/gstage.c                       |   6 +-
 arch/riscv/mm/Makefile                        |   1 +
 arch/riscv/mm/init.c                          |  68 +++---
 arch/riscv/mm/memory-alias.S                  | 123 ++++++++++
 arch/riscv/mm/pgtable.c                       | 114 +++++++--
 arch/riscv/mm/ptdump.c                        |  16 +-
 fs/dax.c                                      |   4 +-
 fs/proc/task_mmu.c                            |  27 ++-
 fs/userfaultfd.c                              |   6 +-
 include/dt-bindings/riscv/physical-memory.h   |  45 ++++
 include/linux/huge_mm.h                       |   8 +-
 include/linux/mm.h                            |  14 +-
 include/linux/pgtable.h                       | 112 ++++-----
 kernel/events/core.c                          |   8 +-
 mm/damon/vaddr.c                              |   2 +-
 mm/debug_vm_pgtable.c                         |   4 +-
 mm/filemap.c                                  |   6 +-
 mm/gup.c                                      |  37 +--
 mm/hmm.c                                      |   2 +-
 mm/huge_memory.c                              |  90 +++----
 mm/hugetlb.c                                  |  10 +-
 mm/hugetlb_vmemmap.c                          |   4 +-
 mm/kasan/init.c                               |  39 +--
 mm/kasan/shadow.c                             |  12 +-
 mm/khugepaged.c                               |  10 +-
 mm/ksm.c                                      |   2 +-
 mm/madvise.c                                  |   8 +-
 mm/mapping_dirty_helpers.c                    |   2 +-
 mm/memory-failure.c                           |  14 +-
 mm/memory.c                                   |  80 +++---
 mm/mempolicy.c                                |   4 +-
 mm/migrate.c                                  |   4 +-
 mm/migrate_device.c                           |  10 +-
 mm/mlock.c                                    |   6 +-
 mm/mprotect.c                                 |   4 +-
 mm/mremap.c                                   |  30 +--
 mm/page_table_check.c                         |   7 +-
 mm/page_vma_mapped.c                          |   6 +-
 mm/pagewalk.c                                 |  14 +-
 mm/percpu.c                                   |   8 +-
 mm/pgalloc-track.h                            |   8 +-
 mm/pgtable-generic.c                          |  25 +-
 mm/ptdump.c                                   |  10 +-
 mm/rmap.c                                     |   8 +-
 mm/sparse-vmemmap.c                           |  10 +-
 mm/userfaultfd.c                              |  10 +-
 mm/vmalloc.c                                  |  49 ++--
 mm/vmscan.c                                   |  16 +-
 scripts/checkpatch.pl                         |   7 +
 67 files changed, 1129 insertions(+), 615 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/riscv/physical-memory.yaml
 create mode 100644 arch/riscv/mm/memory-alias.S
 create mode 100644 include/dt-bindings/riscv/physical-memory.h

-- 
2.47.2

base-commit: 24172e0d79900908cf5ebf366600616d29c9b417
branch: up/dma-alias

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
