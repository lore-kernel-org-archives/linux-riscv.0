Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBDAC61D98
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 23:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5QmOZ0JNMkDL9FcpPMTXTS2Md9bhueuN+qOcWzGAVK0=; b=2cK1oUasaQGyLX
	yFZr9IpveZcbEDH/ZNr4SFbEGWa2X9PiHeJ8zhls7xCkBUh73EW7ksnnhLiPtZB+/BLDrMKEUTjtO
	rV0zex5lmjE3J7S2ekewmoRT38GMUoUFUqbvCAEeKn3nj85x8gLVoiqowbfDduiOErMFmwgPl291W
	vbBDijCKsAoDpTaGIKbB/mL4L4noHFPpAnRfNq7bI3AT0OJJdU3BBiJ9FdAsGk8JhT+8Q/mUY24iA
	EEM17kaMq430C1Ysnky+LPt7Oh8ueUM5fzEp6Mc1DulTyRSOOzI86+/DCDqZC/zrT6Y261AdE1j9V
	DIpr5QspAaXChBzXPhGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5aT4-000Hrk-2T;
	Tue, 21 Nov 2023 23:47:46 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5aSz-000Hpg-0H
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 23:47:42 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5c239897895so1899129a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 15:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700610460; x=1701215260; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2mLSanzAu7xkVkTlVbQ+OCyp7a1LICmHfqJMNCQTMM=;
        b=G+S3Ib14TnIVOaagP2fZIZd8pncIe1qIPaR7T3vnk9fTdNBecJsXaETccx6wzz8qY9
         JGQ0xWP16MJ1bxmdXNVxIcgIgBMV/ZFAffJABau7NJSXpBVpstQKt7oioAIQqgiWVJKx
         3th9mOImNOkLMp86qtY8bUw81meniREdW39bHdvlrmEGsrQidnhvYTMgaZ1uaBdbGci+
         zacHILANbjJVHU28GfBSkqegcv9yUo86TIFuDTvolF8PnsPw9D6T1gP8Z0GKNvh2muC3
         2HGsUNyFjdFvpAzGpMuh2Xen2Ya8ZpsVAvEhb3RoglhNWbnruGF46WJgtD4NzGdhMC/M
         nhwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700610460; x=1701215260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2mLSanzAu7xkVkTlVbQ+OCyp7a1LICmHfqJMNCQTMM=;
        b=XouOHRaN9J+JyJwtjUHvWkAWvHFpls2ahg7WYiA2OaU+0rxffSgDpm7gSgOEP/xabY
         wlMCILIgo2cORCMcpK6oX7zV2KlvkC2wNsRbelBXmP1LuvXg0HFleAzv5uyL/+NH2mOs
         3fXPSg1K8OsBXrw8NHxKl9djIQUvMWj1y/JZM3BepgXucAKn7LeZgeK3eR+hFeA7xFUh
         OcPohuknTsORmoYz0B9osqFokx4LO24rLNhrGnZ2lwNfCug6MhcR/xBlReMWzxKZSs5x
         IBIjJ2Ni6lR732YasayXCoIgQOj2HlEOz+xEGlaht+cQRwaleYuJpV+LRBv2RUbeORdF
         Aowg==
X-Gm-Message-State: AOJu0Yx+dr2/lP4DtviTHCM+JLPI/bdLnh+VF+P2SmzBo5Rg9Q6CQjoS
	ewlk6rB7hzNhEdAizTJC0HcGvA==
X-Google-Smtp-Source: AGHT+IHoez2A3aRDrdQwxK18whZwJQR498ZFuayF3Kusj3dBV4VtpQAp7G00A3jzOcyqkuPlxbXNnA==
X-Received: by 2002:a05:6a21:a585:b0:187:cc5f:dbf4 with SMTP id gd5-20020a056a21a58500b00187cc5fdbf4mr692350pzc.42.1700610460323;
        Tue, 21 Nov 2023 15:47:40 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id f8-20020a17090ace0800b002802d9d4e96sm82234pju.54.2023.11.21.15.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 15:47:40 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 2/3] riscv: Remove unused members from struct cpu_operations
