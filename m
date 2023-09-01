Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454BECA0FE4
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 14:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=unbnoglxVhW+eS1O8FKfGYVKIRK3wWviAamz+SfRbdw=; b=QcI
	OA2ledFkV0KGmIrRt129ofL98hyvPzIzbAf4Ys0ITSneCh/a7t5nfrMqhS+L5NvD2QVDjGm9Ti4AM
	xzhMqcxa/5jqXkVcLZy1qRJygn0Diprj5Quql7RX7gz7X4N+jhVt+rsLWVHYPmHkDPiQcL1COYKy0
	HkPzZCpDPw98wqZ06pfgCYc4ccIDMtLhgXBXHso5T+bZ5/f3jBVnokSgsHjBSXc9YQnUD+orzjspi
	eKepUwfAZV6lsUmoZ4tOeI0kFe/QXjVEiTybyNRQ6OEWu7qfUFKC8mGJ27lH92nHeUDwbNs0zWYPu
	xFmKy6p+QNbFUb0cnoFZLULBZYCHb4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc5L4-0002cO-08;
	Fri, 01 Sep 2023 14:41:34 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc5Kz-0002b6-2C
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 14:41:32 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c1f8aaab9aso16293715ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 07:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1693579286; x=1694184086; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLlSfXwVonxJLrQGX+Lv1RGvQVN/wPNIsAMhfrK2IUM=;
        b=owxzs+68gPmMyP4dLGrk6nF0T0/5zvs2gsrzChHBg615JeNqRJibVjIwiZqFYZx+KB
         v0QFDo1wusmyar6DYAeMFqPgI4kPbH4Ndkdp2UjoL8Z6s0Bi1GeLwB7w2afv7mDrVyW4
         QGUUCwPA+OA2o5e/ZWOBiEVXl7IdejIxxw782UNmxWPBtWkw8kUtcG8DCU9IFnsngfZe
         IEZy0t9FxUJBcVBSWtaQTsADMY6HrL5zcuj54Oq/vy86HY93xHp0EOM36md8IMylFzCo
         Wa+30vIPrksFZQEYRnjCF//Kvi0U8XRp2c80wl2IznWEXCkuQTYGyUJ3Z8j6GxhyY4j4
         vuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693579286; x=1694184086;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zLlSfXwVonxJLrQGX+Lv1RGvQVN/wPNIsAMhfrK2IUM=;
        b=jwNwYtgNjJg+m3+qeh19+ty1ERYFR7hCT/pSjSMoJt+IQn2cV98ZEQ2nTN2u2VM1c4
         xDeSrWON4UvI62QITdM14sq0MLyBy1i1oNFxBf1UugjxblUEdkf1Z/hskhjoiyojiegN
         x+maq6ff2IJf5hzo2hmoprjBiJpIzmJZgsZyuUvMP/CDWD1GDhciwVTSIa0L80O/NvQg
         gBbiKGsSfSMuUWoMgXhvbugEVtNrmCU6us/3K5vPVAR51bQOrYthQnOgCGdHC5jsN+sZ
         9g00MpoIS1z9DLJf+rZ+8y3IzWNJ64ms3BK14ffNE4xpXOsDnGbPWoxG9wUjnKXUYK/8
         GCfg==
X-Gm-Message-State: AOJu0YxoOtRFXk6iEqxyRaSOZcK7B1NTMVsHwMiJTbhaI+yeabjGgZXZ
	X9+mpHxDLnZd3nj3ImvUc/QDPmlCb7adZZ/jA10=
X-Google-Smtp-Source: AGHT+IEho09RSXAlSSvcunWsCMhPHOWZ4UtPEasDr/qdHewzd368KiJVUS05Tybf5XCnrYejhMhq/g==
X-Received: by 2002:a17:902:d48e:b0:1c0:ce51:8e8d with SMTP id c14-20020a170902d48e00b001c0ce518e8dmr3266256plg.67.1693579286312;
        Fri, 01 Sep 2023 07:41:26 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id jo6-20020a170903054600b001b86492d724sm3073656plb.223.2023.09.01.07.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 07:41:21 -0700 (PDT)
