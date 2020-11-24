Return-Path: <SRS0=DJxK=E6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F08C56201
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 13:52:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E50F920872
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 13:52:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DFf2IlgL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fr62qrVm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E50F920872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+gyiiNQ0hp900r3vDwd3o3zeqShRt5vFdEUvL5AzKmI=; b=DFf2IlgLBeJNVg3gJ2OLk1rl5X
	YAHv2245OJULhTlW4JXI9YgaCx+0uzzKJcGcDPj41o8F7TCtHhFP2c9+7BrBXOlcKJGFCuHiFz/3g
	8hZJ/VxlXbW4g9eDLqQQbH1SNLCnaR8Ya2/QQLNjRcD6LHnyioxpMZjsjaGwNTaqOYhUS9kjkbctN
	209exCm7sJ7B4WxIq37/R2gl3saQKxpvOy6OCqEWYgjpNWXbXrnmMj33007u46Nf66+Z/iYquP+Ki
	vwzrfcJPb3Op7QKH9O5a1TI53VHiGVaGxIGWX2Hhytft4PgQ4aABVDtr1+KgcFMEkokBPQOABOZQ+
	opnolvFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYje-000711-Ts; Tue, 24 Nov 2020 13:51:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYd8-0003EE-6L
 for linux-riscv@lists.infradead.org; Tue, 24 Nov 2020 13:45:19 +0000
