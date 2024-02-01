Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C03C48292
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 23:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J2SufDgzVmLYn3yWJ6rT8lb0dletx0zjI58eP3fjjdw=; b=RAUXCIPHtj3pbu
	HgraG6VzoPue5EHJsOg6osHlL4BxLIPpwhxmiY1mQsieoXf4WQs1d9h+cuKArQjjY1Jn0Ecs1sB6L
	e1qHa8hPiSyZgURCeLn2AzXm7uzKgfSBkzZ9t1AE/ka2WFQL8eeIkx1Zk2GufrJMqDCSZYv/9WCcq
	aItb9rineK2jZXfoGukeH89TC0ZttlhEOMKa6Mc5exoJyS2kjerMZ0yievItMd82OXL5P/0qosW3K
	azODkpu0X35/SEEh+HqN5vV0IaiQEn+gH1PQn09y2dZnwgUtGgJx1Esceep9mFZoEpHVK1vacNhmS
	xD0QDYoz+tELCj5+kopA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVgWF-00000009elg-41u4;
	Thu, 01 Feb 2024 23:30:55 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVgWC-00000009ekG-2ylW
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 23:30:54 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-28bec6ae0ffso1110046a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 01 Feb 2024 15:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706830252; x=1707435052; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aF+RhzdmSD2bYFYewAm4BVuWqEgBGlP2HTMIOOI8Z1o=;
        b=GTIFG36pzCAJM0KKj2OCzhI2Jc88E/GQg2Fg651CeTj48kBWu9ITVxRyztzlWi7Mvy
         jWBu2ANbrU9/plqjYgM2/zuIULzPL2R2jNbT4WIybbePz5aVvSxftp43GZC3u5qLMFkK
         v+u/ynDRwHi+q65qyR+8gjRcv5VREL1qRfLKoriMYzMInleN8OxmH7xm4pnhJQSTmdJG
         ZFI0h7PsgKYTQOiHEyP2L2Dr8avnZJ8qtBoUdEZGLRdDHDgeXvrayhAXpT2Ij4idduYv
         ixPalWsr/gry7wan2h9F+z31pS74lNDjeQAXyD52r2iySCliRWfI3axwiALHDVlr81p/
         DoDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706830252; x=1707435052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aF+RhzdmSD2bYFYewAm4BVuWqEgBGlP2HTMIOOI8Z1o=;
        b=sy1O6C4gJ9PfSJohVTaC9glw9SS/JslwIUkWl0+Pd9dXT2vTNcDTFJidau1Rs8wE0o
         QJAVlqQr3j03ICyomG0MQR7sV+GvLG+O8bfRLjZMCiOE6nVU4JI3pC1ktJxiIgkSwGmf
         xLSs4y1WiU982ea6SPMk0ErDyf3J1j1jYoLyPU4wIH81a2WR3qnZLIIfX3NTuSy39dkN
         BYT8Yge1YnorxwmEu6njbGmEHh+h5tBpNPQgqHExkEgOEiHxLdNIc+qqx+EAJr8uYLR9
         uNPfaRDxwNcJDafaaYHnt+pVyw196L6l8Tqw9UXhBQ99U8xXIEr7M0lDkbKskn9aYR4e
         X8jg==
X-Gm-Message-State: AOJu0YwbcwEICRG8oqcW6bB0yi5hcdZrZwOkOpcoWGCVDw4Nv5iLYtya
	97vQuQAJI4xVceuLe85rm3ccs286WWPHxQ+sP9IFV9Y6DUjTheeIvkNM5SGTS6A=
X-Google-Smtp-Source: AGHT+IHLWrzjy7XcjdHIA2aDpSIOhHa0IedJUfdl4kDKzIyh3JV688zvQWl1km+f43BRz8WGdM5dEQ==
X-Received: by 2002:a05:6a20:4a24:b0:19e:43cd:9a2b with SMTP id fr36-20020a056a204a2400b0019e43cd9a2bmr353861pzb.34.1706830251489;
        Thu, 01 Feb 2024 15:30:51 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXeZhSZn3ntiiWT2EcNdvnkUYDXG9WdcNASvQsQSwxt+eL8prke7HoZ0+30QC3PZAzNHIEqO3BJX31+pQzbijEeBhGR2PVBusFpWOGljBbEzxBJPvsy4Wz2euHCNNQ+8oc/LY7CkoHrTCdTjJHCl5YOOvEEFv8LUe3RoUJB3BQyM7a23Gg7sNlkvlDJrrqX7KuijVLEinoaZPFuUR3gP/wmICRd/FMs2IXehAS4cWVwbnxjsPI+H4TQCfDyNBwrDzBFSs6mJ9eSzGQ=
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id y9-20020a62ce09000000b006db85b12036sm309673pfg.137.2024.02.01.15.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 15:30:51 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 01 Feb 2024 15:30:46 -0800
Subject: [PATCH v2 2/2] riscv: Disable misaligned access probe when
 CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
