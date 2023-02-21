Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4478CC636D7
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 20:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O3JwQl7Puq5Yxr3TEg78I6F9T0R/knwPWrUbNVZ2yZA=; b=lsUDyZqrTP9YnT
	n9dPKLhvtkaZoTrzV+nJlP2NNQnKREvAdErEVQvxz0+H6lQ1q02LVN7O8HJ0BhPS86CXAXQtBqqb0
	NgADblSjjhuOImUfMLJKuZDi3sm/DvPNxP3RkK/g9C5LYKCWeELm1d03YwJ8HoGt/4fDF60W6V8Sd
	NW9axb7HSquB3Zh2Vj4WwfnX1cCVmToRAnqxfjvmOOX1xvFvNwLeIYCDoPneW204b1QsUQESY2tDZ
	aRUy1hzKIeoaMzIjMjoLOAJxjwt50YhPJ0MNjLRi5WEQ89ygVbuvcj4dkanqQM2OqVftn+g9CBbAK
	gLb3kIZb2gR90vdDqaHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUYqu-009dZm-3v; Tue, 21 Feb 2023 20:03:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUYqt-009dYu-51
	for linux-riscv@bombadil.infradead.org; Tue, 21 Feb 2023 20:03:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Ngg8NDFZzsFlILqqXwu8UXpBsOAV4Baprs2BRNqdLJ0=; b=UmU0AhauvH4WtLTlbjattApQp1
	7kBOuVmyzB+LKz3gmjkPqayZwWGFkASBfVyL1Wgjg1BtP1gf9CU+xS8kkz6ccIaBhbjRwoEaZXUAn
	wg47PSRrd76ZbH1Bt4SedilHyYrgeAYF8lnqKhgiTqhseVW43onhXXrE4Xf4m5WJ6spOd6C6lkcgc
	E6DS4tM0iEnzU+MI+Mz/F8YfJ4+E+CIwvorJHJNftL+pa6khkipNUAtr/fzJG1IOGu1bXrlWaO7Tc
	enZKb3jzuHKQpM8chYf67InPqWEbL1uIUNh4CfyD0CBoDyYLeMyKGpscwssinIA/vD3DVoJlWSmxI
	ArKrSkuA==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pUY1E-00CGX7-01
	for linux-riscv@lists.infradead.org;
	Tue, 21 Feb 2023 19:09:42 +0000
Received: by mail-pj1-x1030.google.com with SMTP id z20-20020a17090a8b9400b002372d7f823eso2068240pjn.4
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 11:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ngg8NDFZzsFlILqqXwu8UXpBsOAV4Baprs2BRNqdLJ0=;
        b=FRaQAuEcLIi5R8B0k5soD4TzlqXCCD8xIpm8vDv1PejHFBAIH+x1Tn70DoKzgIdA29
         u1jhu2VwxdcVAhXFFoX/6TH7my+wq3hu7nU9QgtM6yw2HV0ZFaak+mABSNAIv2Nt9DcO
         uOH1qJ2tSXdTM6O7Y/ouRusJ8HdInJja7HVGua5j2lSuVPAedU9lCOL6WoWNzbiSah4R
         xYFmxAswhiNF1Zeqy/XjhCFRfl1N4PEpgeMLggVHFGWvU3NzVAGGO/XjdNzZcrM2wdYu
         Z6jp38wpp3OPylFbdSXC7mVj42OEJpVKBcWehrwWDIJYHmt02qObKqWwFTSEfpTEFvlu
         tMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ngg8NDFZzsFlILqqXwu8UXpBsOAV4Baprs2BRNqdLJ0=;
        b=5XqUvuroDOoPdbB1dRrKJG7hYYn1Rt/+kn7ECp6V/xpt0L2Rri+f/ETFn6nQCboVY4
         t9oD70IYfDG8Uyb45gffRb6fygB6lOUlAVyqjaAW2WAH1mjcaSK14ePy498n33vNFDEM
         QRAUrIWnu/A2E/Mvp/59U8Fuedpof2jzGDXvfZ3tUhmjFAOjDZ1eYWTuIgAVGQNjC+8J
         kKkF8/A1bN5H/kCvVuPSd0oAyTcUX80iXaS0DXZeJzPiZZMWwxiPC24E+gF1CI+SzqTA
         rq5beu/deYBgMxNrYPqmkxkIwzH+JGKGCu3Bfu+xBVUE94D1/HBv9wv5HKmWsfPPrZ5l
         H9qA==
X-Gm-Message-State: AO0yUKVp8eicLNlv7k1y5hsR0TU2ffKXF8r6ZuXdxP3D8XaSzWcvLoth
	Xuk+F5FRsCKQ507AcL6PRdzJAA==