Date: Tue, 21 Nov 2023 15:47:25 -0800
Message-ID: <20231121234736.3489608-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121234736.3489608-1-samuel.holland@sifive.com>
References: <20231121234736.3489608-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_154741_123326_AAD32AD7 
X-CRM114-Status: GOOD (  18.78  )
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

name is not used anywhere at all. cpu_prepare and cpu_disable do nothing
and always return 0 if implemented.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/cpu_ops.h     | 10 ----------
 arch/riscv/kernel/cpu-hotplug.c      |  9 +--------
 arch/riscv/kernel/cpu_ops.c          |  2 --
 arch/riscv/kernel/cpu_ops_sbi.c      | 19 -------------------
 arch/riscv/kernel/cpu_ops_spinwait.c | 11 -----------
 arch/riscv/kernel/head.S             |  1 -
 arch/riscv/kernel/setup.c            |  1 -
 arch/riscv/kernel/smpboot.c          |  6 ------
 8 files changed, 1 insertion(+), 58 deletions(-)

diff --git a/arch/riscv/include/asm/cpu_ops.h b/arch/riscv/include/asm/cpu_ops.h
index aa128466c4d4..18af75e6873c 100644
--- a/arch/riscv/include/asm/cpu_ops.h
+++ b/arch/riscv/include/asm/cpu_ops.h
@@ -13,26 +13,16 @@
 /**
  * struct cpu_operations - Callback operations for hotplugging CPUs.
  *
- * @name:		Name of the boot protocol.
- * @cpu_prepare:	Early one-time preparation step for a cpu. If there
- *			is a mechanism for doing so, tests whether it is
- *			possible to boot the given HART.
  * @cpu_start:		Boots a cpu into the kernel.
- * @cpu_disable:	Prepares a cpu to die. May fail for some
- *			mechanism-specific reason, which will cause the hot
- *			unplug to be aborted. Called from the cpu to be killed.
  * @cpu_stop:		Makes a cpu leave the kernel. Must not fail. Called from
  *			the cpu being stopped.
  * @cpu_is_stopped:	Ensures a cpu has left the kernel. Called from another
  *			cpu.
  */
 struct cpu_operations {
-	const char	*name;
-	int		(*cpu_prepare)(unsigned int cpu);
 	int		(*cpu_start)(unsigned int cpu,
 				     struct task_struct *tidle);
 #ifdef CONFIG_HOTPLUG_CPU
-	int		(*cpu_disable)(unsigned int cpu);
 	void		(*cpu_stop)(void);
 	int		(*cpu_is_stopped)(unsigned int cpu);
 #endif
diff --git a/arch/riscv/kernel/cpu-hotplug.c b/arch/riscv/kernel/cpu-hotplug.c
index 457a18efcb11..934eb64da0d0 100644
--- a/arch/riscv/kernel/cpu-hotplug.c
+++ b/arch/riscv/kernel/cpu-hotplug.c
@@ -29,25 +29,18 @@ bool cpu_has_hotplug(unsigned int cpu)
  */
 int __cpu_disable(void)
 {
-	int ret = 0;
 	unsigned int cpu = smp_processor_id();
 
 	if (!cpu_ops[cpu] || !cpu_ops[cpu]->cpu_stop)
 		return -EOPNOTSUPP;
 
-	if (cpu_ops[cpu]->cpu_disable)
-		ret = cpu_ops[cpu]->cpu_disable(cpu);
-
-	if (ret)
-		return ret;
-
 	remove_cpu_topology(cpu);
 	numa_remove_cpu(cpu);
 	set_cpu_online(cpu, false);
 	riscv_ipi_disable();
 	irq_migrate_all_off_this_cpu();
 
-	return ret;
+	return 0;
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
diff --git a/arch/riscv/kernel/cpu_ops.c b/arch/riscv/kernel/cpu_ops.c
index eb479a88a954..5540e2880abb 100644
--- a/arch/riscv/kernel/cpu_ops.c
+++ b/arch/riscv/kernel/cpu_ops.c
@@ -18,8 +18,6 @@ const struct cpu_operations *cpu_ops[NR_CPUS] __ro_after_init;
 extern const struct cpu_operations cpu_ops_sbi;
 #ifndef CONFIG_RISCV_BOOT_SPINWAIT
 const struct cpu_operations cpu_ops_spinwait = {
-	.name		= "",
-	.cpu_prepare	= NULL,
 	.cpu_start	= NULL,
 };
 #endif
diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
index efa0f0816634..1cc7df740edd 100644
--- a/arch/riscv/kernel/cpu_ops_sbi.c
+++ b/arch/riscv/kernel/cpu_ops_sbi.c
@@ -79,23 +79,7 @@ static int sbi_cpu_start(unsigned int cpuid, struct task_struct *tidle)
 	return sbi_hsm_hart_start(hartid, boot_addr, hsm_data);
 }
 
-static int sbi_cpu_prepare(unsigned int cpuid)
-{
-	if (!cpu_ops_sbi.cpu_start) {
-		pr_err("cpu start method not defined for CPU [%d]\n", cpuid);
-		return -ENODEV;
-	}
-	return 0;
-}
-
 #ifdef CONFIG_HOTPLUG_CPU
-static int sbi_cpu_disable(unsigned int cpuid)
-{
-	if (!cpu_ops_sbi.cpu_stop)
-		return -EOPNOTSUPP;
-	return 0;
-}
-
 static void sbi_cpu_stop(void)
 {
 	int ret;
@@ -118,11 +102,8 @@ static int sbi_cpu_is_stopped(unsigned int cpuid)
 #endif
 
 const struct cpu_operations cpu_ops_sbi = {
-	.name		= "sbi",
-	.cpu_prepare	= sbi_cpu_prepare,
 	.cpu_start	= sbi_cpu_start,
 #ifdef CONFIG_HOTPLUG_CPU
-	.cpu_disable	= sbi_cpu_disable,
 	.cpu_stop	= sbi_cpu_stop,
 	.cpu_is_stopped	= sbi_cpu_is_stopped,
 #endif
diff --git a/arch/riscv/kernel/cpu_ops_spinwait.c b/arch/riscv/kernel/cpu_ops_spinwait.c
index d98d19226b5f..613872b0a21a 100644
--- a/arch/riscv/kernel/cpu_ops_spinwait.c
+++ b/arch/riscv/kernel/cpu_ops_spinwait.c
@@ -39,15 +39,6 @@ static void cpu_update_secondary_bootdata(unsigned int cpuid,
 	WRITE_ONCE(__cpu_spinwait_task_pointer[hartid], tidle);
 }
 
-static int spinwait_cpu_prepare(unsigned int cpuid)
-{
-	if (!cpu_ops_spinwait.cpu_start) {
-		pr_err("cpu start method not defined for CPU [%d]\n", cpuid);
-		return -ENODEV;
-	}
-	return 0;
-}
-
 static int spinwait_cpu_start(unsigned int cpuid, struct task_struct *tidle)
 {
 	/*
@@ -64,7 +55,5 @@ static int spinwait_cpu_start(unsigned int cpuid, struct task_struct *tidle)
 }
 
 const struct cpu_operations cpu_ops_spinwait = {
-	.name		= "spinwait",
-	.cpu_prepare	= spinwait_cpu_prepare,
 	.cpu_start	= spinwait_cpu_start,
 };
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index b77397432403..0349e5cdfe1d 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -11,7 +11,6 @@
 #include <asm/page.h>
 #include <asm/pgtable.h>
 #include <asm/csr.h>
-#include <asm/cpu_ops_sbi.h>
 #include <asm/hwcap.h>
 #include <asm/image.h>
 #include <asm/scs.h>
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 535a837de55d..2bf882804624 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -26,7 +26,6 @@
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
-#include <asm/cpu_ops.h>
 #include <asm/early_ioremap.h>
 #include <asm/pgtable.h>
 #include <asm/setup.h>
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 1c68e61fb852..5551945255cd 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -49,7 +49,6 @@ void __init smp_prepare_boot_cpu(void)
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
 	int cpuid;
-	int ret;
 	unsigned int curr_cpuid;
 
 	init_cpu_topology();
@@ -66,11 +65,6 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	for_each_possible_cpu(cpuid) {
 		if (cpuid == curr_cpuid)
 			continue;
-		if (cpu_ops[cpuid]->cpu_prepare) {
-			ret = cpu_ops[cpuid]->cpu_prepare(cpuid);
-			if (ret)
-				continue;
-		}
 		set_cpu_present(cpuid, true);
 		numa_store_cpu_info(cpuid);
 	}
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
