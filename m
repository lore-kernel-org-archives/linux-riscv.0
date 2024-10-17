Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8CDD3C52C
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 19:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tdnP4NMoeC5nxBa6GiOEUDAtm+ve9q73eTk6k7YuQSk=; b=D2/RjQeWJQCNyU
	+K3QFqjZGB33nfDNkaZL4OGmb8ZGuyiS8t3haY50xuyQCyrgjyl7LcUDJZRhEd1rjNymZKrQnW8nQ
	m8i2kXsoU6lihIa5IdmHdF1lt3B9DdWdH0OHslbzkM+D+TkUZkbow9q8EP+bxNFilZiYYZ3oukVCB
	tMzYM5w48m2Tihzpu7dlspC1dM24IKZ9mB8sHLyg64O+ICmlPkgj0z9JUC6RtWYLZBbfzDG/79WSo
	+jVErl5+XYP0ihMJWmNsJ4UtZb3PWMe0tktTAdN1/wqnU1tcTJWTTmThiQzrMHSlklVrDabuKHvUb
	DD6QmfqSY+IGdbyzdwCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1VkE-0000000Fxzz-2Z42;
	Thu, 17 Oct 2024 19:01:10 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Vjl-0000000FxiC-21Z0
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 19:00:46 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2e2d1858cdfso936942a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2024 12:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1729191641; x=1729796441; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/BXEqMIqSYxMOqT7xN76pMOEAL23LidRxAEAWgsy/I=;
        b=vMjPR1R/twHzCXCc1vQYATcP2eSG8nQIy/zmFLTMoXIhsV5/iKk6aYIxGhTyK5r11Q
         JUIQ9/RcerEbB8M1/KaH/PM5zbwUB1xcu7227e5I8xl7DTGH8RlrCoCtYNNZI4fX0W8o
         defyWeRrlQUwKePJk1gAy6t6hrCqXfLIbExj2GUv7wmoBJ46Z/IAgnPWKldwllLblqui
         SSH78tc+AamrV/+Yut2POUQK8LUyPWDyQZREPoBdkfnbNS/8gQH2hT524sg+UIZ5HfEb
         VyMQq/LJLBKgTMDaDwI4tT/bytqgWHZtTVm0QGX2WgRa6uAr2/7Y/4jkxsVxVzM6vCyc
         Vu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729191641; x=1729796441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/BXEqMIqSYxMOqT7xN76pMOEAL23LidRxAEAWgsy/I=;
        b=VKYrQt7+azzAuvrFTiqDgDRK3GUAD00YhbkZVwMCvrCPqb8FQSqrIYXJ5RXA90QP24
         871SeAP9R1Ib0XaKQKcivWDRSRiw+d7wdysB5doB1D+v6+4N/hxvogW7ootwDJ0N9Ck0
         Y843780cl3LmacvAEU7TJErOtIdcI/KzPuQsCpVk3JAX9ClLr2GCHzhk70ZPJ6oCCojp
         TT8eYPZCtWEaJo8J/p1mqPdwIqkuhVtOKmPkSKVKqgeTlwHjq55nE+Wy0a6n/VP9FuVB
         d2sgcicCV+Ku42U5aof4i92U72uBERbP3VbRTU0TgzR8GsQV2ZafrJvj68K3RyhlRyeb
         gnNw==
X-Forwarded-Encrypted: i=1; AJvYcCVZx40dzWj70iPmeXCkWL12ExmvHBAF0LRRPVI+QxozbMkjYBxc7xwCURrRpEl4nYLlqqCzxOCAEQvccQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwlHC/AvLvymxxZAd1qOZN3d8pR1gxsKt7Bw4jCrvR4OmuZ75Rp
	iHKLWtXH7Emvc0f43NssuHRALc6rNGhe/NMLBSXyrTJ/e7HCFa43Qxeuc0onerk=
X-Google-Smtp-Source: AGHT+IHCgs2HWOhUoTUe59n89YrWVQE0OBgi1zoEPAV99GmBsqSsvTiwAnnbOwVic5dJBGKcLna6Lg==
X-Received: by 2002:a17:90a:d90c:b0:2e5:5ab5:ba52 with SMTP id 98e67ed59e1d1-2e56165ea76mr7694a91.20.1729191640739;
        Thu, 17 Oct 2024 12:00:40 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e55d7bf9a8sm217766a91.13.2024.10.17.12.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 12:00:39 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 17 Oct 2024 12:00:22 -0700
Subject: [PATCH v10 5/6] RISC-V: Report vector unaligned access speed
 hwprobe
