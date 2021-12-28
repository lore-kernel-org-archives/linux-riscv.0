Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9103DC43217
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 22:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iZqqd5VU/yo8YIXCnM1k5VpVxitwyc7BTXXGOA+FycI=; b=R1KOXbVnd5aLSM
	BVvPHR4LRXyuDpSCTdz9UbIsHAT6dgOlSZkCoyUxgTtxUbO7hBzQu3koeRs/j8Bq8XmAwNsM1gJky
	wdHBKcO8Kzn9G/Efv+cbZGtJ1mJJEjJUeGId06SwdLwJSj0S+YdibQJ/5AxBnKCxV2rpTiWB1KPms
	yKtWer6Wh19komBHHsPT3F5QVm5tpMfHgjlQQ3fSB8w9ydZlT1uHkbHBQ+VrE7xhOMtLbWknxB/a3
	wL2ltpdh5aGP/VonDO7sCAgUWr1Mo6Lf5/nGsV88HIXNLH/ByZQBZ8yj8tfqk+tC3tlxh7KSDAZ2O
	c73RmAJXf93woIfqjKww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2Kzy-001vE1-JI; Tue, 28 Dec 2021 22:31:14 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2Kzr-001vAZ-W7
 for linux-riscv@lists.infradead.org; Tue, 28 Dec 2021 22:31:09 +0000
Received: by mail-qk1-x733.google.com with SMTP id 69so18371142qkd.6
 for <linux-riscv@lists.infradead.org>; Tue, 28 Dec 2021 14:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eH8BkQQEwKWbJiU9+UwbIN3iGI7438cqB3LeQEukF7o=;
 b=tPFDtbHeayP+93Di7SqVU0qlL9cBaUh7PfgSyoqmdnaX8TK2ISJxzFW8ncRMaBlwT1
 ocSDP/Cg1+/un3gG3900bCnKdcaNZ32VdKKIh9rhJo3Vgcgm9J71LH0ZKkvmdfn3XAj9
 rbwHWUYF/Hi//ar2sircKiGQMrUUoYhZwXFWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eH8BkQQEwKWbJiU9+UwbIN3iGI7438cqB3LeQEukF7o=;
 b=dasWfdUHIQjx1J75ZbOwGn1gfTEFG2M6Gp6++NTQVbtfdNF70LvPwoHkLy5PuBLjRV
 bIoy9xv2s+Wfr3N/z/Prs1TBMgRl15utRXQglrSvGDN92rxYB5A7nbjfmXCjrHq2R2WS
 6ShYOnt8nYfjs/vhZVUPcg34Ycz6X9th5X1FGMWQKuKROmVeV1Q98ehQjeGo/S6sIpXS
 CMuf4p0fnkqLXQAfj/NNmA0A+1QgvfhReJG8KT8FL9uvzrL49fnMi115Xd9GoxXduV70
 J/zU/k7qwXEbA7FTOXe+SsTuiyrN8JaBtQ02EpLTejp1K2jCh+N28HAp5wHo1+ge/igW
 TChg==
X-Gm-Message-State: AOAM533lNVC44R8+jyFC0bJo0airRvnsXDBpJUIoYLHsChmTnrjja6i9
 FcbfZ5Xg7rH+RiBWHFKV59Hy
X-Google-Smtp-Source: ABdhPJwASnHFbY8Bb/ibGGmogSBId+QJROzqv3x/vqjqMt6OATFy7matNAtO8mMtLOEKbAsqxX5Ukw==
X-Received: by 2002:a37:a105:: with SMTP id k5mr16868445qke.716.1640730666890; 
 Tue, 28 Dec 2021 14:31:06 -0800 (PST)
Received: from fedora.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id i5sm2738407qti.27.2021.12.28.14.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 14:31:06 -0800 (PST)
From: Atish Patra <atishp@atishpatra.org>
X-Google-Original-From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 3/6] RISC-V: Use __cpu_up_stack/task_pointer only for
 spinwait method
Date: Tue, 28 Dec 2021 14:30:54 -0800
Message-Id: <20211228223057.2772727-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211228223057.2772727-1-atishp@rivosinc.com>
References: <20211228223057.2772727-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_143108_061810_4750BB0A 
X-CRM114-Status: GOOD (  18.89  )
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

The __cpu_up_stack/task_pointer array is only used for spinwait method
now. The per cpu array based lookup is also fragile for platforms with
discontiguous/sparse hartids. The spinwait method is only used for
M-mode Linux or older firmwares without SBI HSM extension. For general
Linux systems, ordered booting method is preferred anyways to support
cpu hotplug and kexec.

Make sure that __cpu_up_stack/task_pointer is only used for spinwait
method. Take this opportunity to rename it to
__cpu_spinwait_stack/task_pointer to emphasize the purpose as well.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/cpu_ops.h     |  2 --
 arch/riscv/kernel/cpu_ops.c          | 16 ----------------
 arch/riscv/kernel/cpu_ops_spinwait.c | 27 ++++++++++++++++++++++++++-
 arch/riscv/kernel/head.S             |  4 ++--
 arch/riscv/kernel/head.h             |  4 ++--
 5 files changed, 30 insertions(+), 23 deletions(-)

