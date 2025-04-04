Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FFCC36010
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 15:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Z9Dcg74xqsJdmnUlyw1y2NQ8ZLn78ODi1cRMWTmwjtI=; b=xRz
	aaNKJeJwX+JQLFACDEfTEBdtqYUBZUO6xLDV2JUa1Hp6Zx8CKgly/6XtKVla8PJs4Ng8oH0KHKhOr
	44NvcDYDHFR95fBb2TSCwR0jU98+tBEUzBJmXDJv5hLwPI39G7TJ0wrIQaJ25ioTNSw87h2wvwJfk
	oXKrVrMgVuPd3AY8YrP+dZWlyrNcrzEzhE1j+5ehDb/cE5fMsQip0117aAyf7qrUhLl98kqBqf9jJ
	GkPhkxbdwZy1kPoghidCWrsRTzT+wg44u9CngS1AVz756UEk/Wo/URoLoQC2mGzqm6MLD3fE3enO2
	W2mk7RuCMMH/yZqAN4gq38I+2OLa/gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jS2-0000000CEpo-48Wc;
	Fri, 04 Apr 2025 15:59:26 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jQm-0000000CEe2-1WhC
	for linux-riscv@lists.infradead.org;
	Fri, 04 Apr 2025 15:58:09 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-227aaa82fafso21228715ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 04 Apr 2025 08:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743782287; x=1744387087; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a93qrZwK32tWAKqaUVMn2Zj8PMNCzPIKT0Jeo46weyc=;
        b=G8DVXMPBsob3onJlHye4M1/tg2PhpazimoumO+a5y0OVx0C/hDCn1H9NvX5zctoJL5
         PLhwc4f4w20EEVVW1Fgr6KIuVoCGk50VDbfBD+pGcU/WVdkNrijx+3B73IaMu2qBygyg
         InT46+BRTzgtmE/Qpj9iznt1ms3agzfit7xsCJTX/dwsNggF6xKaT7jWpADNfqAwPRPj
         Xwuk4fROnmmGBgdMbyMT5VmMDo+MnoQFv71w4hsDz0m2iWg4Qdduw+MGUIRmbajE6puC
         qhKfOFdkIZmzlN37Wykj7diEso4Qyi1YBEKD50iWatlTnnMshn5dYmjtZXt4T4RRblBN
         f0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743782287; x=1744387087;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a93qrZwK32tWAKqaUVMn2Zj8PMNCzPIKT0Jeo46weyc=;
        b=QaVfjNKoQ3fooTS4M7RDvDj0Flbfw9CE/dRc9FeDIKziZ2Bv7eT295uUGwUguSJv3x
         2Do73aUeZoLNnRQVBOyCeVM7xILOiWIhoeHRjFpK0v074kw66FdAznJXei0SexHL72h0
         +30IgW/biBwDQw0xxdpH1/6Dwj+vUvOm6U8If7md/mRzaz+dXhblHS9PopXf6LEJ0D9R
         PHhOBQd9LsTJ32v4FGPr3IOm9wsBEExuETzK6u6NvvUz4vfX6vRS2cAPjHRebgmecs/B
         E9RULlgRpU2zybKuNPa4GhYgGZqHgb+/jN07cZ3C48SmB+j24tRaTF8cmXs9vvxy3Fgc
         CQww==
X-Gm-Message-State: AOJu0YzBNMkJMj1wP3NEj0/7P5teVz9A9Ptb4E+Q/oMi6MFixhNuMojQ
	J27lCIuJviKjl3zHEyqHrKmORHm6Wlgs8Gda5+fqoFbKOzZxyStiIzOQgyZgtQ1YciQXXCGD2JZ
	N
X-Gm-Gg: ASbGncuckc3XhRN2nm9wKIDeg9q50lKwHzQzquKokuhmDGmATpoPz69kAQvQbYzcU58
	6qEedsRvlDOUo5NzE165qhUnaq7D94Uz5pv7BDydard0SaK4OJReu8R9GPRL21x2SDAqmZ+4yQ8
	oW2vlfj5f5ebr5mmgRIhRm8UiHp95DXEVaYestUCOIOyr0w8dltN+ZTfN84VCFzSuFhmB9kbY5H
	2dlmIvEDJ+GHop5U+amJIkysA8JCuLuBrudXlZXvHCqZA6+9HUYzMfcpxMovwWewH74vt8V8rZU
	SMNi1pVWpGLk28mkgkCgjj6VnPy6R/M7sHxetDQg3n1SZK6ga8c87w==
