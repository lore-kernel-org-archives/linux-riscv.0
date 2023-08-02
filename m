Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3030EC07E8B
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 16:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RC16LJQk4k86+C+waFPN6Yle2a9NmOMrVM9FyLlcCH0=; b=B5XMTyppvKDyRQ
	LHnM8gM4T3FdwA7oe1k9kHPG/XADF688A2lz9Ptjrt2i3SfBptCwqvQwGIyiUbXk2QmQ2EjA4/3Pq
	/CQLSBMeDnUpIuxVhANgy7r+0jHh745YoG13y1E6W52tn+kx4sHfj839xPlBiM3TWE4Jf9EPLQgGg
	6NhTFYEwsRs2l+x2d+0970fpIavGI1w5++ihKGkfhkvNgql5Y3/YJaQVw1Lg+IB/YR60rMu8On2lw
	m9SS13nG61PwtO/AeMvtZHfZLs41SIVE/bY+bqeQ9w4ZhUCIgDNADAZqoixasa+awqA00H4X5qYDX
	PaNoH9e/Mjpw7Ns5VMww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRF2n-005Oo9-2j;
	Wed, 02 Aug 2023 16:49:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRF2l-005Omw-04
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 16:49:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7E87561908;
	Wed,  2 Aug 2023 16:49:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD4FC433C7;
	Wed,  2 Aug 2023 16:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690994989;
	bh=go9pWbNchcwuDXo4BS51ZWl4krGce3v8bmUXX/P16DY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ofclQu8EDW9/sQM3zWUZMd80r7/7jjuHKIkp5Xzt/QQSpSCh0MFzNl3O0AkzPYFbA
	 CU7pEG3Y0/TkvfISPDhwLJObQpG8OKd0+HnLknFYXFXsHWzYY7pXQuE3Fe1rYYh+Cq
	 LOK0Bja1ObZMnukpwha/6gTzBcjXQTY5c3LcEBwxpARTkW1XuXkSPxZsC0pel8JJMF
	 LXH0MOaABlGD8CRWGilKgijG32MJSknHiH2r+OxsDc3lURtiVKPUuphTRApY4Whiek
	 epVJKAMIEXHV3dGVCeKI8LdBM+CaGH561XWJeLRx5hudDOxwnMkz9Sy2RK+Pj4Qtd1
	 c+rDQ+OUloG6A==
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
Subject: [PATCH V10 08/19] riscv: qspinlock: Use new static key for controlling call of virt_spin_lock()
Date: Wed,  2 Aug 2023 12:46:50 -0400
Message-Id: <20230802164701.192791-9-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230802164701.192791-1-guoren@kernel.org>
References: <20230802164701.192791-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_094951_145810_285AEE1D 
X-CRM114-Status: GOOD (  17.39  )
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

Add a static key controlling whether virt_spin_lock() should be
called or not. When running on bare metal set the new key to
false.

The KVM guests fall back to a Test-and-Set spinlock, because fair
locks have horrible lock 'holder' preemption issues. The
virt_spin_lock_key would shortcut for the
queued_spin_lock_slowpath() function that allow virt_spin_lock to
hijack it.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/Kconfig                |  1 +
 arch/riscv/include/asm/sbi.h      |  8 ++++++++
 arch/riscv/include/asm/spinlock.h | 22 ++++++++++++++++++++++
 arch/riscv/kernel/cpufeature.c    |  4 +++-
 arch/riscv/kernel/sbi.c           |  2 +-
 arch/riscv/kernel/setup.c         | 19 +++++++++++++++++++
 6 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 119e774a3dcf..42ae45c42b4d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -20,6 +20,7 @@ config RISCV
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_BINFMT_FLAT
 	select ARCH_HAS_CURRENT_STACK_POINTER
+	select ARCH_HAS_CPU_FINALIZE_INIT
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEBUG_WX
diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index e1523c8624cc..b7ced34b79a3 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -51,6 +51,13 @@ enum sbi_ext_base_fid {
 	SBI_EXT_BASE_GET_MIMPID,
 };
 
+enum sbi_ext_base_impl_id {
+	SBI_EXT_BASE_IMPL_ID_BBL = 0,
+	SBI_EXT_BASE_IMPL_ID_OPENSBI,
+	SBI_EXT_BASE_IMPL_ID_XVISOR,
+	SBI_EXT_BASE_IMPL_ID_KVM,
+};
+
 enum sbi_ext_time_fid {
 	SBI_EXT_TIME_SET_TIMER = 0,
 };
