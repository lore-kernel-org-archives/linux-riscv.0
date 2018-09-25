From: andrea.parri@amarulasolutions.com (Andrea Parri)
Date: Tue, 25 Sep 2018 14:12:23 +0200
Subject: [PATCH trivial 0/2] h8300, riscv: Remove smp_mb__{before,
 after}_clear_bit()
Message-ID: <20180925121225.9917-1-andrea.parri@amarulasolutions.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

A trivial clean-up, removing the (now obsolete) definitions of the two
barriers. (smp_mb__{before,after}_atomic() can serve similar purposes.)

  Andrea

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: <uclinux-h8-devel@lists.sourceforge.jp>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: <linux-riscv@lists.infradead.org>

Andrea Parri (2):
  riscv/bitops: Remove smp_mb__{before,after}_clear_bit()
  h8300/bitops: Remove smp_mb__{before,after}_clear_bit()

 arch/h8300/include/asm/bitops.h | 6 ------
 arch/riscv/include/asm/bitops.h | 5 -----
 2 files changed, 11 deletions(-)

-- 
2.17.1
