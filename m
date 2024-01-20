Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E285C47258
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 14:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=vH38CX1tgtNOK88NdAknMjZcAK/s2IDj36XHKhm3vwQ=; b=LXA
	ezDmLN5Tfwq6VYl4DEoYF7HGy0ItSBfVQkQjxi5yU/pJ+6B/SxEeoMOTMluoo/QBCeScyLo7zAezj
	2SZT5tDIxES7BwAonpaT1RWqCf2qL4cUUyn5oScXieMnveKJu/enxXzOjI7XgV+aN8nz2XPEQF8xS
	bGq7ah/6ZFh2GRQ0VqHEeyOu3W4bKzjKYTB+UH3cNbLDRn+tNB+XjheSXuQEwdnQvt245mjQ9yFvT
	1MchuxWYDkCz84q9dhNavVRGiRgY2r8AfKJSN6/kNkYM1QFBdfkfPSjKRdDVP9PpOSdIHjSBggPEM
	MKvp26qg0NzXpnjq7TwuqsKTtXHXUgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRCht-007zfJ-2b;
	Sat, 20 Jan 2024 14:52:25 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRChn-007zeW-1u
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 14:52:23 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1d70c3c2212so12281625ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 20 Jan 2024 06:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705762332; x=1706367132; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bB8jLeb1KLS0VyyaMfZTJvzeDpZrlycWxHB1cizH4Uw=;
        b=pJe1CRK6lvlz9AcnlJIQDG3vRhmvDeYxhdb6mui+KIJFQUZrKmyHqlEzZcT1x3xDq0
         oDCtkrCi9NjFb0cSu8YhJfA1oltuY2kjOVc0iOnKvWe5Ut6Ven9TKjEHMoc9d7rLcQCl
         CzyQ03mLOHyJuli7J2tjTW3OdZgzemxSVap0Z9gS5fuFMmrvc9lbiIRINtlJOjnBViev
         pPQqhndIUv84xofXF/Bs9DDxpMn1K7TM1lSXlIBMDjROCzVXd30Pf23g4wGDLFLXFdzr
         MjXM3eTrBriGdsiqXWwJOiXHbY/XjRKTU5m6G4tjhpsI6QDUX6q7Wof4yTkVFc4yHQJ7
         BJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705762332; x=1706367132;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bB8jLeb1KLS0VyyaMfZTJvzeDpZrlycWxHB1cizH4Uw=;
        b=qrDgoz06CeWX2ND/kZhUI7/N6+SLGIhDrx200r9jQTKeMXZidMT2elZlb95Lfv4WM5
         0NoBag4Js+9yjD/2W2q3/s+68ACskFIip0CaZ3flfoIegkcu4Wp6Z2CuWECBDIDd0cEP
         0QIF0MmPvNwELxvDo89oARN5qhkBpc+iOp1l2qGUhBt3TM9HkuOEpFC78nUxn4bbfJzN
         iH5YSNsYVjwE9XW7FKuXrge4QvhRGCWApq5Flf5OsuTe2HDxz827TrUftCJ6wM4+ZTMZ
         KPMym2u5ezL9oRudWhMYwpNF0paWAo2C7gC//CUvuRmQQNrJXe2BZDh47i+8TxqdgX4x
         yPuA==
X-Gm-Message-State: AOJu0YzAoTTRQr3xrZ80wDwv3cqZ5a9Ym82VL/Rl6edKEiQprkTEmZd6
	pblIakag4DLtxDFnXgM53iW7SaO/z7nagyjvv0Vy92Lj1sK+nQQn21dLoBiOCBZTNBdK1eTgUL3
	0
X-Google-Smtp-Source: AGHT+IESjxbZyOIhAVHLfOxtqQprf5fHNjZb/74XNE3D+iUNfYduX7P0A4pprughmQDAg97BiI8fNA==
X-Received: by 2002:a17:902:b28a:b0:1d7:193f:3183 with SMTP id u10-20020a170902b28a00b001d7193f3183mr3220688plr.49.1705762331998;
        Sat, 20 Jan 2024 06:52:11 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id a9-20020a656409000000b005ce170c797bsm4619178pgv.87.2024.01.20.06.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jan 2024 06:52:11 -0800 (PST)
Date: Sat, 20 Jan 2024 06:52:11 -0800 (PST)
X-Google-Original-Date: Sat, 20 Jan 2024 06:51:43 PST (-0800)
Subject: [GIT PULL] RISC-V Patches for the 6.8 Merge Window, Part 3
CC: linux-riscv@lists.infradead.org,        linux-kernel@subspace.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-7cf9e456-32a2-4a75-93d5-5b97fb93ad2b@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_065219_843265_488E0D35 
X-CRM114-Status: GOOD (  19.26  )
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
Content-Type: multipart/mixed; boundary="===============2922877712192585544=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2922877712192585544==
Content-Type: text/plain

