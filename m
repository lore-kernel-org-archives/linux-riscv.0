From: palmer@sifive.com (Palmer Dabbelt)
Date: Tue, 13 Nov 2018 09:20:38 -0800 (PST)
Subject: [PULL RFC] RISC-V Patches for 4.20-rc2
Message-ID: <mhng-2b0cf1d3-ff52-41e3-a683-5875c687984e@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The following changes since commit ccda4af0f4b92f7b4c308d3acc262f4a7e3affad:

  Linux 4.20-rc2 (2018-11-11 17:12:31 -0600)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.20-rc2

for you to fetch changes up to ef3a61406618291c46da168ff91acaa28d85944c:

  RISC-V: Silence some module warnings on 32-bit (2018-11-12 18:12:24 -0800)

----------------------------------------------------------------
RISC-V Patches for 4.20-rc2

This pull request contains a for unrelated patches that fix various
issues in the RISC-V port:

* A patch that enables printk timestamps in the RISC-V defconfig.
* A whitespace fix to "struct pt_regs".
* A patch that adds a "vdso_install" target for RISC-V.
* A pair of build fixes: one to fix a typo in our makefile, and one to
  clean up some warnings.

There will probably be more patches from us for 4.20, but I don't have
anything that's ready to go right now so I'm going to hold off a bit.
Right now the only concrete thing I know I want to make sure gets sorted
out is our 32-bit stat interface, which I don't want sitting in limbo
for another cycle as we have to get RV32I glibc sone.

----------------------------------------------------------------
Anup Patel (1):
      RISC-V: defconfig: Enable printk timestamps

David Abdurachmanov (2):
      riscv: fix spacing in struct pt_regs
      riscv: add missing vdso_install target

Olof Johansson (2):
      RISC-V: lib: Fix build error for 64-bit
      RISC-V: Silence some module warnings on 32-bit

 arch/riscv/Makefile             |  4 ++++
 arch/riscv/configs/defconfig    |  1 +
 arch/riscv/include/asm/ptrace.h |  4 ++--
 arch/riscv/kernel/module.c      | 12 ++++++------
 arch/riscv/lib/Makefile         |  2 +-
 5 files changed, 14 insertions(+), 9 deletions(-)
