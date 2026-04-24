Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE36FDEE53
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 00:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=55dlQW25x9nSZUDYxms8V0A5UKaRQKpiX8u2NCjZ0eA=; b=F8D62dSfUhM6folStxTZijQGmg
	txh5MeC4N8Q35N+bdPkwww8YspHW4FBvSX5CnTTEkT+EQsx39+5mEenO6yY5UC/CSn0HH5M9H1kv9
	rbSU+pcVFfG+iMwEcG3ekrBvSlbCShg8N1cgiQx0m2w4cKra9GanfIiahDwcFrXsQIN1AaJVOHxS6
	0tLHEoQr0hmuJiacpB2i1ce15/U2TLvrd/SwZf2b6zqyMA6CbXi7kBrBwXQDIjPNe0YAEOLbS4+bP
	93Nj4kApN2Lzx6svldvJb7Aodw5FY0/4FLORsEO0qz5N8H8carbAYJQqW53AS050K/z4nGBBoEDLa
	Lntjbp0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG453-0000000CQy7-2cA9;
	Fri, 24 Apr 2026 00:07:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG452-0000000CQy0-3guo
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 00:07:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E6DF60018;
	Fri, 24 Apr 2026 00:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A95C2BCAF;
	Fri, 24 Apr 2026 00:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776989255;
	bh=pnEXZgJbMGocOq8U9380SjNDAiL68AVocUubexLxVH4=;
	h=Date:From:To:cc:Subject:From;
	b=Xu5mdK1Loo8Y/poNJzmHMPMxXsFKTiahq2Nxh2QUxoxwhlitzETN72BpEQ9MUD8kK
	 ZlHviZBRZKAUTubI9rghIQ7w3GTzB4rW6KQgBQ1aDYbfXoyO9uVqDb9Tg8g7k8rXw1
	 JnR4zGb3eWISqnRCX73LdQWTmGERQcHSHrK9hyB14HZqlADWX3RolFzOM6TEF4kebI
	 6/FoCIL0LROKVGJ3mrKpmjPqkaGryAtg81aFXTmrcHl/34HUkCu7tmRSg8+8EWVTkq
	 I42wt9EmwcfMkocMYUUyrKt4NKDoJ9oPboZYMxBmyRUHwK4uDPHB6lPj1XSXTTeX3p
	 PoZtXVCsx5HSw==
Date: Thu, 23 Apr 2026 18:07:29 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: torvalds@linux-foundation.org
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V updates for v7.1
Message-ID: <ecdaf68d-1fe5-0b55-ff6a-a2710c05ccef@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1258247018-1776989255=:1398924"
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

--8323329-1258247018-1776989255=:1398924
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

Linus,

Please pull these RISC-V updates for v7.1.  I'm sending this pull
request much later than I or you would like to see it.  I do not plan
for this to be a regular occurrence.  My goal is to send RISC-V PRs
much earlier in the merge window (if not before it opens).

There is one significant change outside arch/riscv in this pull
request: the addition of a set of KUnit tests for strlen(), strnlen(),
and strrchr().

Otherwise, the most notable changes are to add some RISC-V-specific
string function implementations, to remove XIP kernel support, to add
hardware error exception handling, and to optimize our runtime
unaligned access speed testing.

A few comments on the motivation for removing XIP support.  It's been
broken in the RISC-V kernel for months.  The code is not easy to
maintain.  Furthermore, for XIP support to truly be useful for RISC-V,
we think that compile-time feature switches would need to be added for
many of the RISC-V ISA features and microarchitectural properties that
are currently implemented with runtime patching.  No one has stepped
forward to take responsibility for that work, so many of us think it's
best to remove it until clear use cases and champions emerge.


thanks,

- Paul


The following changes since commit 08ee1559052be302f1d3752f48360b89517d9f8d:

  prctl: cfi: change the branch landing pad prctl()s to be more descriptive (2026-04-04 18:40:58 -0600)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.1-mw1

for you to fetch changes up to 9b3a2be84803cf18c4b4d1efc695991f0daa153c:

  riscv: Remove support for XIP kernel (2026-04-04 18:42:44 -0600)

----------------------------------------------------------------
RISC-V updates for v7.1

- Add Kunit correctness testing and microbenchmarks for strlen(),
  strnlen(), and strrchr()

