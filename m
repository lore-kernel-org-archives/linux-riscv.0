Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1CDD41D74
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Dec 2025 02:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Sts4wBCMh+lgeYj6FIpAs+YDAL+28Cf8ErA7swAkb+I=; b=GkmC9gjkBqJ4++
	AdvPD01Jz3dvjYU/N8ICi904ji2tk0sv/+7tRw+t0DeVnYyZPyJYxvFld+T+wI9PdLB93mLlxxcQD
	vcFs/qNVn1Bk7G/asXtgUt33FNBupFPNOmp2mVX3Sj0oEjeiIm/rFTDg77CNhrn5TTYGQIAD/rwVt
	8X0BgdQCYdxD9wn72Ro5bmMgQaO9VqQvZjGW59S8r/STf+Gp+268WvOL5VoNnA4zDVsGmqBOr+JDM
	qjXVHks9D0eiRBNwWgDw4GjMnhIoJzIYjLjy/vfE+HmeaArctimKHuL2und84jY5yNzXz6SZy/1wv
	+JFWJjLI/RcBDLBtplzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTt1H-0000000HYoM-0pFY;
	Fri, 12 Dec 2025 02:36:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTt1D-0000000HYnr-3h6w
	for linux-riscv@lists.infradead.org;
	Fri, 12 Dec 2025 02:36:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C5EE044144;
	Fri, 12 Dec 2025 02:36:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83FAEC4CEF7;
	Fri, 12 Dec 2025 02:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765506990;
	bh=ZvkNtuerhP6qMlGlqkuS0mZ5OOHFaSJP/vA7u6MQ0eA=;
	h=Date:From:To:cc:Subject:From;
	b=idUlSmF0vzprev0S5XvIMplz+cDxhpkkIBHE5F2A7x/rcoEimewX2XDL4JvAA+wvq
	 HOth5BsXRyiiBxyWQ69/0N8/zhr4sJVQRuk4T3mokFvnfnvKHf4vDMAMorwARPLx/i
	 zLwEaY6Wj3tdrdsAhvf/9hVqjky2HpxOeS/ag2v8vKTCdZS6YCYE4aTZO5WYQTOPOX
	 I8FM9sapaamz1ENkSzlmIP58SxUcOQ4R+GeHv+wuA2cNKTZpbbhp/saEPvf+KYb3bW
	 s4Hj6KVwbN7HKFWLCKy1MDO0uJnD9aLIARpiWg4ns08f+tIvXUH0P4XnVgE8SXfCih
	 urBGnzeMmil3w==
Date: Thu, 11 Dec 2025 19:36:25 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: torvalds@linux-foundation.org
cc: sfr@canb.auug.org.au, akpm@linux-foundation.org, 
    linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V updates for the v6.19 merge window (part two)
Message-ID: <98b74397-05bc-dbee-cab4-3f40d643eaac@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_183631_995718_81593EF5 
X-CRM114-Status: GOOD (  26.29  )
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

Linus,

Please pull this second and final set of RISC-V patches for the v6.19 
merge window.  The primary addition in this pull request is support for 
CFI in user processes.  This series has been around for almost two years.  
It's been tested by a set of RISC-V community participants, including by 
CPU IP/hardware vendors and by a major Linux distribution.  Some testing 
has been done in hardware emulation, and some in QEMU.  Ideally it would 
be nice to have more detailed test reports, but I think we'll get better 
coverage once it enters mainline.  The code itself has been in linux-next 
for two weeks, however, I did just repush the commits to add a few late 
Tested-by:s, to remove a bogus Signed-off-by: tag, and to add one late 
Kconfig fix to prevent enabling CFI on no-MMU systems so we don't break 
bisectability.  If it's too much, we can wait for the next merge window.

Beyond the CFI patchset, this pull request also adds basic probing
support for several RISC-V extensions, and includes some minor cleanup
patches.

There are some merge conflicts with Andrew's mm patches.  The
suggested resolution (at the bottom of this E-mail) looks worse than
it is.  There are two notable areas of conflict:

1. The one that initially appears the worst is that, to add CFI
support, arch/riscv needed to define the VM_SHADOW_STACK macro in
include/linux/mm.h to use the VM_HIGH_ARCH_5 bit (like x86).  But
commit 9ea35a25d51b ("mm: introduce VMA flags bitmap type") refactors
all of this code, resulting in a nasty-looking conflict.  But the
underlying manual resolution is straightforward:

   a. add "|| defined(CONFIG_RISCV_USER_CFI)" to the #ifdef on line
      362, to share the SHADOW_STACK VMA bit alias between x86 and
      RISC-V

   b. add "|| defined(CONFIG_RISCV_USER_CFI)" to the #ifdef on line
      463, to define the VM_SHADOW_STACK macro for RISC-V CFI (as with
      x86 shadow stacks and ARM GCS)

2. -mm took a patch that adds a new RISC-V extension, and
unsurprisingly we touch the same file to add support for several other
RISC-V ISA extensions.  As a result, the numbered list of RISC-V
extensions in arch/riscv needs to be updated to avoid using duplicate
IDs.  The exact numbers for the new extensions aren't important.

...

