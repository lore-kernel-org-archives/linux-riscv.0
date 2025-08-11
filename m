Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85580CA0ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 16:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZSaB6ZHYcbWO8lVAWeS8uLgYZi+De7Llh/eiWJMpn4Y=; b=dZOMqpdD+IdCD9
	xtdXUWDwvcrA7PkEel4E3tTbMDb30iDgASbIWas1Bp5kFZWYcUEpdYxlzzrqi6GR1t4d62HXhn+v6
	bSWXl3U1O4GoIHQEqrRanQYPbJNAWwhG6O1boK7VHvQHs+P6hzATHzyd0dQTC5Rz/z+VUAyoNNmbM
	CypMOWnlpJLeyKYAr6N76sUJ6UGuLY0rFGby64V+yCUjpBsNur+KzG8XF5skTRNDExNNira9hChkk
	GibSKMVce2YyI3mzKuNwjg3FzjaWiphdvkx67zTvT0Ck50BUQBPGmFXaIGaIepbDeXNQp6k8x9Lkh
	cv7B7P3HOMjJp6bJ6+uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulVVm-00000008Qf7-2Wwj;
	Mon, 11 Aug 2025 16:36:38 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulTPY-000000080rn-27U8
	for linux-riscv@lists.infradead.org;
	Mon, 11 Aug 2025 14:22:07 +0000
Received: from dev-suse (unknown [210.73.43.2])
	by APP-05 (Coremail) with SMTP id zQCowAD3ilt5_JloVGvrCg--.50264S2;
	Mon, 11 Aug 2025 22:21:46 +0800 (CST)
From: Jingwei Wang <wangjingwei@iscas.ac.cn>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Olof Johansson <olof@lixom.net>,
	Yixun Lan <dlan@gentoo.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	stable@vger.kernel.org,
	Jingwei Wang <wangjingwei@iscas.ac.cn>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v8] riscv: hwprobe: Fix stale vDSO data for late-initialized keys at boot
Date: Mon, 11 Aug 2025 22:20:06 +0800
Message-ID: <20250811142035.105820-1-wangjingwei@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowAD3ilt5_JloVGvrCg--.50264S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Kr17Wr1ktw4DGFWrAF45trb_yoWDXw4rpF
	Wqkrs5XFZ5JryxCaykKw1kZF10g3Z5Gw13tF4DKry5Zr47Jr13A3sagrsxAr4qyrWv93W0
	vFs0gFWak39rAr7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9C14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r4a6rW5MxkIecxEwVAFwVW5XwCF04k20xvY0x0EwIxGrw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRFkskUUUUU=
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: pzdqwy5lqj4v3l6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_072204_911057_FB8AEA0E 
X-CRM114-Status: GOOD (  26.58  )
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

The hwprobe vDSO data for some keys, like MISALIGNED_VECTOR_PERF,
is determined by an asynchronous kthread. This can create a race
condition where the kthread finishes after the vDSO data has
already been populated, causing userspace to read stale values.

To fix this race, a new 'ready' flag is added to the vDSO data,
initialized to 'false' during arch_initcall_sync. This flag is
checked by both the vDSO's user-space code and the riscv_hwprobe
syscall. The syscall serves as a one-time gate, using a completion
to wait for any pending probes before populating the data and
setting the flag to 'true', thus ensuring userspace reads fresh
values on its first request.

Reported-by: Tsukasa OI <research_trasio@irq.a4lg.com>
Closes: https://lore.kernel.org/linux-riscv/760d637b-b13b-4518-b6bf-883d55d44e7f@irq.a4lg.com/
Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Olof Johansson <olof@lixom.net>
Cc: stable@vger.kernel.org
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Co-developed-by: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Jingwei Wang <wangjingwei@iscas.ac.cn>
---
Changes in v8:
	- Based on feedback from Alexandre, reverted the initcall back to
	  arch_initcall_sync since the DO_ONCE logic makes a late init redundant.
	- Added the required Reviewed-by and Signed-off-by tags and fixed minor 
	  formatting nits.

Changes in v7:
	- Refined the on-demand synchronization by using the DO_ONCE_SLEEPABLE
	  macro.
	- Fixed a build error for nommu configs and addressed several coding
	  style issues reported by the CI.

Changes in v6:
	- Based on Palmer's feedback, reworked the synchronization to be on-demand,
	  deferring the wait until the first hwprobe syscall via a 'ready' flag.
	  This avoids the boot-time regression from v5's approach.

