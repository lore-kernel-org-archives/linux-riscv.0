Return-Path: <SRS0=DJxK=E6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 515D4C2D0E4
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 13:52:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCCBA20888
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 13:52:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v/iMDl//";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DlyXjC0w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCCBA20888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OXAFQl1I0nnAECWonqzjRFomBFF5F4P0HqmPKYIcXfU=; b=v/iMDl//tJBbU8/AFcYZzPL7SO
	BaZ87yV/NUZuOxIXj8SXAnftoJMgWlP+fGYtcBedhlG9blJ0LaPiyVw63cgf8fk8HWHVRQmOpwiA7
	ZsLhTyHEleIGt5RKz7aKGOYuWCTQh2i0f5jri0KI6kCp9vd3KFUlk+bqwBL2EsNhX4l3eimqdI2if
	HSZbtfKuhoWm3qBVFgX59cVT57wN4KynS7I9W1wXrj3cgHGHy415cVTGSU//ByppdQKK+wnHeDjeA
	mk27am66upWxcTj3rpS+0KhgNSWB658QGPiOWXvxcc/q8nH+Qqq4bbPh+Hz0WI0+cYx9+cF5kNqjM
	ocCb+zeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYjZ-0006yB-Rl; Tue, 24 Nov 2020 13:51:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYcs-00036E-Ta
 for linux-riscv@lists.infradead.org; Tue, 24 Nov 2020 13:45:02 +0000