The following changes since commit a131fd60796dbfaa6297c0c8ca8e2a7610a64281:

  selftests/riscv: Add Zicbop prefetch test (2025-11-19 09:19:29 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.19-mw2

for you to fetch changes up to 7e40c6791cc81e98a191d976a6f6366c77c33292:

  kselftest/riscv: add kselftest for user mode cfi (2025-12-11 18:18:04 -0700)


- Paul

----------------------------------------------------------------
Second set of RISC-V updates for v6.19-rc1

- Add support for control flow integrity for userspace processes.
  This is based on the standard RISC-V ISA extensions Zicfiss and
  Zicfilp

- Add probing and userspace reporting support for the standard RISC-V
  ISA extensions Zilsd and Zclsd, which implement load/store dual
  instructions on RV32

- Abstract the register saving code in setup_sigcontext() so it can be
  used for stateful RISC-V ISA extensions beyond the vector extension

- Add the SBI extension ID and some initial data structure definitions
  for the RISC-V standard SBI debug trigger extension

- Clean up some code slightly: change some page table functions to
  avoid atomic operations oinn !SMP and to avoid unnecessary casts to
  atomic_long_t; and use the existing RISCV_FULL_BARRIER macro in
  place of some open-coded "fence rw,rw" instructions

----------------------------------------------------------------
Andy Chiu (1):
      riscv: signal: abstract header saving for setup_sigcontext

Deepak Gupta (26):
      mm: add VM_SHADOW_STACK definition for riscv
      dt-bindings: riscv: zicfilp and zicfiss in dt-bindings (extensions.yaml)
      riscv: zicfiss / zicfilp enumeration
      riscv: zicfiss / zicfilp extension csr and bit definitions
      riscv: Add usercfi state for task and save/restore of CSR_SSP on trap entry/exit
      riscv/mm: ensure PROT_WRITE leads to VM_READ | VM_WRITE
      riscv/mm: manufacture shadow stack ptes
      riscv/mm: teach pte_mkwrite to manufacture shadow stack PTEs
      riscv/mm: update write protect to work on shadow stacks
      riscv/mm: Implement map_shadow_stack() syscall
      riscv/shstk: If needed allocate a new shadow stack on clone
      riscv: Implement arch agnostic shadow stack prctls
      prctl: add arch-agnostic prctl()s for indirect branch tracking
      riscv: Implement indirect branch tracking prctls
      riscv/traps: Introduce software check exception and uprobe handling
      riscv/signal: save and restore of shadow stack on signal
      riscv/kernel: update __show_regs() to print shadow stack register
      riscv/ptrace: expose riscv cfi status and state via ptrace and in core files
      riscv/hwprobe: add zicfilp / zicfiss enumeration in hwprobe
      riscv: add kernel command line option to opt out of user cfi
      riscv: enable kernel access to shadow stack memory via FWFT sbi call
      arch/riscv: dual vdso creation logic and select vdso based on hw
      riscv: create a Kconfig fragment for shadow stack and landing pad support
      riscv: add documentation for landing pad / indirect branch tracking
      riscv: add documentation for shadow stack
      kselftest/riscv: add kselftest for user mode cfi

Himanshu Chauhan (1):
      riscv: Add SBI debug trigger extension and function ids

Jim Shu (1):
      arch/riscv: compile vdso with landing pad and shadow stack note

Paul Walmsley (4):
      riscv: mm: pmdp_huge_get_and_clear(): avoid atomic ops when !CONFIG_SMP
      riscv: mm: ptep_get_and_clear(): avoid atomic ops when !CONFIG_SMP
      riscv: mm: use xchg() on non-atomic_long_t variables, not atomic_long_xchg()
      riscv: hwprobe: add support for RISCV_HWPROBE_KEY_IMA_EXT_1

Pincheng Wang (3):
      dt-bindings: riscv: add Zilsd and Zclsd extension descriptions
      riscv: add ISA extension parsing for Zilsd and Zclsd
      riscv: hwprobe: export Zilsd and Zclsd ISA extensions

Zongmin Zhou (1):
      riscv/atomic.h: use RISCV_FULL_BARRIER in _arch_atomic* function.

 Documentation/admin-guide/kernel-parameters.txt    |   8 +
 Documentation/arch/riscv/hwprobe.rst               |  12 +
 Documentation/arch/riscv/index.rst                 |   2 +
 Documentation/arch/riscv/zicfilp.rst               | 122 +++++
 Documentation/arch/riscv/zicfiss.rst               | 194 ++++++++
 .../devicetree/bindings/riscv/extensions.yaml      |  50 ++
 arch/riscv/Kconfig                                 |  22 +
 arch/riscv/Makefile                                |   8 +-
 arch/riscv/configs/hardening.config                |   4 +
 arch/riscv/include/asm/asm-prototypes.h            |   1 +
 arch/riscv/include/asm/assembler.h                 |  44 ++
 arch/riscv/include/asm/atomic.h                    |   8 +-
 arch/riscv/include/asm/cpufeature.h                |  12 +
 arch/riscv/include/asm/csr.h                       |  14 +
 arch/riscv/include/asm/entry-common.h              |   2 +
 arch/riscv/include/asm/hwcap.h                     |   4 +
 arch/riscv/include/asm/hwprobe.h                   |   3 +-
 arch/riscv/include/asm/mman.h                      |  26 +
 arch/riscv/include/asm/mmu_context.h               |   7 +
 arch/riscv/include/asm/pgtable.h                   |  46 +-
 arch/riscv/include/asm/processor.h                 |   1 +
 arch/riscv/include/asm/sbi.h                       |  29 ++
 arch/riscv/include/asm/thread_info.h               |   3 +
 arch/riscv/include/asm/usercfi.h                   |  97 ++++
 arch/riscv/include/asm/vdso.h                      |  13 +-
 arch/riscv/include/asm/vector.h                    |   3 +
 arch/riscv/include/uapi/asm/hwprobe.h              |   7 +
 arch/riscv/include/uapi/asm/ptrace.h               |  34 ++
 arch/riscv/include/uapi/asm/sigcontext.h           |   1 +
 arch/riscv/kernel/Makefile                         |   2 +
 arch/riscv/kernel/asm-offsets.c                    |  10 +
 arch/riscv/kernel/cpufeature.c                     |  49 ++
 arch/riscv/kernel/entry.S                          |  38 ++
 arch/riscv/kernel/head.S                           |  27 +
 arch/riscv/kernel/process.c                        |  27 +-
 arch/riscv/kernel/ptrace.c                         |  95 ++++
 arch/riscv/kernel/signal.c                         | 148 +++++-
 arch/riscv/kernel/sys_hwprobe.c                    | 168 ++++---
 arch/riscv/kernel/sys_riscv.c                      |  10 +
 arch/riscv/kernel/traps.c                          |  54 ++
 arch/riscv/kernel/usercfi.c                        | 544 +++++++++++++++++++++
 arch/riscv/kernel/vdso.c                           |   7 +
 arch/riscv/kernel/vdso/Makefile                    |  40 +-
 arch/riscv/kernel/vdso/flush_icache.S              |   4 +
 arch/riscv/kernel/vdso/gen_vdso_offsets.sh         |   4 +-
 arch/riscv/kernel/vdso/getcpu.S                    |   4 +
 arch/riscv/kernel/vdso/note.S                      |   3 +
 arch/riscv/kernel/vdso/rt_sigreturn.S              |   4 +
 arch/riscv/kernel/vdso/sys_hwprobe.S               |   4 +
 arch/riscv/kernel/vdso/vgetrandom-chacha.S         |   5 +-
 arch/riscv/kernel/vdso_cfi/Makefile                |  25 +
 arch/riscv/kernel/vdso_cfi/vdso-cfi.S              |  11 +
 arch/riscv/mm/init.c                               |   2 +-
 arch/riscv/mm/pgtable.c                            |  16 +
 include/linux/cpu.h                                |   4 +
 include/linux/mm.h                                 |   7 +
 include/uapi/linux/elf.h                           |   2 +
 include/uapi/linux/prctl.h                         |  27 +
 kernel/sys.c                                       |  30 ++
 tools/testing/selftests/riscv/Makefile             |   2 +-
 tools/testing/selftests/riscv/cfi/.gitignore       |   2 +
 tools/testing/selftests/riscv/cfi/Makefile         |  23 +
 tools/testing/selftests/riscv/cfi/cfi_rv_test.h    |  82 ++++
 tools/testing/selftests/riscv/cfi/cfitests.c       | 173 +++++++
 tools/testing/selftests/riscv/cfi/shadowstack.c    | 385 +++++++++++++++
 tools/testing/selftests/riscv/cfi/shadowstack.h    |  27 +
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |  18 +-
 67 files changed, 2740 insertions(+), 120 deletions(-)
 create mode 100644 Documentation/arch/riscv/zicfilp.rst
 create mode 100644 Documentation/arch/riscv/zicfiss.rst
 create mode 100644 arch/riscv/configs/hardening.config
 create mode 100644 arch/riscv/include/asm/mman.h
 create mode 100644 arch/riscv/include/asm/usercfi.h
 create mode 100644 arch/riscv/kernel/usercfi.c
 create mode 100644 arch/riscv/kernel/vdso_cfi/Makefile
 create mode 100644 arch/riscv/kernel/vdso_cfi/vdso-cfi.S
 create mode 100644 tools/testing/selftests/riscv/cfi/.gitignore
 create mode 100644 tools/testing/selftests/riscv/cfi/Makefile
 create mode 100644 tools/testing/selftests/riscv/cfi/cfi_rv_test.h
 create mode 100644 tools/testing/selftests/riscv/cfi/cfitests.c
 create mode 100644 tools/testing/selftests/riscv/cfi/shadowstack.c
 create mode 100644 tools/testing/selftests/riscv/cfi/shadowstack.h

vmlinux size differences in bytes (from a131fd60796d):
  text   data bss    dec   hex filename                             
 +6562 +10236  +8 +16806 +41a6 vmlinux.defconfig.gcc-15             
 +4696  +9780  +8 +14484 +3894 vmlinux.nosmp_defconfig.gcc-15       
 +2144   +780   .  +2924  +b6c vmlinux.rv32_defconfig.gcc-15        
  +356   +428   .   +784  +310 vmlinux.rv32_nosmp_defconfig.gcc-15  
 +2602  -3752   .  -1150  -47e vmlinux.nommu_virt_defconfig.gcc-15  
 +1140  +1064   .  +2204  +89c vmlinux.defconfig.clang-20           
  +160  +1184   .  +1344  +540 vmlinux.nosmp_defconfig.clang-20     
  +852   +792   .  +1644  +66c vmlinux.rv32_defconfig.clang-20      
  -268   +544   .   +276  +114 vmlinux.rv32_nosmp_defconfig.clang-20
 +2640   +568   .  +3208  +c88 vmlinux.nommu_virt_defconfig.clang-20
 +1832   -536   .  +1296  +510 vmlinux.defconfig.gcc-14             
  +168   +592   .   +760  +2f8 vmlinux.nosmp_defconfig.gcc-14       
 +1996   +780   .  +2776  +ad8 vmlinux.rv32_defconfig.gcc-14        
  +608   +524   .  +1132  +46c vmlinux.rv32_nosmp_defconfig.gcc-14  
 +2582   +600   .  +3182  +c6e vmlinux.nommu_virt_defconfig.gcc-14  
 +1160  +1064   .  +2224  +8b0 vmlinux.defconfig.clang-19           
   +12   +640   .   +652  +28c vmlinux.nosmp_defconfig.clang-19     
  +700   +776   .  +1476  +5c4 vmlinux.rv32_defconfig.clang-19      
  -572   +528   .    -44   -2c vmlinux.rv32_nosmp_defconfig.clang-19
 +2608   +568   .  +3176  +c68 vmlinux.nommu_virt_defconfig.clang-19
 +1572   +824   .  +2396  +95c vmlinux.defconfig.gcc-13             
  +108   +640   .   +748  +2ec vmlinux.nosmp_defconfig.gcc-13       
 +1948   +812   .  +2760  +ac8 vmlinux.rv32_defconfig.gcc-13        
  +320   +556   .   +876  +36c vmlinux.rv32_nosmp_defconfig.gcc-13  
 +2594  -3560   .   -966  -3c6 vmlinux.nommu_virt_defconfig.gcc-13  
  +940  +1096   .  +2036  +7f4 vmlinux.defconfig.clang-18           
   -20   +640   .   +620  +26c vmlinux.nosmp_defconfig.clang-18     
  +680   +752   .  +1432  +598 vmlinux.rv32_defconfig.clang-18      
  -524   +592   .    +68   +44 vmlinux.rv32_nosmp_defconfig.clang-18
 +2460   +632   .  +3092  +c14 vmlinux.nommu_virt_defconfig.clang-18
 +1652   +856   .  +2508  +9cc vmlinux.defconfig.gcc-12             
  +108   +640   .   +748  +2ec vmlinux.nosmp_defconfig.gcc-12       
 +1812   +780   .  +2592  +a20 vmlinux.rv32_defconfig.gcc-12        
  +320   +556   .   +876  +36c vmlinux.rv32_nosmp_defconfig.gcc-12  
 +2562   +600   .  +3162  +c5a vmlinux.nommu_virt_defconfig.gcc-12  
 +1244  +1096   .  +2340  +924 vmlinux.defconfig.clang-17           
  +232   +672   .   +904  +388 vmlinux.nosmp_defconfig.clang-17     
  +924   +776   .  +1700  +6a4 vmlinux.rv32_defconfig.clang-17      
  -232   +528   .   +296  +128 vmlinux.rv32_nosmp_defconfig.clang-17
 +2596   +568   .  +3164  +c5c vmlinux.nommu_virt_defconfig.clang-17
 +1564   +856   .  +2420  +974 vmlinux.defconfig.gcc-11             
  -428   +640   .   +212   +d4 vmlinux.nosmp_defconfig.gcc-11       
 +1748   +748   .  +2496  +9c0 vmlinux.rv32_defconfig.gcc-11        
  -144   +556   .   +412  +19c vmlinux.rv32_nosmp_defconfig.gcc-11  
 +2578   +536   .  +3114  +c2a vmlinux.nommu_virt_defconfig.gcc-11  
  +916   +576   .  +1492  +5d4 vmlinux.allnoconfig.gcc-14           
+10472  +2200   . +12672 +3180 vmlinux.allmodconfig.gcc-14          
  +916  -3424   .  -2508  -9cc vmlinux.allnoconfig.clang-19         
     x      x   x      x     x vmlinux.allmodconfig.clang-19

Suggested merge conflict resolution:

diff --cc arch/riscv/include/asm/hwcap.h
index dfe57b215e6c9,ce2ed4460c372..7ef8e5f55c8dc
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@@ -106,8 -106,11 +106,12 @@@
  #define RISCV_ISA_EXT_ZAAMO		97
  #define RISCV_ISA_EXT_ZALRSC		98
  #define RISCV_ISA_EXT_ZICBOP		99
 -#define RISCV_ISA_EXT_ZALASR		100
 -#define RISCV_ISA_EXT_ZILSD		101
 -#define RISCV_ISA_EXT_ZCLSD		102
 -#define RISCV_ISA_EXT_ZICFILP		103
 -#define RISCV_ISA_EXT_ZICFISS		104
 +#define RISCV_ISA_EXT_SVRSW60T59B	100
 +#define RISCV_ISA_EXT_ZALASR		101
++#define RISCV_ISA_EXT_ZILSD		102
++#define RISCV_ISA_EXT_ZCLSD		103
++#define RISCV_ISA_EXT_ZICFILP		104
++#define RISCV_ISA_EXT_ZICFISS		105
  
  #define RISCV_ISA_EXT_XLINUXENVCFG	127
  
diff --cc arch/riscv/include/asm/pgtable.h
index 8bd36ac842eba,29c1d1d30658b..4b8ed4f62bb74
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@@ -414,46 -415,15 +415,50 @@@ static inline int pte_special(pte_t pte
  
  static inline pte_t pte_wrprotect(pte_t pte)
  {
- 	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
+ 	return __pte((pte_val(pte) & ~(_PAGE_WRITE)) | (_PAGE_READ));
  }
  
 +#ifdef CONFIG_HAVE_ARCH_USERFAULTFD_WP
 +#define pgtable_supports_uffd_wp()	\
 +	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVRSW60T59B)
 +
 +static inline bool pte_uffd_wp(pte_t pte)
 +{
 +	return !!(pte_val(pte) & _PAGE_UFFD_WP);
 +}
 +
 +static inline pte_t pte_mkuffd_wp(pte_t pte)
 +{
 +	return pte_wrprotect(__pte(pte_val(pte) | _PAGE_UFFD_WP));
 +}
 +
 +static inline pte_t pte_clear_uffd_wp(pte_t pte)
 +{
 +	return __pte(pte_val(pte) & ~(_PAGE_UFFD_WP));
 +}
 +
 +static inline bool pte_swp_uffd_wp(pte_t pte)
 +{
 +	return !!(pte_val(pte) & _PAGE_SWP_UFFD_WP);
 +}
 +
 +static inline pte_t pte_swp_mkuffd_wp(pte_t pte)
 +{
 +	return __pte(pte_val(pte) | _PAGE_SWP_UFFD_WP);
 +}
 +
 +static inline pte_t pte_swp_clear_uffd_wp(pte_t pte)
 +{
 +	return __pte(pte_val(pte) & ~(_PAGE_SWP_UFFD_WP));
 +}
 +#endif /* CONFIG_HAVE_ARCH_USERFAULTFD_WP */
 +
  /* static inline pte_t pte_mkread(pte_t pte) */
  
+ struct vm_area_struct;
+ pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma);
+ #define pte_mkwrite pte_mkwrite
+ 
  static inline pte_t pte_mkwrite_novma(pte_t pte)
  {
  	return __pte(pte_val(pte) | _PAGE_WRITE);
diff --cc include/linux/mm.h
index 7a1819c20643b,2032d3f195f1f..479ef42cdd2c4
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@@ -275,235 -273,185 +275,236 @@@ extern unsigned int kobjsize(const voi
   * vm_flags in vm_area_struct, see mm_types.h.
   * When changing, update also include/trace/events/mmflags.h
   */
 -#define VM_NONE		0x00000000
  
 -#define VM_READ		0x00000001	/* currently active flags */
 -#define VM_WRITE	0x00000002
 -#define VM_EXEC		0x00000004
 -#define VM_SHARED	0x00000008
 +#define VM_NONE		0x00000000
  
 -/* mprotect() hardcodes VM_MAYREAD >> 4 == VM_READ, and so for r/w/x bits. */
 -#define VM_MAYREAD	0x00000010	/* limits for mprotect() etc */
 -#define VM_MAYWRITE	0x00000020
 -#define VM_MAYEXEC	0x00000040
 -#define VM_MAYSHARE	0x00000080
 +/**
 + * typedef vma_flag_t - specifies an individual VMA flag by bit number.
 + *
 + * This value is made type safe by sparse to avoid passing invalid flag values
 + * around.
 + */
 +typedef int __bitwise vma_flag_t;
  
 -#define VM_GROWSDOWN	0x00000100	/* general info on the segment */
 +#define DECLARE_VMA_BIT(name, bitnum) \
 +	VMA_ ## name ## _BIT = ((__force vma_flag_t)bitnum)
 +#define DECLARE_VMA_BIT_ALIAS(name, aliased) \
 +	VMA_ ## name ## _BIT = (VMA_ ## aliased ## _BIT)
 +enum {
 +	DECLARE_VMA_BIT(READ, 0),
 +	DECLARE_VMA_BIT(WRITE, 1),
 +	DECLARE_VMA_BIT(EXEC, 2),
 +	DECLARE_VMA_BIT(SHARED, 3),
 +	/* mprotect() hardcodes VM_MAYREAD >> 4 == VM_READ, and so for r/w/x bits. */
 +	DECLARE_VMA_BIT(MAYREAD, 4),	/* limits for mprotect() etc. */
 +	DECLARE_VMA_BIT(MAYWRITE, 5),
 +	DECLARE_VMA_BIT(MAYEXEC, 6),
 +	DECLARE_VMA_BIT(MAYSHARE, 7),
 +	DECLARE_VMA_BIT(GROWSDOWN, 8),	/* general info on the segment */
  #ifdef CONFIG_MMU
 -#define VM_UFFD_MISSING	0x00000200	/* missing pages tracking */
 -#else /* CONFIG_MMU */
 -#define VM_MAYOVERLAY	0x00000200	/* nommu: R/O MAP_PRIVATE mapping that might overlay a file mapping */
 -#define VM_UFFD_MISSING	0
 +	DECLARE_VMA_BIT(UFFD_MISSING, 9),/* missing pages tracking */
 +#else
 +	/* nommu: R/O MAP_PRIVATE mapping that might overlay a file mapping */
 +	DECLARE_VMA_BIT(MAYOVERLAY, 9),
  #endif /* CONFIG_MMU */
 -#define VM_PFNMAP	0x00000400	/* Page-ranges managed without "struct page", just pure PFN */
 -#define VM_UFFD_WP	0x00001000	/* wrprotect pages tracking */
 -
 -#define VM_LOCKED	0x00002000
 -#define VM_IO           0x00004000	/* Memory mapped I/O or similar */
 -
 -					/* Used by sys_madvise() */
 -#define VM_SEQ_READ	0x00008000	/* App will access data sequentially */
 -#define VM_RAND_READ	0x00010000	/* App will not benefit from clustered reads */
 -
 -#define VM_DONTCOPY	0x00020000      /* Do not copy this vma on fork */
 -#define VM_DONTEXPAND	0x00040000	/* Cannot expand with mremap() */
 -#define VM_LOCKONFAULT	0x00080000	/* Lock the pages covered when they are faulted in */
 -#define VM_ACCOUNT	0x00100000	/* Is a VM accounted object */
 -#define VM_NORESERVE	0x00200000	/* should the VM suppress accounting */
 -#define VM_HUGETLB	0x00400000	/* Huge TLB Page VM */
 -#define VM_SYNC		0x00800000	/* Synchronous page faults */
 -#define VM_ARCH_1	0x01000000	/* Architecture-specific flag */
 -#define VM_WIPEONFORK	0x02000000	/* Wipe VMA contents in child. */
 -#define VM_DONTDUMP	0x04000000	/* Do not include in the core dump */
 -
 +	/* Page-ranges managed without "struct page", just pure PFN */
 +	DECLARE_VMA_BIT(PFNMAP, 10),
 +	DECLARE_VMA_BIT(MAYBE_GUARD, 11),
 +	DECLARE_VMA_BIT(UFFD_WP, 12),	/* wrprotect pages tracking */
 +	DECLARE_VMA_BIT(LOCKED, 13),
 +	DECLARE_VMA_BIT(IO, 14),	/* Memory mapped I/O or similar */
 +	DECLARE_VMA_BIT(SEQ_READ, 15),	/* App will access data sequentially */
 +	DECLARE_VMA_BIT(RAND_READ, 16),	/* App will not benefit from clustered reads */
 +	DECLARE_VMA_BIT(DONTCOPY, 17),	/* Do not copy this vma on fork */
 +	DECLARE_VMA_BIT(DONTEXPAND, 18),/* Cannot expand with mremap() */
 +	DECLARE_VMA_BIT(LOCKONFAULT, 19),/* Lock pages covered when faulted in */
 +	DECLARE_VMA_BIT(ACCOUNT, 20),	/* Is a VM accounted object */
 +	DECLARE_VMA_BIT(NORESERVE, 21),	/* should the VM suppress accounting */
 +	DECLARE_VMA_BIT(HUGETLB, 22),	/* Huge TLB Page VM */
 +	DECLARE_VMA_BIT(SYNC, 23),	/* Synchronous page faults */
 +	DECLARE_VMA_BIT(ARCH_1, 24),	/* Architecture-specific flag */
 +	DECLARE_VMA_BIT(WIPEONFORK, 25),/* Wipe VMA contents in child. */
 +	DECLARE_VMA_BIT(DONTDUMP, 26),	/* Do not include in the core dump */
 +	DECLARE_VMA_BIT(SOFTDIRTY, 27),	/* NOT soft dirty clean area */
 +	DECLARE_VMA_BIT(MIXEDMAP, 28),	/* Can contain struct page and pure PFN pages */
 +	DECLARE_VMA_BIT(HUGEPAGE, 29),	/* MADV_HUGEPAGE marked this vma */
 +	DECLARE_VMA_BIT(NOHUGEPAGE, 30),/* MADV_NOHUGEPAGE marked this vma */
 +	DECLARE_VMA_BIT(MERGEABLE, 31),	/* KSM may merge identical pages */
 +	/* These bits are reused, we define specific uses below. */
 +	DECLARE_VMA_BIT(HIGH_ARCH_0, 32),
 +	DECLARE_VMA_BIT(HIGH_ARCH_1, 33),
 +	DECLARE_VMA_BIT(HIGH_ARCH_2, 34),
 +	DECLARE_VMA_BIT(HIGH_ARCH_3, 35),
 +	DECLARE_VMA_BIT(HIGH_ARCH_4, 36),
 +	DECLARE_VMA_BIT(HIGH_ARCH_5, 37),
 +	DECLARE_VMA_BIT(HIGH_ARCH_6, 38),
 +	/*
 +	 * This flag is used to connect VFIO to arch specific KVM code. It
 +	 * indicates that the memory under this VMA is safe for use with any
 +	 * non-cachable memory type inside KVM. Some VFIO devices, on some
 +	 * platforms, are thought to be unsafe and can cause machine crashes
 +	 * if KVM does not lock down the memory type.
 +	 */
 +	DECLARE_VMA_BIT(ALLOW_ANY_UNCACHED, 39),
 +#ifdef CONFIG_PPC32
 +	DECLARE_VMA_BIT_ALIAS(DROPPABLE, ARCH_1),
 +#else
 +	DECLARE_VMA_BIT(DROPPABLE, 40),
 +#endif
 +	DECLARE_VMA_BIT(UFFD_MINOR, 41),
 +	DECLARE_VMA_BIT(SEALED, 42),
 +	/* Flags that reuse flags above. */
 +	DECLARE_VMA_BIT_ALIAS(PKEY_BIT0, HIGH_ARCH_0),
 +	DECLARE_VMA_BIT_ALIAS(PKEY_BIT1, HIGH_ARCH_1),
 +	DECLARE_VMA_BIT_ALIAS(PKEY_BIT2, HIGH_ARCH_2),
 +	DECLARE_VMA_BIT_ALIAS(PKEY_BIT3, HIGH_ARCH_3),
 +	DECLARE_VMA_BIT_ALIAS(PKEY_BIT4, HIGH_ARCH_4),
- #if defined(CONFIG_X86_USER_SHADOW_STACK)
++#if defined(CONFIG_X86_USER_SHADOW_STACK) || defined(CONFIG_RISCV_USER_CFI)
 +	/*
 +	 * VM_SHADOW_STACK should not be set with VM_SHARED because of lack of
 +	 * support core mm.
 +	 *
 +	 * These VMAs will get a single end guard page. This helps userspace
 +	 * protect itself from attacks. A single page is enough for current
 +	 * shadow stack archs (x86). See the comments near alloc_shstk() in
 +	 * arch/x86/kernel/shstk.c for more details on the guard size.
 +	 */
 +	DECLARE_VMA_BIT_ALIAS(SHADOW_STACK, HIGH_ARCH_5),
 +#elif defined(CONFIG_ARM64_GCS)
 +	/*
 +	 * arm64's Guarded Control Stack implements similar functionality and
 +	 * has similar constraints to shadow stacks.
 +	 */
 +	DECLARE_VMA_BIT_ALIAS(SHADOW_STACK, HIGH_ARCH_6),
 +#endif
 +	DECLARE_VMA_BIT_ALIAS(SAO, ARCH_1),		/* Strong Access Ordering (powerpc) */
 +	DECLARE_VMA_BIT_ALIAS(GROWSUP, ARCH_1),		/* parisc */
 +	DECLARE_VMA_BIT_ALIAS(SPARC_ADI, ARCH_1),	/* sparc64 */
 +	DECLARE_VMA_BIT_ALIAS(ARM64_BTI, ARCH_1),	/* arm64 */
 +	DECLARE_VMA_BIT_ALIAS(ARCH_CLEAR, ARCH_1),	/* sparc64, arm64 */
 +	DECLARE_VMA_BIT_ALIAS(MAPPED_COPY, ARCH_1),	/* !CONFIG_MMU */
 +	DECLARE_VMA_BIT_ALIAS(MTE, HIGH_ARCH_4),	/* arm64 */
 +	DECLARE_VMA_BIT_ALIAS(MTE_ALLOWED, HIGH_ARCH_5),/* arm64 */
 +#ifdef CONFIG_STACK_GROWSUP
 +	DECLARE_VMA_BIT_ALIAS(STACK, GROWSUP),
 +	DECLARE_VMA_BIT_ALIAS(STACK_EARLY, GROWSDOWN),
 +#else
 +	DECLARE_VMA_BIT_ALIAS(STACK, GROWSDOWN),
 +#endif
 +};
 +#undef DECLARE_VMA_BIT
 +#undef DECLARE_VMA_BIT_ALIAS
 +
 +#define INIT_VM_FLAG(name) BIT((__force int) VMA_ ## name ## _BIT)
 +#define VM_READ		INIT_VM_FLAG(READ)
 +#define VM_WRITE	INIT_VM_FLAG(WRITE)
 +#define VM_EXEC		INIT_VM_FLAG(EXEC)
 +#define VM_SHARED	INIT_VM_FLAG(SHARED)
 +#define VM_MAYREAD	INIT_VM_FLAG(MAYREAD)
 +#define VM_MAYWRITE	INIT_VM_FLAG(MAYWRITE)
 +#define VM_MAYEXEC	INIT_VM_FLAG(MAYEXEC)
 +#define VM_MAYSHARE	INIT_VM_FLAG(MAYSHARE)
 +#define VM_GROWSDOWN	INIT_VM_FLAG(GROWSDOWN)
 +#ifdef CONFIG_MMU
 +#define VM_UFFD_MISSING	INIT_VM_FLAG(UFFD_MISSING)
 +#else
 +#define VM_UFFD_MISSING	VM_NONE
 +#define VM_MAYOVERLAY	INIT_VM_FLAG(MAYOVERLAY)
 +#endif
 +#define VM_PFNMAP	INIT_VM_FLAG(PFNMAP)
 +#define VM_MAYBE_GUARD	INIT_VM_FLAG(MAYBE_GUARD)
 +#define VM_UFFD_WP	INIT_VM_FLAG(UFFD_WP)
 +#define VM_LOCKED	INIT_VM_FLAG(LOCKED)
 +#define VM_IO		INIT_VM_FLAG(IO)
 +#define VM_SEQ_READ	INIT_VM_FLAG(SEQ_READ)
 +#define VM_RAND_READ	INIT_VM_FLAG(RAND_READ)
 +#define VM_DONTCOPY	INIT_VM_FLAG(DONTCOPY)
 +#define VM_DONTEXPAND	INIT_VM_FLAG(DONTEXPAND)
 +#define VM_LOCKONFAULT	INIT_VM_FLAG(LOCKONFAULT)
 +#define VM_ACCOUNT	INIT_VM_FLAG(ACCOUNT)
 +#define VM_NORESERVE	INIT_VM_FLAG(NORESERVE)
 +#define VM_HUGETLB	INIT_VM_FLAG(HUGETLB)
 +#define VM_SYNC		INIT_VM_FLAG(SYNC)
 +#define VM_ARCH_1	INIT_VM_FLAG(ARCH_1)
 +#define VM_WIPEONFORK	INIT_VM_FLAG(WIPEONFORK)
 +#define VM_DONTDUMP	INIT_VM_FLAG(DONTDUMP)
  #ifdef CONFIG_MEM_SOFT_DIRTY
 -# define VM_SOFTDIRTY	0x08000000	/* Not soft dirty clean area */
 +#define VM_SOFTDIRTY	INIT_VM_FLAG(SOFTDIRTY)
  #else
 -# define VM_SOFTDIRTY	0
 +#define VM_SOFTDIRTY	VM_NONE
 +#endif
 +#define VM_MIXEDMAP	INIT_VM_FLAG(MIXEDMAP)
 +#define VM_HUGEPAGE	INIT_VM_FLAG(HUGEPAGE)
 +#define VM_NOHUGEPAGE	INIT_VM_FLAG(NOHUGEPAGE)
 +#define VM_MERGEABLE	INIT_VM_FLAG(MERGEABLE)
 +#define VM_STACK	INIT_VM_FLAG(STACK)
 +#ifdef CONFIG_STACK_GROWS_UP
 +#define VM_STACK_EARLY	INIT_VM_FLAG(STACK_EARLY)
 +#else
 +#define VM_STACK_EARLY	VM_NONE
  #endif
 -
 -#define VM_MIXEDMAP	0x10000000	/* Can contain "struct page" and pure PFN pages */
 -#define VM_HUGEPAGE	0x20000000	/* MADV_HUGEPAGE marked this vma */
 -#define VM_NOHUGEPAGE	0x40000000	/* MADV_NOHUGEPAGE marked this vma */
 -#define VM_MERGEABLE	BIT(31)		/* KSM may merge identical pages */
 -
 -#ifdef CONFIG_ARCH_USES_HIGH_VMA_FLAGS
 -#define VM_HIGH_ARCH_BIT_0	32	/* bit only usable on 64-bit architectures */
 -#define VM_HIGH_ARCH_BIT_1	33	/* bit only usable on 64-bit architectures */
 -#define VM_HIGH_ARCH_BIT_2	34	/* bit only usable on 64-bit architectures */
 -#define VM_HIGH_ARCH_BIT_3	35	/* bit only usable on 64-bit architectures */
 -#define VM_HIGH_ARCH_BIT_4	36	/* bit only usable on 64-bit architectures */
 -#define VM_HIGH_ARCH_BIT_5	37	/* bit only usable on 64-bit architectures */
 -#define VM_HIGH_ARCH_BIT_6	38	/* bit only usable on 64-bit architectures */
 -#define VM_HIGH_ARCH_0	BIT(VM_HIGH_ARCH_BIT_0)
 -#define VM_HIGH_ARCH_1	BIT(VM_HIGH_ARCH_BIT_1)
 -#define VM_HIGH_ARCH_2	BIT(VM_HIGH_ARCH_BIT_2)
 -#define VM_HIGH_ARCH_3	BIT(VM_HIGH_ARCH_BIT_3)
 -#define VM_HIGH_ARCH_4	BIT(VM_HIGH_ARCH_BIT_4)
 -#define VM_HIGH_ARCH_5	BIT(VM_HIGH_ARCH_BIT_5)
 -#define VM_HIGH_ARCH_6	BIT(VM_HIGH_ARCH_BIT_6)
 -#endif /* CONFIG_ARCH_USES_HIGH_VMA_FLAGS */
 -
  #ifdef CONFIG_ARCH_HAS_PKEYS
 -# define VM_PKEY_SHIFT VM_HIGH_ARCH_BIT_0
 -# define VM_PKEY_BIT0  VM_HIGH_ARCH_0
 -# define VM_PKEY_BIT1  VM_HIGH_ARCH_1
 -# define VM_PKEY_BIT2  VM_HIGH_ARCH_2
 +#define VM_PKEY_SHIFT ((__force int)VMA_HIGH_ARCH_0_BIT)
 +/* Despite the naming, these are FLAGS not bits. */
 +#define VM_PKEY_BIT0 INIT_VM_FLAG(PKEY_BIT0)
 +#define VM_PKEY_BIT1 INIT_VM_FLAG(PKEY_BIT1)
 +#define VM_PKEY_BIT2 INIT_VM_FLAG(PKEY_BIT2)
  #if CONFIG_ARCH_PKEY_BITS > 3
 -# define VM_PKEY_BIT3  VM_HIGH_ARCH_3
 +#define VM_PKEY_BIT3 INIT_VM_FLAG(PKEY_BIT3)
  #else
 -# define VM_PKEY_BIT3  0
 -#endif
 +#define VM_PKEY_BIT3  VM_NONE
 +#endif /* CONFIG_ARCH_PKEY_BITS > 3 */
  #if CONFIG_ARCH_PKEY_BITS > 4
 -# define VM_PKEY_BIT4  VM_HIGH_ARCH_4
 +#define VM_PKEY_BIT4 INIT_VM_FLAG(PKEY_BIT4)
  #else
 -# define VM_PKEY_BIT4  0
 -#endif
 +#define VM_PKEY_BIT4  VM_NONE
 +#endif /* CONFIG_ARCH_PKEY_BITS > 4 */
  #endif /* CONFIG_ARCH_HAS_PKEYS */
- #if defined(CONFIG_X86_USER_SHADOW_STACK) || defined(CONFIG_ARM64_GCS)
 -
 -#ifdef CONFIG_X86_USER_SHADOW_STACK
 -/*
 - * VM_SHADOW_STACK should not be set with VM_SHARED because of lack of
 - * support core mm.
 - *
 - * These VMAs will get a single end guard page. This helps userspace protect
 - * itself from attacks. A single page is enough for current shadow stack archs
 - * (x86). See the comments near alloc_shstk() in arch/x86/kernel/shstk.c
 - * for more details on the guard size.
 - */
 -# define VM_SHADOW_STACK	VM_HIGH_ARCH_5
 -#endif
 -
 -#if defined(CONFIG_ARM64_GCS)
 -/*
 - * arm64's Guarded Control Stack implements similar functionality and
 - * has similar constraints to shadow stacks.
 - */
 -# define VM_SHADOW_STACK	VM_HIGH_ARCH_6
 -#endif
 -
 -#if defined(CONFIG_RISCV_USER_CFI)
 -/*
 - * Following x86 and picking up the same bitpos.
 - */
 -# define VM_SHADOW_STACK	VM_HIGH_ARCH_5
 -#endif
 -
 -#ifndef VM_SHADOW_STACK
 -# define VM_SHADOW_STACK	VM_NONE
++#if defined(CONFIG_X86_USER_SHADOW_STACK) || defined(CONFIG_ARM64_GCS) || \
++    defined(CONFIG_RISCV_USER_CFI)
 +#define VM_SHADOW_STACK	INIT_VM_FLAG(SHADOW_STACK)
 +#else
 +#define VM_SHADOW_STACK	VM_NONE
  #endif
 -
  #if defined(CONFIG_PPC64)
 -# define VM_SAO		VM_ARCH_1	/* Strong Access Ordering (powerpc) */
 +#define VM_SAO		INIT_VM_FLAG(SAO)
  #elif defined(CONFIG_PARISC)
 -# define VM_GROWSUP	VM_ARCH_1
 +#define VM_GROWSUP	INIT_VM_FLAG(GROWSUP)
  #elif defined(CONFIG_SPARC64)
 -# define VM_SPARC_ADI	VM_ARCH_1	/* Uses ADI tag for access control */
 -# define VM_ARCH_CLEAR	VM_SPARC_ADI
 +#define VM_SPARC_ADI	INIT_VM_FLAG(SPARC_ADI)
 +#define VM_ARCH_CLEAR	INIT_VM_FLAG(ARCH_CLEAR)
  #elif defined(CONFIG_ARM64)
 -# define VM_ARM64_BTI	VM_ARCH_1	/* BTI guarded page, a.k.a. GP bit */
 -# define VM_ARCH_CLEAR	VM_ARM64_BTI
 +#define VM_ARM64_BTI	INIT_VM_FLAG(ARM64_BTI)
 +#define VM_ARCH_CLEAR	INIT_VM_FLAG(ARCH_CLEAR)
  #elif !defined(CONFIG_MMU)
 -# define VM_MAPPED_COPY	VM_ARCH_1	/* T if mapped copy of data (nommu mmap) */
 -#endif
 -
 -#if defined(CONFIG_ARM64_MTE)
 -# define VM_MTE		VM_HIGH_ARCH_4	/* Use Tagged memory for access control */
 -# define VM_MTE_ALLOWED	VM_HIGH_ARCH_5	/* Tagged memory permitted */
 -#else
 -# define VM_MTE		VM_NONE
 -# define VM_MTE_ALLOWED	VM_NONE
 +#define VM_MAPPED_COPY	INIT_VM_FLAG(MAPPED_COPY)
  #endif
 -
  #ifndef VM_GROWSUP
 -# define VM_GROWSUP	VM_NONE
 +#define VM_GROWSUP	VM_NONE
 +#endif
 +#ifdef CONFIG_ARM64_MTE
 +#define VM_MTE		INIT_VM_FLAG(MTE)
 +#define VM_MTE_ALLOWED	INIT_VM_FLAG(MTE_ALLOWED)
 +#else
 +#define VM_MTE		VM_NONE
 +#define VM_MTE_ALLOWED	VM_NONE
  #endif
 -
  #ifdef CONFIG_HAVE_ARCH_USERFAULTFD_MINOR
 -# define VM_UFFD_MINOR_BIT	41
 -# define VM_UFFD_MINOR		BIT(VM_UFFD_MINOR_BIT)	/* UFFD minor faults */
 -#else /* !CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
 -# define VM_UFFD_MINOR		VM_NONE
 -#endif /* CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
 -
 -/*
 - * This flag is used to connect VFIO to arch specific KVM code. It
 - * indicates that the memory under this VMA is safe for use with any
 - * non-cachable memory type inside KVM. Some VFIO devices, on some
 - * platforms, are thought to be unsafe and can cause machine crashes
 - * if KVM does not lock down the memory type.
 - */
 -#ifdef CONFIG_64BIT
 -#define VM_ALLOW_ANY_UNCACHED_BIT	39
 -#define VM_ALLOW_ANY_UNCACHED		BIT(VM_ALLOW_ANY_UNCACHED_BIT)
 +#define VM_UFFD_MINOR	INIT_VM_FLAG(UFFD_MINOR)
  #else
 -#define VM_ALLOW_ANY_UNCACHED		VM_NONE
 +#define VM_UFFD_MINOR	VM_NONE
  #endif
 -
  #ifdef CONFIG_64BIT
 -#define VM_DROPPABLE_BIT	40
 -#define VM_DROPPABLE		BIT(VM_DROPPABLE_BIT)
 -#elif defined(CONFIG_PPC32)
 -#define VM_DROPPABLE		VM_ARCH_1
 +#define VM_ALLOW_ANY_UNCACHED	INIT_VM_FLAG(ALLOW_ANY_UNCACHED)
 +#define VM_SEALED		INIT_VM_FLAG(SEALED)
  #else
 -#define VM_DROPPABLE		VM_NONE
 +#define VM_ALLOW_ANY_UNCACHED	VM_NONE
 +#define VM_SEALED		VM_NONE
  #endif
 -
 -#ifdef CONFIG_64BIT
 -#define VM_SEALED_BIT	42
 -#define VM_SEALED	BIT(VM_SEALED_BIT)
 +#if defined(CONFIG_64BIT) || defined(CONFIG_PPC32)
 +#define VM_DROPPABLE		INIT_VM_FLAG(DROPPABLE)
  #else
 -#define VM_SEALED	VM_NONE
 +#define VM_DROPPABLE		VM_NONE
  #endif
  
  /* Bits set in the VMA until the stack is in its final location */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
