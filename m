Return-Path: <SRS0=eKgb=H4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3FA9C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Feb 2021 15:40:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5052A64EED
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Feb 2021 15:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5052A64EED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:MIME-Version:
	Cc:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Message-ID:To:From:Subject:Date:Reply-To:Content-Transfer-Encoding:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4Lp+Ns6WX5mAAjY5U8kxSuuN2/tw0RV/Qf7KuYlqeTA=; b=QznYtHpXoHZODY+pYRhxMhepJ3
	J67kNUmNofAal2aIF6mEI73ZIAhagzzsBb47/XP/0N5ERUdMaLpi+fgTRJfD7p6iHOg9gc7HqAyv/
	PAnoZA6X02OCgLbnmMIW7YGPPCzP2Cl55Cy9bHzvj0NveBS4yucwqzy+UrJ4i2QizJA+wovlHrRV7
	RYAAe4NvrtZLnDZZgMXwKmOZwHUdRZV2F3PlRxPGdFpjv3HoqyB2gJD93FhrOIe1fSisf0FPYc1ac
	AoJDsl/EUh7zCqhLn7cx/3FCmmhVacyqjk5AD9raOJkZUKAqCQg0t77fnV1Jbiv0r481d0NJvsV7z
	1U8zKhlw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFfDZ-00062d-NF; Fri, 26 Feb 2021 15:39:49 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFfDW-000620-9h
 for linux-riscv@lists.infradead.org; Fri, 26 Feb 2021 15:39:47 +0000
Received: by mail-pf1-x432.google.com with SMTP id r5so6464685pfh.13
 for <linux-riscv@lists.infradead.org>; Fri, 26 Feb 2021 07:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=a62UGN6nuLCBw5kbxfu+mOF0axpW0xIBvD2Q50Sh2ek=;
 b=BMXny/tacBcad3UJc61+sgVgyTIFzIUOsZn7ZfZ/u6IcLb2u/PUpLD9ocWA4BHrUWp
 2CtxITVhhLaBDzUyJpO0tFXdixcigjtqNhGliQM0sdkYZAQFjR4NKr304Qs7qVi2oJcZ
 xEF+gaxE5DhnPI9eM22XjLETs7bX2MjWzlZHcNmATLmBr0enMjZiaRKXqqMMG/xmfpmd
 J5afHSVn5ISOS8buz/vV3ZuP7jJ+zcrTVMfZ5cV+AItokHVjkHAtzTL/PQ9xgM5d66Y6
 MXLFs/x3MMcW6pYopbI+WC3PtlyeMvAuLvftnb57Es+Dgfq1bQ3u/I4MQd6bcAoNMUzA
 fw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=a62UGN6nuLCBw5kbxfu+mOF0axpW0xIBvD2Q50Sh2ek=;
 b=rlxd5cMmkBTxD6vnfGkqKDT7kCwMymxpDcm4tIwaoXLPKxFqy1zkifw66jCltt8v2g
 K5lUMsOgx7p3t3lLVifOsWrXfKmXXG40JCFMyePfx307a0ouFzHGLMwDYoi6YYd/6GPp
 bQEw/ySPilSTExBnlMdqlREl9VcMgnLW80Thazo+op4OdvrwBPNz19/Uaho/510NwIef
 YyKSQtnmkfwKNCWd1Acy2xxr1zb3sQ5wmTN4DVdUEBYj1eLs7lEWR80s0oiV3rEQuR8l
 dq6KrH4U7A8mzYiniRB5bsUL5D+wt8p01DR+0zlBdc/924EwvnsnyPCAyzG0BXBHwb5j
 rDxg==
X-Gm-Message-State: AOAM531atYyE/+xd6d7nLI0YwLSSwSVzJ75JgHq88BuAcTPhl3hDn8b6
 LKpUPQc+yaqvPNZgb3WXMfdOqa1dKJEijrBg
