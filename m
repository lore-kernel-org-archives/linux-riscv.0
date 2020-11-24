Return-Path: <SRS0=DJxK=E6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17153C6379D
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 13:52:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ABFA20872
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 13:52:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OKOUmHah";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1iUcbfV4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9ABFA20872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xeIsTSkRS1eL4sPnt1gqGNckKzLiwsEkVdoFdyzjMRg=; b=OKOUmHahbPdTSrgLnwgTFTQWCw
	ZWjCQhvkai/F36+C+I3/87I7XX/L0pO2QnPu5crDUfZ8Apn/Sa0QZvZmAqBfOT6L1fawx7mTRbj0P
	sBiwUdaRQ4bHXDyPb8Zb8djYh2y/aQo+iKG/+IIeZvVMIrRw8gARyItcKP/lzW3NpvxRakUBU/JGO
	2WHJ/UA8nrO/xVKG7TogsJDF7bRH1qwRBAnezDqXXbOUzi9FtDBCfADzXEziPXVjmCwCSsb2U7A//
	kJnP7ajvXlo+FBjzlXZhwyx+eP5gIYMoEjlCaK1P8WAUWR7LvTeDwr2ZgxRwt/nR88UD5j2GnrAdJ
	fo5HoZ/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYjc-0006zd-A9; Tue, 24 Nov 2020 13:51:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYd0-0003Ae-TQ
 for linux-riscv@lists.infradead.org; Tue, 24 Nov 2020 13:45:15 +0000
