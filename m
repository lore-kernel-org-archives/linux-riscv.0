Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1362CCA473
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jun 2022 14:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SfqlxZeyDC2t40xfqv7nW52tNCNKmULxEUgks7tgCTE=; b=R9CPTHB6lJXi7g
	jlQtoM3cyWjVGbCSbdNaGD4yPcgn/DPSfe3yStIXWOlZLjHtG+Blgh48rjXIeOtj9hw0GsULLdAtA
	3krB9BUn8asE8I6QrgOZcBdPFhyR/KF6gmvbdStnW74UZT6BLbRownXkUK9b3FKisKH+EVl8PydmL
	4AF6sCV0Pom2UkK7b7CY3X1LheZz5HZsr/S7F0sKzdoqFnVSmAh+lAHJrnQ2XZ7tkIvljYVeVwFYo
	WD4gtJRWgfDl63zH+ti9HpNC3e2YYSQChX2rTP27YulyLbZ3Fi/jBH9olzcIXawWsRVAY9jKOUgiR
	Y+byq76MvycSJGyr4ugA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3fCV-005yWJ-D6; Tue, 21 Jun 2022 14:49:55 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3fCR-005yUY-7C
	for linux-riscv@lists.infradead.org; Tue, 21 Jun 2022 14:49:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id C7926CE19BA;
	Tue, 21 Jun 2022 14:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D0EC341C0;
	Tue, 21 Jun 2022 14:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655822987;
	bh=o7k5aZt+GPZLT7AuMi7ejxspY8QjEmA3Qfnf6gZmvRg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SbxceeGo4Rfq03hmZY7hQfj7fGA2j2+J9UAesk6KId9yP9v5gbCsUYOTCtfwhKxWb
	 mpVzFpUkMYxyhVage0lH5AP+0ImXKHRql1FHq9M/X37DewFxw/Sginw4mJq5fxgMtr
	 E5Gp+faUZPQxyzW3mRDygHO4Yd3VtT16GyGXMP7QKSmbkZNXENaEfGaAoK7VN4Rd0E
	 yZquxtpOfq6tw9dlLeaMQK2BTRBNd7+zjUDksyxex3t3i28rnS0qaAKv6unnsGHPBL
	 MOYRpvnPBPJB7LAiS0bjuddfQsf5QoOYNM3JAKbZj9trolZ3Hrjrz66NtPF9vAwWu+
	 2Vy7M0/zMC0KA==
From: guoren@kernel.org
To: palmer@rivosinc.com,
	arnd@arndb.de,
	peterz@infradead.org,
	longman@redhat.com,
	boqun.feng@gmail.com,
	Conor.Dooley@microchip.com,
	chenhuacai@loongson.cn,
	kernel@xen0n.name,
	r@hev.cc,
	shorne@gmail.com
Cc: linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V6 1/2] asm-generic: spinlock: Move qspinlock & ticket-lock into generic spinlock.h
Date: Tue, 21 Jun 2022 10:49:19 -0400
Message-Id: <20220621144920.2945595-2-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621144920.2945595-1-guoren@kernel.org>
References: <20220621144920.2945595-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_074951_686648_337556A2 
X-CRM114-Status: GOOD (  22.31  )
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

Separate ticket-lock into tspinlock.h and let generic spinlock support
qspinlock or ticket-lock selected by CONFIG_ARCH_USE_QUEUED_SPINLOCKS
config.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 include/asm-generic/spinlock.h        | 90 ++------------------------
 include/asm-generic/spinlock_types.h  | 14 ++--
 include/asm-generic/tspinlock.h       | 92 +++++++++++++++++++++++++++
 include/asm-generic/tspinlock_types.h | 17 +++++
 4 files changed, 119 insertions(+), 94 deletions(-)
 create mode 100644 include/asm-generic/tspinlock.h
 create mode 100644 include/asm-generic/tspinlock_types.h

diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
index fdfebcb050f4..4eca2488af38 100644
--- a/include/asm-generic/spinlock.h
+++ b/include/asm-generic/spinlock.h
@@ -1,92 +1,12 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-
-/*
- * 'Generic' ticket-lock implementation.
- *
- * It relies on atomic_fetch_add() having well defined forward progress
- * guarantees under contention. If your architecture cannot provide this, stick
- * to a test-and-set lock.
- *
- * It also relies on atomic_fetch_add() being safe vs smp_store_release() on a
- * sub-word of the value. This is generally true for anything LL/SC although
- * you'd be hard pressed to find anything useful in architecture specifications
- * about this. If your architecture cannot do this you might be better off with
- * a test-and-set.
- *
- * It further assumes atomic_*_release() + atomic_*_acquire() is RCpc and hence
- * uses atomic_fetch_add() which is RCsc to create an RCsc hot path, along with
- * a full fence after the spin to upgrade the otherwise-RCpc
- * atomic_cond_read_acquire().
- *
- * The implementation uses smp_cond_load_acquire() to spin, so if the
- * architecture has WFE like instructions to sleep instead of poll for word
- * modifications be sure to implement that (see ARM64 for example).
- *
- */
-
 #ifndef __ASM_GENERIC_SPINLOCK_H
 #define __ASM_GENERIC_SPINLOCK_H
 
-#include <linux/atomic.h>
-#include <asm-generic/spinlock_types.h>
-
-static __always_inline void arch_spin_lock(arch_spinlock_t *lock)
-{
-	u32 val = atomic_fetch_add(1<<16, lock);
-	u16 ticket = val >> 16;
-
-	if (ticket == (u16)val)
-		return;
-
-	/*
-	 * atomic_cond_read_acquire() is RCpc, but rather than defining a
-	 * custom cond_read_rcsc() here we just emit a full fence.  We only
-	 * need the prior reads before subsequent writes ordering from
-	 * smb_mb(), but as atomic_cond_read_acquire() just emits reads and we
-	 * have no outstanding writes due to the atomic_fetch_add() the extra
-	 * orderings are free.
-	 */
-	atomic_cond_read_acquire(lock, ticket == (u16)VAL);
-	smp_mb();
-}
-
-static __always_inline bool arch_spin_trylock(arch_spinlock_t *lock)
-{
-	u32 old = atomic_read(lock);
-
-	if ((old >> 16) != (old & 0xffff))
-		return false;
-
-	return atomic_try_cmpxchg(lock, &old, old + (1<<16)); /* SC, for RCsc */
-}
-
-static __always_inline void arch_spin_unlock(arch_spinlock_t *lock)
-{
-	u16 *ptr = (u16 *)lock + IS_ENABLED(CONFIG_CPU_BIG_ENDIAN);
-	u32 val = atomic_read(lock);
-
-	smp_store_release(ptr, (u16)val + 1);
-}
-
-static __always_inline int arch_spin_is_locked(arch_spinlock_t *lock)
-{
-	u32 val = atomic_read(lock);
-
-	return ((val >> 16) != (val & 0xffff));
-}
-
-static __always_inline int arch_spin_is_contended(arch_spinlock_t *lock)
-{
-	u32 val = atomic_read(lock);
-
-	return (s16)((val >> 16) - (val & 0xffff)) > 1;
-}
-
-static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
-{
-	return !arch_spin_is_locked(&lock);
-}
-
+#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
+#include <asm/qspinlock.h>
 #include <asm/qrwlock.h>
+#else
+#include <asm-generic/tspinlock.h>
+#endif
 
 #endif /* __ASM_GENERIC_SPINLOCK_H */
diff --git a/include/asm-generic/spinlock_types.h b/include/asm-generic/spinlock_types.h
index 8962bb730945..9875c1d058b3 100644
--- a/include/asm-generic/spinlock_types.h
+++ b/include/asm-generic/spinlock_types.h
@@ -3,15 +3,11 @@
 #ifndef __ASM_GENERIC_SPINLOCK_TYPES_H
 #define __ASM_GENERIC_SPINLOCK_TYPES_H
 
-#include <linux/types.h>
-typedef atomic_t arch_spinlock_t;
-
-/*
- * qrwlock_types depends on arch_spinlock_t, so we must typedef that before the
- * include.
- */
+#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
+#include <asm-generic/qspinlock_types.h>
 #include <asm/qrwlock_types.h>
-
-#define __ARCH_SPIN_LOCK_UNLOCKED	ATOMIC_INIT(0)
+#else
+#include <asm-generic/tspinlock_types.h>
+#endif
 
 #endif /* __ASM_GENERIC_SPINLOCK_TYPES_H */
