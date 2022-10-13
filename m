Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4957CC4321E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 16:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lQ39HjyAVwBNK0dHK26RUNysBbzdtgoFqTuTKgcFOvc=; b=rYu/tT7FbLnD8W
	pYboH8ipYXkDt7OUncJ/knrK9C+nuNSeJmx/NX4zAAKlzGo+EM1ZJIdL/bsh8hcimsyDqXE4hcIg+
	y5di8opCYnHYlyGco0d9mHgs2GppgmKxI9481bnnWAY42qY+w/L4WjWA4xiiPe1MUE0VK9wpPxhrA
	YNZ+XCo/IxivmIw2yixuUoSIVqZs1fgIJa1r0Jy6nwlv6b6UVmyPjgXLM7y85oO9KBchDHkxxuhfW
	LIUGhgrkipEqPqs9pfyjTTGgdxmO1c1uikZpHQd3/UDtVG04QjcrCo/o3QEbTlMYC2JYXYPz4BGie
	bES31hwYUM6WDKnnl/jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj1Bg-00CRGr-NI; Thu, 13 Oct 2022 16:36:00 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj1Bb-00CRE2-1s
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 16:35:57 +0000
Received: by mail-pg1-x533.google.com with SMTP id u71so2019953pgd.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Oct 2022 09:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wj/Qzct5/5OFPQDUmHCU31ls20Benxk+3umBR9mmtj8=;
        b=QjqHimXPX2uFnZwaoGaHNOVvkbwhCN3Dmh6Jra89uEAgBJSwcCYZJZfP1+fMC+pbHY
         LZiun3TvkQ44psng7qqR88q1OfO+tUzyhpPpKOWnOCt4baPLTL6ONxZHLH7I1rkguX4W
         VLQtjRqQldDa7CqvqoN2YT9ZR6g34Etuv7bwG68d6fSDYKDyJsyjIMgxenyrOegGJDbu
         jWPR9k1Edk6RpVv6re+RjPk7oUaUJ/5s5O/s89y//d1hkfTFCbKa5XnNdGB70jM55CCu
         8TBTszcXGy+V6oASKRScue8f0+z/P3KRhFUeeycVXtfm9SAGuzO3MRWPMx4DVzuyejej
         BOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wj/Qzct5/5OFPQDUmHCU31ls20Benxk+3umBR9mmtj8=;
        b=QALlyRkuNnPV+lXGjljlsER6vAIV8vhxmquHDcEC98A4GgihokZ+4b8op2x4XIIqW7
         Y4oG3JJTOA+wONC3D/xEnShP4E/gHVI/zrpAdBDsTsPPtzJrlzzYEDOkKDmXz41L+nyy
         ZhRIwPE7tEjpvf+qtxJRwyUzrem8QEHYzWT9wYGM9pvzs/WQfGX5zdNcJf06XOU20hXp
         R4gf8zvOvKO/5RUokNysQk9xhoPL6ghIbagHjYjEI+XlpBmbeTHKM7kCNDwpVnXalVZY
         PUrEAu22BSasss1ewqN4Ge12ZOOLrXw/jiv3gZLt2IQBnMufiJdKfqiQt/o+t8OpjWvx
         D2NA==
X-Gm-Message-State: ACrzQf2dVZPQOP9HNrBiIQhUkO2/eIgaPp5kmiW0fnxh5TDqfItsvzU8
	W3jouLTzp/OPkWit5heaTMi7aSI172NWJA==
X-Google-Smtp-Source: AMsMyM7ovsWiujrQkliB/qMbTrNqdHOb9r1xZkXRkj0j5p2oFH7d8jLb8SfEdXQQzbn6JD+ksLMX7A==
X-Received: by 2002:a63:5946:0:b0:461:e1b9:c5a5 with SMTP id j6-20020a635946000000b00461e1b9c5a5mr662651pgm.56.1665678953264;
        Thu, 13 Oct 2022 09:35:53 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id s9-20020aa78bc9000000b005636326fdbfsm2215593pfd.78.2022.10.13.09.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 09:35:52 -0700 (PDT)
Subject: [PATCH v1 4/5] RISC-V: hwprobe: Support probing of misaligned accesss performance
Date: Thu, 13 Oct 2022 09:35:50 -0700
Message-Id: <20221013163551.6775-5-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221013163551.6775-1-palmer@rivosinc.com>
References: <20221013163551.6775-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_093555_118984_3B2AE513 
X-CRM114-Status: GOOD (  20.97  )
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

