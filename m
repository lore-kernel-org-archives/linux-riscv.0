Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31ADC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 16:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I7u6XiwH4aQW4cS6Zu85VOI1nA4Ynz8SrrEVNM5FjFI=; b=0AMznBVFHckDct
	mILboEHTTKhYYL9ipUu3NYn6Px8N5KgKdllJNNEDGvYh9jYqxJBieIVQ4zy5Dq2EsHQTc73fQpKAm
	q2ZouravsgNbAK8QTIEukdIjI853nf1QksdsiYDdyexU+Nj9tJmKTYQkORV+r2PDUMG5YggmEIrYt
	0uKMYRSdiVL0KdE3LWUn+8Y4JNX4H1hCEWjAeQ5+LT2VcnH78sol/1ttKp7hADfYiWgKI0vLl0jLi
	0jtW0L2hKKZ5Ahqiw3kkx6SJ0eTyjYHoSTkhGLx1K/2P/vw2tDtg8RurT8i68A8r9SXXDC21vPQHi
	8M4SDI3/ejrfho6jx4uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXNxB-00000004R7V-3Atf;
	Fri, 26 Jul 2024 16:38:01 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXNx5-00000004R1s-35Wp
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 16:37:58 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2cb5789297eso790281a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 09:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722011874; x=1722616674; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xgNvoZZjYGSQoQk8wgRdXSUA1h+KM6ckJH/M9L6ssNQ=;
        b=udcycldPJy5jSymsQyjQxbCKuB6j0g/nFm4JUnVfXdcPsd0ovHqHLKmjtMaIujfPNC
         yq0BYOgxZsLQDOQSorOI8tPBOIDuFUR8FHOdTDdin6m4LJRzND8cN+vn3fQ/FndC6FC3
         ADogWUpBBjKUnilAf3FNsft7UauKpBMEpn7KTtLge5AnM6dnaRr/vno5Au+uQK4WEuzT
         +DEuMYpvB3NiOeOdJj358GejjmX00SoT48GrM+kS/e25w7NKsxgoh92gw6kQVDhzFOXe
         5bJLL95zclB/Lx0RV68XyfWUaCWyA9Jawr5wjV3Pv/XJArxrlbCkvAB771V6zI77844a
         YGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722011874; x=1722616674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xgNvoZZjYGSQoQk8wgRdXSUA1h+KM6ckJH/M9L6ssNQ=;
        b=GH9jIk6nWOj6sBIvYwF4du7t+HLRmgo/5R2/rNjza4ff9F484V7U148zXr99xkBaBp
         DMeju+4J4DfC0I9fuA5mXkZRvtc/jjjHXpYedt8hs5HEPsB3xRRYVDwFq/ldyCLQlluW
         8KwLdCTX8UQ8beriXbScOpIUvJ+n025ieVEEf0bO1Z4zDk9lKjrQJ7R0qPidIKeo9me0
         X9Wrd0Pko/f5asrBmuHDlZsRe8ziLU/WIILBdLcjh4Zc2UvhpuvlyWKSjT4Emnlm9HIl
         h+HTFpZBMTUnIlqixWmOsuxUC84GxhdyeK4jVKSv1FwMgma2RKxwfilaE8C7zqN0XEnb
         aAKg==
X-Gm-Message-State: AOJu0YzsO0vJdqWQdCwrdc5JguSnsHJF9t0ogo5/nEvIGsfh4QX+aZCZ
	jYo+lfVXcoVBBqpyOdKY6Q50j9N8rME78C4a1A2bLyLYQa0WGmKmCu9SMyvefIBjc2Tf1EB1pba
	+
X-Google-Smtp-Source: AGHT+IFwaBOvRsjbQX7EWJtYGpRcesMfm22BYAZsC53JwBs6H3g+yumJhw4KF69PwuJ3umcfwBWGXg==
X-Received: by 2002:a17:90a:a014:b0:2cb:1563:ccd1 with SMTP id 98e67ed59e1d1-2cf7e73094bmr20170a91.38.1722011873910;
        Fri, 26 Jul 2024 09:37:53 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cf28c55a2dsm3676619a91.7.2024.07.26.09.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 09:37:53 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v7 7/8] RISC-V: Report vector unaligned access speed hwprobe
