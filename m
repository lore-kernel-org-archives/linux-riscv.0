From: parri.andrea@gmail.com (Andrea Parri)
Date: Tue, 27 Feb 2018 03:24:11 +0100
Subject: [PATCH] riscv/barrier: Define __smp_{store_release,load_acquire}
Message-ID: <1519698251-19272-1-git-send-email-parri.andrea@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Introduce __smp_{store_release,load_acquire}, and rely on the generic
definitions for smp_{store_release,load_acquire}. This avoids the use
of full ("rw,rw") fences on SMP.

Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 arch/riscv/include/asm/barrier.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index 5510366d169ae..d4628e4b3a5ea 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -38,6 +38,21 @@
 #define __smp_rmb()	RISCV_FENCE(r,r)
 #define __smp_wmb()	RISCV_FENCE(w,w)
 
+#define __smp_store_release(p, v)					\
+do {									\
+	compiletime_assert_atomic_type(*p);				\
+	RISCV_FENCE(rw,w);						\
+	WRITE_ONCE(*p, v);						\
+} while (0)
+
+#define __smp_load_acquire(p)						\
+({									\
+	typeof(*p) ___p1 = READ_ONCE(*p);				\
+	compiletime_assert_atomic_type(*p);				\
+	RISCV_FENCE(r,rw);						\
+	___p1;								\
+})
+
 /*
  * This is a very specific barrier: it's currently only used in two places in
  * the kernel, both in the scheduler.  See include/linux/spinlock.h for the two
-- 
2.7.4