- Add RISC-V-specific strnlen(), strchr(), strrchr() implementations

- Add hardware error exception handling

- Clean up and optimize our unaligned access probe code

- Enable HAVE_IOREMAP_PROT to be able to use generic_access_phys()

- Remove XIP kernel support

- Warn when addresses outside the vmemmap range are passed to
  vmemmap_populate()

- Update the ACPI FADT revision check to warn if it's not at least
  ACPI v6.6, which is when key RISC-V-specific tables were added to the
  specification

- Increase COMMAND_LINE_SIZE to 2048 to match ARM64, x86, PowerPC, etc.

- Make kaslr_offset() a static inline function, since there's no need
  for it to show up in the symbol table

- Add KASLR offset and SATP to the VMCOREINFO ELF notes to improve
  kdump support

- Add Makefile cleanup rule for vdso_cfi copied source files, and add
  a .gitignore for the build artifacts in that directory

- Remove some redundant ifdefs that check Kconfig macros

- Add missing SPDX license tag to the CFI selftest

- Simplify UTS_MACHINE assignment in the RISC-V Makefile

- Clarify some unclear comments and remove some superfluous comments

- Fix various English typos across the RISC-V codebase

----------------------------------------------------------------
Austin Kim (3):
      riscv: move kaslr_offset() to page.h as a static inline function
      riscv: export kaslr offset and satp in VMCOREINFO ELF notes
      riscv: increase COMMAND_LINE_SIZE value to 2048

Charlie Jenkins (1):
      selftests: riscv: Add license to cfi selftest

Chen Pei (2):
      riscv: vdso_cfi: Add clean rule for copied sources
      riscv: vdso_cfi: Add .gitignore for build artifacts

Feng Jiang (8):
      lib/string_kunit: add correctness test for strlen()
      lib/string_kunit: add correctness test for strnlen()
      lib/string_kunit: add correctness test for strrchr()
      lib/string_kunit: add performance benchmark for strlen()
      lib/string_kunit: extend benchmarks to strnlen() and chr searches
      riscv: lib: add strnlen() implementation
      riscv: lib: add strchr() implementation
      riscv: lib: add strrchr() implementation

Hui Wang (2):
      riscv: remove redundant check for CONFIG_SMP
      riscv: remove redundant #ifdef check in cpu-hotplug

Nam Cao (6):
      riscv: Clean up & optimize unaligned scalar access probe
      riscv: Split out measure_cycles() for reuse
      riscv: Reuse measure_cycles() in check_vector_unaligned_access()
      riscv: Split out compare_unaligned_access()
      riscv: Reuse compare_unaligned_access() in check_vector_unaligned_access()
      riscv: Remove support for XIP kernel

Rui Qi (1):
      riscv: add hardware error trap handler support

Sean Chang (1):
      riscv: fix various typos in comments and code

Uwe Kleine-König (1):
      riscv: Simplify assignment for UTS_MACHINE

Vivian Wang (3):
      riscv: smp: Remove outdated comment about disabling preemption
      riscv: smp: Clarify comment "cache" -> "instruction cache"
      riscv: mm: WARN_ON() for bad addresses in vmemmap_populate()

Yufeng Wang (2):
      riscv: acpi: update FADT revision check to 6.6
      riscv: enable HAVE_IOREMAP_PROT

