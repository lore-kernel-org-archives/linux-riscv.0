Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF478C636D3
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 20:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GmQXyOvEKKBYtmDkqeHT4bM4+XU9HEGD9rrkHB29wH8=; b=rB1+6tdnASfG5d
	M6pJfLvhY+rudOoQNfKD32lBZMs0A5rjOrSpqJg7Lp7SLhqi79SPqRA/8VzSdFxYIp3P0tIhDPscB
	XdIfQuzBNnux1v19xQBysgGBvuuqIdxr66Z01druVPCFVp2jg6u8Z76wT2tmuLzQePJm0D7fSDqQG
	xhY/WQbX+JIBeJnjGVsXbvsvD02cB4waqPaitBLiLKDBICmTIBUdofTffcV2h/HDlBa4vdT8IIaEa
	SCG/RoQZmdwhH5sRWqFVFspaAVy79H0pK8yWUFyu3k70/P/FQIW+I03AmMeFyjbnieLJ+cuUwkXEv
	nj0Gih9AsaLpB2EfoEVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP7ty-009oj9-CT; Mon, 06 Feb 2023 20:15:46 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP7ts-009odS-Bs
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 20:15:44 +0000
Received: by mail-pl1-x62b.google.com with SMTP id be8so13405358plb.7
        for <linux-riscv@lists.infradead.org>; Mon, 06 Feb 2023 12:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NHVkmDL1+Nl1bWyENrxaEG8nDhTyqPy5db4QyUwgAo=;
        b=e8e+hue89xD8AFuDM03gwXKPLXaajuv/b6VKDvoCoBf/iT/zGbXP5ooZz6ZYbxq6Ol
         pRMgq09e2uQzEmi3gW2ANefxMoKxdin+1LUdy2mn4NylyIUDGaTWDxyjf1oczOmGaopv
         ndd3dltEwWjxIEDp1GgserBBoHjJv3C9Pc6EWZJRz/RZNmqctSUvEAebndq63RXZ+k7V
         /m63PZ0vyxSC7rZCehQpF0Svw1z8LboRIPAztWTftiwt30MEirNTJr2AMxI+5Tj7uC5w
         Tl2CfBrbUBvVi8ZqW29uwBXyWdzGmZ0ZA5goqX/HCZIg74rzSCOVCE2WwS2IAOgVugOP
         uEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4NHVkmDL1+Nl1bWyENrxaEG8nDhTyqPy5db4QyUwgAo=;
        b=kZSg+4bOPNg8ok0M+bsaccHS80JW2iYWJSQEAwlcgfnydUG5icvD/H0HrDByD4mzP4
         PaJkADDw1/7LPvdR9LYxDkOkjzK9+pNk3L23ukFduXCrZeaGAFjl0F9YT4ReIWpco4Mo
         CPH+vXrpHE6qfu712FSVCZCRjE4f5w5jhTYZAvhwe2izKaOPk2fszigLvtIxCF3SWs9m
         xQzKEVzk0/8pC4kvVLNmpuGCqfT+6MFyMX94btGRrpGyNl2ZK641cfr7u1Z4INORbYf8
         TQtPDuTUXnnGT6Wf2SoFYz0btoNMjkdf86xn7xmdDtXENKt90MUoRq1aF0lWYyJyJ4XS
         CIOw==
X-Gm-Message-State: AO0yUKXzuDkaM2sioopuWnSRGRaq9hxRc+BxwGEEftCl5B/52V9bM3ZX
	YaGDltT2p6/x8qK0QEee8EJniQ==
X-Google-Smtp-Source: AK7set+JVHNnFfvIUBCDQKktjW0TUQczLdFGPbSNh2d9L/P8+GzUJBG4uu0TKecEvC/h+y8Fy8TFlQ==
X-Received: by 2002:a17:90b:3ecc:b0:22b:fff0:f80c with SMTP id rm12-20020a17090b3ecc00b0022bfff0f80cmr1033780pjb.1.1675714538280;
        Mon, 06 Feb 2023 12:15:38 -0800 (PST)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id k10-20020a63ab4a000000b004df4fbb9823sm6425079pgp.68.2023.02.06.12.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 12:15:37 -0800 (PST)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v2 5/6] RISC-V: hwprobe: Support probing of misaligned access performance
