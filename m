Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56004C001E0
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 16:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DAtXLQ+zE0t6TIGLlSd6gEsLfE12I3KVnTNys60L6Gs=; b=V734CSrl6LCYHx
	EIL+Eke6iWcnzgeJOvFs/ywZTjKN+hFyyHCp61k+B5sED2ePhCLwXFloCtPwdrG3OML8TmOf2n4YG
	BugUfN9/GUGfd/ZP4EesxJbpY0/Qd35PErfGDqmh2Bzaea0QKkRibIzc8FvLXe9rmwfW9Pn4zjllD
	1xD4JabDH0sUNOJbjWYebBAXTCoC+PdVB6PjMXzV0rzGctka5ZKhzYqAJUUyDwEcv4I7MMCUsxUqf
	ZTXZoYaKte6PWW071BhNCo+pctBo28IRlt0N0r66es+D6Zk9WiLn9kpI66pWB5BkMD7BhjBwKQIaZ
	utFEwOIKWJArHsaSzSaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRF33-005OuR-2o;
	Wed, 02 Aug 2023 16:50:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRF31-005OtA-0r
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 16:50:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B203861909;
	Wed,  2 Aug 2023 16:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB4E6C433C7;
	Wed,  2 Aug 2023 16:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690995006;
	bh=Rjshp45LQArowQ9hv/4+Aw89M657nw9ZwvAThzS+oLI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ul+JWWftqBfrSiIMM8uwIhvGf1Rd8Ct2roXkDyPWcrDpfT26ipur7QUGcgxWigjHl
	 6Js1tarsK154ZTfax8O3aqCZ9YQrRB1M1wT5D2ndbUEriWKgYHG+IFuHzq9ZsaFysj
	 l0fhDVZsGKgxwAxMlkaC2bFeATrZ7zUAEXnpbE41OMgL8vPwDyMb8HPv3hfQ6d5ObD
	 1cR7XpXxYNVOeYYdzdmHNk2zTtOuRQq8c458BUnQ79m2Er1mxQhZ19rlbtp9aKAVSH
	 iZ42oA761ZIxJhuUAVrZtunPv1ymTfGoYfo546c3CZtcTZChJ2kVRKgsvv+PyhD9L6
	 IDWH+ww3fTdqA==
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
	wuwei2016@iscas.ac.cn
Cc: linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V10 09/19] RISC-V: paravirt: pvqspinlock: Add paravirt qspinlock skeleton
Date: Wed,  2 Aug 2023 12:46:51 -0400
Message-Id: <20230802164701.192791-10-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230802164701.192791-1-guoren@kernel.org>
References: <20230802164701.192791-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_095007_395608_C19C4FF7 
X-CRM114-Status: GOOD (  18.25  )
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
 arch/riscv/include/asm/paravirt.h           | 20 +++++++++
 arch/riscv/include/asm/qspinlock.h          | 29 ++++++++++++
 arch/riscv/include/asm/qspinlock_paravirt.h |  7 +++
 arch/riscv/include/asm/spinlock.h           |  2 +-
 arch/riscv/kernel/paravirt.c                | 50 +++++++++++++++++++++
 arch/riscv/kernel/setup.c                   |  3 ++
 7 files changed, 110 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/include/asm/qspinlock.h
 create mode 100644 arch/riscv/include/asm/qspinlock_paravirt.h

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
diff --git a/arch/riscv/include/asm/paravirt.h b/arch/riscv/include/asm/paravirt.h
index 10ba3d6bae4f..ed7eebbedae8 100644
--- a/arch/riscv/include/asm/paravirt.h
+++ b/arch/riscv/include/asm/paravirt.h
@@ -26,4 +26,24 @@ int __init pv_time_init(void);
 
 #endif // CONFIG_PARAVIRT
 
+#ifdef CONFIG_PARAVIRT_SPINLOCKS
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
+#endif /* CONFIG_PARAVIRT_SPINLOCKS */
+
 #endif
diff --git a/arch/riscv/include/asm/qspinlock.h b/arch/riscv/include/asm/qspinlock.h
new file mode 100644
index 000000000000..003e9560a0d1
--- /dev/null
+++ b/arch/riscv/include/asm/qspinlock.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_QSPINLOCK_H
+#define _ASM_RISCV_QSPINLOCK_H
+
+#ifdef CONFIG_PARAVIRT_SPINLOCKS
+#include <asm/paravirt.h>
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
index 000000000000..ff52b41d8288
--- /dev/null
+++ b/arch/riscv/include/asm/qspinlock_paravirt.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_QSPINLOCK_PARAVIRT_H
+#define _ASM_RISCV_QSPINLOCK_PARAVIRT_H
+
+void __pv_queued_spin_unlock(struct qspinlock *lock);
+
+#endif /* _ASM_RISCV_QSPINLOCK_PARAVIRT_H */
diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
index 13f3e14500c0..a8ba39e5f8dd 100644
--- a/arch/riscv/include/asm/spinlock.h
+++ b/arch/riscv/include/asm/spinlock.h
@@ -39,7 +39,7 @@ static inline bool virt_spin_lock(struct qspinlock *lock)
 #undef arch_spin_trylock
 #undef arch_spin_unlock
 
-#include <asm-generic/qspinlock.h>
+#include <asm/qspinlock.h>
 #include <asm/hwcap.h>
 
 #undef arch_spin_is_locked
diff --git a/arch/riscv/kernel/paravirt.c b/arch/riscv/kernel/paravirt.c
index 35816fc10470..1bacb2cf3872 100644
--- a/arch/riscv/kernel/paravirt.c
+++ b/arch/riscv/kernel/paravirt.c
@@ -130,3 +130,53 @@ int __init pv_time_init(void)
 
 	return 0;
 }
+
+#ifdef CONFIG_PARAVIRT_SPINLOCKS
+#include <asm/qspinlock_paravirt.h>
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
+DEFINE_STATIC_CALL(pv_queued_spin_unlock, native_queued_spin_unlock);
+EXPORT_SYMBOL(__SCK__pv_queued_spin_lock_slowpath);
+EXPORT_SYMBOL(__SCK__pv_queued_spin_unlock);
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
+#endif
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index def89fd8ea55..40f5b9402562 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -329,6 +329,9 @@ void __init setup_arch(char **cmdline_p)
 
 void __init arch_cpu_finalize_init(void)
 {
+#ifdef CONFIG_PARAVIRT_SPINLOCKS
+	pv_qspinlock_init();
+#endif
 	virt_spin_lock_init();
 }
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