Zishun Yi (1):
      riscv: Fix typo in purgatory end label

 .../features/vm/ioremap_prot/arch-support.txt      |   2 +-
 arch/riscv/Kconfig                                 |  87 ++-----
 arch/riscv/Kconfig.socs                            |   8 +-
 arch/riscv/Makefile                                |   7 +-
 arch/riscv/boot/Makefile                           |  11 -
 arch/riscv/errata/thead/errata.c                   |   2 +-
 arch/riscv/include/asm/asm-prototypes.h            |   1 +
 arch/riscv/include/asm/atomic.h                    |   4 +-
 arch/riscv/include/asm/elf.h                       |   4 +-
 arch/riscv/include/asm/page.h                      |  34 +--
 arch/riscv/include/asm/pgtable.h                   |  20 --
 arch/riscv/include/asm/processor.h                 |   2 +-
 arch/riscv/include/asm/scs.h                       |   1 -
 arch/riscv/include/asm/set_memory.h                |   2 +-
 arch/riscv/include/asm/smp.h                       |   2 +-
 arch/riscv/include/asm/string.h                    |   9 +
 arch/riscv/include/asm/thread_info.h               |   2 +-
 arch/riscv/include/asm/xip_fixup.h                 |  49 ----
 arch/riscv/include/uapi/asm/setup.h                |   2 +-
 arch/riscv/kernel/acpi.c                           |  12 +-
 arch/riscv/kernel/cpu-hotplug.c                    |   2 -
 arch/riscv/kernel/entry.S                          |   1 +
 arch/riscv/kernel/ftrace.c                         |   2 +-
 arch/riscv/kernel/head.S                           |  43 +---
 arch/riscv/kernel/head.h                           |   3 -
 arch/riscv/kernel/mcount-dyn.S                     |   2 +-
 arch/riscv/kernel/module-sections.c                |   2 +-
 arch/riscv/kernel/probes/kprobes.c                 |   2 +-
 arch/riscv/kernel/probes/uprobes.c                 |   2 +-
 arch/riscv/kernel/setup.c                          |   6 +-
 arch/riscv/kernel/smpboot.c                        |   8 +-
 arch/riscv/kernel/soc.c                            |   2 +-
 arch/riscv/kernel/suspend.c                        |   2 +-
 arch/riscv/kernel/suspend_entry.S                  |   2 -
 arch/riscv/kernel/traps.c                          |   6 +-
 arch/riscv/kernel/unaligned_access_speed.c         | 221 +++++++----------
 arch/riscv/kernel/vdso_cfi/.gitignore              |   8 +
 arch/riscv/kernel/vdso_cfi/Makefile                |   3 +
 arch/riscv/kernel/vmcore_info.c                    |  14 +-
 arch/riscv/kernel/vmlinux.lds.S                    |   5 -
 arch/riscv/kvm/tlb.c                               |   2 +-
 arch/riscv/kvm/vcpu_pmu.c                          |   2 +-
 arch/riscv/lib/Makefile                            |   3 +
 arch/riscv/lib/csum.c                              |   2 +-
 arch/riscv/lib/memmove.S                           |   4 +-
 arch/riscv/lib/strchr.S                            |  35 +++
 arch/riscv/lib/strnlen.S                           | 164 ++++++++++++
 arch/riscv/lib/strrchr.S                           |  37 +++
 arch/riscv/mm/cacheflush.c                         |   2 +-
 arch/riscv/mm/init.c                               | 118 +--------
 arch/riscv/mm/physaddr.c                           |   4 +-
 arch/riscv/purgatory/Makefile                      |  11 +-
 arch/riscv/purgatory/kexec-purgatory.S             |   4 +-
 lib/Kconfig.debug                                  |  11 +
 lib/tests/string_kunit.c                           | 274 +++++++++++++++++++++
 tools/testing/selftests/riscv/cfi/Makefile         |   2 +
 56 files changed, 734 insertions(+), 538 deletions(-)
 delete mode 100644 arch/riscv/include/asm/xip_fixup.h
 create mode 100644 arch/riscv/kernel/vdso_cfi/.gitignore
 create mode 100644 arch/riscv/lib/strchr.S
 create mode 100644 arch/riscv/lib/strnlen.S
 create mode 100644 arch/riscv/lib/strrchr.S

vmlinux size differences in bytes (from 08ee1559052b):
 text    data    bss     dec    hex  filename                             
+1492   +9772  +1024  +12288  +3000  vmlinux.defconfig.gcc-15             
+1380   +9676  +1024  +12080  +2f30  vmlinux.nosmp_defconfig.gcc-15       
 -236   +9152  +1024   +9940  +26d4  vmlinux.rv32_defconfig.gcc-15        
  -88   +9152  +1024  +10088  +2768  vmlinux.rv32_nosmp_defconfig.gcc-15  
 +871    -928      .     -57    -39  vmlinux.nommu_virt_defconfig.gcc-15  
+1164   +9412  +1024  +11600  +2d50  vmlinux.defconfig.clang-20           
+1408   +9436  +1024  +11868  +2e5c  vmlinux.nosmp_defconfig.clang-20     
 +208   +9184  +1024  +10416  +28b0  vmlinux.rv32_defconfig.clang-20      
 +288   +9184  +1024  +10496  +2900  vmlinux.rv32_nosmp_defconfig.clang-20
 +625   -1376      .    -751   -2ef  vmlinux.nommu_virt_defconfig.clang-20
