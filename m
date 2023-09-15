Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD9BEED61E
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 18:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lpDCQCbBewtDW//JIPJJP2csKBT4glk4S1U4RTcO/jc=; b=nuW/GzVnI3f8RO
	Puv7dweFEgnsV3lqPJOwVCSUjsrU+kOxEqydLtlxtob3fCi5mNnKNj/VdpGaaJ8FjJRQEHm87MLDL
	4hv/LXy7Zw7XsEn8qbCxwNyECzNSdvanupDECmhEIh22gweGP+fmdZCEjl9pCLtZIDrepo4B8wwlC
	dr7bQNTBoDo5/4nmLGa45b/MxhqLbskioHwSwT1QbARrkiXFroxjgIc5euoSMkRFmGxKoerVzwtDS
	RfC1dt9ZsyAP71Dd9sbHBozoVVl1INOxx+vZpqXy3WfDq0ohY6DXYrTa7pyKp01rE/++wDEGJUnRL
	kQnx9yLfnOCmupUSohcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhDsu-00BDpw-2V;
	Fri, 15 Sep 2023 18:49:44 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhDss-00BDpY-0S
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 18:49:43 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2745cd2ba68so2014183a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 11:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694803780; x=1695408580; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uYSmTOF4KYS04RS6/kkM9Rhx+w8lvbwAPz9Fg6XUkeE=;
        b=v15QZ+kmikU0TT0Mg5s3yXM3tMmEaQ7PipxV5HXC09ar74Lsf8i4JBwl/fUWw1dcMe
         RVbF/M2bxbN/3C5czZEbTA3vzHlpomog1kI0BFOTDFedkd43NOqu3AFmovPQ0i1a0xE0
         0kAObx76aS1XepWNYNmw6V333jCovjumAjQDrdl0/PJSK1Kr7SF7r1vJJGuSy2ohiu9d
         yOX8fq1Qr4fVJQNzXHonGL+f9dWv02K5wRfuvQzgSrtj2eHxj3jFrhkzDOGXBw0cWTIN
         WNxTWe/xmOGgytADx+ktK+nofMgF34JW6hCDpUEwvG0moLc98HwiOUzxocV1BUpv7IzN
         2Uaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694803780; x=1695408580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uYSmTOF4KYS04RS6/kkM9Rhx+w8lvbwAPz9Fg6XUkeE=;
        b=H+qVe1gVVBMJ0sh1LCEUtmQI/JvO8yY4vV/pBUqbx6/UhceupfhdvD4ytB1FNHcqVV
         EXNqHdKqVUfftTfjHYKwM9qIYRCXRdgErCp96f82r7EDb85Nzt3eCBpVlzjWRxZFcuO9
         5F+zdBjrVSN/9rSfa2NpuOWhsAFEj0qNuHCbCxBPVWRtOgZimeVKQlZsnVp0s01f9gtm
         5HrAfAmPL1WXlTBHdJdSm6QV375aUIl6LRllsworLKLYnuGX5dQ8vNW1pK2rf9gKUcZM
         pHc7Wg/+f+b5rnnsZp0u9gWjTaGyKEgo74g36jvRs2JGQHc1ZZZazUOb8w7/nOP6JDZI
         nqjA==
X-Gm-Message-State: AOJu0Yx7FCvj1jhTLYcD4379eumPdaTRQKJff6co8iGw88wfTjCOH/y4
	kylELNSzoHNJ26bMESaByCmiclGH86dzNEpANHM=
X-Google-Smtp-Source: AGHT+IGL1HqMkQEx+0inVSPfre6GGNigTDq3ef/4CTrXmyvJ3uVn8SIT88LCmaonmmg+jb/AZHsXww==
X-Received: by 2002:a17:90a:c913:b0:268:1d1e:baaf with SMTP id v19-20020a17090ac91300b002681d1ebaafmr2542117pjt.17.1694803780056;
        Fri, 15 Sep 2023 11:49:40 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id o6-20020a17090ad24600b00268188ea4b9sm3397849pjw.19.2023.09.15.11.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 11:49:39 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH] RISC-V: Probe misaligned access speed in parallel
Date: Fri, 15 Sep 2023 11:49:03 -0700
Message-Id: <20230915184904.1976183-1-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_114942_183115_F672714A 
X-CRM114-Status: GOOD (  18.18  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, Evan Green <evan@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Probing for misaligned access speed takes about 0.06 seconds. On a
system with 64 cores, doing this in smp_callin() means it's done
serially, extending boot time by 3.8 seconds. That's a lot of boot time.

Instead of measuring each CPU serially, let's do the measurements on
all CPUs in parallel. If we disable preemption on all CPUs, the
jiffies stop ticking, so we can do this in stages of 1) everybody
except core 0, then 2) core 0.

