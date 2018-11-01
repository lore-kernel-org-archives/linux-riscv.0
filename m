From: atish.patra@wdc.com (Atish Patra)
Date: Thu,  1 Nov 2018 16:04:26 -0700
Subject: [RFC 0/2] Add RISC-V cpu topology
Message-ID: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This patch series adds the cpu topology for RISC-V. It contains
both the DT binding and actual source code. It has been tested on
QEMU & Unleashed board. 

The idea is based on cpu-map in ARM with changes related to how
we define SMT systems. The reason for adopting a similar approach
to ARM as I feel it provides a very clear way of defining the
topology compared to parsing cache nodes to figure out which cpus
share the same package or core.  I am open to any other idea to
implement cpu-topology as well.

Atish Patra (2):
  dt-bindings: topology: Add RISC-V cpu topology.
  RISC-V: Introduce cpu topology.

 .../devicetree/bindings/riscv/topology.txt         | 154 ++++++++++++++++
 arch/riscv/include/asm/topology.h                  |  28 +++
 arch/riscv/kernel/Makefile                         |   1 +
 arch/riscv/kernel/smpboot.c                        |   5 +-
 arch/riscv/kernel/topology.c                       | 194 +++++++++++++++++++++
 5 files changed, 381 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/riscv/topology.txt
 create mode 100644 arch/riscv/include/asm/topology.h
 create mode 100644 arch/riscv/kernel/topology.c

-- 
2.7.4