X-Google-Smtp-Source: ABdhPJze6eWRiK8IIfPywvHEcYpEk18V7K+AWLFZbRCAz+zATXqUpUO0WKCp4A72dP5Kk55BjkCf9Q==
X-Received: by 2002:a65:480c:: with SMTP id h12mr3358780pgs.169.1614353983089; 
 Fri, 26 Feb 2021 07:39:43 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u128sm10510941pfc.192.2021.02.26.07.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 07:39:42 -0800 (PST)
Date: Fri, 26 Feb 2021 07:39:42 -0800 (PST)
X-Google-Original-Date: Fri, 26 Feb 2021 07:39:40 PST (-0800)
Subject: [GIT PULL] RISC-V Patches for the 5.12 Merge Window
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-fc1ac1f4-4558-4cfc-aef5-bc486eed7953@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_103946_479694_04AB1A35 
X-CRM114-Status: GOOD (  24.09  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0826781451233072456=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0826781451233072456==
Content-Type: text/plain

The following changes since commit e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62:

  Linux 5.11-rc2 (2021-01-03 15:55:30 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.12-mw0

for you to fetch changes up to d7fbcf40df86bb67193d9faf52138fc1202decb2:

  riscv: Improve kasan population by using hugepages when possible (2021-02-22 18:54:17 -0800)

----------------------------------------------------------------
RISC-V Patches for the 5.12 Merge Window

I have a handful of new RISC-V related patches for this merge window:

* A check to ensure drivers are properly using uaccess.  This isn't
  manifesting with any of the drivers I'm currently using, but may catch
  errors in new drivers.
* Some preliminary support for the FU740, along with the HiFive
  Unleashed it will appear on.
* NUMA support for RISC-V, which involves making the arm64 code generic.
* Support for kasan on the vmalloc region.
* A handful of new drivers for the Kendryte K210, along with the DT
  plumbing required to boot on a handful of K210-based boards.
* Support for allocating ASIDs.
* Preliminary support for kernels larger than 128MiB.
* Various other improvements to our KASAN support, including the
  utilization of huge pages when allocating the KASAN regions.

We may have already found a bug with the KASAN_VMALLOC code, but it's
passing my tests.  There's a fix in the works, but that will probably
miss the merge window.

---

We have a handful of merge conflicts this round.  Here are my resolutions.  The
arm64 one was part of the NUMA cleanup, the other two were part of the Kendryte
rename (it's Canaan now, and it's alphabetically sorted).

diff --cc arch/arm64/mm/Makefile
index cd60e4fed78f,77222d92667a..f188c9092696
--- a/arch/arm64/mm/Makefile
+++ b/arch/arm64/mm/Makefile
@@@ -6,6 -6,8 +6,7 @@@ obj-y				:= dma-mapping.o extable.o fau
  obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
  obj-$(CONFIG_PTDUMP_CORE)	+= ptdump.o
  obj-$(CONFIG_PTDUMP_DEBUGFS)	+= ptdump_debugfs.o
+ obj-$(CONFIG_TRANS_TABLE)	+= trans_pgd.o
 -obj-$(CONFIG_NUMA)		+= numa.o
  obj-$(CONFIG_DEBUG_VIRTUAL)	+= physaddr.o
  obj-$(CONFIG_ARM64_MTE)		+= mteswap.o
  KASAN_SANITIZE_physaddr.o	+= n
diff --cc drivers/soc/Kconfig
index c0143651f4a9,f357c6c659d2..e8a30c4c5aec
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@@ -23,6 -22,6 +23,5 @@@ source "drivers/soc/ti/Kconfig
  source "drivers/soc/ux500/Kconfig"
  source "drivers/soc/versatile/Kconfig"
  source "drivers/soc/xilinx/Kconfig"
- source "drivers/soc/zte/Kconfig"
 -source "drivers/soc/kendryte/Kconfig"

  endmenu
diff --cc drivers/soc/Makefile
index 34b23645be14,9bceb12b291d..f678e4d9e585
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@@ -29,4 -28,4 +29,3 @@@ obj-y				+= ti
  obj-$(CONFIG_ARCH_U8500)	+= ux500/
  obj-$(CONFIG_PLAT_VERSATILE)	+= versatile/
  obj-y				+= xilinx/
- obj-$(CONFIG_ARCH_ZX)		+= zte/
 -obj-$(CONFIG_SOC_KENDRYTE)	+= kendryte/

----------------------------------------------------------------
Alexandre Ghiti (5):
      riscv: Get rid of MAX_EARLY_MAPPING_SIZE
      riscv: Improve kasan definitions
      riscv: Use KASAN_SHADOW_INIT define for kasan memory initialization
      riscv: Improve kasan population function
      riscv: Improve kasan population by using hugepages when possible

Anup Patel (1):
      RISC-V: Implement ASID allocator

Atish Patra (5):
      arm64, numa: Change the numa init functions name to be generic
      numa: Move numa implementation to common code
      riscv: Separate memory init from paging init
      riscv: Add numa support for riscv64 platform
      RISC-V: Add a non-void return for sbi v02 functions

Chen Huang (1):
      riscv/stacktrace: Fix stack output without ra on the stack top

Chengyang Fan (1):
      RISC-V: remove unneeded semicolon

Damien Le Moal (26):
      riscv: Fix builtin DTB handling
      riscv: Use vendor name for K210 SoC support
      riscv: Fix Canaan Kendryte K210 device tree
      riscv: cleanup Canaan Kendryte K210 sysctl driver
      dt-binding: mfd: Document canaan,k210-sysctl bindings
      dt-bindings: reset: Document canaan,k210-rst bindings
      dt-bindings: pinctrl: Document canaan,k210-fpioa bindings
      riscv: Add Canaan Kendryte K210 reset controller
      pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver
      clk: Add RISC-V Canaan Kendryte K210 clock driver
      dt-bindings: update MAINTAINERS file
      dt-bindings: add Canaan boards compatible strings
      dt-bindings: update risc-v cpu properties
      dt-bindings: update sifive plic compatible string
      dt-bindings: update sifive clint compatible string
      dt-bindings: update sifive uart compatible string
      dt-bindings: fix sifive gpio properties
      dt-bindings: add resets property to dw-apb-timer
      riscv: Update Canaan Kendryte K210 device tree
      riscv: Add SiPeed MAIX BiT board device tree
      riscv: Add SiPeed MAIX DOCK board device tree
      riscv: Add SiPeed MAIX GO board device tree
      riscv: Add SiPeed MAIXDUINO board device tree
      riscv: Add Kendryte KD233 board device tree
      riscv: Update Canaan Kendryte K210 defconfig
      riscv: Add Canaan Kendryte K210 SD card defconfig

Eric Lin (2):
      riscv/mm: Introduce a die_kernel_fault() helper function
      riscv/mm: Prevent kernel module to access user memory without uaccess routines

Greentime Hu (1):
      riscv: Add support pte_protnone and pmd_protnone if CONFIG_NUMA_BALANCING

Guo Ren (9):
      riscv: Fixup compile error BUILD_BUG_ON failed
      riscv: Fixup wrong ftrace remove cflag
      riscv: Fixup patch_text panic in ftrace
      riscv: Using PATCHABLE_FUNCTION_ENTRY instead of MCOUNT
      riscv: Add kprobes supported
      riscv: Add KPROBES_ON_FTRACE supported
      riscv: Add uprobes supported
      riscv: Add support for function error injection
      riscv: Enable per-task stack canaries

Kefeng Wang (8):
      riscv: Cleanup sbi function stubs when RISCV_SBI disabled
      riscv: Add machine name to kernel boot log and stack dump output
      riscv: Add dump stack in show_regs
      riscv: Improve __show_regs
      initrd: Add the preprocessor guard in initrd.h
      initramfs: Provide a common initrd reserve function
      riscv: Covert to reserve_initrd_mem()
      riscv: Remove unnecessary declaration

Nylon Chen (1):
      riscv/kasan: add KASAN_VMALLOC support

Palmer Dabbelt (2):
      RISC-V: probes: Treat the instruction stream as host-endian
      soc: canaan: Sort the Makefile alphabetically

Patrick Stählin (1):
      RISC-V: Implement ptrace regs and stack API

Randy Dunlap (1):
      arch_numa: fix common code printing of phys_addr_t

Tobias Klauser (1):
      riscv: Disable KSAN_SANITIZE for vDSO

Vitaly Wool (1):
      riscv: add BUILTIN_DTB support for MMU-enabled targets

Yash Shah (8):
      dt-bindings: riscv: Update l2 cache DT documentation to add support for SiFive FU740
      RISC-V: sifive_l2_cache: Update L2 cache driver to support SiFive FU740
      dt-bindings: riscv: Update DT binding docs to support SiFive FU740 SoC
      dt-bindings: pwm: Update DT binding docs to support SiFive FU740 SoC
      dt-bindings: gpio: Update DT binding docs to support SiFive FU740 SoC
      riscv: dts: add initial support for the SiFive FU740-C000 SoC
      dt-bindings: riscv: Update YAML doc to support SiFive HiFive Unmatched board
      riscv: dts: add initial board data for the SiFive HiFive Unmatched

tangchunyou (1):
      arch/riscv:fix typo in a comment in arch/riscv/kernel/image-vars.h

 .../devicetree/bindings/gpio/sifive,gpio.yaml      |   29 +-
 .../interrupt-controller/sifive,plic-1.0.0.yaml    |   13 +-
 .../bindings/mfd/canaan,k210-sysctl.yaml           |  109 +++
 .../bindings/pinctrl/canaan,k210-fpioa.yaml        |  171 ++++
 .../devicetree/bindings/pwm/pwm-sifive.yaml        |    9 +-
 .../devicetree/bindings/reset/canaan,k210-rst.yaml |   40 +
 .../devicetree/bindings/riscv/canaan.yaml          |   47 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  |    8 +
 .../devicetree/bindings/riscv/sifive-l2-cache.yaml |   34 +-
 .../devicetree/bindings/riscv/sifive.yaml          |   17 +-
 .../devicetree/bindings/serial/sifive-serial.yaml  |    1 +
 .../devicetree/bindings/timer/sifive,clint.yaml    |   12 +-
 .../bindings/timer/snps,dw-apb-timer.yaml          |    3 +
 MAINTAINERS                                        |   23 +
 arch/arm64/Kconfig                                 |    1 +
 arch/arm64/include/asm/numa.h                      |   48 +-
 arch/arm64/kernel/acpi_numa.c                      |   12 -
 arch/arm64/mm/Makefile                             |    1 -
 arch/arm64/mm/init.c                               |    4 +-
 arch/riscv/Kconfig                                 |   48 +-
 arch/riscv/Kconfig.socs                            |   33 +-
 arch/riscv/Makefile                                |   14 +-
 arch/riscv/boot/dts/Makefile                       |    2 +-
 arch/riscv/boot/dts/canaan/Makefile                |    5 +
 arch/riscv/boot/dts/canaan/canaan_kd233.dts        |  152 +++
 arch/riscv/boot/dts/canaan/k210.dtsi               |  459 +++++++++
 arch/riscv/boot/dts/canaan/k210_generic.dts        |   46 +
 arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts     |  209 ++++
 arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts    |  211 ++++
 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts      |  219 +++++
 arch/riscv/boot/dts/canaan/sipeed_maixduino.dts    |  184 ++++
 arch/riscv/boot/dts/kendryte/Makefile              |    4 -
 arch/riscv/boot/dts/kendryte/k210.dts              |   23 -
 arch/riscv/boot/dts/kendryte/k210.dtsi             |  125 ---
 arch/riscv/boot/dts/sifive/Makefile                |    3 +-
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi         |  293 ++++++
 .../riscv/boot/dts/sifive/hifive-unmatched-a00.dts |  253 +++++
 arch/riscv/configs/nommu_k210_defconfig            |   46 +-
 arch/riscv/configs/nommu_k210_sdcard_defconfig     |   92 ++
 arch/riscv/include/asm/bug.h                       |    1 +
 arch/riscv/include/asm/csr.h                       |    6 +
 arch/riscv/include/asm/kasan.h                     |   22 +-
 arch/riscv/include/asm/kprobes.h                   |   40 +
 arch/riscv/include/asm/mmu.h                       |    2 +
 arch/riscv/include/asm/mmu_context.h               |   10 +
 arch/riscv/include/asm/mmzone.h                    |   13 +
 arch/riscv/include/asm/numa.h                      |    8 +
 arch/riscv/include/asm/page.h                      |    3 -
 arch/riscv/include/asm/pci.h                       |   14 +
 arch/riscv/include/asm/pgtable.h                   |   21 +
 arch/riscv/include/asm/probes.h                    |   24 +
 arch/riscv/include/asm/processor.h                 |    1 +
 arch/riscv/include/asm/ptrace.h                    |   35 +
 arch/riscv/include/asm/sbi.h                       |   18 +-
 arch/riscv/include/asm/set_memory.h                |    2 +-
 arch/riscv/include/asm/soc.h                       |   38 -
 arch/riscv/include/asm/stackprotector.h            |    3 +-
 arch/riscv/include/asm/stacktrace.h                |    2 +
 arch/riscv/include/asm/thread_info.h               |    4 +-
 arch/riscv/include/asm/uprobes.h                   |   40 +
 arch/riscv/kernel/Makefile                         |    6 +-
 arch/riscv/kernel/asm-offsets.c                    |    3 +
 arch/riscv/kernel/ftrace.c                         |   95 +-
 arch/riscv/kernel/head.S                           |    4 +
 arch/riscv/kernel/image-vars.h                     |    2 +-
 arch/riscv/kernel/mcount-dyn.S                     |  342 +++----
 arch/riscv/kernel/patch.c                          |    8 +-
 arch/riscv/kernel/probes/Makefile                  |    6 +
 arch/riscv/kernel/probes/decode-insn.c             |   48 +
 arch/riscv/kernel/probes/decode-insn.h             |   18 +
 arch/riscv/kernel/probes/ftrace.c                  |   53 ++
 arch/riscv/kernel/probes/kprobes.c                 |  398 ++++++++
 arch/riscv/kernel/probes/kprobes_trampoline.S      |   93 ++
 arch/riscv/kernel/probes/simulate-insn.c           |   85 ++
 arch/riscv/kernel/probes/simulate-insn.h           |   47 +
 arch/riscv/kernel/probes/uprobes.c                 |  186 ++++
 arch/riscv/kernel/process.c                        |   18 +-
 arch/riscv/kernel/ptrace.c                         |   99 ++
 arch/riscv/kernel/sbi.c                            |   36 +-
 arch/riscv/kernel/setup.c                          |   23 +-
 arch/riscv/kernel/signal.c                         |    3 +
 arch/riscv/kernel/smpboot.c                        |   12 +-
 arch/riscv/kernel/soc.c                            |   27 -
 arch/riscv/kernel/stacktrace.c                     |   22 +-
 arch/riscv/kernel/traps.c                          |   22 +-
 arch/riscv/kernel/vdso/Makefile                    |    3 +-
 arch/riscv/lib/Makefile                            |    2 +
 arch/riscv/lib/error-inject.c                      |   10 +
 arch/riscv/mm/Makefile                             |    3 +-
 arch/riscv/mm/context.c                            |  265 +++++-
 arch/riscv/mm/fault.c                              |   38 +-
 arch/riscv/mm/init.c                               |  108 +--
 arch/riscv/mm/kasan_init.c                         |  176 +++-
 drivers/base/Kconfig                               |    6 +
 drivers/base/Makefile                              |    1 +
 arch/arm64/mm/numa.c => drivers/base/arch_numa.c   |   40 +-
 drivers/clk/Kconfig                                |    7 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/clk-k210.c                             | 1007 ++++++++++++++++++++
 drivers/pinctrl/Kconfig                            |   13 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-k210.c                     |  985 +++++++++++++++++++
 drivers/reset/Kconfig                              |   10 +
 drivers/reset/Makefile                             |    1 +
 drivers/reset/reset-k210.c                         |  131 +++
 drivers/soc/Kconfig                                |    2 +-
 drivers/soc/Makefile                               |    2 +-
 drivers/soc/canaan/Kconfig                         |   12 +
 drivers/soc/canaan/Makefile                        |    3 +
 drivers/soc/canaan/k210-sysctl.c                   |   78 ++
 drivers/soc/kendryte/Kconfig                       |   14 -
 drivers/soc/kendryte/Makefile                      |    3 -
 drivers/soc/kendryte/k210-sysctl.c                 |  260 -----
 drivers/soc/sifive/sifive_l2_cache.c               |   27 +-
 include/asm-generic/numa.h                         |   52 +
 include/dt-bindings/clock/k210-clk.h               |    1 -
 include/dt-bindings/pinctrl/k210-fpioa.h           |  276 ++++++
 include/dt-bindings/reset/k210-rst.h               |   42 +
 include/linux/initrd.h                             |   11 +
 include/soc/canaan/k210-sysctl.h                   |   43 +
 init/initramfs.c                                   |   45 +
 121 files changed, 7605 insertions(+), 1040 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml
 create mode 100644 Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml
 create mode 100644 Documentation/devicetree/bindings/riscv/canaan.yaml
 create mode 100644 arch/riscv/boot/dts/canaan/Makefile
 create mode 100644 arch/riscv/boot/dts/canaan/canaan_kd233.dts
 create mode 100644 arch/riscv/boot/dts/canaan/k210.dtsi
 create mode 100644 arch/riscv/boot/dts/canaan/k210_generic.dts
 create mode 100644 arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
 create mode 100644 arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
 create mode 100644 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
 create mode 100644 arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
 delete mode 100644 arch/riscv/boot/dts/kendryte/Makefile
 delete mode 100644 arch/riscv/boot/dts/kendryte/k210.dts
 delete mode 100644 arch/riscv/boot/dts/kendryte/k210.dtsi
 create mode 100644 arch/riscv/boot/dts/sifive/fu740-c000.dtsi
 create mode 100644 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
 create mode 100644 arch/riscv/configs/nommu_k210_sdcard_defconfig
 create mode 100644 arch/riscv/include/asm/mmzone.h
 create mode 100644 arch/riscv/include/asm/numa.h
 create mode 100644 arch/riscv/include/asm/probes.h
 create mode 100644 arch/riscv/include/asm/uprobes.h
 create mode 100644 arch/riscv/kernel/probes/Makefile
 create mode 100644 arch/riscv/kernel/probes/decode-insn.c
 create mode 100644 arch/riscv/kernel/probes/decode-insn.h
 create mode 100644 arch/riscv/kernel/probes/ftrace.c
 create mode 100644 arch/riscv/kernel/probes/kprobes.c
 create mode 100644 arch/riscv/kernel/probes/kprobes_trampoline.S
 create mode 100644 arch/riscv/kernel/probes/simulate-insn.c
 create mode 100644 arch/riscv/kernel/probes/simulate-insn.h
 create mode 100644 arch/riscv/kernel/probes/uprobes.c
 create mode 100644 arch/riscv/lib/error-inject.c
 rename arch/arm64/mm/numa.c => drivers/base/arch_numa.c (93%)
 create mode 100644 drivers/clk/clk-k210.c
 create mode 100644 drivers/pinctrl/pinctrl-k210.c
 create mode 100644 drivers/reset/reset-k210.c
 create mode 100644 drivers/soc/canaan/Kconfig
 create mode 100644 drivers/soc/canaan/Makefile
 create mode 100644 drivers/soc/canaan/k210-sysctl.c
 delete mode 100644 drivers/soc/kendryte/Kconfig
 delete mode 100644 drivers/soc/kendryte/Makefile
 delete mode 100644 drivers/soc/kendryte/k210-sysctl.c
 create mode 100644 include/asm-generic/numa.h
 create mode 100644 include/dt-bindings/pinctrl/k210-fpioa.h
 create mode 100644 include/dt-bindings/reset/k210-rst.h
 create mode 100644 include/soc/canaan/k210-sysctl.h


--===============0826781451233072456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0826781451233072456==--