Date: Fri, 01 Sep 2023 07:41:21 -0700 (PDT)
X-Google-Original-Date: Fri, 01 Sep 2023 07:41:10 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 6.6 Merge Window, Part 1
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-d12081f2-1ff7-4f68-b320-f3aa5c458365@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_074129_938031_A0AD4D58 
X-CRM114-Status: GOOD (  21.97  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8015855338441809305=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8015855338441809305==
Content-Type: text/plain

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.6-mw1

for you to fetch changes up to 89775a27ff6d0396b44de0d6f44dcbc25221fdda:

  lib/Kconfig.debug: Restrict DEBUG_INFO_SPLIT for RISC-V (2023-08-31 00:18:37 -0700)

----------------------------------------------------------------
RISC-V Patches for the 6.6 Merge Window, Part 1

* Support for the new "riscv,isa-extensions" and "riscv,isa-base" device
  tree interfaces for probing extensions.
* Support for userspace access to the performance counters.
* Support for more instructions in kprobes.
* Crash kernels can be allocated above 4GiB.
* Support for KCFI.
* Support for ELFs in !MMU configurations.
* ARCH_KMALLOC_MINALIGN has been reduced to 8.
* mmap() defaults to sv48-sized addresses, with longer addresses hidden
  behind a hint (similar to Arm and Intel).
* Also various fixes and cleanups.

----------------------------------------------------------------
I'll all but certainly have a second pull request, there's already some stuff
stacking up on for-next and there's a few stragglers on the lists -- mostly
stuff with dependencies on other trees, but this cycle has been a bit clunkier
than usual on my end so there's a little more floating around that usual.

I had to fix up two merge conflicts manually, only one managed to show up in
git.  There's some more --cc diff in cpufeature.c, I remember having fixed that
all up on the merge side but apologies if something ended up in rerere and I
forgot about it.

Here's the one that showed up in git:

diff --cc arch/riscv/mm/init.cindex c07ff3e2c90a,156e09a1ceee..8f47a6ee353e---
a/arch/riscv/mm/init.c+++ b/arch/riscv/mm/init.c@@@ -1347,12 -1393,37 +1395,38
@@@ static void __init reserve_crashkernel(         * swiotlb can work on the
crash kernel.         */        crash_base =
memblock_phys_alloc_range(crash_size, PMD_SIZE, -                             
               search_start, search_end); +                                   
         search_start, +                                            
min(search_end, (unsigned long)(SZ_4G - 1)));

for the other the result I ended up with was

extern pgd_t early_pg_dir[PTRS_PER_PGD];
static pgd_t tmp_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
static p4d_t tmp_p4d[PTRS_PER_P4D] __page_aligned_bss;
static pud_t tmp_pud[PTRS_PER_PUD] __page_aligned_bss;

though that's not showing up in the git diff, so I may have something odd going
on here.

----------------------------------------------------------------
Alexandre Ghiti (12):
      perf: Fix wrong comment about default event_idx
      include: riscv: Fix wrong include guard in riscv_pmu.h
      riscv: Make legacy counter enum match the HW numbering
      drivers: perf: Rename riscv pmu sbi driver
      riscv: Prepare for user-space perf event mmap support
      drivers: perf: Implement perf event mmap support in the legacy backend
      drivers: perf: Implement perf event mmap support in the SBI backend
      Documentation: admin-guide: Add riscv sysctl_perf_user_access
      tools: lib: perf: Implement riscv mmap support
      perf: tests: Adapt mmap-basic.c for riscv
      riscv: Mark KASAN tmp* page tables variables as static
      riscv: Move create_tmp_mapping() to init sections

Björn Töpel (1):
      riscv: Require FRAME_POINTER for some configurations

Charlie Jenkins (4):
      RISC-V: mm: Restrict address space for sv39,sv48,sv57
      RISC-V: mm: Add tests for RISC-V mm
      RISC-V: mm: Update pgtable comment documentation
      RISC-V: mm: Document mmap changes

Chen Jiahao (2):
      riscv: kdump: Implement crashkernel=X,[high,low]
      docs: kdump: Update the crashkernel description for riscv

Conor Dooley (9):
      RISC-V: drop a needless check in print_isa_ext()
      RISC-V: shunt isa_ext_arr to cpufeature.c
      RISC-V: repurpose riscv_isa_ext array in riscv_fill_hwcap()
      RISC-V: add missing single letter extension definitions
      RISC-V: add single letter extensions to riscv_isa_ext
      RISC-V: split riscv_fill_hwcap() in 3
      RISC-V: enable extension detection from dedicated properties
      RISC-V: try new extension properties in of_early_processor_hartid()
      RISC-V: provide Kconfig & commandline options to control parsing "riscv,isa"

Greg Ungerer (2):
      binfmt_elf_fdpic: support 64-bit systems
      riscv: support the elf-fdpic binfmt loader

Guo Ren (1):
      riscv: sigcontext: Correct the comment of sigreturn

Heiko Stuebner (1):
      RISC-V: don't parse dt/acpi isa string to get rv32/rv64

Jisheng Zhang (4):
      riscv: allow kmalloc() caches aligned to the smallest value
      riscv: enable DMA_BOUNCE_UNALIGNED_KMALLOC for !dma_coherent
      riscv: enable DEBUG_FORCE_FUNCTION_ALIGN_64B
      riscv: support PREEMPT_DYNAMIC with static keys

Justin Stitt (1):
      RISC-V: cpu: refactor deprecated strncpy

Nam Cao (4):
      riscv: kprobes: simulate c.j instruction
      riscv: kprobes: simulate c.jr and c.jalr instructions
      riscv: kprobes: simulate c.beqz and c.bnez
      riscv: remove redundant mv instructions

Nathan Chancellor (1):
      lib/Kconfig.debug: Restrict DEBUG_INFO_SPLIT for RISC-V

Palmer Dabbelt (9):
      RISC-V: Provide a more helpful error message on invalid ISA strings
      Merge patch series "RISC-V: Probe DT extension support using riscv,isa-extensions & riscv,isa-base"
      Merge patch series "riscv: Allow userspace to directly access perf counters"
      Merge patch series "riscv: kprobes: simulate some instructions"
      Merge patch series "support allocating crashkernel above 4G explicitly on riscv"
      Merge patch series "riscv: KCFI support"
      Merge patch series "riscv: support ELF format binaries in nommu mode"
      Merge patch series "riscv: Reduce ARCH_KMALLOC_MINALIGN to 8"
      Merge patch series "RISC-V: mm: Make SV48 the default address space"

Sami Tolvanen (6):
      riscv: Implement syscall wrappers
      riscv: Add types to indirectly called assembly functions
      riscv: Add ftrace_stub_graph
      riscv: Add CFI error handling
      riscv/purgatory: Disable CFI
      riscv: Allow CONFIG_CFI_CLANG to be selected

Ye Xingchen (1):
      riscv: mm: use bitmap_zero() API

Yuan Tan (1):
      riscv: alternatives: fix a typo in comment

 Documentation/admin-guide/kernel-parameters.txt    |  22 +-
 Documentation/admin-guide/sysctl/kernel.rst        |  27 +-
 Documentation/riscv/vm-layout.rst                  |  22 +
 arch/riscv/Kconfig                                 |  24 +
 arch/riscv/Makefile                                |   3 -
 arch/riscv/include/asm/alternative-macros.h        |   2 +-
 arch/riscv/include/asm/cache.h                     |  14 +
 arch/riscv/include/asm/cacheflush.h                |   2 +
 arch/riscv/include/asm/cfi.h                       |  22 +
 arch/riscv/include/asm/elf.h                       |  13 +-
 arch/riscv/include/asm/hwcap.h                     |  17 +-
 arch/riscv/include/asm/insn.h                      |  10 +
 arch/riscv/include/asm/mmu.h                       |   4 +
 arch/riscv/include/asm/pgtable.h                   |  33 +-
 arch/riscv/include/asm/processor.h                 |  52 +-
 arch/riscv/include/asm/syscall.h                   |   5 +-
 arch/riscv/include/asm/syscall_wrapper.h           |  87 ++++
 arch/riscv/include/uapi/asm/ptrace.h               |   5 +
 arch/riscv/include/uapi/asm/sigcontext.h           |   2 +-
 arch/riscv/kernel/Makefile                         |   2 +
 arch/riscv/kernel/cfi.c                            |  77 +++
 arch/riscv/kernel/compat_syscall_table.c           |   8 +-
 arch/riscv/kernel/cpu.c                            | 181 +++----
 arch/riscv/kernel/cpufeature.c                     | 521 ++++++++++++++-------
 arch/riscv/kernel/head.S                           |   6 +-
 arch/riscv/kernel/mcount.S                         |   9 +-
 arch/riscv/kernel/probes/decode-insn.c             |  11 +-
 arch/riscv/kernel/probes/simulate-insn.c           | 105 +++++
 arch/riscv/kernel/probes/simulate-insn.h           |   5 +
 arch/riscv/kernel/setup.c                          |   6 +
 arch/riscv/kernel/suspend_entry.S                  |   5 +-
 arch/riscv/kernel/sys_riscv.c                      |   6 +
 arch/riscv/kernel/syscall_table.c                  |   8 +-
 arch/riscv/kernel/traps.c                          |   4 +-
 arch/riscv/mm/context.c                            |   2 +-
 arch/riscv/mm/dma-noncoherent.c                    |   8 +
 arch/riscv/mm/init.c                               |  93 +++-
 arch/riscv/mm/kasan_init.c                         |   8 +-
 arch/riscv/purgatory/Makefile                      |   4 +
 drivers/perf/riscv_pmu.c                           | 113 +++++
 drivers/perf/riscv_pmu_legacy.c                    |  28 +-
 drivers/perf/riscv_pmu_sbi.c                       | 196 +++++++-
 fs/Kconfig.binfmt                                  |   2 +-
 fs/binfmt_elf_fdpic.c                              |  38 +-
 include/asm-generic/preempt.h                      |  14 +-
 include/linux/elf-fdpic.h                          |  14 +-
 include/linux/perf/riscv_pmu.h                     |  12 +-
 include/linux/perf_event.h                         |   3 +-
 include/uapi/linux/elf-fdpic.h                     |  15 +
 lib/Kconfig.debug                                  |   7 +-
 tools/lib/perf/mmap.c                              |  66 +++
 tools/perf/tests/mmap-basic.c                      |   6 +-
 tools/testing/selftests/riscv/Makefile             |   2 +-
 tools/testing/selftests/riscv/mm/.gitignore        |   2 +
 tools/testing/selftests/riscv/mm/Makefile          |  15 +
 .../selftests/riscv/mm/testcases/mmap_bottomup.c   |  35 ++
 .../selftests/riscv/mm/testcases/mmap_default.c    |  35 ++
 .../selftests/riscv/mm/testcases/mmap_test.h       |  64 +++
 .../selftests/riscv/mm/testcases/run_mmap.sh       |  12 +
 59 files changed, 1707 insertions(+), 407 deletions(-)
 create mode 100644 arch/riscv/include/asm/cfi.h
 create mode 100644 arch/riscv/include/asm/syscall_wrapper.h
 create mode 100644 arch/riscv/kernel/cfi.c
 create mode 100644 tools/testing/selftests/riscv/mm/.gitignore
 create mode 100644 tools/testing/selftests/riscv/mm/Makefile
 create mode 100644 tools/testing/selftests/riscv/mm/testcases/mmap_bottomup.c
 create mode 100644 tools/testing/selftests/riscv/mm/testcases/mmap_default.c
 create mode 100644 tools/testing/selftests/riscv/mm/testcases/mmap_test.h
 create mode 100755 tools/testing/selftests/riscv/mm/testcases/run_mmap.sh


--===============8015855338441809305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8015855338441809305==--
