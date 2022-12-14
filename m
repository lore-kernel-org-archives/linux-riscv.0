Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68ACDC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Dec 2022 18:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=84Vv3XjJq3+KygIgbDCXHnrUHxGwO0cndfAnt7+nyuM=; b=H2b6tPweVkJ0Os
	OUQ06wk1PQRZ7HSpimGPXjaYJtzDXa45MMGh5td78xA8DfKE30vYNVJCHGEcqw0WwHrHlRFbUIT+d
	emg8ljIom+C6A1aemRUo4534mMSsPzSONFhvRYnBCSafhibNAQ/MO1lwXyOpb9QMiYjN+pbHxQ3CF
	1Z2qzbo9LgnyjabMFlVe8/FOHdZ5G63YXf1l5GSqRLUtSFzyFKPfWs4fn+V4WSK5O2i4dlpF4bK/s
	1oxcuChxY2vprsCRkqVf/RA6SwTYIJ+qtEegEym3ExA/49+BnFDXpH+XtpXoHNoNrv54786aa2Y60
	IegrlOiybHfqgcGM0Qeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Wfx-001k9A-MV; Wed, 14 Dec 2022 18:40:17 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Wfu-001k2P-Rg
	for linux-riscv@lists.infradead.org; Wed, 14 Dec 2022 18:40:16 +0000
Received: by mail-pg1-x530.google.com with SMTP id 142so2590157pga.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Dec 2022 10:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28v+Usm1lZe3hhqKtgjE2II+AFu+GpCD77DgUFeOlTo=;
        b=uj2KhMW5T9Y8LymkemgmORUk4ErSPJC7zYT17cudI++S9qmLQiqnl/odKzLqIyIUEe
         mgJIkczhK90wcXNCxBA2VItbHP2Yk+CwxkYyYNPccYafV1OZhbv3yffJFJDluFHtXqhH
         TnrXyPgltxFoiOdTJXUhXoYaLdnuF3Nb+NTotp53C45rwk36P1Ql7bHXg4LXHkv8k3Vq
         Zw7EOtV1e7E3PzOSgOWVht9ecO51OyEW5JyGV1iMP263N3N2+77T05EgvMoVKUPGGv8M
         E/oSwcQGKCuDnznbpZD0QUkDfycXcZ/68S6RJtJ5Lbm0WcH8B5h14bu9VUOeDFyuZ5JG
         sM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28v+Usm1lZe3hhqKtgjE2II+AFu+GpCD77DgUFeOlTo=;
        b=UuNHvPgZmJJK+OSu/ZV4ntKTVfX8ULTDU4RkzwhPuo89TWQU+srtr6IywhsT0H7SUD
         p2fYlVLvP/ao2eKnUvy4T7P13luHZ58YvsuZZbOaNfIwueVWFKBZsTpwGYI3N6W3iK/a
         Uvxtjvpv5b8MJuvDOEks97nkbTgUkOvyKNObvbo5CMxmk6Q0yE5mNypIsclfRMrZ1cZv
         kOwk9A4uZD0QJdGFi4Dz77blSeGSaYiQBN50CXXBNk802tvLTTG2uCYY9kxx6iuDEYta
         YCZh8hN5FJIz6UoMDxMym7YDpKz4zXEhT59KKG3UwjQPuTS9vCxyK6LunX6SG/oBxdZV
         /R+w==
X-Gm-Message-State: ANoB5pm+rDJve19xGGooBnf7YXEwxP66PNsMlcG+fak97V6CwFb5k1sp
	oXEVaHtA+LEbfI+/+1HYXsrk78j4de6H9r3c
X-Google-Smtp-Source: AA0mqf6LQd3O6KXpgz/F2rAfxr3r/Fp9AsCwkHSPl82E/frKyC+4pwLiX+ImCYPqlwzLlDXzri4xbg==
X-Received: by 2002:a62:17cf:0:b0:577:50c4:6dbe with SMTP id 198-20020a6217cf000000b0057750c46dbemr25180361pfx.4.1671043206751;
        Wed, 14 Dec 2022 10:40:06 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id q8-20020aa78428000000b0057627521e82sm168876pfn.195.2022.12.14.10.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 10:40:05 -0800 (PST)