diff --git a/arch/riscv/include/asm/cpu_ops.h b/arch/riscv/include/asm/cpu_ops.h
index a8ec3c5c1bd2..134590f1b843 100644
--- a/arch/riscv/include/asm/cpu_ops.h
+++ b/arch/riscv/include/asm/cpu_ops.h
@@ -40,7 +40,5 @@ struct cpu_operations {
 
 extern const struct cpu_operations *cpu_ops[NR_CPUS];
 void __init cpu_set_ops(int cpu);
-void cpu_update_secondary_bootdata(unsigned int cpuid,
-				   struct task_struct *tidle);
 
 #endif /* ifndef __ASM_CPU_OPS_H */
diff --git a/arch/riscv/kernel/cpu_ops.c b/arch/riscv/kernel/cpu_ops.c
index 3f5a38b03044..c1e30f403c3b 100644
--- a/arch/riscv/kernel/cpu_ops.c
+++ b/arch/riscv/kernel/cpu_ops.c
@@ -8,31 +8,15 @@
 #include <linux/of.h>
 #include <linux/string.h>
 #include <linux/sched.h>
-#include <linux/sched/task_stack.h>
 #include <asm/cpu_ops.h>
 #include <asm/sbi.h>
 #include <asm/smp.h>
 
 const struct cpu_operations *cpu_ops[NR_CPUS] __ro_after_init;
 
-void *__cpu_up_stack_pointer[NR_CPUS] __section(".data");
-void *__cpu_up_task_pointer[NR_CPUS] __section(".data");
-
 extern const struct cpu_operations cpu_ops_sbi;
 extern const struct cpu_operations cpu_ops_spinwait;
 
-void cpu_update_secondary_bootdata(unsigned int cpuid,
-				   struct task_struct *tidle)
-{
-	int hartid = cpuid_to_hartid_map(cpuid);
-
-	/* Make sure tidle is updated */
-	smp_mb();
-	WRITE_ONCE(__cpu_up_stack_pointer[hartid],
-		   task_stack_page(tidle) + THREAD_SIZE);
-	WRITE_ONCE(__cpu_up_task_pointer[hartid], tidle);
-}
-
 void __init cpu_set_ops(int cpuid)
 {
 #if IS_ENABLED(CONFIG_RISCV_SBI)
diff --git a/arch/riscv/kernel/cpu_ops_spinwait.c b/arch/riscv/kernel/cpu_ops_spinwait.c
index b2c957bb68c1..346847f6c41c 100644
--- a/arch/riscv/kernel/cpu_ops_spinwait.c
+++ b/arch/riscv/kernel/cpu_ops_spinwait.c
@@ -6,11 +6,36 @@
 #include <linux/errno.h>
 #include <linux/of.h>
 #include <linux/string.h>
+#include <linux/sched/task_stack.h>
 #include <asm/cpu_ops.h>
 #include <asm/sbi.h>
 #include <asm/smp.h>
 
 const struct cpu_operations cpu_ops_spinwait;
+void *__cpu_spinwait_stack_pointer[NR_CPUS] __section(".data");
+void *__cpu_spinwait_task_pointer[NR_CPUS] __section(".data");
+
+static void cpu_update_secondary_bootdata(unsigned int cpuid,
+				   struct task_struct *tidle)
+{
+	int hartid = cpuid_to_hartid_map(cpuid);
+
+	/*
+	 * The hartid must be less than NR_CPUS to avoid out-of-bound access
+	 * errors for __cpu_spinwait_stack/task_pointer. That is not always possible
+	 * for platforms with discontiguous hartid numbering scheme. That's why
+	 * spinwait booting is not the recommended approach for any platforms
+	 * booting Linux in S-mode and can be disabled in the future.
+	 */
+	if (hartid == INVALID_HARTID || hartid >= NR_CPUS)
+		return;
+
+	/* Make sure tidle is updated */
+	smp_mb();
+	WRITE_ONCE(__cpu_spinwait_stack_pointer[hartid],
+		   task_stack_page(tidle) + THREAD_SIZE);
+	WRITE_ONCE(__cpu_spinwait_task_pointer[hartid], tidle);
+}
 
 static int spinwait_cpu_prepare(unsigned int cpuid)
 {
@@ -28,7 +53,7 @@ static int spinwait_cpu_start(unsigned int cpuid, struct task_struct *tidle)
 	 * selects the first cpu to boot the kernel and causes the remainder
 	 * of the cpus to spin in a loop waiting for their stack pointer to be
 	 * setup by that main cpu.  Writing to bootdata
-	 * (i.e __cpu_up_stack_pointer) signals to the spinning cpus that they
+	 * (i.e __cpu_spinwait_stack_pointer) signals to the spinning cpus that they
 	 * can continue the boot process.
 	 */
 	cpu_update_secondary_bootdata(cpuid, tidle);
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 40d4c625513c..6f8e99eac6a1 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -347,9 +347,9 @@ clear_bss_done:
 	csrw CSR_TVEC, a3
 
 	slli a3, a0, LGREG
-	la a1, __cpu_up_stack_pointer
+	la a1, __cpu_spinwait_stack_pointer
 	XIP_FIXUP_OFFSET a1
-	la a2, __cpu_up_task_pointer
+	la a2, __cpu_spinwait_task_pointer
 	XIP_FIXUP_OFFSET a2
 	add a1, a3, a1
 	add a2, a3, a2
diff --git a/arch/riscv/kernel/head.h b/arch/riscv/kernel/head.h
index aabbc3ac3e48..5393cca77790 100644
--- a/arch/riscv/kernel/head.h
+++ b/arch/riscv/kernel/head.h
@@ -16,7 +16,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa);
 asmlinkage void __init __copy_data(void);
 #endif
 
-extern void *__cpu_up_stack_pointer[];
-extern void *__cpu_up_task_pointer[];
+extern void *__cpu_spinwait_stack_pointer[];
+extern void *__cpu_spinwait_task_pointer[];
 
 #endif /* __ASM_HEAD_H */
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
