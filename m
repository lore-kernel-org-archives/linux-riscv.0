Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F04C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Mar 2022 03:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K65XquVtqJ6MCwqZel4hSzsXM1fiA/vAvQ/rmBLJvZw=; b=qL9PJgRqbpZUt3
	+rHcyHOHcvGU0UH/Ra34SRErAGVCXAYdciasnOe4AI4MWejF4Gl2tcs4qOE2lWXl5PDlOsD99vmU8
	TykRU4XbzBYbz4fv/mAsESqWtNeASBp9QHgI6e24Rybk3KL+S7vWnsoZrFgRYO6IKquNNMj4pHXZa
	CqJl7VsIrA+3GCt0G6RkwlVyXiBMaX5jphS1ooIbTB+dC3uFXOhu7cdOCm3NMiDl52YawS6lXOb1J
	L2n3xZvyArOJP+YNU1kx4Ql+3ZwRrG7cldtw4TBH7GRGR8+nd2KYjQCyDztGP6N3rzNg4Q22+jpSw
	KPGm8c02/FA4vf8kSDPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVQBV-003BJn-Od; Sat, 19 Mar 2022 03:55:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVQBR-003BIG-IP
 for linux-riscv@lists.infradead.org; Sat, 19 Mar 2022 03:55:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2BA47616ED;
 Sat, 19 Mar 2022 03:55:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC82CC340EF;
 Sat, 19 Mar 2022 03:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647662116;
 bh=/bReo6UVHKvKAiVeuG78E1Bfu20TwWPnkpvpQ38eLMw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tw1o6hQeHP8BdNW9F2BDp9jWTMRAzO9NzPUeRJ1pFXcix/NrEoOhvkB9xDhlqVKVI
 zQMw9nJaZfYuGC2z8Os6CpcQmRQcdG+MdLHIbZeVzmJDr7fk7zKomcuIIkTluvG6IR
 bGozB5kWVnYOqIckguD1i835j9uyC2le0EO9GXi72QFIuLFa3GMOb7etZKFlgMlJq1
 CrxPyH08y2ZN7DtmohrCowviTsM0vOUXxjRnAfZMLm7i1rUfi4L4aSsOk8dctj4GZd
 tlemMNcw0SIR0Dzh56L+iKPhzVDyWtbBoYeoW4N6X/9ZV3Fu0/oVMGC972BQlJmdmF
 l109uoGQf8rqA==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, boqun.feng@gmail.com,
 longman@redhat.com, peterz@infradead.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 openrisc@lists.librecores.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH V2 1/5] asm-generic: ticket-lock: New generic ticket-based
 spinlock
Date: Sat, 19 Mar 2022 11:54:53 +0800
Message-Id: <20220319035457.2214979-2-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220319035457.2214979-1-guoren@kernel.org>
References: <20220319035457.2214979-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_205517_720214_91FCDD17 
X-CRM114-Status: GOOD (  19.60  )
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

From: Peter Zijlstra <peterz@infradead.org>

This is a simple, fair spinlock.  Specifically it doesn't have all the
subtle memory model dependencies that qspinlock has, which makes it more
suitable for simple systems as it is more likely to be correct.

[Palmer: commit text]
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

--

I have specifically not included Peter's SOB on this, as he sent his
original patch
<https://lore.kernel.org/lkml/YHbBBuVFNnI4kjj3@hirez.programming.kicks-ass.net/>
without one.
---
 include/asm-generic/spinlock.h          | 11 +++-
 include/asm-generic/spinlock_types.h    | 15 +++++
 include/asm-generic/ticket-lock-types.h | 11 ++++
 include/asm-generic/ticket-lock.h       | 86 +++++++++++++++++++++++++
 4 files changed, 120 insertions(+), 3 deletions(-)
 create mode 100644 include/asm-generic/spinlock_types.h
 create mode 100644 include/asm-generic/ticket-lock-types.h
 create mode 100644 include/asm-generic/ticket-lock.h

diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
index adaf6acab172..a8e2aa1bcea4 100644
--- a/include/asm-generic/spinlock.h
+++ b/include/asm-generic/spinlock.h
@@ -1,12 +1,17 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #ifndef __ASM_GENERIC_SPINLOCK_H
 #define __ASM_GENERIC_SPINLOCK_H
+
 /*
- * You need to implement asm/spinlock.h for SMP support. The generic
- * version does not handle SMP.
+ * Using ticket-spinlock.h as generic for SMP support.
  */
 #ifdef CONFIG_SMP
