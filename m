Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84E9CD98E4
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 22:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U0O7OszOj59sFex3yqNqJa+dxgi/gXldT1C51MDNr/Y=; b=dStBhKCDgSBYZ6QCQCnyPeaPUH
	VNofWKkO4Z+p6yIg4VSVecF9XoLeiElpdyqrAQSvK87h3afEoFwm2trqZkM/n9u+TsneKuxlLF6G8
	uf5gXxJtyBH4KhfMgFbAh6pG9iGuUF3jHx4v1ug0r1FbPtbyG4/RB+xlsl6L5KF16Kh1MnqPxwLMw
	GkeKlD7ppw/JjtJujw3b5GmvaZbu++gJxCDyH1KGjMOd2Pweob4pAda4Qi2FLg7sVqlciYK4psbPQ
	PgrG2mNOJDKAnmSVrEMWtwl/iMGjdB0GCqdbmU9q5oO4cD5Xv+8Z8Y3j9JpIEPfNlsg1hwMsZ3zwf
	CuGngI8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZz6G-00000000Pcj-2msF;
	Wed, 17 Jun 2026 22:51:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZz6F-00000000PcM-0FYZ
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jun 2026 22:51:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 69ECE4195E;
	Wed, 17 Jun 2026 22:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 763841F000E9;
	Wed, 17 Jun 2026 22:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781736670;
	bh=bq9ZCXQ2YeUXbnhvRCi7xHzXakSv8vMupe9JITliGx0=;
	h=Date:From:To:cc:Subject;
	b=jGq+n5MEunV10ljS6DWHUT4qHwAHSV0mHm8mbkLenQ1eFv1kwrClf8CjSB71mogU/
	 Ud1CxsB6JjJyzCdfY0jy2HK/aVUCA9EmC5kEPx0ZcwUTMCSFmo3v2rxZY9Ve4kOB+v
	 MvpYXHZoSg47JAea9AHxKfWP2n96v/ImB2B8sDYx4o54dvmLI91JDAYhBgZVQUxgNf
	 j6QQFMRpLO+ZJO0G86JSW8RlPWloDFzkkwyS8M67CKki+4jsmWjGUY2Eok6iEhLX4b
	 NpvfB1Rg1ZcuN+u5H/S1pR/CT9kLYzc6Ee86mD8TH3Xm9jWHMfH4X7DievyGkOGYU9
	 o36hG0rsFADcQ==
Date: Wed, 17 Jun 2026 16:51:04 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: torvalds@linux-foundation.org
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V updates for v7.2
Message-ID: <2ca9fd52-d4a1-5e7b-b9d9-9d759b92f8c1@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1124969608-1781736670=:21765"
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

--8323329-1124969608-1781736670=:21765
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

Linus,

Please pull the following RISC-V changes for v7.2-rc1.  These are
mostly fixes and cleanups.  Seems primarily due to more people using
RISC-V systems, rather than increased LLM usage; but, hard to be
certain.  In any case, I hope we'll be able to focus more on features
for the next merge window.

thanks,

- Paul


The following changes since commit 15b4155138505669d3d43d7692459ee8ea2a86e7:

  riscv: cfi: reject unknown flags in PR_SET_CFI (2026-06-06 20:17:05 -0600)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.2-mw1

for you to fetch changes up to 319fafd9a3743b617b8547d81c41c99fb67857b1:

  riscv: traps_misaligned: Avoid redundant unaligned access speed probe (2026-06-08 10:47:22 -0600)

----------------------------------------------------------------
RISC-V updates for v7.2

- Prevent get_free_mem_region() from returning regions that are
  unmappable in certain circumstances by defining
  DIRECT_MAP_PHYSMEM_END for RISC-V

- Fix an early boot problem with kexec_file when the amount of
  installed physical memory installed on the system exceeds the direct
  map size, which is possible in certain RISC-V virtual memory modes

- Unconditionally sfence.vma in the new vmalloc area handling code in
  the page fault handler, since even the presence of Svvptc doesn't
  guarantee that the CPU won't immediately fault again after the
  exception handler completes and subsequently crash

- Fix ftrace_graph_ret_addr() to use the correct task pointer
  (aligning with what other architectures do)

- Fix the misaligned access performance checking code in cases when
  performance is specified on the kernel command line and when CPUs
  have been brought offline and back online