The following changes since commit cb51bfee7f62a8e26b694f9d84c0041b3e3ccc71:

  Merge patch series "riscv: hwprobe: add Zicond, Zacas and Ztso support" (2024-01-09 20:14:51 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.8-mw3

for you to fetch changes up to 4b60a23c3cb5a974939372c9460bac69f7fbf642:

  Merge branch 'tty-fix' into for-next (2024-01-19 17:26:19 -0800)

----------------------------------------------------------------
RISC-V Patches for the 6.8 Merge Window, Part 3

This includes everything from part 2:

* Support for tuning for systems with fast misaligned accesses.
* Support for SBI-based suspend.
* Support for the new SBI debug console extension.
* The T-Head CMOs now use PA-based flushes.
* Support for enabling the V extension in kernel code.
* Optimized IP checksum routines.
* Various ftrace improvements.
* Support for archrandom, which depends on the Zkr extension.

and then also a pair of fixes for those:

* The build is no longer broken under NET=n, KUNIT=y for ports that
  don't define their own ipv6 checksum.
* The build is no longer broken HVC_RISCV_SBI=y post-merge.

----------------------------------------------------------------
So that's more than a bit embarassing, but probably just a good sign not to try
and merge a bunch of stuff late after some messy holidays.  Those last two
didn't make linux-next at all, and given they're fixing bugs found by
linux-next that's a bit scary.  So no big deal on my end if this is too late.

The last one is particularly clunky, as I've just squashed the fix into a merge
from your tree.  Obviously the right way to do this is to get stuff sorted out
in next ahead of time, but I wasn't sure how to patch things back together
after the fact.  At least this way I think the history builds cleanly, or at
least it does from where I poked around.

I do see more in the diffstat (though not the shortlog).  I spot checked some
of the merged files and they look right to me.

----------------------------------------------------------------
Alexandre Ghiti (3):
      riscv: Use hugepage mappings for vmemmap
      riscv: Add support for BATCHED_UNMAP_TLB_FLUSH
      riscv: Fix build error on rv32 + XIP

Andrew Jones (2):
      riscv: sbi: Introduce system suspend support
      RISC-V: selftests: cbo: Ensure asm operands match constraints

Andy Chiu (8):
      riscv: vector: make Vector always available for softirq context
      riscv: sched: defer restoring Vector context for user
      riscv: lib: vectorize copy_to_user/copy_from_user
      riscv: fpu: drop SR_SD bit checking
      riscv: vector: do not pass task_struct into riscv_v_vstate_{save,restore}()
      riscv: vector: use a mask to write vstate_ctrl
      riscv: vector: use kmem_cache to manage vector context
      riscv: vector: allow kernel-mode Vector with preemption

Anup Patel (4):
      RISC-V: Add stubs for sbi_console_putchar/getchar()
      RISC-V: Add SBI debug console helper routines
      tty/serial: Add RISC-V SBI debug console based earlycon
      RISC-V: Enable SBI based earlycon support

Atish Patra (1):
      tty: Add SBI debug console support to HVC SBI driver

Charlie Jenkins (9):
      riscv: Fix module loading free order
      riscv: Correctly free relocation hashtable on error
      riscv: Fix relocation_hashtable size
      asm-generic: Improve csum_fold
      riscv: Add static key for misaligned accesses
      riscv: Add checksum header
      riscv: Add checksum library
      kunit: Add tests for csum_ipv6_magic and ip_fast_csum
      riscv: lib: Check if output in asm goto supported

Christoph Müllner (5):
      tools: selftests: riscv: Fix compile warnings in hwprobe
      tools: selftests: riscv: Fix compile warnings in cbo
      tools: selftests: riscv: Add missing include for vector test
      tools: selftests: riscv: Fix compile warnings in vector tests
      tools: selftests: riscv: Fix compile warnings in mm tests

Christophe JAILLET (1):
      riscv: Fix an off-by-one in get_early_cmdline()

Conor Dooley (1):
      dt-bindings: riscv: permit numbers in "riscv,isa"

Daniel Henrique Barboza (1):
      dt-bindings: riscv: Document cbop-block-size

Greentime Hu (2):
      riscv: Add support for kernel mode vector
      riscv: Add vector extension XOR implementation

Guo Ren (2):
      riscv: mm: Fixup compat mode boot failure
      riscv: mm: Fixup compat arch_get_mmap_end

Jisheng Zhang (4):
      riscv: introduce RISCV_EFFICIENT_UNALIGNED_ACCESS
      riscv: select DCACHE_WORD_ACCESS for efficient unaligned access HW
      riscv: errata: thead: use riscv_nonstd_cache_ops for CMO
      riscv: errata: thead: use pa based instructions for CMO

Masahiro Yamada (1):
      riscv: add dependency among Image(.gz), loader(.bin), and vmlinuz.efi

Maxim Kochetkov (1):
      riscv: optimize ELF relocation function in riscv

Nathan Chancellor (3):
      riscv: Hoist linker relaxation disabling logic into Kconfig
      riscv: Restrict DWARF5 when building with LLVM to known working versions
      lib/Kconfig.debug: Update AS_HAS_NON_CONST_LEB128 comment and name

Palmer Dabbelt (12):
      Merge patch series "riscv: enable EFFICIENT_UNALIGNED_ACCESS and DCACHE_WORD_ACCESS"
      Merge patch series "riscv: modules: Fix module loading error handling"
      Merge patch series "RISC-V SBI debug console extension support"
      Merge patch series "riscv: errata: thead: use riscv_nonstd_cache_ops for CMO"
      Merge patch series "tools: selftests: riscv: Fix compiler warnings"
      Merge patch series "riscv: mm: Fixup & Optimize COMPAT code"
      Merge patch series "riscv: support kernel-mode Vector"
      Merge patch series "riscv: Add fine-tuned checksum functions"
      Merge patch series "RISC-V: Disable DWARF5 with known broken LLVM versions"
      Merge patch series "riscv: ftrace: Miscellaneous ftrace improvements"
      lib: checksum: Fix build with CONFIG_NET=n
      Merge branch 'tty-fix' into for-next

Samuel Holland (1):
      dt-bindings: riscv: cpus: Clarify mmu-type interpretation

Samuel Ortiz (1):
      RISC-V: Implement archrandom when Zkr is available

Song Shuai (4):
      riscv: select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
      riscv: ftrace: Make function graph use ftrace directly
      riscv: ftrace: Add DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
      samples: ftrace: Add RISC-V support for SAMPLE_FTRACE_DIRECT[_MULTI]

Xiao Wang (1):
      riscv: Optimize hweight API with Zbb extension

 Documentation/admin-guide/devices.txt              |    3 +
 Documentation/admin-guide/sysrq.rst                |   11 +-
 Documentation/arch/x86/boot.rst                    |    2 +-
 .../bindings/net/ethernet-controller.yaml          |    4 +-
 Documentation/devicetree/bindings/riscv/cpus.yaml  |    9 +-
 .../devicetree/bindings/riscv/extensions.yaml      |    2 +-
 .../bindings/serial/fsl,s32-linflexuart.yaml       |    2 +-
 .../bindings/serial/qcom,msm-uartdm.yaml           |   13 +
 .../devicetree/bindings/serial/renesas,sci.yaml    |    2 +-
 .../bindings/serial/snps-dw-apb-uart.yaml          |    1 +
 .../devicetree/bindings/ufs/qcom,ufs.yaml          |    2 +
 Documentation/features/vm/TLB/arch-support.txt     |    2 +-
 MAINTAINERS                                        |   32 +-
 Makefile                                           |    2 +-
 arch/alpha/kernel/srmcons.c                        |   28 +-
 arch/parisc/Kconfig                                |    6 +-
 arch/parisc/include/asm/elf.h                      |   10 +-
 arch/parisc/include/asm/processor.h                |    2 +
 arch/parisc/kernel/processor.c                     |    2 +-
 arch/parisc/kernel/sys_parisc.c                    |    2 +-
 arch/powerpc/include/asm/hvconsole.h               |    4 +-
 arch/powerpc/include/asm/hvsi.h                    |   18 +-
 arch/powerpc/include/asm/opal.h                    |    8 +-
 arch/powerpc/platforms/powernv/opal.c              |   14 +-
 arch/powerpc/platforms/pseries/hvconsole.c         |    4 +-
 arch/riscv/Kconfig                                 |   57 +-
 arch/riscv/Kconfig.errata                          |    1 +
 arch/riscv/Makefile                                |    8 +-
 arch/riscv/configs/defconfig                       |    1 +
 arch/riscv/errata/thead/errata.c                   |   69 +-
 arch/riscv/include/asm/arch_hweight.h              |   78 +
 arch/riscv/include/asm/archrandom.h                |   72 +
 arch/riscv/include/asm/asm-extable.h               |   15 +
 arch/riscv/include/asm/asm-prototypes.h            |   27 +
 arch/riscv/include/asm/bitops.h                    |    4 +-
 arch/riscv/include/asm/checksum.h                  |   93 +
 arch/riscv/include/asm/cpufeature.h                |    2 +
 arch/riscv/include/asm/csr.h                       |    9 +
 arch/riscv/include/asm/entry-common.h              |   17 +
 arch/riscv/include/asm/errata_list.h               |   50 +-
 arch/riscv/include/asm/ftrace.h                    |   18 +-
 arch/riscv/include/asm/pgtable.h                   |    2 +-
 arch/riscv/include/asm/processor.h                 |   43 +-
 arch/riscv/include/asm/sbi.h                       |   19 +
 arch/riscv/include/asm/simd.h                      |   64 +
 arch/riscv/include/asm/switch_to.h                 |    3 +-
 arch/riscv/include/asm/thread_info.h               |    2 +
 arch/riscv/include/asm/tlbbatch.h                  |   15 +
 arch/riscv/include/asm/tlbflush.h                  |    8 +
 arch/riscv/include/asm/vector.h                    |   90 +-
 arch/riscv/include/asm/word-at-a-time.h            |   27 +
 arch/riscv/include/asm/xor.h                       |   68 +
 arch/riscv/kernel/Makefile                         |    1 +
 arch/riscv/kernel/cpufeature.c                     |   90 +-
 arch/riscv/kernel/entry.S                          |    8 +
 arch/riscv/kernel/ftrace.c                         |   30 +-
 arch/riscv/kernel/kernel_mode_vector.c             |  247 ++
 arch/riscv/kernel/mcount-dyn.S                     |  198 +-
 arch/riscv/kernel/module.c                         |   34 +-
 arch/riscv/kernel/pi/cmdline_early.c               |    3 +-
 arch/riscv/kernel/process.c                        |   13 +-
 arch/riscv/kernel/ptrace.c                         |    7 +-
 arch/riscv/kernel/sbi.c                            |   66 +
 arch/riscv/kernel/signal.c                         |    7 +-
 arch/riscv/kernel/suspend.c                        |   44 +
 arch/riscv/kernel/vector.c                         |   53 +-
 arch/riscv/lib/Makefile                            |    6 +
 arch/riscv/lib/csum.c                              |  328 +++
 arch/riscv/lib/riscv_v_helpers.c                   |   45 +
 arch/riscv/lib/uaccess.S                           |   10 +
 arch/riscv/lib/uaccess_vector.S                    |   53 +
 arch/riscv/lib/xor.S                               |   81 +
 arch/riscv/mm/extable.c                            |   31 +
 arch/riscv/mm/init.c                               |   25 +-
 arch/riscv/mm/tlbflush.c                           |   69 +-
 arch/x86/include/asm/acpi.h                        |   14 +
 arch/x86/include/asm/xen/hypervisor.h              |    9 +
 arch/x86/kernel/acpi/boot.c                        |   34 +-
 arch/x86/kernel/signal_64.c                        |    6 +-
 block/blk-mq.c                                     |   75 +-
 drivers/accel/ivpu/ivpu_pm.c                       |    3 -
 drivers/char/virtio_console.c                      |   58 +-
 drivers/firmware/Kconfig                           |    2 +-
 drivers/firmware/qemu_fw_cfg.c                     |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |    5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |    1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |    5 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |    7 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |    6 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   24 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |    5 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   29 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |   18 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |    6 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |    3 +
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   10 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |    1 +
 .../display/dc/dcn35/dcn35_dio_stream_encoder.c    |   10 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |    3 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   22 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   50 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    |   10 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   10 +-
 drivers/gpu/drm/ci/xfails/requirements.txt         |    6 +-
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |    6 +
 drivers/gpu/drm/nouveau/include/nvkm/core/event.h  |    4 +-
 drivers/gpu/drm/nouveau/nouveau_display.c          |    5 +
 drivers/gpu/drm/nouveau/nvkm/core/event.c          |   12 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c     |    6 +-
 drivers/i2c/busses/i2c-designware-common.c         |   16 +-
 drivers/i2c/busses/i2c-ocores.c                    |    4 +-
 drivers/i2c/busses/i2c-pxa.c                       |   76 +-
 drivers/irqchip/irq-gic-v3-its.c                   |   16 +-
 drivers/isdn/capi/capi.c                           |    4 +-
 drivers/md/dm-bufio.c                              |   87 +-
 drivers/md/dm-crypt.c                              |    2 +-
 drivers/md/dm-delay.c                              |  112 +-
 drivers/md/dm-verity-fec.c                         |    4 +-
 drivers/md/dm-verity-target.c                      |   23 +-
 drivers/md/dm-verity.h                             |    2 +-
 drivers/misc/bcm-vk/bcm_vk_tty.c                   |    4 +-
 drivers/mmc/core/sdio_uart.c                       |   21 +-
 drivers/net/bonding/bond_main.c                    |    6 +
 drivers/net/ethernet/amd/pds_core/adminq.c         |    2 +-
 drivers/net/ethernet/amd/pds_core/core.h           |    2 +-
 drivers/net/ethernet/amd/pds_core/dev.c            |    8 +-
 drivers/net/ethernet/amd/pds_core/devlink.c        |    2 +-
 drivers/net/ethernet/broadcom/tg3.c                |   42 +-
 drivers/net/ethernet/broadcom/tg3.h                |    4 +-
 drivers/net/ethernet/cortina/gemini.c              |   45 +-
 drivers/net/ethernet/cortina/gemini.h              |    4 +-
 drivers/net/ethernet/google/gve/gve_main.c         |    8 +-
 drivers/net/ethernet/google/gve/gve_rx.c           |    4 -
 drivers/net/ethernet/google/gve/gve_tx.c           |    4 -
 drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c |    9 +-
 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c    |    2 +-
 .../ethernet/hisilicon/hns3/hns3pf/hclge_main.c    |   33 +-
 .../ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c  |   25 +-
 .../ethernet/hisilicon/hns3/hns3vf/hclgevf_main.h  |    1 +
 .../ethernet/hisilicon/hns3/hns3vf/hclgevf_mbx.c   |    7 +
 drivers/net/ethernet/intel/ice/ice_ddp.c           |  103 +-
 drivers/net/ethernet/intel/ice/ice_dpll.c          |   21 +-
 drivers/net/ethernet/intel/ice/ice_dpll.h          |    1 -
 drivers/net/ethernet/intel/ice/ice_ptp_hw.c        |   54 +
 drivers/net/ethernet/intel/ice/ice_ptp_hw.h        |    2 +
 drivers/net/ethernet/marvell/mvneta.c              |   28 +-
 drivers/net/ethernet/mellanox/mlx5/core/en/ptp.c   |   20 +-
 .../ethernet/mellanox/mlx5/core/en/reporter_rx.c   |    4 +-
 .../net/ethernet/mellanox/mlx5/core/en/tc_tun.c    |   30 +-
 .../net/ethernet/mellanox/mlx5/core/en_ethtool.c   |   13 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_rep.c   |   12 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c    |   60 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_tx.c    |    4 +-
 drivers/net/ethernet/mellanox/mlx5/core/eq.c       |   25 +-
 .../ethernet/mellanox/mlx5/core/eswitch_offloads.c |    3 +-
 .../net/ethernet/mellanox/mlx5/core/irq_affinity.c |   42 -
 .../net/ethernet/mellanox/mlx5/core/lib/clock.c    |    7 +-
 drivers/net/ethernet/mellanox/mlx5/core/pci_irq.c  |    6 +-
 drivers/net/ethernet/mellanox/mlx5/core/pci_irq.h  |    3 +
 .../mellanox/mlx5/core/steering/dr_action.c        |    3 +-
 .../ethernet/mellanox/mlx5/core/steering/dr_send.c |  115 +-
 drivers/net/ethernet/realtek/r8169_main.c          |   42 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |    3 +-
 drivers/net/ethernet/ti/icssg/icssg_prueth.c       |   15 +-
 drivers/net/ipvlan/ipvlan_core.c                   |   41 +-
 drivers/net/macvlan.c                              |    2 +-
 drivers/net/ppp/ppp_synctty.c                      |    6 +-
 drivers/net/usb/hso.c                              |   11 -
 drivers/parisc/power.c                             |    2 +-
 drivers/ptp/ptp_chardev.c                          |    3 +-
 drivers/ptp/ptp_clock.c                            |    5 +-
 drivers/ptp/ptp_private.h                          |    8 +-
 drivers/ptp/ptp_sysfs.c                            |    3 +-
 drivers/s390/char/con3215.c                        |   25 +-
 drivers/s390/char/con3270.c                        |   12 +-
 drivers/scsi/qla2xxx/qla_os.c                      |   12 +-
 drivers/scsi/scsi_debug.c                          |    9 +-
 drivers/scsi/sd.c                                  |   53 +-
 drivers/tty/amiserial.c                            |   16 +-
 drivers/tty/ehv_bytechan.c                         |   18 +-
 drivers/tty/goldfish.c                             |   23 +-
 drivers/tty/hvc/Kconfig                            |    2 +-
 drivers/tty/hvc/hvc_console.c                      |    7 +-
 drivers/tty/hvc/hvc_console.h                      |    8 +-
 drivers/tty/hvc/hvc_dcc.c                          |   32 +-
 drivers/tty/hvc/hvc_iucv.c                         |   18 +-
 drivers/tty/hvc/hvc_opal.c                         |   22 +-
 drivers/tty/hvc/hvc_riscv_sbi.c                    |   46 +-
 drivers/tty/hvc/hvc_rtas.c                         |   11 +-
 drivers/tty/hvc/hvc_udbg.c                         |    9 +-
 drivers/tty/hvc/hvc_vio.c                          |   18 +-
 drivers/tty/hvc/hvc_xen.c                          |   23 +-
 drivers/tty/hvc/hvsi_lib.c                         |   20 +-
 drivers/tty/ipwireless/main.h                      |    3 -
 drivers/tty/nozomi.c                               |   18 -
 drivers/tty/serdev/core.c                          |   15 +-
 drivers/tty/serdev/serdev-ttyport.c                |    3 +-
 drivers/tty/serial/8250/8250_aspeed_vuart.c        |    6 +-
 drivers/tty/serial/8250/8250_bcm2835aux.c          |    6 +-
 drivers/tty/serial/8250/8250_bcm7271.c             |    5 +-
 drivers/tty/serial/8250/8250_core.c                |    5 +-
 drivers/tty/serial/8250/8250_dw.c                  |    6 +-
 drivers/tty/serial/8250/8250_dwlib.c               |   22 +-
 drivers/tty/serial/8250/8250_em.c                  |    5 +-
 drivers/tty/serial/8250/8250_fsl.c                 |    5 +-
 drivers/tty/serial/8250/8250_ingenic.c             |    5 +-
 drivers/tty/serial/8250/8250_ioc3.c                |    5 +-
 drivers/tty/serial/8250/8250_lpc18xx.c             |    6 +-
 drivers/tty/serial/8250/8250_mtk.c                 |    6 +-
 drivers/tty/serial/8250/8250_of.c                  |    5 +-
 drivers/tty/serial/8250/8250_omap.c                |    7 +-
 drivers/tty/serial/8250/8250_pxa.c                 |    6 +-
 drivers/tty/serial/8250/8250_tegra.c               |    6 +-
 drivers/tty/serial/8250/8250_uniphier.c            |    6 +-
 drivers/tty/serial/8250/serial_cs.c                |    6 -
 drivers/tty/serial/Kconfig                         |    5 +-
 drivers/tty/serial/altera_jtaguart.c               |    6 +-
 drivers/tty/serial/altera_uart.c                   |    6 +-
 drivers/tty/serial/amba-pl011.c                    |   11 +-
 drivers/tty/serial/ar933x_uart.c                   |    6 +-
 drivers/tty/serial/atmel_serial.c                  |   22 +-
 drivers/tty/serial/bcm63xx_uart.c                  |    5 +-
 drivers/tty/serial/clps711x.c                      |    6 +-
 drivers/tty/serial/cpm_uart.c                      |    6 +-
 drivers/tty/serial/digicolor-usart.c               |    6 +-
 drivers/tty/serial/earlycon-riscv-sbi.c            |   27 +-
 drivers/tty/serial/esp32_acm.c                     |    5 +-
 drivers/tty/serial/esp32_uart.c                    |    6 +-
 drivers/tty/serial/fsl_linflexuart.c               |    6 +-
 drivers/tty/serial/fsl_lpuart.c                    |    5 +-
 drivers/tty/serial/imx.c                           |   27 +-
 drivers/tty/serial/jsm/jsm.h                       |    5 -
 drivers/tty/serial/jsm/jsm_cls.c                   |   36 -
 drivers/tty/serial/jsm/jsm_neo.c                   |   40 -
 drivers/tty/serial/lantiq.c                        |    6 +-
 drivers/tty/serial/liteuart.c                      |    6 +-
 drivers/tty/serial/lpc32xx_hs.c                    |    6 +-
 drivers/tty/serial/ma35d1_serial.c                 |    5 +-
 drivers/tty/serial/max310x.c                       |    2 +-
 drivers/tty/serial/mcf.c                           |    6 +-
 drivers/tty/serial/meson_uart.c                    |    8 +-
 drivers/tty/serial/milbeaut_usio.c                 |    6 +-
 drivers/tty/serial/mpc52xx_uart.c                  |    7 +-
 drivers/tty/serial/msm_serial.c                    |   25 +-
 drivers/tty/serial/mxs-auart.c                     |   20 +-
 drivers/tty/serial/omap-serial.c                   |    6 +-
 drivers/tty/serial/owl-uart.c                      |    6 +-
 drivers/tty/serial/pic32_uart.c                    |    7 +-
 drivers/tty/serial/qcom_geni_serial.c              |    6 +-
 drivers/tty/serial/rda-uart.c                      |    6 +-
 drivers/tty/serial/rp2.c                           |    1 -
 drivers/tty/serial/sa1100.c                        |    6 +-
 drivers/tty/serial/samsung_tty.c                   |    6 +-
 drivers/tty/serial/sc16is7xx.c                     |  145 +-
 drivers/tty/serial/sccnxp.c                        |   13 +-
 drivers/tty/serial/serial-tegra.c                  |    5 +-
 drivers/tty/serial/serial_core.c                   |   11 +-
 drivers/tty/serial/serial_txx9.c                   |    5 +-
 drivers/tty/serial/sh-sci.c                        |   13 +-
 drivers/tty/serial/sifive.c                        |   10 +-
 drivers/tty/serial/sprd_serial.c                   |    6 +-
 drivers/tty/serial/st-asc.c                        |    6 +-
 drivers/tty/serial/stm32-usart.c                   |    6 +-
 drivers/tty/serial/sunhv.c                         |    6 +-
 drivers/tty/serial/sunplus-uart.c                  |    6 +-
 drivers/tty/serial/sunsab.c                        |   22 +-
 drivers/tty/serial/sunsu.c                         |    6 +-
 drivers/tty/serial/sunzilog.c                      |    6 +-
 drivers/tty/serial/tegra-tcu.c                     |    6 +-
 drivers/tty/serial/timbuart.c                      |    6 +-
 drivers/tty/serial/uartlite.c                      |   20 +-
 drivers/tty/serial/ucc_uart.c                      |   34 +-
 drivers/tty/serial/xilinx_uartps.c                 |    7 +-
 drivers/tty/sysrq.c                                |   19 +-
 drivers/tty/tty_io.c                               |   18 +-
 drivers/tty/tty_port.c                             |   18 +-
 drivers/tty/vt/consolemap.c                        |    2 +-
 drivers/tty/vt/keyboard.c                          |   10 +-
 drivers/ufs/core/ufs-mcq.c                         |    5 +-
 drivers/vdpa/vdpa_sim/vdpa_sim_blk.c               |    4 +-
 drivers/vhost/vdpa.c                               |    1 -
 drivers/virtio/virtio_pci_common.c                 |    6 +-
 drivers/virtio/virtio_pci_modern_dev.c             |    7 +-
 drivers/xen/events/events_2l.c                     |    8 +-
 drivers/xen/events/events_base.c                   |  576 ++--
 drivers/xen/events/events_internal.h               |    1 -
 drivers/xen/pcpu.c                                 |   22 +
 drivers/xen/xen-front-pgdir-shbuf.c                |   34 +-
 fs/bcachefs/backpointers.c                         |   10 +-
 fs/bcachefs/bcachefs.h                             |    2 +-
 fs/bcachefs/btree_iter.c                           |    2 -
 fs/bcachefs/btree_key_cache.c                      |   37 +-
 fs/bcachefs/btree_key_cache_types.h                |   34 +
 fs/bcachefs/btree_trans_commit.c                   |  169 +-
 fs/bcachefs/btree_types.h                          |   35 +-
 fs/bcachefs/btree_update_interior.c                |   30 -
 fs/bcachefs/btree_update_interior.h                |    1 -
 fs/bcachefs/data_update.c                          |   28 +
 fs/bcachefs/disk_groups.c                          |    4 +-
 fs/bcachefs/ec.c                                   |   16 +-
 fs/bcachefs/fs-io-pagecache.c                      |    2 +-
 fs/bcachefs/fs-io-pagecache.h                      |    2 +-
 fs/bcachefs/fs.c                                   |    8 +-
 fs/bcachefs/fsck.c                                 |    2 +-
 fs/bcachefs/inode.c                                |    8 +-
 fs/bcachefs/io_write.c                             |    2 +-
 fs/bcachefs/journal.c                              |   31 -
 fs/bcachefs/journal.h                              |   98 -
 fs/bcachefs/journal_io.c                           |    7 +
 fs/bcachefs/journal_reclaim.c                      |   42 +-
 fs/bcachefs/journal_types.h                        |   26 -
 fs/bcachefs/six.c                                  |    7 +-
 fs/bcachefs/subvolume_types.h                      |    2 +-
 fs/bcachefs/trace.h                                |   11 +-
 fs/bcachefs/xattr.c                                |    9 +
 fs/btrfs/ctree.c                                   |    2 +-
 fs/btrfs/delayed-ref.c                             |    4 +-
 fs/btrfs/extent-tree.c                             |   25 +-
 fs/btrfs/extent-tree.h                             |    3 +-
 fs/btrfs/inode.c                                   |    7 +
 fs/btrfs/ioctl.c                                   |   10 +-
 fs/btrfs/qgroup.c                                  |   10 +-
 fs/btrfs/raid-stripe-tree.c                        |    2 +-
 fs/btrfs/scrub.c                                   |   10 +-
 fs/btrfs/volumes.c                                 |    6 +-
 fs/btrfs/zoned.c                                   |    7 -
 fs/nfsd/cache.h                                    |    4 +-
 fs/nfsd/nfs4state.c                                |    2 +-
 fs/nfsd/nfscache.c                                 |   87 +-
 fs/nfsd/nfssvc.c                                   |   14 +-
 fs/overlayfs/params.c                              |   11 +-
 fs/overlayfs/util.c                                |    2 +-
 fs/smb/client/cifs_spnego.c                        |    4 +-
 fs/smb/client/connect.c                            |    6 +
 fs/smb/client/sess.c                               |   22 +-
 fs/smb/client/smb2transport.c                      |    5 +-
 fs/xfs/Kconfig                                     |    2 +-
 fs/xfs/libxfs/xfs_alloc.c                          |   27 +-
 fs/xfs/libxfs/xfs_defer.c                          |   28 +-
 fs/xfs/libxfs/xfs_defer.h                          |    2 +-
 fs/xfs/libxfs/xfs_inode_buf.c                      |    3 +
 fs/xfs/xfs_inode_item_recover.c                    |   46 +-
 fs/xfs/xfs_log.c                                   |   23 +-
 fs/xfs/xfs_log_recover.c                           |    2 +-
 fs/xfs/xfs_reflink.c                               |    1 +
 include/asm-generic/checksum.h                     |    6 +-
 include/linux/amba/serial.h                        |   28 +-
 include/linux/bpf.h                                |   10 +-
 include/linux/cpuhotplug.h                         |    1 +
 include/linux/export-internal.h                    |    4 +-
 include/linux/hrtimer.h                            |    4 +-
 include/linux/mdio.h                               |    2 +-
 include/linux/perf_event.h                         |   13 +-
 include/linux/serdev.h                             |    8 +-
 include/linux/stackleak.h                          |    6 +
 include/linux/tty.h                                |   19 +-
 include/linux/tty_driver.h                         |    9 +-
 include/linux/tty_port.h                           |    8 +-
 include/linux/virtio_console.h                     |   38 -
 include/linux/virtio_pci_modern.h                  |    7 -
 include/net/netfilter/nf_tables.h                  |    4 +-
 include/net/tc_act/tc_ct.h                         |    9 +
 include/uapi/linux/btrfs_tree.h                    |   24 +-
 include/uapi/linux/virtio_pci.h                    |   11 +
 include/xen/events.h                               |    8 +-
 io_uring/fdinfo.c                                  |    9 +-
 io_uring/sqpoll.c                                  |   12 +-
 kernel/audit_watch.c                               |    2 +-
 kernel/bpf/core.c                                  |    8 +-
 kernel/bpf/verifier.c                              |   87 +-
 kernel/cgroup/cgroup.c                             |   12 -
 kernel/cpu.c                                       |    8 +-
 kernel/events/core.c                               |   17 +
 kernel/futex/core.c                                |    9 +-
 kernel/sched/fair.c                                |  161 +-
 kernel/sys.c                                       |    4 +
 kernel/time/hrtimer.c                              |   33 +-
 lib/Kconfig.debug                                  |   12 +-
 lib/checksum_kunit.c                               |  286 +-
 lib/zstd/common/fse_decompress.c                   |    2 +-
 mm/damon/core.c                                    |    2 +-
 mm/damon/sysfs-schemes.c                           |    5 +
 mm/damon/sysfs.c                                   |    6 +-
 mm/filemap.c                                       |    2 +-
 mm/huge_memory.c                                   |   16 +-
 mm/ksm.c                                           |    2 +-
 mm/memcontrol.c                                    |    3 +-
 mm/userfaultfd.c                                   |    2 +-
 mm/util.c                                          |   10 +
 net/bluetooth/rfcomm/tty.c                         |    2 +-
 net/bridge/netfilter/nf_conntrack_bridge.c         |    2 +-
 net/core/dev.c                                     |    4 +-
 net/core/gso_test.c                                |   14 +-
 net/ipv4/inet_hashtables.c                         |    2 +-
 net/mptcp/pm_netlink.c                             |    5 +-
 net/mptcp/protocol.c                               |   11 +-
 net/mptcp/sockopt.c                                |    3 +
 net/ncsi/ncsi-aen.c                                |    5 -
 net/netfilter/ipset/ip_set_core.c                  |   14 +-
 net/netfilter/nf_tables_api.c                      |   60 +-
 net/netfilter/nft_byteorder.c                      |    5 +-
 net/netfilter/nft_meta.c                           |    2 +-
 net/netfilter/nft_set_rbtree.c                     |    2 -
 net/sched/act_ct.c                                 |    3 +
 net/tipc/netlink_compat.c                          |    1 +
 net/unix/af_unix.c                                 |    9 +-
 samples/ftrace/ftrace-direct-modify.c              |   35 +
 samples/ftrace/ftrace-direct-multi-modify.c        |   41 +
 samples/ftrace/ftrace-direct-multi.c               |   25 +
 samples/ftrace/ftrace-direct-too.c                 |   28 +
 samples/ftrace/ftrace-direct.c                     |   24 +
 scripts/Makefile.lib                               |    4 +-
 scripts/gcc-plugins/latent_entropy_plugin.c        |    4 +-
 scripts/gcc-plugins/randomize_layout_plugin.c      |   10 -
 scripts/kconfig/symbol.c                           |   14 +-
 scripts/mod/modpost.c                              |    6 +-
 sound/pci/hda/cs35l56_hda_i2c.c                    |    4 +
 sound/pci/hda/hda_intel.c                          |    3 +
 sound/pci/hda/patch_realtek.c                      |   29 +-
 tools/power/x86/turbostat/turbostat.c              | 3074 ++++++++++----------
 tools/testing/selftests/bpf/progs/verifier_cfg.c   |   62 +
 .../testing/selftests/bpf/progs/verifier_loops1.c  |    9 +-
 .../selftests/bpf/progs/verifier_precision.c       |   40 +
 tools/testing/selftests/bpf/verifier/calls.c       |    6 +-
 tools/testing/selftests/bpf/verifier/ld_imm64.c    |    8 +-
 tools/testing/selftests/bpf/xskxceiver.c           |   19 +-
 tools/testing/selftests/mm/.gitignore              |    1 +
 tools/testing/selftests/mm/pagemap_ioctl.c         |   23 +-
 tools/testing/selftests/mm/run_vmtests.sh          |    3 +
 tools/testing/selftests/net/mptcp/mptcp_join.sh    |    2 +-
 tools/testing/selftests/riscv/hwprobe/cbo.c        |   24 +-
 tools/testing/selftests/riscv/hwprobe/hwprobe.c    |    4 +-
 tools/testing/selftests/riscv/mm/mmap_test.h       |    3 +
 .../selftests/riscv/vector/v_initval_nolibc.c      |    2 +-
 .../selftests/riscv/vector/vstate_exec_nolibc.c    |    3 +
 .../testing/selftests/riscv/vector/vstate_prctl.c  |    4 +-
 443 files changed, 7415 insertions(+), 4420 deletions(-)
 create mode 100644 arch/riscv/include/asm/arch_hweight.h
 create mode 100644 arch/riscv/include/asm/archrandom.h
 create mode 100644 arch/riscv/include/asm/checksum.h
 create mode 100644 arch/riscv/include/asm/simd.h
 create mode 100644 arch/riscv/include/asm/tlbbatch.h
 create mode 100644 arch/riscv/include/asm/xor.h
 create mode 100644 arch/riscv/kernel/kernel_mode_vector.c
 create mode 100644 arch/riscv/lib/csum.c
 create mode 100644 arch/riscv/lib/riscv_v_helpers.c
 create mode 100644 arch/riscv/lib/uaccess_vector.S
 create mode 100644 arch/riscv/lib/xor.S
 create mode 100644 fs/bcachefs/btree_key_cache_types.h
 delete mode 100644 include/linux/virtio_console.h


--===============2922877712192585544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2922877712192585544==--
