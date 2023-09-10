Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094D1EC8748
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Sep 2023 08:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1nbgfO+/evnRxS+uWRLE7LME5aoDtAl7fAiW6J0c61M=; b=etz63KXB9xONH6
	JiTWWCk9nKJ0bEYTyUWoMOh03mRmVIpeCp+7dtekHJo9vL2lpYv+uegdwuR8qkUdGCvipIrSgGwM1
	z7QJbiyg3CLGPZOn7wA4fUiOKzcSgpllGYMyAWWU/BLLDe8+o9OwCKtZ9bxzkyAQeM15djjNGCr2A
	M1wREglGOy5xh7EmvM+3w6eLzfMyRwiqVnzTSqrhSTgWg5nddkf8q8QbFGDd4vvkl0mD7/mlsIIF5
	zxH3IPFYBgJ1ryMYLaTeiLCfdo5z+X1PL4I1KiGCBBMn28ls35U1J4U3XTf8bUsg7F42zXM+VdbIH
	rAtm2CSnmmO7N6w+HgRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfFqk-00GI4K-2o;
	Sun, 10 Sep 2023 08:31:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfFqh-00GI1j-15
	for linux-riscv@lists.infradead.org;
	Sun, 10 Sep 2023 08:31:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 25299CE09AA;
	Sun, 10 Sep 2023 08:31:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FBB0C433C9;
	Sun, 10 Sep 2023 08:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694334674;
	bh=CGbBQmlOMiU7KGhDaeYsvrtFbv9g7V9LknoZMK3XHU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lCThd1tl2tykwK3eWiOPcnl54BI9mVFr+fDdyPCbtkpojBfLGMNDVVulF+O6+y3Pi
	 a/UIQXm6F1pkP4NTkDdtFmtqHJEsWvz5qlSRaCi2ob3CwxdJ0TPGEv5BwpjtiBYtS/
	 jXoIh671CI4UCjavdWqPK7z0oStaNzKhs2ySCztbPt71JH0S3floPylQ/ivZig0W33
	 Rdvp+sXwCArfgZs//eEHJXowarZ1IiymCnXkKcPRHZNHK7i8s41ifWjY75cn6/TtSQ
	 D+wgz/sZ9onk7/9mZcLYezW6yZUq7AhbIk6O289NricZFW75KXAEkEL37X8H+2t8iF
	 SsPZ6CdUG0yJw==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	anup@brainfault.org,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	palmer@rivosinc.com,
	longman@redhat.com,
	boqun.feng@gmail.com,
	tglx@linutronix.de,
	paulmck@kernel.org,
	rostedt@goodmis.org,
	rdunlap@infradead.org,
	catalin.marinas@arm.com,
	conor.dooley@microchip.com,
	xiaoguang.xing@sophgo.com,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	keescook@chromium.org,
	greentime.hu@sifive.com,
	ajones@ventanamicro.com,
	jszhang@kernel.org,
	wefu@redhat.com,
	wuwei2016@iscas.ac.cn,
	leobras@redhat.com
Cc: linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V11 11/17] RISC-V: paravirt: pvqspinlock: Add paravirt qspinlock skeleton
Date: Sun, 10 Sep 2023 04:29:05 -0400
Message-Id: <20230910082911.3378782-12-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230910082911.3378782-1-guoren@kernel.org>
References: <20230910082911.3378782-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_013119_736685_BCE69859 
X-CRM114-Status: GOOD (  17.18  )
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

Using static_call to switch between:
  native_queued_spin_lock_slowpath()    __pv_queued_spin_lock_slowpath()
  native_queued_spin_unlock()           __pv_queued_spin_unlock()

Finish the pv_wait implementation, but pv_kick needs the SBI
definition of the next patches.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/Kbuild               |  1 -
 arch/riscv/include/asm/qspinlock.h          | 35 +++++++++++++
 arch/riscv/include/asm/qspinlock_paravirt.h | 29 +++++++++++
 arch/riscv/include/asm/spinlock.h           |  2 +-
 arch/riscv/kernel/qspinlock_paravirt.c      | 57 +++++++++++++++++++++
 arch/riscv/kernel/setup.c                   |  4 ++
 6 files changed, 126 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/include/asm/qspinlock.h
 create mode 100644 arch/riscv/include/asm/qspinlock_paravirt.h
 create mode 100644 arch/riscv/kernel/qspinlock_paravirt.c

diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
index a0dc85e4a754..b89cb3b73c13 100644
--- a/arch/riscv/include/asm/Kbuild
+++ b/arch/riscv/include/asm/Kbuild
@@ -7,6 +7,5 @@ generic-y += parport.h
 generic-y += spinlock_types.h
 generic-y += qrwlock.h
 generic-y += qrwlock_types.h
-generic-y += qspinlock.h
 generic-y += user.h
 generic-y += vmlinux.lds.h
