Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC31C05027
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 18:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZLTQKVsjdYR88Gc27zpUTntrnaF6RtnFNY5hX3Oo8k=; b=FR2oVI7uZIAKiQ
	6vV/1mbeJ5m/gMA/nLEGP9FMx3Z9+84hz0nG0DSH+THVE1SdvvR1W16m4akiI7b6VeYokWTU+q4Wy
	QRr/nGyRjH8omXGDfcvJraHlNnMo7ujJXbFOLT2hBw0iUuuHXzHMD1DN7fSdgp8QyRlD/Ay7tmb6g
	jfdX4scCIMdBBuJgFgTiYORNL5NpV5HFIqTA7aHPzDIpYLRl7MBmMs2Eqo6ro1OGLRxg98kDs+zZz
	jpeElnMlESE/oQuRWzT3EdanDx3hOZ3P1dvUaSfgq48zxqZXzvnkeDkwpYRWoK6UpOpg/i2hkg/t6
	E8VmSligv42lWxyloG9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc9SA-00BCPO-2Z;
	Tue, 14 Mar 2023 18:32:54 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc9S4-00BCHU-1T
	for linux-riscv@lists.infradead.org;
	Tue, 14 Mar 2023 18:32:52 +0000
Received: by mail-pl1-x631.google.com with SMTP id v21so7437706ple.9
        for <linux-riscv@lists.infradead.org>; Tue, 14 Mar 2023 11:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678818768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKTjl3uMnu6bKpkbPPZuKBQ5mmKPjtDK6wHW5Zya6zw=;
        b=39YY02HqSJn+6mUv2/JWrTbXr/QuCXFqwwq4KpWilvQ17c6oM5SFIHSqw7qNcQikul
         Cq6qqNqCXlKGtDijf3gQvF48xXDO4BcTn0ldNXqVRuDQYaJ2dNqpT94Z0WskSsc9wHbw
         WMcJB/FbEvCFg+RTEx6j80CllH/jY9++BqJIuqxIPUC6ep1GzZKflbBa7udPGjSLeZAm
         PRemcyNRZM5qi6Gdx3ehAwQx5Ii5tpP1vbBTNwHrZgNJ6zHSee0J+i1SZAlo18E7/kYB
         uv+AJ1SGlh/S4pAUEXFTWtWQFL+OLsM9cwy9zZpfd91TYG5FespyxNJgL5Rj9v1tCp1d
         gkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678818768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QKTjl3uMnu6bKpkbPPZuKBQ5mmKPjtDK6wHW5Zya6zw=;
        b=SUsuGFw0CnvdRXMo+49C8Hqtxd4qQTiU8jiObVBiFH+LjZeESzi5BzQJ5TquCGHBGr
         PbtGi7TeU30z2SS3N4yDJ56CPlT8RI0gOMS8eiKR7vAFM6HlgzF06aGnlxet55btDW7X
         8Im5syh7rjnYC7W1aRK8OGxQMpDEXpF+cABm6KRpbozZ4VBzuP+55pp95QrhUR/61hVP
         GvpmiDKQcDqI+rimXFN0I+Sj60GgMkHeptJfZIm7SjPWfbJf6cHiso1lPyUICzTEn5Fv
         jWcFhzf5oiD5RIJgMeMQH6JhG3yI9Vz69395abxhGIijF5hjyB5Xxfx8JFsvPt28sGOm
         S6lw==
X-Gm-Message-State: AO0yUKV7TaV7QUzCrOV6Tw2ubQskKCcy0iIGqn5ejHHe6vuDGsIw0/c+
	unt3pZV/leDh1Z08QsPNDzosCA==
