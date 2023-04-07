Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51023C77B6E
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Apr 2023 23:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6aiWPXOupIaQpf9sygUJSm4eiQpujE82/dZZYIKKT4=; b=vL+OuiyHlSiYfD
	1kpP3FW2CnvEuSEub7Ab/4+SlZsSu8+c4wQD5wPa/jy19feLiAxZbCmB162l5rmP5ihcUcdMZjllv
	Ck6OZf5aJWiNRS9sUIfEeVfjT7cwE4h9z0qBvGv59iFWG8ORy9+ncAVSgnbV9M4GlqjNGTjYnRVpo
	o4Hdhmh5DrQ2fLPvRQvkbavpWXZWQ06e/lRBshMP4wVFB1dfnqsv+2RVPsIvy2fDuKa+eSfra5Vt9
	FEwPvLauPUklUREx3x64oNvxkXABBavUdbEN570fnCD1w6Gl2/MzRDlLY5OY5vkuU1n3DQ+hMnnkg
	ow4VpumeeJNu+xIc/NoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkvEz-00BJu9-0u;
	Fri, 07 Apr 2023 23:11:33 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkvEv-00BJkU-0l
	for linux-riscv@lists.infradead.org;
	Fri, 07 Apr 2023 23:11:31 +0000
Received: by mail-pl1-x634.google.com with SMTP id ke16so66142plb.6
        for <linux-riscv@lists.infradead.org>; Fri, 07 Apr 2023 16:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680909086; x=1683501086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JCw6Rff01ivhht398YYplkGchCK+pEME3+hnH1sw6HA=;
        b=rwm8DrgvRXJ7hJTfo6f2hxRIpC3cGWyn+EF+nqCdw+LQA0Qv/cHRG+6Hc2DA/kFBSw
         uuUUld2y/zcOIoq4dwNnXz/nAiSpoJaM+JbfmV9o4pp3cE4hgGEsxcvsEtrOZLpGc37C
         sLQKw9KpxmbUXrMWLQ51aYQbTgHvXo68M7Ok2D01MyvEdxM7gvo697qVB9vNJ//uA9Kf
         p4CipY0g7YPQbQ0iaL4q9dcdc7CUF0qdkFDoggvOYIIxt0udvrbsEZhdwmfunbooqH/N
         svGq0hm4+DlkFfLCEQyYYiyrADANwtSK+PahW09kVgX2pwEuaxb/qX13JH4tdAiopc/L
         M2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680909086; x=1683501086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JCw6Rff01ivhht398YYplkGchCK+pEME3+hnH1sw6HA=;
        b=cCG49GHgO2/S+esnjKBSGOuAsGjWh8L2ZrQoyFBCNuBimWCamJGdfcJBAvY5us8X2G
         wPyVeQAvcJoRfGTj+48hgWKb1PesiaS6BivaxjI1cUUqhH68UnLuT9ZsH3xFFDh5mH71
         NhbDRPJy9X5uayYrW+nESBc7H+RY0Opsy4Ng0Ld1oDN/F0sJuVLw4C66zxQ7sflZeNx4
         AGR0O+2W6IwXoe9oiZojOqUbNZyEqzPqajIFncXqbiWMGx9KqoBGIwuKMUlzQcJr1vLN
         ckXmfjyttz8IXWug61f73PKkPN8TLw86vFJUH5ICrcV18sOBf4Nmbk9DTAfXCvp7IuBf
         iAFA==
X-Gm-Message-State: AAQBX9eGazs2Gw/pPeP1D81o5XqMd8WmoSGaZ+Q1QUTsEjXhhJP/U79F
	qDv9Fy5EUG9I6KKo6zVQQfJu8w==
X-Google-Smtp-Source: AKy350at7GWJRql/G0mrtAoR/RWs+TpUxtCebRRdJDOQd3+/FohWjrQvAaI39qX8Fcq4olTBcCAOQg==
X-Received: by 2002:a17:902:eccd:b0:19c:da68:337a with SMTP id a13-20020a170902eccd00b0019cda68337amr4915737plh.31.1680909086594;
        Fri, 07 Apr 2023 16:11:26 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id r5-20020a170902be0500b001a076568da9sm3361526pls.216.2023.04.07.16.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 16:11:26 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v6 4/6] RISC-V: hwprobe: Support probing of misaligned access performance
Date: Fri,  7 Apr 2023 16:11:01 -0700
Message-Id: <20230407231103.2622178-5-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230407231103.2622178-1-evan@rivosinc.com>
References: <20230407231103.2622178-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_161129_531986_F59D55ED 
X-CRM114-Status: GOOD (  29.30  )
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
Cc: heiko@sntech.de, linux-doc@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Celeste Liu <coelacanthus@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, vineetg@rivosinc.com, Philipp Tomsich <philipp.tomsich@vrull.eu>, Paul Walmsley <paul.walmsley@sifive.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, slewis@rivosinc.com, Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This allows userspace to select various routines to use based on the
performance of misaligned access on the target hardware.

Rather than adding DT bindings, this change taps into the alternatives
mechanism used to probe CPU errata. Add a new function pointer alongside
the vendor-specific errata_patch_func() that probes for desirable errata
(otherwise known as "features"). Unlike the errata_patch_func(), this
function is called on each CPU as it comes up, so it can save
feature information per-CPU.

The T-head C906 has fast unaligned access, both as defined by GCC [1],
and in performing a basic benchmark, which determined that byte copies
are >50% slower than a misaligned word copy of the same data size (source
for this test at [2]):

bytecopy size f000 count 50000 offset 0 took 31664899 us
wordcopy size f000 count 50000 offset 0 took 5180919 us
wordcopy size f000 count 50000 offset 1 took 13416949 us

