Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCE1EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 15:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=+ZdUVUtct895KFy54JqrOsB6GdVtlTs6x0Oxy9Khxqs=; b=NT4
	1ec+LGxJ7OYJWWESvWKGZ+RJmaI8zIUC8LVHIKTQfr1cbwPbG3JvUw3b0L3+/emOVhpod4g4n0Qom
	UDSiTCgH2rBDj3YFUModr+ekXUXh+JKIU9GpBLls/RUKRRxax8TQ2lfBF/7k3lLBKeYdJO8GTPAbl
	FJDtohQER/ceXog6y9mJcF//k0yHyGEO2uHvvISoqlhut5waKzvPY7L5VJ0K5u2te7tpTnPBp21y6
	ZmKrxr+S42eK6SGkmtVcOxhLILak6Tjo+ZyCz7snh5XAHQpxx2aa/nZlsGZXlr1VY+Cb5VJmWhJtL
	MeG5nvKlhRyoPIYMQLd7fAxzAxRondw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFGF1-003yBm-0n;
	Fri, 30 Jun 2023 15:40:59 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFGEx-003yBI-0I
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 15:40:57 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-66767d628e2so1597774b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 08:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688139651; x=1690731651;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cHeAtEXSd70DVHtMKzkrbcMiXRYo9SrazU5rP+q2ao=;
        b=C/bd2+d7igDcV8otsPFKEgyCQMd92+5wEgoYgExVX3JFSnON8M7nxxcteZdTu0Kw/c
         6NZjpTqQjyZg6q6nn/V9hK2bPQy+xI3qqat3QiutoUjFIaWYoXvSNR3gDaD06rmV9++I
         hZdvV/DrmubnXmY2kCWyyXTfp+9XchUzSXPD/sfPx9bTQXotFfWQnKJOYLkmv+jg3obg
         M3UlcOtJfOrwJO4vp8xTIVTqM5AsM42o46jNKkktzg5q7kz7IdvzLXZorRQEVf2oqErU
         zy3IaK2IibzSosNqxSRHDYQHdKwjj7msHwLGyhZAP7mvrEQorsMDWw2BD8UeBGmDXi7T
         qk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688139651; x=1690731651;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1cHeAtEXSd70DVHtMKzkrbcMiXRYo9SrazU5rP+q2ao=;
        b=WgGw1qdJ6gOCU1WgaxlswuEiJk1Gc0SZP+5nePx3UJFprVAk56F5seg0W83V5Xx4TJ
         0zFvD5dTRmwIgf7EhbOmX/+jDzmNaoz3DHf0xMqKA0Y3OJfCIg9gIazbmc4VUvehjs5q
         YsD322WL+Uvf/yhqf2onG7DZWQIpZp7KAaO9MXrcMI7mTsn2DozqMbaLv15VFf9oVFEb
         bGr5G1ofFJjU/fAlkWcR8gti/yNl+tpamLe1YRRhkhI/DrWJw7JUv42jFnXIies0sRSn
         lfDi5FfvhY/TQkGG6NhFyjJaAiVNo5hZQ8JSFq9N5THAr8VLMawBHmA6GBa9W23ozzVt
         w78g==
X-Gm-Message-State: ABy/qLa+6d0bRkmjsTkbJaGVcS/5R8xT+l+nswU7YanGvoPLe0KBXNzb
	1RLlznma7S1URrZqbkL1cLb9Uzv5eQIaHS0Hu68=
X-Google-Smtp-Source: APBJJlH6ecG0XRUQxAEbfPjeqcv+JYrpx2tX+WxVrJ1ImaBwhcjAD0nIyzIgriVnbqugndnghMnEDQ==
X-Received: by 2002:a05:6a00:2d85:b0:677:e738:9866 with SMTP id fb5-20020a056a002d8500b00677e7389866mr3072589pfb.1.1688139650944;
        Fri, 30 Jun 2023 08:40:50 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id e25-20020aa78c59000000b00675701f456csm8599797pfd.54.2023.06.30.08.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 08:40:50 -0700 (PDT)
