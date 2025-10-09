Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9AACCD189
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 01:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xr7LuwlWUC+nEd1gdSFcH6iTEVpWiOPpnhGoRNQgnnU=; b=F2iP2Xr5vHO9eh
	Yl6n40MX9s+++dDlgsROfIlVJCmLwmTY5PiP504Ym+lw3jhRXLmAkBxSO5H/ClZAzTT6tF5hEcjc8
	RoZ+SS3vFJPRWvath5lioZX1FH7PYT2Uf4ADhavqPp7+bH0X2B6Xc61+TkcatCpk1ecgUZdHOn2J6
	g/IW0qfgmwWUybq0WJYVz2YhN4upl5zLDaIJlF8gEvwe3Nvx9ki1AsDDZXtGkVEtQKiCF67qYeLM+
	FLBX8zvsKJS3t2SL3YWR01NvMyLZZTmKtTm0YpblNZrBuqHnC55RIqhCi5Aw1IO6ohnJEmXzXseCV
	paqoA+89itJkzGM30ugA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fvY-00000004z4i-0Oo3;
	Thu, 09 Oct 2025 01:58:44 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fvV-00000004z3J-3r5J
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 01:58:43 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-267facf9b58so2787715ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 08 Oct 2025 18:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1759975121; x=1760579921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MGhJn0zuB3cjukhWEpGI8TCi/TsRvbfQ2QIBtaBaaG4=;
        b=Ih4BS3/xvPEHOvW8p1PlbxB5l9l8tkrtIx4YxGNSlEJ2/PaFtkPg/FJRAkS8PGLH6g
         eowXC4OGscUADimErXs9T6oCoMMP1v9+VGNMQEAtHHHFC3K6wvgTu7N5EyO07ZOLWOO6
         /A+/8sUysfF9Gtxc/rgrYp1+WThEAtFigfT19CRGDa6ng2yE01l55r9c3JT1P+lqA2u5
         //mIRbAQ9xSR/GozaHKotbV3FTomyAjKpqeOkZwo57nGBpC283SW+toGvz6Oirmdl7NG
         4yeUYBY21BMAcepwc3bVZIPJ/Sp819YIuCHK8+yqy22DF/ZCyFpgZuuORxTDl5phHCRI
         9wHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759975121; x=1760579921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MGhJn0zuB3cjukhWEpGI8TCi/TsRvbfQ2QIBtaBaaG4=;
        b=t8KE3vpoNA44FKdJxKI60T3W7JSEteVHJVZy8lW8FLJofIwzz2eOfdpb0n2uMKwN+2
         yhJVSF7rKCbGGLnn+gIv4SIGF7qStvusTv1WKrXzKEmg3vsdnn4DpBUUAP5jxYwv/J1S
         bTZm+wf3U8YkYLWx/fzF9dQFb8m/18NqXU/Uv0bhf9Uw+eDagvLklZ/77XTIVgc8OmG/
         EdwcH2Ynbix5vvka9qsHIMYBVoRZEK2xDLVhSXZJtM7DGlUCaR8JZwk/U1sqVZ7jHShz
         TYgmysW2tLEtOL5bgN+JoPrDyTx08PgptPHTaAH1+VvWWU/A9/NLQRJXo27LfcFBBho8
         N6ng==
X-Forwarded-Encrypted: i=1; AJvYcCWTtJg4W44a+thotNSft74I2qDRdhpRZpEy2aKJVYbaxE3Gt+ZejiCB7hitnSCzLLBOtD/YO8g5znfysQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBGj3KqfoNfP+Wj1TtOGy+FIueL5qbY3o3VcQvo+Xj1WzSzsWJ
	fO2/Wwzkn7BveDcIrbXD08qyOmn1nzHU1tM6CFX1lIXhD1lpCQNw1Th//rg6IsApzXk=
X-Gm-Gg: ASbGnctmaMqlR1D1UR5BJjkOM6eYOEdKH1v0V0XzwNDbCd+hWVPFRhxwOmFgs59pqDA
	GvgTO4eJW6bgmYKqIpAOCj+E35bxF74Y2yb9x+7czC7CSmOaHnhzUZh+KMb+o4veSNwwbkySyp5
	8g/CKenkT6VKH0wRxUrWpz0/svi3Vwnj4PpDnATgJdA8gKHhFmK4f+lj5ReV43rMQ2ipo6dnWnZ
	Z0l5IpRzW/3UYg0yxYsyB/cFrZySXguqYubg9pj1e225vP5YVhzrFslOTzuH0mSTrG+4bdx+UL0
	WI/E//m80dsQMaoGR7kuRW7wxWHYWWNHi7YuEvaeRHuqjBUKOsGGgcSvXglua4wNKe2czje3t3e
	j+ffl6Jkm0QHo1fbK1VbzErTsyvvtKKpc1NwDfWLlw77LJW8mcWnPfj+WMR+w/WhpcQCq6IB+QJ
	KxHzQ=
