Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747DCE77188
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Dec 2024 03:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dkAM04XwGgpzyCWY2YJ8pL1Z4zbADSWXB7WtUR6Louc=; b=VXhg1phbKkzxIH
	BFOdUt9K2JVS6jtm+GTZ4nscnFTKBtB4ca1MklRpL1EzOeHsq/kBqsxtpGJv3cYLPRa1vpn+tpXXo
	sCyThW7jCJiFrWfISaf7cjGq7fhtpZwcsFaSp7aZ5g0dItG4yaDB7qpZWIYYXXm0KX5Svpr/h6NE3
	DAIGbcvYQgA7Pk1YSwLeNoN5QYYn3wto+jQaL33FjVrraV01MAa2u7hqvJGlEh0tXFCC/nysjuxho
	XtI/h5Bc/gslx2ocjOy8sCBKX2reCZNUZvfbrxhyjO3hkTO9iqqPRJ+tGjAaEUm31rnOhlMr6D5/5
	k3jAkU5munuO42CQhmYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPCol-00000007kdd-1elh;
	Sun, 22 Dec 2024 03:39:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPCoi-00000007kcJ-1ZXZ
	for linux-riscv@lists.infradead.org;
	Sun, 22 Dec 2024 03:39:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D510D5C0501;
	Sun, 22 Dec 2024 03:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED015C4CECD;
	Sun, 22 Dec 2024 03:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734838783;
	bh=qVctlfRDKSqvGJJe7RLiJvr7L2bxxrBrfqXVwQ0w6s4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tVoxEsttpfKO04c7l90tfZedtt5O/gvzreIrjFHDMsKYik6f5RNlj6hctQpmBYGHa
	 cB0z3aAWCVbY/x48vdndxkSoM6xkE3MGWMgkTVaW528YXVxG5dq7/wxNkmTYgfDTJZ
	 lEQIDHZ5wPtt/LLqnCcPNyn0vRyi/oA48KS9h6J4N2/D6xYa1F7ruBXecFsN9R5pvg
	 ArwZXEVRPrszEfwmhFzhy6TvMiqMhTK+OKSoU+67OLku1r0L5SAp3I7W/SPgjsqHmW
	 Axg5a/VJ55IYbdmgEw87Y99kD2ibkhBNMYsrlqm0geadGY7XR9zsYMf2/1j1t+Akmr
	 Z3ezNhTrAurpQ==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	guoren@kernel.org,
	bjorn@rivosinc.com,
	conor@kernel.org,
	leobras@redhat.com,
	peterz@infradead.org,
	parri.andrea@gmail.com,
	will@kernel.org,
	longman@redhat.com,
	boqun.feng@gmail.com,
	arnd@arndb.de,
	alexghiti@rivosinc.com,
	ajones@ventanamicro.com,
	rkrcmar@ventanamicro.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 2/3] RISC-V: paravirt: Add pvqspinlock frontend
Date: Sat, 21 Dec 2024 22:39:16 -0500
Message-Id: <20241222033917.1754495-3-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241222033917.1754495-1-guoren@kernel.org>
References: <20241222033917.1754495-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_193944_517952_9AEC0911 
X-CRM114-Status: GOOD (  17.11  )
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

Add an unfair qspinlock virtualization-friendly frontend, by halting the
virtual CPU rather than spinning.

Using static_call to switch between:
  native_queued_spin_lock_slowpath()    __pv_queued_spin_lock_slowpath()
  native_queued_spin_unlock()           __pv_queued_spin_unlock()

Add the pv_wait & pv_kick implementations.

Reviewed-by: Leonardo Bras <leobras@redhat.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/Kconfig                          | 12 ++++
 arch/riscv/include/asm/Kbuild               |  1 -
 arch/riscv/include/asm/qspinlock.h          | 35 +++++++++++
 arch/riscv/include/asm/qspinlock_paravirt.h | 28 +++++++++
 arch/riscv/kernel/Makefile                  |  1 +
 arch/riscv/kernel/qspinlock_paravirt.c      | 67 +++++++++++++++++++++
 arch/riscv/kernel/setup.c                   |  4 ++
 7 files changed, 147 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/qspinlock.h
 create mode 100644 arch/riscv/include/asm/qspinlock_paravirt.h
 create mode 100644 arch/riscv/kernel/qspinlock_paravirt.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d4a7ca0388c0..e241ac39ecd6 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1071,6 +1071,18 @@ config PARAVIRT_TIME_ACCOUNTING
 
 	  If in doubt, say N here.
 