Date: Fri, 30 Jun 2023 08:40:50 -0700 (PDT)
X-Google-Original-Date: Fri, 30 Jun 2023 08:37:19 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 6.5 Merge Window, Part 1
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-ebcc1b82-5dd0-4f2d-824e-8d9250374abf@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_084055_370222_6D5AA5ED 
X-CRM114-Status: GOOD (  21.54  )
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
Content-Type: multipart/mixed; boundary="===============7760992888855911227=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7760992888855911227==
Content-Type: text/plain

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.5-mw1

for you to fetch changes up to 488833ccdcac118da16701f4ee0673b20ba47fe3:

  Merge patch series "dt-bindings: riscv: cpus: switch to unevaluatedProperties: false" (2023-06-23 10:06:23 -0700)

----------------------------------------------------------------
RISC-V Patches for the 6.5 Merge Window, Part 1

* Support for ACPI.
* Various cleanups to the ISA string parsing, including making them
  case-insensitive
* Support for the vector extension.
* Support for independent irq/softirq stacks.
* Our CPU DT binding now has "unevaluatedProperties: false"

----------------------------------------------------------------
I have a few all{yes,mod}config failures, but it looks like there's at least
fixes on the lists for all of them and most are in linux-next already.

I'm almost certainly going to have a part 2: at least for the DCE stuff (which
I just lost track of this week, sorry), but we've also got a handful of
fixes/cleanups staged and some more on the lists.  This was a pretty big merge
window, but it looks like most of the stragglers are pretty small so hopefully
it's not too bad.

There's one merge coflict in MAINTAINERS

diff --cc MAINTAINERS
index 0d6ecb5a4107,e0976ae2a523..cfc2b67e9b4e
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -406,19 -406,6 +406,19 @@@ L:       linux-arm-kernel@lists.infradead.or
  S:    Maintained
  F:    drivers/acpi/arm64
  
- ACPI SERIAL MULTI INSTANTIATE DRIVER
- M:    Hans de Goede <hdegoede@redhat.com>
- L:    platform-driver-x86@vger.kernel.org
- S:    Maintained
- F:    drivers/platform/x86/serial-multi-instantiate.c
- 
 +ACPI FOR RISC-V (ACPI/riscv)
 +M:    Sunil V L <sunilvl@ventanamicro.com>
 +L:    linux-acpi@vger.kernel.org
 +L:    linux-riscv@lists.infradead.org
 +S:    Maintained
 +F:    drivers/acpi/riscv/
 +
++ACPI SERIAL MULTI INSTANTIATE DRIVER
++M:    Hans de Goede <hdegoede@redhat.com>
++L:    platform-driver-x86@vger.kernel.org
++S:    Maintained
++F:    drivers/platform/x86/serial-multi-instantiate.c
++
  ACPI PCC(Platform Communication Channel) MAILBOX DRIVER
  M:    Sudeep Holla <sudeep.holla@arm.com>
  L:    linux-acpi@vger.kernel.org

----------------------------------------------------------------
Andy Chiu (11):
      riscv: hwprobe: Add support for probing V in RISCV_HWPROBE_KEY_IMA_EXT_0
      riscv: Allocate user's vector context in the first-use trap
      riscv: signal: check fp-reserved words unconditionally
      riscv: signal: validate altstack to reflect Vector
      riscv: hwcap: change ELF_HWCAP to a function
      riscv: Add prctl controls for userspace vector management
      riscv: Add sysctl to set the default vector rule for new processes
      riscv: detect assembler support for .option arch
      riscv: Add documentation for Vector
      selftests: Test RISC-V Vector prctl interface
      selftests: add .gitignore file for RISC-V hwprobe

Ben Dooks (1):
      riscv: say disabling zicbom if no or bad riscv,cbom-block-size found

