Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED817E7718E
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Dec 2024 01:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x7P8m88r/gVtIAjpZiTyzNKqv+1HMuWdfyH0tBoeYBc=; b=EQLsKG9WVvBtB4
	t8+lX1n9meSlOJ/lt5ondCiIy0CfgDQS3BSlGluhwrHgHTSBKg12XJzAqYNcD3puwoTqYP0yGRw+O
	+2VbeIlEpkI8QCi5wrnt2+4Dc9Cn/EF6vek9umPFeZgNMVJAsSkJJ/7XgH7PACpZ2Jt8yhrdhxlv5
	DMTQzighT+XvOPSSfzb6Dwp5WC9M8epLbky7gVV1aW8HvXibBmh+W2afqqItgeKdM8HafPDOsaZlb
	u+sICVx+A2+EWP31vGycsSGogkV3qFYgHOtZ4U7u++08po3yUalYryI4oFo4PFFTFksHbyx3L6yHn
	MPqGXwO8nh3iALCnEY6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQysL-0000000GnHG-0edQ;
	Fri, 27 Dec 2024 01:10:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQysI-0000000GnFj-02wi
	for linux-riscv@lists.infradead.org;
	Fri, 27 Dec 2024 01:10:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DCB7C5C61CA;
	Fri, 27 Dec 2024 01:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2151C4CED2;
	Fri, 27 Dec 2024 01:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735261845;
	bh=XOA/Re8WRsJ7cF2WRPugYycBZj0hSQujANYi66LdgLQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NdTt6y5RCVO++5gWi8KHzzlOpAIlcEaEj0Jzgu2ON69gToMIcfmesBHErEP5cuae1
	 MEvqF5H+NUiL09MTiF8sgYXzJ+Jnvn+TewnduBTwNGYO48P6REw9nf75jfojJIbOZQ
	 x2t6u2aIbSyG2gDBxZwo7IIK1wv1xntnC+H9rCrcO2phVFeEpcueyThUHlikTQ/RXL
	 eoI6uwqwvShLc3gbM/VrG4YDsrBMf+7pUEt8FB+Aw8f9LXqpeR4SadHqfNDPJsutrr
	 bx+Z6Ewmiak4dvKcWGdFjS/W7xQYPDfpNgPiGpwYmX7uwyCufrYnQodYRSc83ZwDYe
	 HgHURpmhFRS/g==
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
	rkrcmar@ventanamicro.com,
	atishp@rivosinc.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH V2 4/4] RISC-V: paravirt: Enable virt_spin_lock() when disable PARAVIRT_SPINLOCKS
Date: Thu, 26 Dec 2024 20:10:11 -0500
Message-Id: <20241227011011.2331381-5-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241227011011.2331381-1-guoren@kernel.org>
References: <20241227011011.2331381-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_171046_141528_FFF16F7F 
X-CRM114-Status: GOOD (  14.71  )
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

