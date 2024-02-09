Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C970FC4828F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Feb 2024 12:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=66OWZwxmd03O3LlCWEGNqnGni1gKyc5CoSFEQqagYKk=; b=RFi
	MH5yygcyrOIYHpqUfMn4ixV7JDc9d1wMQCKmp6iNLYK0lkBsVA2aJt6KmTe2MbFrPaMCu+KyiGSUC
	0dYKlX51uR+imIfpVXclGnGbNTwSCRGfaqwAua/YXf+l7i4OmELzV3Tydx4fFBluycCS2W1C7uS/5
	FopR4PCTkKsqu+jEYnpKDdWtS7FLM8i8tfQQw3EduyVfAE1Mvo3u10yMr+k9AVzapufR/Jmz4IWlK
	NYb4sXokEAlO+fJFNxVtGSA9cqtO76zG5buftzRJ6740C4BUnGpi7K4f9rOkfEczAaBBMmjLIn4lW
	/NwRwfpM7gseFZWhrpsHkbmffHtYqbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYQM5-0000000GzhZ-491H;
	Fri, 09 Feb 2024 12:51:45 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYQM3-0000000Gzh7-1fDH
	for linux-riscv@lists.infradead.org;
	Fri, 09 Feb 2024 12:51:44 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-604acd1d164so18675777b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 09 Feb 2024 04:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707483100; x=1708087900; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k0mIF1IZyHiAXR1QozG/XlWcQLhCvpdfF1T0p9TCdYE=;
        b=Zk+CBP4IIrmX5pbbBu+uAOD0ZxMX+MxsIKRijRf5GzGW64aB5QMhdajC8ifY9Xc08w
         /mLx0Y14uTTDwcoAIeu3lSbZpWkC/J9ZEO13ww46B3r7GAXqcc/Y+7R2UH3n9hSeuIIn
         7wh+H/XxDQfByTCTAvdLTW0Jh4y8N8aNlA34BGvHZZp5+iVXZoNZJQeMRENuL4U7D0gy
         mHSttTkVUVncvG+xaf0qlmySbVHzHG1/h5Cic7ka+LwCGsyhQ7Ld7zhyE1q2/sMEgGic
         v1+2y4UNgo+T9L64YBrAlkArSgEjcxW3vbNBSSI23j8fddUxFnwVBBHHXHC5gBvWobBy
         1Sew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707483100; x=1708087900;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k0mIF1IZyHiAXR1QozG/XlWcQLhCvpdfF1T0p9TCdYE=;
        b=XX94GMcpgfzCBKqMJbf615GTJRXD7htCP95X5TeO/lhjWUbK7Fatd++FkZUazGOioo
         TbwZ6WNcIdjN7xy+/ZO9f1Sew3zt6n15tzfGZBEoeiEwpYyjQ/uCQjpygwhYxZyH99W4
         vkwRR4aTNI8vzACXepcXSzURfGwmH2YLHRrqgaPf10Q3Bj1K0ZzcAWLhVTD/aZPQOsKQ
         EANDdrx+CE1klCIVxZq8m7oOwEwQg1L5dLtp6LzRO0weDH2NsZJjnwthD/sdJtGCvsbO
         fPe20aar8ITSurj8bMzrqfsalu9+W8GkLecFnox9wNqygzWtgTZWSSJ4M5qSwdEKI6rU
         3J+A==
X-Gm-Message-State: AOJu0YwcTBVsPZuee+r3e+CFAraWfzG99JXVlpqebVO8MNCfWY+NEzU5
	GxBO2+2rKCKDU87O4zLicnjtuIkK1iCgSiTCDi2NN11BUCjS6M1W3knCdXhG2DHiXASYoi7VtTj
	iTAZKbvD0MXmbxxJQ/g==
X-Google-Smtp-Source: AGHT+IFTVTfekngAHQxuJCo+qerwumtA+dN8zAP79e4o0CDw8JI2RcaUY8bNHoFwPZ7RcNu8Eb2B3joWzc+x7zVt
X-Received: from ericchancf.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:4139])
 (user=ericchancf job=sendgmr) by 2002:a05:6902:1022:b0:dc2:550b:a4f4 with
 SMTP id x2-20020a056902102200b00dc2550ba4f4mr317038ybt.1.1707483099951; Fri,
 09 Feb 2024 04:51:39 -0800 (PST)
