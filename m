Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C49C43334
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Jul 2022 12:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CTX3v9oiZkUocukhPRt2bp6wQLJGJgMK1kZSHYLV0mI=; b=q4MSkssTc6KENt
	T97LjxJuNoHWOHeIQ7mC6YX1AERB+BJFo/j2bsYR3F21bLr0KE65rRgM1s0KubNDWUUO4fR4Idhbx
	8AEf2IxiAgfsR3o9lobXkp8DKFlklxFU4y53llkccTeFqgWrsodnqygCPOtdTHTFY/0dBRYJ2TzN7
	i31BQwGf1W0UshM1U30o1sXMH3fOuXA671QzfFurLYDcIrYHglfb6+X5WS95SeDkeYtWkkiJAf8qe
	rWMLH6T19ocN/i4yS4I3YGCDjGPKpno2jqYOAfbOQbrEkpqS6kXOD+C8LNjFcz725MjuU6Vx04IpL
	kvXWjqyWmkttPg/nES2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFagV-0060tp-KV; Sun, 24 Jul 2022 12:26:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFagS-0060qA-I6
	for linux-riscv@lists.infradead.org; Sun, 24 Jul 2022 12:26:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3F46EB80D6E;
	Sun, 24 Jul 2022 12:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A32B4C341C0;
	Sun, 24 Jul 2022 12:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658665566;
	bh=ui9v7vSQ2hZ9Vz4T0T/cwSBKPyXOYiw7vf10Zir0n/0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u8tM3zQA2WovR9pT9WzJIjE98QNUnL4S8sdgOcnO2R/y5boR36AkueAY4wiA22wJb
	 mC5v+aqu6nLFl0jo8qFZ7ZX/3zTAzQumB3Km6mtWd6/hn309e14rjRJYqandv8gHAT
	 Oq9CS7IyVWM/Gcw9YRFLiw74pQeK9El8Y7TZpwWi7iU3ScSBFsgvhQ6t1RR/FLqmOX
	 vbGI1NoY0xUjqX0kFG1YP32lyWN0ddJwrG6cmjCsLHhK2xZGNZPjlIetlVtU1FDmcJ
	 Nl4fm4T142c6xW+vI1PuL3B4z05GBt0f7ojjkzYJHnTdI8JuZVWYW30KmWeUW5q+lB
	 aCyDG6Oek9H6w==
From: guoren@kernel.org
To: palmer@rivosinc.com,
	heiko@sntech.de,
	hch@infradead.org,
	arnd@arndb.de,
	peterz@infradead.org,
	will@kernel.org,
	boqun.feng@gmail.com,
	longman@redhat.com,
	mingo@redhat.com,
	philipp.tomsich@vrull.eu,
	cmuellner@linux.com,
	linux-kernel@vger.kernel.org,
	David.Laight@ACULAB.COM
Cc: linux-riscv@lists.infradead.org,
	linux-csky@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V8 06/10] riscv: atomic: Clean up unnecessary acquire and release definitions
Date: Sun, 24 Jul 2022 08:25:13 -0400
Message-Id: <20220724122517.1019187-7-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220724122517.1019187-1-guoren@kernel.org>
References: <20220724122517.1019187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_052608_967107_0EA4BF98 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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

From: Guo Ren <guoren@linux.alibaba.com>

Clean up unnecessary xchg_acquire, xchg_release, and cmpxchg_release
custom definitions, because the generic implementation is the same as
the riscv custom implementation.

Before the patch:
000000000000024e <.LBB238>:
                ops = xchg_acquire(pending_ipis, 0);
 24e:   089937af                amoswap.d       a5,s1,(s2)
 252:   0230000f                fence   r,rw

0000000000000256 <.LBB243>:
                ops = xchg_release(pending_ipis, 0);
 256:   0310000f                fence   rw,w
 25a:   089934af                amoswap.d       s1,s1,(s2)

After the patch:
000000000000026e <.LBB245>:
                ops = xchg_acquire(pending_ipis, 0);
 26e:   089937af                amoswap.d       a5,s1,(s2)

0000000000000272 <.LBE247>:
 272:   0230000f                fence   r,rw

0000000000000276 <.LBB249>:
                ops = xchg_release(pending_ipis, 0);
 276:   0310000f                fence   rw,w

000000000000027a <.LBB251>:
 27a:   089934af                amoswap.d       s1,s1,(s2)

Only cmpxchg_acquire is necessary (It prevents unnecessary acquire
ordering when the value from lr is different from old).

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/atomic.h  |  19 -----
 arch/riscv/include/asm/cmpxchg.h | 116 -------------------------------
 2 files changed, 135 deletions(-)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 0dfe9d857a76..83636320ba95 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -249,16 +249,6 @@ c_t arch_atomic##prefix##_xchg_relaxed(atomic##prefix##_t *v, c_t n)	\
 	return __xchg_relaxed(&(v->counter), n, size);			\
 }									\
 static __always_inline							\
