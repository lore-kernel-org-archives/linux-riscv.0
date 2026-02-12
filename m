Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E99EEA870
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Feb 2026 23:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aexedzJ3Ju1trdR89+huc1uii4fVQSCRTMeHgr5E0gk=; b=JjVH27Hg1nM3F8vFcTnH7qpmCK
	SmBVXqw65uuuvfSzAp16o5jPaYkAQeG3NXserju/shaXkWGLaiCo4pIiVC/wWxNLCx+U5V5OtJLV6
	oUby1Tlw6N+EE6kQGb++09Yb1cOtDaNUp8AJNrlGwy8qK1DlDWxrpWCeWn4xvNmb7r7CzQbG/kZq1
	XsMeCtuqNMTYjzmK8OR6433hqIiFkGaPmounVuiTxrVKhSFAFdLfLqBPEt1WIA2mqPKPdqrGhOSf9
	GfytVRfdiD/qmyb+bt2+7EhW+r6jPSLZusCESFXy3mv8plrbVGPTed03bibshEAAUwuiFiZ/CsXH5
	ZBWa047g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqgHt-00000002jlQ-00Lv;
	Thu, 12 Feb 2026 23:39:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqgHq-00000002jku-3Wbx
	for linux-riscv@lists.infradead.org;
	Thu, 12 Feb 2026 23:39:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 58E3440914;
	Thu, 12 Feb 2026 23:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA24EC4CEF7;
	Thu, 12 Feb 2026 23:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770939593;
	bh=WsYIgkPfA2mHH9mji2/jdYYmGM1CPLwR8EZKZg6x3Z0=;
	h=Date:From:To:cc:Subject:From;
	b=DxQmW1jgLkZoSSE206N3Ma2XeaD8yd/xXNExNmT4/gljO1w/znWBlkBaDHI32K8Ke
	 pbAdtDMrwKfLZLPcXH20I/BVNBgSUhqMGT0e1lhda9+QPTMUnPm1jjFUQcR5vg7rud
	 owExI0xmRFYHD3MFLKNk4FHVfitEddEUC8GyqdOlNTKfcd+ckcc7B7JNCGn3jzSVpc
	 VG0GqOpIaHV+K5JfCMTv0acdOr+C3Xh865BQsiu7eYrPOFa7Kua3J4D0wN9nn1TM9j
	 cnKxuFCTe5mbkGiOgDzEnVBJOKjcT0nDedWWG/LmYWZEyvrBEjRWLm9mXovPL1Jbab
	 VtxUDnwIKAWfw==
Date: Thu, 12 Feb 2026 16:39:48 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: torvalds@linux-foundation.org
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V updates for v7.0
Message-ID: <c554c02e-a791-5c4a-d329-7632de7a194d@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1524609356-1770939592=:1277519"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_153954_927972_8C44B7F1 
X-CRM114-Status: GOOD (  20.43  )
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

--8323329-1524609356-1770939592=:1277519
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

Linus,

Please pull these RISC-V updates for v7.0.  The primary new feature
here is support for CFI in user processes.  This feature has been
tested by a set of RISC-V community participants, including by CPU
IP/hardware vendors and by a major Linux distribution.  Other changes
are described in the signed tag.

The code in this PR has been sitting in linux-next for a few weeks.  I
did repush some of the vector ptrace patches a few days ago to fix a
missing Signed-off-by: tag (thanks Mark); no code was changed during
the repush.


thanks,

- Paul