Received: from localhost.localdomain (unknown [42.120.72.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DA03F2067D;
 Tue, 24 Nov 2020 13:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606225504;
 bh=LemYfSoLF+U2R4PPrq4UpblySoUjDJiNIGRdRoINvRw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=1iUcbfV4nZXIE8Drim85JLvqc6s6LMIsxUfvsT5qPY1LoRlgO9CRAs8CmVWmn8InS
 7EUFR/G7VhEwesMMOO+MrKEqPBUOewAGRqkGcF7NmztTACwH7ZNz8a2wfLC6zvxLqb
 UohwFFAI1DOd7uIOFHs4aLMVlRYKd6VUXBczNNNs=
From: guoren@kernel.org
To: peterz@infradead.org, arnd@arndb.de, palmerdabbelt@google.com,
 paul.walmsley@sifive.com, anup@brainfault.org
Subject: [PATCH 2/5] riscv: Add QUEUED_SPINLOCKS & QUEUED_RWLOCKS supported
Date: Tue, 24 Nov 2020 13:43:54 +0000
Message-Id: <1606225437-22948-2-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606225437-22948-1-git-send-email-guoren@kernel.org>
References: <1606225437-22948-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_084507_216615_AE6598C2 
X-CRM114-Status: GOOD (  17.63  )
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

riscv only support lr.wd/s(c).w(d) with word(double word) size &
align access. There are not lr.h/sc.h instructions. But qspinlock.c
need xchg with short type variable:

xchg_tail -> xchg_releaxed(&lock->tail, ...

typedef struct qspinlock {
        union {
                atomic_t val;

                /*
                 * By using the whole 2nd least significant byte for the
                 * pending bit, we can allow better optimization of the lock
                 * acquisition for the pending bit holder.
                 */
                struct {
                        u8      locked;
                        u8      pending;
                };
                struct {
                        u16     locked_pending;
                        u16     tail; /* half word*/
                };
        };
} arch_spinlock_t;

So we add short emulation in xchg with word length and it only
solve qspinlock's requirement.

Michael have sent qspinlock before, ref to Link below.

Link: https://lore.kernel.org/linux-riscv/20190211043829.30096-1-michaeljclark@mac.com/
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Michael Clark <michaeljclark@mac.com>
---
 arch/riscv/Kconfig                      |   2 +
 arch/riscv/include/asm/Kbuild           |   3 +
 arch/riscv/include/asm/cmpxchg.h        |  36 +++++++++
 arch/riscv/include/asm/spinlock.h       | 126 +-------------------------------
 arch/riscv/include/asm/spinlock_types.h |  15 +---
 5 files changed, 46 insertions(+), 136 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 2d61c4c..d757ba4 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -36,6 +36,8 @@ config RISCV
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
+	select ARCH_USE_QUEUED_RWLOCKS
+	select ARCH_USE_QUEUED_SPINLOCKS
 	select CLONE_BACKWARDS
 	select CLINT_TIMER if !MMU
 	select COMMON_CLK
diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
index 59dd7be..6f5f438 100644
--- a/arch/riscv/include/asm/Kbuild
+++ b/arch/riscv/include/asm/Kbuild
@@ -6,3 +6,6 @@ generic-y += kvm_para.h
 generic-y += local64.h
 generic-y += user.h
 generic-y += vmlinux.lds.h
+generic-y += mcs_spinlock.h
+generic-y += qrwlock.h
+generic-y += qspinlock.h
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 5609185..e178700 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -16,7 +16,43 @@
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(new) __new = (new);					\
 	__typeof__(*(ptr)) __ret;					\
+	register unsigned long __rc, tmp, align, addr;			\
 	switch (size) {							\
+	case 2:								\
+		align = ((unsigned long) __ptr & 0x3);			\
+		addr = ((unsigned long) __ptr & ~0x3);			\
+		if (align) {						\
+		__asm__ __volatile__ (					\
+			"0:	lr.w %0, 0(%z4)\n"			\
+			"	move %1, %0\n"				\
+			"	slli %1, %1, 16\n"			\
+			"	srli %1, %1, 16\n"			\
+			"	move %2, %z3\n"				\
+			"	slli %2, %2, 16\n"			\
+			"	or   %1, %2, %1\n"			\
+			"	sc.w %2, %1, 0(%z4)\n"			\
+			"	bnez %2, 0b\n"				\
+			"	srli %0, %0, 16\n"			\
+			: "=&r" (__ret), "=&r" (tmp), "=&r" (__rc)	\
+			: "rJ" (__new), "rJ"(addr)			\
+			: "memory");					\
+		} else {						\
+		__asm__ __volatile__ (					\
+			"0:	lr.w %0, (%z4)\n"			\
+			"	move %1, %0\n"				\
+			"	srli %1, %1, 16\n"			\
+			"	slli %1, %1, 16\n"			\
+			"	move %2, %z3\n"				\
+			"	or   %1, %2, %1\n"			\
+			"	sc.w %2, %1, 0(%z4)\n"			\
+			"	bnez %2, 0b\n"				\
+			"	slli %0, %0, 16\n"			\
+			"	srli %0, %0, 16\n"			\
+			: "=&r" (__ret), "=&r" (tmp), "=&r" (__rc)	\
+			: "rJ" (__new), "rJ"(addr)			\
+			: "memory");					\
+		}							\
+		break;							\
 	case 4:								\
 		__asm__ __volatile__ (					\
 			"	amoswap.w %0, %2, %1\n"			\
diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
index f4f7fa1..b8deb3a 100644
--- a/arch/riscv/include/asm/spinlock.h
+++ b/arch/riscv/include/asm/spinlock.h
@@ -7,129 +7,7 @@
 #ifndef _ASM_RISCV_SPINLOCK_H
 #define _ASM_RISCV_SPINLOCK_H
 
-#include <linux/kernel.h>
-#include <asm/current.h>
-#include <asm/fence.h>
-
-/*
- * Simple spin lock operations.  These provide no fairness guarantees.
- */
-
-/* FIXME: Replace this with a ticket lock, like MIPS. */
-
-#define arch_spin_is_locked(x)	(READ_ONCE((x)->lock) != 0)
-
-static inline void arch_spin_unlock(arch_spinlock_t *lock)
-{
-	smp_store_release(&lock->lock, 0);
-}
-
-static inline int arch_spin_trylock(arch_spinlock_t *lock)
-{
-	int tmp = 1, busy;
-
-	__asm__ __volatile__ (
-		"	amoswap.w %0, %2, %1\n"
-		RISCV_ACQUIRE_BARRIER
-		: "=r" (busy), "+A" (lock->lock)
-		: "r" (tmp)
-		: "memory");
-
-	return !busy;
-}
-
-static inline void arch_spin_lock(arch_spinlock_t *lock)
-{
-	while (1) {
-		if (arch_spin_is_locked(lock))
-			continue;
-
-		if (arch_spin_trylock(lock))
-			break;
-	}
-}
-
-/***********************************************************/
-
-static inline void arch_read_lock(arch_rwlock_t *lock)
-{
-	int tmp;
-
-	__asm__ __volatile__(
-		"1:	lr.w	%1, %0\n"
-		"	bltz	%1, 1b\n"
-		"	addi	%1, %1, 1\n"
-		"	sc.w	%1, %1, %0\n"
-		"	bnez	%1, 1b\n"
-		RISCV_ACQUIRE_BARRIER
-		: "+A" (lock->lock), "=&r" (tmp)
-		:: "memory");
-}
-
-static inline void arch_write_lock(arch_rwlock_t *lock)
-{
-	int tmp;
-
-	__asm__ __volatile__(
-		"1:	lr.w	%1, %0\n"
-		"	bnez	%1, 1b\n"
-		"	li	%1, -1\n"
-		"	sc.w	%1, %1, %0\n"
-		"	bnez	%1, 1b\n"
-		RISCV_ACQUIRE_BARRIER
-		: "+A" (lock->lock), "=&r" (tmp)
-		:: "memory");
-}
-
-static inline int arch_read_trylock(arch_rwlock_t *lock)
-{
-	int busy;
-
-	__asm__ __volatile__(
-		"1:	lr.w	%1, %0\n"
-		"	bltz	%1, 1f\n"
-		"	addi	%1, %1, 1\n"
-		"	sc.w	%1, %1, %0\n"
-		"	bnez	%1, 1b\n"
-		RISCV_ACQUIRE_BARRIER
-		"1:\n"
-		: "+A" (lock->lock), "=&r" (busy)
-		:: "memory");
-
-	return !busy;
-}
-
-static inline int arch_write_trylock(arch_rwlock_t *lock)
-{
-	int busy;
-
-	__asm__ __volatile__(
-		"1:	lr.w	%1, %0\n"
-		"	bnez	%1, 1f\n"
-		"	li	%1, -1\n"
-		"	sc.w	%1, %1, %0\n"
-		"	bnez	%1, 1b\n"
-		RISCV_ACQUIRE_BARRIER
-		"1:\n"
-		: "+A" (lock->lock), "=&r" (busy)
-		:: "memory");
-
-	return !busy;
-}
-
-static inline void arch_read_unlock(arch_rwlock_t *lock)
-{
-	__asm__ __volatile__(
-		RISCV_RELEASE_BARRIER
-		"	amoadd.w x0, %1, %0\n"
-		: "+A" (lock->lock)
-		: "r" (-1)
-		: "memory");
-}
-
-static inline void arch_write_unlock(arch_rwlock_t *lock)
-{
-	smp_store_release(&lock->lock, 0);
-}
+#include <asm/qrwlock.h>
+#include <asm/qspinlock.h>
 
 #endif /* _ASM_RISCV_SPINLOCK_H */
diff --git a/arch/riscv/include/asm/spinlock_types.h b/arch/riscv/include/asm/spinlock_types.h
index f398e76..d033a97 100644
--- a/arch/riscv/include/asm/spinlock_types.h
+++ b/arch/riscv/include/asm/spinlock_types.h
@@ -6,20 +6,11 @@
 #ifndef _ASM_RISCV_SPINLOCK_TYPES_H
 #define _ASM_RISCV_SPINLOCK_TYPES_H
 
-#ifndef __LINUX_SPINLOCK_TYPES_H
+#if !defined(__LINUX_SPINLOCK_TYPES_H) && !defined(_ASM_RISCV_SPINLOCK_H)
 # error "please don't include this file directly"
 #endif
 
-typedef struct {
-	volatile unsigned int lock;
-} arch_spinlock_t;
-
-#define __ARCH_SPIN_LOCK_UNLOCKED	{ 0 }
-
-typedef struct {
-	volatile unsigned int lock;
-} arch_rwlock_t;
-
-#define __ARCH_RW_LOCK_UNLOCKED		{ 0 }
+#include <asm-generic/qspinlock_types.h>
+#include <asm-generic/qrwlock_types.h>
 
 #endif /* _ASM_RISCV_SPINLOCK_TYPES_H */
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
