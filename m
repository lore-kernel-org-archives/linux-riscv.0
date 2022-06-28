Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2AEC43334
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jun 2022 08:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cyUVqPsNYsLussLfm8VmSFq/QXolTO1rFlnIcVqpC4M=; b=30q4x35utuoho3
	x4D4Vez1NVoIUz5LIyIEcQKKY/Ow5bxGuQTUzRwFLIXL71U+RswQfIzOBt+hR4qgXOvHQuj+JNuMn
	M872XTaINp5/Y6JZdIQMPfroQuucqgXFkHlrwrDs6gyOPrDJcud4h+ivuqzG5bET2OzJwUB13eAJx
	xJqgIEAkYZPPosy21+wO2Pc7ON1neAY8bq/c3tz8p46fVya29oZecDmJ1Iz89Yeox+Lj7OXlmPhnh
	x6SbkGW2wJyr6w3EdjiDh5372IWoiDr1Br4Y83kskxND+/FJQVNog85Iqz4fu4ifQhlVIUimOEdtr
	3trvJdSHBiC73h8gbKnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o66QZ-005C5b-DS; Tue, 28 Jun 2022 08:18:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o66Pg-005BgX-20
	for linux-riscv@lists.infradead.org; Tue, 28 Jun 2022 08:17:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 913C161212;
	Tue, 28 Jun 2022 08:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ECF3C341CD;
	Tue, 28 Jun 2022 08:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656404255;
	bh=g2ZuhGG3HGmk8tNNjHUSt2Kmg34WaNBVGxTmVm8cja8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MSSOjJGt1ih1Cn49RlFQ/mtXij9nI3mrKbgo/KUAzz6M+7lTMN4r27STXJaA/mTi+
	 9WAi8FJ0XOu4hKOYkc7ten0V8/0J8PX34tTOJYp+r30fJYMsof+mcRCAlvrpveTfcp
	 ZQfTMKJN/h9W9mVUufrYPoa7kY/FJsHeUqujR0nRYMpKER5/VJID8BMAGkPGvMHAWf
	 h35douftA+2TFVW5mZ0py8HMNHQbV8TAqVThnvMbRbNj1wZf2e8Ir4b9+gEm1fJIzt
	 IpvoSjw84UWafAvDo/wbXmsYRvEOGAgfxAhawgHotgOJarvwsIyepz+KPcRiqeOaGA
	 uVJ+dnjRebBbw==
From: guoren@kernel.org
To: palmer@rivosinc.com,
	arnd@arndb.de,
	mingo@redhat.com,
	will@kernel.org,
	longman@redhat.com,
	boqun.feng@gmail.com
Cc: linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH V7 4/5] asm-generic: spinlock: Add combo spinlock (ticket & queued)
Date: Tue, 28 Jun 2022 04:17:06 -0400
Message-Id: <20220628081707.1997728-5-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628081707.1997728-1-guoren@kernel.org>
References: <20220628081707.1997728-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_011736_384910_8F050FA2 
X-CRM114-Status: GOOD (  13.13  )
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

Some architecture has a flexible requirement on the type of spinlock.
Some LL/SC architectures of ISA don't force micro-arch to give a strong
forward guarantee. Thus different kinds of memory model micro-arch would
come out in one ISA. The ticket lock is suitable for exclusive monitor
designed LL/SC micro-arch with limited cores and "!NUMA". The
queue-spinlock could deal with NUMA/large-scale scenarios with a strong
forward guarantee designed LL/SC micro-arch.

So, make the spinlock a combo with feature.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@rivosinc.com>
---
 include/asm-generic/spinlock.h | 43 ++++++++++++++++++++++++++++++++--
 kernel/locking/qspinlock.c     |  2 ++
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
index f41dc7c2b900..a9b43089bf99 100644
--- a/include/asm-generic/spinlock.h
+++ b/include/asm-generic/spinlock.h
@@ -28,34 +28,73 @@
 #define __ASM_GENERIC_SPINLOCK_H
 
 #include <asm-generic/ticket_spinlock.h>
+#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
+#include <linux/jump_label.h>
+#include <asm-generic/qspinlock.h>
+
+DECLARE_STATIC_KEY_TRUE(use_qspinlock_key);
+#endif
+
+#undef arch_spin_is_locked
+#undef arch_spin_is_contended
+#undef arch_spin_value_unlocked
+#undef arch_spin_lock
+#undef arch_spin_trylock
+#undef arch_spin_unlock
 
 static __always_inline void arch_spin_lock(arch_spinlock_t *lock)
 {
-	ticket_spin_lock(lock);
+#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
+	if (static_branch_likely(&use_qspinlock_key))
+		queued_spin_lock(lock);
+	else
+#endif
+		ticket_spin_lock(lock);
 }
 
 static __always_inline bool arch_spin_trylock(arch_spinlock_t *lock)
 {
+#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
+	if (static_branch_likely(&use_qspinlock_key))
+		return queued_spin_trylock(lock);
+#endif
 	return ticket_spin_trylock(lock);
 }
 
 static __always_inline void arch_spin_unlock(arch_spinlock_t *lock)
 {
-	ticket_spin_unlock(lock);
+#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
+	if (static_branch_likely(&use_qspinlock_key))
+		queued_spin_unlock(lock);
+	else
+#endif
+		ticket_spin_unlock(lock);
 }
 
 static __always_inline int arch_spin_is_locked(arch_spinlock_t *lock)
 {
+#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
+	if (static_branch_likely(&use_qspinlock_key))
+		return queued_spin_is_locked(lock);
+#endif
 	return ticket_spin_is_locked(lock);
 }
 
 static __always_inline int arch_spin_is_contended(arch_spinlock_t *lock)
 {
+#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
+	if (static_branch_likely(&use_qspinlock_key))
+		return queued_spin_is_contended(lock);
+#endif
 	return ticket_spin_is_contended(lock);
 }
 
 static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
 {
+#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
+	if (static_branch_likely(&use_qspinlock_key))
+		return queued_spin_value_unlocked(lock);
+#endif
 	return ticket_spin_value_unlocked(lock);
 }
 
diff --git a/kernel/locking/qspinlock.c b/kernel/locking/qspinlock.c
index 65a9a10caa6f..b7f7436f42f6 100644
--- a/kernel/locking/qspinlock.c
+++ b/kernel/locking/qspinlock.c
@@ -566,6 +566,8 @@ void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val)
 }
 EXPORT_SYMBOL(queued_spin_lock_slowpath);
 
+DEFINE_STATIC_KEY_TRUE_RO(use_qspinlock_key);
+
 /*
  * Generate the paravirt code for queued_spin_unlock_slowpath().
  */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