The following changes since commit 28a12ef366ecb118db19b92120a07b0491c1958e:

  errata/sifive: remove unreliable warn_miss_errata (2026-01-25 21:09:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.0-mw1

for you to fetch changes up to 18be4ca5cb4e5a86833de97d331f5bc14a6c5a6d:

  riscv: lib: optimize strlen loop efficiency (2026-02-09 15:27:33 -0700)

----------------------------------------------------------------
RISC-V updates for v7.0

- Add support for control flow integrity for userspace processes.
  This is based on the standard RISC-V ISA extensions Zicfiss and
  Zicfilp

- Improve ptrace behavior regarding vector registers, and add some selftests

- Optimize our strlen() assembly

- Enable the ISO-8859-1 code page as built-in, similar to ARM64, for EFI
  volume mounting

- Clean up some code slightly, including defining copy_user_page() as
  copy_page() rather than memcpy(), aligning us with other
  architectures; and using max3() to slightly simplify an expression
  in riscv_iommu_init_check()

----------------------------------------------------------------
Deepak Gupta (26):
      mm: add VM_SHADOW_STACK definition for riscv
      dt-bindings: riscv: document zicfilp and zicfiss in extensions.yaml
      riscv: zicfiss / zicfilp enumeration
      riscv: add Zicfiss / Zicfilp extension CSR and bit definitions
      riscv: Add usercfi state for task and save/restore of CSR_SSP on trap entry/exit
      riscv/mm: ensure PROT_WRITE leads to VM_READ | VM_WRITE
      riscv/mm: manufacture shadow stack ptes
      riscv/mm: teach pte_mkwrite to manufacture shadow stack PTEs
      riscv/mm: update write protect to work on shadow stacks
      riscv/mm: Implement map_shadow_stack() syscall
      riscv/shstk: If needed allocate a new shadow stack on clone
      riscv: Implement arch-agnostic shadow stack prctls
      prctl: add arch-agnostic prctl()s for indirect branch tracking
      riscv: Implement indirect branch tracking prctls
      riscv/traps: Introduce software check exception and uprobe handling
      riscv/signal: save and restore the shadow stack on a signal
      riscv/kernel: update __show_regs() to print shadow stack register
      riscv/ptrace: expose riscv CFI status and state via ptrace and in core files
      riscv/hwprobe: add zicfilp / zicfiss enumeration in hwprobe
      riscv: add kernel command line option to opt out of user CFI
      riscv: enable kernel access to shadow stack memory via the FWFT SBI call
      arch/riscv: add dual vdso creation logic and select vdso based on hw
      riscv: create a Kconfig fragment for shadow stack and landing pad support
      riscv: add documentation for landing pad / indirect branch tracking
      riscv: add documentation for shadow stack
      kselftest/riscv: add kselftest for user mode CFI

Feng Jiang (1):
      riscv: lib: optimize strlen loop efficiency

Florian Schmaus (1):
      riscv: mm: define copy_user_page() as copy_page()

Ilya Mamay (1):
      riscv: ptrace: return ENODATA for inactive vector extension

Javier Carrasco (1):
      riscv: defconfig: enable NLS_ISO8859_1

Jim Shu (1):
      arch/riscv: compile vdso with landing pad and shadow stack note

Markus Elfring (1):
      iommu/riscv: Simplify maximum determination in riscv_iommu_init_check()

Paul Walmsley (1):
      riscv: hwprobe: add support for RISCV_HWPROBE_KEY_IMA_EXT_1

Sergey Matyukevich (8):
      riscv: vector: init vector context with proper vlenb
      riscv: csr: define vtype register elements
      riscv: ptrace: validate input vector csr registers
      selftests: riscv: test ptrace vector interface
      selftests: riscv: verify initial vector state with ptrace
      selftests: riscv: verify syscalls discard vector context
      selftests: riscv: verify ptrace rejects invalid vector csr inputs
      selftests: riscv: verify ptrace accepts valid vector csr values

Thomas Weiﬂschuh (1):
      selftests: riscv: vstate_exec_nolibc: Use the regular prctl() function

 Documentation/admin-guide/kernel-parameters.txt    |   8 +
 Documentation/arch/riscv/hwprobe.rst               |   6 +-
 Documentation/arch/riscv/index.rst                 |   2 +
 Documentation/arch/riscv/zicfilp.rst               | 122 +++
 Documentation/arch/riscv/zicfiss.rst               | 194 +++++
 .../devicetree/bindings/riscv/extensions.yaml      |  14 +
 arch/riscv/Kconfig                                 |  22 +
 arch/riscv/Makefile                                |   8 +-
 arch/riscv/configs/defconfig                       |   2 +-
 arch/riscv/configs/hardening.config                |   4 +
 arch/riscv/include/asm/asm-prototypes.h            |   1 +
 arch/riscv/include/asm/assembler.h                 |  44 +
 arch/riscv/include/asm/cpufeature.h                |  12 +
 arch/riscv/include/asm/csr.h                       |  31 +
 arch/riscv/include/asm/entry-common.h              |   2 +
 arch/riscv/include/asm/hwcap.h                     |   2 +
 arch/riscv/include/asm/hwprobe.h                   |   3 +-
 arch/riscv/include/asm/mman.h                      |  26 +
 arch/riscv/include/asm/mmu_context.h               |   7 +
 arch/riscv/include/asm/page.h                      |   3 +-
 arch/riscv/include/asm/pgtable.h                   |  30 +-
 arch/riscv/include/asm/processor.h                 |   1 +
 arch/riscv/include/asm/thread_info.h               |   3 +
 arch/riscv/include/asm/usercfi.h                   |  97 +++
 arch/riscv/include/asm/vdso.h                      |  13 +-
 arch/riscv/include/uapi/asm/hwprobe.h              |   4 +
 arch/riscv/include/uapi/asm/ptrace.h               |  34 +
 arch/riscv/include/uapi/asm/sigcontext.h           |   1 +
 arch/riscv/kernel/Makefile                         |   2 +
 arch/riscv/kernel/asm-offsets.c                    |  10 +
 arch/riscv/kernel/cpufeature.c                     |  25 +
 arch/riscv/kernel/entry.S                          |  38 +
 arch/riscv/kernel/head.S                           |  27 +
 arch/riscv/kernel/process.c                        |  27 +-
 arch/riscv/kernel/ptrace.c                         | 193 ++++-
 arch/riscv/kernel/signal.c                         |  86 ++
 arch/riscv/kernel/sys_hwprobe.c                    | 170 ++--
 arch/riscv/kernel/sys_riscv.c                      |  10 +
 arch/riscv/kernel/traps.c                          |  54 ++
 arch/riscv/kernel/usercfi.c                        | 542 ++++++++++++
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
 arch/riscv/kernel/vector.c                         |  12 +-
 arch/riscv/lib/strlen.S                            |   8 +-
 arch/riscv/mm/init.c                               |   2 +-
 arch/riscv/mm/pgtable.c                            |  16 +
 drivers/iommu/riscv/iommu.c                        |   8 +-
 include/linux/cpu.h                                |   4 +
 include/linux/mm.h                                 |   5 +-
 include/uapi/linux/elf.h                           |   2 +
 include/uapi/linux/prctl.h                         |  27 +
 kernel/sys.c                                       |  30 +
 tools/testing/selftests/riscv/Makefile             |   2 +-
 tools/testing/selftests/riscv/cfi/.gitignore       |   2 +
 tools/testing/selftests/riscv/cfi/Makefile         |  23 +
 tools/testing/selftests/riscv/cfi/cfi_rv_test.h    |  82 ++
 tools/testing/selftests/riscv/cfi/cfitests.c       | 173 ++++
 tools/testing/selftests/riscv/cfi/shadowstack.c    | 385 +++++++++
 tools/testing/selftests/riscv/cfi/shadowstack.h    |  27 +
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |  18 +-
 tools/testing/selftests/riscv/vector/.gitignore    |   2 +
 tools/testing/selftests/riscv/vector/Makefile      |  10 +-
 tools/testing/selftests/riscv/vector/v_helpers.c   |  23 +
 tools/testing/selftests/riscv/vector/v_helpers.h   |   2 +
 .../selftests/riscv/vector/validate_v_ptrace.c     | 915 +++++++++++++++++++++
 .../selftests/riscv/vector/vstate_exec_nolibc.c    |   8 +-
 75 files changed, 3655 insertions(+), 122 deletions(-)
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
 create mode 100644 tools/testing/selftests/riscv/vector/validate_v_ptrace.c

vmlinux size differences in bytes (from 28a12ef366ec):
  text   data bss    dec   hex filename                             
 +6290  +8892  +8 +15190 +3b56 vmlinux.defconfig.gcc-15             
 +5684  +9668  +8 +15360 +3c00 vmlinux.nosmp_defconfig.gcc-15       
 +1672  +2720   .  +4392 +1128 vmlinux.rv32_defconfig.gcc-15        
 +1188   +288   .  +1476  +5c4 vmlinux.rv32_nosmp_defconfig.gcc-15  
 +1628   +128   .  +1756  +6dc vmlinux.nommu_virt_defconfig.gcc-15  
  +692  +3864   .  +4556 +11cc vmlinux.defconfig.clang-20           
 +1024   +256   .  +1280  +500 vmlinux.nosmp_defconfig.clang-20     
  +940  +2616   .  +3556  +de4 vmlinux.rv32_defconfig.clang-20      
 +1188   +288   .  +1476  +5c4 vmlinux.rv32_nosmp_defconfig.clang-20
 +1762  -3904   .  -2142  -85e vmlinux.nommu_virt_defconfig.clang-20
 +1620  +3624   .  +5244 +147c vmlinux.defconfig.gcc-14             
 +1380   +240   .  +1620  +654 vmlinux.nosmp_defconfig.gcc-14       
 +1604  +2752   .  +4356 +1104 vmlinux.rv32_defconfig.gcc-14        
 +1192   +320   .  +1512  +5e8 vmlinux.rv32_nosmp_defconfig.gcc-14  
 +1616   +448   .  +2064  +810 vmlinux.nommu_virt_defconfig.gcc-14  
  +980  +3576   .  +4556 +11cc vmlinux.defconfig.clang-19           
 +1228    -32   .  +1196  +4ac vmlinux.nosmp_defconfig.clang-19     
  +904  +2656   .  +3560  +de8 vmlinux.rv32_defconfig.clang-19      
 +1204   +288   .  +1492  +5d4 vmlinux.rv32_nosmp_defconfig.clang-19
 +1770  -7744   .  -5974 -1756 vmlinux.nommu_virt_defconfig.clang-19
 +1352  +3688   .  +5040 +13b0 vmlinux.defconfig.gcc-13             
 +1168   +224   .  +1392  +570 vmlinux.nosmp_defconfig.gcc-13       
 +1416  +2752   .  +4168 +1048 vmlinux.rv32_defconfig.gcc-13        
  +944   +320   .  +1264  +4f0 vmlinux.rv32_nosmp_defconfig.gcc-13  
 +1568   +384   .  +1952  +7a0 vmlinux.nommu_virt_defconfig.gcc-13  
  +836  +3832   .  +4668 +123c vmlinux.defconfig.clang-18           
 +1228   +224   .  +1452  +5ac vmlinux.nosmp_defconfig.clang-18     
  +896  +2648   .  +3544  +dd8 vmlinux.rv32_defconfig.clang-18      
 +1252   +320   .  +1572  +624 vmlinux.rv32_nosmp_defconfig.clang-18
 +1762   +256   .  +2018  +7e2 vmlinux.nommu_virt_defconfig.clang-18
 +1500  +3752   .  +5252 +1484 vmlinux.defconfig.gcc-12             
 +1228   +304   .  +1532  +5fc vmlinux.nosmp_defconfig.gcc-12       
 +1324  +2752   .  +4076  +fec vmlinux.rv32_defconfig.gcc-12        
  +988   +352   .  +1340  +53c vmlinux.rv32_nosmp_defconfig.gcc-12  
 +1580   +384   .  +1964  +7ac vmlinux.nommu_virt_defconfig.gcc-12  
 +1144  +3832   .  +4976 +1370 vmlinux.defconfig.clang-17           
 +1716   +224   .  +1940  +794 vmlinux.nosmp_defconfig.clang-17     
 +1520  +2616   .  +4136 +1028 vmlinux.rv32_defconfig.clang-17      
 +1884   +352   .  +2236  +8bc vmlinux.rv32_nosmp_defconfig.clang-17
 +2134 +12736   . +14870 +3a16 vmlinux.nommu_virt_defconfig.clang-17
 +1524  +3432   .  +4956 +135c vmlinux.defconfig.gcc-11             
  +996    -32   .   +964  +3c4 vmlinux.nosmp_defconfig.gcc-11       
 +1460  +2784   .  +4244 +1094 vmlinux.rv32_defconfig.gcc-11        
 +1084   +320   .  +1404  +57c vmlinux.rv32_nosmp_defconfig.gcc-11  
 +1564   +128   .  +1692  +69c vmlinux.nommu_virt_defconfig.gcc-11  
 +1028   +224   .  +1252  +4e4 vmlinux.allnoconfig.gcc-14           
 +8858  +2172   . +11030 +2b16 vmlinux.allmodconfig.gcc-14          
  +768    -32   .   +736  +2e0 vmlinux.allnoconfig.clang-19         
+26214  +1404  -8 +27610 +6bda vmlinux.allmodconfig.clang-19        
--8323329-1524609356-1770939592=:1277519
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1524609356-1770939592=:1277519--

