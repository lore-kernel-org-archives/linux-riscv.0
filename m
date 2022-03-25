Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293E1C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Mar 2022 16:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B6Y1cRK+lkglBOEGPu/fMwngNVvtNvlJV8D2gHtLZZ0=; b=iTzJs1mfYDN2Is
	/fZky1o29tsdYTJrvFdXutIDv0LD5k7dNM787DkVYuULPwqQXVGPRkWahu0XVucJdlftM3I+HXiGs
	7yTWXL4Dr22jYqLiujB0UIPHSLZ2mJaKP8vjSXhUigS0fXoDfs+/yrMbBlgFMz6zPKdOhVc//LPLe
	wWbkTSMzLqP5ZOU2KxjA+uq/lJEsC4vvcO97gMV69Um3DCW2GtFuwADglJ4tkyg51TwRPtXzVsv5y
	43UZLTN7mm1BuEddGr8DqLNi1TDOTU4p00c2OPg97nNluu/nADFC0ldr2LcTULNl62y4yHhJelGTe
	jLVJOFwWSmF7e4k+m6pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXmaM-002aTW-C1; Fri, 25 Mar 2022 16:14:46 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXmaI-002aSa-Gy
 for linux-riscv@lists.infradead.org; Fri, 25 Mar 2022 16:14:44 +0000
Received: by mail-pj1-x1036.google.com with SMTP id v4so7955815pjh.2
 for <linux-riscv@lists.infradead.org>; Fri, 25 Mar 2022 09:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:cc:from:to:message-id;
 bh=/J3ZSura8UYnQkEtUNyN05EeOp8uC8XsehkUYYVu7hc=;
 b=Yz7UZWgyzK8BJWrcAbbloqTm4nqij/XFViIuJS1a4mJAyy6FP3vMCoe2NQZK1xF2mO
 VBSicpqlNAvmOC9pPhqCxGyF0po774m8vrM2xESN3lOSTlPHtl+B0fJCpg8U9Q7vbRQ3
 AHxQ7x235808lNeJ65hlfEGmLLEKxz+P6f1JFXCGCiXth9n6TlUd0F1WdJ7th9cQ8LWN
 dHW88zuQaDq9vPsKHa6DU/exLfeUb0TMlPcx0aL3KS5GhIlwau0cSMVoiAp0WyH88bU6
 G1wi54fILVxiNJkN5xLbXkm8dt6AeLb69rgxMrSQS1arYtLacuIcsjoTtz1KLhwmKrSo
 aS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=/J3ZSura8UYnQkEtUNyN05EeOp8uC8XsehkUYYVu7hc=;
 b=3RlLfyNUhVAGoaTF7SbEOG4IG2UcTzYg/yaT7Ti4GQSKew9fQrn571eLX+H0P5EQR4
 bhgKgS+w1CRLmZ95En1JWD1lTtWm9vGcYu9uK/96qb3j8ZNpfwUNYLnoSVncUOEzzkuU
 3R0G6knkv0JYwJwD4XeUWfvEpZBbKTyFt/uNOSi3PNXVkPL24YUYJLs3poY+6pADfwCe
 sMmHDUjbX+DilujV9vgLiH2w6Cr42oeZEGopUKFGpERrFP2XF1K/Ne2mYCJTCZ9BbVLw
 5gkN4H2d3viNpFej0ffMClKOxsarqhh13ZoUC4D+RsBqbjz+qLbCl3UpF6M30PYSeqnq
 MguA==
X-Gm-Message-State: AOAM532EQ3W/BJSQ8+/AQJd7K4WCfmIs+cUuiUbxNfEdt8yXYLmMIAtg
 HQ5r6q2AK6Hp45Bai5sy4DFXEWxnT76WaQ==
X-Google-Smtp-Source: ABdhPJxnPyi0T+WZ4F2PU9/Xn+sjZ9aQ1D80QCL90ndV0kfW9N8KGj/ii1yUnaqk2DcIjp5kwxBt6Q==
X-Received: by 2002:a17:902:d48d:b0:153:a517:6ff2 with SMTP id
 c13-20020a170902d48d00b00153a5176ff2mr12515140plg.141.1648224880795; 
 Fri, 25 Mar 2022 09:14:40 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 f4-20020aa782c4000000b004f6f0334a51sm6863378pfn.126.2022.03.25.09.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 09:14:40 -0700 (PDT)
Date: Fri, 25 Mar 2022 09:14:40 -0700 (PDT)
X-Google-Original-Date: Fri, 25 Mar 2022 09:14:32 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 5.18 Merge Window, Part 1
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-d6e408db-0c83-4358-9cef-831a694d582e@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_091442_645977_2A2837DE 
X-CRM114-Status: GOOD (  19.60  )
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

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.18-mw0