MIME-Version: 1.0
Message-Id: <20241017-jesse_unaligned_vector-v10-5-5b33500160f8@rivosinc.com>
References: <20241017-jesse_unaligned_vector-v10-0-5b33500160f8@rivosinc.com>
In-Reply-To: <20241017-jesse_unaligned_vector-v10-0-5b33500160f8@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Evan Green <evan@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Jesse Taube <jesse@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11094; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=j/dbDwoe5QvLFXzszJPgbeYRVdxzj8+aKPKL6Ox7jPQ=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ7pg3Nnbvx62bcvady/ZOWmKrn9T4Mvrnuv85z+vam7u3
 vLrzn//jlIWBjEOBlkxRRaeaw3MrXf0y46Klk2AmcPKBDKEgYtTACbiysbIcFtF5ZoJV530BsNs
 r9laM1KPeP2PffEoY6+j2G3bpxvzTjP8Yg78oWC69EragVrrCUenbtXY9+HJYfH1s7Qlv55e/sz
 0Kw8A
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_120042_988335_56EB532E 
X-CRM114-Status: GOOD (  25.24  )
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

From: Jesse Taube <jesse@rivosinc.com>

Detect if vector misaligned accesses are faster or slower than
equivalent vector byte accesses. This is useful for usermode to know
whether vector byte accesses or vector misaligned accesses have a better
bandwidth for operations like memcpy.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/Kconfig                         |  18 ++++
 arch/riscv/kernel/Makefile                 |   3 +-
 arch/riscv/kernel/copy-unaligned.h         |   5 +
 arch/riscv/kernel/sys_hwprobe.c            |   6 ++
 arch/riscv/kernel/unaligned_access_speed.c | 141 ++++++++++++++++++++++++++++-
 arch/riscv/kernel/vec-copy-unaligned.S     |  58 ++++++++++++
 6 files changed, 228 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 93f9a2958de7..c33311fdfc8c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -856,6 +856,24 @@ config RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
 	  will dynamically determine the speed of vector unaligned accesses on
 	  the underlying system if they are supported.
 
+config RISCV_SLOW_VECTOR_UNALIGNED_ACCESS
+	bool "Assume the system supports slow vector unaligned memory accesses"
+	depends on NONPORTABLE
+	help
+	  Assume that the system supports slow vector unaligned memory accesses. The
+	  kernel and userspace programs may not be able to run at all on systems
+	  that do not support unaligned memory accesses.
+
+config RISCV_EFFICIENT_VECTOR_UNALIGNED_ACCESS
+	bool "Assume the system supports fast vector unaligned memory accesses"
+	depends on NONPORTABLE
+	help
+	  Assume that the system supports fast vector unaligned memory accesses. When
+	  enabled, this option improves the performance of the kernel on such
+	  systems. However, the kernel and userspace programs will run much more
+	  slowly, or will not be able to run at all, on systems that do not
+	  support efficient unaligned memory accesses.
+
 endchoice
 
 source "arch/riscv/Kconfig.vendor"
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 7f88cc4931f5..30db92672ada 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -70,7 +70,8 @@ obj-$(CONFIG_MMU) += vdso.o vdso/
 
 obj-$(CONFIG_RISCV_MISALIGNED)	+= traps_misaligned.o
 obj-$(CONFIG_RISCV_MISALIGNED)	+= unaligned_access_speed.o
-obj-$(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)	+= copy-unaligned.o
+obj-$(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)		+= copy-unaligned.o
+obj-$(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)	+= vec-copy-unaligned.o
 
 obj-$(CONFIG_FPU)		+= fpu.o
 obj-$(CONFIG_FPU)		+= kernel_mode_fpu.o
diff --git a/arch/riscv/kernel/copy-unaligned.h b/arch/riscv/kernel/copy-unaligned.h
index e3d70d35b708..85d4d11450cb 100644
--- a/arch/riscv/kernel/copy-unaligned.h
+++ b/arch/riscv/kernel/copy-unaligned.h
@@ -10,4 +10,9 @@
 void __riscv_copy_words_unaligned(void *dst, const void *src, size_t size);
 void __riscv_copy_bytes_unaligned(void *dst, const void *src, size_t size);
 
