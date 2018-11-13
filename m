From: me@packi.ch (=?UTF-8?q?Patrick=20St=C3=A4hlin?=)
Date: Tue, 13 Nov 2018 20:58:02 +0100
Subject: [RFC/RFT 0/2] RISC-V: kprobes/kretprobe support
Message-ID: <20181113195804.22825-1-me@packi.ch>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi,

this is first version of kprobes/kretprobe support for RISC-V. Most of
the code is based on arm64 but obviously without the single-step
functionality.

It will insert a C.EBREAK instruction that is later being captured. The
only instruction supported at the moment is C.ADDISP16 as this sets-up
the stack frames for all the functions I've tested.

I've tested this on QEMU with multiple CPUs but don't have any real
hardware available for testing, and from experience that's when things
start breaking.

The plan is to expand compressed instructions to full ones and simulate
those to reduce the decoding overhead per intercepted call.

Please let me know if you have any objections to path I've chosen and
which instructions you absolutely need for a first version.

To enable this you need the following defines:

CONFIG_FUNCTION_TRACER=y
CONFIG_KPROBES=y
CONFIG_MODULES=y

The CONFIG_FUNCTION_TRACER is not strictly needed but makes testing
easier using debugfs.

After that, any example documented in 
Documentation/trace/kprobetrace.rst should work.

Patrick St?hlin (2):
  RISC-V: Implement ptrace regs and stack API
  RISC-V: kprobes/kretprobe support

 arch/riscv/Kconfig                            |   6 +-
 arch/riscv/include/asm/kprobes.h              |  30 ++
 arch/riscv/include/asm/probes.h               |  26 ++
 arch/riscv/include/asm/ptrace.h               |  34 ++
 arch/riscv/kernel/Makefile                    |   1 +
 arch/riscv/kernel/probes/Makefile             |   3 +
 arch/riscv/kernel/probes/decode-insn.c        |  38 ++
 arch/riscv/kernel/probes/decode-insn.h        |  23 +
 arch/riscv/kernel/probes/kprobes.c            | 401 ++++++++++++++++++
 arch/riscv/kernel/probes/kprobes_trampoline.S |  91 ++++
 arch/riscv/kernel/probes/simulate-insn.c      |  33 ++
 arch/riscv/kernel/probes/simulate-insn.h      |   8 +
 arch/riscv/kernel/ptrace.c                    |  99 +++++
 arch/riscv/kernel/traps.c                     |  13 +-
 arch/riscv/mm/fault.c                         |  28 +-
 15 files changed, 828 insertions(+), 6 deletions(-)
 create mode 100644 arch/riscv/include/asm/probes.h
 create mode 100644 arch/riscv/kernel/probes/Makefile
 create mode 100644 arch/riscv/kernel/probes/decode-insn.c
 create mode 100644 arch/riscv/kernel/probes/decode-insn.h
 create mode 100644 arch/riscv/kernel/probes/kprobes.c
 create mode 100644 arch/riscv/kernel/probes/kprobes_trampoline.S
 create mode 100644 arch/riscv/kernel/probes/simulate-insn.c
 create mode 100644 arch/riscv/kernel/probes/simulate-insn.h

-- 
2.17.1
