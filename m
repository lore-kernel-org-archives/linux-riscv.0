Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D55C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 13:05:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5A7E611C7
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 13:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E5A7E611C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NS5WIKRbLQNhCok0kL8ox0Q85S98FmIFBPThiVFs9T4=; b=2pefvpw9Dn87Dw
	M3L0gv+rhph2hKypRPoE/L8Fun50DzRdxxt7SA6EiqDUpRz6vjJCCSlQxcyIsrP98Jif2xCBGeCzM
	5H6D0U7wtnybq59ia+VoxBq7HNP73VfMRjcKCKjTvPyMOcvJfECFK+G8IY91TlcZJFJMY6nr5c3RQ
	GeOjwSgWhvi1fXDu+ZyBgyY7LFe6qcq+kV/83Y1GztggbLZQm07i5Vo3yx27cWpfqo9b8RTdyX31z
	mdJ0csCnBkJLrXRr18jRmR+JZOotpyQzYCrOeHG/ZWw6t6gxuycfxYMoTBQ4jOSerrcu1+YEti620
	LgLj7ZU0mETVaGydgxWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdXlR-007azN-41; Thu, 21 Oct 2021 13:05:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdXlP-007azF-F8
 for linux-riscv@bombadil.infradead.org; Thu, 21 Oct 2021 13:05:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=yLs7lohtLUQMBUgR69hUB9nLgmBz4P81eC7G2AavgVU=; b=OBTmoQzbtIGzP9wuLJ5BP2iPrV
 nDwC/5evJUnVu35laqICruZHdWwddzr+tJE6bLs7FSoGBuSb9vtHIpnuJjm8/T7JFlcIUBfCCJ8Pc
 im0Q5zAGzq6L9sKWiQ8I3JTdX7Ng6aBjGI1en6Bk31fADMDf2PSzMiKwcwHy95vnEBao1Q6vgeNjh
 aFgJxXP8pFISqpRQ5X8LfCZzvrA2y7od+utirmmP2EGvFo+KFs9pRxr6+WninaDMs4Jjgel7Mhq3+
 tujnJEabHn2SXHKPezINZLw2m3isdr7/3afpGTLa0I9U8SWi9VhzbdPvZh6V/rXg1XRPHZMlikjPC
 GO+NkxxA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdXkz-00BKgz-BB; Thu, 21 Oct 2021 13:05:19 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 5D0A43002BC;
 Thu, 21 Oct 2021 15:05:16 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id EAC13207A9AE4; Thu, 21 Oct 2021 15:05:15 +0200 (CEST)
Date: Thu, 21 Oct 2021 15:05:15 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Waiman Long <longman@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Anup Patel <anup@brainfault.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Christoph =?iso-8859-1?Q?M=FCllner?= <christophm30@gmail.com>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH] locking: Generic ticket lock
Message-ID: <YXFli3mzMishRpEq@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
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


There's currently a number of architectures that want/have graduated
from test-and-set locks and are looking at qspinlock.

*HOWEVER* qspinlock is very complicated and requires a lot of an
architecture to actually work correctly. Specifically it requires
forward progress between a fair number of atomic primitives, including
an xchg16 operation, which I've seen a fair number of fundamentally
broken implementations of in the tree (specifically for qspinlock no
less).

The benefit of qspinlock over ticket lock is also non-obvious, esp.
at low contention (the vast majority of cases in the kernel), and it
takes a fairly large number of CPUs (typically also NUMA) to make
qspinlock beat ticket locks.

Esp. things like ARM64's WFE can move the balance a lot in favour of
simpler locks by reducing the cacheline pressure due to waiters (see
their smp_cond_load_acquire() implementation for details).

Unless you've audited qspinlock for your architecture and found it
sound *and* can show actual benefit, simpler is better.

Therefore provide ticket locks, which depend on a single atomic
operation (fetch_add) while still providing fairness.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/asm-generic/qspinlock.h         |   30 +++++++++
 include/asm-generic/ticket_lock_types.h |   11 +++
 include/asm-generic/ticket_lock.h       |   97 ++++++++++++++++++++++++++++++++
 3 files changed, 138 insertions(+)