Date: Wed, 14 Dec 2022 10:40:05 -0800 (PST)
X-Google-Original-Date: Wed, 14 Dec 2022 10:39:59 PST (-0800)
Subject: [GIT PULL] RISC-V Patches for the 6.2 Merge Window, Part 1
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-f76eb33c-7cc1-426f-8f29-37f6bb78baec@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_104014_929509_07469753 
X-CRM114-Status: GOOD (  23.08  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.2-mw1

for you to fetch changes up to 6e66e96e31b81fb08075d18a3e2c201f1e2171da:

  Merge patch series "Documentation: RISC-V: patch-acceptance changes" (2022-12-13 09:38:30 -0800)

----------------------------------------------------------------
RISC-V Patches for the 6.2 Merge Window, Part 1

* Support for the T-Head PMU via the perf subsystem.
* ftrace support for rv32.
* Support for non-volatile memory devices.
* Various fixes and cleanups.

----------------------------------------------------------------
I didn't have a part 2 planned, but I just stumbled into a build issue with
the Arm LPAE IOMMU being enabled on rv32, which is worked around via
https://lore.kernel.org/r/20221214180409.7354-1-palmer@rivosinc.com/ .
Anything would be a fix, though, as I'm essentially pretending we're in RCs
aside from what's here.

I've sent the diffstat against v6.1-rc1, as targeting a recent master produces
something huge (though still a reasonable shortlog).  I'm not entirely sure
what's going on there: I have some old merge bases (due to old patch sets) so
hopefully that's the problem, but it's also my first time seriously using b4 so
sorry if I've screwed something up.  The only intentionally suspect thing I've
done is include 5c20a3a9df19 ("RISC-V: Fix compilation without
RISCV_ISA_ZICBOM") as it fixes a build issue in the following patch set and
didn't land via the usual flow, but I think that's the cleanest way to do it as
the patch was already directly on top of rc1.

I'm seeing one merge conflict, here's my resolution if it helps any:

@@@ -161,7 -161,7 +163,8 @@@ CONFIG_VIRTIO_MMIO=
  CONFIG_RPMSG_CHAR=y
  CONFIG_RPMSG_CTRL=y
  CONFIG_RPMSG_VIRTIO=y
 +CONFIG_LIBNVDIMM=y
+ CONFIG_ARCH_R9A07G043=y
  CONFIG_EXT4_FS=y
  CONFIG_EXT4_FS_POSIX_ACL=y
  CONFIG_EXT4_FS_SECURITY=y

----------------------------------------------------------------
Alexandre Ghiti (1):
      riscv: Fix P4D_SHIFT definition for 3-level page table mode

Andrew Bresticker (1):
      RISC-V: Fix unannoted hardirqs-on in return to userspace slow-path

Andrew Jones (9):
      RISC-V: Fix compilation without RISCV_ISA_ZICBOM
      riscv: Don't duplicate __ALTERNATIVE_CFG in __ALTERNATIVE_CFG_2
      riscv: alternatives: Don't name unused macro parameters
      riscv: alternatives: Drop the underscores from the assembly macro names
      riscv: Don't duplicate _ALTERNATIVE_CFG* macros
      RISC-V: Improve use of isa2hwcap[]
      RISC-V: Introduce riscv_isa_extension_check
      RISC-V: Ensure Zicbom has a valid block size
      riscv: Apply a static assert to riscv_isa_ext_id

Anup Patel (3):
      RISC-V: Fix MEMREMAP_WB for systems with Svpbmt
      RISC-V: Implement arch specific PMEM APIs
      RISC-V: Enable PMEM drivers

Binglei Wang (1):
      riscv: add riscv rethook implementation

Cleo John (1):
      riscv: fix styling in ucontext header

Conor Dooley (4):
      RISC-V: enable sparsemem by default for defconfig
      irqchip/sifive-plic: remove user selectability of SIFIVE_PLIC
      irqchip/riscv-intc: remove user selectability of RISCV_INTC
      RISC-V: stop selecting SIFIVE_PLIC at the SoC level

Guo Ren (3):
      riscv: stacktrace: Fixup ftrace_graph_ret_addr retp argument
      riscv: stacktrace: Make walk_stackframe cross pt_regs frame
      riscv: Fixup compile error with !MMU

Hal Feng (1):
      RISC-V: defconfig: Enable CONFIG_SERIAL_8250_DW

Heiko Stuebner (2):
      RISC-V: Cache SBI vendor values
      drivers/perf: riscv_pmu_sbi: add support for PMU variant on T-Head C9xx cores

Heinrich Schuchardt (1):
      riscv/vdso: typo therefor

Jamie Iles (4):
      RISC-V: use REG_S/REG_L for mcount
      RISC-V: reduce mcount save space on RV32
      RISC-V: preserve a1 in mcount
      RISC-V: enable dynamic ftrace for RV32I

Jinyu Tang (1):
      riscv: support update_mmu_tlb()

Jisheng Zhang (3):
      riscv: remove special treatment for the link order of head.o
      riscv: fix race when vmap stack overflow
      riscv: boot: add zstd support

Lad Prabhakar (1):
      riscv: Kconfig: Enable cpufreq kconfig menu

Li Huafei (2):
      RISC-V: kexec: Fix memory leak of fdt buffer
      RISC-V: kexec: Fix memory leak of elf header buffer

Liu Shixin (2):
      riscv: Enable HAVE_ARCH_HUGE_VMAP for 64BIT
      riscv: Enable HAVE_ARCH_HUGE_VMALLOC for 64BIT

Palmer Dabbelt (17):
      riscv_pmu_sbi: add support for PMU variant on T-Head C9xx cores
      Merge patch series "RISC-V: Dynamic ftrace support for RV32I"
      Merge patch series "Support VMCOREINFO export for RISCV64"
      Merge patch "RISC-V: Fix unannoted hardirqs-on in return to userspace slow-path"
      Merge patch series "Add PMEM support for RISC-V"
      Merge patch series "RISC-V interrupt controller select cleanup"
      Merge patch series "riscv: Fix crash during early errata patching"
      Merge patch series "RISC-V: Ensure Zicbom has a valid block size"
      Merge patch series "riscv: alternative-macros.h cleanups"
      RISC-V: Align the shadow stack
      RISC-V: Add some comments about the shadow and overflow stacks
      Merge patch series "RISC-V: Align the shadow stack"
      Documentation: RISC-V: Fix a typo in patch-acceptance
      Documentation: RISC-V: Allow patches for non-standard behavior
      Documentation: RISC-V: Mention the UEFI Standards
      Documentation: RISC-V: patch-acceptance: s/implementor/implementer
      Merge patch series "Documentation: RISC-V: patch-acceptance changes"

Qinglin Pan (1):
      riscv: mm: call best_map_size many times during linear-mapping

Samuel Holland (2):
      riscv: Fix crash during early errata patching
      riscv: Move cast inside kernel_mapping_[pv]a_to_[vp]a

Sergey Matyukevich (1):
      riscv: mm: notify remote harts about mmu cache updates

Tong Tiangen (2):
      riscv/mm: hugepage's PG_dcache_clean flag is only set in head page
      riscv/mm: add arch hook arch_clear_hugepage_flags

Xianting Tian (2):
      RISC-V: Add arch_crash_save_vmcoreinfo support
      Documentation: kdump: describe VMCOREINFO export for RISCV64

 Documentation/admin-guide/kdump/vmcoreinfo.rst     | 29 +++++++
 .../features/vm/huge-vmap/arch-support.txt         |  2 +-
 Documentation/riscv/patch-acceptance.rst           | 22 +++--
 arch/riscv/Kconfig                                 | 19 +++--
 arch/riscv/Kconfig.erratas                         | 13 +++
 arch/riscv/Kconfig.socs                            |  5 --
 arch/riscv/boot/Makefile                           |  3 +
 arch/riscv/configs/defconfig                       |  3 +
 arch/riscv/errata/thead/errata.c                   | 19 +++++
 arch/riscv/include/asm/alternative-macros.h        | 99 +++++++---------------
 arch/riscv/include/asm/asm.h                       |  1 +
 arch/riscv/include/asm/cacheflush.h                | 15 ++--
 arch/riscv/include/asm/errata_list.h               | 16 +++-
 arch/riscv/include/asm/hugetlb.h                   |  6 ++
 arch/riscv/include/asm/hwcap.h                     |  3 +-
 arch/riscv/include/asm/io.h                        |  5 ++
 arch/riscv/include/asm/kexec.h                     |  5 ++
 arch/riscv/include/asm/kprobes.h                   |  2 -
 arch/riscv/include/asm/mmu.h                       |  2 +
 arch/riscv/include/asm/page.h                      | 18 ++--
 arch/riscv/include/asm/pgtable-64.h                |  6 +-
 arch/riscv/include/asm/pgtable.h                   |  5 +-
 arch/riscv/include/asm/sbi.h                       |  5 ++
 arch/riscv/include/asm/tlbflush.h                  | 18 ++++
 arch/riscv/include/asm/vdso.h                      |  2 +-
 arch/riscv/include/asm/vmalloc.h                   | 18 ++++
 arch/riscv/include/uapi/asm/ucontext.h             | 12 ++-
 arch/riscv/kernel/Makefile                         |  1 +
 arch/riscv/kernel/cpu.c                            | 30 ++++++-
 arch/riscv/kernel/cpufeature.c                     | 43 +++++++---
 arch/riscv/kernel/crash_core.c                     | 21 +++++
 arch/riscv/kernel/elf_kexec.c                      | 14 +++
 arch/riscv/kernel/entry.S                          | 34 +++++---
 arch/riscv/kernel/mcount.S                         | 44 +++++-----
 arch/riscv/kernel/probes/Makefile                  |  2 +-
 arch/riscv/kernel/probes/kprobes.c                 | 13 ---
 arch/riscv/kernel/probes/rethook.c                 | 27 ++++++
 arch/riscv/kernel/probes/rethook.h                 |  8 ++
 .../{kprobes_trampoline.S => rethook_trampoline.S} |  6 +-
 arch/riscv/kernel/signal.c                         | 34 +++++---
 arch/riscv/kernel/stacktrace.c                     | 11 ++-
 arch/riscv/kernel/traps.c                          | 30 ++++++-
 arch/riscv/mm/Makefile                             |  2 +
 arch/riscv/mm/cacheflush.c                         | 45 ++++++++++
 arch/riscv/mm/context.c                            | 10 +++
 arch/riscv/mm/dma-noncoherent.c                    | 41 ---------
 arch/riscv/mm/init.c                               | 25 +++---
 arch/riscv/mm/pgtable.c                            | 83 ++++++++++++++++++
 arch/riscv/mm/physaddr.c                           |  2 +-
 arch/riscv/mm/pmem.c                               | 21 +++++
 arch/riscv/mm/tlbflush.c                           | 28 +++---
 drivers/irqchip/Kconfig                            | 21 +----
 drivers/perf/riscv_pmu_sbi.c                       | 34 +++++---
 scripts/head-object-list.txt                       |  1 -
 54 files changed, 684 insertions(+), 300 deletions(-)
 create mode 100644 arch/riscv/kernel/crash_core.c
 create mode 100644 arch/riscv/kernel/probes/rethook.c
 create mode 100644 arch/riscv/kernel/probes/rethook.h
 rename arch/riscv/kernel/probes/{kprobes_trampoline.S => rethook_trampoline.S} (94%)
 create mode 100644 arch/riscv/mm/pgtable.c
 create mode 100644 arch/riscv/mm/pmem.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