- Get rid of a bogus address offset in the non-frame-pointer version
  of walk_stackframe(), aligning it with the frame pointer-based code

- Fix a RISC-V kfence issue causing bogus use-after-free warnings

- Add ARCH_HAS_CC_CAN_LINK for RISC-V, which needs different compiler
  command line flags than other architectures

- Implement _THIS_IP_ using RISC-V-specific assembly, which seems to
  be less brittle (from a compiler point of view) than taking the
  address of a label

- Reduce kernel startup overhead by defining
  HAVE_BUILDTIME_MCOUNT_SORT, since arch/riscv meets all the
  requirements

- Patch the CFI vDSO during alternatives processing, not only the
  standard vDSO

- Fix a potential memory leak in the cacheinfo code

- Clean up kernel/setup.c:add_resource() to pass along the return
  value from insert_resource() and to improve the display of
  resource ranges

- Clean up our purgatory.[ch] by aligning our purgatory() prototype
  to what's in arch/x86, and by cleaning up verify_sha256_digest()

- Clean up cpu_is_stopped() to align its function a little more
  closely to its name

- Replace some unbounded string function usage in get_early_cmdline()
  and the ptdump code with strscpy()

- Replace sprintf() with sysfs_emit() in cpu_show_ghostwrite() for
  safer bounds checking

- Standardize how compiler output flags are specified in the RISC-V
  kselftests, aligning them with what other architectures do

- Use the Linux-generic cmp_int() macro in place of an open-coded
  "cmp_3way()" macro in kernel/module-sections.c

- Panic early in boot if IRQ handler stacks can't be allocated rather
  than pretending to continue normally

- Add support for Eswin SoCs in the RISC-V defconfig

- Remove some unnecessary conditionals in sbi_hsm_hart_{start,stop}()

- Clean up some Kconfig infelicities found by Kconfirm

- Replace an open-coded version of min() in the kexec_elf code with
  the standard min() function

----------------------------------------------------------------
Anirudh Srinivasan (1):
      riscv: defconfig: Enable Eswin SoCs

Chen Pei (1):
      riscv: ftrace: select HAVE_BUILDTIME_MCOUNT_SORT

Florian Schmaus (1):
      riscv: module: Use generic cmp_int() instead of custom cmp_3way()

Han Gao (2):
      riscv: kexec_file: Constrain segment placement to direct map
      riscv: also select ARCH_KEEP_MEMBLOCK if kexec is selected

Hui Wang (3):
      riscv: kexec_elf: Remove unused pr_fmt definition
      riscv: cpu_ops: Change return value type of cpu_is_stopped() to bool
      riscv: cpu_ops_sbi: No need to be bothered to check ret.error

Julian Braha (2):
      riscv: replace select with dependency for visible RELOCATABLE
      riscv: dead code cleanup in kconfig for RISCV_PROBE_VECTOR_UNALIGNED_ACCESS

Marco Elver (1):
      riscv: Implement _THIS_IP_ using inline asm

Nam Cao (2):
      riscv: misaligned: Fix fast_unaligned_access_speed_key init
      riscv: traps_misaligned: Avoid redundant unaligned access speed probe

Osama Abdelkader (1):
      riscv: panic if IRQ handler stacks cannot be allocated

Rui Qi (2):
      riscv: Fix ftrace_graph_ret_addr() to use the correct task pointer
      riscv: stacktrace: Remove bogus -0x4 offset in non-FP walk_stackframe

Thomas Weiﬂschuh (5):
      riscv: Implement ARCH_HAS_CC_CAN_LINK
      riscv: vdso: Always declare vdso_start symbols
      riscv: alternative: Use IS_ENABLED() over ifdeffery for apply_vdso_alternatives()
      riscv: alternative: Pass vDSO start as parameter to apply_vdso_alternatives()
      riscv: alternative: Also patch the CFI vDSO

Thorsten Blum (7):
      riscv/purgatory: return bool from verify_sha256_digest
      riscv/purgatory: add asm/purgatory.h
      riscv: ptdump: Replace unbounded sprintf() in dump_prot()
      riscv: pi: replace strlcat with strscpy in get_early_cmdline
      riscv: use sysfs_emit in cpu_show_ghostwrite
      riscv: propagate insert_resource result from add_resource
      riscv: kexec: use min to simplify riscv_kexec_elf_load