diff --git a/include/asm-generic/tspinlock.h b/include/asm-generic/tspinlock.h
new file mode 100644
index 000000000000..def7b8f0f4f4
--- /dev/null
+++ b/include/asm-generic/tspinlock.h
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * 'Generic' ticket-lock implementation.
+ *
+ * It relies on atomic_fetch_add() having well defined forward progress
+ * guarantees under contention. If your architecture cannot provide this, stick
+ * to a test-and-set lock.
+ *
+ * It also relies on atomic_fetch_add() being safe vs smp_store_release() on a
+ * sub-word of the value. This is generally true for anything LL/SC although
+ * you'd be hard pressed to find anything useful in architecture specifications
+ * about this. If your architecture cannot do this you might be better off with
+ * a test-and-set.
+ *
+ * It further assumes atomic_*_release() + atomic_*_acquire() is RCpc and hence
+ * uses atomic_fetch_add() which is RCsc to create an RCsc hot path, along with
+ * a full fence after the spin to upgrade the otherwise-RCpc
+ * atomic_cond_read_acquire().
+ *
+ * The implementation uses smp_cond_load_acquire() to spin, so if the
+ * architecture has WFE like instructions to sleep instead of poll for word
+ * modifications be sure to implement that (see ARM64 for example).
+ *
+ */
+
+#ifndef __ASM_GENERIC_TSPINLOCK_H
+#define __ASM_GENERIC_TSPINLOCK_H
+
+#include <linux/atomic.h>
+#include <asm-generic/tspinlock_types.h>
+
+static __always_inline void arch_spin_lock(arch_spinlock_t *lock)
+{
+	u32 val = atomic_fetch_add(1<<16, lock);
+	u16 ticket = val >> 16;
+
+	if (ticket == (u16)val)
+		return;
+
+	/*
+	 * atomic_cond_read_acquire() is RCpc, but rather than defining a
+	 * custom cond_read_rcsc() here we just emit a full fence.  We only
+	 * need the prior reads before subsequent writes ordering from
+	 * smb_mb(), but as atomic_cond_read_acquire() just emits reads and we
+	 * have no outstanding writes due to the atomic_fetch_add() the extra
+	 * orderings are free.
+	 */
+	atomic_cond_read_acquire(lock, ticket == (u16)VAL);
+	smp_mb();
+}
+
+static __always_inline bool arch_spin_trylock(arch_spinlock_t *lock)
+{
+	u32 old = atomic_read(lock);
+
+	if ((old >> 16) != (old & 0xffff))
+		return false;
+
+	return atomic_try_cmpxchg(lock, &old, old + (1<<16)); /* SC, for RCsc */
+}
+
+static __always_inline void arch_spin_unlock(arch_spinlock_t *lock)
+{
+	u16 *ptr = (u16 *)lock + IS_ENABLED(CONFIG_CPU_BIG_ENDIAN);
+	u32 val = atomic_read(lock);
+
+	smp_store_release(ptr, (u16)val + 1);
+}
+
+static __always_inline int arch_spin_is_locked(arch_spinlock_t *lock)
+{
+	u32 val = atomic_read(lock);
+
+	return ((val >> 16) != (val & 0xffff));
+}
+
+static __always_inline int arch_spin_is_contended(arch_spinlock_t *lock)
+{
+	u32 val = atomic_read(lock);
+
+	return (s16)((val >> 16) - (val & 0xffff)) > 1;
+}
+
+static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
+{
+	return !arch_spin_is_locked(&lock);
+}
+
+#include <asm/qrwlock.h>
+
+#endif /* __ASM_GENERIC_TSPINLOCK_H */
diff --git a/include/asm-generic/tspinlock_types.h b/include/asm-generic/tspinlock_types.h
new file mode 100644
index 000000000000..ca3ea5acd172
--- /dev/null
+++ b/include/asm-generic/tspinlock_types.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ASM_GENERIC_TSPINLOCK_TYPES_H
+#define __ASM_GENERIC_TSPINLOCK_TYPES_H
+
+#include <linux/types.h>
+typedef atomic_t arch_spinlock_t;
+
+/*
+ * qrwlock_types depends on arch_spinlock_t, so we must typedef that before the
+ * include.
+ */
+#include <asm/qrwlock_types.h>
+
+#define __ARCH_SPIN_LOCK_UNLOCKED	ATOMIC_INIT(0)
+
+#endif /* __ASM_GENERIC_TSPINLOCK_TYPES_H */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