MIME-Version: 1.0
Message-Id: <20240201-disable_misaligned_probe_config-v2-2-77c368bed7b2@rivosinc.com>
References: <20240201-disable_misaligned_probe_config-v2-0-77c368bed7b2@rivosinc.com>
In-Reply-To: <20240201-disable_misaligned_probe_config-v2-0-77c368bed7b2@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706830248; l=20875;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=rqDkRioGEHujHRDqDsfXCeO4IFAHLDloStbI4YObTEc=;
 b=GNHTRwFSg9zPmgGY8c+Vt404yj0ntffRrB7f7Ujv0hURNx+HyYBML1FSscCRlSInIXpkYh9xo
 RvDiUbMX27lAabjg6n4fKziSBv0Jqf62DW7yi0eaxWjJIqwu5Eou2uU
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_153052_817352_EAA18EE0 
X-CRM114-Status: GOOD (  25.98  )
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

When CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is selected, the cpus can be
set to have fast misaligned access without needing to probe.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/Kconfig                               |   1 +
 arch/riscv/include/asm/cpufeature.h              |   7 +
 arch/riscv/include/asm/misaligned_access_speed.h |  29 +++
 arch/riscv/kernel/Makefile                       |   3 +
 arch/riscv/kernel/cpufeature.c                   | 255 ----------------------
 arch/riscv/kernel/misaligned_access_speed.c      | 265 +++++++++++++++++++++++
 arch/riscv/kernel/sys_hwprobe.c                  |   4 +
 7 files changed, 309 insertions(+), 255 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bffbd869a068..3223d2d08f74 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -690,6 +690,7 @@ config THREAD_SIZE_ORDER
 config RISCV_MISALIGNED
 	bool "Support misaligned load/store traps for kernel and userspace"
 	select SYSCTL_ARCH_UNALIGN_ALLOW
+	depends on !HAVE_EFFICIENT_UNALIGNED_ACCESS
 	default y
 	help
 	  Say Y here if you want the kernel to embed support for misaligned
diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index eb3ac304fc42..3a29d8e30e05 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -51,6 +51,7 @@ static inline bool check_unaligned_access_emulated(int cpu)
 static inline void unaligned_emulation_finish(void) {}
 #endif
 
+#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
 DECLARE_PER_CPU(long, misaligned_access_speed);
 
 DECLARE_STATIC_KEY_FALSE(fast_misaligned_access_speed_key);
@@ -59,6 +60,12 @@ static __always_inline bool has_fast_misaligned_accesses(void)
 {
 	return static_branch_likely(&fast_misaligned_access_speed_key);
 }
+#else
+static __always_inline bool has_fast_misaligned_accesses(void)
+{
+	return true;
+}
+#endif
 
 unsigned long riscv_get_elf_hwcap(void);
 
diff --git a/arch/riscv/include/asm/misaligned_access_speed.h b/arch/riscv/include/asm/misaligned_access_speed.h
new file mode 100644
index 000000000000..81df2aa6fa6b
--- /dev/null
+++ b/arch/riscv/include/asm/misaligned_access_speed.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2024 Rivos, Inc
+ */
+
+#ifndef _ASM_MISALIGNED_ACCESS_SPEED_H
+#define _ASM_MISALIGNED_ACCESS_SPEED_H
+
+#include <linux/compiler_attributes.h>
+#include <linux/jump_label.h>
+#include <linux/percpu.h>
+#include <linux/types.h>
+
+#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
+DECLARE_PER_CPU(long, misaligned_access_speed);
+
+DECLARE_STATIC_KEY_FALSE(fast_misaligned_access_speed_key);
+
+static __always_inline bool has_fast_misaligned_accesses(void)
+{
+	return static_branch_likely(&fast_misaligned_access_speed_key);
+}
+#else
+static __always_inline bool has_fast_misaligned_accesses(void)
+{
+	return static_branch_likely(&fast_misaligned_access_speed_key);
+}
+#endif
+#endif
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index f71910718053..8be7f17da9ab 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -62,6 +62,9 @@ obj-y	+= tests/
 obj-$(CONFIG_MMU) += vdso.o vdso/
 
 obj-$(CONFIG_RISCV_MISALIGNED)	+= traps_misaligned.o