X-Google-Smtp-Source: AK7set+ry6vHcj3C81Rix70L4IbdTgGhEeKDGXvyF/M7BBOHf56MAKJDt0fcqjyPN/zr2uWing1KqA==
X-Received: by 2002:a17:902:d4cf:b0:19e:500b:517a with SMTP id o15-20020a170902d4cf00b0019e500b517amr45847871plg.69.1678818768035;
        Tue, 14 Mar 2023 11:32:48 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id kn3-20020a170903078300b0019d397b0f18sm2072019plb.214.2023.03.14.11.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 11:32:47 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v4 4/6] RISC-V: hwprobe: Support probing of misaligned access performance
Date: Tue, 14 Mar 2023 11:32:18 -0700
Message-Id: <20230314183220.513101-5-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314183220.513101-1-evan@rivosinc.com>
References: <20230314183220.513101-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_113250_637258_FDA698D5 
X-CRM114-Status: GOOD (  26.33  )
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
Cc: heiko@sntech.de, linux-doc@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Celeste Liu <coelacanthus@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Tsukasa OI <research_trasio@irq.a4lg.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, vineetg@rivosinc.com, Philipp Tomsich <philipp.tomsich@vrull.eu>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, slewis@rivosinc.com, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sudeep Holla <sudeep.holla@arm.com>, Guo Ren <guoren@kernel.org>, Wei Fu <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This allows userspace to select various routines to use based on the
performance of misaligned access on the target hardware.

Co-developed-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Evan Green <evan@rivosinc.com>

---

Changes in v4:
 - Add newlines to CPUPERF_0 documentation (Conor)
 - Add UNSUPPORTED value (Conor)
 - Switched from DT to alternatives-based probing (Rob)
 - Crispen up cpu index type to always be int (Conor)

Changes in v3:
 - Have hwprobe_misaligned return int instead of long.
 - Constify cpumask pointer in hwprobe_misaligned()
 - Fix warnings in _PERF_O list documentation, use :c:macro:.
 - Move include cpufeature.h to misaligned patch.
 - Fix documentation mismatch for RISCV_HWPROBE_KEY_CPUPERF_0 (Conor)
 - Use for_each_possible_cpu() instead of NR_CPUS (Conor)
 - Break early in misaligned access iteration (Conor)
 - Increase MISALIGNED_MASK from 2 bits to 3 for possible UNSUPPORTED future
   value (Conor)

Changes in v2:
 - Fixed logic error in if(of_property_read_string...) that caused crash
 - Include cpufeature.h in cpufeature.h to avoid undeclared variable
   warning.
 - Added a _MASK define
 - Fix random checkpatch complaints

 Documentation/riscv/hwprobe.rst       | 21 ++++++++++++++++++++
 arch/riscv/errata/thead/errata.c      |  9 +++++++++
 arch/riscv/include/asm/alternative.h  |  5 +++++
 arch/riscv/include/asm/cpufeature.h   |  2 ++
 arch/riscv/include/asm/hwprobe.h      |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h |  7 +++++++
 arch/riscv/kernel/alternative.c       | 19 ++++++++++++++++++
 arch/riscv/kernel/cpufeature.c        |  3 +++
 arch/riscv/kernel/smpboot.c           |  1 +
 arch/riscv/kernel/sys_riscv.c         | 28 +++++++++++++++++++++++++++
 10 files changed, 96 insertions(+), 1 deletion(-)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index 945d44683c40..9f0dd62dcb5d 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -63,3 +63,24 @@ The following keys are defined:
 
   * :c:macro:`RISCV_HWPROBE_IMA_C`: The C extension is supported, as defined
     by version 2.2 of the RISC-V ISA manual.
