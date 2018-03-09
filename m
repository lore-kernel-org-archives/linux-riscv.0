From: parri.andrea@gmail.com (Andrea Parri)
Date: Fri,  9 Mar 2018 13:12:39 +0100
Subject: [PATCH v2 0/2] riscv/spinlock,atomic: Miscellaneous fixes
Message-ID: <1520597559-16547-1-git-send-email-parri.andrea@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi,

The series is a follow-up on the discussion in [1], which led to the
discovery of a few issues in the current implementations of RISC-V
locking and atomic operations.

In summary, this series proposes the following modifications:

  1. Use lightweigth fences for acquire/release (locking, atomics)

  2. Use the combination of .rl and full fences for fully-ordered
     atomics implemented with LR/SC pairs.

  3. A few style changes (80-chars lines, alignment).

Applies on top of "next-smp_sl_ar".

Cheers,
  Andrea

Changes since v1 [2]:
  - correct implementation of atomic_{xchg,cmpxchg}_release().

[1] https://marc.info/?l=linux-kernel&m=151930201102853&w=2
[2] https://marc.info/?l=linux-kernel&m=152027423529883&w=2

Andrea Parri (2):
  riscv/spinlock: Strengthen implementations with fences
  riscv/atomic: Strengthen implementations with fences

 arch/riscv/include/asm/atomic.h   | 417 ++++++++++++++++++++++++--------------
 arch/riscv/include/asm/cmpxchg.h  | 391 ++++++++++++++++++++++++++++-------
 arch/riscv/include/asm/fence.h    |  12 ++
 arch/riscv/include/asm/spinlock.h |  29 +--
 4 files changed, 615 insertions(+), 234 deletions(-)
 create mode 100644 arch/riscv/include/asm/fence.h

-- 
2.7.4