Date: Mon,  6 Feb 2023 12:14:54 -0800
Message-Id: <20230206201455.1790329-6-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230206201455.1790329-1-evan@rivosinc.com>
References: <20230206201455.1790329-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_121540_441425_BE4A2012 
X-CRM114-Status: GOOD (  19.82  )
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
Cc: heiko@sntech.de, Jisheng Zhang <jszhang@kernel.org>, linux-doc@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, Celeste Liu <coelacanthus@outlook.com>, slewis@rivosinc.com, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Xianting Tian <xianting.tian@linux.alibaba.com>, Tsukasa OI <research_trasio@irq.a4lg.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, vineetg@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Guo Ren <guoren@kernel.org>
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

Changes in v2:
 - Fixed logic error in if(of_property_read_string...) that caused crash
 - Include cpufeature.h in cpufeature.h to avoid undeclared variable
   warning.
 - Added a _MASK define
 - Fix random checkpatch complaints

 Documentation/riscv/hwprobe.rst       | 13 +++++++++++
 arch/riscv/include/asm/cpufeature.h   |  2 ++
 arch/riscv/include/asm/hwprobe.h      |  2 +-
 arch/riscv/include/asm/smp.h          |  9 ++++++++
 arch/riscv/include/uapi/asm/hwprobe.h |  6 ++++++
 arch/riscv/kernel/cpufeature.c        | 31 +++++++++++++++++++++++++--
 arch/riscv/kernel/sys_riscv.c         | 23 ++++++++++++++++++++
 7 files changed, 83 insertions(+), 3 deletions(-)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index ce186967861f..0dc75e83e127 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -51,3 +51,16 @@ The following keys are defined:
       not minNum/maxNum") of the RISC-V ISA manual.
     * :RISCV_HWPROBE_IMA_C:: The C extension is supported, as defined by
       version 2.2 of the RISC-V ISA manual.