diff --git a/arch/riscv/include/asm/qspinlock.h b/arch/riscv/include/asm/qspinlock.h
new file mode 100644
index 000000000000..7d4f416c908c
--- /dev/null
+++ b/arch/riscv/include/asm/qspinlock.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c), 2023 Alibaba Cloud
+ * Authors:
+ *	Guo Ren <guoren@linux.alibaba.com>
+ */
+
+#ifndef _ASM_RISCV_QSPINLOCK_H
+#define _ASM_RISCV_QSPINLOCK_H
+
+#ifdef CONFIG_PARAVIRT_SPINLOCKS
+#include <asm/qspinlock_paravirt.h>
+
+/* How long a lock should spin before we consider blocking */
+#define SPIN_THRESHOLD		(1 << 15)
+
+void native_queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
+void __pv_init_lock_hash(void);
+void __pv_queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
+
+static inline void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val)
+{
+	static_call(pv_queued_spin_lock_slowpath)(lock, val);
+}
+
+#define queued_spin_unlock	queued_spin_unlock
+static inline void queued_spin_unlock(struct qspinlock *lock)
+{
+	static_call(pv_queued_spin_unlock)(lock);
+}
+#endif /* CONFIG_PARAVIRT_SPINLOCKS */
+
+#include <asm-generic/qspinlock.h>
+
+#endif /* _ASM_RISCV_QSPINLOCK_H */
diff --git a/arch/riscv/include/asm/qspinlock_paravirt.h b/arch/riscv/include/asm/qspinlock_paravirt.h
new file mode 100644
index 000000000000..9681e851f69d
--- /dev/null
+++ b/arch/riscv/include/asm/qspinlock_paravirt.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c), 2023 Alibaba Cloud
+ * Authors:
+ *	Guo Ren <guoren@linux.alibaba.com>
+ */
+
+#ifndef _ASM_RISCV_QSPINLOCK_PARAVIRT_H
+#define _ASM_RISCV_QSPINLOCK_PARAVIRT_H
+
+void pv_wait(u8 *ptr, u8 val);
+void pv_kick(int cpu);
+
+void dummy_queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
+void dummy_queued_spin_unlock(struct qspinlock *lock);
+
+DECLARE_STATIC_CALL(pv_queued_spin_lock_slowpath, dummy_queued_spin_lock_slowpath);
+DECLARE_STATIC_CALL(pv_queued_spin_unlock, dummy_queued_spin_unlock);
+
+void __init pv_qspinlock_init(void);
+
+static inline bool pv_is_native_spin_unlock(void)
+{
+	return false;
+}
+
+void __pv_queued_spin_unlock(struct qspinlock *lock);
+
+#endif /* _ASM_RISCV_QSPINLOCK_PARAVIRT_H */
diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
index 6b38d6616f14..ed4253f491fe 100644
--- a/arch/riscv/include/asm/spinlock.h
+++ b/arch/riscv/include/asm/spinlock.h
@@ -39,7 +39,7 @@ static inline bool virt_spin_lock(struct qspinlock *lock)
 #undef arch_spin_trylock
 #undef arch_spin_unlock
 
-#include <asm-generic/qspinlock.h>
+#include <asm/qspinlock.h>
 #include <linux/jump_label.h>
 
 #undef arch_spin_is_locked
diff --git a/arch/riscv/kernel/qspinlock_paravirt.c b/arch/riscv/kernel/qspinlock_paravirt.c
new file mode 100644
index 000000000000..85ff5a3ec234
--- /dev/null
+++ b/arch/riscv/kernel/qspinlock_paravirt.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c), 2023 Alibaba Cloud
+ * Authors:
+ *	Guo Ren <guoren@linux.alibaba.com>
+ */
+
+#include <linux/static_call.h>
+#include <asm/qspinlock_paravirt.h>
+#include <asm/sbi.h>
+
+void pv_kick(int cpu)
+{
+	return;
+}
+
+void pv_wait(u8 *ptr, u8 val)
+{
+	unsigned long flags;
+
+	if (in_nmi())
+		return;
+
+	local_irq_save(flags);
+	if (READ_ONCE(*ptr) != val)
+		goto out;
+
+	/* wait_for_interrupt(); */
+out:
+	local_irq_restore(flags);
+}
+
+static void native_queued_spin_unlock(struct qspinlock *lock)
+{
+	smp_store_release(&lock->locked, 0);
+}
+
+DEFINE_STATIC_CALL(pv_queued_spin_lock_slowpath, native_queued_spin_lock_slowpath);
+EXPORT_STATIC_CALL(pv_queued_spin_lock_slowpath);
+
+DEFINE_STATIC_CALL(pv_queued_spin_unlock, native_queued_spin_unlock);
+EXPORT_STATIC_CALL(pv_queued_spin_unlock);
+
+void __init pv_qspinlock_init(void)
+{
+	if (num_possible_cpus() == 1)
+		return;
+
+	if(sbi_get_firmware_id() != SBI_EXT_BASE_IMPL_ID_KVM)
+		return;
+
+	pr_info("PV qspinlocks enabled\n");
+	__pv_init_lock_hash();
+
+	static_call_update(pv_queued_spin_lock_slowpath, __pv_queued_spin_lock_slowpath);
+	static_call_update(pv_queued_spin_unlock, __pv_queued_spin_unlock);
+}
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index c57d15b05160..88690751f2ee 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -321,6 +321,10 @@ static void __init riscv_spinlock_init(void)
 #ifdef CONFIG_QUEUED_SPINLOCKS
 	virt_spin_lock_init();
 #endif
+
+#ifdef CONFIG_PARAVIRT_SPINLOCKS
+	pv_qspinlock_init();
+#endif
 }
 
 extern void __init init_rt_signal_env(void);
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
