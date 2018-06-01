From: luc.vanoostenryck@gmail.com (Luc Van Oostenryck)
Date: Fri,  1 Jun 2018 17:21:20 +0200
Subject: [PATCH 0/3] riscv: fix sparse annotations
Message-ID: <20180601152123.47256-1-luc.vanoostenryck@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The RISC-V implementation seems to be quite clean regarding
sparse annotations. There is anyway three small glitches
which are corrected by this series.

Note: the 3rd patch may need another solution.

Luc Van Oostenryck (3):
  riscv: use NULL instead of a plain 0
  riscv: no __user for probe_kernel_address()
  riscv: fix __user annotation for __copy_user()

 arch/riscv/include/asm/cacheflush.h | 2 +-
 arch/riscv/include/asm/tlbflush.h   | 2 +-
 arch/riscv/include/asm/uaccess.h    | 8 ++++----
 arch/riscv/kernel/traps.c           | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.17.1