for you to fetch changes up to bbde015227e89f1da21bd3b84523d62c4a445c06:

  RISC-V: add support for restartable sequences (2022-03-22 16:20:37 -0700)

----------------------------------------------------------------
RISC-V Patches for the 5.18 Merge Window, Part 1

* Support for Sv57-based virtual memory.
* Various improvements for the MicroChip PolarFire SOC and the
  associated Icicle dev board, which should allow upstream kernels to
  boot without any additional modifications.
* An improved memmove() implementation.
* Support for the new Ssconfpmf and SBI PMU extensions, which allows for
  a much more useful perf implementation on RISC-V systems.
* Support for restartable sequences.

----------------------------------------------------------------
There will almost certainly be a part 2: there are at least a handful of
fixes/cleanups that have already started to show up, and there's still some
larger patch sets that minor issues I hope can be resolved.

There are a handful of merge conflicts, once again between this and my fixes
tree.  Here's how I resolved them, for reference:

diff --cc arch/riscv/kernel/Makefile
index ffc87e76b1dd,fb63b462ff85..e0133d113216
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@@ -51,9 -51,6 +51,8 @@@ obj-$(CONFIG_MODULE_SECTIONS) += module
  obj-$(CONFIG_FUNCTION_TRACER) += mcount.o ftrace.o
  obj-$(CONFIG_DYNAMIC_FTRACE)  += mcount-dyn.o

 +obj-$(CONFIG_TRACE_IRQFLAGS)  += trace_irq.o
 +
- obj-$(CONFIG_RISCV_BASE_PMU)  += perf_event.o
  obj-$(CONFIG_PERF_EVENTS)     += perf_callchain.o
  obj-$(CONFIG_HAVE_PERF_REGS)  += perf_regs.o
  obj-$(CONFIG_RISCV_SBI)               += sbi.o
diff --cc arch/riscv/mm/kasan_init.c
index cd1a145257b7,3c99b24c9adf..a22e418dbd82
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@@ -111,13 -111,12 +111,15 @@@ static void __init kasan_populate_pud(p
                 * pt_ops facility.
                 */
                base_pud = pt_ops.get_pud_virt(pfn_to_phys(_pgd_pfn(*pgd)));
+       } else if (pgd_none(*pgd)) {
+               base_pud = memblock_alloc(PTRS_PER_PUD * sizeof(pud_t), PAGE_SIZE);
        } else {
                base_pud = (pud_t *)pgd_page_vaddr(*pgd);
 -              if (base_pud == lm_alias(kasan_early_shadow_pud))
 +              if (base_pud == lm_alias(kasan_early_shadow_pud)) {
                        base_pud = memblock_alloc(PTRS_PER_PUD * sizeof(pud_t), PAGE_SIZE);
 +                      memcpy(base_pud, (void *)kasan_early_shadow_pud,
 +                             sizeof(pud_t) * PTRS_PER_PUD);
 +              }
        }

        pudp = base_pud + pud_index(vaddr);

----------------------------------------------------------------
Atish Patra (12):
      RISC-V: Implement multi-letter ISA extension probing framework
      RISC-V: Do no continue isa string parsing without correct XLEN
      RISC-V: Improve /proc/cpuinfo output for ISA extensions
      RISC-V: Remove the current perf implementation
      RISC-V: Add CSR encodings for all HPMCOUNTERS
      RISC-V: Add a perf core library for pmu drivers
      RISC-V: Add a simple platform driver for RISC-V legacy perf
      RISC-V: Add RISC-V SBI PMU extension definitions
      RISC-V: Add perf platform driver based on SBI PMU extension
      RISC-V: Add sscofpmf extension support
      Documentation: riscv: Remove the old documentation
      MAINTAINERS: Add entry for RISC-V PMU drivers

Conor Dooley (11):
      dt-bindings: soc/microchip: update syscontroller compatibles
      dt-bindings: soc/microchip: add info about services to mpfs sysctrl
      dt-bindings: rtc: add bindings for microchip mpfs rtc
      dt-bindings: gpio: add bindings for microchip mpfs gpio
      dt-bindings: pwm: add microchip corepwm binding
      riscv: dts: microchip: use clk defines for icicle kit
      riscv: dts: microchip: add fpga fabric section to icicle kit
      riscv: dts: microchip: refactor icicle kit device tree
      riscv: dts: microchip: update peripherals in icicle kit device tree
      riscv: dts: microchip: add new peripherals to icicle kit device tree
      MAINTAINERS: update riscv/microchip entry

Daire McNamara (1):
      dt-bindings: clk: microchip: Add Microchip PolarFire host binding

Jisheng Zhang (1):
      riscv: mm: init: mark satp_mode __ro_after_init

Mayuresh Chitale (1):
      riscv: defconfig: enable hugetlbfs option

Michael T. Kloos (1):
      riscv: Fixed misaligned memory access. Fixed pointer comparison.