@@ -286,6 +293,7 @@ int sbi_console_getchar(void);
 long sbi_get_mvendorid(void);
 long sbi_get_marchid(void);
 long sbi_get_mimpid(void);
+long sbi_get_firmware_id(void);
 void sbi_set_timer(uint64_t stime_value);
 void sbi_shutdown(void);
 void sbi_send_ipi(unsigned int cpu);
diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
index 9eb3ad31e564..13f3e14500c0 100644
--- a/arch/riscv/include/asm/spinlock.h
+++ b/arch/riscv/include/asm/spinlock.h
@@ -4,6 +4,28 @@
 #define __ASM_RISCV_SPINLOCK_H
 
 #ifdef CONFIG_QUEUED_SPINLOCKS
+/*
+ * The KVM guests fall back to a Test-and-Set spinlock, because fair locks
+ * have horrible lock 'holder' preemption issues. The virt_spin_lock_key
+ * would shortcut for the queued_spin_lock_slowpath() function that allow
+ * virt_spin_lock to hijack it.
+ */
+DECLARE_STATIC_KEY_TRUE(virt_spin_lock_key);
+
+#define virt_spin_lock virt_spin_lock
+static inline bool virt_spin_lock(struct qspinlock *lock)
+{
+	if (!static_branch_likely(&virt_spin_lock_key))
+		return false;
+
+	do {
+		while (atomic_read(&lock->val) != 0)
+			cpu_relax();
+	} while (atomic_cmpxchg(&lock->val, 0, _Q_LOCKED_VAL) != 0);
+
+	return true;
+}
+
 #define _Q_PENDING_LOOPS	(1 << 9)
 #endif
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index d9694fe40a9a..26826aa590e9 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -21,6 +21,7 @@
 #include <asm/hwcap.h>
 #include <asm/patch.h>
 #include <asm/processor.h>
+#include <asm/sbi.h>
 #include <asm/vector.h>
 
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
@@ -343,7 +344,8 @@ void __init riscv_fill_hwcap(void)
 		 * ticket_spinlock, but can not be vice.
 		 */
 		if (!force_qspinlock &&
-		    !riscv_has_errata_thead_qspinlock()) {
+		    !riscv_has_errata_thead_qspinlock() &&
+		    (sbi_get_firmware_id() != SBI_EXT_BASE_IMPL_ID_KVM)) {
 			set_bit(RISCV_ISA_EXT_XTICKETLOCK, isainfo->isa);
 		}
 #endif
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index c672c8ba9a2a..398b768a02e6 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -555,7 +555,7 @@ static inline long sbi_get_spec_version(void)
 	return __sbi_base_ecall(SBI_EXT_BASE_GET_SPEC_VERSION);
 }
 
-static inline long sbi_get_firmware_id(void)
+long sbi_get_firmware_id(void)
 {
 	return __sbi_base_ecall(SBI_EXT_BASE_GET_IMP_ID);
 }
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 971fe776e2f8..def89fd8ea55 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -26,6 +26,7 @@
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
 #include <asm/cpu_ops.h>
+#include <asm/cpufeature.h>
 #include <asm/early_ioremap.h>
 #include <asm/pgtable.h>
 #include <asm/setup.h>
@@ -264,6 +265,19 @@ static void __init parse_dtb(void)
 #endif
 }
 
+#ifdef CONFIG_QUEUED_SPINLOCKS
+DEFINE_STATIC_KEY_TRUE(virt_spin_lock_key);
+
+static void __init virt_spin_lock_init(void)
+{
+	if (sbi_get_firmware_id() != SBI_EXT_BASE_IMPL_ID_KVM ||
+	    force_qspinlock)
+		static_branch_disable(&virt_spin_lock_key);
+}
+#else
+static void __init virt_spin_lock_init(void) {}
+#endif
+
 extern void __init init_rt_signal_env(void);
 
 void __init setup_arch(char **cmdline_p)
@@ -313,6 +327,11 @@ void __init setup_arch(char **cmdline_p)
 		riscv_noncoherent_supported();
 }
 
+void __init arch_cpu_finalize_init(void)
+{
+	virt_spin_lock_init();
+}
+
 static int __init topology_init(void)
 {
 	int i, ret;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
