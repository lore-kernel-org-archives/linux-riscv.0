From: parri.andrea@gmail.com (Andrea Parri)
Date: Tue, 20 Feb 2018 11:17:28 +0100
Subject: [PATCH RFC] riscv/barrier: Define __smp_{mb,rmb,wmb}
Message-ID: <1519121848-28582-1-git-send-email-parri.andrea@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Introduce __smp_{mb,rmb,wmb}, and rely on the generic definitions
for smp_{mb,rmb,wmb}. A first consequence is that smp_{mb,rmb,wmb}
map to a compiler barrier on !SMP (while their definition remains
unchanged on SMP). As a further consequence, smp_load_acquire and
smp_store_release have "fence rw,rw" instead of "fence iorw,iorw".

Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 arch/riscv/include/asm/barrier.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index c0319cbf1eec5..5510366d169ae 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -34,9 +34,9 @@
 #define wmb()		RISCV_FENCE(ow,ow)
 
 /* These barriers do not need to enforce ordering on devices, just memory. */
-#define smp_mb()	RISCV_FENCE(rw,rw)
-#define smp_rmb()	RISCV_FENCE(r,r)
-#define smp_wmb()	RISCV_FENCE(w,w)
+#define __smp_mb()	RISCV_FENCE(rw,rw)
+#define __smp_rmb()	RISCV_FENCE(r,r)
+#define __smp_wmb()	RISCV_FENCE(w,w)
 
 /*
  * This is a very specific barrier: it's currently only used in two places in
-- 
2.7.4
