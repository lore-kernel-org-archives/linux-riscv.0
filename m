Return-Path: <SRS0=/ZyV=I2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB87C433DB
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Mar 2021 06:31:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FEF761981
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Mar 2021 06:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FEF761981
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/J5huhh6o7Tpoh0BSd27FjteNIHs4riGPHcw4Ig3SCc=; b=pD8Xow2Eqj+lKTWe6AdDMk4pmi
	6XBsr5qAYQQIjR0wtaxEsEexyoU9pSduRM3wUe6ONFoxnxDhHIjtu3FEcaenmcXycN4C4j7uNNtEy
	0Bm8ujnM/Drmqj7QbMbP0RRQ43P9Lzki+qz10ndKnguRofALmEJQ5Fz4VrauylW1wEkWonD0Nswkl
	6oyfaA78uL9YeyDKLqYWsBvGxFeUdAFdPQoo+dq8UZfUrQd0blMU0f1Go0IfuprcqYbsjTYU7yNQF
	QR/HVlsRQ6hr9N7/MqHgImY2j5eZGgtq+PfW4NKWOMkBh7eGGMRIa6mkrv8kEjkeRuNXsfj2mtwV9
	uj83Qb8Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQOxR-005uvA-Lg; Sun, 28 Mar 2021 06:31:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQOxN-005uuA-PU
 for linux-riscv@lists.infradead.org; Sun, 28 Mar 2021 06:31:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 331216197C;
 Sun, 28 Mar 2021 06:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616913088;
 bh=aYDkJQnGePK/+lkF8hDtexkWagQ4SRB6bigpJhVfgAg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FAgaTJnJOmusUtmymyBNZXGK1BUiB+LA57rvQXmHTnMcTLIWlPLGv0PPjuf3tTRRr
 2M7sjdWDdwVjcO7G7yxZCrx9l+ZUtk+0DDg1pMt3NRHZMphNHPFG0G7hgysB/LzNXL
 Qk+qoQKbLwUilgC6hb7zxfcsvrM9A3HaNy/c8TSQG4x2zdRyPx3pAS67nZoGmcISIM
 93imAG0DvPoKRNOZTqu4k854xndY6bJpFXoFuhV/ny4XCRhKJ0GsX6mARj0YJylwLR
 a8OiaIYEGfIi7XB3XgVeDPDpsGXg7Tm6jCxNm6emiN9+uFIgg5DJNngRhzrFEk3zLp
 l+WH2kaYZxeFQ==
From: guoren@kernel.org
To: guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>, Waiman Long <longman@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v5 3/7] csky: Convert custom spinlock/rwlock to generic
 qspinlock/qrwlock
Date: Sun, 28 Mar 2021 06:30:24 +0000
Message-Id: <1616913028-83376-4-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616913028-83376-1-git-send-email-guoren@kernel.org>
References: <1616913028-83376-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210328_073130_199501_4FFB4CD0 
X-CRM114-Status: GOOD (  11.19  )
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

Update the C-SKY port to use the generic qspinlock and qrwlock.

C-SKY only support ldex.w/stex.w with word(double word) size &
align access. So it must select XCHG32 to let qspinlock only use
word atomic xchg_tail.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Waiman Long <longman@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/csky/Kconfig                      |  2 +
 arch/csky/include/asm/Kbuild           |  2 +
 arch/csky/include/asm/spinlock.h       | 82 +-------------------------
 arch/csky/include/asm/spinlock_types.h | 16 +----
 4 files changed, 6 insertions(+), 96 deletions(-)

diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
index 34e91224adc3..5910eb6ddde2 100644
--- a/arch/csky/Kconfig
+++ b/arch/csky/Kconfig
@@ -8,6 +8,8 @@ config CSKY
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_QUEUED_RWLOCKS
+	select ARCH_USE_QUEUED_SPINLOCKS
+	select ARCH_USE_QUEUED_SPINLOCKS_XCHG32
 	select ARCH_WANT_FRAME_POINTERS if !CPU_CK610
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
 	select COMMON_CLK
diff --git a/arch/csky/include/asm/Kbuild b/arch/csky/include/asm/Kbuild
index cc24bb8e539f..2a2d09963bb9 100644
--- a/arch/csky/include/asm/Kbuild
+++ b/arch/csky/include/asm/Kbuild
@@ -2,6 +2,8 @@
 generic-y += asm-offsets.h
 generic-y += gpio.h
 generic-y += kvm_para.h