-#error need an architecture specific asm/spinlock.h
+#include <asm-generic/ticket-lock.h>
+#ifdef CONFIG_QUEUED_RWLOCKS
+#include <asm-generic/qrwlock.h>
+#else
+#error Please select ARCH_USE_QUEUED_RWLOCKS in architecture Kconfig
+#endif
 #endif
 
 #endif /* __ASM_GENERIC_SPINLOCK_H */
diff --git a/include/asm-generic/spinlock_types.h b/include/asm-generic/spinlock_types.h
new file mode 100644
index 000000000000..ba8ef4b731ba
--- /dev/null
+++ b/include/asm-generic/spinlock_types.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_GENERIC_SPINLOCK_TYPES_H
+#define __ASM_GENERIC_SPINLOCK_TYPES_H
+
+/*
+ * Using ticket spinlock as generic for SMP support.
+ */
+#ifdef CONFIG_SMP
+#include <asm-generic/ticket-lock-types.h>
+#include <asm-generic/qrwlock_types.h>
+#else
+#error The asm-generic/spinlock_types.h is not for CONFIG_SMP=n
+#endif
+
+#endif /* __ASM_GENERIC_SPINLOCK_TYPES_H */
diff --git a/include/asm-generic/ticket-lock-types.h b/include/asm-generic/ticket-lock-types.h
new file mode 100644
index 000000000000..829759aedda8
--- /dev/null
+++ b/include/asm-generic/ticket-lock-types.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ASM_GENERIC_TICKET_LOCK_TYPES_H
+#define __ASM_GENERIC_TICKET_LOCK_TYPES_H
+
+#include <linux/types.h>
+typedef atomic_t arch_spinlock_t;
+
+#define __ARCH_SPIN_LOCK_UNLOCKED	ATOMIC_INIT(0)
+
+#endif /* __ASM_GENERIC_TICKET_LOCK_TYPES_H */
diff --git a/include/asm-generic/ticket-lock.h b/include/asm-generic/ticket-lock.h
new file mode 100644
index 000000000000..59373de3e32a
--- /dev/null
+++ b/include/asm-generic/ticket-lock.h
@@ -0,0 +1,86 @@
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
+ * uses atomic_fetch_add() which is SC to create an RCsc lock.
+ *
+ * The implementation uses smp_cond_load_acquire() to spin, so if the
+ * architecture has WFE like instructions to sleep instead of poll for word
+ * modifications be sure to implement that (see ARM64 for example).
+ *
+ */
+
+#ifndef __ASM_GENERIC_TICKET_LOCK_H
+#define __ASM_GENERIC_TICKET_LOCK_H
+
+#include <linux/atomic.h>
+#include <asm-generic/ticket-lock-types.h>
+
+static __always_inline void ticket_lock(arch_spinlock_t *lock)
+{
+	u32 val = atomic_fetch_add(1<<16, lock); /* SC, gives us RCsc */
+	u16 ticket = val >> 16;
+
+	if (ticket == (u16)val)
+		return;
+
+	atomic_cond_read_acquire(lock, ticket == (u16)VAL);
+}
+
+static __always_inline bool ticket_trylock(arch_spinlock_t *lock)
+{
+	u32 old = atomic_read(lock);
+
+	if ((old >> 16) != (old & 0xffff))
+		return false;
+
+	return atomic_try_cmpxchg(lock, &old, old + (1<<16)); /* SC, for RCsc */
+}
+
+static __always_inline void ticket_unlock(arch_spinlock_t *lock)
+{
+	u16 *ptr = (u16 *)lock + __is_defined(__BIG_ENDIAN);
+	u32 val = atomic_read(lock);
+
+	smp_store_release(ptr, (u16)val + 1);
+}
+
+static __always_inline int ticket_is_locked(arch_spinlock_t *lock)
+{
+	u32 val = atomic_read(lock);
+
+	return ((val >> 16) != (val & 0xffff));
+}
+
+static __always_inline int ticket_is_contended(arch_spinlock_t *lock)
+{
+	u32 val = atomic_read(lock);
+
+	return (s16)((val >> 16) - (val & 0xffff)) > 1;
+}
+
+static __always_inline int ticket_value_unlocked(arch_spinlock_t lock)
+{
+	return !ticket_is_locked(&lock);
+}
+
+#define arch_spin_lock(l)		ticket_lock(l)
+#define arch_spin_trylock(l)		ticket_trylock(l)
+#define arch_spin_unlock(l)		ticket_unlock(l)
+#define arch_spin_is_locked(l)		ticket_is_locked(l)
+#define arch_spin_is_contended(l)	ticket_is_contended(l)
+#define arch_spin_value_unlocked(l)	ticket_value_unlocked(l)
+
+#endif /* __ASM_GENERIC_TICKET_LOCK_H */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