Björn Töpel (1):
      riscv: mm: Pre-allocate PGD entries for vmalloc/modules area

Conor Dooley (10):
      dt-bindings: riscv: drop invalid comment about riscv,isa lower-case reasoning
      RISC-V: simplify register width check in ISA string parsing
      RISC-V: split early & late of_node to hartid mapping
      RISC-V: validate riscv,isa at boot, not during ISA string parsing
      RISC-V: rework comments in ISA string parser
      RISC-V: remove decrement/increment dance in ISA string parser
      dt-bindings: riscv: explicitly mention assumption of Zicntr & Zihpm support
      RISC-V: always report presence of extensions formerly part of the base ISA
      dt-bindings: riscv: cpus: add a ref the common cpu schema
      dt-bindings: riscv: cpus: switch to unevaluatedProperties: false

Evan Green (3):
      RISC-V: Add Zba, Zbs extension probing
      RISC-V: Track ISA extensions per hart
      RISC-V: hwprobe: Expose Zba, Zbb, and Zbs

Fangrui Song (1):
      riscv: replace deprecated scall with ecall

Greentime Hu (9):
      riscv: Add new csr defines related to vector extension
      riscv: Clear vector regfile on bootup
      riscv: Introduce Vector enable/disable helpers
      riscv: Introduce riscv_v_vsize to record size of Vector context
      riscv: Introduce struct/helpers to save/restore per-task Vector state
      riscv: Add task switch support for vector
      riscv: Add ptrace vector support
      riscv: signal: Add sigcontext save/restore for vector
      riscv: prevent stack corruption by reserving task_pt_regs(p) early

Guo Ren (7):
      riscv: Rename __switch_to_aux() -> fpu
      riscv: Extending cpufeature.c to detect V-extension
      riscv: Disable Vector Instructions for kernel itself
      riscv: Enable Vector code to be built
      riscv: stack: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
      riscv: stack: Support HAVE_SOFTIRQ_ON_OWN_STACK
      riscv: stack: Add config of thread stack size

Jisheng Zhang (3):
      riscv: move sbi_init() earlier before jump_label_init()
      riscv: mm: stub extable related functions/macros for !MMU
      riscv: mm: try VMA lock-based page fault handling first

Krzysztof Kozlowski (1):
      dt-bindings: riscv: cpus: drop unneeded quotes

Palmer Dabbelt (7):
      Merge patch series "Add basic ACPI support for RISC-V"
      Merge patch series "riscv: allow case-insensitive ISA string parsing"
      Merge patch series "riscv: Add vector ISA support"
      Merge patch series "RISC-V: Export Zba, Zbb to usermode via hwprobe"
      Merge patch series "ISA string parser cleanups"
      Merge patch series "riscv: Add independent irq/softirq stacks support"
      Merge patch series "dt-bindings: riscv: cpus: switch to unevaluatedProperties: false"

Song Shuai (3):
      riscv: hibernation: Replace jalr with jr before suspend_restore_regs
      riscv: hibernation: Remove duplicate call of suspend_restore_csrs
      riscv: hibernate: remove WARN_ON in save_processor_state

Sunil V L (22):
      platform/surface: Disable for RISC-V
      crypto: hisilicon/qm: Fix to enable build with RISC-V clang
      ACPI: tables: Print RINTC information when MADT is parsed
      ACPI: OSL: Make should_use_kmap() 0 for RISC-V
      RISC-V: Add support to build the ACPI core
      ACPI: processor_core: RISC-V: Enable mapping processor to the hartid
      RISC-V: Add ACPI initialization in setup_arch()
      RISC-V: ACPI: Cache and retrieve the RINTC structure
      drivers/acpi: RISC-V: Add RHCT related code
      RISC-V: smpboot: Create wrapper setup_smp()
      RISC-V: smpboot: Add ACPI support in setup_smp()
      RISC-V: only iterate over possible CPUs in ISA string parser
      RISC-V: cpufeature: Add ACPI support in riscv_fill_hwcap()
      RISC-V: cpu: Enable cpuinfo for ACPI systems
      irqchip/riscv-intc: Add ACPI support
      clocksource/timer-riscv: Refactor riscv_timer_init_dt()
      clocksource/timer-riscv: Add ACPI support
      RISC-V: time.c: Add ACPI support for time_init()
      RISC-V: Enable ACPI in defconfig
      MAINTAINERS: Add entry for drivers/acpi/riscv
      RISC-V: ACPI : Fix for usage of pointers in different address space
      RISC-V/perf: Use standard interface to get INTC domain