Changes in v5:
	- Reworked the synchronization logic to a robust "sentinel-count"
	  pattern based on feedback from Alexandre.
	- Fixed a "multiple definition" linker error for nommu builds by changing
	  the header-file stub functions to `static inline`, as pointed out by Olof.
	- Updated the commit message to better explain the rationale for moving
	  the vDSO initialization to `late_initcall`.

Changes in v4:
	- Reworked the synchronization mechanism based on feedback from Palmer
	  and Alexandre.
	- Instead of a post-hoc refresh, this version introduces a robust
	  completion-based framework using an atomic counter to ensure async
	  probes are finished before populating the vDSO.
	- Moved the vdso data initialization to a late_initcall to avoid
	  impacting boot time.

Changes in v3:
	- Retained existing blank line.

Changes in v2:
	- Addressed feedback from Yixun's regarding #ifdef CONFIG_MMU usage.
	- Updated commit message to provide a high-level summary.
	- Added Fixes tag for commit e7c9d66e313b.

v1: https://lore.kernel.org/linux-riscv/20250521052754.185231-1-wangjingwei@iscas.ac.cn/T/#u

 arch/riscv/include/asm/hwprobe.h           |  7 +++
 arch/riscv/include/asm/vdso/arch_data.h    |  6 ++
 arch/riscv/kernel/sys_hwprobe.c            | 70 ++++++++++++++++++----
 arch/riscv/kernel/unaligned_access_speed.c |  9 ++-
 arch/riscv/kernel/vdso/hwprobe.c           |  2 +-
 5 files changed, 79 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 7fe0a379474ae2c6..5fe10724d307dc99 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -41,4 +41,11 @@ static inline bool riscv_hwprobe_pair_cmp(struct riscv_hwprobe *pair,
 	return pair->value == other_pair->value;
 }
 
+#ifdef CONFIG_MMU
+void riscv_hwprobe_register_async_probe(void);
+void riscv_hwprobe_complete_async_probe(void);
+#else
+static inline void riscv_hwprobe_register_async_probe(void) {}
+static inline void riscv_hwprobe_complete_async_probe(void) {}
+#endif
 #endif
diff --git a/arch/riscv/include/asm/vdso/arch_data.h b/arch/riscv/include/asm/vdso/arch_data.h
index da57a3786f7a53c8..88b37af55175129b 100644
--- a/arch/riscv/include/asm/vdso/arch_data.h
+++ b/arch/riscv/include/asm/vdso/arch_data.h
@@ -12,6 +12,12 @@ struct vdso_arch_data {
 
 	/* Boolean indicating all CPUs have the same static hwprobe values. */
 	__u8 homogeneous_cpus;
+
+	/*
+	 * A gate to check and see if the hwprobe data is actually ready, as
+	 * probing is deferred to avoid boot slowdowns.
+	 */
+	__u8 ready;
 };
 
 #endif /* __RISCV_ASM_VDSO_ARCH_DATA_H */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 0b170e18a2beba57..44201160b9c43177 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -5,6 +5,9 @@
  * more details.
  */
 #include <linux/syscalls.h>
+#include <linux/completion.h>
+#include <linux/atomic.h>
+#include <linux/once.h>
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
 #include <asm/hwprobe.h>
@@ -452,28 +455,32 @@ static int hwprobe_get_cpus(struct riscv_hwprobe __user *pairs,
 	return 0;
 }
 
