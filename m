From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 25 Apr 2018 10:16:55 -0700 (PDT)
Subject: [GIT PULL] RISC-V Fixes for 4.17-rc3
Message-ID: <mhng-ef6ff42c-a1bb-4a98-b1fe-4d27d49e82c3@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The following changes since commit 6d08b06e67cd117f6992c46611dfb4ce267cd71e:

  Linux 4.17-rc2 (2018-04-22 19:20:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.17-rc3

for you to fetch changes up to 85602bea297fc4e5223adbf7006dcce9aa694f17:

  RISC-V: build vdso-dummy.o with -no-pie (2018-04-24 10:54:46 -0700)

----------------------------------------------------------------
RISC-V Fixes for 4.17-rc3

This pull request contains three small fixes related to the RISC-V port
that I'd like to target for 4.17-rc3:

* A Kconfig cleanup to select DMA_DIRECT_OPS instead of redefining it in
  arch/riscv.
* The removal of asm/handle_irq.h, which doesn't exist, from our arch
  header list.
* The addition of "-no-pie" the link rules for our VDSO-related files,
  which fixes the build on systems where PIE is enabled by default.

----------------------------------------------------------------
Aurelien Jarno (1):
      RISC-V: build vdso-dummy.o with -no-pie

Christoph Hellwig (2):
      riscv: select DMA_DIRECT_OPS instead of redefining it
      riscv: there is no <asm/handle_irq.h>

 arch/riscv/Kconfig              | 4 +---
 arch/riscv/include/asm/Kbuild   | 1 -
 arch/riscv/kernel/vdso/Makefile | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)