This allows userspace to select various routines to use based on the
performance of misaligned access on the target hardware.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 Documentation/riscv/hwprobe.rst       | 13 +++++++++++++
 arch/riscv/include/asm/cpufeature.h   |  2 ++
 arch/riscv/include/asm/hwprobe.h      |  2 +-
 arch/riscv/include/asm/smp.h          |  7 +++++++
 arch/riscv/include/uapi/asm/hwprobe.h |  7 +++++--
 arch/riscv/kernel/cpufeature.c        | 24 ++++++++++++++++++++++--
 arch/riscv/kernel/sys_riscv.c         | 22 ++++++++++++++++++++++
 7 files changed, 72 insertions(+), 5 deletions(-)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index b182fcf4cd30..f8aa9137d8aa 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -47,3 +47,16 @@ The following keys are defined:
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
index cbda062de9bd..54bdcf9a5049 100644
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
index d3443be7eedc..5d98836cc446 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -26,6 +26,13 @@ struct riscv_ipi_ops {
  */
 extern unsigned long __cpuid_to_hartid_map[NR_CPUS];
 #define cpuid_to_hartid_map(cpu)    __cpuid_to_hartid_map[cpu]
+static inline long hartid_to_cpuid_map(unsigned long hartid) {
+	long i;
+	for (i = 0; i < NR_CPUS; ++i)
+		if (cpuid_to_hartid_map(i) == hartid)
+			return i;
+	return -1;
+}
 
 /* print IPI stats */
 void show_ipi_stats(struct seq_file *p, int prec);
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 07309376c6dc..e36b72f4e1af 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -24,8 +24,11 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
 #define		RISCV_HWPROBE_IMA_FD		(1 << 0)
 #define		RISCV_HWPROBE_IMA_C		(1 << 1)
+#define RISCV_HWPROBE_KEY_CPUPERF_0	5
+#define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
+#define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
+#define		RISCV_HWPROBE_MISALIGNED_SLOW		(2 << 0)
+#define		RISCV_HWPROBE_MISALIGNED_FAST		(3 << 0)
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
-
-
 #endif
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 553d755483ed..1599e40cd170 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -15,6 +15,7 @@
 #include <asm/cacheflush.h>
 #include <asm/errata_list.h>
 #include <asm/hwcap.h>
+#include <asm/hwprobe.h>
 #include <asm/patch.h>
 #include <asm/pgtable.h>
 #include <asm/processor.h>
@@ -31,6 +32,9 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 __ro_after_init DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
 EXPORT_SYMBOL(riscv_isa_ext_keys);
 
+/* Performance information */
+DEFINE_PER_CPU(long, misaligned_access_speed);
+
 /**
  * riscv_isa_extension_base() - Get base extension word
  *
@@ -71,11 +75,11 @@ EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
 void __init riscv_fill_hwcap(void)
 {
 	struct device_node *node;
-	const char *isa;
+	const char *isa, *misaligned;
 	char print_str[NUM_ALPHA_EXTS + 1];
 	int i, j, rc;
 	static unsigned long isa2hwcap[256] = {0};
-	unsigned long hartid;
+	unsigned long hartid, cpu;
 
 	isa2hwcap['i'] = isa2hwcap['I'] = COMPAT_HWCAP_ISA_I;
 	isa2hwcap['m'] = isa2hwcap['M'] = COMPAT_HWCAP_ISA_M;
@@ -222,6 +226,22 @@ void __init riscv_fill_hwcap(void)
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
+		if (of_property_read_string(node, "riscv,misaligned-access-performance", &misaligned)) {
+			if (strcmp(misaligned, "emulated") == 0)
+				per_cpu(misaligned_access_speed, cpu) = RISCV_HWPROBE_MISALIGNED_EMULATED;
+			if (strcmp(misaligned, "slow") == 0)
+				per_cpu(misaligned_access_speed, cpu) = RISCV_HWPROBE_MISALIGNED_SLOW;
+			if (strcmp(misaligned, "fast") == 0)
+				per_cpu(misaligned_access_speed, cpu) = RISCV_HWPROBE_MISALIGNED_FAST;
+		}
 	}
 
 	/* We don't support systems with F but without D, so mask those out
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 337e3f2a17c8..fc9e8cd1589b 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -139,6 +139,24 @@ static long hwprobe_mid(struct riscv_hwprobe __user *pair, size_t key,
 	return set_hwprobe(pair, key, id);
 }
 
+static long hwprobe_misaligned(cpumask_t *cpus)
+{
+	long cpu, perf = -1;
+
+	for_each_cpu(cpu, cpus) {
+		long this_perf = per_cpu(misaligned_access_speed, cpu);
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
 		      long key_offset, long cpu_count,
@@ -207,6 +225,10 @@ long do_riscv_hwprobe(struct riscv_hwprobe __user *pairs, long pair_count,
 				ret = set_hwprobe(pairs + out, k, val);
 			}
 			break;
+
+		case RISCV_HWPROBE_KEY_CPUPERF_0:
+			set_hwprobe(pairs + out, k, hwprobe_misaligned(&cpus));
+			break;
 		}
 
 		if (ret < 0)
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
