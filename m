Return-Path: <SRS0=DJxK=E6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE4DC56201
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 13:52:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3ABD220872
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 13:52:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z5vw/g4p";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWeVcruD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3ABD220872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BqGbOG2iEBzr2hojX890kEas9UgUSuzFhOCfXIbFtt8=; b=z5vw/g4p5xzqoNRmQa+T0GSkrn
	/71zykC2TGn+ZYorzV6n+wicSSc6C9HDBSe234plH/SME4k8uraHh1ptIJCwXOUVqaoiTzk1OOCTv
	aPRAgoNQcH1vje9ycHS3ftLLUie+VrHzp0s9/+2HVgYZl8trT+urtG5RDa01dVuCd+tQcCdDzB2dN
	x1AnR+JbSnUJ2KJDKaBwJ7cwhbSNM8yNXdk+4W4oT06PGL0hhEq2mo1bXYb6SeEBSDnbqIdHaDnTl
	peKYysHGvLNdDkJeWjeksi6zEg+Imtx9WlxZepLWqbHQTZ39xBkNPfO6FfCwB8E1Lr1IWnhgy0TBv
	MZpHbPEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYjs-00079Y-Fh; Tue, 24 Nov 2020 13:52:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYdM-0003Mf-Ia
 for linux-riscv@lists.infradead.org; Tue, 24 Nov 2020 13:45:35 +0000
