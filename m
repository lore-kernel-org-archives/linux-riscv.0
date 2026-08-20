Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB76C5DF81
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 17:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ym14kcMVtngkmjWpDrnXpAKP/unbj4/tJBOE9P501XU=; b=jkm/XWZwVYGt9ijCpr7U5lQlDF
	F/9bvQqJvTcSCJvRvrqmBbFI3u97sInyz/sKrHbJYmz1dh/LP//h3FF/bbK8hLOl3eCCrqAvJ6DMg
	zMV5VpUmUWrzI8rw8som1yTkhZfmzPsJQvcx3xE72jvvnpg1HOQWDIB36bAAQ9Nlt1g2Ljiy2zvbU
	+xivMiUj9/Q7jK/d3QBgClhuFD3kInKeWBpLxd91a2Ep4t9Dlv0FZ4Od0dtQvfsLw4W+UA7n3Wx83
	vcmmxvxsaNSHruyczFrEkAtRULUNZZYeOncZLSw8HDWHl+nw3T82KgPyCye0AJXMphzeTjbG4cISg
	9MeGa3sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6CH-0000000BvyW-3sgC;
	Thu, 20 Aug 2026 17:04:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6CG-0000000BvyP-0B9b
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 17:04:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 81F8141A8F;
	Thu, 20 Aug 2026 17:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DFB21F000E9;
	Thu, 20 Aug 2026 17:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787245495;
	bh=iH3kWkrAxOIaylMcpoWMKctMyWHMymYYFqkW8/BInnQ=;
	h=Date:From:To:cc:Subject;
	b=JijYZjrEQ9EL5+faY1hZp8hcXyFwMFuLrN13/KzM+7CTEgybQQC2GlbSa+hqzHDEn
	 X8cWSzsd2a3kQDRCetmXE0n6Y3oILuokYvYXcpana1LvNFchkdENB/oDtRuQ5Uf+QC
	 HKDjSQW6/Rbrg1MXudTU6mO+GtvjqMfsrwr4gGL14XCM/iWTmDESqptW2JHbY9NmTy
	 Jw5YCKc8IY1Qj53vz7gc27zZCe7VTh1sxcpTe3WR5azhUKL/xduHUYaP6ydeLbn3cA
	 to5jXL3Ta4s4F6e4VHZedJdnPksCgHX0UNsyC2TlBp0IO9LCSO5cj2XgXIiKsbA+Gy
	 6txLRQnc4yFew==
Date: Thu, 20 Aug 2026 11:04:52 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: torvalds@linux-foundation.org
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V updates for v7.3-rc1
Message-ID: <d788ab68-c0de-69a3-a36d-b968d6de9b7a@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-389810084-1787245495=:74280"
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-389810084-1787245495=:74280
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

Linus,

Please pull these RISC-V updates for v7.3-rc1.  From a maintenance
point of view, there's a new header file include added into one of the
ACPI driver files.  This doesn't affect existing ACPI-enabled
architectures.

thanks

- Paul


The following changes since commit 994dad686e755477e2b2700cca4e6e1a90a58bdc:

  riscv: hwprobe: Register unaligned probes before usermode (2026-08-07 17:36:22 -0600)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.3-mw1

for you to fetch changes up to 8da45c93dfa98f25b148512d92ecfa75d027a5cc:

  RISC-V: hwprobe: Use BIT macro to avoid warnings (2026-08-07 19:24:34 -0600)

----------------------------------------------------------------
RISC-V updates for v7.3

- Add initial definitions and discovery for the Smcsrind, Sscsrind,
  Smcntrpmf, Ssccfg, Smcdeleg, Zicclsm, Ziccamoa, Ziccif, Ziccrse,
  Za64rs, and Ssqosid RISC-V ISA extensions

- Improve the RISC-V update_mmu_cache_range() implementation by using
  flush-by-ASID, enabling performance improvements on
  microarchitectures that support related optimizations; and by taking
  advantage of the Svinval RISC-V ISA extension on microarchitectures
  that support it

- Shrink CFI shadow stack allocation further (to 512MB) to save
  virtual address space (and physical memory on systems with strict
  overcommit policies)

- Add initial CPU context switch support for QoS tagging (Ssqosid)

- Change our vector misaligned access speed test code to be
  synchronous, avoiding a bunch of bugs related to unnecessary
  asynchronicity

- Enable ARCH_HAS_ACPI_TABLE_UPGRADE for RISC-V to help with ACPI
  table debugging (similar to ARM64 and x86)

- Extract vDSO section offsets at build time, rather than run time, to
  avoid the boot time overhead