Tiezhu Yang (1):
      riscv: uprobes: Restore thread.bad_cause

Viacheslav Mitrofanov (1):
      perf: RISC-V: Limit the number of counters returned from SBI

Vincent Chen (3):
      riscv: signal: Report signal frame size to userspace via auxv
      riscv: kvm: Add V extension to KVM ISA
      riscv: KVM: Add vector lazy save/restore support

Yangyu Chen (1):
      riscv: allow case-insensitive ISA string parsing

 Documentation/admin-guide/kernel-parameters.txt    |   8 +-
 Documentation/devicetree/bindings/riscv/cpus.yaml  |  20 +-
 Documentation/riscv/hwprobe.rst                    |  13 +
 Documentation/riscv/index.rst                      |   1 +
 Documentation/riscv/vector.rst                     | 132 ++++++++++
 MAINTAINERS                                        |   7 +
 arch/riscv/Kconfig                                 |  64 ++++-
 arch/riscv/Makefile                                |   6 +-
 arch/riscv/configs/defconfig                       |   1 +
 arch/riscv/include/asm/acenv.h                     |  11 +
 arch/riscv/include/asm/acpi.h                      |  84 +++++++
 arch/riscv/include/asm/asm-extable.h               |   6 +
 arch/riscv/include/asm/cpu.h                       |   8 +
 arch/riscv/include/asm/cpufeature.h                |  10 +
 arch/riscv/include/asm/csr.h                       |  18 +-
 arch/riscv/include/asm/elf.h                       |  11 +-
 arch/riscv/include/asm/extable.h                   |   4 +
 arch/riscv/include/asm/hwcap.h                     |   9 +
 arch/riscv/include/asm/insn.h                      |  29 +++
 arch/riscv/include/asm/irq_stack.h                 |  30 +++
 arch/riscv/include/asm/kvm_host.h                  |   2 +
 arch/riscv/include/asm/kvm_vcpu_vector.h           |  82 ++++++
 arch/riscv/include/asm/processor.h                 |  14 ++
 arch/riscv/include/asm/switch_to.h                 |   9 +-
 arch/riscv/include/asm/thread_info.h               |  17 +-
 arch/riscv/include/asm/vector.h                    | 184 ++++++++++++++
 arch/riscv/include/uapi/asm/auxvec.h               |   1 +
 arch/riscv/include/uapi/asm/hwcap.h                |   1 +
 arch/riscv/include/uapi/asm/hwprobe.h              |   4 +
 arch/riscv/include/uapi/asm/kvm.h                  |   8 +
 arch/riscv/include/uapi/asm/ptrace.h               |  39 +++
 arch/riscv/include/uapi/asm/sigcontext.h           |  16 +-
 arch/riscv/kernel/Makefile                         |   2 +
 arch/riscv/kernel/acpi.c                           | 251 +++++++++++++++++++
 arch/riscv/kernel/cpu.c                            |  67 ++++-
 arch/riscv/kernel/cpufeature.c                     | 222 +++++++++++++----
 arch/riscv/kernel/entry.S                          |   8 +-
 arch/riscv/kernel/head.S                           |  41 ++-
 arch/riscv/kernel/hibernate-asm.S                  |   5 +-
 arch/riscv/kernel/hibernate.c                      |   1 -
 arch/riscv/kernel/irq.c                            |  68 +++++
 arch/riscv/kernel/probes/uprobes.c                 |   2 +
 arch/riscv/kernel/process.c                        |  20 ++
 arch/riscv/kernel/ptrace.c                         |  70 ++++++
 arch/riscv/kernel/setup.c                          |  14 +-
 arch/riscv/kernel/signal.c                         | 220 +++++++++++++---
 arch/riscv/kernel/smpboot.c                        |  86 ++++++-
 arch/riscv/kernel/sys_riscv.c                      |  52 +++-
 arch/riscv/kernel/time.c                           |  25 +-
 arch/riscv/kernel/traps.c                          |  61 ++++-
 arch/riscv/kernel/vdso/rt_sigreturn.S              |   2 +-
 arch/riscv/kernel/vector.c                         | 276 +++++++++++++++++++++
 arch/riscv/kvm/Makefile                            |   1 +
 arch/riscv/kvm/vcpu.c                              |  25 ++
 arch/riscv/kvm/vcpu_vector.c                       | 186 ++++++++++++++
 arch/riscv/mm/Makefile                             |   3 +-
 arch/riscv/mm/fault.c                              |  49 ++--
 arch/riscv/mm/init.c                               |  58 +++++
 drivers/acpi/Makefile                              |   2 +
 drivers/acpi/osl.c                                 |   2 +-
 drivers/acpi/processor_core.c                      |  29 +++
 drivers/acpi/riscv/Makefile                        |   2 +
 drivers/acpi/riscv/rhct.c                          |  83 +++++++
 drivers/acpi/tables.c                              |  10 +
 drivers/clocksource/timer-riscv.c                  |  92 ++++---
 drivers/crypto/hisilicon/qm.c                      |   5 +
 drivers/irqchip/irq-riscv-intc.c                   |  70 ++++--
 drivers/perf/riscv_pmu_sbi.c                       |  23 +-
 drivers/platform/surface/aggregator/Kconfig        |   2 +-
 include/uapi/linux/elf.h                           |   1 +
 include/uapi/linux/prctl.h                         |  11 +
 kernel/sys.c                                       |  12 +
 tools/testing/selftests/riscv/Makefile             |   2 +-
 tools/testing/selftests/riscv/hwprobe/.gitignore   |   1 +
 tools/testing/selftests/riscv/vector/.gitignore    |   2 +
 tools/testing/selftests/riscv/vector/Makefile      |  15 ++
 .../selftests/riscv/vector/vstate_exec_nolibc.c    | 111 +++++++++
 .../testing/selftests/riscv/vector/vstate_prctl.c  | 189 ++++++++++++++
 78 files changed, 3077 insertions(+), 251 deletions(-)
 create mode 100644 Documentation/riscv/vector.rst
 create mode 100644 arch/riscv/include/asm/acenv.h
 create mode 100644 arch/riscv/include/asm/acpi.h
 create mode 100644 arch/riscv/include/asm/cpu.h
 create mode 100644 arch/riscv/include/asm/irq_stack.h
 create mode 100644 arch/riscv/include/asm/kvm_vcpu_vector.h
 create mode 100644 arch/riscv/include/asm/vector.h
 create mode 100644 arch/riscv/kernel/acpi.c
 create mode 100644 arch/riscv/kernel/vector.c
 create mode 100644 arch/riscv/kvm/vcpu_vector.c
 create mode 100644 drivers/acpi/riscv/Makefile
 create mode 100644 drivers/acpi/riscv/rhct.c
 create mode 100644 tools/testing/selftests/riscv/hwprobe/.gitignore
 create mode 100644 tools/testing/selftests/riscv/vector/.gitignore
 create mode 100644 tools/testing/selftests/riscv/vector/Makefile
 create mode 100644 tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
 create mode 100644 tools/testing/selftests/riscv/vector/vstate_prctl.c


--===============7760992888855911227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7760992888855911227==--