Received: from localhost.localdomain (unknown [42.120.72.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F3A502083E;
 Tue, 24 Nov 2020 13:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606225511;
 bh=DtG+IMRw20y2hmtpwA24L+hLLydVfP+wjdec7CN4NLs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fr62qrVmPcWWFBSTHa8Z+mPLD0Gpy6BOGwYb001UPRubUQ7CJ4svbYhk1yesBSxg6
 fK6YbIZbLserD+kmm5GIVgzcn9ZS5RYwB8AKxfzqyA4btPWwu/LUrLRsvn0D6V7Slv
 k2w92oIx/T2QQRFoJAcNITvBpDOSJ7ROzmnX6xEQ=
From: guoren@kernel.org
To: peterz@infradead.org, arnd@arndb.de, palmerdabbelt@google.com,
 paul.walmsley@sifive.com, anup@brainfault.org
Subject: [PATCH 3/5] csky: Remove simple spinlock implementation
Date: Tue, 24 Nov 2020 13:43:55 +0000
Message-Id: <1606225437-22948-3-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606225437-22948-1-git-send-email-guoren@kernel.org>
References: <1606225437-22948-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_084514_567811_4D5E8C3F 
X-CRM114-Status: GOOD (  15.23  )
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
Cc: linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>,
 guoren@kernel.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

There are two implementation of spinlock in csky:
 - simple one (NR_CPU = 1,2)
 - tick's one (NR_CPU = 3,4,5...)

We needn't the baby codes of simple one now.

Link: https://lore.kernel.org/linux-csky/20200807081253.GD2674@hirez.programming.kicks-ass.net/#t
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Peter Zijlstra <peterz@infradead.org>
---
 arch/csky/Kconfig                      |   2 +-
 arch/csky/include/asm/spinlock.h       | 164 ---------------------------------
 arch/csky/include/asm/spinlock_types.h |  10 --
 3 files changed, 1 insertion(+), 175 deletions(-)

diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
index 268fad5..14ee229 100644
--- a/arch/csky/Kconfig
+++ b/arch/csky/Kconfig
@@ -7,7 +7,7 @@ config CSKY
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_USE_BUILTIN_BSWAP
-	select ARCH_USE_QUEUED_RWLOCKS if NR_CPUS>2
+	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_WANT_FRAME_POINTERS if !CPU_CK610
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
 	select COMMON_CLK
diff --git a/arch/csky/include/asm/spinlock.h b/arch/csky/include/asm/spinlock.h
index 7cf3f2b..9feb0fd 100644
--- a/arch/csky/include/asm/spinlock.h
+++ b/arch/csky/include/asm/spinlock.h
@@ -6,8 +6,6 @@
 #include <linux/spinlock_types.h>
 #include <asm/barrier.h>
 
-#ifdef CONFIG_QUEUED_RWLOCKS
-
 /*
  * Ticket-based spin-locking.
  */
@@ -91,166 +89,4 @@ static inline int arch_spin_is_contended(arch_spinlock_t *lock)
 /* See include/linux/spinlock.h */
 #define smp_mb__after_spinlock()	smp_mb()
 
-#else /* CONFIG_QUEUED_RWLOCKS */
-
-/*
- * Test-and-set spin-locking.
- */
-static inline void arch_spin_lock(arch_spinlock_t *lock)
-{
-	u32 *p = &lock->lock;
-	u32 tmp;
-
-	asm volatile (
-		"1:	ldex.w		%0, (%1) \n"
-		"	bnez		%0, 1b   \n"
-		"	movi		%0, 1    \n"
-		"	stex.w		%0, (%1) \n"
-		"	bez		%0, 1b   \n"
-		: "=&r" (tmp)
-		: "r"(p)
-		: "cc");
-	smp_mb();
-}
-
-static inline void arch_spin_unlock(arch_spinlock_t *lock)
-{
-	smp_mb();
-	WRITE_ONCE(lock->lock, 0);
-}
-
-static inline int arch_spin_trylock(arch_spinlock_t *lock)
-{
-	u32 *p = &lock->lock;
-	u32 tmp;
-
-	asm volatile (
-		"1:	ldex.w		%0, (%1) \n"
-		"	bnez		%0, 2f   \n"
-		"	movi		%0, 1    \n"
-		"	stex.w		%0, (%1) \n"
-		"	bez		%0, 1b   \n"
-		"	movi		%0, 0    \n"
-		"2:				 \n"
-		: "=&r" (tmp)
-		: "r"(p)
-		: "cc");
-
-	if (!tmp)
-		smp_mb();
-
-	return !tmp;
-}
-
-#define arch_spin_is_locked(x)	(READ_ONCE((x)->lock) != 0)
-
-/*
- * read lock/unlock/trylock
- */
-static inline void arch_read_lock(arch_rwlock_t *lock)
-{
-	u32 *p = &lock->lock;
-	u32 tmp;
-
-	asm volatile (
-		"1:	ldex.w		%0, (%1) \n"
-		"	blz		%0, 1b   \n"
-		"	addi		%0, 1    \n"
-		"	stex.w		%0, (%1) \n"
-		"	bez		%0, 1b   \n"
-		: "=&r" (tmp)
-		: "r"(p)
-		: "cc");
-	smp_mb();
-}
-
-static inline void arch_read_unlock(arch_rwlock_t *lock)
-{
-	u32 *p = &lock->lock;
-	u32 tmp;
-
-	smp_mb();
-	asm volatile (
-		"1:	ldex.w		%0, (%1) \n"
-		"	subi		%0, 1    \n"
-		"	stex.w		%0, (%1) \n"
-		"	bez		%0, 1b   \n"
-		: "=&r" (tmp)
-		: "r"(p)
-		: "cc");
-}
-
-static inline int arch_read_trylock(arch_rwlock_t *lock)
-{
-	u32 *p = &lock->lock;
-	u32 tmp;
-
-	asm volatile (
-		"1:	ldex.w		%0, (%1) \n"
-		"	blz		%0, 2f   \n"
-		"	addi		%0, 1    \n"
-		"	stex.w		%0, (%1) \n"
-		"	bez		%0, 1b   \n"
-		"	movi		%0, 0    \n"
-		"2:				 \n"
-		: "=&r" (tmp)
-		: "r"(p)
-		: "cc");
-
-	if (!tmp)
-		smp_mb();
-
-	return !tmp;
-}
-
-/*
- * write lock/unlock/trylock
- */
-static inline void arch_write_lock(arch_rwlock_t *lock)
-{
-	u32 *p = &lock->lock;
-	u32 tmp;
-
-	asm volatile (
-		"1:	ldex.w		%0, (%1) \n"
-		"	bnez		%0, 1b   \n"
-		"	subi		%0, 1    \n"
-		"	stex.w		%0, (%1) \n"
-		"	bez		%0, 1b   \n"
-		: "=&r" (tmp)
-		: "r"(p)
-		: "cc");
-	smp_mb();
-}
-
-static inline void arch_write_unlock(arch_rwlock_t *lock)
-{
-	smp_mb();
-	WRITE_ONCE(lock->lock, 0);
-}
-
-static inline int arch_write_trylock(arch_rwlock_t *lock)
-{
-	u32 *p = &lock->lock;
-	u32 tmp;
-
-	asm volatile (
-		"1:	ldex.w		%0, (%1) \n"
-		"	bnez		%0, 2f   \n"
-		"	subi		%0, 1    \n"
-		"	stex.w		%0, (%1) \n"
-		"	bez		%0, 1b   \n"
-		"	movi		%0, 0    \n"
-		"2:				 \n"
-		: "=&r" (tmp)
-		: "r"(p)
-		: "cc");
-
-	if (!tmp)
-		smp_mb();
-
-	return !tmp;
-}
-
-#endif /* CONFIG_QUEUED_RWLOCKS */
 #endif /* __ASM_CSKY_SPINLOCK_H */
diff --git a/arch/csky/include/asm/spinlock_types.h b/arch/csky/include/asm/spinlock_types.h
index 88b8243..8ff0f6f 100644
--- a/arch/csky/include/asm/spinlock_types.h
+++ b/arch/csky/include/asm/spinlock_types.h
@@ -22,16 +22,6 @@ typedef struct {
 
 #define __ARCH_SPIN_LOCK_UNLOCKED	{ { 0 } }
 
-#ifdef CONFIG_QUEUED_RWLOCKS
 #include <asm-generic/qrwlock_types.h>
 
-#else /* CONFIG_NR_CPUS > 2 */
-
-typedef struct {
-	u32 lock;
-} arch_rwlock_t;
-
-#define __ARCH_RW_LOCK_UNLOCKED		{ 0 }
-
-#endif /* CONFIG_QUEUED_RWLOCKS */
 #endif /* __ASM_CSKY_SPINLOCK_TYPES_H */
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