- Use assembler directives to control the use of instructions from the
  RISC-V ISA extensions Zacas and Zabha, rather than compiler -march
  flags that could affect the whole kernel (similar to ARM64)

- Add a kselftest for kprobes support for the c.jal instruction on
  RISC-V

- When UEFI runtime services are available, use them to restart and
  power off

- Fix ARCH_HAS_ACPI_TABLE_UPGRADE for RISC-V by adding a missing
  include file to the ACPI code

- Move contiguous DMA memory reservation later in the boot, to ensure
  that the correct global and per-node pools are allocated when
  CONFIG_CMA_SIZE_PERNUMA is enabled

- Disallow probes on breakpoint handlers to avoid recursing
  indefinitely into do_trap_break()

- Patch the compat vDSO during runtime alternatives processing, not
  only the standard vDSO

- Remove some leftover XIP support elements missed by commit
  9b3a2be84803 ("riscv: Remove support for XIP kernel")

- Fix broadcast timer switching in ACPI LPI power states by
  implementing a RISC-V version of arch_get_idle_state_flags()

- Miscellaneous fixes, including: vDSO makefile simplification;
  marking our default_power_off() as __noreturn; error path fixes in
  the PMU SBI perf driver; RISC-V extension capitalization
  consistency; the use of BIT() macros in one of our include files;
  and some documentation fixes

----------------------------------------------------------------
Andrew Jones (1):
      riscv: Add Ziccamoa, Ziccif, Ziccrse, and Za64rs to cpufeature and hwprobe

Atish Patra (10):
      riscv: efi: Power off via EFI runtime services when available
      riscv: Restart via EFI runtime services when available
      RISC-V: perf: fix resource cleanup on driver probe failure
      RISC-V: Add Smcsrind and Sscsrind ISA extension definition and parsing
      dt-bindings: riscv: add Smcsrind and Sscsrind ISA extension descriptions
      RISC-V: Define indirect CSR access helpers
      RISC-V: Add Smcntrpmf extension parsing
      dt-bindings: riscv: add Smcntrpmf ISA extension description
      RISC-V: Add Ssccfg/Smcdeleg ISA extension definition and parsing
      dt-bindings: riscv: add Counter delegation ISA extensions description

Charlie Jenkins (1):
      riscv: Standardize extension capitalization

Drew Fustini (3):
      dt-bindings: riscv: Add Ssqosid extension description
      riscv: Detect the Ssqosid extension
      riscv: Add support for srmcfg CSR from Ssqosid extension

Eder Zulian (1):
      riscv: mm: Move dma_contiguous_reserve() after NUMA initialization

Guodong Xu (1):
      riscv: cpufeature: Clarify ISA spec version for canonical order

Jesse Taube (2):
      riscv: Add Zicclsm to cpufeature and hwprobe
      RISC-V: hwprobe: Use BIT macro to avoid warnings

Jisheng Zhang (1):
      riscv: further remove XIP

Kaiwen Xue (2):
      RISC-V: Add Smcsrind and Sscsrind ISA extension CSR definitions
      RISC-V: Add Ssccfg extension CSR definition

Nam Cao (3):
      riscv: kprobes: add test case for c.jal instruction simulation
      riscv: unaligned: stop using kthread for check_vector_unaligned_access()
      Revert "riscv: hwprobe: Fix stale vDSO data for late-initialized keys at boot"

Peixin Xie (1):
      riscv: acpi: Handle LPI architectural context loss flags

Rui Qi (1):
      riscv: kprobes: Prevent probes in breakpoint handlers

Thomas Weiﬂschuh (4):
      riscv: vdso: Simplify cflags remove logic
      riscv: vdso: Add symbols for the alternative section boundaries
      riscv: alternative: Use the statically extracted vDSO section offsets
      riscv: alternative: Also patch the compat vDSO

Thorsten Blum (1):
      riscv: Mark default_power_off() as __noreturn

Vivian Wang (3):
      ACPI: tables: Add missing #include <asm/fixmap.h>
      riscv: acpi: Enable ARCH_HAS_ACPI_TABLE_UPGRADE
      riscv: cmpxchg: Use .option arch for Zacas and Zabha

Xiaofeng Yuan (1):
      riscv: probes: simulate c.jal instruction

Xu Lu (2):
      riscv: mm: Use ASID in update_mmu_cache()
      riscv: mm: Apply Svinval in update_mmu_cache()