-static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
-			    size_t pair_count, size_t cpusetsize,
-			    unsigned long __user *cpus_user,
-			    unsigned int flags)
-{
-	if (flags & RISCV_HWPROBE_WHICH_CPUS)
-		return hwprobe_get_cpus(pairs, pair_count, cpusetsize,
-					cpus_user, flags);
+#ifdef CONFIG_MMU
 
-	return hwprobe_get_values(pairs, pair_count, cpusetsize,
-				  cpus_user, flags);
+static DECLARE_COMPLETION(boot_probes_done);
+static atomic_t pending_boot_probes = ATOMIC_INIT(1);
+
+void riscv_hwprobe_register_async_probe(void)
+{
+	atomic_inc(&pending_boot_probes);
 }
 
-#ifdef CONFIG_MMU
+void riscv_hwprobe_complete_async_probe(void)
+{
+	if (atomic_dec_and_test(&pending_boot_probes))
+		complete(&boot_probes_done);
+}
 
-static int __init init_hwprobe_vdso_data(void)
+static int complete_hwprobe_vdso_data(void)
 {
 	struct vdso_arch_data *avd = vdso_k_arch_data;
 	u64 id_bitsmash = 0;
 	struct riscv_hwprobe pair;
 	int key;
 
+	if (unlikely(!atomic_dec_and_test(&pending_boot_probes)))
+		wait_for_completion(&boot_probes_done);
+
 	/*
 	 * Initialize vDSO data with the answers for the "all CPUs" case, to
 	 * save a syscall in the common case.
@@ -501,13 +508,52 @@ static int __init init_hwprobe_vdso_data(void)
 	 * vDSO should defer to the kernel for exotic cpu masks.
 	 */
 	avd->homogeneous_cpus = id_bitsmash != 0 && id_bitsmash != -1;
+
+	/*
+	 * Make sure all the VDSO values are visible before we look at them.
+	 * This pairs with the implicit "no speculativly visible accesses"
+	 * barrier in the VDSO hwprobe code.
+	 */
+	smp_wmb();
+	avd->ready = true;
+	return 0;
+}
+
+static int __init init_hwprobe_vdso_data(void)
+{
+	struct vdso_arch_data *avd = vdso_k_arch_data;
+
+	/*
+	 * Prevent the vDSO cached values from being used, as they're not ready
+	 * yet.
+	 */
+	avd->ready = false;
 	return 0;
 }
 
 arch_initcall_sync(init_hwprobe_vdso_data);
 
+#else
+
+static int complete_hwprobe_vdso_data(void) { return 0; }
+
 #endif /* CONFIG_MMU */
 
+static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
+			    size_t pair_count, size_t cpusetsize,
+			    unsigned long __user *cpus_user,
+			    unsigned int flags)
+{
+	DO_ONCE_SLEEPABLE(complete_hwprobe_vdso_data);
+
+	if (flags & RISCV_HWPROBE_WHICH_CPUS)
+		return hwprobe_get_cpus(pairs, pair_count, cpusetsize,
+					cpus_user, flags);
+
+	return hwprobe_get_values(pairs, pair_count, cpusetsize,
+				cpus_user, flags);
+}
+
 SYSCALL_DEFINE5(riscv_hwprobe, struct riscv_hwprobe __user *, pairs,
 		size_t, pair_count, size_t, cpusetsize, unsigned long __user *,
 		cpus, unsigned int, flags)
diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index ae2068425fbcd207..aa912c62fb70ba0e 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -379,6 +379,7 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
 static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
 {
 	schedule_on_each_cpu(check_vector_unaligned_access);
+	riscv_hwprobe_complete_async_probe();
 
 	return 0;
 }
@@ -473,8 +474,12 @@ static int __init check_unaligned_access_all_cpus(void)
 			per_cpu(vector_misaligned_access, cpu) = unaligned_vector_speed_param;
 	} else if (!check_vector_unaligned_access_emulated_all_cpus() &&
 		   IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
-		kthread_run(vec_check_unaligned_access_speed_all_cpus,
-			    NULL, "vec_check_unaligned_access_speed_all_cpus");
+		riscv_hwprobe_register_async_probe();
+		if (IS_ERR(kthread_run(vec_check_unaligned_access_speed_all_cpus,
+			   NULL, "vec_check_unaligned_access_speed_all_cpus"))) {
+			pr_warn("Failed to create vec_unalign_check kthread\n");
+			riscv_hwprobe_complete_async_probe();
+		}
 	}
 
 	/*
diff --git a/arch/riscv/kernel/vdso/hwprobe.c b/arch/riscv/kernel/vdso/hwprobe.c
index 2ddeba6c68dda09b..bf77b4c1d2d8e803 100644
--- a/arch/riscv/kernel/vdso/hwprobe.c
+++ b/arch/riscv/kernel/vdso/hwprobe.c
@@ -27,7 +27,7 @@ static int riscv_vdso_get_values(struct riscv_hwprobe *pairs, size_t pair_count,
 	 * homogeneous, then this function can handle requests for arbitrary
 	 * masks.
 	 */
-	if ((flags != 0) || (!all_cpus && !avd->homogeneous_cpus))
+	if ((flags != 0) || (!all_cpus && !avd->homogeneous_cpus) || unlikely(!avd->ready))
 		return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus, flags);
 
 	/* This is something we can handle, fill out the pairs. */
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