+generic-y += mcs_spinlock.h
 generic-y += qrwlock.h
+generic-y += qspinlock.h
 generic-y += user.h
 generic-y += vmlinux.lds.h
diff --git a/arch/csky/include/asm/spinlock.h b/arch/csky/include/asm/spinlock.h
index 69f5aa249c5f..fcff36753c25 100644
--- a/arch/csky/include/asm/spinlock.h
+++ b/arch/csky/include/asm/spinlock.h
@@ -3,87 +3,7 @@
 #ifndef __ASM_CSKY_SPINLOCK_H
 #define __ASM_CSKY_SPINLOCK_H
 
-#include <linux/spinlock_types.h>
-#include <asm/barrier.h>
-
-/*
- * Ticket-based spin-locking.
- */
-static inline void arch_spin_lock(arch_spinlock_t *lock)
-{
-	arch_spinlock_t lockval;
-	u32 ticket_next = 1 << TICKET_NEXT;
-	u32 *p = &lock->lock;
-	u32 tmp;
-
-	asm volatile (
-		"1:	ldex.w		%0, (%2) \n"
-		"	mov		%1, %0	 \n"
-		"	add		%0, %3	 \n"
-		"	stex.w		%0, (%2) \n"
-		"	bez		%0, 1b   \n"
-		: "=&r" (tmp), "=&r" (lockval)
-		: "r"(p), "r"(ticket_next)
-		: "cc");
-
-	while (lockval.tickets.next != lockval.tickets.owner)
-		lockval.tickets.owner = READ_ONCE(lock->tickets.owner);
-
-	smp_mb();
-}
-
-static inline int arch_spin_trylock(arch_spinlock_t *lock)
-{
-	u32 tmp, contended, res;
-	u32 ticket_next = 1 << TICKET_NEXT;
-	u32 *p = &lock->lock;
-
-	do {
-		asm volatile (
-		"	ldex.w		%0, (%3)   \n"
-		"	movi		%2, 1	   \n"
-		"	rotli		%1, %0, 16 \n"
-		"	cmpne		%1, %0     \n"
-		"	bt		1f         \n"
-		"	movi		%2, 0	   \n"
-		"	add		%0, %0, %4 \n"
-		"	stex.w		%0, (%3)   \n"
-		"1:				   \n"
-		: "=&r" (res), "=&r" (tmp), "=&r" (contended)
-		: "r"(p), "r"(ticket_next)
-		: "cc");
-	} while (!res);
-
-	if (!contended)
-		smp_mb();
-
-	return !contended;
-}
-
-static inline void arch_spin_unlock(arch_spinlock_t *lock)
-{
-	smp_mb();
-	WRITE_ONCE(lock->tickets.owner, lock->tickets.owner + 1);
-}
-
-static inline int arch_spin_value_unlocked(arch_spinlock_t lock)
-{
-	return lock.tickets.owner == lock.tickets.next;
-}
-
-static inline int arch_spin_is_locked(arch_spinlock_t *lock)
-{
-	return !arch_spin_value_unlocked(READ_ONCE(*lock));
-}
-
-static inline int arch_spin_is_contended(arch_spinlock_t *lock)
-{
-	struct __raw_tickets tickets = READ_ONCE(lock->tickets);
-
-	return (tickets.next - tickets.owner) > 1;
-}
-#define arch_spin_is_contended	arch_spin_is_contended
-
+#include <asm/qspinlock.h>
 #include <asm/qrwlock.h>
 
 #endif /* __ASM_CSKY_SPINLOCK_H */
diff --git a/arch/csky/include/asm/spinlock_types.h b/arch/csky/include/asm/spinlock_types.h
index 8ff0f6ff3a00..757594760e65 100644
--- a/arch/csky/include/asm/spinlock_types.h
+++ b/arch/csky/include/asm/spinlock_types.h
@@ -7,21 +7,7 @@
 # error "please don't include this file directly"
 #endif
 
-#define TICKET_NEXT	16
-
-typedef struct {
-	union {
-		u32 lock;
-		struct __raw_tickets {
-			/* little endian */
-			u16 owner;
-			u16 next;
-		} tickets;
-	};
-} arch_spinlock_t;
-
-#define __ARCH_SPIN_LOCK_UNLOCKED	{ { 0 } }
-
+#include <asm-generic/qspinlock_types.h>
 #include <asm-generic/qrwlock_types.h>
 
 #endif /* __ASM_CSKY_SPINLOCK_TYPES_H */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