Received: from localhost.localdomain (unknown [42.120.72.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D1B542076E;
 Tue, 24 Nov 2020 13:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606225496;
 bh=V0Z2l62pZVOyWz2QxKXkhgR4d3BoO1ZllG7B/R8NhHc=;
 h=From:To:Cc:Subject:Date:From;
 b=DlyXjC0wBFsfrgvblLPR6rkcE6sa6zPCCs0HE+InMN9hdlOGzX1DU5KKA2uwQesy5
 yFUkOT01rrOcUgisAlUh6oBMC6SsNEi02doaReIzRB9cN15GVTF/PdFgSEa2E3TfHI
 vK5pGMyhjDXhfeE7UywkSbB7W85ZqT5NvapllYPU=
From: guoren@kernel.org
To: peterz@infradead.org, arnd@arndb.de, palmerdabbelt@google.com,
 paul.walmsley@sifive.com, anup@brainfault.org
Subject: [PATCH 1/5] riscv: Coding convention for xchg
Date: Tue, 24 Nov 2020 13:43:53 +0000
Message-Id: <1606225437-22948-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_084459_459337_78135906 
X-CRM114-Status: GOOD (  12.51  )
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
Cc: Guo Ren <guoren@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, Michael Clark <michaeljclark@mac.com>,
 guoren@kernel.org, linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

This is prepare for QUEUED_SPINLOCKS which need xchg support short
type value.
 - Remove unused codes (xchg32, xchg64, cmpxchg32 ...)
 - Combine xchg_relaxed, xchg_acquire, xchg_release into one asm
 - Make atomic.aq/rl with seperated fence acquire & release

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Michael Clark <michaeljclark@mac.com>
---
 arch/riscv/include/asm/atomic.h  |  31 ++++-----
 arch/riscv/include/asm/cmpxchg.h | 135 +++------------------------------------
 arch/riscv/include/asm/fence.h   |   6 ++
 3 files changed, 30 insertions(+), 142 deletions(-)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 400a8c8..632fbe4 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -19,11 +19,8 @@
 #include <asm/cmpxchg.h>
 #include <asm/barrier.h>
 
-#define __atomic_acquire_fence()					\
-	__asm__ __volatile__(RISCV_ACQUIRE_BARRIER "" ::: "memory")
-
-#define __atomic_release_fence()					\
-	__asm__ __volatile__(RISCV_RELEASE_BARRIER "" ::: "memory");
+#define __atomic_acquire_fence() __acquire_fence()
+#define __atomic_release_fence() __release_fence()
 
 static __always_inline int atomic_read(const atomic_t *v)
 {
@@ -242,58 +239,58 @@ static __always_inline s64 atomic64_fetch_add_unless(atomic64_t *v, s64 a, s64 u
  * atomic_{cmp,}xchg is required to have exactly the same ordering semantics as
  * {cmp,}xchg and the operations that return, so they need a full barrier.
  */
-#define ATOMIC_OP(c_t, prefix, size)					\
+#define ATOMIC_OP(c_t, prefix)						\
 static __always_inline							\
 c_t atomic##prefix##_xchg_relaxed(atomic##prefix##_t *v, c_t n)		\
 {									\
-	return __xchg_relaxed(&(v->counter), n, size);			\
+	return xchg_relaxed(&(v->counter), n);				\
 }									\
 static __always_inline							\
 c_t atomic##prefix##_xchg_acquire(atomic##prefix##_t *v, c_t n)		\
 {									\
-	return __xchg_acquire(&(v->counter), n, size);			\
+	return xchg_acquire(&(v->counter), n);				\
 }									\
 static __always_inline							\
 c_t atomic##prefix##_xchg_release(atomic##prefix##_t *v, c_t n)		\
 {									\
-	return __xchg_release(&(v->counter), n, size);			\
+	return xchg_release(&(v->counter), n);				\
 }									\
 static __always_inline							\
 c_t atomic##prefix##_xchg(atomic##prefix##_t *v, c_t n)			\
 {									\
-	return __xchg(&(v->counter), n, size);				\
+	return xchg(&(v->counter), n);					\
 }									\
 static __always_inline							\
 c_t atomic##prefix##_cmpxchg_relaxed(atomic##prefix##_t *v,		\
 				     c_t o, c_t n)			\
 {									\
-	return __cmpxchg_relaxed(&(v->counter), o, n, size);		\
+	return cmpxchg_relaxed(&(v->counter), o, n);			\
 }									\
 static __always_inline							\
 c_t atomic##prefix##_cmpxchg_acquire(atomic##prefix##_t *v,		\
 				     c_t o, c_t n)			\
 {									\
-	return __cmpxchg_acquire(&(v->counter), o, n, size);		\
+	return cmpxchg_acquire(&(v->counter), o, n);			\
 }									\
 static __always_inline							\
 c_t atomic##prefix##_cmpxchg_release(atomic##prefix##_t *v,		\
 				     c_t o, c_t n)			\
 {									\
-	return __cmpxchg_release(&(v->counter), o, n, size);		\
+	return cmpxchg_release(&(v->counter), o, n);			\
 }									\
 static __always_inline							\
 c_t atomic##prefix##_cmpxchg(atomic##prefix##_t *v, c_t o, c_t n)	\
 {									\
-	return __cmpxchg(&(v->counter), o, n, size);			\
+	return cmpxchg(&(v->counter), o, n);				\
 }
 
 #ifdef CONFIG_GENERIC_ATOMIC64
 #define ATOMIC_OPS()							\
-	ATOMIC_OP(int,   , 4)
+	ATOMIC_OP(int,   )
 #else
 #define ATOMIC_OPS()							\
-	ATOMIC_OP(int,   , 4)						\
-	ATOMIC_OP(s64, 64, 8)
+	ATOMIC_OP(int,   )						\
+	ATOMIC_OP(s64, 64)
 #endif
 
 ATOMIC_OPS()
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 262e5bb..5609185 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -44,118 +44,31 @@
 					    _x_, sizeof(*(ptr)));	\
 })
 