X-Google-Smtp-Source: AGHT+IHhhyMe06/G/7b5OFlGVJdZBNhQ2nVZQf4160FpDxAnIs0B8r+hzHXSzQ9vQoO7qo+JFMo5pQ==
X-Received: by 2002:a17:902:ea09:b0:220:d909:1734 with SMTP id d9443c01a7336-22a8a05a8b4mr48461375ad.14.1743782286775;
        Fri, 04 Apr 2025 08:58:06 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785bffc7sm34104925ad.70.2025.04.04.08.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 08:58:06 -0700 (PDT)
Date: Fri, 04 Apr 2025 08:58:06 -0700 (PDT)
X-Google-Original-Date: Fri, 04 Apr 2025 08:57:49 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 6.15 Merge Window, Part 1
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-e4523e07-f5ae-4f8b-9eec-8422b05700f4@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_085808_673432_6DC1FD5C 
X-CRM114-Status: GOOD (  21.81  )
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
Content-Type: multipart/mixed; boundary="===============6904230933152843500=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6904230933152843500==
Content-Type: text/plain

The following changes since commit 4701f33a10702d5fc577c32434eb62adde0a1ae1:

  Linux 6.14-rc7 (2025-03-16 12:55:17 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.15-mw1

for you to fetch changes up to 3eb64093f533a29d3291a463fd65126bf430ba60:

  Merge tag 'riscv-mw2-6.15-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into for-next (2025-04-03 08:53:19 -0700)

----------------------------------------------------------------
RISC-V Patches for the 6.15 Merge Window, Part 1

* The sub-architecture selection Kconfig system has been cleaned up,
  the documentation has been improved, and various detections have been
  fixed.
* The vector-related extensions dependencies are now validated when
  parsing from device tree and in the DT bindings.
* Misaligned access probing can be overridden via a kernel command-line
  parameter, along with various fixes to misalign access handling.
* Support for relocatable !MMU kernels builds.
* Support for hpge pfnmaps, which should improve TLB utilization.
* Support for runtime constants, which improves the d_hash()
  performance.
* Support for bfloat16, Zicbom, Zaamo, Zalrsc, Zicntr, Zihpm.
* Various fixes, including:
      - We were missing a secondary mmu notifier call when flushing the
	tlb which is required for IOMMU.
      - Fix ftrace panics by saving the registers as expected by ftrace.
      - Fix a couple of stimecmp usage related to cpu hotplug.
      - purgatory_start is now aligned as per the STVEC requirements.
      - A fix for hugetlb when calculating the size of non-present PTEs.

----------------------------------------------------------------
Unless something goes way off the rails I don't have plans for a part 2, this
is very late already.  Aside from that things look clean on my end.

We have a pending semantic merge conflict with -next, specifically 2f4ab3ac10e1
("mm: support tlbbatch flush for a range of PTEs") adds a new "start" parameter
to arch_tlbbatch_add_pending(), while d9be2b9b60497a ("riscv: Call secondary
mmu notifier when flushing the tlb") introduces a "start" local variable.
Alex's suggested fix looks good to me:

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index c25a40aa2fe0..c22d5eb2b185 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -192,10 +192,9 @@ bool arch_tlbbatch_should_defer(struct mm_struct *mm)
 void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
 		struct mm_struct *mm, unsigned long start, unsigned long end)
 {
-	unsigned long start = uaddr & PAGE_MASK;
-
 	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
-	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, start + PAGE_SIZE);
+	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start & PAGE_MASK,
+						    (end & PAGE_MASK) + PAGE_SIZE);
 }

 void arch_flush_tlb_batched_pending(struct mm_struct *mm)


----------------------------------------------------------------
Alexandre Ghiti (11):
      Merge patch series "RISC-V: clarify what some RISCV_ISA* config options do & redo Zbb toolchain dependency"
      riscv: Call secondary mmu notifier when flushing the tlb
      Merge patch series "riscv: Add bfloat16 instruction support"
      Merge patch series "Support SSTC while PM operations"
      riscv: Fix missing __free_pages() in check_vector_unaligned_access()
      Merge patch series "riscv: add support for Zaamo and Zalrsc extensions"
      Merge patch series "riscv: Unaligned access speed probing fixes and skipping"
      Merge patch series "riscv: Add runtime constant support"
      riscv: Fix hugetlb retrieval of number of ptes in case of !present pte
      Merge patch series "Add some validation for vector, vector crypto and fp stuff"
      riscv: Make sure toolchain supports zba before using zba instructions

Andrew Bresticker (1):
      riscv: Support huge pfnmaps

