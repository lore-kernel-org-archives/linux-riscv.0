Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FE5CA0FED
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 16:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rd95QzP47SbJRLc55wPj0CfKwwdQ5jBTDr/4Z9oHyYA=; b=uD8Sf+3xGTiNIe
	kL+Csi2M+SWgSvOsYOV/k1KO2pUn0R9VwvcWZJHerKFl7PIqXDknttiam9DjTBdPDSGmTrmE7Mrh8
	O0Pwda4S2y9mlYup+6ZIKTcEQwBz1K4sLXiWvmEj0s9UAO16YEOQ4o3M3OGcYxcuTEKJlrI4SANVo
	Z5u2rvpBOazvmOmN13zGlXbxFlVj53fy0Q8buuN2D9ukctzk3mqV/uFAqlE0d3kD6ulMfC4QMWJpS
	nWaNZREZFRek3gahbFzgsyv9fLsuUY0YjYOA5VSppJgNmmSGPSsqt+uFnpefxfyOR9T30zhy/KEu7
	VcHRQvxuI6XKOlcUcHKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYsG-00000002xWq-2wje;
	Fri, 05 Sep 2025 16:01:16 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuVVP-00000001g1j-2SAo
	for linux-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 12:25:28 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-24c7848519bso19828685ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 Sep 2025 05:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1757075126; x=1757679926; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lt3wTba5HiLB1Jjnt9R6GaWmJOoFQXkQR++gb9ZWNVM=;
        b=EZrUtqUwyuf71T8tEyKN6TFp68u9nVzCs+mGBE/ueEmgSqapESjFX3QlA6YuwMioyb
         HkZm5z32mQy3RuUKUG0SJS/Kqx88jC0hUwc9v3YvyxIz67H/fwuPhO4NugNszI3eVrC3
         WfUXvB0N+xTH5SPgu/+meRGnFDzTzadgKaw395cGME59ItCYsFpmOmHgwm9tRkYKTsSg
         RaVwwSjEiXC3D0OikwVQ+Slg+DglyR+VlioEel2WnihQMf6ZndFAcFDU0Iz2CTCW5YxC
         TJlYsUISEOt3qbwq1BaSqs9Vtn+RrLCVpM2Man4fmCkgkBMLXpt5WE4qOqE2ZNjR5Tqi
         KvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757075126; x=1757679926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lt3wTba5HiLB1Jjnt9R6GaWmJOoFQXkQR++gb9ZWNVM=;
        b=FE9ETqiypPK+0tlwsjE4CBIUa6Ob3nrJb+K+2G6rdCI/K2xzciqrGG7DV7pusBrD59
         NMEW/Kc7zpSfAdDgKDzOToF9xFV0ZqqcNEI2CYPPYsZMIVqCcOxz3vMrl2ncxvhr2Y6H
         zTbOTD8ikvRGlBhXa6hjIq9SrVbfJFprV6PmgVYaNADd11a856+SMIHTdsMZL1u3KCQD
         nWNwhw5OHZsE0vuGlHyymSBEdDof58uYgFBhFjOCGocTrS6k6EVn+MYh38kIoDJcIoS/
         rPozQuNuLw7kQ+gEs6cjotv0ZySfbnmNbZOkdW0yRhZ0BQijO9wyyL//6oHq7yDUQuv0
         qINw==
X-Forwarded-Encrypted: i=1; AJvYcCVP+FAPbNYJNR4lwhM95cl44HqmDarhPfxBeM5s07jqOaQoUTDgP7A4K12GdJ5GUhEk5jT9rvwGnWeyZw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxucIesirmMFfTPyYdCFXqi9s5ClAEirIlb5eo70CFuALxKp1zP
	cqdXSMt1OMAJG8V4JuRakGWwRXviyTmv++nkdwmFz5/e1LAuxQtOYATA6Crb5XQYlbI=