+* :RISCV_HWPROBE_KEY_PERF_0:: A bitmask that contains performance information
+  about the selected set of processors.
+    * :RISCV_HWPROBE_MISALIGNED_UNKNOWN:: The performance of misaligned
+      accesses is unknown.
+    * :RISCV_HWPROBE_MISALIGNED_EMULATED:: Misaligned accesses are emulated via
+      software, either in or below the kernel.  These accesses are always
+      extremely slow.
+    * :RISCV_HWPROBE_MISALIGNED_SLOW:: Misaligned accesses are supported in
+      hardware, but are slower than the cooresponding aligned accesses
+      sequences.
+    * :RISCV_HWPROBE_MISALIGNED_FAST:: Misaligned accesses are supported in
+      hardware and are faster than the cooresponding aligned accesses
+      sequences.
diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 66c251d98290..ac51a9e6387a 100644
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
diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 3831b638ecab..6c1759091e44 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -26,6 +26,15 @@ struct riscv_ipi_ops {
  */
 extern unsigned long __cpuid_to_hartid_map[NR_CPUS];
 #define cpuid_to_hartid_map(cpu)    __cpuid_to_hartid_map[cpu]
+static inline long hartid_to_cpuid_map(unsigned long hartid)
+{
+	long i;
+
+	for (i = 0; i < NR_CPUS; ++i)
+		if (cpuid_to_hartid_map(i) == hartid)
+			return i;
+	return -1;
+}
 
 /* print IPI stats */
 void show_ipi_stats(struct seq_file *p, int prec);
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index ce39d6e74103..5d55e2da2b1f 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -25,5 +25,11 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
 #define		RISCV_HWPROBE_IMA_FD		(1 << 0)
 #define		RISCV_HWPROBE_IMA_C		(1 << 1)
+#define RISCV_HWPROBE_KEY_CPUPERF_0	5
+#define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
+#define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
+#define		RISCV_HWPROBE_MISALIGNED_SLOW		(2 << 0)
+#define		RISCV_HWPROBE_MISALIGNED_FAST		(3 << 0)
+#define		RISCV_HWPROBE_MISALIGNED_MASK		(3 << 0)
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 #endif
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 93e45560af30..12af6f7a2f53 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -14,8 +14,10 @@
 #include <linux/of.h>
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
+#include <asm/cpufeature.h>
 #include <asm/errata_list.h>
 #include <asm/hwcap.h>
+#include <asm/hwprobe.h>
 #include <asm/patch.h>
 #include <asm/pgtable.h>
 #include <asm/processor.h>
@@ -32,6 +34,9 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
 EXPORT_SYMBOL(riscv_isa_ext_keys);
 
+/* Performance information */
+DEFINE_PER_CPU(long, misaligned_access_speed);
+
 /**
  * riscv_isa_extension_base() - Get base extension word
  *
@@ -89,11 +94,11 @@ static bool riscv_isa_extension_check(int id)
 void __init riscv_fill_hwcap(void)
 {
 	struct device_node *node;
-	const char *isa;
+	const char *isa, *misaligned;
 	char print_str[NUM_ALPHA_EXTS + 1];
 	int i, j, rc;
 	unsigned long isa2hwcap[26] = {0};
-	unsigned long hartid;
+	unsigned long hartid, cpu;
 
 	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
 	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
@@ -246,6 +251,28 @@ void __init riscv_fill_hwcap(void)
 			bitmap_copy(riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
 		else
 			bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
+
+		/*
+		 * Check for the performance of misaligned accesses.
+		 */
+		cpu = hartid_to_cpuid_map(hartid);
+		if (cpu < 0)
+			continue;
+
+		if (!of_property_read_string(node, "riscv,misaligned-access-performance",
+					     &misaligned)) {
+			if (strcmp(misaligned, "emulated") == 0)
+				per_cpu(misaligned_access_speed, cpu) =
+					RISCV_HWPROBE_MISALIGNED_EMULATED;
+
+			if (strcmp(misaligned, "slow") == 0)
+				per_cpu(misaligned_access_speed, cpu) =
+					RISCV_HWPROBE_MISALIGNED_SLOW;
+
+			if (strcmp(misaligned, "fast") == 0)
+				per_cpu(misaligned_access_speed, cpu) =
+					RISCV_HWPROBE_MISALIGNED_FAST;
+		}
 	}
 
 	/* We don't support systems with F but without D, so mask those out
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 74e0d72c877d..73d937c54f4e 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -133,6 +133,25 @@ static long hwprobe_mid(struct riscv_hwprobe __user *pair, size_t key,
 	return set_hwprobe(pair, id);
 }
 
+static long hwprobe_misaligned(cpumask_t *cpus)
+{
+	long cpu, perf = -1;
+
+	for_each_cpu(cpu, cpus) {
+		long this_perf = per_cpu(misaligned_access_speed, cpu);
+
+		if (perf == -1)
+			perf = this_perf;
+
+		if (perf != this_perf)
+			perf = RISCV_HWPROBE_MISALIGNED_UNKNOWN;
+	}
+
+	if (perf == -1)
+		return RISCV_HWPROBE_MISALIGNED_UNKNOWN;
+	return perf;
+}
+
 static
 long do_riscv_hwprobe(struct riscv_hwprobe __user *pairs, long pair_count,
 		      long cpu_count, unsigned long __user *cpus_user,
@@ -205,6 +224,10 @@ long do_riscv_hwprobe(struct riscv_hwprobe __user *pairs, long pair_count,
 			}
 			break;
 
+		case RISCV_HWPROBE_KEY_CPUPERF_0:
+			ret = set_hwprobe(pairs, hwprobe_misaligned(&cpus));
+			break;
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
