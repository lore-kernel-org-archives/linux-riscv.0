Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11D6C00140
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 07:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AxDC60TyagQv70aE7EJMquPxMk863hhyII9wyCttFRo=; b=x/lQluVHHR6D0U
	SowOfV552l6ei3CJR42qN/L8R1bL9BSGGolGAJI+nvXnJvMGE1BKrtkUQeK96NgSOnUKb2Qt8oqJf
	NLdHTkd8dbqk9AE34aFhiFFBJDh0JFw/oTu5djbCYsBXHajdNT0mf2jh2ONFaUixotioQOAX6DIIB
	YeSiFi7gHx0AfuXU3NNTOJnrOaPuAZPNziuqP/wfd9iuWugr90EyP6qhIjWkcQrTjmr68AnOkwhoA
	9h0Z2vyIcwY2zfNCJuOIOHPeYT1sL23QIM3hbCat+q3zsY0KI6GICIfHZ84PYnfZnXOVrBO1+TzJ8
	gYi21EGPEp4jeklzecag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKwxh-00C1nB-SS; Mon, 08 Aug 2022 07:14:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKwxe-00C1kT-Pq
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 07:14:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 650D160D30;
	Mon,  8 Aug 2022 07:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13FA8C433D6;
	Mon,  8 Aug 2022 07:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659942841;
	bh=VTgzxT5YWA/FXTGh2L0uPc4Dz3cqTkrreO/CY7INghE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bfPqsa8VFloG1NRbhC8enTrVw0OkRGrGcLm+//WoDzQ9TvOTVF75xkB/W5QkB21ty
	 X/CwZ9TYEc/E66B3wvCUHwWY38osrkJhBa/VQjO8x8sCm17Xq3EXus/jyOwRI6q6pl
	 0i9vN7To7knSIEXDvUSRmzNFJUIT0B6XB9bx2kHRiTc4JjieQpAdn3tUdFr+36K4Li
	 rV+PiNTwZ4E92wpAs5/tCcoRlJxu2vsxg9POGgIdKFPWqnm6QV5+GLcbA5mB4Hy4u3
	 Y5xrgmB+hTFWRBsHoMNL+WpL4OBjFpR1yVnxV97fa+YUnvw9jhQFzFECEajyBhu4sp
	 QRNjxJEU9Brlw==
From: guoren@kernel.org
To: palmer@rivosinc.com,
	heiko@sntech.de,
	hch@infradead.org,
	arnd@arndb.de,
	peterz@infradead.org,
	will@kernel.org,
	boqun.feng@gmail.com,
	longman@redhat.com,
	shorne@gmail.com,
	conor.dooley@microchip.com
Cc: linux-csky@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V9 04/15] asm-generic: ticket-lock: Keep ticket-lock the same semantic with qspinlock
Date: Mon,  8 Aug 2022 03:13:07 -0400
Message-Id: <20220808071318.3335746-5-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220808071318.3335746-1-guoren@kernel.org>
References: <20220808071318.3335746-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_001402_954092_A35F3E3D 
X-CRM114-Status: GOOD (  13.52  )
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

Define smp_mb__after_spinlock by smp_mb as default behavior to give RCsc
synchronization point for all architectures. Keep the same semantic with
qspinlock, a acquire (RCpc) synchronization point. More detail, see
include/linux/spinlock.h.

Some architectures could give more robust semantics than smp_mb, eg.
riscv. Some architectures needn't smp_mb__after_spinlock because their
spinlocks have contained an RCsc.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
---
 include/asm-generic/spinlock.h        |  5 +++++
 include/asm-generic/ticket_spinlock.h | 18 ++++--------------
 2 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
index 970590baf61b..6f5a1b838ca2 100644
--- a/include/asm-generic/spinlock.h
+++ b/include/asm-generic/spinlock.h
@@ -6,4 +6,9 @@
 #include <asm-generic/ticket_spinlock.h>
 #include <asm/qrwlock.h>
 
+/* See include/linux/spinlock.h */
+#ifndef smp_mb__after_spinlock
+#define smp_mb__after_spinlock()	smp_mb()
+#endif
+
 #endif /* __ASM_GENERIC_SPINLOCK_H */
diff --git a/include/asm-generic/ticket_spinlock.h b/include/asm-generic/ticket_spinlock.h
index cfcff22b37b3..d8e6ec82f096 100644
--- a/include/asm-generic/ticket_spinlock.h
+++ b/include/asm-generic/ticket_spinlock.h
@@ -14,9 +14,8 @@
  * a test-and-set.
  *
  * It further assumes atomic_*_release() + atomic_*_acquire() is RCpc and hence
- * uses atomic_fetch_add() which is RCsc to create an RCsc hot path, along with
- * a full fence after the spin to upgrade the otherwise-RCpc
- * atomic_cond_read_acquire().
+ * uses smp_mb__after_spinlock which is RCsc to create an RCsc hot path, See
+ * include/linux/spinlock.h
  *
  * The implementation uses smp_cond_load_acquire() to spin, so if the
  * architecture has WFE like instructions to sleep instead of poll for word
@@ -32,22 +31,13 @@
 
 static __always_inline void ticket_spin_lock(arch_spinlock_t *lock)
 {
-	u32 val = atomic_fetch_add(1<<16, &lock->val);
+	u32 val = atomic_fetch_add_acquire(1<<16, &lock->val);
 	u16 ticket = val >> 16;
 
 	if (ticket == (u16)val)
 		return;
 
-	/*
-	 * atomic_cond_read_acquire() is RCpc, but rather than defining a
-	 * custom cond_read_rcsc() here we just emit a full fence.  We only
-	 * need the prior reads before subsequent writes ordering from
-	 * smb_mb(), but as atomic_cond_read_acquire() just emits reads and we
-	 * have no outstanding writes due to the atomic_fetch_add() the extra
-	 * orderings are free.
-	 */
 	atomic_cond_read_acquire(&lock->val, ticket == (u16)VAL);
-	smp_mb();
 }
 
 static __always_inline bool ticket_spin_trylock(arch_spinlock_t *lock)
@@ -57,7 +47,7 @@ static __always_inline bool ticket_spin_trylock(arch_spinlock_t *lock)
 	if ((old >> 16) != (old & 0xffff))
 		return false;
 
-	return atomic_try_cmpxchg(&lock->val, &old, old + (1<<16)); /* SC, for RCsc */
+	return atomic_try_cmpxchg_acquire(&lock->val, &old, old + (1<<16));
 }
 
 static __always_inline void ticket_spin_unlock(arch_spinlock_t *lock)
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