Andrew Jones (8):
      riscv: Annotate unaligned access init functions
      riscv: Fix riscv_online_cpu_vec
      riscv: Fix check_unaligned_access_all_cpus
      riscv: Change check_unaligned_access_speed_all_cpus to void
      riscv: Fix set up of cpu hotplug callbacks
      riscv: Fix set up of vector cpu hotplug callback
      riscv: Add parameter for skipping access speed tests
      Documentation/kernel-parameters: Add riscv unaligned speed parameters

Björn Töpel (1):
      riscv/purgatory: 4B align purgatory_start

Charlie Jenkins (5):
      riscv: tracing: Fix __write_overflow_field in ftrace_partial_regs()
      riscv: Move nop definition to insn-def.h
      riscv: Add runtime constant support
      riscv: Add norvc after .option arch in runtime const
      riscv: Add norvc after .option arch in runtime const

Chin Yik Ming (2):
      riscv: Simplify base extension checks and direct boolean return
      riscv: Fix a comment typo in set_mm_asid()

Clément Léger (6):
      riscv: remove useless pc check in stacktrace handling
      dt-bindings: riscv: add Zaamo and Zalrsc ISA extension description
      riscv: add parsing for Zaamo and Zalrsc extensions
      riscv: hwprobe: export Zaamo and Zalrsc extensions
      RISC-V: KVM: Allow Zaamo/Zalrsc extensions for Guest/VM
      KVM: riscv: selftests: Add Zaamo/Zalrsc extensions to get-reg-list test

Conor Dooley (8):
      RISC-V: clarify what some RISCV_ISA* config options do
      RISC-V: separate Zbb optimisations requiring and not requiring toolchain support
      RISC-V: add vector extension validation checks
      RISC-V: add vector crypto extension validation checks
      RISC-V: add f & d extension validation checks
      dt-bindings: riscv: d requires f
      dt-bindings: riscv: add vector sub-extension dependencies
      dt-bindings: riscv: document vector crypto requirements

Geert Uytterhoeven (2):
      riscv: defconfig: Disable Renesas SoC support
      riscv: Remove duplicate CLINT_TIMER selections

Guo Ren (1):
      riscv: Implement smp_cond_load8/16() with Zawrs

Ignacio Encinas (1):
      selftests: riscv: fix v_exec_initval_nolibc.c

Inochi Amaoto (3):
      dt-bindings: riscv: add bfloat16 ISA extension description
      riscv: add ISA extension parsing for bfloat16 ISA extension
      riscv: hwprobe: export bfloat16 ISA extension

Jinjie Ruan (1):
      riscv: Remove unused TASK_TI_FLAGS

Juhan Jin (1):
      riscv: ftrace: Add parentheses in macro definitions of make_call_t0 and make_call_ra

Masahiro Yamada (1):
      riscv: migrate to the generic rule for built-in DTB

Miquel Sabaté Solà (1):
      riscv: hwprobe: export Zicntr and Zihpm extensions

Nick Hu (2):
      riscv: Add stimecmp save and restore
      clocksource/drivers/timer-riscv: Stop stimecmp when cpu hotplug

Palmer Dabbelt (4):
      Merge tag 'riscv-mw1-6.15-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into for-next
      RISC-V: errata: Use medany for relocatable builds
      Merge patch series "riscv: Relocatable NOMMU kernels"
      Merge tag 'riscv-mw2-6.15-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into for-next

Pu Lehui (2):
      riscv: fgraph: Select HAVE_FUNCTION_GRAPH_TRACER depends on HAVE_DYNAMIC_FTRACE_WITH_ARGS
      riscv: fgraph: Fix stack layout to match __arch_ftrace_regs argument of ftrace_return_to_handler

Samuel Holland (6):
      riscv: Remove duplicate CONFIG_PAGE_OFFSET definition
      riscv: Allow NOMMU kernels to access all of RAM
      riscv: Support CONFIG_RELOCATABLE on NOMMU
      asm-generic: Always define Elf_Rel and Elf_Rela
      riscv: Support CONFIG_RELOCATABLE on riscv32
      riscv: Remove CONFIG_PAGE_OFFSET

Thomas Weißschuh (1):
      riscv: mm: Don't use %pK through printk

Tingbo Liao (1):
      riscv: Fix the __riscv_copy_vec_words_unaligned implementation

Yao Zi (1):
      riscv/kexec_file: Handle R_RISCV_64 in purgatory relocator

Yunhui Cui (4):
      RISC-V: Enable cbo.clean/flush in usermode
      RISC-V: hwprobe: Expose Zicbom extension and its block size
      RISC-V: selftests: Add TEST_ZICBOM into CBO tests
      riscv: print hartid on bringup