X-Google-Smtp-Source: AK7set+9JyhPkEzwlrHweLrwuAKU/yz0dbdPwCbQGwgBKeOM2IKtDHtvgrtUF617GgoYGmIFS/kJLg==
X-Received: by 2002:a17:903:22c8:b0:199:12d5:5b97 with SMTP id y8-20020a17090322c800b0019912d55b97mr7589315plg.12.1677006577820;
        Tue, 21 Feb 2023 11:09:37 -0800 (PST)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id b16-20020a170902b61000b0019602b2c00csm1583863pls.175.2023.02.21.11.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 11:09:37 -0800 (PST)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v3 5/7] RISC-V: hwprobe: Support probing of misaligned access performance
Date: Tue, 21 Feb 2023 11:08:56 -0800
Message-Id: <20230221190858.3159617-6-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221190858.3159617-1-evan@rivosinc.com>
References: <20230221190858.3159617-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_190940_322578_AF50999F 
X-CRM114-Status: GOOD (  20.43  )
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
Cc: heiko@sntech.de, linux-doc@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Celeste Liu <coelacanthus@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Xianting Tian <xianting.tian@linux.alibaba.com>, Tsukasa OI <research_trasio@irq.a4lg.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, vineetg@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>, Ruizhe Pan <c141028@gmail.com>, Anup Patel <apatel@ventanamicro.com>, slewis@rivosinc.com, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>
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

 Documentation/riscv/hwprobe.rst       | 14 ++++++++++++
 arch/riscv/include/asm/cpufeature.h   |  2 ++
 arch/riscv/include/asm/hwprobe.h      |  2 +-
 arch/riscv/include/asm/smp.h          | 11 ++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h |  6 ++++++
 arch/riscv/kernel/cpufeature.c        | 31 +++++++++++++++++++++++++--
 arch/riscv/kernel/sys_riscv.c         | 27 +++++++++++++++++++++++
 7 files changed, 90 insertions(+), 3 deletions(-)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index 9f2da414fbf8..ac6ded9eb0da 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -58,3 +58,17 @@ The following keys are defined:
     minimumNumber/maximumNumber, not minNum/maxNum") of the RISC-V ISA manual.
   * :c:macro:`RISCV_HWPROBE_IMA_C`: The C extension is supported, as defined
     by version 2.2 of the RISC-V ISA manual.
+* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
+  information about the selected set of processors.
+
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of misaligned
+    accesses is unknown.
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_EMULATED`: Misaligned accesses are
+    emulated via software, either in or below the kernel.  These accesses are
+    always extremely slow.
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned accesses are supported
+    in hardware, but are slower than the cooresponding aligned accesses
+    sequences.
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned accesses are supported
+    in hardware and are faster than the cooresponding aligned accesses
+    sequences.
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
diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 3831b638ecab..4f77a64194e5 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -26,6 +26,17 @@ struct riscv_ipi_ops {
  */
 extern unsigned long __cpuid_to_hartid_map[NR_CPUS];
 #define cpuid_to_hartid_map(cpu)    __cpuid_to_hartid_map[cpu]
+static inline long hartid_to_cpuid_map(unsigned long hartid)
+{
+	long i;
+
+	for_each_possible_cpu(i) {
+		if (cpuid_to_hartid_map(i) == hartid)
+			return i;
+	}
+
+	return -1;
+}
 
 /* print IPI stats */
 void show_ipi_stats(struct seq_file *p, int prec);
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index fc5665411782..93fde30fc4a8 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -25,6 +25,12 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
 #define		RISCV_HWPROBE_IMA_FD		(1 << 0)
 #define		RISCV_HWPROBE_IMA_C		(1 << 1)
+#define RISCV_HWPROBE_KEY_CPUPERF_0	5
+#define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
+#define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
+#define		RISCV_HWPROBE_MISALIGNED_SLOW		(2 << 0)
+#define		RISCV_HWPROBE_MISALIGNED_FAST		(3 << 0)
+#define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
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
index f2b224550923..afc1b96d5c1a 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -7,6 +7,7 @@
 
 #include <linux/syscalls.h>
 #include <asm/cacheflush.h>
+#include <asm/cpufeature.h>
 #include <asm/hwprobe.h>
 #include <asm/sbi.h>
 #include <asm/switch_to.h>
@@ -116,6 +117,28 @@ static void hwprobe_arch_id(struct riscv_hwprobe *pair,
 	pair->value = id;
 }
 
+static int hwprobe_misaligned(const struct cpumask *cpus)
+{
+	int cpu, perf = -1;
+
+	for_each_cpu(cpu, cpus) {
+		int this_perf = per_cpu(misaligned_access_speed, cpu);
+
+		if (perf == -1)
+			perf = this_perf;
+
+		if (perf != this_perf) {
+			perf = RISCV_HWPROBE_MISALIGNED_UNKNOWN;
+			break;
+		}
+	}
+
+	if (perf == -1)
+		return RISCV_HWPROBE_MISALIGNED_UNKNOWN;
+
+	return perf;
+}
+
 static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 			     const struct cpumask *cpus)
 {
@@ -145,6 +168,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 
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
