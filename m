Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67910C04FF1
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 19:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JFUt7V/gh1taxSee1DNl4tzKJXLMFzPr7BIsSKTSHKk=; b=E/Ko5X3smgawpT
	TVET+CJp1n1OzLnCEYer7G8SZeOx8cnjPzfvevouV2gBxN/+NJJrQYV9IIhYz1A7r2OycbBZJw1gj
	sTBOnvKjIC6C/fMPYlvy1949nnECsohvjya9NRCvEFZy0MNXE34Bme5uV8B6xZJCwdVTgtxiSGhuC
	yVHfYv3Rc/YJLSKNIPwImSO2h77gT66aM61eFar6hfHiz/pRTP8z7iLQjc2BGCjOtcSMHocdmjgj/
	lz6j6WoZ+Y92cCXq7gkN5bf577djZayeLjJk9ilcxiohNGEHDDNpY3+CP5xqu3gBxHHyDNbwmoLid
	rqA4NmrABwazlz7t3hdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qj31h-0042Ar-2q;
	Wed, 20 Sep 2023 19:38:21 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qj31e-0042A5-0J
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 19:38:20 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-276c0163e7dso71592a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 12:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695238696; x=1695843496; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=39pvP98AoIFjGXMcEMP3U5n+E4U9Aq4ivPpQhUdCDI4=;
        b=MN/V/js4KyMlBGkz3nvngkxQO5AbaZcFDbmyr187u8y1kQNA8X000O9twOlvsCGjg2
         Pgs+K7cm2R46hnb+IVZfI0FwViILTi+fYxlBqu8WMF+iBAT67YQvPFtm6yG53YJFsa5c
         J1jJSt8ZPhFTduu1namuRMa2jf+d7sR12NxUNTRt6EOIV+2Dq+1wR8Bgyr73Ecvn2es0
         A1CI7qZ68OqUEcqM0ccMZnNjE4b2CI/+akkgIMkW6HCrvtd20DYtTXIfo/qoTsVYmYkG
         eF//Zt4qhfrJ0B5IiRn/eRlNeA59KYySNHspuDmvL9mDvEg5DdqISV7bC6Zfghodl0P8
         a+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695238696; x=1695843496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=39pvP98AoIFjGXMcEMP3U5n+E4U9Aq4ivPpQhUdCDI4=;
        b=PJXD5XbVMj7EVmF7mBg3i5bTSWplXeitTXPutQVtW5G9wcEraJmYLrRqativ4AaB8J
         uzb4cl9T9U7gBefEjST2QSFvxdx2DQTW42ZH8BDyM1ztTb+EOz0pS2hauJ2Onfe8Jfg2
         F+U9/2WbYUZPh38W31TUMihjuClCLkKkdYYZGaeMc5U2lIfXRR03/7ra2w5usQBtDt6O
         gM6zrJDBpv3t9pxcANbO/a5STVScEyfCIkgQiy+FqQJeihk+O2ZJTQPfv3GS3HU68sX/
         +dIXygCX/B65561de3rwpblD9o6PsAX82ojgaTIF+bvrHCsxWSZpPNs88zUS+79MW4QD
         WNlQ==
X-Gm-Message-State: AOJu0YwW3pZvWCq7xQ0yo+QST8EYKvP5M2IPFWj5g38qr/EEoWX8Ln9t
	olc3E1kACGg59Ay+m35B1Q8wZA==
X-Google-Smtp-Source: AGHT+IFiT/s35Hen/GbTyCXs8Du2zExU1YXL3rbivM6LSR8Rhrc2NrfvfDY5uDT1M3CHbv4LWllWmA==
X-Received: by 2002:a17:90a:bd0a:b0:274:694c:167d with SMTP id y10-20020a17090abd0a00b00274694c167dmr3593378pjr.5.1695238696031;
        Wed, 20 Sep 2023 12:38:16 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id 10-20020a17090a19ca00b0026b50d9aee6sm1819606pjj.25.2023.09.20.12.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 12:38:15 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v2] RISC-V: Probe misaligned access speed in parallel
Date: Wed, 20 Sep 2023 12:38:01 -0700
Message-Id: <20230920193801.3035093-1-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_123818_384290_F892A50B 
X-CRM114-Status: GOOD (  17.55  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, Evan Green <evan@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
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

Reported-by: Jisheng Zhang <jszhang@kernel.org>
Closes: https://lore.kernel.org/all/mhng-9359993d-6872-4134-83ce-c97debe1cf9a@palmer-ri-x1c9/T/#mae9b8f40016f9df428829d33360144dc5026bcbf
Fixes: 584ea6564bca ("RISC-V: Probe for unaligned access speed")
Signed-off-by: Evan Green <evan@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Tested-by: Andrew Jones <ajones@ventanamicro.com>

---

Changes in v2:
 - Removed new global, used system_state == SYSTEM_RUNNING instead
   (Jisheng)
 - Added tags

 arch/riscv/include/asm/cpufeature.h |  2 +-
 arch/riscv/kernel/cpufeature.c      | 22 +++++++++++++++++-----
 arch/riscv/kernel/smpboot.c         | 11 ++++++++++-
 3 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index d0345bd659c9..b139796392d0 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -30,6 +30,6 @@ DECLARE_PER_CPU(long, misaligned_access_speed);
 /* Per-cpu ISA extensions. */
 extern struct riscv_isainfo hart_isa[NR_CPUS];
 
-void check_unaligned_access(int cpu);
+int check_unaligned_access(void *unused);
 
 #endif
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1cfbba65d11a..40bb854fcb96 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -556,8 +556,9 @@ unsigned long riscv_get_elf_hwcap(void)
 	return hwcap;
 }
 
-void check_unaligned_access(int cpu)
+int check_unaligned_access(void *unused)
 {
+	int cpu = smp_processor_id();
 	u64 start_cycles, end_cycles;
 	u64 word_cycles;
 	u64 byte_cycles;
@@ -571,7 +572,7 @@ void check_unaligned_access(int cpu)
 	page = alloc_pages(GFP_NOWAIT, get_order(MISALIGNED_BUFFER_SIZE));
 	if (!page) {
 		pr_warn("Can't alloc pages to measure memcpy performance");
-		return;
+		return 0;
 	}
 
 	/* Make an unaligned destination buffer. */
@@ -643,15 +644,26 @@ void check_unaligned_access(int cpu)
 
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
 	return 0;
 }
 
-arch_initcall(check_unaligned_access_boot_cpu);
+arch_initcall(check_unaligned_access_all_cpus);
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
 /*
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 1b8da4e40a4d..a014955b8699 100644
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
+	if ((system_state == SYSTEM_RUNNING) &&
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