Vivian Wang (6):
      riscv: mm: Define DIRECT_MAP_PHYSMEM_END
      riscv: mm: Extract helper mark_new_valid_map()
      riscv: kfence: Call mark_new_valid_map() for kfence_unprotect()
      riscv: mm: Rename new_vmalloc into new_valid_map_cpus
      riscv: mm: Use the bitmap API for new_valid_map_cpus
      riscv: mm: Unconditionally sfence.vma for spurious fault

Zishun Yi (1):
      riscv: cacheinfo: Fix node reference leak in populate_cache_leaves

Zong Li (1):
      selftests/riscv: fix compiler output flag spacing in all Makefiles

 arch/riscv/Kconfig                               | 21 ++++++--
 arch/riscv/configs/defconfig                     |  1 +
 arch/riscv/include/asm/cacheflush.h              | 25 ++++-----
 arch/riscv/include/asm/cpu_ops.h                 |  2 +-
 arch/riscv/include/asm/kfence.h                  |  7 ++-
 arch/riscv/include/asm/linkage.h                 |  2 +
 arch/riscv/include/asm/pgtable.h                 | 10 ++++
 arch/riscv/include/asm/purgatory.h               | 11 ++++
 arch/riscv/include/asm/vdso.h                    | 10 ++--
 arch/riscv/kernel/alternative.c                  | 14 ++---
 arch/riscv/kernel/bugs.c                         | 12 ++---
 arch/riscv/kernel/cacheinfo.c                    |  2 +-
 arch/riscv/kernel/cpu-hotplug.c                  |  4 +-
 arch/riscv/kernel/cpu_ops_sbi.c                  | 22 ++++----
 arch/riscv/kernel/entry.S                        | 51 ++++++++++--------
 arch/riscv/kernel/irq.c                          | 22 +++++---
 arch/riscv/kernel/kexec_elf.c                    | 10 +---
 arch/riscv/kernel/machine_kexec_file.c           |  3 +-
 arch/riscv/kernel/module-sections.c              |  6 +--
 arch/riscv/kernel/pi/cmdline_early.c             | 16 +++---
 arch/riscv/kernel/setup.c                        | 11 ++--
 arch/riscv/kernel/stacktrace.c                   |  4 +-
 arch/riscv/kernel/traps_misaligned.c             |  4 +-
 arch/riscv/kernel/unaligned_access_speed.c       | 69 ++++++++----------------
 arch/riscv/mm/init.c                             |  2 +-
 arch/riscv/mm/ptdump.c                           | 13 ++---
 arch/riscv/purgatory/purgatory.c                 | 16 +++---
 tools/testing/selftests/riscv/abi/Makefile       |  2 +-
 tools/testing/selftests/riscv/cfi/Makefile       |  2 +-
 tools/testing/selftests/riscv/hwprobe/Makefile   |  6 +--
 tools/testing/selftests/riscv/mm/Makefile        |  2 +-
 tools/testing/selftests/riscv/sigreturn/Makefile |  2 +-
 tools/testing/selftests/riscv/vector/Makefile    | 12 ++---
 33 files changed, 205 insertions(+), 191 deletions(-)
create mode 100644 arch/riscv/include/asm/purgatory.h