+ifneq ($(RISCV_EFFICIENT_UNALIGNED_ACCESS), y)
+obj-y	+= misaligned_access_speed.o
+endif
 obj-$(CONFIG_FPU)		+= fpu.o
 obj-$(CONFIG_RISCV_ISA_V)	+= vector.o
 obj-$(CONFIG_RISCV_ISA_V)	+= kernel_mode_vector.o
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 89920f84d0a3..319670af5704 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -11,7 +11,6 @@
 #include <linux/cpu.h>
 #include <linux/cpuhotplug.h>
 #include <linux/ctype.h>
-#include <linux/jump_label.h>
 #include <linux/log2.h>
 #include <linux/memory.h>
 #include <linux/module.h>
@@ -21,20 +20,12 @@
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
 #include <asm/hwcap.h>
-#include <asm/hwprobe.h>
 #include <asm/patch.h>
 #include <asm/processor.h>
 #include <asm/vector.h>
 
-#include "copy-unaligned.h"
-
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
 
-#define MISALIGNED_ACCESS_JIFFIES_LG2 1
-#define MISALIGNED_BUFFER_SIZE 0x4000
-#define MISALIGNED_BUFFER_ORDER get_order(MISALIGNED_BUFFER_SIZE)
-#define MISALIGNED_COPY_SIZE ((MISALIGNED_BUFFER_SIZE / 2) - 0x80)
-
 unsigned long elf_hwcap __read_mostly;
 
 /* Host ISA bitmap */
@@ -43,11 +34,6 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 /* Per-cpu ISA extensions. */
 struct riscv_isainfo hart_isa[NR_CPUS];
 