-#define __xchg_acquire(ptr, new, size)					\
-({									\
-	__typeof__(ptr) __ptr = (ptr);					\
-	__typeof__(new) __new = (new);					\
-	__typeof__(*(ptr)) __ret;					\
-	switch (size) {							\
-	case 4:								\
-		__asm__ __volatile__ (					\
-			"	amoswap.w %0, %2, %1\n"			\
-			RISCV_ACQUIRE_BARRIER				\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
-		break;							\
-	case 8:								\
-		__asm__ __volatile__ (					\
-			"	amoswap.d %0, %2, %1\n"			\
-			RISCV_ACQUIRE_BARRIER				\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
-		break;							\
-	default:							\
-		BUILD_BUG();						\
-	}								\
-	__ret;								\
-})
-
 #define xchg_acquire(ptr, x)						\
 ({									\
-	__typeof__(*(ptr)) _x_ = (x);					\
-	(__typeof__(*(ptr))) __xchg_acquire((ptr),			\
-					    _x_, sizeof(*(ptr)));	\
-})
-
-#define __xchg_release(ptr, new, size)					\
-({									\
-	__typeof__(ptr) __ptr = (ptr);					\
-	__typeof__(new) __new = (new);					\
 	__typeof__(*(ptr)) __ret;					\
-	switch (size) {							\
-	case 4:								\
-		__asm__ __volatile__ (					\
-			RISCV_RELEASE_BARRIER				\
-			"	amoswap.w %0, %2, %1\n"			\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
-		break;							\
-	case 8:								\
-		__asm__ __volatile__ (					\
-			RISCV_RELEASE_BARRIER				\
-			"	amoswap.d %0, %2, %1\n"			\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
-		break;							\
-	default:							\
-		BUILD_BUG();						\
-	}								\
+	__typeof__(*(ptr)) _x_ = (x);					\
+	__ret = __xchg_relaxed((ptr), _x_, sizeof(*(ptr)));		\
+	__acquire_fence();						\
 	__ret;								\
 })
 
 #define xchg_release(ptr, x)						\
 ({									\
 	__typeof__(*(ptr)) _x_ = (x);					\
-	(__typeof__(*(ptr))) __xchg_release((ptr),			\
+	__release_fence();						\
+	(__typeof__(*(ptr))) __xchg_relaxed((ptr),			\
 					    _x_, sizeof(*(ptr)));	\
 })
 
-#define __xchg(ptr, new, size)						\
-({									\
-	__typeof__(ptr) __ptr = (ptr);					\
-	__typeof__(new) __new = (new);					\
-	__typeof__(*(ptr)) __ret;					\
-	switch (size) {							\
-	case 4:								\
-		__asm__ __volatile__ (					\
-			"	amoswap.w.aqrl %0, %2, %1\n"		\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
-		break;							\
-	case 8:								\
-		__asm__ __volatile__ (					\
-			"	amoswap.d.aqrl %0, %2, %1\n"		\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
-		break;							\
-	default:							\
-		BUILD_BUG();						\
-	}								\
-	__ret;								\
-})
-
 #define xchg(ptr, x)							\
 ({									\
+	__typeof__(*(ptr)) __ret;					\
 	__typeof__(*(ptr)) _x_ = (x);					\
-	(__typeof__(*(ptr))) __xchg((ptr), _x_, sizeof(*(ptr)));	\
-})
-
-#define xchg32(ptr, x)							\
-({									\
-	BUILD_BUG_ON(sizeof(*(ptr)) != 4);				\
-	xchg((ptr), (x));						\
-})
-
-#define xchg64(ptr, x)							\
-({									\
-	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
-	xchg((ptr), (x));						\
+	__smp_mb();							\
+	__ret = __xchg_relaxed((ptr), _x_, sizeof(*(ptr)));		\
+	__smp_mb();							\
+	__ret;								\
 })
 
 /*
@@ -344,32 +257,4 @@
 	(__typeof__(*(ptr))) __cmpxchg((ptr),				\
 				       _o_, _n_, sizeof(*(ptr)));	\
 })
-
-#define cmpxchg_local(ptr, o, n)					\
-	(__cmpxchg_relaxed((ptr), (o), (n), sizeof(*(ptr))))
-
-#define cmpxchg32(ptr, o, n)						\
-({									\
-	BUILD_BUG_ON(sizeof(*(ptr)) != 4);				\
-	cmpxchg((ptr), (o), (n));					\
-})
-
-#define cmpxchg32_local(ptr, o, n)					\
-({									\
-	BUILD_BUG_ON(sizeof(*(ptr)) != 4);				\
-	cmpxchg_relaxed((ptr), (o), (n))				\
-})
-
-#define cmpxchg64(ptr, o, n)						\
-({									\
-	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
-	cmpxchg((ptr), (o), (n));					\
-})
-
-#define cmpxchg64_local(ptr, o, n)					\
-({									\
-	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
-	cmpxchg_relaxed((ptr), (o), (n));				\
-})
-
 #endif /* _ASM_RISCV_CMPXCHG_H */
diff --git a/arch/riscv/include/asm/fence.h b/arch/riscv/include/asm/fence.h
index 2b443a3..3832601 100644
--- a/arch/riscv/include/asm/fence.h
+++ b/arch/riscv/include/asm/fence.h
@@ -9,4 +9,10 @@
 #define RISCV_RELEASE_BARRIER
 #endif
 
+#define __acquire_fence() \
+	__asm__ __volatile__(RISCV_ACQUIRE_BARRIER "" ::: "memory")
+
+#define __release_fence() \
+	__asm__ __volatile__(RISCV_RELEASE_BARRIER "" ::: "memory")
+
 #endif	/* _ASM_RISCV_FENCE_H */
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
