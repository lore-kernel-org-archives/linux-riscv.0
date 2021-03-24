Return-Path: <SRS0=4Q7i=IW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 307ACC433C1
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Mar 2021 10:16:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9E8E619BB
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Mar 2021 10:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9E8E619BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oj+6yE5NuApOk3z8eBBKKyLGXYEtnuMhzuVbfxpoQE0=; b=HZYcOZkefnj9wHkFPoLLOCA5Xv
	/mZ4fZRFXafOxmMV6rk0t+dVDOXnLQG81MV7TKujb6hVZPXxKKF3g8zvOrMKEo4F3fynPxRLHzjle
	S8qqqOdqX1e4WZGmtwhFl6Zt1juBNCSw9NFHmG96h1EvkVfHyL9EXqUBCIm0OsRyd1/65+KaVO7Ek
	Pf1IZUwyhV8l1VceUPYvN4wF7lfJHBKhg3lpIt09l//l1YxeKkVZPkA5p4fd1c/Ynz7ZMPoYHE9+Q
	pS49xyk9vaSxrved5zB8vnG1TSS5X6WSWZPI+Su60ZxJSOp6UL+9/cwsP+p6cCRvNJwYmLi2KgXtW
	u4v6vI7w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP0YP-00GowW-MR; Wed, 24 Mar 2021 10:15:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lP0YH-00Gouf-In
 for linux-riscv@lists.infradead.org; Wed, 24 Mar 2021 10:15:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 75A43619BB;
 Wed, 24 Mar 2021 10:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616580942;
 bh=oBzpQjECDLbDpeG6Pa0irL9Xx1mC7G4xHusdndHrJFI=;
 h=From:To:Cc:Subject:Date:From;
 b=RmAEAbix+lvoibPoKrLrV/xrPrwYCy3ac5Uy2fs6uPNOOSthwgzAO23q16IhH6EYd
 po3W9PNUOzWu13yhSOgCnGlnY8aGvLkfX5pCYZIA07H+aSrM6NImcJe1u9tO2GzEP5
 WZE7gS/VbMsAP83NzCOXy49LILr0epAPyqe610A3H+jNm1cYaMGv0ymg3bC70Fr2Zr
 W9tjNlBEEn12OOtdzSO+Bl0Xm6qwMmUEn6LY9X4pWb7b2Jil5nQj/vcVubAIzAaFOV
 YYEoH0mTZtogMaUaU9SCHDMwOVrTmGTsk887ChnddylqP75isIZYDLhEduJOzSkyNZ
 JzEa6N05afXzQ==
