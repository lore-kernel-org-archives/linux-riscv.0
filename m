Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F09CD98E1
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 03:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fBZthTkOCMAAwDEytgtsEFdL+beB95j9aFgaAvNsnlQ=; b=X+x555YSYiPygy
	tgPAOUf48g1w46p/Y3fYg2Q42tJ1LMHxgg4GOoGUxMYc10R9Wl5AIPaGWYzZ+1Bq6wWRrVOKdkERu
	peZBqCmc7FhTTQXMOra9+mmdIUBIccWIc9GuZKI19anW+riEwXNqLPXoVFDlO19qPswn9NM+L6+xy
	1HT+WEoBDeFluHiEIi3kYuFQ+EfTwDUw3v4fhVYyB2+hq43by7m2+7TFe6NKxMr73fubfyjrGZn8u
	ciY++Ta4q2ZJ4TQ5TpuLngsxHXlLxawlODnpyxerDjg3Ly7bPQYtMN9w33DQFj6kpvb8RJzT3AAXn
	/8wEmmpnXQMScVDLy7fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZh6w-0000000GYyz-47BS;
	Wed, 17 Jun 2026 03:38:42 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZh6t-0000000GYxX-1q0s
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jun 2026 03:38:41 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781667516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XtkJmwDyk/5o4uNkbOy3m1qmssNrzYfQybr8LLksOhc=;
	b=Xez1Ub1XBATOiPUPeHZQHxGYSpPnRa0zzClTrKDDVwOEh1wp3uLmgQLbd0gTyDnJzKop2Q
	1xFmVMR1A8L8Bdfn2iQGBtLIG55li/0c7H86JmlprejPthd4AbEKKsh6D/C7lBgkAxks52
	bdZufvRX1tL/OGTkU47VL1nGnZB53/wd6Tk9FEsZynFlTKwHRD8kB0BqwuVB9g5OJSNzir
	4q5w1gLdcjtTLuCp4PjN9UbXPa2IvmizotvwqEfT8pthicV9o3cBsUkadpESqO0CKRnTnT
	uW3bjuohi3DdjyUhWsLLi/iYijiYdc9hMTd/UpSSsFFap2a/0Xg4wMzZmbFfig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781667516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XtkJmwDyk/5o4uNkbOy3m1qmssNrzYfQybr8LLksOhc=;
	b=O/WLDDRGukTJkziJmRdt5QFi0RNk9deUAQvyMBn8//mT02vTO5/WDqqXS1wuH4Mdct3v8k
	RxH6TgO73dNjekDA==
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Jingwei Wang <wangjingwei@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 2/2] Revert "riscv: hwprobe: Fix stale vDSO data for late-initialized keys at boot"
Date: Wed, 17 Jun 2026 05:38:25 +0200
Message-ID: <50ca78a649faf53f8941bc94c9cf8268b3644d38.1781666867.git.namcao@linutronix.de>
In-Reply-To: <cover.1781666867.git.namcao@linutronix.de>
References: <cover.1781666867.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_203839_663991_32B1E16C 
X-CRM114-Status: GOOD (  15.07  )
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

This reverts commit 5d15d2ad36b0 ("riscv: hwprobe: Fix stale vDSO data for
late-initialized keys at boot"). The commit ensures synchronization between
the unaligned vector access speed probe kthread and vDSO data read. But now
that the kthread has been removed, this commit can be reverted.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/include/asm/hwprobe.h        |  7 ---
 arch/riscv/include/asm/vdso/arch_data.h |  6 ---
 arch/riscv/kernel/sys_hwprobe.c         | 70 +++++--------------------
 arch/riscv/kernel/vdso/hwprobe.c        |  2 +-
 4 files changed, 13 insertions(+), 72 deletions(-)

diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 8b9f5e1cf4cb..9b04377c0f98 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -43,11 +43,4 @@ static inline bool riscv_hwprobe_pair_cmp(struct riscv_hwprobe *pair,
 	return pair->value == other_pair->value;
 }
 
-#ifdef CONFIG_MMU
-void riscv_hwprobe_register_async_probe(void);
-void riscv_hwprobe_complete_async_probe(void);
-#else
-static inline void riscv_hwprobe_register_async_probe(void) {}
-static inline void riscv_hwprobe_complete_async_probe(void) {}
-#endif
 #endif
diff --git a/arch/riscv/include/asm/vdso/arch_data.h b/arch/riscv/include/asm/vdso/arch_data.h
index 88b37af55175..da57a3786f7a 100644
--- a/arch/riscv/include/asm/vdso/arch_data.h
+++ b/arch/riscv/include/asm/vdso/arch_data.h
@@ -12,12 +12,6 @@ struct vdso_arch_data {
 
 	/* Boolean indicating all CPUs have the same static hwprobe values. */
 	__u8 homogeneous_cpus;
-
-	/*
-	 * A gate to check and see if the hwprobe data is actually ready, as
-	 * probing is deferred to avoid boot slowdowns.
-	 */
-	__u8 ready;
 };
 
 #endif /* __RISCV_ASM_VDSO_ARCH_DATA_H */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 1659d31fd288..2ce162f5cf7c 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -5,9 +5,6 @@
  * more details.
  */
 #include <linux/syscalls.h>
-#include <linux/completion.h>
-#include <linux/atomic.h>
-#include <linux/once.h>
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
 #include <asm/hwprobe.h>
@@ -504,32 +501,28 @@ static int hwprobe_get_cpus(struct riscv_hwprobe __user *pairs,
 	return 0;
 }
 
-#ifdef CONFIG_MMU
-
-static DECLARE_COMPLETION(boot_probes_done);
-static atomic_t pending_boot_probes = ATOMIC_INIT(1);
-
-void riscv_hwprobe_register_async_probe(void)
+static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
+			    size_t pair_count, size_t cpusetsize,
+			    unsigned long __user *cpus_user,
+			    unsigned int flags)
 {
-	atomic_inc(&pending_boot_probes);
-}
+	if (flags & RISCV_HWPROBE_WHICH_CPUS)
+		return hwprobe_get_cpus(pairs, pair_count, cpusetsize,
+					cpus_user, flags);
 