The measurement call in smp_callin() stays around, but is now
conditionalized to only run if a new CPU shows up after the round of
in-parallel measurements has run. The goal is to have the measurement
call not run during boot or suspend/resume, but only on a hotplug
addition.

Signed-off-by: Evan Green <evan@rivosinc.com>

---

Jisheng, I didn't add your Tested-by tag since the patch evolved from
the one you tested. Hopefully this one brings you the same result.

---
 arch/riscv/include/asm/cpufeature.h |  3 ++-
 arch/riscv/kernel/cpufeature.c      | 28 +++++++++++++++++++++++-----
 arch/riscv/kernel/smpboot.c         | 11 ++++++++++-
 3 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index d0345bd659c9..19e7817eba10 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -30,6 +30,7 @@ DECLARE_PER_CPU(long, misaligned_access_speed);
 /* Per-cpu ISA extensions. */
 extern struct riscv_isainfo hart_isa[NR_CPUS];
 
-void check_unaligned_access(int cpu);
+extern bool misaligned_speed_measured;
+int check_unaligned_access(void *unused);
 
 #endif
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1cfbba65d11a..8eb36e1dfb95 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -42,6 +42,9 @@ struct riscv_isainfo hart_isa[NR_CPUS];
 /* Performance information */
 DEFINE_PER_CPU(long, misaligned_access_speed);
 
+/* Boot-time in-parallel unaligned access measurement has occurred. */
+bool misaligned_speed_measured;
+
 /**
  * riscv_isa_extension_base() - Get base extension word
  *
@@ -556,8 +559,9 @@ unsigned long riscv_get_elf_hwcap(void)
 	return hwcap;
 }
 
-void check_unaligned_access(int cpu)
+int check_unaligned_access(void *unused)
 {
+	int cpu = smp_processor_id();
 	u64 start_cycles, end_cycles;
 	u64 word_cycles;
 	u64 byte_cycles;
@@ -571,7 +575,7 @@ void check_unaligned_access(int cpu)
 	page = alloc_pages(GFP_NOWAIT, get_order(MISALIGNED_BUFFER_SIZE));
 	if (!page) {
 		pr_warn("Can't alloc pages to measure memcpy performance");
-		return;
+		return 0;
 	}
 
 	/* Make an unaligned destination buffer. */
@@ -643,15 +647,29 @@ void check_unaligned_access(int cpu)
 
 out:
 	__free_pages(page, get_order(MISALIGNED_BUFFER_SIZE));
+	return 0;
+}
+
+static void check_unaligned_access_nonboot_cpu(void *param)
+{
+	if (smp_processor_id() != 0)
+		check_unaligned_access(param);
 }
 
-static int check_unaligned_access_boot_cpu(void)
+static int check_unaligned_access_all_cpus(void)
 {
-	check_unaligned_access(0);
+	/* Check everybody except 0, who stays behind to tend jiffies. */
+	on_each_cpu(check_unaligned_access_nonboot_cpu, NULL, 1);
+
+	/* Check core 0. */
+	smp_call_on_cpu(0, check_unaligned_access, NULL, true);
+
+	/* Boot-time measurements are complete. */
+	misaligned_speed_measured = true;
 	return 0;
 }
 
-arch_initcall(check_unaligned_access_boot_cpu);
+arch_initcall(check_unaligned_access_all_cpus);
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
 /*
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 1b8da4e40a4d..39322ae20a75 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -27,6 +27,7 @@
 #include <linux/sched/mm.h>
 #include <asm/cpu_ops.h>
 #include <asm/cpufeature.h>
+#include <asm/hwprobe.h>
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
 #include <asm/numa.h>
@@ -246,7 +247,15 @@ asmlinkage __visible void smp_callin(void)
 
 	numa_add_cpu(curr_cpuid);
 	set_cpu_online(curr_cpuid, 1);
-	check_unaligned_access(curr_cpuid);
+
+	/*
+	 * Boot-time misaligned access speed measurements are done in parallel
+	 * in an initcall. Only measure here for hotplug.
+	 */
+	if (misaligned_speed_measured &&
+	    (per_cpu(misaligned_access_speed, curr_cpuid) == RISCV_HWPROBE_MISALIGNED_UNKNOWN)) {
+		check_unaligned_access(NULL);
+	}
 
 	if (has_vector()) {
 		if (riscv_v_setup_vsize())
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
