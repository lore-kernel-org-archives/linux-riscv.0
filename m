From: vincentc@andestech.com (Vincent Chen)
Date: Wed, 31 Oct 2018 18:35:28 +0800
Subject: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
Message-ID: <1540982130-28248-1-git-send-email-vincentc@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

  RISC-V permits each vendor to develop respective extension ISA based
on RISC-V standard ISA. This means that these vendor-specific features
may be compatible to their compiler and CPU. Therefore, each vendor may
be considered a sub-architecture of RISC-V. Currently, vendors do not
have the appropriate examples to add these specific features to the
kernel. In this RFC set, we propose an infrastructure that vendor can
easily hook their specific features into kernel. The first commit is
the main body of this infrastructure. In the second commit, we provide
a solution that allows dma_map_ops() to work without cache coherent
agent support. Cache coherent agent is unsupported for low-end CPUs in
the AndeStar RISC-V series. In order for Linux to run on these CPUs, we
need this solution to overcome the limitation of cache coherent agent
support. Hence, it also can be used as an example for the first commit.

  I am glad to discuss any ideas, so if you have any idea, please give
me some feedback.

Vincent Chen (2):
  RISC-V: An infrastructure to add vendor-specific code.
  RISC-V: make dma_map_ops work without cache coherent agent

 arch/riscv/Kconfig                              |   49 +++++
 arch/riscv/Makefile                             |    6 +
 arch/riscv/include/asm/sbi.h                    |    6 +
 arch/riscv/include/asm/vendor-hook.h            |   13 ++
 arch/riscv/kernel/cpufeature.c                  |    5 +
 arch/riscv/kernel/setup.c                       |    6 +-
 arch/riscv/vendor-nds/Kconfig                   |   29 +++
 arch/riscv/vendor-nds/Makefile                  |    1 +
 arch/riscv/vendor-nds/cache.c                   |   83 ++++++++
 arch/riscv/vendor-nds/include/asm/csr.h         |   32 +++
 arch/riscv/vendor-nds/include/asm/dma-mapping.h |   24 +++
 arch/riscv/vendor-nds/include/asm/proc.h        |   17 ++
 arch/riscv/vendor-nds/include/asm/sbi.h         |   17 ++
 arch/riscv/vendor-nds/include/asm/vendor-hook.h |    8 +
 arch/riscv/vendor-nds/noncoherent_dma.c         |  254 +++++++++++++++++++++++
 arch/riscv/vendor-nds/setup.c                   |   16 ++
 16 files changed, 565 insertions(+), 1 deletions(-)
 create mode 100644 arch/riscv/include/asm/vendor-hook.h
 create mode 100644 arch/riscv/vendor-nds/Kconfig
 create mode 100644 arch/riscv/vendor-nds/Makefile
 create mode 100644 arch/riscv/vendor-nds/cache.c
 create mode 100644 arch/riscv/vendor-nds/include/asm/csr.h
 create mode 100644 arch/riscv/vendor-nds/include/asm/dma-mapping.h
 create mode 100644 arch/riscv/vendor-nds/include/asm/proc.h
 create mode 100644 arch/riscv/vendor-nds/include/asm/sbi.h
 create mode 100644 arch/riscv/vendor-nds/include/asm/vendor-hook.h
 create mode 100644 arch/riscv/vendor-nds/noncoherent_dma.c
 create mode 100644 arch/riscv/vendor-nds/setup.c