-void riscv_hwprobe_complete_async_probe(void)
-{
-	if (atomic_dec_and_test(&pending_boot_probes))
-		complete(&boot_probes_done);
+	return hwprobe_get_values(pairs, pair_count, cpusetsize,
+				  cpus_user, flags);
 }
 
-static int complete_hwprobe_vdso_data(void)
+#ifdef CONFIG_MMU
+
+static int __init init_hwprobe_vdso_data(void)
 {
 	struct vdso_arch_data *avd = vdso_k_arch_data;
 	u64 id_bitsmash = 0;
 	struct riscv_hwprobe pair;
 	int key;
 
-	if (unlikely(!atomic_dec_and_test(&pending_boot_probes)))
-		wait_for_completion(&boot_probes_done);
-
 	/*
 	 * Initialize vDSO data with the answers for the "all CPUs" case, to
 	 * save a syscall in the common case.
@@ -557,52 +550,13 @@ static int complete_hwprobe_vdso_data(void)
 	 * vDSO should defer to the kernel for exotic cpu masks.
 	 */
 	avd->homogeneous_cpus = id_bitsmash != 0 && id_bitsmash != -1;
-
-	/*
-	 * Make sure all the VDSO values are visible before we look at them.
-	 * This pairs with the implicit "no speculativly visible accesses"
-	 * barrier in the VDSO hwprobe code.
-	 */
-	smp_wmb();
-	avd->ready = true;
-	return 0;
-}
-
-static int __init init_hwprobe_vdso_data(void)
-{
-	struct vdso_arch_data *avd = vdso_k_arch_data;
-
-	/*
-	 * Prevent the vDSO cached values from being used, as they're not ready
-	 * yet.
-	 */
-	avd->ready = false;
 	return 0;
 }
 
 arch_initcall_sync(init_hwprobe_vdso_data);
 
-#else
-
-static int complete_hwprobe_vdso_data(void) { return 0; }
-
 #endif /* CONFIG_MMU */
 
-static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
-			    size_t pair_count, size_t cpusetsize,
-			    unsigned long __user *cpus_user,
-			    unsigned int flags)
-{
-	DO_ONCE_SLEEPABLE(complete_hwprobe_vdso_data);
-
-	if (flags & RISCV_HWPROBE_WHICH_CPUS)
-		return hwprobe_get_cpus(pairs, pair_count, cpusetsize,
-					cpus_user, flags);
-
-	return hwprobe_get_values(pairs, pair_count, cpusetsize,
-				cpus_user, flags);
-}
-
 SYSCALL_DEFINE5(riscv_hwprobe, struct riscv_hwprobe __user *, pairs,
 		size_t, pair_count, size_t, cpusetsize, unsigned long __user *,
 		cpus, unsigned int, flags)
diff --git a/arch/riscv/kernel/vdso/hwprobe.c b/arch/riscv/kernel/vdso/hwprobe.c
index 8f45500d0a6e..2ddeba6c68dd 100644
--- a/arch/riscv/kernel/vdso/hwprobe.c
+++ b/arch/riscv/kernel/vdso/hwprobe.c
@@ -27,7 +27,7 @@ static int riscv_vdso_get_values(struct riscv_hwprobe *pairs, size_t pair_count,
 	 * homogeneous, then this function can handle requests for arbitrary
 	 * masks.
 	 */
-	if (flags != 0 || (!all_cpus && !avd->homogeneous_cpus) || unlikely(!avd->ready))
+	if ((flags != 0) || (!all_cpus && !avd->homogeneous_cpus))
 		return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus, flags);
 
 	/* This is something we can handle, fill out the pairs. */
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