+#ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
+void __riscv_copy_vec_words_unaligned(void *dst, const void *src, size_t size);
+void __riscv_copy_vec_bytes_unaligned(void *dst, const void *src, size_t size);
+#endif
+
 #endif /* __RISCV_KERNEL_COPY_UNALIGNED_H */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 6441baada36b..6673278e84d5 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -228,6 +228,12 @@ static u64 hwprobe_vec_misaligned(const struct cpumask *cpus)
 #else
 static u64 hwprobe_vec_misaligned(const struct cpumask *cpus)
 {
+	if (IS_ENABLED(CONFIG_RISCV_EFFICIENT_VECTOR_UNALIGNED_ACCESS))
+		return RISCV_HWPROBE_MISALIGNED_VECTOR_FAST;
+
+	if (IS_ENABLED(CONFIG_RISCV_SLOW_VECTOR_UNALIGNED_ACCESS))
+		return RISCV_HWPROBE_MISALIGNED_VECTOR_SLOW;
+
 	return RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN;
 }
 #endif
diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 0b8b5e17453a..91f189cf1611 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -6,11 +6,13 @@
 #include <linux/cpu.h>
 #include <linux/cpumask.h>
 #include <linux/jump_label.h>
+#include <linux/kthread.h>
 #include <linux/mm.h>
 #include <linux/smp.h>
 #include <linux/types.h>
 #include <asm/cpufeature.h>
 #include <asm/hwprobe.h>
+#include <asm/vector.h>
 
 #include "copy-unaligned.h"
 
@@ -268,12 +270,147 @@ static int check_unaligned_access_speed_all_cpus(void)
 }
 #endif
 