+
+* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
+  information about the selected set of processors.
+
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of misaligned
+    accesses is unknown.
+
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_EMULATED`: Misaligned accesses are
+    emulated via software, either in or below the kernel.  These accesses are
+    always extremely slow.
+
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned accesses are supported
+    in hardware, but are slower than the cooresponding aligned accesses
+    sequences.
+
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned accesses are supported
+    in hardware and are faster than the cooresponding aligned accesses
+    sequences.
+
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned accesses are
+    not supported at all and will generate a misaligned address fault.
diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index fac5742d1c1e..f41a45af5607 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -10,7 +10,9 @@
 #include <linux/uaccess.h>
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
+#include <asm/cpufeature.h>
 #include <asm/errata_list.h>
+#include <asm/hwprobe.h>
 #include <asm/patch.h>
 #include <asm/vendorid_list.h>
 
@@ -108,3 +110,10 @@ void __init_or_module thead_errata_patch_func(struct alt_entry *begin, struct al
 	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
 		local_flush_icache_all();
 }
+
+void thead_feature_probe_func(unsigned int cpu, unsigned long archid,
+			      unsigned long impid)
+{
+	if ((archid == 0) && (impid == 0))
+		per_cpu(misaligned_access_speed, cpu) = RISCV_HWPROBE_MISALIGNED_FAST;
+}
diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index 6511dd73e812..7be6d4c6a27d 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -23,6 +23,7 @@
 #define RISCV_ALTERNATIVES_MODULE	1 /* alternatives applied during module-init */
 #define RISCV_ALTERNATIVES_EARLY_BOOT	2 /* alternatives applied before mmu start */
 
+void probe_vendor_features(unsigned int cpu);
 void __init apply_boot_alternatives(void);
 void __init apply_early_boot_alternatives(void);
 void apply_module_alternatives(void *start, size_t length);
@@ -47,11 +48,15 @@ void thead_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 			     unsigned long archid, unsigned long impid,
 			     unsigned int stage);
 
+void thead_feature_probe_func(unsigned int cpu, unsigned long archid,
+			      unsigned long impid);
+
 void riscv_cpufeature_patch_func(struct alt_entry *begin, struct alt_entry *end,
 				 unsigned int stage);
 
 #else /* CONFIG_RISCV_ALTERNATIVE */
 
+static inline void probe_vendor_features(unsigned int cpu) { }
 static inline void apply_boot_alternatives(void) { }
 static inline void apply_early_boot_alternatives(void) { }
 static inline void apply_module_alternatives(void *start, size_t length) { }
diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 66ebaae449c8..808d5403f2ac 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -18,4 +18,6 @@ struct riscv_cpuinfo {
 
 DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 
+DECLARE_PER_CPU(long, misaligned_access_speed);
+
 #endif
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 7e52f1e1fe10..4e45e33015bc 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,6 +8,6 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 4
+#define RISCV_HWPROBE_MAX_KEY 5
 
 #endif
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index fc5665411782..2968bb0984b5 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -25,6 +25,13 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
 #define		RISCV_HWPROBE_IMA_FD		(1 << 0)
 #define		RISCV_HWPROBE_IMA_C		(1 << 1)
+#define RISCV_HWPROBE_KEY_CPUPERF_0	5
+#define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
+#define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
+#define		RISCV_HWPROBE_MISALIGNED_SLOW		(2 << 0)
+#define		RISCV_HWPROBE_MISALIGNED_FAST		(3 << 0)
+#define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
+#define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 #endif
diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index a7d26a00beea..522d3d11e0c3 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -23,6 +23,8 @@ struct cpu_manufacturer_info_t {
 	void (*patch_func)(struct alt_entry *begin, struct alt_entry *end,
 				  unsigned long archid, unsigned long impid,
 				  unsigned int stage);
+	void (*feature_probe_func)(unsigned int cpu, unsigned long archid,
+				   unsigned long impid);
 };
 
 static void __init_or_module riscv_fill_cpu_mfr_info(struct cpu_manufacturer_info_t *cpu_mfr_info)
@@ -37,6 +39,7 @@ static void __init_or_module riscv_fill_cpu_mfr_info(struct cpu_manufacturer_inf
 	cpu_mfr_info->imp_id = sbi_get_mimpid();
 #endif
 
+	cpu_mfr_info->feature_probe_func = NULL;
 	switch (cpu_mfr_info->vendor_id) {
 #ifdef CONFIG_ERRATA_SIFIVE
 	case SIFIVE_VENDOR_ID:
@@ -46,6 +49,7 @@ static void __init_or_module riscv_fill_cpu_mfr_info(struct cpu_manufacturer_inf
 #ifdef CONFIG_ERRATA_THEAD
 	case THEAD_VENDOR_ID:
 		cpu_mfr_info->patch_func = thead_errata_patch_func;
+		cpu_mfr_info->feature_probe_func = thead_feature_probe_func;
 		break;
 #endif
 	default:
@@ -53,6 +57,20 @@ static void __init_or_module riscv_fill_cpu_mfr_info(struct cpu_manufacturer_inf
 	}
 }
 
+/* Called on each CPU as it starts */
+void probe_vendor_features(unsigned int cpu)
+{
+	struct cpu_manufacturer_info_t cpu_mfr_info;
+
+	riscv_fill_cpu_mfr_info(&cpu_mfr_info);
+	if (!cpu_mfr_info.feature_probe_func)
+		return;
+
+	cpu_mfr_info.feature_probe_func(cpu,
+					cpu_mfr_info.arch_id,
+					cpu_mfr_info.imp_id);
+}
+
 /*
  * This is called very early in the boot process (directly after we run
  * a feature detect on the boot CPU). No need to worry about other CPUs
@@ -82,6 +100,7 @@ void __init apply_boot_alternatives(void)
 	/* If called on non-boot cpu things could go wrong */
 	WARN_ON(smp_processor_id() != 0);
 
+	probe_vendor_features(0);
 	_apply_alternatives((struct alt_entry *)__alt_start,
 			    (struct alt_entry *)__alt_end,
 			    RISCV_ALTERNATIVES_BOOT);
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 93e45560af30..8ccf260e8b02 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -32,6 +32,9 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
 EXPORT_SYMBOL(riscv_isa_ext_keys);
 
+/* Performance information */
+DEFINE_PER_CPU(long, misaligned_access_speed);
+
 /**
  * riscv_isa_extension_base() - Get base extension word
  *
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 3373df413c88..1291ab5ba4c3 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -167,6 +167,7 @@ asmlinkage __visible void smp_callin(void)
 	notify_cpu_starting(curr_cpuid);
 	numa_add_cpu(curr_cpuid);
 	set_cpu_online(curr_cpuid, 1);
+	probe_vendor_features(curr_cpuid);
 
 	/*
 	 * Remote TLB flushes are ignored while the CPU is offline, so emit
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 1c118438b1b3..76d5b468914c 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -7,6 +7,7 @@
 
 #include <linux/syscalls.h>
 #include <asm/cacheflush.h>
+#include <asm/cpufeature.h>
 #include <asm/hwprobe.h>
 #include <asm/sbi.h>
 #include <asm/switch_to.h>
@@ -117,6 +118,29 @@ static void hwprobe_arch_id(struct riscv_hwprobe *pair,
 	pair->value = id;
 }
 
+static u64 hwprobe_misaligned(const struct cpumask *cpus)
+{
+	int cpu;
+	u64 perf = -1ULL;
+
+	for_each_cpu(cpu, cpus) {
+		int this_perf = per_cpu(misaligned_access_speed, cpu);
+
+		if (perf == -1ULL)
+			perf = this_perf;
+
+		if (perf != this_perf) {
+			perf = RISCV_HWPROBE_MISALIGNED_UNKNOWN;
+			break;
+		}
+	}
+
+	if (perf == -1ULL)
+		return RISCV_HWPROBE_MISALIGNED_UNKNOWN;
+
+	return perf;
+}
+
 static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 			     const struct cpumask *cpus)
 {
@@ -146,6 +170,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 
 		break;
 
+	case RISCV_HWPROBE_KEY_CPUPERF_0:
+		pair->value = hwprobe_misaligned(cpus);
+		break;
+
 	/*
 	 * For forward compatibility, unknown keys don't fail the whole
 	 * call, but get their element key set to -1 and value set to 0
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