Zong Li (1):
      riscv: cfi: reduce shadow stack size limit from 2GB to 512MB

 Documentation/arch/riscv/hwprobe.rst               |  20 +++
 .../devicetree/bindings/riscv/extensions.yaml      |  69 ++++++++++
 MAINTAINERS                                        |   8 ++
 arch/riscv/Kconfig                                 |  19 +++
 arch/riscv/Makefile                                |  10 +-
 arch/riscv/boot/.gitignore                         |   1 -
 arch/riscv/boot/Makefile                           |   3 +-
 arch/riscv/include/asm/acpi.h                      |  21 +++
 arch/riscv/include/asm/cmpxchg.h                   |  14 +-
 arch/riscv/include/asm/csr.h                       |  53 +++++++
 arch/riscv/include/asm/csr_indirect.h              |  50 +++++++
 arch/riscv/include/asm/hwcap.h                     |  30 ++--
 arch/riscv/include/asm/hwprobe.h                   |   7 -
 arch/riscv/include/asm/pgtable.h                   |  12 +-
 arch/riscv/include/asm/processor.h                 |   3 +
 arch/riscv/include/asm/qos.h                       |  74 ++++++++++
 arch/riscv/include/asm/switch_to.h                 |   7 +-
 arch/riscv/include/asm/tlbflush.h                  |  23 ++++
 arch/riscv/include/asm/vdso.h                      |   6 +
 arch/riscv/include/asm/vdso/arch_data.h            |   6 -
 arch/riscv/include/uapi/asm/hwprobe.h              | 152 +++++++++++----------
 arch/riscv/kernel/Makefile                         |   2 +
 arch/riscv/kernel/acpi.c                           |   5 +
 arch/riscv/kernel/alternative.c                    |  33 +++--
 arch/riscv/kernel/cpufeature.c                     |  80 +++++++----
 arch/riscv/kernel/efi.c                            |   5 +
 arch/riscv/kernel/probes/decode-insn.c             |   2 +-
 arch/riscv/kernel/probes/simulate-insn.c           |   7 +
 arch/riscv/kernel/probes/simulate-insn.h           |   1 +
 arch/riscv/kernel/qos.c                            | 101 ++++++++++++++
 arch/riscv/kernel/reset.c                          |   9 +-
 arch/riscv/kernel/setup.c                          |   2 +
 arch/riscv/kernel/sys_hwprobe.c                    |  79 +++--------
 arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S |  24 ++++
 arch/riscv/kernel/traps.c                          |   3 +
 arch/riscv/kernel/unaligned_access_speed.c         |  19 +--
 arch/riscv/kernel/usercfi.c                        |   4 +-
 arch/riscv/kernel/vdso/Makefile                    |   7 +-
 arch/riscv/kernel/vdso/hwprobe.c                   |   2 +-
 arch/riscv/kernel/vdso/vdso.lds.S                  |   2 +
 arch/riscv/kernel/vmlinux-xip.lds.S                | 143 -------------------
 arch/riscv/kvm/isa.c                               |  16 +--
 arch/riscv/kvm/main.c                              |   2 +-
 arch/riscv/kvm/vcpu_fp.c                           |  20 +--
 arch/riscv/kvm/vcpu_onereg.c                       |   6 +-
 arch/riscv/kvm/vcpu_vector.c                       |  10 +-
 arch/riscv/mm/init.c                               |   3 +-
 arch/riscv/mm/tlbflush.c                           |  23 ----
 drivers/acpi/tables.c                              |   1 +
 drivers/perf/riscv_pmu_sbi.c                       |  33 ++++-
 50 files changed, 794 insertions(+), 438 deletions(-)
 create mode 100644 arch/riscv/include/asm/csr_indirect.h
 create mode 100644 arch/riscv/include/asm/qos.h
 create mode 100644 arch/riscv/kernel/qos.c
 delete mode 100644 arch/riscv/kernel/vmlinux-xip.lds.S