+#ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
+static void check_vector_unaligned_access(struct work_struct *work __always_unused)
+{
+	int cpu = smp_processor_id();
+	u64 start_cycles, end_cycles;
+	u64 word_cycles;
+	u64 byte_cycles;
+	int ratio;
+	unsigned long start_jiffies, now;
+	struct page *page;
+	void *dst;
+	void *src;
+	long speed = RISCV_HWPROBE_MISALIGNED_VECTOR_SLOW;
+
+	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN)
+		return;
+
+	page = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
+	if (!page) {
+		pr_warn("Allocation failure, not measuring vector misaligned performance\n");
+		return;
+	}
+
+	/* Make an unaligned destination buffer. */
+	dst = (void *)((unsigned long)page_address(page) | 0x1);
+	/* Unalign src as well, but differently (off by 1 + 2 = 3). */
+	src = dst + (MISALIGNED_BUFFER_SIZE / 2);
+	src += 2;
+	word_cycles = -1ULL;
+
+	/* Do a warmup. */
+	kernel_vector_begin();
+	__riscv_copy_vec_words_unaligned(dst, src, MISALIGNED_COPY_SIZE);
+
+	start_jiffies = jiffies;
+	while ((now = jiffies) == start_jiffies)
+		cpu_relax();
+
+	/*
+	 * For a fixed amount of time, repeatedly try the function, and take
+	 * the best time in cycles as the measurement.
+	 */
+	while (time_before(jiffies, now + (1 << MISALIGNED_ACCESS_JIFFIES_LG2))) {
+		start_cycles = get_cycles64();
+		/* Ensure the CSR read can't reorder WRT to the copy. */
+		mb();
+		__riscv_copy_vec_words_unaligned(dst, src, MISALIGNED_COPY_SIZE);
+		/* Ensure the copy ends before the end time is snapped. */
+		mb();
+		end_cycles = get_cycles64();
+		if ((end_cycles - start_cycles) < word_cycles)
+			word_cycles = end_cycles - start_cycles;
+	}
+
+	byte_cycles = -1ULL;
+	__riscv_copy_vec_bytes_unaligned(dst, src, MISALIGNED_COPY_SIZE);
+	start_jiffies = jiffies;
+	while ((now = jiffies) == start_jiffies)
+		cpu_relax();
+
+	while (time_before(jiffies, now + (1 << MISALIGNED_ACCESS_JIFFIES_LG2))) {
+		start_cycles = get_cycles64();
+		/* Ensure the CSR read can't reorder WRT to the copy. */
+		mb();
+		__riscv_copy_vec_bytes_unaligned(dst, src, MISALIGNED_COPY_SIZE);
+		/* Ensure the copy ends before the end time is snapped. */
+		mb();
+		end_cycles = get_cycles64();
+		if ((end_cycles - start_cycles) < byte_cycles)
+			byte_cycles = end_cycles - start_cycles;
+	}
+
+	kernel_vector_end();
+
+	/* Don't divide by zero. */
+	if (!word_cycles || !byte_cycles) {
+		pr_warn("cpu%d: rdtime lacks granularity needed to measure unaligned vector access speed\n",
+			cpu);
+
+		return;
+	}
+
+	if (word_cycles < byte_cycles)
+		speed = RISCV_HWPROBE_MISALIGNED_VECTOR_FAST;
+
+	ratio = div_u64((byte_cycles * 100), word_cycles);
+	pr_info("cpu%d: Ratio of vector byte access time to vector unaligned word access is %d.%02d, unaligned accesses are %s\n",
+		cpu,
+		ratio / 100,
+		ratio % 100,
+		(speed ==  RISCV_HWPROBE_MISALIGNED_VECTOR_FAST) ? "fast" : "slow");
+
+	per_cpu(vector_misaligned_access, cpu) = speed;
+}
+
+static int riscv_online_cpu_vec(unsigned int cpu)
+{
+	if (!has_vector())
+		return 0;
+
+	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED)
+		return 0;
+
+	check_vector_unaligned_access_emulated(NULL);
+	check_vector_unaligned_access(NULL);
+	return 0;
+}
+
+/* Measure unaligned access speed on all CPUs present at boot in parallel. */
+static int vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
+{
+	schedule_on_each_cpu(check_vector_unaligned_access);
+
+	/*
+	 * Setup hotplug callbacks for any new CPUs that come online or go
+	 * offline.
+	 */
+	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
+				  riscv_online_cpu_vec, NULL);
+
+	return 0;
+}
+#else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
+static int vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
+{
+	return 0;
+}
+#endif
+
 static int check_unaligned_access_all_cpus(void)
 {
-	bool all_cpus_emulated;
+	bool all_cpus_emulated, all_cpus_vec_unsupported;
 
 	all_cpus_emulated = check_unaligned_access_emulated_all_cpus();
-	check_vector_unaligned_access_emulated_all_cpus();
+	all_cpus_vec_unsupported = check_vector_unaligned_access_emulated_all_cpus();
+
+	if (!all_cpus_vec_unsupported &&
+	    IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
+		kthread_run(vec_check_unaligned_access_speed_all_cpus,
+			    NULL, "vec_check_unaligned_access_speed_all_cpus");
+	}
 
 	if (!all_cpus_emulated)
 		return check_unaligned_access_speed_all_cpus();
diff --git a/arch/riscv/kernel/vec-copy-unaligned.S b/arch/riscv/kernel/vec-copy-unaligned.S
new file mode 100644
index 000000000000..d16f19f1b3b6
--- /dev/null
+++ b/arch/riscv/kernel/vec-copy-unaligned.S
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2024 Rivos Inc. */
+
+#include <linux/args.h>
+#include <linux/linkage.h>
+#include <asm/asm.h>
+
+	.text
+
+#define WORD_EEW 32
+
+#define WORD_SEW CONCATENATE(e, WORD_EEW)
+#define VEC_L CONCATENATE(vle, WORD_EEW).v
+#define VEC_S CONCATENATE(vle, WORD_EEW).v
+
+/* void __riscv_copy_vec_words_unaligned(void *, const void *, size_t) */
+/* Performs a memcpy without aligning buffers, using word loads and stores. */
+/* Note: The size is truncated to a multiple of WORD_EEW */
+SYM_FUNC_START(__riscv_copy_vec_words_unaligned)
+	andi  a4, a2, ~(WORD_EEW-1)
+	beqz  a4, 2f
+	add   a3, a1, a4
+	.option push
+	.option arch, +zve32x
+1:
+	vsetivli t0, 8, WORD_SEW, m8, ta, ma
+	VEC_L v0, (a1)
+	VEC_S v0, (a0)
+	addi  a0, a0, WORD_EEW
+	addi  a1, a1, WORD_EEW
+	bltu  a1, a3, 1b
+
+2:
+	.option pop
+	ret
+SYM_FUNC_END(__riscv_copy_vec_words_unaligned)
+
+/* void __riscv_copy_vec_bytes_unaligned(void *, const void *, size_t) */
+/* Performs a memcpy without aligning buffers, using only byte accesses. */
+/* Note: The size is truncated to a multiple of 8 */
+SYM_FUNC_START(__riscv_copy_vec_bytes_unaligned)
+	andi a4, a2, ~(8-1)
+	beqz a4, 2f
+	add  a3, a1, a4
+	.option push
+	.option arch, +zve32x
+1:
+	vsetivli t0, 8, e8, m8, ta, ma
+	vle8.v v0, (a1)
+	vse8.v v0, (a0)
+	addi a0, a0, 8
+	addi a1, a1, 8
+	bltu a1, a3, 1b
+
+2:
+	.option pop
+	ret
+SYM_FUNC_END(__riscv_copy_vec_bytes_unaligned)

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