From: guoren@kernel.org
To: guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Anup Patel <anup@brainfault.org>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] riscv: locks: introduce ticket-based spinlock implementation
Date: Wed, 24 Mar 2021 10:14:52 +0000
Message-Id: <1616580892-80815-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_101550_120370_B57FA484 
X-CRM114-Status: GOOD (  15.40  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

This patch introduces a ticket lock implementation for riscv, along the
same lines as the implementation for arch/arm & arch/csky.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Anup Patel <anup@brainfault.org>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/riscv/Kconfig                      |   1 +
 arch/riscv/include/asm/Kbuild           |   1 +
 arch/riscv/include/asm/spinlock.h       | 158 ++++++++++++--------------------
 arch/riscv/include/asm/spinlock_types.h |  19 ++--
 4 files changed, 74 insertions(+), 105 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 87d7b52..7c56a20 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -30,6 +30,7 @@ config RISCV
 	select ARCH_HAS_STRICT_KERNEL_RWX if MMU
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
+	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
index 445ccc9..e57ef80 100644
--- a/arch/riscv/include/asm/Kbuild
+++ b/arch/riscv/include/asm/Kbuild
@@ -3,5 +3,6 @@ generic-y += early_ioremap.h
 generic-y += extable.h
 generic-y += flat.h
 generic-y += kvm_para.h
+generic-y += qrwlock.h
 generic-y += user.h
 generic-y += vmlinux.lds.h
diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
index f4f7fa1..2c81764 100644
--- a/arch/riscv/include/asm/spinlock.h
+++ b/arch/riscv/include/asm/spinlock.h
@@ -7,129 +7,91 @@
 #ifndef _ASM_RISCV_SPINLOCK_H
 #define _ASM_RISCV_SPINLOCK_H
 
-#include <linux/kernel.h>
-#include <asm/current.h>
-#include <asm/fence.h>
-
 /*
- * Simple spin lock operations.  These provide no fairness guarantees.
+ * Ticket-based spin-locking.
  */
+static inline void arch_spin_lock(arch_spinlock_t *lock)
+{
+	arch_spinlock_t lockval;
+	u32 tmp;
+
+	asm volatile (
+		"1:	lr.w	%0, %2		\n"
+		"	mv	%1, %0		\n"
+		"	addw	%0, %0, %3	\n"
+		"	sc.w	%0, %0, %2	\n"
+		"	bnez	%0, 1b		\n"
+		: "=&r" (tmp), "=&r" (lockval), "+A" (lock->lock)
+		: "r" (1 << TICKET_NEXT)
+		: "memory");
 
-/* FIXME: Replace this with a ticket lock, like MIPS. */
-
-#define arch_spin_is_locked(x)	(READ_ONCE((x)->lock) != 0)
+	while (lockval.tickets.next != lockval.tickets.owner) {
+		/*
+		 * FIXME - we need wfi/wfe here to prevent:
+		 *  - cache line bouncing
+		 *  - saving cpu pipeline in multi-harts-per-core
+		 *    processor
+		 */
+		lockval.tickets.owner = READ_ONCE(lock->tickets.owner);
+	}
 
-static inline void arch_spin_unlock(arch_spinlock_t *lock)
-{
-	smp_store_release(&lock->lock, 0);
+	__atomic_acquire_fence();
 }
 
 static inline int arch_spin_trylock(arch_spinlock_t *lock)
 {
-	int tmp = 1, busy;
-
-	__asm__ __volatile__ (
-		"	amoswap.w %0, %2, %1\n"
-		RISCV_ACQUIRE_BARRIER
-		: "=r" (busy), "+A" (lock->lock)
-		: "r" (tmp)
+	u32 tmp, contended, res;
+
+	do {
+		asm volatile (
+		"	lr.w	%0, %3		\n"
+		"	srliw	%1, %0, %5	\n"
+		"	slliw	%2, %0, %5	\n"
+		"	or	%1, %2, %1	\n"
+		"	li	%2, 0		\n"
+		"	sub	%1, %1, %0	\n"
+		"	bnez	%1, 1f		\n"
+		"	addw	%0, %0, %4	\n"
+		"	sc.w	%2, %0, %3	\n"
+		"1:				\n"
+		: "=&r" (tmp), "=&r" (contended), "=&r" (res),
+		  "+A" (lock->lock)
+		: "r" (1 << TICKET_NEXT), "I" (TICKET_NEXT)
 		: "memory");
+	} while (res);
 
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
+	if (!contended) {
+		__atomic_acquire_fence();
+		return 1;
+	} else {
+		return 0;
 	}
 }
 
-/***********************************************************/
-
-static inline void arch_read_lock(arch_rwlock_t *lock)
+static inline void arch_spin_unlock(arch_spinlock_t *lock)
 {
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
+	smp_store_release(&lock->tickets.owner, lock->tickets.owner + 1);
+	/* FIXME - we need ipi/sev here to notify above */
 }
 
-static inline void arch_write_lock(arch_rwlock_t *lock)
+static inline int arch_spin_value_unlocked(arch_spinlock_t lock)
 {
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
+	return lock.tickets.owner == lock.tickets.next;
 }
 
-static inline int arch_read_trylock(arch_rwlock_t *lock)
+static inline int arch_spin_is_locked(arch_spinlock_t *lock)
 {
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
+	return !arch_spin_value_unlocked(READ_ONCE(*lock));
 }
 
-static inline int arch_write_trylock(arch_rwlock_t *lock)
+static inline int arch_spin_is_contended(arch_spinlock_t *lock)
 {
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
+	struct __raw_tickets tickets = READ_ONCE(lock->tickets);
 
-	return !busy;
+	return (tickets.next - tickets.owner) > 1;
 }
+#define arch_spin_is_contended	arch_spin_is_contended
 
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
 
 #endif /* _ASM_RISCV_SPINLOCK_H */
diff --git a/arch/riscv/include/asm/spinlock_types.h b/arch/riscv/include/asm/spinlock_types.h
index f398e76..d7b38bf 100644
--- a/arch/riscv/include/asm/spinlock_types.h
+++ b/arch/riscv/include/asm/spinlock_types.h
@@ -10,16 +10,21 @@
 # error "please don't include this file directly"
 #endif
 
+#define TICKET_NEXT	16
+
 typedef struct {
-	volatile unsigned int lock;
+	union {
+		u32 lock;
+		struct __raw_tickets {
+			/* little endian */
+			u16 owner;
+			u16 next;
+		} tickets;
+	};
 } arch_spinlock_t;
 
-#define __ARCH_SPIN_LOCK_UNLOCKED	{ 0 }
-
-typedef struct {
-	volatile unsigned int lock;
-} arch_rwlock_t;
+#define __ARCH_SPIN_LOCK_UNLOCKED	{ { 0 } }
 
-#define __ARCH_RW_LOCK_UNLOCKED		{ 0 }
+#include <asm-generic/qrwlock_types.h>
 
 #endif /* _ASM_RISCV_SPINLOCK_TYPES_H */
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
