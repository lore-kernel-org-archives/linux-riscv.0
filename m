Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B39C61D85
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 23:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3lNj5JJ4Q9+uRjJ865R06Nt3EXSowDLp8LEMupNht94=; b=pUKkOevvxmrjvc
	FvWjj0swR52xKuCqMmrwvM6QFZ2VHfqLoooUufymEvW7MwtqmHOhtzZvdVjatnHeYDezZfeAsra8s
	ZGYGMcEYLf6l3mDvb3h1/4QNA/vxGnHvhpcwy0QZeFvzWCsosUfGzfwaYu2jlIPvXdqn9gGu/Y2/u
	Fkv1eziD45kJ7pviqq1crAtwKm9f4igoqtyUKmbidzhJ/9n2zJYLGpGcUV/vuhDmVfFC1LtZNLD4f
	XHuT5ztnyOnoT+59qG8uWt8gUM/v6hLb4y+7DddtCf0AqUrqCY/QM2OV+9rLi7n6s65eBOmVrDFwI
	YsM+HwVjnAoVnYCsGq3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5aT5-000HsM-1H;
	Tue, 21 Nov 2023 23:47:47 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5aT1-000Hq6-0A
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 23:47:44 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2802c41b716so4857024a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 15:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700610461; x=1701215261; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfO2TsuP5+bzwc+1UBNKacN7ooenjZKMpjxDQuaWHLs=;
        b=BHBE4bl0LIc7f81cPOHOsS/vZttIKp8fSeX31X8E9fJTvvySWcxAxoXUHa6+bD7Hzr
         aW+fVJhXe8qnvHgf+bIGJNFs/e/4RpMnknB4BNdHu21Hif3fyW05nm8QwEuDecPKv25w
         Vra3UG9pPxIldFXavN1l6IhaGB5KNXeEeprntOj53rX/9WMGWfrStKQLUphXGMXHO8i+
         JOninQ10xooK4ykweFemWjeOfonmrY5I32c+D/F3Z7gKWf5xHmIKc34tUwo/903nk1EV
         Pa7OdllFBheIRj2CdIAVFssD1i8VcRTyW36DwoLJk3rKmLa0xuDS2l5CtVKWXQ/qaKS8
         Qghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700610461; x=1701215261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfO2TsuP5+bzwc+1UBNKacN7ooenjZKMpjxDQuaWHLs=;
        b=F73X9nJMBbPccBbMPDehww7izpb5A/WYGemalH4sFigQ9gmjdBzin5AJQaYiOoXHHq
         5C1dsxu5aZfiCYDPq3ftGOiCEasz5HRhUe5yVBMSmouxPfkGF0GZLSQMvc5PJuWS+SsA
         /WYuOkjkrRvRcgEuMZ6XRsOCgFwbg7omupIX7TqDcGyK0ipuZj434Ig9L6qvtG/uFxyz
         8Vp9zwDjd0axvvaxu6G1rSYdB7FDx9QROu7yRmsEbuXq5vodn4FxwUCQwQQHQThNBV5F
         Ty8vVEBrHy/1DxdaHWmajwT15XJRuGSHWCzhg9BZA/wlJH2AQqVvQPqF8sDVTFdE0i2R
         SjYA==
X-Gm-Message-State: AOJu0YzCZrv+mWkNfMBTHnbXTy6i16Hv7EyaZ5TSl/DrKHLznZyD2oAD
	QWMbQvd3UlFVFJbatCJLEVWb4A==
X-Google-Smtp-Source: AGHT+IEuxWeyQyxVZpHs2HhfPBfaktXQRoOaYpXSTZYzhyVnj051EXkgI0JValZG2raCSDzrUvzGGg==
X-Received: by 2002:a17:90b:17c9:b0:27d:661f:59ac with SMTP id me9-20020a17090b17c900b0027d661f59acmr803651pjb.38.1700610461416;
        Tue, 21 Nov 2023 15:47:41 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id f8-20020a17090ace0800b002802d9d4e96sm82234pju.54.2023.11.21.15.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 15:47:41 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 3/3] riscv: Use the same CPU operations for all CPUs
Date: Tue, 21 Nov 2023 15:47:26 -0800
Message-ID: <20231121234736.3489608-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121234736.3489608-1-samuel.holland@sifive.com>
References: <20231121234736.3489608-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_154743_100034_64F7BE50 
X-CRM114-Status: GOOD (  18.04  )
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

RISC-V provides no binding (ACPI or DT) to describe per-cpu start/stop
operations, so cpu_set_ops() will always detect the same operations for
every CPU. Replace the cpu_ops array with a single pointer to save space
and reduce boot time.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/cpu_ops.h |  4 ++--
 arch/riscv/kernel/cpu-hotplug.c  | 10 +++++-----
 arch/riscv/kernel/cpu_ops.c      | 12 +++++-------
 arch/riscv/kernel/smp.c          |  2 +-
 arch/riscv/kernel/smpboot.c      | 13 +++++--------
 5 files changed, 18 insertions(+), 23 deletions(-)

diff --git a/arch/riscv/include/asm/cpu_ops.h b/arch/riscv/include/asm/cpu_ops.h
index 18af75e6873c..176b570ef982 100644
--- a/arch/riscv/include/asm/cpu_ops.h
+++ b/arch/riscv/include/asm/cpu_ops.h
@@ -29,7 +29,7 @@ struct cpu_operations {
 };
 
 extern const struct cpu_operations cpu_ops_spinwait;