X-Google-Smtp-Source: AGHT+IFzbHSpjbAdUeon2lhaXxPMeA3ROs733ToOq2tuRqC6DIIzW3ufW0i2Q93eAuRGazWAjP157w==
X-Received: by 2002:a17:903:94f:b0:250:643e:c947 with SMTP id d9443c01a7336-290273ee209mr70465645ad.28.1759975120758;
        Wed, 08 Oct 2025 18:58:40 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de53f9sm11033585ad.14.2025.10.08.18.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 18:58:40 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Conor Dooley <conor@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 00/18] riscv: Memory type control for platforms with physical memory aliases
Date: Wed,  8 Oct 2025 18:57:36 -0700
Message-ID: <20251009015839.3460231-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_185841_984780_84A7BBC4 
X-CRM114-Status: GOOD (  24.60  )
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

 - Patches 1-7 ensure that architecture-specific code that hooks page
   table reads and writes is always called, and the calls are balanced.
 - Patches 8-11 refactor existing platform-specific memory type support
   to be modeled as variants on top of the standard Svpbmt extension,
   and apply the memory type transformation during PTE reads/writes.
 - Patches 12-16 add a new DT binding to describe physical memory
   regions, and implement a new memory type variant that transforms the
   PFN to use the desired alias when reading/writing page tables.
 - Patches 17-18 enable this new memory type variant on StarFive JH7100
   and ESWIN EIC7700.

I have boot-tested this series and tested DMA on SoCs with each of the
four ways to select a memory type: SiFive FU740 (none), SiFive
P470-based SoC (Svpbmt), Allwinner D1 (XTheadMae), and ESWIN EIC7700
(aliases).

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

Changes in v2:
 - Keep Kconfig options for each PBMT variant separate/non-overlapping
 - Move fixup code sequences to set_pXX() and pXXp_get()
 - Only define ALT_UNFIX_MT in configurations that need it
 - Improve inline documentation of ALT_FIXUP_MT/ALT_UNFIX_MT
 - Fix erroneously-escaped newline in assembly ALTERNATIVE_CFG_3 macro
 - Remove references to Physical Address Width (no longer part of Smmpt)
 - Remove special first entry from the list of physical memory regions
 - Fix compatible string in example
 - Put new code behind a new Kconfig option RISCV_ISA_XLINUXMEMALIAS
 - Document the calling convention of riscv_fixup/unfix_memory_alias()
 - Do not transform !pte_present() (e.g. swap) PTEs
 - Export riscv_fixup/unfix_memory_alias() to fix module compilation
 - Move the JH7100 DT changes from jh7100-common.dtsi to jh7100.dtsi
 - Keep RISCV_DMA_NONCOHERENT and RISCV_NONSTANDARD_CACHE_OPS selected

Anshuman Khandual (1):
  mm/ptdump: Replace READ_ONCE() with standard page table accessors

Samuel Holland (17):
  perf/core: Replace READ_ONCE() with standard page table accessors
  mm: Move the fallback definitions of pXXp_get()
  mm: Always use page table accessor functions
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
  dt-bindings: riscv: Describe physical memory regions
  riscv: mm: Use physical memory aliases to apply PMAs
  riscv: dts: starfive: jh7100: Use physical memory ranges for DMA
  riscv: dts: eswin: eic7700: Use physical memory ranges for DMA

 .../bindings/riscv/physical-memory.yaml       |  91 +++++++
 arch/riscv/Kconfig                            |  16 ++
 arch/riscv/Kconfig.errata                     |  19 --
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
 include/dt-bindings/riscv/physical-memory.h   |  44 ++++
 include/linux/huge_mm.h                       |   8 +-
 include/linux/mm.h                            |  14 +-
 include/linux/pgtable.h                       | 112 ++++-----
 kernel/events/core.c                          |   8 +-
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
 mm/memory.c                                   |  78 +++---
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
 65 files changed, 1110 insertions(+), 626 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/riscv/physical-memory.yaml
 create mode 100644 arch/riscv/mm/memory-alias.S
 create mode 100644 include/dt-bindings/riscv/physical-memory.h

-- 
2.47.2

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