-c_t arch_atomic##prefix##_xchg_acquire(atomic##prefix##_t *v, c_t n)	\
-{									\
-	return __xchg_acquire(&(v->counter), n, size);			\
-}									\
-static __always_inline							\
-c_t arch_atomic##prefix##_xchg_release(atomic##prefix##_t *v, c_t n)	\
-{									\
-	return __xchg_release(&(v->counter), n, size);			\
-}									\
-static __always_inline							\
 c_t arch_atomic##prefix##_xchg(atomic##prefix##_t *v, c_t n)		\
 {									\
 	return __xchg(&(v->counter), n, size);				\
@@ -276,12 +266,6 @@ c_t arch_atomic##prefix##_cmpxchg_acquire(atomic##prefix##_t *v,	\
 	return __cmpxchg_acquire(&(v->counter), o, n, size);		\
 }									\
 static __always_inline							\
-c_t arch_atomic##prefix##_cmpxchg_release(atomic##prefix##_t *v,	\
-				     c_t o, c_t n)			\
-{									\
-	return __cmpxchg_release(&(v->counter), o, n, size);		\
-}									\
-static __always_inline							\
 c_t arch_atomic##prefix##_cmpxchg(atomic##prefix##_t *v, c_t o, c_t n)	\
 {									\
 	return __cmpxchg(&(v->counter), o, n, size);			\
@@ -299,12 +283,9 @@ c_t arch_atomic##prefix##_cmpxchg(atomic##prefix##_t *v, c_t o, c_t n)	\
 ATOMIC_OPS()
 
 #define arch_atomic_xchg_relaxed	arch_atomic_xchg_relaxed
-#define arch_atomic_xchg_acquire	arch_atomic_xchg_acquire
-#define arch_atomic_xchg_release	arch_atomic_xchg_release
 #define arch_atomic_xchg		arch_atomic_xchg
 #define arch_atomic_cmpxchg_relaxed	arch_atomic_cmpxchg_relaxed
 #define arch_atomic_cmpxchg_acquire	arch_atomic_cmpxchg_acquire
-#define arch_atomic_cmpxchg_release	arch_atomic_cmpxchg_release
 #define arch_atomic_cmpxchg		arch_atomic_cmpxchg
 
 #undef ATOMIC_OPS
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 12debce235e5..67ab6375b650 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -44,76 +44,6 @@
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
-#define arch_xchg_acquire(ptr, x)					\
-({									\
-	__typeof__(*(ptr)) _x_ = (x);					\
-	(__typeof__(*(ptr))) __xchg_acquire((ptr),			\
-					    _x_, sizeof(*(ptr)));	\
-})
-
-#define __xchg_release(ptr, new, size)					\
-({									\
-	__typeof__(ptr) __ptr = (ptr);					\
-	__typeof__(new) __new = (new);					\
-	__typeof__(*(ptr)) __ret;					\
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
-	__ret;								\
-})
-
-#define arch_xchg_release(ptr, x)					\
-({									\
-	__typeof__(*(ptr)) _x_ = (x);					\
-	(__typeof__(*(ptr))) __xchg_release((ptr),			\
-					    _x_, sizeof(*(ptr)));	\
-})
-
 #define __xchg(ptr, new, size)						\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
@@ -253,52 +183,6 @@
 					_o_, _n_, sizeof(*(ptr)));	\
 })
 
-#define __cmpxchg_release(ptr, old, new, size)				\
-({									\
-	__typeof__(ptr) __ptr = (ptr);					\
-	__typeof__(*(ptr)) __old = (old);				\
-	__typeof__(*(ptr)) __new = (new);				\
-	__typeof__(*(ptr)) __ret;					\
-	register unsigned int __rc;					\
-	switch (size) {							\
-	case 4:								\
-		__asm__ __volatile__ (					\
-			RISCV_RELEASE_BARRIER				\
-			"0:	lr.w %0, %2\n"				\
-			"	bne  %0, %z3, 1f\n"			\
-			"	sc.w %1, %z4, %2\n"			\
-			"	bnez %1, 0b\n"				\
-			"1:\n"						\
-			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
-			: "rJ" ((long)__old), "rJ" (__new)		\
-			: "memory");					\
-		break;							\
-	case 8:								\
-		__asm__ __volatile__ (					\
-			RISCV_RELEASE_BARRIER				\
-			"0:	lr.d %0, %2\n"				\
-			"	bne %0, %z3, 1f\n"			\
-			"	sc.d %1, %z4, %2\n"			\
-			"	bnez %1, 0b\n"				\
-			"1:\n"						\
-			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
-			: "rJ" (__old), "rJ" (__new)			\
-			: "memory");					\
-		break;							\
-	default:							\
-		BUILD_BUG();						\
-	}								\
-	__ret;								\
-})
-
-#define arch_cmpxchg_release(ptr, o, n)					\
-({									\
-	__typeof__(*(ptr)) _o_ = (o);					\
-	__typeof__(*(ptr)) _n_ = (n);					\
-	(__typeof__(*(ptr))) __cmpxchg_release((ptr),			\
-					_o_, _n_, sizeof(*(ptr)));	\
-})
-
 #define __cmpxchg(ptr, old, new, size)					\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