Date: Fri,  9 Feb 2024 12:50:48 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240209125048.4078639-1-ericchancf@google.com>
Subject: [PATCH] riscv/fence: Consolidate fence definitions and define __{mb,rmb,wmb}
From: Eric Chan <ericchancf@google.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ericchancf@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_045143_469507_D10B0877 
X-CRM114-Status: GOOD (  15.93  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Disparate fence implementations are consolidated into fence.h.

Introduce __{mb,rmb,wmb}, and rely on the generic definitions
for {mb,rmb,wmb}. A first consequence is that __{mb,rmb,wmb}
map to a compiler barrier on !SMP (while their definition remains
unchanged on SMP).

Introduce RISCV_FULL_BARRIER and use in arch_atomic* function.
like RISCV_ACQUIRE_BARRIER and RISCV_RELEASE_BARRIER, The fence
instruction can be eliminated When SMP is not in use.

Also clean up the warning with scripts/checkpatch.pl.

Signed-off-by: Eric Chan <ericchancf@google.com>
---
 arch/riscv/include/asm/atomic.h  | 24 ++++++++++--------------
 arch/riscv/include/asm/barrier.h | 21 ++++++++++-----------
 arch/riscv/include/asm/cmpxchg.h |  5 ++---
 arch/riscv/include/asm/fence.h   | 11 +++++++++--
 arch/riscv/include/asm/io.h      |  8 ++++----
 arch/riscv/include/asm/mmio.h    |  5 +++--
 arch/riscv/include/asm/mmiowb.h  |  2 +-
 7 files changed, 39 insertions(+), 37 deletions(-)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index f5dfef6c2153..19050d13b6c1 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -17,13 +17,9 @@
 #endif
 
 #include <asm/cmpxchg.h>
-#include <asm/barrier.h>
 
-#define __atomic_acquire_fence()					\
-	__asm__ __volatile__(RISCV_ACQUIRE_BARRIER "" ::: "memory")
-
-#define __atomic_release_fence()					\
-	__asm__ __volatile__(RISCV_RELEASE_BARRIER "" ::: "memory");
+#define __atomic_acquire_fence()	RISCV_FENCE(r, rw)
+#define __atomic_release_fence()	RISCV_FENCE(rw, r)
 
 static __always_inline int arch_atomic_read(const atomic_t *v)
 {
@@ -207,7 +203,7 @@ static __always_inline int arch_atomic_fetch_add_unless(atomic_t *v, int a, int
 		"	add      %[rc], %[p], %[a]\n"
 		"	sc.w.rl  %[rc], %[rc], %[c]\n"
 		"	bnez     %[rc], 0b\n"
-		"	fence    rw, rw\n"
+		RISCV_FULL_BARRIER
 		"1:\n"
 		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
 		: [a]"r" (a), [u]"r" (u)
@@ -228,7 +224,7 @@ static __always_inline s64 arch_atomic64_fetch_add_unless(atomic64_t *v, s64 a,
 		"	add      %[rc], %[p], %[a]\n"
 		"	sc.d.rl  %[rc], %[rc], %[c]\n"
 		"	bnez     %[rc], 0b\n"
-		"	fence    rw, rw\n"
+		RISCV_FULL_BARRIER
 		"1:\n"
 		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
 		: [a]"r" (a), [u]"r" (u)
@@ -248,7 +244,7 @@ static __always_inline bool arch_atomic_inc_unless_negative(atomic_t *v)
 		"	addi      %[rc], %[p], 1\n"
 		"	sc.w.rl   %[rc], %[rc], %[c]\n"
 		"	bnez      %[rc], 0b\n"
-		"	fence     rw, rw\n"
+		RISCV_FULL_BARRIER
 		"1:\n"
 		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
 		:
@@ -268,7 +264,7 @@ static __always_inline bool arch_atomic_dec_unless_positive(atomic_t *v)
 		"	addi      %[rc], %[p], -1\n"
 		"	sc.w.rl   %[rc], %[rc], %[c]\n"
 		"	bnez      %[rc], 0b\n"
-		"	fence     rw, rw\n"
+		RISCV_FULL_BARRIER
 		"1:\n"
 		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
 		:
@@ -288,7 +284,7 @@ static __always_inline int arch_atomic_dec_if_positive(atomic_t *v)
 		"	bltz     %[rc], 1f\n"
 		"	sc.w.rl  %[rc], %[rc], %[c]\n"
 		"	bnez     %[rc], 0b\n"
-		"	fence    rw, rw\n"
+		RISCV_FULL_BARRIER
 		"1:\n"
 		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
 		:
@@ -310,7 +306,7 @@ static __always_inline bool arch_atomic64_inc_unless_negative(atomic64_t *v)
 		"	addi      %[rc], %[p], 1\n"
 		"	sc.d.rl   %[rc], %[rc], %[c]\n"
 		"	bnez      %[rc], 0b\n"
-		"	fence     rw, rw\n"
+		RISCV_FULL_BARRIER
 		"1:\n"
 		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
 		:
@@ -331,7 +327,7 @@ static __always_inline bool arch_atomic64_dec_unless_positive(atomic64_t *v)
 		"	addi      %[rc], %[p], -1\n"
 		"	sc.d.rl   %[rc], %[rc], %[c]\n"
 		"	bnez      %[rc], 0b\n"
-		"	fence     rw, rw\n"
+		RISCV_FULL_BARRIER
 		"1:\n"
 		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
 		:
@@ -352,7 +348,7 @@ static __always_inline s64 arch_atomic64_dec_if_positive(atomic64_t *v)
 		"	bltz     %[rc], 1f\n"
 		"	sc.d.rl  %[rc], %[rc], %[c]\n"
 		"	bnez     %[rc], 0b\n"
-		"	fence    rw, rw\n"
+		RISCV_FULL_BARRIER
 		"1:\n"
 		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
 		:
diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index 110752594228..880b56d8480d 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -11,28 +11,27 @@
 #define _ASM_RISCV_BARRIER_H
 
 #ifndef __ASSEMBLY__
+#include <asm/fence.h>
 
 #define nop()		__asm__ __volatile__ ("nop")
 #define __nops(n)	".rept	" #n "\nnop\n.endr\n"
 #define nops(n)		__asm__ __volatile__ (__nops(n))
 
-#define RISCV_FENCE(p, s) \
-	__asm__ __volatile__ ("fence " #p "," #s : : : "memory")
 
 /* These barriers need to enforce ordering on both devices or memory. */
-#define mb()		RISCV_FENCE(iorw,iorw)
-#define rmb()		RISCV_FENCE(ir,ir)
-#define wmb()		RISCV_FENCE(ow,ow)
+#define __mb()		RISCV_FENCE(iorw, iorw)
+#define __rmb()		RISCV_FENCE(ir, ir)
+#define __wmb()		RISCV_FENCE(ow, ow)
 
 /* These barriers do not need to enforce ordering on devices, just memory. */
-#define __smp_mb()	RISCV_FENCE(rw,rw)
-#define __smp_rmb()	RISCV_FENCE(r,r)
-#define __smp_wmb()	RISCV_FENCE(w,w)
+#define __smp_mb()	RISCV_FENCE(rw, rw)
+#define __smp_rmb()	RISCV_FENCE(r, r)
+#define __smp_wmb()	RISCV_FENCE(w, w)
 
 #define __smp_store_release(p, v)					\
 do {									\
 	compiletime_assert_atomic_type(*p);				\
-	RISCV_FENCE(rw,w);						\
+	RISCV_FENCE(rw, w);						\
 	WRITE_ONCE(*p, v);						\
 } while (0)
 
@@ -40,7 +39,7 @@ do {									\
 ({									\
 	typeof(*p) ___p1 = READ_ONCE(*p);				\
 	compiletime_assert_atomic_type(*p);				\
-	RISCV_FENCE(r,rw);						\
+	RISCV_FENCE(r, rw);						\
 	___p1;								\
 })
 
@@ -69,7 +68,7 @@ do {									\
  * instances the scheduler pairs this with an mb(), so nothing is necessary on
  * the new hart.
  */
-#define smp_mb__after_spinlock()	RISCV_FENCE(iorw,iorw)
+#define smp_mb__after_spinlock()	RISCV_FENCE(iorw, iorw)
 
 #include <asm-generic/barrier.h>
 
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 2f4726d3cfcc..2fee65cc8443 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -8,7 +8,6 @@
 
 #include <linux/bug.h>
 
-#include <asm/barrier.h>
 #include <asm/fence.h>
 
 #define __xchg_relaxed(ptr, new, size)					\
@@ -313,7 +312,7 @@
 			"	bne  %0, %z3, 1f\n"			\
 			"	sc.w.rl %1, %z4, %2\n"			\
 			"	bnez %1, 0b\n"				\
-			"	fence rw, rw\n"				\
+			RISCV_FULL_BARRIER				\
 			"1:\n"						\
 			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
 			: "rJ" ((long)__old), "rJ" (__new)		\
@@ -325,7 +324,7 @@
 			"	bne %0, %z3, 1f\n"			\
 			"	sc.d.rl %1, %z4, %2\n"			\
 			"	bnez %1, 0b\n"				\
-			"	fence rw, rw\n"				\
+			RISCV_FULL_BARRIER				\
 			"1:\n"						\
 			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
 			: "rJ" (__old), "rJ" (__new)			\
diff --git a/arch/riscv/include/asm/fence.h b/arch/riscv/include/asm/fence.h
index 2b443a3a487f..3e6ba47cf61a 100644
--- a/arch/riscv/include/asm/fence.h
+++ b/arch/riscv/include/asm/fence.h
@@ -1,12 +1,19 @@
 #ifndef _ASM_RISCV_FENCE_H
 #define _ASM_RISCV_FENCE_H
 
+#define RISCV_FENCE_ASM(p, s) \
+	"\tfence " #p "," #s "\n"
+#define RISCV_FENCE(p, s) \
+	(__asm__ __volatile__ (RISCV_FENCE_ASM(p, s) : : : "memory"))
+
 #ifdef CONFIG_SMP
-#define RISCV_ACQUIRE_BARRIER		"\tfence r , rw\n"
-#define RISCV_RELEASE_BARRIER		"\tfence rw,  w\n"
+#define RISCV_ACQUIRE_BARRIER		RISCV_FENCE_ASM(r, rw)
+#define RISCV_RELEASE_BARRIER		RISCV_FENCE_ASM(rw, w)
+#define RISCV_FULL_BARRIER		RISCV_FENCE_ASM(rw, rw)
 #else
 #define RISCV_ACQUIRE_BARRIER
 #define RISCV_RELEASE_BARRIER
+#define RISCV_FULL_BARRIER
 #endif
 
 #endif	/* _ASM_RISCV_FENCE_H */
diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index 42497d487a17..1c5c641075d2 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -47,10 +47,10 @@
  * sufficient to ensure this works sanely on controllers that support I/O
  * writes.
  */
-#define __io_pbr()	__asm__ __volatile__ ("fence io,i"  : : : "memory");
-#define __io_par(v)	__asm__ __volatile__ ("fence i,ior" : : : "memory");
-#define __io_pbw()	__asm__ __volatile__ ("fence iow,o" : : : "memory");
-#define __io_paw()	__asm__ __volatile__ ("fence o,io"  : : : "memory");
+#define __io_pbr()	RISCV_FENCE(io, i)
+#define __io_par(v)	RISCV_FENCE(i, ior)
+#define __io_pbw()	RISCV_FENCE(iow, o)
+#define __io_paw()	RISCV_FENCE(o, io)
 
 /*
  * Accesses from a single hart to a single I/O address must be ordered.  This
diff --git a/arch/riscv/include/asm/mmio.h b/arch/riscv/include/asm/mmio.h
index 4c58ee7f95ec..06cadfd7a237 100644
--- a/arch/riscv/include/asm/mmio.h
+++ b/arch/riscv/include/asm/mmio.h
@@ -12,6 +12,7 @@
 #define _ASM_RISCV_MMIO_H
 
 #include <linux/types.h>
+#include <asm/fence.h>
 #include <asm/mmiowb.h>
 
 /* Generic IO read/write.  These perform native-endian accesses. */
@@ -131,8 +132,8 @@ static inline u64 __raw_readq(const volatile void __iomem *addr)
  * doesn't define any ordering between the memory space and the I/O space.
  */
 #define __io_br()	do {} while (0)
-#define __io_ar(v)	({ __asm__ __volatile__ ("fence i,ir" : : : "memory"); })
-#define __io_bw()	({ __asm__ __volatile__ ("fence w,o" : : : "memory"); })
+#define __io_ar(v)	RISCV_FENCE(i, ir)
+#define __io_bw()	RISCV_FENCE(w, o)
 #define __io_aw()	mmiowb_set_pending()
 
 #define readb(c)	({ u8  __v; __io_br(); __v = readb_cpu(c); __io_ar(__v); __v; })
diff --git a/arch/riscv/include/asm/mmiowb.h b/arch/riscv/include/asm/mmiowb.h
index 0b2333e71fdc..52ce4a399d9b 100644
--- a/arch/riscv/include/asm/mmiowb.h
+++ b/arch/riscv/include/asm/mmiowb.h
@@ -7,7 +7,7 @@
  * "o,w" is sufficient to ensure that all writes to the device have completed
  * before the write to the spinlock is allowed to commit.
  */
-#define mmiowb()	__asm__ __volatile__ ("fence o,w" : : : "memory");
+#define mmiowb()	RISCV_FENCE(o, w)
 
 #include <linux/smp.h>
 #include <asm-generic/mmiowb.h>
-- 
2.43.0.687.g38aa6559b0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