Date: Fri, 26 Jul 2024 12:37:18 -0400
Message-ID: <20240726163719.1667923-8-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726163719.1667923-1-jesse@rivosinc.com>
References: <20240726163719.1667923-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_093756_013756_249653E1 
X-CRM114-Status: GOOD (  29.87  )
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

Detect if vector misaligned accesses are faster or slower than
equivalent vector byte accesses. This is useful for usermode to know
whether vector byte accesses or vector misaligned accesses have a better
bandwidth for operations like memcpy.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
V1 -> V2:
 - Add Kconfig options
 - Add WORD_EEW to vec-copy-unaligned.S
V2 -> V3:
 - Remove unnecessary comment
 - Remove local_irq_enable
V3 -> V4:
 - Add preempt_disable/enable
 - Alphabetize includes in vec-copy-unaligned.S and unaligned_access_speed.c
 - Add duplicate comments above mb() to please checkpatch
 - change all_cpus_vec_supported to all_cpus_vec_unsupported
    so speed is tested if any cpus support unaligned vector accesses
 - Spell out _VECTOR_ in macros
V4 -> V5:
 - Change void *unused to void *unused __always_unused
V5 -> V6:
 - Check for vector misaligned access support in hotplug
V6 -> V7:
 - Change SLOW to UNKNOWN when used as a placeholder
---
 arch/riscv/Kconfig                         |  18 +++
 arch/riscv/kernel/Makefile                 |   3 +-
 arch/riscv/kernel/copy-unaligned.h         |   5 +
 arch/riscv/kernel/sys_hwprobe.c            |   6 +
 arch/riscv/kernel/unaligned_access_speed.c | 141 ++++++++++++++++++++-
 arch/riscv/kernel/vec-copy-unaligned.S     |  58 +++++++++
 6 files changed, 228 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/kernel/vec-copy-unaligned.S

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ffbe0fdd7fb3..e98139340c1c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -807,6 +807,24 @@ config RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
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
 
 endmenu # "Platform type"
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 5b243d46f4b1..291935a084d5 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -64,7 +64,8 @@ obj-$(CONFIG_MMU) += vdso.o vdso/
 
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
index 2e3e324bad38..99d3e63d0444 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -221,6 +221,12 @@ static u64 hwprobe_vec_misaligned(const struct cpumask *cpus)
 #else
 static u64 hwprobe_vec_misaligned(const struct cpumask *cpus)
 {
+	if (IS_ENABLED(CONFIG_RISCV_EFFICIENT_VECTOR_UNALIGNED_ACCESS))
+		return RISCV_HWPROBE_VECTOR_MISALIGNED_FAST;
+
+	if (IS_ENABLED(CONFIG_RISCV_SLOW_VECTOR_UNALIGNED_ACCESS))
+		return RISCV_HWPROBE_VECTOR_MISALIGNED_SLOW;
+
 	return RISCV_HWPROBE_VECTOR_MISALIGNED_UNKNOWN;
 }
 #endif
diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 1a87dfe9cb87..1cc35be0aaaa 100644
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
+	long speed = RISCV_HWPROBE_VECTOR_MISALIGNED_SLOW;
+
+	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_VECTOR_MISALIGNED_UNKNOWN)
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
+		speed = RISCV_HWPROBE_VECTOR_MISALIGNED_FAST;
+
+	ratio = div_u64((byte_cycles * 100), word_cycles);
+	pr_info("cpu%d: Ratio of vector byte access time to vector unaligned word access is %d.%02d, unaligned accesses are %s\n",
+		cpu,
+		ratio / 100,
+		ratio % 100,
+		(speed ==  RISCV_HWPROBE_VECTOR_MISALIGNED_FAST) ? "fast" : "slow");
+
+	per_cpu(vector_misaligned_access, cpu) = speed;
+}
+
+static int riscv_online_cpu_vec(unsigned int cpu)
+{
+	if (!has_vector())
+		return 0;
+
+	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_VECTOR_MISALIGNED_UNSUPPORTED)
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
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