vmlinux size differences in bytes (from 15b415513850):
  text    data    bss     dec     hex  filename                             
 +3913  +48816    -64  +52665   +cdb9  vmlinux.defconfig.gcc-15             
 -2056    +192     -8   -1872    -750  vmlinux.nosmp_defconfig.gcc-15       
 +4225  +30056    -64  +34217   +85a9  vmlinux.rv32_defconfig.gcc-15        
 -2340    +128     -8   -2220    -8ac  vmlinux.rv32_nosmp_defconfig.gcc-15  
   +19       .   -120    -101     -65  vmlinux.nommu_virt_defconfig.gcc-15  
 +4357  +47344    -64  +51637   +c9b5  vmlinux.defconfig.clang-20           
 +3856   -3252      .    +604    +25c  vmlinux.nosmp_defconfig.clang-20     
 +7613  +29256    -64  +36805   +8fc5  vmlinux.rv32_defconfig.clang-20      
 +7344   -4656    -64   +2624    +a40  vmlinux.rv32_nosmp_defconfig.clang-20
   -97   +4096    -64   +3935    +f5f  vmlinux.nommu_virt_defconfig.clang-20
 +3873  +52784    -64  +56593   +dd11  vmlinux.defconfig.gcc-14             
 -2472    +180     -8   -2300    -8fc  vmlinux.nosmp_defconfig.gcc-14       
 +4217  +29992    -64  +34145   +8561  vmlinux.rv32_defconfig.gcc-14        
 -2728    +116     -8   -2620    -a3c  vmlinux.rv32_nosmp_defconfig.gcc-14  
   +31       .   -120     -89     -59  vmlinux.nommu_virt_defconfig.gcc-14  
 +4437  +47408    -64  +51781   +ca45  vmlinux.defconfig.clang-19           
 +3908   -3308     -8    +592    +250  vmlinux.nosmp_defconfig.clang-19     
 +7677  +28680    -64  +36293   +8dc5  vmlinux.rv32_defconfig.clang-19      
 +7392   -4756    -16   +2620    +a3c  vmlinux.rv32_nosmp_defconfig.clang-19
  -113     -64    -56    -233     -e9  vmlinux.nommu_virt_defconfig.clang-19
 +3829  +48784    -64  +52549   +cd45  vmlinux.defconfig.gcc-13             
 -2836    +128     -8   -2716    -a9c  vmlinux.nosmp_defconfig.gcc-13       
 +4045  +30024    -64  +34005   +84d5  vmlinux.rv32_defconfig.gcc-13        
 -2952     +96     -8   -2864    -b30  vmlinux.rv32_nosmp_defconfig.gcc-13  
    -1       .   -120    -121     -79  vmlinux.nommu_virt_defconfig.gcc-13  
 +4481  +47408    -64  +51825   +ca71  vmlinux.defconfig.clang-18           
 +3812   -3564     -8    +240     +f0  vmlinux.nosmp_defconfig.clang-18     
 +7589  +28744    -64  +36269   +8dad  vmlinux.rv32_defconfig.clang-18      
 +7456   -4756    -16   +2684    +a7c  vmlinux.rv32_nosmp_defconfig.clang-18
  -133       .    -56    -189     -bd  vmlinux.nommu_virt_defconfig.clang-18
 +4453  +48848    -64  +53237   +cff5  vmlinux.defconfig.gcc-12             
 -2572    +256     -8   -2324    -914  vmlinux.nosmp_defconfig.gcc-12       
 +3533  +29992    -64  +33461   +82b5  vmlinux.rv32_defconfig.gcc-12        
 -3272    +128     -8   -3152    -c50  vmlinux.rv32_nosmp_defconfig.gcc-12  
   -13       .   -120    -133     -85  vmlinux.nommu_virt_defconfig.gcc-12  
 +4545  +47536    -64  +52017   +cb31  vmlinux.defconfig.clang-17           
 +3964   -3564     -8    +392    +188  vmlinux.nosmp_defconfig.clang-17     
 +7489  +28584    -64  +36009   +8ca9  vmlinux.rv32_defconfig.clang-17      
 +7528   -4748    -16   +2764    +acc  vmlinux.rv32_nosmp_defconfig.clang-17
  -101       .    -56    -157     -9d  vmlinux.nommu_virt_defconfig.clang-17
 +4205  +48704    -64  +52845   +ce6d  vmlinux.defconfig.gcc-11             
 -2660    +160     -8   -2508    -9cc  vmlinux.nosmp_defconfig.gcc-11       
 +3469  +29944    -64  +33349   +8245  vmlinux.rv32_defconfig.gcc-11        
 -2724     +72     -8   -2660    -a64  vmlinux.rv32_nosmp_defconfig.gcc-11  
    -9       .   -120    -129     -81  vmlinux.nommu_virt_defconfig.gcc-11  
   -76       .     -8     -84     -54  vmlinux.allnoconfig.gcc-14           
-78761    +608  +1800  -76353  -12a41  vmlinux.allmodconfig.gcc-14          
   -48    -160     -8    -216     -d8  vmlinux.allnoconfig.clang-19         
 +4179  -19204   -256  -15281   -3bb1  vmlinux.allmodconfig.clang-19        
--8323329-1124969608-1781736670=:21765
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1124969608-1781736670=:21765--