Palmer Dabbelt (5):
      RISC-V: Add Sv57 page table support
      Update the Icicle Kit device tree
      RISC-V: Provide a fraemework for RISC-V ISA extensions
      perf: RISC-V: Add support for SBI PMU and Sscofpmf
      RISC-V: add support for restartable sequences

Qinglin Pan (4):
      riscv: mm: Control p4d's folding by pgtable_l5_enabled
      riscv: mm: Prepare pt_ops helper functions for sv57
      riscv: mm: Set sv57 on defaultly
      riscv: mm: Support kasan for sv57

Tsukasa OI (3):
      RISC-V: Correctly print supported extensions
      RISC-V: Minimal parser for "riscv, isa" strings
      RISC-V: Extract multi-letter extension names from "riscv, isa"

Vincent Chen (2):
      RISC-V: Add support for restartable sequence
      rseq/selftests: Add support for RISC-V

 .../devicetree/bindings/clock/microchip,mpfs.yaml  |  58 ++
 .../bindings/gpio/microchip,mpfs-gpio.yaml         |  79 +++
 ...oc-mailbox.yaml => microchip,mpfs-mailbox.yaml} |   6 +-
 .../devicetree/bindings/pwm/microchip,corepwm.yaml |  81 +++
 .../bindings/rtc/microchip,mfps-rtc.yaml           |  58 ++
 .../microchip/microchip,mpfs-sys-controller.yaml   |  40 ++
 .../microchip,polarfire-soc-sys-controller.yaml    |  35 -
 Documentation/riscv/pmu.rst                        | 255 -------
 MAINTAINERS                                        |  11 +
 arch/riscv/Kconfig                                 |  18 +-
 .../boot/dts/microchip/microchip-mpfs-fabric.dtsi  |  25 +
 .../dts/microchip/microchip-mpfs-icicle-kit.dts    | 115 ++-
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi  | 254 +++++--
 arch/riscv/configs/defconfig                       |   1 +
 arch/riscv/configs/rv32_defconfig                  |   1 +
 arch/riscv/include/asm/csr.h                       |  67 +-
 arch/riscv/include/asm/fixmap.h                    |   1 +
 arch/riscv/include/asm/hwcap.h                     |  26 +
 arch/riscv/include/asm/page.h                      |   1 +
 arch/riscv/include/asm/perf_event.h                |  72 --
 arch/riscv/include/asm/pgalloc.h                   |  49 ++
 arch/riscv/include/asm/pgtable-64.h                | 106 ++-
 arch/riscv/include/asm/pgtable.h                   |   6 +-
 arch/riscv/include/asm/sbi.h                       |  95 +++
 arch/riscv/kernel/Makefile                         |   1 -
 arch/riscv/kernel/cpu.c                            |  70 +-
 arch/riscv/kernel/cpufeature.c                     | 130 +++-
 arch/riscv/kernel/entry.S                          |   4 +
 arch/riscv/kernel/perf_event.c                     | 485 -------------
 arch/riscv/kernel/signal.c                         |   2 +
 arch/riscv/lib/memmove.S                           | 368 ++++++++--
 arch/riscv/mm/init.c                               | 168 ++++-
 arch/riscv/mm/kasan_init.c                         | 155 +++-
 drivers/perf/Kconfig                               |  30 +
 drivers/perf/Makefile                              |   3 +
 drivers/perf/riscv_pmu.c                           | 324 +++++++++
 drivers/perf/riscv_pmu_legacy.c                    | 142 ++++
 drivers/perf/riscv_pmu_sbi.c                       | 790 +++++++++++++++++++++
 include/dt-bindings/clock/microchip,mpfs-clock.h   |  45 ++
 include/linux/cpuhotplug.h                         |   1 +
 include/linux/perf/riscv_pmu.h                     |  75 ++
 tools/testing/selftests/rseq/param_test.c          |  23 +
 tools/testing/selftests/rseq/rseq-riscv.h          | 677 ++++++++++++++++++
 tools/testing/selftests/rseq/rseq.h                |   2 +
 44 files changed, 3900 insertions(+), 1055 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
 rename Documentation/devicetree/bindings/mailbox/{microchip,polarfire-soc-mailbox.yaml => microchip,mpfs-mailbox.yaml} (82%)
 create mode 100644 Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
 delete mode 100644 Documentation/riscv/pmu.rst
 create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
 delete mode 100644 arch/riscv/kernel/perf_event.c
 create mode 100644 drivers/perf/riscv_pmu.c
 create mode 100644 drivers/perf/riscv_pmu_legacy.c
 create mode 100644 drivers/perf/riscv_pmu_sbi.c
 create mode 100644 include/dt-bindings/clock/microchip,mpfs-clock.h
 create mode 100644 include/linux/perf/riscv_pmu.h
 create mode 100644 tools/testing/selftests/rseq/rseq-riscv.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