Received: from localhost.localdomain (unknown [42.120.72.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8C06C2087D;
 Tue, 24 Nov 2020 13:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606225526;
 bh=levK7wUVTU/CP5ZuAopBIMCjvkEhOFNbIvK0MW6TTKo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OWeVcruDOlUtIfI0n7ZzMU2zPgvQdLwAOfe98mOnNadTtB3A8/V+xCqiryPqyrw92
 kxi5lbehXyS1u7FIu9nPfJi6IoNbfFNIj82JJFRbhVxB1BTxIl9A7VVw7Cv2ydJtub
 f3UcNt6X9jLcrcqcNtAVm3sllMbhaDFiKNsbk1wE=
From: guoren@kernel.org
To: peterz@infradead.org, arnd@arndb.de, palmerdabbelt@google.com,
 paul.walmsley@sifive.com, anup@brainfault.org
Subject: [PATCH 5/5] csky: Optimize atomic operations with correct barrier
 usage
Date: Tue, 24 Nov 2020 13:43:57 +0000
Message-Id: <1606225437-22948-5-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606225437-22948-1-git-send-email-guoren@kernel.org>
References: <1606225437-22948-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_084529_171099_122CE4D9 
X-CRM114-Status: GOOD (  17.45  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Guo Ren <guoren@linux.alibaba.com>,
 "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, guoren@kernel.org, linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

The implementation of csky atomic operations in the past was very
rough. Frankly speaking, the implementation is wrong and limits
hardware performance. Optimize the performance of atomic, spinlock,
cmpxchg more fine-grained by increasing acquire/release memory
barriers. Here are the details of the modification:

 - Add acquire/release barrier for cmpxchg.h.
 - Remove custom atomic.h implementations.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Paul E. McKenney <paulmck@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/csky/include/asm/atomic.h  | 203 +---------------------------------------
 arch/csky/include/asm/barrier.h |  64 ++++++++++---
 arch/csky/include/asm/cmpxchg.h |  85 ++++++++++++++---
 3 files changed, 128 insertions(+), 224 deletions(-)

diff --git a/arch/csky/include/asm/atomic.h b/arch/csky/include/asm/atomic.h
index e369d73..c699c41 100644
--- a/arch/csky/include/asm/atomic.h
+++ b/arch/csky/include/asm/atomic.h
@@ -3,209 +3,10 @@
 #ifndef __ASM_CSKY_ATOMIC_H
 #define __ASM_CSKY_ATOMIC_H
 
-#include <linux/version.h>
-#include <asm/cmpxchg.h>
 #include <asm/barrier.h>
 
-#ifdef CONFIG_CPU_HAS_LDSTEX
-
-#define __atomic_add_unless __atomic_add_unless
-static inline int __atomic_add_unless(atomic_t *v, int a, int u)
-{
-	unsigned long tmp, ret;
-
-	smp_mb();
-
-	asm volatile (
-	"1:	ldex.w		%0, (%3) \n"
-	"	mov		%1, %0   \n"
-	"	cmpne		%0, %4   \n"
-	"	bf		2f	 \n"
-	"	add		%0, %2   \n"
-	"	stex.w		%0, (%3) \n"
-	"	bez		%0, 1b   \n"
-	"2:				 \n"
-		: "=&r" (tmp), "=&r" (ret)
-		: "r" (a), "r"(&v->counter), "r"(u)
-		: "memory");
-
-	if (ret != u)
-		smp_mb();
-
-	return ret;
-}
-
-#define ATOMIC_OP(op, c_op)						\
-static inline void atomic_##op(int i, atomic_t *v)			\
-{									\
-	unsigned long tmp;						\
-									\
-	asm volatile (							\
-	"1:	ldex.w		%0, (%2) \n"				\
-	"	" #op "		%0, %1   \n"				\
-	"	stex.w		%0, (%2) \n"				\
-	"	bez		%0, 1b   \n"				\
-		: "=&r" (tmp)						\
-		: "r" (i), "r"(&v->counter)				\
-		: "memory");						\
-}
-
-#define ATOMIC_OP_RETURN(op, c_op)					\
-static inline int atomic_##op##_return(int i, atomic_t *v)		\
-{									\
-	unsigned long tmp, ret;						\
-									\
-	smp_mb();							\
-	asm volatile (							\
-	"1:	ldex.w		%0, (%3) \n"				\
-	"	" #op "		%0, %2   \n"				\
-	"	mov		%1, %0   \n"				\
-	"	stex.w		%0, (%3) \n"				\
-	"	bez		%0, 1b   \n"				\
-		: "=&r" (tmp), "=&r" (ret)				\
-		: "r" (i), "r"(&v->counter)				\
-		: "memory");						\
-	smp_mb();							\
-									\
-	return ret;							\
-}
-
-#define ATOMIC_FETCH_OP(op, c_op)					\
-static inline int atomic_fetch_##op(int i, atomic_t *v)			\
-{									\
-	unsigned long tmp, ret;						\
-									\
-	smp_mb();							\
-	asm volatile (							\
-	"1:	ldex.w		%0, (%3) \n"				\
-	"	mov		%1, %0   \n"				\
-	"	" #op "		%0, %2   \n"				\
-	"	stex.w		%0, (%3) \n"				\
-	"	bez		%0, 1b   \n"				\
-		: "=&r" (tmp), "=&r" (ret)				\
-		: "r" (i), "r"(&v->counter)				\
-		: "memory");						\
-	smp_mb();							\
-									\
-	return ret;							\
-}
-
-#else /* CONFIG_CPU_HAS_LDSTEX */
-
-#include <linux/irqflags.h>
-
-#define __atomic_add_unless __atomic_add_unless
-static inline int __atomic_add_unless(atomic_t *v, int a, int u)
-{
-	unsigned long tmp, ret, flags;
-
-	raw_local_irq_save(flags);
-
-	asm volatile (
-	"	ldw		%0, (%3) \n"
-	"	mov		%1, %0   \n"
-	"	cmpne		%0, %4   \n"
-	"	bf		2f	 \n"
-	"	add		%0, %2   \n"
-	"	stw		%0, (%3) \n"
-	"2:				 \n"
-		: "=&r" (tmp), "=&r" (ret)
-		: "r" (a), "r"(&v->counter), "r"(u)
-		: "memory");
-
-	raw_local_irq_restore(flags);
-
-	return ret;
-}
-
-#define ATOMIC_OP(op, c_op)						\
-static inline void atomic_##op(int i, atomic_t *v)			\
-{									\
-	unsigned long tmp, flags;					\
-									\
-	raw_local_irq_save(flags);					\
-									\
-	asm volatile (							\
-	"	ldw		%0, (%2) \n"				\
-	"	" #op "		%0, %1   \n"				\
-	"	stw		%0, (%2) \n"				\
-		: "=&r" (tmp)						\
-		: "r" (i), "r"(&v->counter)				\
-		: "memory");						\
-									\
-	raw_local_irq_restore(flags);					\
-}
-
-#define ATOMIC_OP_RETURN(op, c_op)					\
-static inline int atomic_##op##_return(int i, atomic_t *v)		\
-{									\
-	unsigned long tmp, ret, flags;					\
-									\
-	raw_local_irq_save(flags);					\
-									\
-	asm volatile (							\
-	"	ldw		%0, (%3) \n"				\
-	"	" #op "		%0, %2   \n"				\
-	"	stw		%0, (%3) \n"				\
-	"	mov		%1, %0   \n"				\
-		: "=&r" (tmp), "=&r" (ret)				\
-		: "r" (i), "r"(&v->counter)				\
-		: "memory");						\
-									\
-	raw_local_irq_restore(flags);					\
-									\
-	return ret;							\
-}
-
-#define ATOMIC_FETCH_OP(op, c_op)					\
-static inline int atomic_fetch_##op(int i, atomic_t *v)			\
-{									\
-	unsigned long tmp, ret, flags;					\
-									\
-	raw_local_irq_save(flags);					\
-									\
-	asm volatile (							\
-	"	ldw		%0, (%3) \n"				\
-	"	mov		%1, %0   \n"				\
-	"	" #op "		%0, %2   \n"				\
-	"	stw		%0, (%3) \n"				\
-		: "=&r" (tmp), "=&r" (ret)				\
-		: "r" (i), "r"(&v->counter)				\
-		: "memory");						\
-									\
-	raw_local_irq_restore(flags);					\
-									\
-	return ret;							\
-}
-
-#endif /* CONFIG_CPU_HAS_LDSTEX */
-
-#define atomic_add_return atomic_add_return
-ATOMIC_OP_RETURN(add, +)
-#define atomic_sub_return atomic_sub_return
-ATOMIC_OP_RETURN(sub, -)
-
-#define atomic_fetch_add atomic_fetch_add
-ATOMIC_FETCH_OP(add, +)
-#define atomic_fetch_sub atomic_fetch_sub
-ATOMIC_FETCH_OP(sub, -)
-#define atomic_fetch_and atomic_fetch_and
-ATOMIC_FETCH_OP(and, &)
-#define atomic_fetch_or atomic_fetch_or
-ATOMIC_FETCH_OP(or, |)
-#define atomic_fetch_xor atomic_fetch_xor
-ATOMIC_FETCH_OP(xor, ^)
-
-#define atomic_and atomic_and
-ATOMIC_OP(and, &)
-#define atomic_or atomic_or
-ATOMIC_OP(or, |)
-#define atomic_xor atomic_xor
-ATOMIC_OP(xor, ^)
-
-#undef ATOMIC_FETCH_OP
-#undef ATOMIC_OP_RETURN
-#undef ATOMIC_OP
+#define __atomic_acquire_fence() __smp_acquire_fence()
+#define __atomic_release_fence() __smp_release_fence()
 
 #include <asm-generic/atomic.h>
 
diff --git a/arch/csky/include/asm/barrier.h b/arch/csky/include/asm/barrier.h
index a430e7f..6f8269b 100644
--- a/arch/csky/include/asm/barrier.h
+++ b/arch/csky/include/asm/barrier.h
@@ -16,24 +16,64 @@
  * sync.i:      inherit from sync, but also flush cpu pipeline
  * sync.is:     the same with sync.i + sync.s
  *
- * bar.brwarw:  ordering barrier for all load/store instructions before it
- * bar.brwarws: ordering barrier for all load/store instructions before it
- *						and shareable to other cores
- * bar.brar:    ordering barrier for all load       instructions before it
- * bar.brars:   ordering barrier for all load       instructions before it
- *						and shareable to other cores
- * bar.bwaw:    ordering barrier for all store      instructions before it
- * bar.bwaws:   ordering barrier for all store      instructions before it
- *						and shareable to other cores
+ *
+ * bar.brwarws: ordering barrier for all load/store instructions
+ *              before/after it and share to other harts
+ *
+ * |31|30 26|25 21|20 16|15  10|9   5|4           0|
+ *  1  10000 s0000 00000 100001	00001 0 bw br aw ar
+ *
+ * b: before
+ * a: after
+ * r: read
+ * w: write
+ * s: share to other harts
+ *
+ * Here are all combinations:
+ *
+ * bar.brws
+ * bar.brs
+ * bar.bws
+ * bar.arws
+ * bar.ars
+ * bar.aws
+ * bar.brwarws
+ * bar.brarws
+ * bar.bwarws
+ * bar.brwars
+ * bar.brwaws
+ * bar.brars
+ * bar.bwaws
  */
 
 #ifdef CONFIG_CPU_HAS_CACHEV2
 #define mb()		asm volatile ("sync.s\n":::"memory")
 
 #ifdef CONFIG_SMP
-#define __smp_mb()	asm volatile ("bar.brwarws\n":::"memory")
-#define __smp_rmb()	asm volatile ("bar.brars\n":::"memory")
-#define __smp_wmb()	asm volatile ("bar.bwaws\n":::"memory")
+
+#define __bar_brws()	asm volatile (".long 0x842cc200\n":::"memory")
+#define __bar_brs()	asm volatile (".long 0x8424c200\n":::"memory")
+#define __bar_bws()	asm volatile (".long 0x8428c200\n":::"memory")
+#define __bar_arws()	asm volatile (".long 0x8423c200\n":::"memory")
+#define __bar_ars()	asm volatile (".long 0x8421c200\n":::"memory")
+#define __bar_aws()	asm volatile (".long 0x8422c200\n":::"memory")
+#define __bar_brwarws()	asm volatile (".long 0x842fc200\n":::"memory")
+#define __bar_brarws()	asm volatile (".long 0x8427c200\n":::"memory")
+#define __bar_bwarws()	asm volatile (".long 0x842bc200\n":::"memory")
+#define __bar_brwars()	asm volatile (".long 0x842dc200\n":::"memory")
+#define __bar_brwaws()	asm volatile (".long 0x842ec200\n":::"memory")
+#define __bar_brars()	asm volatile (".long 0x8425c200\n":::"memory")
+#define __bar_brars()	asm volatile (".long 0x8425c200\n":::"memory")
+#define __bar_bwaws()	asm volatile (".long 0x842ac200\n":::"memory")
+
+#define __smp_mb()	__bar_brwarws()
+#define __smp_rmb()	__bar_brars()
+#define __smp_wmb()	__bar_bwaws()
+
+#define ACQUIRE_FENCE		".long 0x8427c200\n"
+#define __smp_acquire_fence()	__bar_brarws()
+#define __smp_release_fence()	__bar_brwaws()
+
 #endif /* CONFIG_SMP */
 
 #define sync_is()	asm volatile ("sync.is\n":::"memory")
diff --git a/arch/csky/include/asm/cmpxchg.h b/arch/csky/include/asm/cmpxchg.h
index ca03e90..3030608 100644
--- a/arch/csky/include/asm/cmpxchg.h
+++ b/arch/csky/include/asm/cmpxchg.h
@@ -8,7 +8,7 @@
 
 extern void __bad_xchg(void);
 
-#define __xchg(new, ptr, size)					\
+#define __xchg_relaxed(new, ptr, size)				\
 ({								\
 	__typeof__(ptr) __ptr = (ptr);				\
 	__typeof__(new) __new = (new);				\
@@ -18,7 +18,6 @@ extern void __bad_xchg(void);
 	case 2:							\
 		align = ((unsigned long) __ptr & 0x3);		\
 		addr = ((unsigned long) __ptr & ~0x3);		\
-		smp_mb();					\
 		if (align) {					\
 		asm volatile (					\
 		"1:	ldex.w		%0, (%4) \n"		\
@@ -50,10 +49,8 @@ extern void __bad_xchg(void);
 			: "r" (__new), "r"(addr)		\
 			:);					\
 		}						\
-		smp_mb();					\
 		break;						\
 	case 4:							\
-		smp_mb();					\
 		asm volatile (					\
 		"1:	ldex.w		%0, (%3) \n"		\
 		"	mov		%1, %2   \n"		\
@@ -62,7 +59,6 @@ extern void __bad_xchg(void);
 			: "=&r" (__ret), "=&r" (tmp)		\
 			: "r" (__new), "r"(__ptr)		\
 			:);					\
-		smp_mb();					\
 		break;						\
 	default:						\
 		__bad_xchg();					\
@@ -70,9 +66,32 @@ extern void __bad_xchg(void);
 	__ret;							\
 })
 
-#define xchg(ptr, x)	(__xchg((x), (ptr), sizeof(*(ptr))))
+#define xchg_relaxed(ptr, x)					\
+({								\
+	__xchg_relaxed((x), (ptr), sizeof(*(ptr)));		\
+})
+
+#define xchg_acquire(ptr, x)					\
+({								\
+	__typeof__(*(ptr)) __ret;				\
+	__ret = xchg_relaxed(ptr, x);				\
+	__smp_acquire_fence();					\
+	__ret;							\
+})
+
+#define xchg_release(ptr, x)					\
+({								\
+	__smp_release_fence();					\
+	xchg_relaxed(ptr, x);					\
+})
+
+#define xchg(ptr, x)						\
+({								\
+	__smp_release_fence();					\
+	xchg_acquire(ptr, x);					\
+})
 
-#define __cmpxchg(ptr, old, new, size)				\
+#define __cmpxchg_relaxed(ptr, old, new, size)			\
 ({								\
 	__typeof__(ptr) __ptr = (ptr);				\
 	__typeof__(new) __new = (new);				\
@@ -81,7 +100,6 @@ extern void __bad_xchg(void);
 	__typeof__(*(ptr)) __ret = 0;				\
 	switch (size) {						\
 	case 4:							\
-		smp_mb();					\
 		asm volatile (					\
 		"1:	ldex.w		%0, (%3) \n"		\
 		"	cmpne		%0, %4   \n"		\
@@ -93,7 +111,6 @@ extern void __bad_xchg(void);
 			: "=&r" (__ret), "=&r" (__tmp)		\
 			: "r" (__new), "r"(__ptr), "r"(__old)	\
 			:);					\
-		smp_mb();					\
 		break;						\
 	default:						\
 		__bad_xchg();					\
@@ -101,8 +118,54 @@ extern void __bad_xchg(void);
 	__ret;							\
 })
 
-#define cmpxchg(ptr, o, n) \
-	(__cmpxchg((ptr), (o), (n), sizeof(*(ptr))))
+#define cmpxchg_relaxed(ptr, o, n)				\
+	(__cmpxchg_relaxed((ptr), (o), (n), sizeof(*(ptr))))
+
+#define cmpxchg_release(ptr, o, n)				\
+({								\
+	__smp_release_fence();					\
+	cmpxchg_relaxed(ptr, o, n);				\
+})
+
+#define __cmpxchg_acquire(ptr, old, new, size)			\
+({								\
+	__typeof__(ptr) __ptr = (ptr);				\
+	__typeof__(new) __new = (new);				\
+	__typeof__(new) __tmp;					\
+	__typeof__(old) __old = (old);				\
+	__typeof__(*(ptr)) __ret = 0;				\
+	switch (size) {						\
+	case 4:							\
+		asm volatile (					\
+		"1:	ldex.w		%0, (%3) \n"		\
+		"	cmpne		%0, %4   \n"		\
+		"	bt		2f       \n"		\
+		"	mov		%1, %2   \n"		\
+		"	stex.w		%1, (%3) \n"		\
+		"	bez		%1, 1b   \n"		\
+		ACQUIRE_FENCE					\
+		"2:				 \n"		\
+			: "=&r" (__ret), "=&r" (__tmp)		\
+			: "r" (__new), "r"(__ptr), "r"(__old)	\
+			:);					\
+		break;						\
+	default:						\
+		__bad_xchg();					\
+	}							\
+	__ret;							\
+})
+
+#define cmpxchg_acquire(ptr, o, n)				\
+	(__cmpxchg_acquire((ptr), (o), (n), sizeof(*(ptr))))
+
+#define cmpxchg(ptr, o, n)					\
+({								\
+	__typeof__(*(ptr)) __ret;				\
+	__smp_release_fence();					\
+	__ret = cmpxchg_acquire(ptr, o, n);			\
+	__ret;							\
+})
+
 #else
 #include <asm-generic/cmpxchg.h>
 #endif
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