+1480   +9420  +1024  +11924  +2e94  vmlinux.defconfig.gcc-14             
+1340   +9420  +1024  +11784  +2e08  vmlinux.nosmp_defconfig.gcc-14       
 +120   +9184  +1024  +10328  +2858  vmlinux.rv32_defconfig.gcc-14        
  -20   +9152  +1024  +10156  +27ac  vmlinux.rv32_nosmp_defconfig.gcc-14  
 +867   +2912      .   +3779   +ec3  vmlinux.nommu_virt_defconfig.gcc-14  
+1400   +9700  +1024  +12124  +2f5c  vmlinux.defconfig.clang-19           
+1888   +9668  +1024  +12580  +3124  vmlinux.nosmp_defconfig.clang-19     
 +196   +9184  +1024  +10404  +28a4  vmlinux.rv32_defconfig.clang-19      
 +304   +9152  +1024  +10480  +28f0  vmlinux.rv32_nosmp_defconfig.clang-19
 +869   +2656      .   +3525   +dc5  vmlinux.nommu_virt_defconfig.clang-19
+1500   +9708  +1024  +12232  +2fc8  vmlinux.defconfig.gcc-13             
+1464   +9676  +1024  +12164  +2f84  vmlinux.nosmp_defconfig.gcc-13       
 +128   +9152  +1024  +10304  +2840  vmlinux.rv32_defconfig.gcc-13        
    .   +9248  +1024  +10272  +2820  vmlinux.rv32_nosmp_defconfig.gcc-13  
 +887  +15392      .  +16279  +3f97  vmlinux.nommu_virt_defconfig.gcc-13  
+1300   +9444  +1024  +11768  +2df8  vmlinux.defconfig.clang-18           
+1772   +9372  +1024  +12168  +2f88  vmlinux.nosmp_defconfig.clang-18     
 +172   +9184  +1024  +10380  +288c  vmlinux.rv32_defconfig.clang-18      
 +264   +9152  +1024  +10440  +28c8  vmlinux.rv32_nosmp_defconfig.clang-18
 +793   +2656      .   +3449   +d79  vmlinux.nommu_virt_defconfig.clang-18
+1428   +9676  +1024  +12128  +2f60  vmlinux.defconfig.gcc-12             
+1324   +9676  +1024  +12024  +2ef8  vmlinux.nosmp_defconfig.gcc-12       
 +136   +9152  +1024  +10312  +2848  vmlinux.rv32_defconfig.gcc-12        
  -20   +9152  +1024  +10156  +27ac  vmlinux.rv32_nosmp_defconfig.gcc-12  
 +883   +2912      .   +3795   +ed3  vmlinux.nommu_virt_defconfig.gcc-12  
+1696   +9148  +1024  +11868  +2e5c  vmlinux.defconfig.clang-17           
+2176   +9116  +1024  +12316  +301c  vmlinux.nosmp_defconfig.clang-17     
 +532   +9152  +1024  +10708  +29d4  vmlinux.rv32_defconfig.clang-17      
 +636   +9184  +1024  +10844  +2a5c  vmlinux.rv32_nosmp_defconfig.clang-17
+1133   -1952      .    -819   -333  vmlinux.nommu_virt_defconfig.clang-17
+1576   +9708  +1024  +12308  +3014  vmlinux.defconfig.gcc-11             
+1484   +9676  +1024  +12184  +2f98  vmlinux.nosmp_defconfig.gcc-11       
 +140   +9152  +1024  +10316  +284c  vmlinux.rv32_defconfig.gcc-11        
   +8   +9152  +1024  +10184  +27c8  vmlinux.rv32_nosmp_defconfig.gcc-11  
 +879   -1184      .    -305   -131  vmlinux.nommu_virt_defconfig.gcc-11  
+1356    +352      .   +1708   +6ac  vmlinux.allnoconfig.gcc-14           
+4026  +11584  +1024  +16634  +40fa  vmlinux.allmodconfig.gcc-14          
+1588  +16480      .  +18068  +4694  vmlinux.allnoconfig.clang-19         
+4644  +10560  +1216  +16420  +4024  vmlinux.allmodconfig.clang-19        
--8323329-1258247018-1776989255=:1398924
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1258247018-1776989255=:1398924--