-/* Performance information */
-DEFINE_PER_CPU(long, misaligned_access_speed);
-
-static cpumask_t fast_misaligned_access;
-
 /**
  * riscv_isa_extension_base() - Get base extension word
  *
@@ -706,247 +692,6 @@ unsigned long riscv_get_elf_hwcap(void)
 	return hwcap;
 }
 
-static int check_unaligned_access(void *param)
-{
-	int cpu = smp_processor_id();
-	u64 start_cycles, end_cycles;
-	u64 word_cycles;
-	u64 byte_cycles;
-	int ratio;
-	unsigned long start_jiffies, now;
-	struct page *page = param;
-	void *dst;
-	void *src;
-	long speed = RISCV_HWPROBE_MISALIGNED_SLOW;
-
-	if (check_unaligned_access_emulated(cpu))
-		return 0;
-
-	/* Make an unaligned destination buffer. */
-	dst = (void *)((unsigned long)page_address(page) | 0x1);
-	/* Unalign src as well, but differently (off by 1 + 2 = 3). */
-	src = dst + (MISALIGNED_BUFFER_SIZE / 2);
-	src += 2;
-	word_cycles = -1ULL;
-	/* Do a warmup. */
-	__riscv_copy_words_unaligned(dst, src, MISALIGNED_COPY_SIZE);
-	preempt_disable();
-	start_jiffies = jiffies;
-	while ((now = jiffies) == start_jiffies)
-		cpu_relax();
-
-	/*
-	 * For a fixed amount of time, repeatedly try the function, and take
-	 * the best time in cycles as the measurement.
-	 */
-	while (time_before(jiffies, now + (1 << MISALIGNED_ACCESS_JIFFIES_LG2))) {
-		start_cycles = get_cycles64();
-		/* Ensure the CSR read can't reorder WRT to the copy. */
-		mb();
-		__riscv_copy_words_unaligned(dst, src, MISALIGNED_COPY_SIZE);
-		/* Ensure the copy ends before the end time is snapped. */
-		mb();
-		end_cycles = get_cycles64();
-		if ((end_cycles - start_cycles) < word_cycles)
-			word_cycles = end_cycles - start_cycles;
-	}
-
-	byte_cycles = -1ULL;
-	__riscv_copy_bytes_unaligned(dst, src, MISALIGNED_COPY_SIZE);
-	start_jiffies = jiffies;
-	while ((now = jiffies) == start_jiffies)
-		cpu_relax();
-
-	while (time_before(jiffies, now + (1 << MISALIGNED_ACCESS_JIFFIES_LG2))) {
-		start_cycles = get_cycles64();
-		mb();
-		__riscv_copy_bytes_unaligned(dst, src, MISALIGNED_COPY_SIZE);
-		mb();
-		end_cycles = get_cycles64();
-		if ((end_cycles - start_cycles) < byte_cycles)
-			byte_cycles = end_cycles - start_cycles;
-	}
-
-	preempt_enable();
-
-	/* Don't divide by zero. */
-	if (!word_cycles || !byte_cycles) {
-		pr_warn("cpu%d: rdtime lacks granularity needed to measure unaligned access speed\n",
-			cpu);
-
-		return 0;
-	}
-
-	if (word_cycles < byte_cycles)
-		speed = RISCV_HWPROBE_MISALIGNED_FAST;
-
-	ratio = div_u64((byte_cycles * 100), word_cycles);
-	pr_info("cpu%d: Ratio of byte access time to unaligned word access is %d.%02d, unaligned accesses are %s\n",
-		cpu,
-		ratio / 100,
-		ratio % 100,
-		(speed == RISCV_HWPROBE_MISALIGNED_FAST) ? "fast" : "slow");
-
-	per_cpu(misaligned_access_speed, cpu) = speed;
-
-	/*
-	 * Set the value of fast_misaligned_access of a CPU. These operations
-	 * are atomic to avoid race conditions.
-	 */
-	if (speed == RISCV_HWPROBE_MISALIGNED_FAST)
-		cpumask_set_cpu(cpu, &fast_misaligned_access);
-	else
-		cpumask_clear_cpu(cpu, &fast_misaligned_access);
-
-	return 0;
-}
-
-static void check_unaligned_access_nonboot_cpu(void *param)
-{
-	unsigned int cpu = smp_processor_id();
-	struct page **pages = param;
-
-	if (smp_processor_id() != 0)
-		check_unaligned_access(pages[cpu]);
-}
-
-DEFINE_STATIC_KEY_FALSE(fast_misaligned_access_speed_key);
-
-static void modify_unaligned_access_branches(cpumask_t *mask, int weight)
-{
-	if (cpumask_weight(mask) == weight)
-		static_branch_enable_cpuslocked(&fast_misaligned_access_speed_key);
-	else
-		static_branch_disable_cpuslocked(&fast_misaligned_access_speed_key);
-}
-
-static void set_unaligned_access_static_branches_except_cpu(int cpu)
-{
-	/*
-	 * Same as set_unaligned_access_static_branches, except excludes the
-	 * given CPU from the result. When a CPU is hotplugged into an offline
-	 * state, this function is called before the CPU is set to offline in
-	 * the cpumask, and thus the CPU needs to be explicitly excluded.
-	 */
-
-	cpumask_t fast_except_me;
-
-	cpumask_and(&fast_except_me, &fast_misaligned_access, cpu_online_mask);
-	cpumask_clear_cpu(cpu, &fast_except_me);
-
-	modify_unaligned_access_branches(&fast_except_me, num_online_cpus() - 1);
-}
-
-static void set_unaligned_access_static_branches(void)
-{
-	/*
-	 * This will be called after check_unaligned_access_all_cpus so the
-	 * result of unaligned access speed for all CPUs will be available.
-	 *
-	 * To avoid the number of online cpus changing between reading
-	 * cpu_online_mask and calling num_online_cpus, cpus_read_lock must be
-	 * held before calling this function.
-	 */
-
-	cpumask_t fast_and_online;
-
-	cpumask_and(&fast_and_online, &fast_misaligned_access, cpu_online_mask);
-
-	modify_unaligned_access_branches(&fast_and_online, num_online_cpus());
-}
-
-static int lock_and_set_unaligned_access_static_branch(void)
-{
-	cpus_read_lock();
-	set_unaligned_access_static_branches();
-	cpus_read_unlock();
-
-	return 0;
-}
-
-arch_initcall_sync(lock_and_set_unaligned_access_static_branch);
-
-static int riscv_online_cpu(unsigned int cpu)
-{
-	static struct page *buf;
-
-	/* We are already set since the last check */
-	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_UNKNOWN)
-		goto exit;
-
-	buf = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
-	if (!buf) {
-		pr_warn("Allocation failure, not measuring misaligned performance\n");
-		return -ENOMEM;
-	}
-
-	check_unaligned_access(buf);
-	__free_pages(buf, MISALIGNED_BUFFER_ORDER);
-
-exit:
-	set_unaligned_access_static_branches();
-
-	return 0;
-}
-
-static int riscv_offline_cpu(unsigned int cpu)
-{
-	set_unaligned_access_static_branches_except_cpu(cpu);
-
-	return 0;
-}
-
-/* Measure unaligned access on all CPUs present at boot in parallel. */
-static int check_unaligned_access_all_cpus(void)
-{
-	unsigned int cpu;
-	unsigned int cpu_count = num_possible_cpus();
-	struct page **bufs = kzalloc(cpu_count * sizeof(struct page *),
-				     GFP_KERNEL);
-
-	if (!bufs) {
-		pr_warn("Allocation failure, not measuring misaligned performance\n");
-		return 0;
-	}
-
-	/*
-	 * Allocate separate buffers for each CPU so there's no fighting over
-	 * cache lines.
-	 */
-	for_each_cpu(cpu, cpu_online_mask) {
-		bufs[cpu] = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
-		if (!bufs[cpu]) {
-			pr_warn("Allocation failure, not measuring misaligned performance\n");
-			goto out;
-		}
-	}
-
-	/* Check everybody except 0, who stays behind to tend jiffies. */
-	on_each_cpu(check_unaligned_access_nonboot_cpu, bufs, 1);
-
-	/* Check core 0. */
-	smp_call_on_cpu(0, check_unaligned_access, bufs[0], true);
-
-	/*
-	 * Setup hotplug callbacks for any new CPUs that come online or go
-	 * offline.
-	 */
-	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
-				  riscv_online_cpu, riscv_offline_cpu);
-
-out:
-	unaligned_emulation_finish();
-	for_each_cpu(cpu, cpu_online_mask) {
-		if (bufs[cpu])
-			__free_pages(bufs[cpu], MISALIGNED_BUFFER_ORDER);
-	}
-
-	kfree(bufs);
-	return 0;
-}
-
-arch_initcall(check_unaligned_access_all_cpus);
-
 void riscv_user_isa_enable(void)
 {
 	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICBOZ))