--- a/include/asm-generic/qspinlock.h
+++ b/include/asm-generic/qspinlock.h
@@ -2,6 +2,36 @@
 /*
  * Queued spinlock
  *
+ * A 'generic' spinlock implementation that is based on MCS locks. An
+ * architecture that's looking for a 'generic' spinlock, please first consider
+ * ticket_lock.h and only come looking here when you've considered all the
+ * constraints below and can show your hardware does actually perform better
+ * with qspinlock.
+ *
+ *
+ * It relies on smp_store_release() + atomic_*_acquire() to be RCsc (or no
+ * weaker than RCtso if you're Power, also see smp_mb__after_unlock_lock()),
+ *
+ * It relies on a far greater (compared to ticket_lock.h) set of atomic
+ * operations to behave well together, please audit them carefully to ensure
+ * they all have forward progress. Many atomic operations may default to
+ * cmpxchg() loops which will not have good forward progress properties on
+ * LL/SC architectures.
+ *
+ * One notable example is atomic_fetch_or_acquire(), which x86 cannot (cheaply)
+ * do. Carefully read the patches that introduced
+ * queued_fetch_set_pending_acquire().
+ *
+ * It also heavily relies on mixed size atomic operations, in specific it
+ * requires architectures to have xchg16; something which many LL/SC
+ * architectures need to implement as a 32bit and+or in order to satisfy the
+ * forward progress guarantees mentioned above.
+ *
+ * Further reading on mixed size atomics that might be relevant:
+ *
+ *   http://www.cl.cam.ac.uk/~pes20/popl17/mixed-size.pdf
+ *
+ *
  * (C) Copyright 2013-2015 Hewlett-Packard Development Company, L.P.
  * (C) Copyright 2015 Hewlett-Packard Enterprise Development LP
  *
--- /dev/null
+++ b/include/asm-generic/ticket_lock_types.h
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
--- /dev/null
+++ b/include/asm-generic/ticket_lock.h
@@ -0,0 +1,97 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * 'Generic' ticket lock implementation.
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
+ * It relies on smp_store_release() + atomic_*_acquire() to be RCsc (or no
+ * weaker than RCtso if you're Power, also see smp_mb__after_unlock_lock()),
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
+#include <asm/ticket_lock_types.h>
+
+#define ONE_TICKET	(1 << 16)
+#define __ticket(val)	(u16)((val) >> 16)
+#define __owner(val)	(u16)((val) & 0xffff)
+
+static __always_inline bool __ticket_is_locked(u32 val)
+{
+	return __ticket(val) != __owner(val);
+}
+
+static __always_inline void ticket_lock(arch_spinlock_t *lock)
+{
+	u32 val = atomic_fetch_add_acquire(ONE_TICKET, lock);
+	u16 ticket = __ticket(val);
+
+	if (ticket == __owner(val))
+		return;
+
+	atomic_cond_read_acquire(lock, ticket == __owner(VAL));
+}
+
+static __always_inline bool ticket_trylock(arch_spinlock_t *lock)
+{
+	u32 old = atomic_read(lock);
+
+	if (__ticket_is_locked(old))
+		return false;
+
+	return atomic_try_cmpxchg_acquire(lock, &old, old + ONE_TICKET);
+}
+
+static __always_inline void ticket_unlock(arch_spinlock_t *lock)
+{
+	u16 *ptr = (u16 *)lock + __is_defined(__BIG_ENDIAN);
+	u32 val = atomic_read(lock);
+
+	smp_store_release(ptr, __owner(val) + 1);
+}
+
+static __always_inline int ticket_is_contended(arch_spinlock_t *lock)
+{
+	u32 val = atomic_read(lock);
+
+	return (__ticket(val) - __owner(val)) > 1;
+}
+
+static __always_inline int ticket_is_locked(arch_spinlock_t *lock)
+{
+	return __ticket_is_locked(atomic_read(lock));
+}
+
+static __always_inline int ticket_value_unlocked(arch_spinlock_t lock)
+{
+	return !__ticket_is_locked(lock.counter);
+}
+
+#undef __owner
+#undef __ticket
+#undef ONE_TICKET
+
+#define arch_spin_lock(l)		ticket_lock(l)
+#define arch_spin_trylock(l)		ticket_trylock(l)
+#define arch_spin_unlock(l)		ticket_unlock(l)
+#define arch_spin_is_locked(l)		ticket_is_locked(l)
+#define arch_spin_is_contended(l)	ticket_is_contended(l)
+#define arch_spin_value_unlocked(l)	ticket_value_unlocked(l)
+
+#endif /* __ASM_GENERIC_TICKET_LOCK_H */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