vmlinux size differences in bytes (from 994dad686e75):
  text   data   bss     dec    hex  filename                             
 +2916  +3652   +24   +6592  +19c0  vmlinux.defconfig.gcc-16             
 +6980  +3660   +24  +10664  +29a8  vmlinux.nosmp_defconfig.gcc-16       
 +1956     +8     .   +1964   +7ac  vmlinux.rv32_defconfig.gcc-16        
 +1784    -16     .   +1768   +6e8  vmlinux.rv32_nosmp_defconfig.gcc-16  
  +652   +432     .   +1084   +43c  vmlinux.nommu_virt_defconfig.gcc-16  
 +4336  +3560     .   +7896  +1ed8  vmlinux.defconfig.clang-20           
 +4408  +3560     .   +7968  +1f20  vmlinux.nosmp_defconfig.clang-20     
 +1704    -40     .   +1664   +680  vmlinux.rv32_defconfig.clang-20      
 +1804  +2328     .   +4132  +1024  vmlinux.rv32_nosmp_defconfig.clang-20
  +676  -3664     .   -2988   -bac  vmlinux.nommu_virt_defconfig.clang-20
 +2936  +3684   +24   +6644  +19f4  vmlinux.defconfig.gcc-15             
 +2804  +3660   +24   +6488  +1958  vmlinux.nosmp_defconfig.gcc-15       
 +1660    +96     .   +1756   +6dc  vmlinux.rv32_defconfig.gcc-15        
 +1268    +80     .   +1348   +544  vmlinux.rv32_nosmp_defconfig.gcc-15  
  +652   +432     .   +1084   +43c  vmlinux.nommu_virt_defconfig.gcc-15  
 +2788  +3620   +24   +6432  +1920  vmlinux.defconfig.gcc-14             
 +2820  +3620   +24   +6464  +1940  vmlinux.nosmp_defconfig.gcc-14       
 +1660     +8     .   +1668   +684  vmlinux.rv32_defconfig.gcc-14        
 +1644     +8     .   +1652   +674  vmlinux.rv32_nosmp_defconfig.gcc-14  
  +652   +496     .   +1148   +47c  vmlinux.nommu_virt_defconfig.gcc-14  
 +4552  +3592   +24   +8168  +1fe8  vmlinux.defconfig.clang-19           
 +4608  +3048   +24   +7680  +1e00  vmlinux.nosmp_defconfig.clang-19     
 +1932   -548     .   +1384   +568  vmlinux.rv32_defconfig.clang-19      
 +1872  +2324     .   +4196  +1064  vmlinux.rv32_nosmp_defconfig.clang-19
  +660  -3664     .   -3004   -bbc  vmlinux.nommu_virt_defconfig.clang-19
 +2932  +3620   +24   +6576  +19b0  vmlinux.defconfig.gcc-13             
 +2968  +3564   +24   +6556  +199c  vmlinux.nosmp_defconfig.gcc-13       
 +1584      .     .   +1584   +630  vmlinux.rv32_defconfig.gcc-13        
 +1644    -16     .   +1628   +65c  vmlinux.rv32_nosmp_defconfig.gcc-13  
  +640   +496     .   +1136   +470  vmlinux.nommu_virt_defconfig.gcc-13  
 +4512  +3592   +24   +8128  +1fc0  vmlinux.defconfig.clang-18           
 +4588  +3560   +24   +8172  +1fec  vmlinux.nosmp_defconfig.clang-18     
 +1664    -68     .   +1596   +63c  vmlinux.rv32_defconfig.clang-18      
 +1896  +2356     .   +4252  +109c  vmlinux.rv32_nosmp_defconfig.clang-18
  +660   +496     .   +1156   +484  vmlinux.nommu_virt_defconfig.clang-18
 +2996  +7588   +24  +10608  +2970  vmlinux.defconfig.gcc-12             
 +3004  +3588   +24   +6616  +19d8  vmlinux.nosmp_defconfig.gcc-12       
 +1144    +32     .   +1176   +498  vmlinux.rv32_defconfig.gcc-12        
 +1572    +40     .   +1612   +64c  vmlinux.rv32_nosmp_defconfig.gcc-12  
  +644  -3664     .   -3020   -bcc  vmlinux.nommu_virt_defconfig.gcc-12  
 +4908  +3592   +24   +8524  +214c  vmlinux.defconfig.clang-17           
 +4960  +3592   +24   +8576  +2180  vmlinux.nosmp_defconfig.clang-17     
 +2172   -516     .   +1656   +678  vmlinux.rv32_defconfig.clang-17      
 +2268    -12     .   +2256   +8d0  vmlinux.rv32_nosmp_defconfig.clang-17
  +668   +432     .   +1100   +44c  vmlinux.nommu_virt_defconfig.clang-17
 +2844  +3524   +24   +6392  +18f8  vmlinux.defconfig.gcc-11             
 +3008  +3556   +24   +6588  +19bc  vmlinux.nosmp_defconfig.gcc-11       
 +1020    +40     .   +1060   +424  vmlinux.rv32_defconfig.gcc-11        
 +1640    +40     .   +1680   +690  vmlinux.rv32_nosmp_defconfig.gcc-11  
  +652  -3664     .   -3012   -bc4  vmlinux.nommu_virt_defconfig.gcc-11  
  +838    +48     .    +886   +376  vmlinux.allnoconfig.gcc-15           
+57248  +4612  -128  +61732  +f124  vmlinux.allmodconfig.gcc-15          
  +346  -4036     .   -3690   -e6a  vmlinux.allnoconfig.clang-19         
+30136  +8116  +120  +38372  +95e4  vmlinux.allmodconfig.clang-19        
--8323329-389810084-1787245495=:74280
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-389810084-1787245495=:74280--