diff --git a/arch/riscv/kernel/misaligned_access_speed.c b/arch/riscv/kernel/misaligned_access_speed.c
new file mode 100644
index 000000000000..b725c07dd1af
--- /dev/null
+++ b/arch/riscv/kernel/misaligned_access_speed.c
@@ -0,0 +1,265 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2024 Rivos Inc.
+ */
+
+#include <linux/cpu.h>
+#include <linux/cpumask.h>
+#include <linux/jump_label.h>
+#include <linux/mm.h>
+#include <linux/smp.h>
+#include <linux/types.h>
+#include <asm/cpufeature.h>
+#include <asm/hwprobe.h>
+
+#include "copy-unaligned.h"
+
+#define MISALIGNED_ACCESS_JIFFIES_LG2 1
+#define MISALIGNED_BUFFER_SIZE 0x4000
+#define MISALIGNED_BUFFER_ORDER get_order(MISALIGNED_BUFFER_SIZE)
+#define MISALIGNED_COPY_SIZE ((MISALIGNED_BUFFER_SIZE / 2) - 0x80)
+
+DEFINE_PER_CPU(long, misaligned_access_speed);
+
+static cpumask_t fast_misaligned_access;
+
+static int check_unaligned_access(void *param)
+{
+	int cpu = smp_processor_id();
+	u64 start_cycles, end_cycles;
+	u64 word_cycles;
+	u64 byte_cycles;
+	int ratio;
+	unsigned long start_jiffies, now;
+	struct page *page = param;
+	void *dst;
+	void *src;
+	long speed = RISCV_HWPROBE_MISALIGNED_SLOW;
+
+	if (check_unaligned_access_emulated(cpu))
+		return 0;
+
+	/* Make an unaligned destination buffer. */
+	dst = (void *)((unsigned long)page_address(page) | 0x1);
+	/* Unalign src as well, but differently (off by 1 + 2 = 3). */
+	src = dst + (MISALIGNED_BUFFER_SIZE / 2);
+	src += 2;
+	word_cycles = -1ULL;
+	/* Do a warmup. */
+	__riscv_copy_words_unaligned(dst, src, MISALIGNED_COPY_SIZE);
+	preempt_disable();
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
+		__riscv_copy_words_unaligned(dst, src, MISALIGNED_COPY_SIZE);
+		/* Ensure the copy ends before the end time is snapped. */
+		mb();
+		end_cycles = get_cycles64();
+		if ((end_cycles - start_cycles) < word_cycles)
+			word_cycles = end_cycles - start_cycles;
+	}
+
+	byte_cycles = -1ULL;
+	__riscv_copy_bytes_unaligned(dst, src, MISALIGNED_COPY_SIZE);
+	start_jiffies = jiffies;
+	while ((now = jiffies) == start_jiffies)
+		cpu_relax();
+
+	while (time_before(jiffies, now + (1 << MISALIGNED_ACCESS_JIFFIES_LG2))) {
+		start_cycles = get_cycles64();
+		mb();
+		__riscv_copy_bytes_unaligned(dst, src, MISALIGNED_COPY_SIZE);
+		mb();
+		end_cycles = get_cycles64();
+		if ((end_cycles - start_cycles) < byte_cycles)
+			byte_cycles = end_cycles - start_cycles;
+	}
+
+	preempt_enable();
+
+	/* Don't divide by zero. */
+	if (!word_cycles || !byte_cycles) {
+		pr_warn("cpu%d: rdtime lacks granularity needed to measure unaligned access speed\n",
+			cpu);
+
+		return 0;
+	}
+
+	if (word_cycles < byte_cycles)
+		speed = RISCV_HWPROBE_MISALIGNED_FAST;
+
+	ratio = div_u64((byte_cycles * 100), word_cycles);
+	pr_info("cpu%d: Ratio of byte access time to unaligned word access is %d.%02d, unaligned accesses are %s\n",
+		cpu,
+		ratio / 100,
+		ratio % 100,
+		(speed == RISCV_HWPROBE_MISALIGNED_FAST) ? "fast" : "slow");
+
+	per_cpu(misaligned_access_speed, cpu) = speed;
+
+	/*
+	 * Set the value of fast_misaligned_access of a CPU. These operations
+	 * are atomic to avoid race conditions.
+	 */
+	if (speed == RISCV_HWPROBE_MISALIGNED_FAST)
+		cpumask_set_cpu(cpu, &fast_misaligned_access);
+	else
+		cpumask_clear_cpu(cpu, &fast_misaligned_access);
+
+	return 0;
+}
+
+static void check_unaligned_access_nonboot_cpu(void *param)
+{
+	unsigned int cpu = smp_processor_id();
+	struct page **pages = param;
+
+	if (smp_processor_id() != 0)
+		check_unaligned_access(pages[cpu]);
+}
+
+DEFINE_STATIC_KEY_FALSE(fast_misaligned_access_speed_key);
+
+static void modify_unaligned_access_branches(cpumask_t *mask, int weight)
+{
+	if (cpumask_weight(mask) == weight)
+		static_branch_enable_cpuslocked(&fast_misaligned_access_speed_key);
+	else
+		static_branch_disable_cpuslocked(&fast_misaligned_access_speed_key);
+}
+
+static void set_unaligned_access_static_branches_except_cpu(int cpu)
+{
+	/*
+	 * Same as set_unaligned_access_static_branches, except excludes the
+	 * given CPU from the result. When a CPU is hotplugged into an offline
+	 * state, this function is called before the CPU is set to offline in
+	 * the cpumask, and thus the CPU needs to be explicitly excluded.
+	 */
+
+	cpumask_t fast_except_me;
+
+	cpumask_and(&fast_except_me, &fast_misaligned_access, cpu_online_mask);
+	cpumask_clear_cpu(cpu, &fast_except_me);
+
+	modify_unaligned_access_branches(&fast_except_me, num_online_cpus() - 1);
+}
+
+static void set_unaligned_access_static_branches(void)
+{
+	/*
+	 * This will be called after check_unaligned_access_all_cpus so the
+	 * result of unaligned access speed for all CPUs will be available.
+	 *
+	 * To avoid the number of online cpus changing between reading
+	 * cpu_online_mask and calling num_online_cpus, cpus_read_lock must be
+	 * held before calling this function.
+	 */
+
+	cpumask_t fast_and_online;
+
+	cpumask_and(&fast_and_online, &fast_misaligned_access, cpu_online_mask);
+
+	modify_unaligned_access_branches(&fast_and_online, num_online_cpus());
+}
+
+static int lock_and_set_unaligned_access_static_branch(void)
+{
+	cpus_read_lock();
+	set_unaligned_access_static_branches();
+	cpus_read_unlock();
+
+	return 0;
+}
+
+arch_initcall_sync(lock_and_set_unaligned_access_static_branch);
+
+static int riscv_online_cpu(unsigned int cpu)
+{
+	static struct page *buf;
+
+	/* We are already set since the last check */
+	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_UNKNOWN)
+		goto exit;
+
+	buf = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
+	if (!buf) {
+		pr_warn("Allocation failure, not measuring misaligned performance\n");
+		return -ENOMEM;
+	}
+
+	check_unaligned_access(buf);
+	__free_pages(buf, MISALIGNED_BUFFER_ORDER);
+
+exit:
+	set_unaligned_access_static_branches();
+
+	return 0;
+}
+
+static int riscv_offline_cpu(unsigned int cpu)
+{
+	set_unaligned_access_static_branches_except_cpu(cpu);
+
+	return 0;
+}
+
+/* Measure unaligned access on all CPUs present at boot in parallel. */
+static int check_unaligned_access_all_cpus(void)
+{
+	unsigned int cpu;
+	unsigned int cpu_count = num_possible_cpus();
+	struct page **bufs = kzalloc(cpu_count * sizeof(struct page *),
+				     GFP_KERNEL);
+
+	if (!bufs) {
+		pr_warn("Allocation failure, not measuring misaligned performance\n");
+		return 0;
+	}
+
+	/*
+	 * Allocate separate buffers for each CPU so there's no fighting over
+	 * cache lines.
+	 */
+	for_each_cpu(cpu, cpu_online_mask) {
+		bufs[cpu] = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
+		if (!bufs[cpu]) {
+			pr_warn("Allocation failure, not measuring misaligned performance\n");
+			goto out;
+		}
+	}
+
+	/* Check everybody except 0, who stays behind to tend jiffies. */
+	on_each_cpu(check_unaligned_access_nonboot_cpu, bufs, 1);
+
+	/* Check core 0. */
+	smp_call_on_cpu(0, check_unaligned_access, bufs[0], true);
+
+	/*
+	 * Setup hotplug callbacks for any new CPUs that come online or go
+	 * offline.
+	 */
+	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
+				  riscv_online_cpu, riscv_offline_cpu);
+
+out:
+	unaligned_emulation_finish();
+	for_each_cpu(cpu, cpu_online_mask) {
+		if (bufs[cpu])
+			__free_pages(bufs[cpu], MISALIGNED_BUFFER_ORDER);
+	}
+
+	kfree(bufs);
+	return 0;
+}
+
+arch_initcall(check_unaligned_access_all_cpus);
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index a7c56b41efd2..3f1a6edfdb08 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -149,6 +149,7 @@ static bool hwprobe_ext0_has(const struct cpumask *cpus, unsigned long ext)
 
 static u64 hwprobe_misaligned(const struct cpumask *cpus)
 {
+#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
 	int cpu;
 	u64 perf = -1ULL;
 
@@ -168,6 +169,9 @@ static u64 hwprobe_misaligned(const struct cpumask *cpus)
 		return RISCV_HWPROBE_MISALIGNED_UNKNOWN;
 
 	return perf;
+#else
+	return RISCV_HWPROBE_MISALIGNED_FAST;
+#endif
 }
 
 static void hwprobe_one_pair(struct riscv_hwprobe *pair,

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