Zixian Zeng (1):
      riscv: remove redundant CMDLINE_FORCE check

 Documentation/admin-guide/kernel-parameters.txt    |  16 ++
 Documentation/arch/riscv/hwprobe.rst               |  32 +++
 .../devicetree/bindings/riscv/extensions.yaml      | 149 ++++++++++++
 arch/riscv/Kbuild                                  |   1 -
 arch/riscv/Kconfig                                 |  84 ++++---
 arch/riscv/Kconfig.socs                            |   2 -
 arch/riscv/Makefile                                |   1 -
 arch/riscv/boot/dts/Makefile                       |   2 -
 arch/riscv/configs/defconfig                       |   2 -
 arch/riscv/configs/nommu_k210_defconfig            |   2 +-
 arch/riscv/configs/nommu_k210_sdcard_defconfig     |   2 +-
 arch/riscv/errata/Makefile                         |   6 +-
 arch/riscv/include/asm/arch_hweight.h              |   6 +-
 arch/riscv/include/asm/asm.h                       |   1 +
 arch/riscv/include/asm/bitops.h                    |   4 +-
 arch/riscv/include/asm/checksum.h                  |   3 +-
 arch/riscv/include/asm/cmpxchg.h                   |  38 ++-
 arch/riscv/include/asm/cpufeature.h                |   7 +-
 arch/riscv/include/asm/ftrace.h                    |   7 +-
 arch/riscv/include/asm/hwcap.h                     |   5 +
 arch/riscv/include/asm/hwprobe.h                   |   2 +-
 arch/riscv/include/asm/insn-def.h                  |   3 +
 arch/riscv/include/asm/page.h                      |  27 +--
 arch/riscv/include/asm/pgtable.h                   |  55 ++++-
 arch/riscv/include/asm/ptrace.h                    |  18 +-
 arch/riscv/include/asm/runtime-const.h             | 268 +++++++++++++++++++++
 arch/riscv/include/asm/suspend.h                   |   4 +
 arch/riscv/include/uapi/asm/hwprobe.h              |   9 +
 arch/riscv/include/uapi/asm/kvm.h                  |   2 +
 arch/riscv/kernel/asm-offsets.c                    |   1 -
 arch/riscv/kernel/cpufeature.c                     | 197 +++++++++++----
 arch/riscv/kernel/elf_kexec.c                      |   3 +
 arch/riscv/kernel/ftrace.c                         |   6 +-
 arch/riscv/kernel/jump_label.c                     |   4 +-
 arch/riscv/kernel/mcount.S                         |  24 +-
 arch/riscv/kernel/setup.c                          |   5 -
 arch/riscv/kernel/smp.c                            |   2 +
 arch/riscv/kernel/smpboot.c                        |   4 +
 arch/riscv/kernel/stacktrace.c                     |   2 +-
 arch/riscv/kernel/suspend.c                        |  14 ++
 arch/riscv/kernel/sys_hwprobe.c                    |  15 +-
 arch/riscv/kernel/traps_misaligned.c               |  14 +-
 arch/riscv/kernel/unaligned_access_speed.c         | 242 ++++++++++++-------
 arch/riscv/kernel/vec-copy-unaligned.S             |   2 +-
 arch/riscv/kernel/vendor_extensions.c              |   2 +-
 arch/riscv/kernel/vmlinux.lds.S                    |   3 +
 arch/riscv/kvm/vcpu_onereg.c                       |   4 +
 arch/riscv/lib/csum.c                              |  21 +-
 arch/riscv/lib/strcmp.S                            |   5 +-
 arch/riscv/lib/strlen.S                            |   5 +-
 arch/riscv/lib/strncmp.S                           |   5 +-
 arch/riscv/mm/context.c                            |   2 +-
 arch/riscv/mm/hugetlbpage.c                        |  76 +++---
 arch/riscv/mm/init.c                               |  97 ++++----
 arch/riscv/mm/physaddr.c                           |   2 +-
 arch/riscv/mm/tlbflush.c                           |  37 +--
 arch/riscv/purgatory/entry.S                       |   1 +
 drivers/clocksource/timer-riscv.c                  |   6 +
 include/asm-generic/module.h                       |   8 -
 tools/testing/selftests/kvm/riscv/get-reg-list.c   |   8 +
 tools/testing/selftests/riscv/hwprobe/cbo.c        |  66 ++++-
 .../selftests/riscv/vector/v_exec_initval_nolibc.c |  10 +-
 62 files changed, 1252 insertions(+), 399 deletions(-)
 create mode 100644 arch/riscv/include/asm/runtime-const.h


--===============6904230933152843500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6904230933152843500==--
