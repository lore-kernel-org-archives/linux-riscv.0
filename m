From: palmer@sifive.com (Palmer Dabbelt)
Date: Fri, 17 Aug 2018 13:28:11 -0700 (PDT)
Subject: [GIT PULL] RISC-V Updates for the 4.19 Merge Window
Message-ID: <mhng-4afb9897-29ed-4eb4-88d7-6cfb09a0a65c@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

I remember having sent this on Wednesday, but for some reason I don't see it in
your tree or my outbox so I might be crazy.  I was planning submitting some
more patches next week anyway, so while I'm OK just rolling these up as well
it'd be slightly easier if we can get these into -rc1 so we can test them.

Sorry!




The following changes since commit 94710cac0ef4ee177a63b5227664b38c95bbf703:

  Linux 4.18 (2018-08-12 13:41:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.19-mw0

for you to fetch changes up to 627672cf431b0379c07cc8d146f907cda6797222:

  dt-bindings: interrupt-controller: SiFive Plaform Level Interrupt Controller (2018-08-13 09:39:11 -0700)

----------------------------------------------------------------
RISC-V Updates for the 4.19 Merge Window

This tag contains some major improvements to the RISC-V port, including
the necessary interrupt controller and timer support to actually make it
to userspace.  Support for three devices has been added:

* Support for the ISA-mandated timers on RISC-V systems.
* Support for the ISA-mandated first-level interrupt controller on
  RISC-V systems, which is handled as part of our core arch code because
  it's very small and tightly tied to the ISA.
* Support for SiFive's platform-level interrupt controller, which talks
  to the actual devices.

In addition to these new devices, there are a handful of cleanups all
over the RISC-V tree:

* Build fixes for various configurations
    * A fix to the vDSO build's makefile so it respects CFLAGS.
    * The addition of __lshrti3, a libgcc derived function necessary for
      some 32-bit configurations.
    * !SMP && PERF_EVENTS
* Cleanups to the arch code to remove the remnants of old versions of
  the drivers that were just properly submitted.
    * Some dead code from the timer driver, most of which wasn't ever
      even compiled.
    * Cleanups of some interrupt #defines, which are now local to the
      interrupt handling code.
* Fixes to ptrace(), which while not being sufficient to fully make GDB
  work are at least sufficient to get simple GDB tasks to work.
* Early printk support via RISC-V's architecturally mandated SBI console
  device.
* A fix to our early debug trap handler to ensure it's always aligned.

These patches have all been through a fairly extensive review process,
but as this enables a whole pile of functionality (ie, userspace) I'm
confident we'll need to submit a few more patches.  The only concrete
issues I know about are the sys_riscv_flush_icache patches, but as I
managed to screw those up on Friday I figured it'd be best to let them
bake another week.

This tag boots a Fedora root filesystem on QEMU's master branch for me,
and before this morning's rebase (from 4.18-rc8 to 4.18) it booted on
the HiFive Unleashed.

Thanks to Christoph Hellwig and the other guys at WD for getting the new
drivers in shape!

----------------------------------------------------------------
Alex Guo (1):
      RISC-V: implement __lshrti3.

Atish Patra (1):
      RISC-V: Fix !CONFIG_SMP compilation error

Christoph Hellwig (6):
      RISC-V: remove timer leftovers
      RISC-V: simplify software interrupt / IPI code
      RISC-V: remove INTERRUPT_CAUSE_* defines from asm/irq.h
      RISC-V: add a definition for the SIE SEIE bit
      RISC-V: implement low-level interrupt handling
      irqchip: add a SiFive PLIC driver

Jim Wilson (1):
      RISC-V: Don't increment sepc after breakpoint.

Palmer Dabbelt (5):
      RISC-V: Use KBUILD_CFLAGS instead of KCFLAGS when building the vDSO
      RISC-V: Add early printk support via the SBI console
      clocksource: new RISC-V SBI timer driver
      dt-bindings: interrupt-controller: RISC-V local interrupt controller
      dt-bindings: interrupt-controller: SiFive Plaform Level Interrupt Controller

Zong Li (1):
      RISC-V: Add the directive for alignment of stvec's value

 .../interrupt-controller/riscv,cpu-intc.txt        |  44 ++++
 .../interrupt-controller/sifive,plic-1.0.0.txt     |  58 +++++
 arch/riscv/Makefile                                |   3 +
 arch/riscv/configs/defconfig                       |   1 +
 arch/riscv/include/asm/csr.h                       |   1 +
 arch/riscv/include/asm/irq.h                       |   5 +-
 arch/riscv/include/asm/perf_event.h                |   1 +
 arch/riscv/include/asm/smp.h                       |   6 -
 arch/riscv/kernel/entry.S                          |   4 +-
 arch/riscv/kernel/head.S                           |   2 +
 arch/riscv/kernel/irq.c                            |  55 ++++-
 arch/riscv/kernel/perf_event.c                     |   1 -
 arch/riscv/kernel/setup.c                          |  27 +++
 arch/riscv/kernel/smp.c                            |   6 +-
 arch/riscv/kernel/smpboot.c                        |   1 -
 arch/riscv/kernel/time.c                           |  30 +--
 arch/riscv/kernel/traps.c                          |   1 -
 arch/riscv/kernel/vdso/Makefile                    |   4 +-
 arch/riscv/lib/Makefile                            |   1 +
 arch/riscv/lib/tishift.S                           |  42 ++++
 drivers/clocksource/Kconfig                        |  11 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/riscv_timer.c                  | 105 +++++++++
 drivers/irqchip/Kconfig                            |  12 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-sifive-plic.c                  | 260 +++++++++++++++++++++
 include/linux/cpuhotplug.h                         |   1 +
 27 files changed, 625 insertions(+), 59 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.txt
 create mode 100644 arch/riscv/lib/tishift.S
 create mode 100644 drivers/clocksource/riscv_timer.c
 create mode 100644 drivers/irqchip/irq-sifive-plic.c
