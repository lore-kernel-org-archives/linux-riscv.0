Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E03FC54E71
	for <linux-riscv@archiver.kernel.org>; Wed, 21 May 2025 05:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nw8M0Dg6SH+Gi8+0+LVD0R3eq02n0A+CaPZsLHvUgsk=; b=2JBqwZcLT0aMgJ
	1YICehXjbP9u0HlXuFu+5ZEZFtGz1MKytjuur4iJExajgE6STxMaoTLVqUTJb17dQILgfUTuoBnuI
	YEv/HqkovqvPr6PcF1x1Rps+A529fnjE3Y3WSADIEeHjH+7e4Dc7UdBWw/h10Ns8fJR5hX0dregBo
	tIrlEhcX0zmv5Nxu41SAHkh470U5CnKTUPh4caUf2cNnm9VCNdKY4vAP92FmLWfgRrAAOrk2+Heft
	doMfd3gM+nM4jp5VXu4rg0szV6VNRMASY4Au4XRfhXeoEvKY2SRiFwIDW042HDK68dIvJoZz73w3k
	0uio73T5IjRuE9TRqOCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHbzx-0000000EqSt-3TSP;
	Wed, 21 May 2025 05:28:13 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHbzu-0000000EqRb-0Ob6
	for linux-riscv@lists.infradead.org;
	Wed, 21 May 2025 05:28:12 +0000
Received: from dev-suse.. (unknown [210.73.43.2])
	by APP-05 (Coremail) with SMTP id zQCowABHiy1dZC1ocLMBAg--.52072S2;
	Wed, 21 May 2025 13:27:57 +0800 (CST)
From: wangjingwei@iscas.ac.cn
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Jingwei Wang <wangjingwei@iscas.ac.cn>
Subject: [PATCH] riscv: hwprobe: Fix stale vDSO data for late-initialized keys at boot
Date: Wed, 21 May 2025 13:27:52 +0800
Message-ID: <20250521052754.185231-1-wangjingwei@iscas.ac.cn>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CM-TRANSID: zQCowABHiy1dZC1ocLMBAg--.52072S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr1UXr4UAr47XFy8Gw48Zwb_yoWrArWkpa
	yDCrsYqFW5GF4xGFW3K34kWr18K3Z5Wr13GFyqk343Zr47A343Jr9xtr47Zr90yryv934r
	GFsYgayYy347ZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwAKzVCY07xG64k0F24lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r
	4rMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
	Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x
	0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
	JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIx
	AIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb3ku3UUUUU=
	=
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: pzdqwy5lqj4v3l6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_222810_502317_AD6992DD 
X-CRM114-Status: GOOD (  14.91  )
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

From: Jingwei Wang <wangjingwei@iscas.ac.cn>

The riscv_hwprobe vDSO data is populated by init_hwprobe_vdso_data(),
an arch_initcall_sync. However, underlying data for some keys, like
RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF, is determined asynchronously.

Specifically, the per_cpu(vector_misaligned_access, cpu) values are set
by the vec_check_unaligned_access_speed_all_cpus kthread. This kthread
is spawned by an earlier arch_initcall (check_unaligned_access_all_cpus)
and may complete its benchmark *after* init_hwprobe_vdso_data() has
already populated the vDSO with default/stale values.

This patch introduces riscv_hwprobe_vdso_sync(sync_key). This function
is now called by the vec_check_unaligned_access_speed_all_cpus kthread
upon its completion. It re-evaluates the specified key using current kernel
state (including the finalized per-CPU data) via hwprobe_one_pair()
and updates the corresponding entry in vdso_k_arch_data.

This ensures the vDSO accurately reflects the final boot-time values
for keys determined by such asynchronous boot tasks, resolving observed
inconsistencies when userspace starts.

Test by comparing vDSO and syscall results for affected keys
(e.g., MISALIGNED_VECTOR_PERF), which now match their final
boot-time values.

Reported-by: Tsukasa OI <research_trasio@irq.a4lg.com>
Closes: https://lore.kernel.org/linux-riscv/760d637b-b13b-4518-b6bf-883d55d44e7f@irq.a4lg.com/
Signed-off-by: Jingwei Wang <wangjingwei@iscas.ac.cn>
---
 arch/riscv/include/asm/hwprobe.h           |  4 ++++
 arch/riscv/kernel/sys_hwprobe.c            | 16 ++++++++++++++++
 arch/riscv/kernel/unaligned_access_speed.c |  4 +++-
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 1f690fea0e03de6a..02c34f03d8b9bc83 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -40,4 +40,8 @@ static inline bool riscv_hwprobe_pair_cmp(struct riscv_hwprobe *pair,
 	return pair->value == other_pair->value;
 }
 
+#ifdef CONFIG_MMU
+void riscv_hwprobe_vdso_sync(s64 sync_key);
+#endif /* CONFIG_MMU */
+
 #endif
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 249aec8594a92a80..c2593bd766055d35 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -17,6 +17,7 @@
 #include <asm/vector.h>
 #include <asm/vendor_extensions/thead_hwprobe.h>
 #include <vdso/vsyscall.h>
+#include <vdso/datapage.h>
 
 
 static void hwprobe_arch_id(struct riscv_hwprobe *pair,
@@ -500,6 +501,21 @@ static int __init init_hwprobe_vdso_data(void)
 
 arch_initcall_sync(init_hwprobe_vdso_data);
 
+void riscv_hwprobe_vdso_sync(s64 sync_key)
+{
+	struct vdso_arch_data *avd = vdso_k_arch_data;
+	struct riscv_hwprobe pair;
+
+	pair.key = sync_key;
+	hwprobe_one_pair(&pair, cpu_online_mask);
+	/*
+	 * Update vDSO data for the given key.
+	 * Currently for non-ID key updates (e.g. MISALIGNED_VECTOR_PERF),
+	 * so 'homogeneous_cpus' is not re-evaluated here.
+	 */
+	avd->all_cpu_hwprobe_values[sync_key] = pair.value;
+}
+
 #endif /* CONFIG_MMU */
 
 SYSCALL_DEFINE5(riscv_hwprobe, struct riscv_hwprobe __user *, pairs,
diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 585d2dcf2dab1ccb..7194aee3bf3234e5 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -375,7 +375,9 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
 static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
 {
 	schedule_on_each_cpu(check_vector_unaligned_access);
-
+#ifdef CONFIG_MMU
+	riscv_hwprobe_vdso_sync(RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF);
+#endif
 	return 0;
 }
 #else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