-extern const struct cpu_operations *cpu_ops[NR_CPUS];
-void __init cpu_set_ops(int cpu);
+extern const struct cpu_operations *cpu_ops;
+void __init cpu_set_ops(void);
 
 #endif /* ifndef __ASM_CPU_OPS_H */
diff --git a/arch/riscv/kernel/cpu-hotplug.c b/arch/riscv/kernel/cpu-hotplug.c
index 934eb64da0d0..28b58fc5ad19 100644
--- a/arch/riscv/kernel/cpu-hotplug.c
+++ b/arch/riscv/kernel/cpu-hotplug.c
@@ -18,7 +18,7 @@
 
 bool cpu_has_hotplug(unsigned int cpu)
 {
-	if (cpu_ops[cpu]->cpu_stop)
+	if (cpu_ops->cpu_stop)
 		return true;
 
 	return false;
@@ -31,7 +31,7 @@ int __cpu_disable(void)
 {
 	unsigned int cpu = smp_processor_id();
 
-	if (!cpu_ops[cpu] || !cpu_ops[cpu]->cpu_stop)
+	if (!cpu_ops->cpu_stop)
 		return -EOPNOTSUPP;
 
 	remove_cpu_topology(cpu);
@@ -55,8 +55,8 @@ void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
 	pr_notice("CPU%u: off\n", cpu);
 
 	/* Verify from the firmware if the cpu is really stopped*/
-	if (cpu_ops[cpu]->cpu_is_stopped)
-		ret = cpu_ops[cpu]->cpu_is_stopped(cpu);
+	if (cpu_ops->cpu_is_stopped)
+		ret = cpu_ops->cpu_is_stopped(cpu);
 	if (ret)
 		pr_warn("CPU%d may not have stopped: %d\n", cpu, ret);
 }
@@ -70,7 +70,7 @@ void __noreturn arch_cpu_idle_dead(void)
 
 	cpuhp_ap_report_dead();
 
-	cpu_ops[smp_processor_id()]->cpu_stop();
+	cpu_ops->cpu_stop();
 	/* It should never reach here */
 	BUG();
 }
diff --git a/arch/riscv/kernel/cpu_ops.c b/arch/riscv/kernel/cpu_ops.c
index 5540e2880abb..6a8bd8f4db07 100644
--- a/arch/riscv/kernel/cpu_ops.c
+++ b/arch/riscv/kernel/cpu_ops.c
@@ -13,7 +13,7 @@
 #include <asm/sbi.h>
 #include <asm/smp.h>
 
-const struct cpu_operations *cpu_ops[NR_CPUS] __ro_after_init;
+const struct cpu_operations *cpu_ops __ro_after_init = &cpu_ops_spinwait;
 
 extern const struct cpu_operations cpu_ops_sbi;
 #ifndef CONFIG_RISCV_BOOT_SPINWAIT
@@ -22,14 +22,12 @@ const struct cpu_operations cpu_ops_spinwait = {
 };
 #endif
 
-void __init cpu_set_ops(int cpuid)
+void __init cpu_set_ops(void)
 {
 #if IS_ENABLED(CONFIG_RISCV_SBI)
 	if (sbi_probe_extension(SBI_EXT_HSM)) {
-		if (!cpuid)
-			pr_info("SBI HSM extension detected\n");
-		cpu_ops[cpuid] = &cpu_ops_sbi;
-	} else
+		pr_info("SBI HSM extension detected\n");
+		cpu_ops = &cpu_ops_sbi;
+	}
 #endif
-		cpu_ops[cpuid] = &cpu_ops_spinwait;
 }
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 40420afbb1a0..45dd4035416e 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -81,7 +81,7 @@ static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
 
 #ifdef CONFIG_HOTPLUG_CPU
 	if (cpu_has_hotplug(cpu))
-		cpu_ops[cpu]->cpu_stop();
+		cpu_ops->cpu_stop();
 #endif
 
 	for(;;)
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 5551945255cd..519b6bd946e5 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -166,25 +166,22 @@ void __init setup_smp(void)
 {
 	int cpuid;
 
-	cpu_set_ops(0);
+	cpu_set_ops();
 
 	if (acpi_disabled)
 		of_parse_and_init_cpus();
 	else
 		acpi_parse_and_init_cpus();
 
-	for (cpuid = 1; cpuid < nr_cpu_ids; cpuid++) {
-		if (cpuid_to_hartid_map(cpuid) != INVALID_HARTID) {
-			cpu_set_ops(cpuid);
+	for (cpuid = 1; cpuid < nr_cpu_ids; cpuid++)
+		if (cpuid_to_hartid_map(cpuid) != INVALID_HARTID)
 			set_cpu_possible(cpuid, true);
-		}
-	}
 }
 
 static int start_secondary_cpu(int cpu, struct task_struct *tidle)
 {
-	if (cpu_ops[cpu]->cpu_start)
-		return cpu_ops[cpu]->cpu_start(cpu, tidle);
+	if (cpu_ops->cpu_start)
+		return cpu_ops->cpu_start(cpu, tidle);
 
 	return -EOPNOTSUPP;
 }
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