+config PARAVIRT_SPINLOCKS
+	bool "Paravirtualization layer for spinlocks"
+	depends on QUEUED_SPINLOCKS
+	default y
+	help
+	  Paravirtualized spinlocks allow a unfair qspinlock to replace the
+	  test-set kvm-guest virt spinlock implementation with something
+	  virtualization-friendly, for example, halt the virtual CPU rather
+	  than spinning.
+
+	  If you are unsure how to answer this question, answer Y.
+
 config RELOCATABLE
 	bool "Build a relocatable kernel"
 	depends on MMU && 64BIT && !XIP_KERNEL
diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
index de13d5a234f8..c726330d2b9f 100644
--- a/arch/riscv/include/asm/Kbuild
+++ b/arch/riscv/include/asm/Kbuild
@@ -12,6 +12,5 @@ generic-y += spinlock_types.h
 generic-y += ticket_spinlock.h
 generic-y += qrwlock.h
 generic-y += qrwlock_types.h
-generic-y += qspinlock.h
 generic-y += user.h
 generic-y += vmlinux.lds.h
diff --git a/arch/riscv/include/asm/qspinlock.h b/arch/riscv/include/asm/qspinlock.h
new file mode 100644
index 000000000000..1d9f32334ff1
--- /dev/null
+++ b/arch/riscv/include/asm/qspinlock.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c), 2024 Alibaba
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
index 000000000000..a365203dd782
--- /dev/null
+++ b/arch/riscv/include/asm/qspinlock_paravirt.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c), 2024 Alibaba Cloud
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
+void __pv_queued_spin_unlock_slowpath(struct qspinlock *lock, u8 locked);
+
+bool pv_is_native_spin_unlock(void);
+
+void __pv_queued_spin_unlock(struct qspinlock *lock);
+
+#endif /* _ASM_RISCV_QSPINLOCK_PARAVIRT_H */
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 063d1faf5a53..79f823e0e57d 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -123,3 +123,4 @@ obj-$(CONFIG_COMPAT)		+= compat_vdso/
 obj-$(CONFIG_64BIT)		+= pi/
 obj-$(CONFIG_ACPI)		+= acpi.o
 obj-$(CONFIG_ACPI_NUMA)	+= acpi_numa.o
+obj-$(CONFIG_PARAVIRT_SPINLOCKS) += qspinlock_paravirt.o
diff --git a/arch/riscv/kernel/qspinlock_paravirt.c b/arch/riscv/kernel/qspinlock_paravirt.c
new file mode 100644
index 000000000000..4ec4765f57f3
--- /dev/null
+++ b/arch/riscv/kernel/qspinlock_paravirt.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c), 2024 Alibaba Cloud
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
+	sbi_ecall(SBI_EXT_PVLOCK, SBI_EXT_PVLOCK_KICK_CPU,
+		  cpuid_to_hartid_map(cpu), 0, 0, 0, 0, 0);
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
+	wait_for_interrupt();
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
+	if (!sbi_probe_extension(SBI_EXT_PVLOCK))
+		return;
+
+	pr_info("PV qspinlocks enabled\n");
+	__pv_init_lock_hash();
+
+	static_call_update(pv_queued_spin_lock_slowpath, __pv_queued_spin_lock_slowpath);
+	static_call_update(pv_queued_spin_unlock, __pv_queued_spin_unlock);
+}
+
+bool pv_is_native_spin_unlock(void)
+{
+	if (static_call_query(pv_queued_spin_unlock) == native_queued_spin_unlock)
+		return true;
+	else
+		return false;
+}
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 45010e71df86..8b51ff5c7300 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -278,6 +278,10 @@ static void __init riscv_spinlock_init(void)
 		pr_err("Queued spinlock without Zabha or Ziccrse");
 	else
 		pr_info("Queued spinlock %s: enabled\n", using_ext);
+
+#ifdef CONFIG_PARAVIRT_SPINLOCKS
+	pv_qspinlock_init();
+#endif
 }
 
 extern void __init init_rt_signal_env(void);
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
