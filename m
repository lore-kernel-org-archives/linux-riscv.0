Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F8AC00140
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Aug 2022 00:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cZ+T/FZap7sLvaODuvi5Kzi0I5bfGxwHsKiWO4cd140=; b=vDnO2pYtMgiqp0
	oyOb0taLAWukTIa7D4S8qaWueMoNL7EU5drb/oAoOl0klW5GGPR4hKCsIH5xvMDAXxoHxwkvKKPYM
	bBh5KeXn5Ye+AlB8WSShpo0noS0jcaBwE9svQm+JJXzNvMaN69RP/+XV1+wA4UrpGLzlDSAZonFnh
	IFdR3F8iUjf/n6uBBLOp15sfaRUzTrXZ9Hw1E+1wMpNAiOmxfNSiRKJuV7fhhxFTmjCNbbQjm2JzI
	mF8LbAqaXwsFMTnPUfCPuYC93W54kGev+zXpqVKrNcgjIjpUzAGfspb7raiLEtWxXnPMM3mfM6Jrw
	aNy8wZ621xxUJVt65Dgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMf9L-001IFE-Jo; Sat, 13 Aug 2022 00:37:11 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMf9H-001IDP-OP
	for linux-riscv@lists.infradead.org; Sat, 13 Aug 2022 00:37:09 +0000
Received: by mail-pl1-x630.google.com with SMTP id o3so2053377ple.5
        for <linux-riscv@lists.infradead.org>; Fri, 12 Aug 2022 17:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:to:from:cc:subject:date:from:to:cc;
        bh=rAs3NBbQcUvUkTtp5EDK6hxoyJZSazQ2aBPoau5vXjg=;
        b=LicZsNy9gsi9hx3djmXGxuNoljRdyeHC7yg9v1rwNSyR8aatvC1im/Ie7tYmFgMcQd
         eUaOVXRVPFFBnow7NoGDtUf4hfEmIZ4iqXSviGsvsTWkDccN/5be8MdB4zWco4qzB8TA
         0+kVKFy4FeBAkqLbJuGyQmjkRnioYjyQt9rFZRixelrVf2ruLKvLilcDLutCUrrByNQT
         VSMt1DHRyrwAhPOrgA9v67Bcpgvpx5Giq8ng8yPuE7uuZ3JbrO2rkoZYJw2WvUU3EsLk
         NtIPRnrREgxhP3uNs/A9Fk6lLkFBtzCA25Yro8oKUg3gXQlijmVfyttvBxl0yBqY86h7
         eTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc;
        bh=rAs3NBbQcUvUkTtp5EDK6hxoyJZSazQ2aBPoau5vXjg=;
        b=JHhQTXHHKss7Q4f/YK0e16Kl3BswCdxlDHHiKCJCYCd3PiRZKi5S2W+SbbzA5r9E8I
         Y8QS8UeW7I1LTMBYxDD4v5rKQXtfhRnF3EbOMmEeU84ZW2QgygjKIdSCsH/PfesTtIqM
         3niJHQ7xtZa3zlQl4qOw1Sb8ENTs2tY5xoS6EA17oft14BUpV7Kki3ZIGMR1b8pU4U3n
         2xGsldjg7j7apCxVc99nl+mFFH+1xQKBwP5l2m41jyxGpH2ecp/DVnFRyhqPZmGMPBbe
         QqSVQe3v0ndVHxhHi4rb4WCgvVuANixQExzbC+CmdVUs5ah+E2PftsZeeX/3ut5BbhHV
         DhJA==
X-Gm-Message-State: ACgBeo33VsfxG1vZpa//z7N2aFI5vB9jlganajTSIlEEgVIPqkaNmfnU
	7cyMhT4cSTaC6/7jp5CG0o0GW6tK8b+eMw==
X-Google-Smtp-Source: AA6agR4cf3awoVbX/x4zXy9r/2cEP0BqJ/gaogKQhSfXQeJllh7r27aJZKueJ8iEG01TyqZWX7LsLg==
X-Received: by 2002:a17:903:124f:b0:171:4c36:a6bf with SMTP id u15-20020a170903124f00b001714c36a6bfmr6482261plh.0.1660351026472;
        Fri, 12 Aug 2022 17:37:06 -0700 (PDT)
Received: from localhost ([50.221.140.186])
        by smtp.gmail.com with ESMTPSA id o27-20020aa7979b000000b0052d481032a7sm2223441pfp.26.2022.08.12.17.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 17:37:06 -0700 (PDT)