[1] https://github.com/gcc-mirror/gcc/blob/master/gcc/config/riscv/riscv.cc#L353
[2] https://pastebin.com/EPXvDHSW

Co-developed-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Evan Green <evan@rivosinc.com>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

---

(no changes since v5)

Changes in v5:
 - Document the alternatives approach in the commit message (Conor and
   Heiko).
 - Fix __init call warnings by making probe_vendor_features() and
   thead_feature_probe_func() __init_or_module.

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
 arch/riscv/errata/thead/errata.c      | 10 ++++++++++
 arch/riscv/include/asm/alternative.h  |  5 +++++
 arch/riscv/include/asm/cpufeature.h   |  2 ++
 arch/riscv/include/asm/hwprobe.h      |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h |  7 +++++++
 arch/riscv/kernel/alternative.c       | 19 ++++++++++++++++++
 arch/riscv/kernel/cpufeature.c        |  3 +++
 arch/riscv/kernel/smpboot.c           |  1 +
 arch/riscv/kernel/sys_riscv.c         | 28 +++++++++++++++++++++++++++
 10 files changed, 97 insertions(+), 1 deletion(-)

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
index 3b96a06d3c54..5b6d62586a8b 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -11,7 +11,9 @@
 #include <linux/uaccess.h>
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
+#include <asm/cpufeature.h>
 #include <asm/errata_list.h>
+#include <asm/hwprobe.h>
 #include <asm/patch.h>
 #include <asm/vendorid_list.h>
 
@@ -115,3 +117,11 @@ void __init_or_module thead_errata_patch_func(struct alt_entry *begin, struct al
 	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
 		local_flush_icache_all();
 }
+
+void __init_or_module thead_feature_probe_func(unsigned int cpu,
+					       unsigned long archid,
+					       unsigned long impid)
+{
+	if ((archid == 0) && (impid == 0))
+		per_cpu(misaligned_access_speed, cpu) = RISCV_HWPROBE_MISALIGNED_FAST;
+}
diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index b8648d4f2ac1..b5774e24d4a3 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -28,6 +28,7 @@
 #define ALT_OLD_PTR(a)			__ALT_PTR(a, old_offset)
 #define ALT_ALT_PTR(a)			__ALT_PTR(a, alt_offset)
 
+void __init probe_vendor_features(unsigned int cpu);
 void __init apply_boot_alternatives(void);
 void __init apply_early_boot_alternatives(void);
 void apply_module_alternatives(void *start, size_t length);
@@ -55,11 +56,15 @@ void thead_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
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
index d717c80a64ff..78936f4ff513 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,6 +8,6 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 4
+#define RISCV_HWPROBE_MAX_KEY 5
 
 #endif
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 398e08f7e083..8d745a4ad8a2 100644
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
index 2354c69dc7d1..fc65c9293ac5 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -27,6 +27,8 @@ struct cpu_manufacturer_info_t {
 	void (*patch_func)(struct alt_entry *begin, struct alt_entry *end,
 				  unsigned long archid, unsigned long impid,
 				  unsigned int stage);
+	void (*feature_probe_func)(unsigned int cpu, unsigned long archid,
+				   unsigned long impid);
 };
 
 static void __init_or_module riscv_fill_cpu_mfr_info(struct cpu_manufacturer_info_t *cpu_mfr_info)
@@ -41,6 +43,7 @@ static void __init_or_module riscv_fill_cpu_mfr_info(struct cpu_manufacturer_inf
 	cpu_mfr_info->imp_id = sbi_get_mimpid();
 #endif
 
+	cpu_mfr_info->feature_probe_func = NULL;
 	switch (cpu_mfr_info->vendor_id) {
 #ifdef CONFIG_ERRATA_SIFIVE
 	case SIFIVE_VENDOR_ID:
@@ -50,6 +53,7 @@ static void __init_or_module riscv_fill_cpu_mfr_info(struct cpu_manufacturer_inf
 #ifdef CONFIG_ERRATA_THEAD
 	case THEAD_VENDOR_ID:
 		cpu_mfr_info->patch_func = thead_errata_patch_func;
+		cpu_mfr_info->feature_probe_func = thead_feature_probe_func;
 		break;
 #endif
 	default:
@@ -139,6 +143,20 @@ void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
 	}
 }
 
+/* Called on each CPU as it starts */
+void __init_or_module probe_vendor_features(unsigned int cpu)
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
@@ -193,6 +211,7 @@ void __init apply_boot_alternatives(void)
 	/* If called on non-boot cpu things could go wrong */
 	WARN_ON(smp_processor_id() != 0);
 
+	probe_vendor_features(0);
 	_apply_alternatives((struct alt_entry *)__alt_start,
 			    (struct alt_entry *)__alt_end,
 			    RISCV_ALTERNATIVES_BOOT);
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 59d58ee0f68d..8bbc89351050 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -30,6 +30,9 @@ unsigned long elf_hwcap __read_mostly;
 /* Host ISA bitmap */
 static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 
+/* Performance information */
+DEFINE_PER_CPU(long, misaligned_access_speed);
+
 /**
  * riscv_isa_extension_base() - Get base extension word
  *
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index ddb2afba6d25..2867c12c3d16 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -168,6 +168,7 @@ asmlinkage __visible void smp_callin(void)
 	notify_cpu_starting(curr_cpuid);
 	numa_add_cpu(curr_cpuid);
 	set_cpu_online(curr_cpuid, 1);
+	probe_vendor_features(curr_cpuid);
 
 	/*
 	 * Remote TLB flushes are ignored while the CPU is offline, so emit
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 5ca567cef142..55389e7595f6 100644
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
