Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEBEC43334
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jun 2022 09:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+oYB95dI2z5z97XEhgtJoYTUI8ZZG7lfmvxYYcVm7kk=; b=Ft9ZkrdrV7wC2a
	z8zcxC2dGv8KeAofC86rKOvUSGPX2CiWUQPu3OBxW4lKvk3tqo6qxktzmDzn+18Hsh4TZayfyQtSL
	eB+tLJZ+H0SW0Ldhr9um2hUVbunXMxbRDugkd8Q/s7qQLD5XJyPxBw03jR5Z19kTBP5bOB1BjGOLq
	DJjUOI8KZPWCfBTvGb7iIbtoJVyVY5wUJpGnVK9B/BlppxFq006Fb8BIgjCrGMP5znhvOCpThP7Oh
	d1wN+RXIA0YU/vShV1ee6iJF0o/ZvUHJLXTNLpuaBnyqsnBakrWqlQO1kQhv2KdWG+OKBgFsHNVan
	ls8j5mQYuMYWLhurUAdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o52Gq-005Mca-7s; Sat, 25 Jun 2022 09:40:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o52Gn-005MbO-G9
	for linux-riscv@lists.infradead.org; Sat, 25 Jun 2022 09:40:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DFDA260FA2;
	Sat, 25 Jun 2022 09:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB54AC3411C;
	Sat, 25 Jun 2022 09:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656150000;
	bh=W8aNcm+QVE6ieO2OeUXQb2GCh5eqOLJo1sWOd6/UWC4=;
	h=From:To:Cc:Subject:Date:From;
	b=X5/FubI/t3ncQJVzq7/D1pNHYmPPx5JqN8DHxEeRRe7g8WmXzMjM7r2hx1s8qKpih
	 nWzex8LbW0BG00uiFIGKRQoLEHSODZmjxjVtuvqN8k6tx6LYHvLPB1f0BFvjbS+vDr
	 1p/HTzRxRJr4q/REk6F/ie+cu5jlys+I0VCSmrG/ufAa4MQ+KUvRmiXm/26CYdHTMg
	 2pQ3/83nYAj5TSQIYP3ZuxmffFcda4jMzRVhuRLRLKi+pdRa42873c+59ETI2a/Xka
	 6bFCT3hgBYpEh+sNlSbATIhEhrx5lYZv88mgmIZQlp1PiFDtqtybtS+Asgzth3899A
	 y+tgT+4MFO14Q==
From: guoren@kernel.org
To: palmer@rivosinc.com,
	arnd@arndb.de,
	parri.andrea@gmail.com,
	dlustig@nvidia.com
Cc: linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] riscv: atomic: Clean up unnecessary acquire and release definitions
Date: Sat, 25 Jun 2022 05:39:45 -0400
Message-Id: <20220625093945.423974-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220625_024001_690006_3AAB2806 
X-CRM114-Status: UNSURE (   9.36  )
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
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
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