X-Gm-Gg: ASbGnctXVK+LsZxFL8jNwnygRyt4jILE9FntY480LIViWgaagYq8Wje/COjZkX7CNAq
	iymjlHAqGgPoxRLVgfsfn1eeY4ttKnS6ANSrUzIeKdu+Wvo5486WlTuBgB6iwHMxfXK1K+HZKWk
	1jawOXY3brvhLHv6CXZFVKO70K1uQUY+TFV87eaLQXLJZnscgByLQI3qb9ISeUHsa9SCW0mi15J
	g9StN48klVdt1wSQ8auY7mSbzuz7RQ97AiNmtJWrgjmm/Gwh1HlYheSLIG+SJYQHTvXdIe/vec2
	9VW2Tp2chsURKT9AX7KlN3aFWEk2Vdy3S5pFcpwlevL2RAgaXAZZmKdoDJATScSGC2+sIuM/dQP
	X8WVtpF5XbGpI8WGlDEjWYPaMPRtYYr+TjkninaBvzz2CypaImTZWYw==
X-Google-Smtp-Source: AGHT+IHis+PqALG8tubNoGDFf9m6dFRkq8Qrsc4cRLOgmsEFTlFHoYeOzdbeXp8E6o75X+gtKjjeRA==
X-Received: by 2002:a17:903:28c:b0:249:1213:6725 with SMTP id d9443c01a7336-24944aef6f6mr275376745ad.50.1757075126264;
        Fri, 05 Sep 2025 05:25:26 -0700 (PDT)
Received: from localhost.localdomain ([122.171.19.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cb6f17a2dsm48367725ad.75.2025.09.05.05.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 05:25:25 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH] RISC-V: Enable HOTPLUG_PARALLEL for secondary CPUs
Date: Fri,  5 Sep 2025 17:55:12 +0530
Message-ID: <20250905122512.71684-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_052527_625002_06C050FD 
X-CRM114-Status: GOOD (  13.12  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The core kernel already supports parallel bringup of secondary
CPUs (aka HOTPLUG_PARALLEL). The x86 and MIPS architectures
already use HOTPLUG_PARALLEL and ARM is also moving toward it.

On RISC-V, there is no arch specific global data accessed in the
RISC-V secondary CPU bringup path so enabling HOTPLUG_PARALLEL for
RISC-V would only requires:
1) Providing RISC-V specific arch_cpuhp_kick_ap_alive()
2) Calling cpuhp_ap_sync_alive() from smp_callin()

This patch is tested natively with OpenSBI on QEMU RV64 virt machine
with 64 cores and also tested with KVM RISC-V guest with 32 VCPUs.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/Kconfig          |  2 +-
 arch/riscv/kernel/smpboot.c | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a4b233a0659e..d5800d6f9a15 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -196,7 +196,7 @@ config RISCV
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
-	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
+	select HOTPLUG_PARALLEL if HOTPLUG_CPU
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
 	select KASAN_VMALLOC if KASAN
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 601a321e0f17..d85916a3660c 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -39,7 +39,9 @@
 
 #include "head.h"
 
+#ifndef CONFIG_HOTPLUG_PARALLEL
 static DECLARE_COMPLETION(cpu_running);
+#endif
 
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
@@ -179,6 +181,12 @@ static int start_secondary_cpu(int cpu, struct task_struct *tidle)
 	return -EOPNOTSUPP;
 }
 
+#ifdef CONFIG_HOTPLUG_PARALLEL
+int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *tidle)
+{
+	return start_secondary_cpu(cpu, tidle);
+}
+#else
 int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 {
 	int ret = 0;
@@ -199,6 +207,7 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 
 	return ret;
 }
+#endif
 
 void __init smp_cpus_done(unsigned int max_cpus)
 {
@@ -225,6 +234,10 @@ asmlinkage __visible void smp_callin(void)
 	mmgrab(mm);
 	current->active_mm = mm;
 
+#ifdef CONFIG_HOTPLUG_PARALLEL
+	cpuhp_ap_sync_alive();
+#endif
+
 	store_cpu_topology(curr_cpuid);
 	notify_cpu_starting(curr_cpuid);
 
@@ -243,7 +256,9 @@ asmlinkage __visible void smp_callin(void)
 	 */
 	local_flush_icache_all();
 	local_flush_tlb_all();
+#ifndef CONFIG_HOTPLUG_PARALLEL
 	complete(&cpu_running);
+#endif
 	/*
 	 * Disable preemption before enabling interrupts, so we don't try to
 	 * schedule a CPU that hasn't actually started yet.
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