The VM guests should fall back to a Test-and-Set spinlock when
PARAVIRT_SPINLOCKS disabled, because fair locks have horrible lock
'holder' preemption issues. The virt_spin_lock_key would shortcut for
the queued_spin_lock_- slowpath() function that allow virt_spin_lock
to hijack it. ref: 43b3f02899f7 ("locking/qspinlock/x86: Fix
performance regression under unaccelerated VMs").

Add a static key controlling whether virt_spin_lock() should be
called or not. Add nopvspin support as x86.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 .../admin-guide/kernel-parameters.txt         |  2 +-
 arch/riscv/include/asm/qspinlock.h            | 24 +++++++++++++++
 arch/riscv/include/asm/sbi.h                  | 16 ++++++++++
 arch/riscv/kernel/qspinlock_paravirt.c        |  3 ++
 arch/riscv/kernel/sbi.c                       |  2 +-
 arch/riscv/kernel/setup.c                     | 29 +++++++++++++++++++
 6 files changed, 74 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 3872bc6ec49d..541202ff0f36 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4048,7 +4048,7 @@
 			as generic guest with no PV drivers. Currently support
 			XEN HVM, KVM, HYPER_V and VMWARE guest.
 
-	nopvspin	[X86,XEN,KVM,EARLY]
+	nopvspin	[X86,RISCV,XEN,KVM,EARLY]
 			Disables the qspinlock slow path using PV optimizations
 			which allow the hypervisor to 'idle' the guest on lock
 			contention.
diff --git a/arch/riscv/include/asm/qspinlock.h b/arch/riscv/include/asm/qspinlock.h
index 1d9f32334ff1..4a62dcb43617 100644
--- a/arch/riscv/include/asm/qspinlock.h
+++ b/arch/riscv/include/asm/qspinlock.h
@@ -14,6 +14,8 @@
 /* How long a lock should spin before we consider blocking */
 #define SPIN_THRESHOLD		(1 << 15)
 
+extern bool nopvspin;
+
 void native_queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
 void __pv_init_lock_hash(void);
 void __pv_queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
@@ -31,5 +33,27 @@ static inline void queued_spin_unlock(struct qspinlock *lock)
 #endif /* CONFIG_PARAVIRT_SPINLOCKS */
 
 #include <asm-generic/qspinlock.h>
+#include <asm/jump_label.h>
+
+/*
+ * The KVM guests fall back to a Test-and-Set spinlock, because fair locks
+ * have horrible lock 'holder' preemption issues. The test_and_set_spinlock_key
+ * would shortcut for the queued_spin_lock_slowpath() function that allow
+ * virt_spin_lock to hijack it.
+ */
+DECLARE_STATIC_KEY_FALSE(test_and_set_spinlock_key);
+
+#define virt_spin_lock test_and_set_spinlock
+static inline bool test_and_set_spinlock(struct qspinlock *lock)
+{
+	if (!static_branch_likely(&test_and_set_spinlock_key))
+		return false;
+
+	do {
+		smp_cond_load_relaxed((s32 *)&lock->val, VAL == 0);
+	} while (atomic_cmpxchg(&lock->val, 0, _Q_LOCKED_VAL) != 0);
+
+	return true;
+}
 
 #endif /* _ASM_RISCV_QSPINLOCK_H */
diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 03e719f076ad..13669c29ead3 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -56,6 +56,21 @@ enum sbi_ext_base_fid {
 	SBI_EXT_BASE_GET_MIMPID,
 };
 
+enum sbi_ext_base_impl_id {
+	SBI_EXT_BASE_IMPL_ID_BBL = 0,
+	SBI_EXT_BASE_IMPL_ID_OPENSBI,
+	SBI_EXT_BASE_IMPL_ID_XVISOR,
+	SBI_EXT_BASE_IMPL_ID_KVM,
+	SBI_EXT_BASE_IMPL_ID_RUSTSBI,
+	SBI_EXT_BASE_IMPL_ID_DIOSIX,
+	SBI_EXT_BASE_IMPL_ID_COFFER,
+	SBI_EXT_BASE_IMPL_ID_XEN,
+	SBI_EXT_BASE_IMPL_ID_POLARFIRE,
+	SBI_EXT_BASE_IMPL_ID_COREBOOT,
+	SBI_EXT_BASE_IMPL_ID_OREBOOT,
+	SBI_EXT_BASE_IMPL_ID_BHYVE,
+};
+
 enum sbi_ext_time_fid {
 	SBI_EXT_TIME_SET_TIMER = 0,
 };
@@ -449,6 +464,7 @@ static inline int sbi_console_getchar(void) { return -ENOENT; }
 long sbi_get_mvendorid(void);
 long sbi_get_marchid(void);
 long sbi_get_mimpid(void);
+long sbi_get_firmware_id(void);
 void sbi_set_timer(uint64_t stime_value);
 void sbi_shutdown(void);
 void sbi_send_ipi(unsigned int cpu);
diff --git a/arch/riscv/kernel/qspinlock_paravirt.c b/arch/riscv/kernel/qspinlock_paravirt.c
index 781ed2190334..0f2e50754689 100644
--- a/arch/riscv/kernel/qspinlock_paravirt.c
+++ b/arch/riscv/kernel/qspinlock_paravirt.c
@@ -58,6 +58,9 @@ void __init pv_qspinlock_init(void)
 	if (!sbi_probe_extension(SBI_EXT_PVLOCK))
 		return;
 
+	if (nopvspin)
+		return;
+
 	pr_info("PV qspinlocks enabled\n");
 	__pv_init_lock_hash();
 
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 1989b8cade1b..2cbacc345e5d 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -488,7 +488,7 @@ static inline long sbi_get_spec_version(void)
 	return __sbi_base_ecall(SBI_EXT_BASE_GET_SPEC_VERSION);
 }
 
-static inline long sbi_get_firmware_id(void)
+long sbi_get_firmware_id(void)
 {
 	return __sbi_base_ecall(SBI_EXT_BASE_GET_IMP_ID);
 }
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 8b51ff5c7300..bb76133e684f 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -249,6 +249,32 @@ DEFINE_STATIC_KEY_TRUE(qspinlock_key);
 EXPORT_SYMBOL(qspinlock_key);
 #endif
 
+#ifdef CONFIG_QUEUED_SPINLOCKS
+DEFINE_STATIC_KEY_FALSE(test_and_set_spinlock_key);
+
+static bool __init virt_spin_lock_init(void)
+{
+	if (sbi_get_firmware_id() == SBI_EXT_BASE_IMPL_ID_KVM &&
+	    !IS_ENABLED(CONFIG_PARAVIRT_SPINLOCKS))
+		goto out;
+
+#ifdef CONFIG_PARAVIRT_SPINLOCKS
+	if (sbi_probe_extension(SBI_EXT_PVLOCK) && nopvspin)
+		goto out;
+#endif
+
+	return false;
+out:
+	static_branch_enable(&test_and_set_spinlock_key);
+	return true;
+}
+#else
+static bool __init virt_spin_lock_init(void)
+{
+	return false;
+}
+#endif
+
 static void __init riscv_spinlock_init(void)
 {
 	char *using_ext = NULL;
@@ -274,6 +300,9 @@ static void __init riscv_spinlock_init(void)
 	}
 #endif
 
+	if (virt_spin_lock_init())
+		using_ext = "using test and set";
+
 	if (!using_ext)
 		pr_err("Queued spinlock without Zabha or Ziccrse");
 	else
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
