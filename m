From: andrea.parri@amarulasolutions.com (Andrea Parri)
Date: Tue, 25 Sep 2018 14:12:24 +0200
Subject: [PATCH 1/2] riscv/bitops: Remove smp_mb__{before,after}_clear_bit()
In-Reply-To: <20180925121225.9917-1-andrea.parri@amarulasolutions.com>
References: <20180925121225.9917-1-andrea.parri@amarulasolutions.com>
Message-ID: <20180925121225.9917-2-andrea.parri@amarulasolutions.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The barriers are unused; remove their definition.

Signed-off-by: Andrea Parri <andrea.parri@amarulasolutions.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: <linux-riscv@lists.infradead.org>
---
 arch/riscv/include/asm/bitops.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index f30daf26f08f4..01db98dfd0435 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -23,11 +23,6 @@
 #include <asm/barrier.h>
 #include <asm/bitsperlong.h>
 
-#ifndef smp_mb__before_clear_bit
-#define smp_mb__before_clear_bit()  smp_mb()
-#define smp_mb__after_clear_bit()   smp_mb()
-#endif /* smp_mb__before_clear_bit */
-
 #include <asm-generic/bitops/__ffs.h>
 #include <asm-generic/bitops/ffz.h>
 #include <asm-generic/bitops/fls.h>
-- 
2.17.1
