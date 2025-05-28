Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A22C5AD49
	for <linux-riscv@archiver.kernel.org>; Wed, 28 May 2025 14:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LYDVHfwTibLK2qskZ3UUpf2flq2+w066ohRNqw2F1Hc=; b=25GFdYKXZVNIH7
	kDlxy/NJafP77NArMsr7kVhGt0szhQiCkDKZkCch3T+hLC6sAoGvI79wzuYMD5+Lgan4kcfbl/zor
	4KZobs8s3dIwrqP0Zno0uoEqQcHBWxCO+sel07yt1YrqonrX/5Heq1pE0LiLCSVclKW0GwE0VY9ZD
	c5SK/sTC0WlM297c+zkzGe7U0hwtVqt4cU0nVNuiojukM3XoqB6lrrogU9UQHlFSxB7x5W05OUdhd
	2MHJyj5jQvoDJAOghsE9lkayI8pW5CsHjI3PE8kLTVWgl/4zlqkHeXiNXMX9x0J2E60MvTWsO9/wV
	aKccA0QAGglK9kQoJP8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHq9-0000000DPVA-3okR;
	Wed, 28 May 2025 14:33:09 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHmw-0000000DP6f-2fuw
	for linux-riscv@lists.infradead.org;
	Wed, 28 May 2025 14:29:53 +0000
Received: from dev-suse.. (unknown [39.144.108.37])
	by APP-05 (Coremail) with SMTP id zQCowABXpRPKHTdoAIzaAA--.50534S2;
	Wed, 28 May 2025 22:29:32 +0800 (CST)
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
	Jingwei Wang <wangjingwei@iscas.ac.cn>
Subject: [PATCH v3] riscv: hwprobe: Fix stale vDSO data for late-initialized keys at boot
Date: Wed, 28 May 2025 22:28:19 +0800
Message-ID: <20250528142855.1847510-1-wangjingwei@iscas.ac.cn>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CM-TRANSID: zQCowABXpRPKHTdoAIzaAA--.50534S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr1UXr4UAr47XFy8Gw48Zwb_yoWrAw4Upa
	yDCrsaqFW5CF4xWa45K3s7uF10g3Z5Gr13GFyqk343ZrW2y343Ar92qrsrZr90yryv9a4F
	9F4a9F4Sy347Ar7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUU0zuJUUUUU==
X-Originating-IP: [39.144.108.37]
X-CM-SenderInfo: pzdqwy5lqj4v3l6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_072951_052610_A2025A14 
X-CRM114-Status: GOOD (  12.68  )
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
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
Reviewed-by: Jesse Taube <jesse@rivosinc.com>
Signed-off-by: Jingwei Wang <wangjingwei@iscas.ac.cn>
---
Changes in v3:
	- Retained existing blank line.

Changes in v2:
	- Addressed feedback from Yixun's regarding #ifdef CONFIG_MMU usage.
	- Updated commit message to provide a high-level summary.
	- Added Fixes tag for commit e7c9d66e313b.

v1: https://lore.kernel.org/linux-riscv/20250521052754.185231-1-wangjingwei@iscas.ac.cn/T/#u

 arch/riscv/include/asm/hwprobe.h           |  6 ++++++
 arch/riscv/kernel/sys_hwprobe.c            | 16 ++++++++++++++++
 arch/riscv/kernel/unaligned_access_speed.c |  1 +
 3 files changed, 23 insertions(+)

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
index 585d2dcf2dab1ccb..a2cdb396ff823720 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -375,6 +375,7 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
 static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
 {
 	schedule_on_each_cpu(check_vector_unaligned_access);
+	riscv_hwprobe_vdso_sync(RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF);
 
 	return 0;
 }
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
