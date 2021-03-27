Return-Path: <SRS0=+x6g=IZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53238C433C1
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Mar 2021 18:07:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F06F061971
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Mar 2021 18:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F06F061971
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJ/sVA5VVvL0XPmTrji9IaLYee6y987QirFlDiJgiEc=; b=QOCIbVLoo68wAE/gPSnnpMGkms
	JLYzRops5hG461CFYtt6FJauBQbjntbtLEPQyTnIcxl6PGaNU13D1n8ru9CX7rxVx/4x8oUieID3b
	fuNSY+mNMfLbEddCAr6fwpQ5OI4Q9f+aKXB1YLsYFAD8Sz0smB3DeKlipj62oe0H+8w/ZZbsJEEZD
	Lv7LThmp+6itX/c+ZDaH2fPhuRr5DeTVZWA1EcF2S9brr+rVkFDG97QZQ11YLHuLNeaCX0256kq2F
	qv7TjsVSMKa40tkjjeW0ynt1PuG9LsElgv7o/HaoegheSDCxewIDWvHudfaAE4xEM6z45QHPHtmfY
	hYZzbOOw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQDLf-005ORD-5B; Sat, 27 Mar 2021 18:07:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQDLX-005OPe-64
 for linux-riscv@lists.infradead.org; Sat, 27 Mar 2021 18:07:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 078A6619C9;
 Sat, 27 Mar 2021 18:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616868457;
 bh=6J9FKNfSghKRn1MDOq84VjUjsgWVuTuIQD6E9D3s7fA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qMnKVpC+8KBWbZTh5R7+nJDXD3FXhoONp+F+fNSMM7wAEy3fkfBBiHZ1XywaZNFKY
 /buaDYVJGJLf9u3DowXxt8TCubxCUli5p+uomIfnO8jQW9uBcIdDNf6B56bJRp1Oe2
 bGWZDA6bIVi8oSrawqje9YCB3RDCEi0A6OwXEGjnibYYthPIUgXgoNU1mBR1unLAxv
 31gzRbCwGVtjcEAF+F6MnrBGaunu9ysKQ39MeZZQ6sBUsu9XbL3gA4NjVmv4wteYE9
 pA8t8n9CveXdQM6AkIYEAR796wE9bXywe1CsDT3/fJRheglOYpnfPey2bfQTHszp87
 wQ/TPx8Auoqag==
From: guoren@kernel.org
To: guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-arch@vger.kernel.org,
 Michael Clark <michaeljclark@mac.com>,
 Peter Zijlstra <peterz@infradead.org>, Anup Patel <anup@brainfault.org>,
 Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmerdabbelt@google.com>
Subject: [PATCH v4 4/4] riscv: Convert custom spinlock/rwlock to generic
 qspinlock/qrwlock
Date: Sat, 27 Mar 2021 18:06:39 +0000
Message-Id: <1616868399-82848-5-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616868399-82848-1-git-send-email-guoren@kernel.org>
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_180740_638180_40B61E1F 
X-CRM114-Status: GOOD (  10.83  )
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

From: Michael Clark <michaeljclark@mac.com>

Update the RISC-V port to use the generic qspinlock and qrwlock.

This patch requires support for xchg for short which are added by
a previous patch.

Guo fixed up compile error which made by below include sequence:
+#include <asm/qrwlock.h>
+#include <asm/qspinlock.h>

Signed-off-by: Michael Clark <michaeljclark@mac.com>
Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
Tested-by: Guo Ren <guoren@linux.alibaba.com>
Link: https://lore.kernel.org/linux-riscv/20190211043829.30096-3-michaeljclark@mac.com/
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Anup Patel <anup@brainfault.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/Kconfig                      |   3 +
 arch/riscv/include/asm/Kbuild           |   3 +
 arch/riscv/include/asm/spinlock.h       | 126 +-----------------------
 arch/riscv/include/asm/spinlock_types.h |  15 +--
 4 files changed, 11 insertions(+), 136 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 87d7b52f278f..67cc65ba1ea1 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -33,6 +33,9 @@ config RISCV
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
+	select ARCH_USE_QUEUED_RWLOCKS
+	select ARCH_USE_QUEUED_SPINLOCKS
+	select ARCH_USE_QUEUED_SPINLOCKS_XCHG32
 	select CLONE_BACKWARDS
 	select CLINT_TIMER if !MMU
 	select COMMON_CLK
diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
index 445ccc97305a..750c1056b90f 100644
--- a/arch/riscv/include/asm/Kbuild
+++ b/arch/riscv/include/asm/Kbuild
@@ -3,5 +3,8 @@ generic-y += early_ioremap.h
 generic-y += extable.h
 generic-y += flat.h
 generic-y += kvm_para.h
+generic-y += mcs_spinlock.h
+generic-y += qrwlock.h
+generic-y += qspinlock.h
 generic-y += user.h
 generic-y += vmlinux.lds.h
diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
index f4f7fa1b7ca8..a557de67a425 100644
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
+#include <asm/qspinlock.h>
+#include <asm/qrwlock.h>
 
 #endif /* _ASM_RISCV_SPINLOCK_H */
diff --git a/arch/riscv/include/asm/spinlock_types.h b/arch/riscv/include/asm/spinlock_types.h
index f398e7638dd6..d033a973f287 100644
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
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
