Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6EFC54756
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 07:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KnkxPz0RTeTRi9kAyLXkB17ffHX1CqWY+wLpeXdh8+0=; b=GWiAKIDinFbNIc
	h/HF6TGCOE8nAVTbY/WsFOKocDhX9/IXZHou5pTgTqZjZlvu2x5s0ezjS10Is+Iqk8SIJlj1SB9S7
	+Bzvh9rVJ045FHu+EFTyhDStGBgaR0u85NgAWngU1/PzXE9x/7QM5qi4cGLV6iQ73mAMHXYqcOE1S
	cO7082cPQehFfkVzK6GCLPKviusY1VPHtwCoCSBeil1kho00XoK77QBZ58b83ooDNCNcBKhEIdmsz
	0/DC4oKvzE64pv6C5iw8BqqNM9oe4jxO2W6Ue0cTEBwrhRa4D0XzTdsGLhvdjyg5q94zEO0Tq/lPU
	JWAeG/1eSpYvhyMWfVFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI0RO-00000000912-0qbD;
	Thu, 22 May 2025 07:34:10 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI0RK-000000008yy-1Y2F
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 07:34:08 +0000
Received: from dev-suse.. (unknown [210.73.43.2])
	by APP-03 (Coremail) with SMTP id rQCowAAndvFh0y5oZTxgAg--.2470S2;
	Thu, 22 May 2025 15:33:53 +0800 (CST)
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
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	stable@vger.kernel.org,
	Jingwei Wang <wangjingwei@iscas.ac.cn>
Subject: [PATCH v2] riscv: hwprobe: Fix stale vDSO data for late-initialized keys at boot
Date: Thu, 22 May 2025 15:33:06 +0800
Message-ID: <20250522073327.246668-1-wangjingwei@iscas.ac.cn>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CM-TRANSID: rQCowAAndvFh0y5oZTxgAg--.2470S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr1UXr4UAr47XFy8Gw48Zwb_yoWrArW5pa
	yDCrsIqFW5GF4xWay5K3s7uF18K3Z5Gr13GF1qk343ZrW7A343Ar9aqr47Zryqyryvga4r
	CFsagF4Fyry7Zw7anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE
	6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72
	CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7
	M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r4a6rW5MxkIecxEwVAFwVW8Cw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWU
	AwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
	AFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
	A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU
	0xZFpf9x0pR89NcUUUUU=
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: pzdqwy5lqj4v3l6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_003406_785703_961468B2 
X-CRM114-Status: GOOD (  14.04  )
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

The riscv_hwprobe vDSO data is populated by init_hwprobe_vdso_data(),
an arch_initcall_sync. However, underlying data for some keys, like
RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF, is determined asynchronously.

Specifically, the per_cpu(vector_misaligned_access, cpu) values are set
by the vec_check_unaligned_access_speed_all_cpus kthread. This kthread
is spawned by an earlier arch_initcall (check_unaligned_access_all_cpus)
and may complete its benchmark *after* init_hwprobe_vdso_data() has
already populated the vDSO with default/stale values.

So, refresh the vDSO data for specified keys (e.g.,
MISALIGNED_VECTOR_PERF) ensuring it reflects the final boot-time values.

Test by comparing vDSO and syscall results for affected keys
(e.g., MISALIGNED_VECTOR_PERF), which now match their final
boot-time values.

Reported-by: Tsukasa OI <research_trasio@irq.a4lg.com>
Closes: https://lore.kernel.org/linux-riscv/760d637b-b13b-4518-b6bf-883d55d44e7f@irq.a4lg.com/
Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
Cc: stable@vger.kernel.org
Signed-off-by: Jingwei Wang <wangjingwei@iscas.ac.cn>
---
Changes in v2:
  - Addressed feedback from Yixun's regarding #ifdef CONFIG_MMU usage.
  - Updated commit message to provide a high-level summary.
  - Added Fixes tag for commit e7c9d66e313b.

v1: https://lore.kernel.org/linux-riscv/20250521052754.185231-1-wangjingwei@iscas.ac.cn/T/#u

 arch/riscv/include/asm/hwprobe.h           |  6 ++++++
 arch/riscv/kernel/sys_hwprobe.c            | 16 ++++++++++++++++
 arch/riscv/kernel/unaligned_access_speed.c |  2 +-
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 1f690fea0e03de6a..58dc847d86c7f2b0 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -40,4 +40,10 @@ static inline bool riscv_hwprobe_pair_cmp(struct riscv_hwprobe *pair,
 	return pair->value == other_pair->value;
 }
 
+#ifdef CONFIG_MMU
+void riscv_hwprobe_vdso_sync(__s64 sync_key);
+#else
+static inline void riscv_hwprobe_vdso_sync(__s64 sync_key) { };
+#endif /* CONFIG_MMU */
+
 #endif
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 249aec8594a92a80..2e3e612b7ac6fd57 100644
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
 
+void riscv_hwprobe_vdso_sync(__s64 sync_key)
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
index 585d2dcf2dab1ccb..81bc4997350acc87 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -375,7 +375,7 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
 static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
 {
 	schedule_on_each_cpu(check_vector_unaligned_access);
-
+	riscv_hwprobe_vdso_sync(RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF);
 	return 0;
 }
 #else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