Date: Fri, 12 Aug 2022 17:37:06 -0700 (PDT)
X-Google-Original-Date: Fri, 12 Aug 2022 17:36:01 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 5.20 Merge Window, Part 2
CC: linux-kernel@vger.kernel.org,         linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-563e7d68-e504-4e0a-b666-f7c2fbab62db@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_173708_040580_ACF577E8 
X-CRM114-Status: GOOD (  18.58  )
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

The following changes since commit 4d1044fcb996e8de9b9ab392f4a767890e45202d:

  Merge tag 'riscv-for-linus-5.20-mw0' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2022-08-06 15:04:48 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.20-mw2

for you to fetch changes up to 5cef38dd03f33ef206eb792df0fb3b200d762546:

  dt-bindings: gpio: sifive: add gpio-line-names (2022-08-12 09:00:01 -0700)

----------------------------------------------------------------
RISC-V Patches for the 5.20 Merge Window, Part 2

There's still a handful of new features in here, but there are a lot of
fixes/cleanups as well:

* Support for the Zicbom for explicit cache-block management, along with
  the necessary bits to make the non-standard cache management ops on
  the Allwinner D1 function.
* Support for the Zihintpause extension, which codifies a go-slow
  instruction used for cpu_relax().
* Support for the Sstc extension for supervisor-mode timer/counter
  management.
* Many device tree fixes and cleanups, including a large set for the
  Canaan device trees.
* A handful of fixes and cleanups for the PMU driver.

----------------------------------------------------------------
These all pass for me, but they do require some sparse patches that I just
posted to handle the new ISA strings.  There are a handful of warnings, but
they're all in various stages of being fixed and the only one that's
reproducing locally for me is the bluetooth issue that's not related to any of
these.

----------------------------------------------------------------
Atish Patra (9):
      RISC-V: Add SSTC extension CSR details
      RISC-V: Enable sstc extension parsing from DT
      RISC-V: Prefer sstc extension if available
      RISC-V: Fix counter restart during overflow for RV32
      RISC-V: Update user page mapping only once during start
      RISC-V: Fix SBI PMU calls for RV32
      RISC-V: Move counter info definition to sbi header file
      RISC-V: Improve SBI definitions
      RISC-V: KVM: Support sstc extension

Atul Khare (1):
      dt-bindings: gpio: sifive: add gpio-line-names

Ben Dooks (2):
      RISC-V: Declare cpu_ops_spinwait in <asm/cpu_ops.h>
      RISC-V: cpu_ops_spinwait.c should include head.h

Chen Lifu (1):
      riscv: lib: uaccess: fix CSR_STATUS SR_SUM bit

Conor Dooley (14):
      dt-bindings: display: convert ilitek,ili9341.txt to dt-schema
      dt-bindings: display: ili9341: document canaan kd233's lcd
      dt-bindings: memory-controllers: add canaan k210 sram controller
      riscv: dts: canaan: fix the k210's memory node
      riscv: dts: canaan: fix the k210's timer nodes
      riscv: dts: canaan: fix mmc node names
      riscv: dts: canaan: fix kd233 display spi frequency
      riscv: dts: canaan: use custom compatible for k210 i2s
      riscv: dts: canaan: remove spi-max-frequency from controllers
      riscv: dts: canaan: fix bus {ranges,reg} warnings
      riscv: dts: canaan: add specific compatible for kd233's LCD
      riscv: dts: canaan: build all devicetress if SOC_CANAAN
      riscv: ensure cpu_ops_sbi is declared
      dt-bindings: riscv: fix SiFive l2-cache's cache-sets

Dao Lu (1):
      arch/riscv: add Zihintpause support

Emil Renner Berthing (1):
      riscv: dts: sifive unmatched: Add PWM controlled LEDs

Heiko Stuebner (4):
      of: also handle dma-noncoherent in of_dma_is_coherent()
      dt-bindings: riscv: document cbom-block-size
      riscv: Add support for non-coherent devices using zicbom extension
      riscv: implement cache-management errata for T-Head SoCs

Jason A. Donenfeld (1):
      wireguard: selftests: set CONFIG_NONPORTABLE on riscv32

Krzysztof Kozlowski (1):
      riscv: traps_misaligned: do not duplicate stringify

Mark Kettenis (1):
      riscv: dts: starfive: correct number of external interrupts

Masahiro Yamada (2):
      riscv/purgatory: hard-code obj-y in Makefile
      riscv/purgatory: Omit use of bin2c

Palmer Dabbelt (5):
      RISC-V: Canaan devicetree fixes
      riscv: implement Zicbom-based CMO instructions + the t-head variant
      RISC-V: fixups to work with crash tool
      RISC-V: Add Sstc extension support
      perf: riscv_pmu{,_sbi}: Miscallenous improvement & fixes

