Return-Path: <SRS0=+x6g=IZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12299C433DB
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Mar 2021 18:07:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DEA861991
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Mar 2021 18:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DEA861991
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GUJj4nD/K8vHYaLc270WaaJzzUok56ga7OgXuGyUeNk=; b=kiPnbBI2e951K4RQCC6PAyG8zU
	iljQr6AijIbcmuuD6QtyMUz7x3LEFIwYYE27zONppiieKr006OrWAp75SeMlvxROjaSdj7BVvu4bA
	A4D1/tHXKEqos1Mabmec2gR7oAY8WJcdrVbHojq2nsX5jRYGra7AZLr1d7ZEWN9mskVlw+nFPeyQC
	EjAiu2MZGmug4W0wgm5UXaKTUuV1Q8U8ssnb7hfwp3odz/59lAfqCWP2R/RgGaLJQIFbeZNDctgwb
	9RskoEMoJkoiZdwbqTSUfJ4GZ1lCkzbDosySURckI2F/tituhTbhLaQMQt0xwvc9e28vS75wMncGt
	I0MYoQkA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQDLd-005OQl-DK; Sat, 27 Mar 2021 18:07:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQDLU-005OP5-NT
 for linux-riscv@lists.infradead.org; Sat, 27 Mar 2021 18:07:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6195161965;
 Sat, 27 Mar 2021 18:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616868455;
 bh=LvRCrrCzj8udXkBA6WRXdyg71qL92AhvWoldyruR39k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=chiiL0yvB6GLw1pCkrzaWTJFvn76YRJU/n+BZBYztHPTGh+uoGLlmhRgoAQNlC54g
 OXCeIFjmYUhLqapkXYOi/+TB1ppmtdmV6JWFIoTlQf01SnYuPqe+BS30sWdry4VzOj
 iets2HU2I+h8s4RGn2zEFvrJPF6S3z7lPYsL+zTbW9dtL2wCMT0XrYdp+YEyYrXv3I
 zlBfOGPI6QPpa1G6XxskkEBivoktFSRd97qELc2fE4m63miZFBlygrMQ61hkcB91PA
 hbed4poQHYm7sNaEmRumdO5k4br16LR++Z3EUsqz7E6qeHcS8GnSNQpGabM1eDqiZO
 fMQgTZXR28bkA==
From: guoren@kernel.org
To: guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-arch@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>, Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup@brainfault.org>
Subject: [PATCH v4 3/4] locking/qspinlock: Add ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Date: Sat, 27 Mar 2021 18:06:38 +0000
Message-Id: <1616868399-82848-4-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616868399-82848-1-git-send-email-guoren@kernel.org>
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_180737_765159_7B4CC0C4 
X-CRM114-Status: GOOD (  12.80  )
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

Some architectures don't have sub-word swap atomic instruction,
they only have the full word's one.

The sub-word swap only improve the performance when:
NR_CPUS < 16K
 *  0- 7: locked byte
 *     8: pending
 *  9-15: not used
 * 16-17: tail index
 * 18-31: tail cpu (+1)

The 9-15 bits are wasted to use xchg16 in xchg_tail.

Please let architecture select xchg16/xchg32 to implement
xchg_tail.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Waiman Long <longman@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Anup Patel <anup@brainfault.org>
---
 kernel/Kconfig.locks       |  3 +++
 kernel/locking/qspinlock.c | 44 +++++++++++++++++++++-----------------
 2 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/kernel/Kconfig.locks b/kernel/Kconfig.locks
index 3de8fd11873b..d02f1261f73f 100644
--- a/kernel/Kconfig.locks
+++ b/kernel/Kconfig.locks
@@ -239,6 +239,9 @@ config LOCK_SPIN_ON_OWNER
 config ARCH_USE_QUEUED_SPINLOCKS
 	bool
 
+config ARCH_USE_QUEUED_SPINLOCKS_XCHG32
+	bool
+
 config QUEUED_SPINLOCKS
 	def_bool y if ARCH_USE_QUEUED_SPINLOCKS
 	depends on SMP
diff --git a/kernel/locking/qspinlock.c b/kernel/locking/qspinlock.c
index cbff6ba53d56..54de0632c6a8 100644
--- a/kernel/locking/qspinlock.c
+++ b/kernel/locking/qspinlock.c
@@ -163,26 +163,6 @@ static __always_inline void clear_pending_set_locked(struct qspinlock *lock)
 	WRITE_ONCE(lock->locked_pending, _Q_LOCKED_VAL);
 }
 
-/*
- * xchg_tail - Put in the new queue tail code word & retrieve previous one
- * @lock : Pointer to queued spinlock structure
- * @tail : The new queue tail code word
- * Return: The previous queue tail code word
- *
- * xchg(lock, tail), which heads an address dependency
- *
- * p,*,* -> n,*,* ; prev = xchg(lock, node)
- */
-static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
-{
-	/*
-	 * We can use relaxed semantics since the caller ensures that the
-	 * MCS node is properly initialized before updating the tail.
-	 */
-	return (u32)xchg_relaxed(&lock->tail,
-				 tail >> _Q_TAIL_OFFSET) << _Q_TAIL_OFFSET;
-}
-
 #else /* _Q_PENDING_BITS == 8 */
 
 /**
@@ -206,6 +186,30 @@ static __always_inline void clear_pending_set_locked(struct qspinlock *lock)
 {
 	atomic_add(-_Q_PENDING_VAL + _Q_LOCKED_VAL, &lock->val);
 }
+#endif
+
+#if _Q_PENDING_BITS == 8 && !defined(CONFIG_ARCH_USE_QUEUED_SPINLOCKS_XCHG32)
+/*
+ * xchg_tail - Put in the new queue tail code word & retrieve previous one
+ * @lock : Pointer to queued spinlock structure
+ * @tail : The new queue tail code word
+ * Return: The previous queue tail code word
+ *
+ * xchg(lock, tail), which heads an address dependency
+ *
+ * p,*,* -> n,*,* ; prev = xchg(lock, node)
+ */
+static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
+{
+	/*
+	 * We can use relaxed semantics since the caller ensures that the
+	 * MCS node is properly initialized before updating the tail.
+	 */
+	return (u32)xchg_relaxed(&lock->tail,
+				 tail >> _Q_TAIL_OFFSET) << _Q_TAIL_OFFSET;
+}
+
+#else
 
 /**
  * xchg_tail - Put in the new queue tail code word & retrieve previous one
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
