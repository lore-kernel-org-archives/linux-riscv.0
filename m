Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8EDC77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 19:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tPpB0eEjRl4L4uvWaeI0a5yoN8vN6roWSwhtZxoGp0E=; b=eTwlMqtdcp07dR
	MvNyU7sc6vF014Rrj/NfaDTEln+c3SZErnJL2C8dHXX7XI6FDqHMAD4aMc20bSFxmV5oaXKbnvlmj
	znOlQ9scbQsJGk+BVMQZLv5N8/QKSUoH/u0iwC2DjpWxAvcV4uENEZZSfXECnvFKwtZn/ydm4p14u
	lPtzKaIdL1hzwRuQBeloDn5DOtpHAkH4jCQLv217Rkv8/j/dIz32BC/JPcDOa9SOGZGkouKWPZowp
	zta5EfbTkHIAvbtYM+PC/3ljReCMtTZzkG0TpSstbJzbuSyMoeWPgyz+gn52JNQGITWpLbTrb4V/Z
	brSQDgGkpxYXdOdv5Pyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVENX-0000000FYz0-0ZN1;
	Fri, 27 Jun 2025 19:04:51 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCtB-0000000FPev-00H7
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 17:29:27 +0000
Received: from dev-suse (unknown [223.72.91.169])
	by APP-01 (Coremail) with SMTP id qwCowADHeNfg1F5omh6oCQ--.1108S2;
	Sat, 28 Jun 2025 01:29:05 +0800 (CST)
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
	Yixun Lan <dlan@gentoo.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	stable@vger.kernel.org,
	Jingwei Wang <wangjingwei@iscas.ac.cn>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4] riscv: hwprobe: Fix stale vDSO data for late-initialized keys at boot
Date: Sat, 28 Jun 2025 01:27:42 +0800
Message-ID: <20250627172814.66367-1-wangjingwei@iscas.ac.cn>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CM-TRANSID: qwCowADHeNfg1F5omh6oCQ--.1108S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Gr1DAF4xZFy7tryxKFy3Jwb_yoW7Cr4kpF
	WDCrsYqFy5Jr4xWay7K3s7ZF10gas5Gr43GFsFkw15ZryxZr13J3saqrsxAr1DtrWqva40
	9F45WFWYkw42yr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-Originating-IP: [223.72.91.169]
X-CM-SenderInfo: pzdqwy5lqj4v3l6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_102925_421337_86F76766 
X-CRM114-Status: GOOD (  13.57  )
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

The value for some hwprobe keys, like MISALIGNED_VECTOR_PERF, is
determined by an asynchronous kthread. This kthread can finish after
the hwprobe vDSO data is populated, creating a race condition where
userspace can read stale values.

A completion-based framework is introduced to synchronize the async
probes with the vDSO population. The init_hwprobe_vdso_data()
function is deferred to `late_initcall` and now blocks until all
probes signal completion.

Reported-by: Tsukasa OI <research_trasio@irq.a4lg.com>
Closes: https://lore.kernel.org/linux-riscv/760d637b-b13b-4518-b6bf-883d55d44e7f@irq.a4lg.com/
Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: stable@vger.kernel.org
Signed-off-by: Jingwei Wang <wangjingwei@iscas.ac.cn>
---
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

 arch/riscv/include/asm/hwprobe.h           |  8 +++++++-
 arch/riscv/kernel/sys_hwprobe.c            | 20 +++++++++++++++++++-
 arch/riscv/kernel/unaligned_access_speed.c |  9 +++++++--
 3 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 7fe0a379474ae2c6..87af186d92e75ddb 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -40,5 +40,11 @@ static inline bool riscv_hwprobe_pair_cmp(struct riscv_hwprobe *pair,
 
 	return pair->value == other_pair->value;
 }
-
+#ifdef CONFIG_MMU
+void riscv_hwprobe_register_async_probe(void);
+void riscv_hwprobe_complete_async_probe(void);
+#else
+inline void riscv_hwprobe_register_async_probe(void) {}
+inline void riscv_hwprobe_complete_async_probe(void) {}
+#endif
 #endif
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 0b170e18a2beba57..8c50dcec2b754c30 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -5,6 +5,8 @@
  * more details.
  */
 #include <linux/syscalls.h>
+#include <linux/completion.h>
+#include <linux/atomic.h>
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
 #include <asm/hwprobe.h>
@@ -467,6 +469,20 @@ static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
 
 #ifdef CONFIG_MMU
 
+static DECLARE_COMPLETION(boot_probes_done);
+static atomic_t pending_boot_probes = ATOMIC_INIT(0);
+
+void riscv_hwprobe_register_async_probe(void)
+{
+	atomic_inc(&pending_boot_probes);
+}
+
+void riscv_hwprobe_complete_async_probe(void)
+{
+	if (atomic_dec_and_test(&pending_boot_probes))
+		complete(&boot_probes_done);
+}
+
 static int __init init_hwprobe_vdso_data(void)
 {
 	struct vdso_arch_data *avd = vdso_k_arch_data;
@@ -474,6 +490,8 @@ static int __init init_hwprobe_vdso_data(void)
 	struct riscv_hwprobe pair;
 	int key;
 
+	if (unlikely(atomic_read(&pending_boot_probes) > 0))
+		wait_for_completion(&boot_probes_done);
 	/*
 	 * Initialize vDSO data with the answers for the "all CPUs" case, to
 	 * save a syscall in the common case.
@@ -504,7 +522,7 @@ static int __init init_hwprobe_vdso_data(void)
 	return 0;
 }
 
-arch_initcall_sync(init_hwprobe_vdso_data);
+late_initcall(init_hwprobe_vdso_data);
 
 #endif /* CONFIG_MMU */
 
diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index ae2068425fbcd207..4b8ad2673b0f7470 100644
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
+				NULL, "vec_check_unaligned_access_speed_all_cpus"))) {
+			pr_warn("Failed to create vec_unalign_check kthread\n");
+			riscv_hwprobe_complete_async_probe();
+		}
 	}
 
 	/*
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