Xianting Tian (4):
      RISC-V: kexec: Fixup use of smp_processor_id() in preemptible context
      RISC-V: Fixup get incorrect user mode PC for kernel mode regs
      RISC-V: Fixup schedule out issue in machine_crash_shutdown()
      RISC-V: Add modules to virtual kernel memory layout dump

Yipeng Zou (1):
      riscv:uprobe fix SR_SPIE set/clear handling

 .../devicetree/bindings/display/ilitek,ili9341.txt |  27 ----
 .../bindings/display/panel/ilitek,ili9341.yaml     |  49 +++++--
 .../devicetree/bindings/gpio/sifive,gpio.yaml      |   4 +
 .../memory-controllers/canaan,k210-sram.yaml       |  52 ++++++++
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   5 +
 .../devicetree/bindings/riscv/sifive-l2-cache.yaml |   6 +-
 arch/riscv/Kconfig                                 |  32 ++++-
 arch/riscv/Kconfig.erratas                         |  11 ++
 arch/riscv/Makefile                                |   8 ++
 arch/riscv/boot/dts/canaan/Makefile                |  10 +-
 arch/riscv/boot/dts/canaan/canaan_kd233.dts        |   6 +-
 arch/riscv/boot/dts/canaan/k210.dtsi               |  73 +++++++----
 arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts     |   2 +-
 arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts    |   2 +-
 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts      |   2 +-
 arch/riscv/boot/dts/canaan/sipeed_maixduino.dts    |   2 +-
 .../riscv/boot/dts/sifive/hifive-unmatched-a00.dts |  42 ++++++
 arch/riscv/boot/dts/starfive/jh7100.dtsi           |   2 +-
 arch/riscv/errata/thead/errata.c                   |  20 +++
 arch/riscv/include/asm/cache.h                     |   4 +
 arch/riscv/include/asm/cacheflush.h                |  10 ++
 arch/riscv/include/asm/cpu_ops.h                   |   1 +
 arch/riscv/include/asm/cpu_ops_sbi.h               |   2 +
 arch/riscv/include/asm/csr.h                       |   5 +
 arch/riscv/include/asm/errata_list.h               |  59 ++++++++-
 arch/riscv/include/asm/hwcap.h                     |   7 +
 arch/riscv/include/asm/kvm_vcpu_timer.h            |   7 +
 arch/riscv/include/asm/sbi.h                       |  32 ++++-
 arch/riscv/include/asm/vdso/processor.h            |  21 ++-
 arch/riscv/include/uapi/asm/kvm.h                  |   1 +
 arch/riscv/kernel/cpu.c                            |   3 +
 arch/riscv/kernel/cpu_ops.c                        |   5 +-
 arch/riscv/kernel/cpu_ops_spinwait.c               |   2 +
 arch/riscv/kernel/cpufeature.c                     |  26 ++++
 arch/riscv/kernel/crash_save_regs.S                |   2 +-
 arch/riscv/kernel/machine_kexec.c                  |  28 +++-
 arch/riscv/kernel/probes/uprobes.c                 |   6 -
 arch/riscv/kernel/setup.c                          |   2 +
 arch/riscv/kernel/traps_misaligned.c               |   8 +-
 arch/riscv/kvm/vcpu.c                              |   8 +-
 arch/riscv/kvm/vcpu_timer.c                        | 144 ++++++++++++++++++++-
 arch/riscv/lib/uaccess.S                           |   4 +-
 arch/riscv/mm/Makefile                             |   1 +
 arch/riscv/mm/dma-noncoherent.c                    | 116 +++++++++++++++++
 arch/riscv/mm/init.c                               |   4 +
 arch/riscv/purgatory/.gitignore                    |   1 -
 arch/riscv/purgatory/Makefile                      |  10 +-
 arch/riscv/purgatory/kexec-purgatory.S             |  14 ++
 drivers/clocksource/timer-riscv.c                  |  25 +++-
 drivers/of/address.c                               |  17 ++-
 drivers/perf/riscv_pmu.c                           |   1 -
 drivers/perf/riscv_pmu_sbi.c                       |  30 +++--
 scripts/remove-stale-files                         |   2 +
 .../selftests/wireguard/qemu/arch/riscv32.config   |   1 +
 54 files changed, 821 insertions(+), 143 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9341.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
 create mode 100644 arch/riscv/mm/dma-noncoherent.c
 create mode 100644 arch/riscv/purgatory/kexec-purgatory.S

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
