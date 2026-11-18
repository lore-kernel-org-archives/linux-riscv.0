Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146C3606A32A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 08:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=etje9zVa;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=T6XqHq0M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lxxzb9s+rlFBdm7DjJT20WinhBmaStoCvHQblKBhsxs=; b=etje9zVaVuBam+2bY6ddkWOL+p
	gG5VvzoqOOUe8EAMPG/dHNAig0esZLgclzNNel1c2Jy4n5c2ZP9AYiE8cQaGT4gvcmodBcGKj7PlB
	a/Um8OObVa9nqt/Enkoa64KGE+t4HowbzXq2V1pDkyvTxHqQw1PeruvHW4YTGRNhzAgcQd8RVr0vG
	0kBTYGPKUMgf2kPyT/mugbA6WshwlH+yXBaoh14IzwvMOcNC7wVK/+t+rM1P/rUWs9+uXffk+/qUF
	X5pmzdK72IVN2Q+nRY+d9Oxe4IqxDxOGBhOaUMbgN/mPtOaigXPP/T/0t0wYBdDIPdxnppZwFAxV+
	GBn8jjYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTanx-0000000873z-18Aj;
	Wed, 18 Nov 2026 08:14:09 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTanv-0000000872k-1pXv
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 08:14:08 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3b3b3c072eeso371487a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 00:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794989647; x=1795594447; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f2NCZzGgcdrImPed9UnBZvgkK6Iy+On/sKgEAZMJnX8=;
        b=T6XqHq0MoTxP4kljyUEiKqmpNQ6F8YPjW/C0mAQ3mexj03cw/i0VyW481m75yHjsOt
         9mRlyt+t1Hu/Pl8trxrh40VDFjpS/coqXx0Ypuxff5haSGr1GfBeBLbSskcNkZhbnBSs
         Z5X0+urE87VZcAHeuilHy2o198hxGPveeNbu1qMu6bOQ7Df34TzKYdH+q+rlTEPXPuax
         3Ji98XYvsTobHkB5O7/0Te6slgPS9dkIy4SjT8xlEtKRZ9NoDtJaPWorHGvtJKASTVfj
         pQMtMIG6J5u+fxoxDQYOTXXo6FnESqfMpri/1QsenGkFP9fbjNwq579znX0c/gfEfW9w
         BS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989647; x=1795594447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f2NCZzGgcdrImPed9UnBZvgkK6Iy+On/sKgEAZMJnX8=;
        b=0RLTEFfz07htAaMxiiFIqvMqiLrMol4CLUivxfShk5Ai87+BW2EtZL+qYMvgXiqVFN
         XJyh2eAvLtkS0DVjSebO7Cxm4P+q9aUnqVDa6paYZJtV7oWdj3Pd8iltdI1Q32+Xptwo
         ky67HpyKHo+taZs+83pK5TIoUVJwDq86qvSQA08hJG4AeQOCdBM32RSw7w+3ra5FPhwu
         pdzwcRAyJ+h66baRFveNqdQRCaL7eDmxHezfqn02jag5FssojdmboEfSVZzuOMgfecJe
         6HIhJQviNd41voZh9sY1cTxOFOP/32dhe/sIrm4KsJs///JPnA2WvcQTwFDb/wDONQmY
         KrSg==
X-Gm-Message-State: APuU4Z97XbLppu0aDAjOtZpxd02ZXDEjtnwWYvj6aYzcmIGptm//dKZO
	3rLeRyyhl/P1LDUunABkZhd2LPxSTuIbmhA803+ZswZH0s/hdcx+d6O+B0i72kDBQ4sZT/Medgo
	JL/iD
X-Gm-Gg: AZFdTZdLpHdyVeTyk6Ba9BN0DjaUMfiWk+J9oFIkPOE0z4+cETZzMrGXRhhKH3oAtH9
	N7iMRu9g1yHEMTfEpvNJszOyRKYpp1g6H5ieKOCYRlPaKqz+dUmt6+6YcFgzGRwOcqxL3bVNWH8
	hiv6n5emsTQ2KeeE2Bld9k/BUs8reAsdMna1NoZNtyW5OH1AC74jVyDNPqHt+Lt/EMedwR7TOua
	+esV69lPOTOHIhu78r+dTqipPxY9DFmHwzQILQBUzPrFyJc9Nbb+ZHW3Yeh7q3ho0/u7SZeqVuR
	UyO5nCWbM4L99oiklnkflHkdnEHcUNovqjV2iQyzE1+9poKnma2mwA8QTdfk08v9RHYCt2lnwXX
	H2+8Pw2oqujOR7TUrIpXmL1K2KkJqK7NdaumrKUyzbooWunA5ASsAZCLgaNMsxGxYH+BFWKtA+Q
	htV00wBlsxQuWYGt+M3yPPfURHeBO8HGoaRCjKP9iGRXdLAnlL0D0J+iqJrYSdRs/jb2ZBDh/8W
	aKw+1yGL3hKRBX85yKA9RAZVgpvAqxMgUbzEHdjbfQncT5sLHCSAkzE0ckiyGf/kqIX+UDGfIrs
	xRMQDz78NtPBCTXoiq/f0TwnViGql2+T9AQn5dqVaWI6Mar6rrCax7+y8Y4PprqZm7jqujYxJED
	z58YMLho=
X-Received: by 2002:a17:90b:1649:b0:3ab:c370:3684 with SMTP id 98e67ed59e1d1-3b3d07c3f7cmr1818912a91.30.1794989646684;
        Wed, 18 Nov 2026 00:14:06 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acde50sm3254680a91.14.2026.11.18.00.13.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 00:14:06 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	andrew.jones@linux.dev,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	atish.patra@linux.dev,
	anup@brainfault.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	yuanzhu@bytedance.com,
	cuiyunhui@bytedance.com,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	will@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: [RFC PATCH v1 3/5] perf: riscv: Probe the experimental PDIS CSR layout on matching CPUs
Date: Wed, 18 Nov 2026 16:13:31 +0800
Message-ID: <20261118081327.10684-10-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261118081327.10684-7-zhangzhanpeng.jasper@bytedance.com>
References: <20261118081327.10684-7-zhangzhanpeng.jasper@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_001407_491300_B18DE5E0 
X-CRM114-Status: GOOD (  21.55  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The draft leaves CSR encodings unallocated. Require an explicit boot
opt-in, the csr-v1 test-model marker and the supervisor ISA extensions
before accessing the provisional registers. Probe the control, counter
width and filters with exception fixups and leave the unit inhibited.

Run the probe during CPU bringup on the standard local counter overflow
interrupt path. Quiesce the unit at CPU teardown. The experiment uses
RV64 with KVM disabled and matching firmware that excludes M/VS/VU.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 .../admin-guide/kernel-parameters.txt         |  10 ++
 MAINTAINERS                                   |   1 +
 drivers/perf/Kconfig                          |  13 ++
 drivers/perf/Makefile                         |   1 +
 drivers/perf/riscv_pdis.c                     | 137 ++++++++++++++++++
 drivers/perf/riscv_pdis.h                     |  13 ++
 drivers/perf/riscv_pmu_sbi.c                  |   5 +
 7 files changed, 180 insertions(+)
 create mode 100644 drivers/perf/riscv_pdis.c
 create mode 100644 drivers/perf/riscv_pdis.h

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0b3c140babd9..dc15ddd29cf4 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6722,6 +6722,16 @@ Kernel parameters
 		fcfi	Disable user forward CFI ABI to userspace even if the
 			landing pad extension is available.
 
+	riscv_pdis_test= [RISCV,EARLY]
+			Format: <bool>
+			Authorize the experimental PDIS PMU to probe temporary
+			CSR encodings. Requires CONFIG_RISCV_PDIS_CSR,
+			CONFIG_KVM=n and matching test firmware. The private
+			test DT must mark each matching CPU with
+			riscv,pdis-test-model = "csr-v1".
+			Firmware must also advertise Sspdis on each usable CPU.
+			Default: disabled. Do not enable on production hardware.
+
 	ro		[KNL] Mount root device read-only on boot
 
 	rodata=		[KNL,EARLY]
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..3e695d4c5fc1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24128,6 +24128,7 @@ M:	Atish Patra <atish.patra@linux.dev>
 R:	Anup Patel <anup@brainfault.org>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
+F:	drivers/perf/riscv_pdis*
 F:	drivers/perf/riscv_pmu.c
 F:	drivers/perf/riscv_pmu_legacy.c
 F:	drivers/perf/riscv_pmu_sbi.c
diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
index 245e7bb763b9..791d252d4952 100644
--- a/drivers/perf/Kconfig
+++ b/drivers/perf/Kconfig
@@ -105,6 +105,19 @@ config RISCV_PMU_SBI
 	  full perf feature support i.e. counter overflow, privilege mode
 	  filtering, counter configuration.
 
+config RISCV_PDIS_CSR
+	bool "Experimental RISC-V PDIS CSR-output perf PMU"
+	depends on RISCV_PMU_SBI && 64BIT && MMU && !RISCV_M_MODE && EXPERT
+	help
+	  Build an experimental per-CPU PDIS sampling PMU. This requires a
+	  matching test model and firmware with the temporary CSR encodings.
+	  Firmware must report Sspdis on CPUs authorized to use PDIS.
+	  The riscv_pdis_test=1 boot parameter explicitly authorizes probing.
+	  Task sampling, mixed privilege and KVM are not supported. Do not
+	  enable the boot parameter on existing production hardware.
+
+	  If unsure, say N.
+
 config STARFIVE_STARLINK_PMU
 	depends on ARCH_STARFIVE || COMPILE_TEST
 	depends on 64BIT
diff --git a/drivers/perf/Makefile b/drivers/perf/Makefile
index eb8a022dad9a..203e6227dc6b 100644
--- a/drivers/perf/Makefile
+++ b/drivers/perf/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_QCOM_L3_PMU) += qcom_l3_pmu.o
 obj-$(CONFIG_RISCV_PMU) += riscv_pmu.o
 obj-$(CONFIG_RISCV_PMU_LEGACY) += riscv_pmu_legacy.o
 obj-$(CONFIG_RISCV_PMU_SBI) += riscv_pmu_sbi.o
+obj-$(CONFIG_RISCV_PDIS_CSR) += riscv_pdis.o
 obj-$(CONFIG_STARFIVE_STARLINK_PMU) += starfive_starlink_pmu.o
 obj-$(CONFIG_THUNDERX2_PMU) += thunderx2_pmu.o
 obj-$(CONFIG_XGENE_PMU) += xgene_pmu.o
diff --git a/drivers/perf/riscv_pdis.c b/drivers/perf/riscv_pdis.c
new file mode 100644
index 000000000000..b7671e5ad63e
--- /dev/null
+++ b/drivers/perf/riscv_pdis.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Experimental RV64 PDIS CSR-output PMU for an explicitly matching model. */
+
+#include <linux/bits.h>
+#include <linux/cpu.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/of.h>
+#include <linux/percpu.h>
+
+#include <asm/asm-extable.h>
+#include <asm/cpufeature.h>
+#include <asm/csr.h>
+
+#include "riscv_pdis.h"
+
+/* Draft spdis.adoc at 2de60e18118ce78e2da82ec33296345c94d8560c. */
+#define RISCV_PDIS_COUNTER_BIT		BIT(1)
+/* Local experimental encodings, not architectural CSR allocations. */
+#define RISCV_PDIS_CSR_CTL		0x5e0
+#define RISCV_PDIS_CSR_COUNTER		0x5e1
+#define RISCV_PDIS_CSR_EVMASK		0x5e2
+#define RISCV_PDIS_CSR_EVMATCH		0x5e3
+#define RISCV_PDIS_CSR_FILTER		0x5e4
+#define RISCV_PDIS_CSR_VSCTL		0x6d0
+#define RISCV_PDIS_STATEEN		BIT_ULL(55)
+#define RISCV_PDIS_CTL_ACC		BIT_ULL(33)
+
+struct pdis_cpu {
+	bool ready;
+};
+
+static DEFINE_PER_CPU(struct pdis_cpu, pdis_cpu);
+static cpumask_t pdis_cpus;
+static bool pdis_test;
+
+static int __init pdis_test_setup(char *str)
+{
+	return kstrtobool(str, &pdis_test);
+}
+early_param("riscv_pdis_test", pdis_test_setup);
+
+/* Private test DT marker, not a binding for architectural PDIS. */
+static bool pdis_test_model_matches(unsigned int cpu)
+{
+	struct device_node *node = of_cpu_device_node_get(cpu);
+	const char *model;
+	bool matches;
+
+	matches = !of_property_read_string(node, "riscv,pdis-test-model", &model) &&
+		  !strcmp(model, "csr-v1");
+	of_node_put(node);
+	return matches;
+}
+
+/* Used only during opt-in probing; missing/unauthorized CSRs must not oops. */
+static __always_inline int pdis_read_csr(unsigned int csr, unsigned long *value)
+{
+	asm goto("1: csrr %[value], %[csr]\n"
+		 _ASM_EXTABLE(1b, %l[fault])
+		 : [value] "=r" (*value) : [csr] "i" (csr) : "memory" : fault);
+	return 0;
+fault:
+	*value = 0;
+	return -ENODEV;
+}
+
+static __always_inline int pdis_write_csr(unsigned int csr, unsigned long value)
+{
+	asm goto("1: csrw %[csr], %[value]\n"
+		 _ASM_EXTABLE(1b, %l[fault])
+		 : : [value] "r" (value), [csr] "i" (csr) : "memory" : fault);
+	return 0;
+fault:
+	return -ENODEV;
+}
+
+void riscv_pdis_cpu_starting(void)
+{
+	struct pdis_cpu *pcpu = this_cpu_ptr(&pdis_cpu);
+	unsigned long ctl, inhibit, value;
+	unsigned int cpu = smp_processor_id();
+
+	pcpu->ready = false;
+	cpumask_clear_cpu(cpu, &pdis_cpus);
+	if (!pdis_test || IS_ENABLED(CONFIG_KVM) ||
+	    !riscv_cpu_has_extension_unlikely(cpu, RISCV_ISA_EXT_SSPDIS) ||
+	    !riscv_cpu_has_extension_unlikely(cpu, RISCV_ISA_EXT_SSCOFPMF) ||
+	    !riscv_cpu_has_extension_unlikely(cpu, RISCV_ISA_EXT_SSCSRIND) ||
+	    !pdis_test_model_matches(cpu))
+		return;
+
+	if (pdis_read_csr(RISCV_PDIS_CSR_CTL, &ctl) ||
+	    ctl & ~RISCV_PDIS_CTL_ACC ||
+	    pdis_read_csr(CSR_SCOUNTINHIBIT, &inhibit) ||
+	    !(inhibit & RISCV_PDIS_COUNTER_BIT))
+		return;
+	if (pdis_write_csr(RISCV_PDIS_CSR_CTL, 0) ||
+	    pdis_write_csr(RISCV_PDIS_CSR_EVMASK, 0) ||
+	    pdis_write_csr(RISCV_PDIS_CSR_EVMATCH, 0) ||
+	    pdis_write_csr(RISCV_PDIS_CSR_FILTER, 0))
+		return;
+	if (pdis_read_csr(RISCV_PDIS_CSR_EVMASK, &value) || value ||
+	    pdis_read_csr(RISCV_PDIS_CSR_EVMATCH, &value) || value ||
+	    pdis_read_csr(RISCV_PDIS_CSR_FILTER, &value) || value)
+		return;
+	/* The first version requires all 32 COUNT and INITVAL bits. */
+	if (pdis_write_csr(RISCV_PDIS_CSR_COUNTER, ~0UL) ||
+	    pdis_read_csr(RISCV_PDIS_CSR_COUNTER, &value) || value != ~0UL ||
+	    pdis_write_csr(RISCV_PDIS_CSR_COUNTER, 0))
+		return;
+	if (riscv_cpu_has_extension_unlikely(cpu, RISCV_ISA_EXT_H)) {
+		if (pdis_read_csr(RISCV_PDIS_CSR_VSCTL, &value) ||
+		    value & ~RISCV_PDIS_CTL_ACC ||
+		    pdis_read_csr(CSR_HSTATEEN0, &value) || value & RISCV_PDIS_STATEEN)
+			return;
+	}
+	pcpu->ready = true;
+	cpumask_set_cpu(cpu, &pdis_cpus);
+}
+
+static void pdis_quiesce(void)
+{
+	csr_set(CSR_SCOUNTINHIBIT, RISCV_PDIS_COUNTER_BIT);
+	/* The test-model contract requires this to cancel in-flight selections. */
+	csr_write(RISCV_PDIS_CSR_CTL, 0);
+}
+
+void riscv_pdis_cpu_dying(void)
+{
+	struct pdis_cpu *pcpu = this_cpu_ptr(&pdis_cpu);
+
+	if (pcpu->ready)
+		pdis_quiesce();
+	pcpu->ready = false;
+	cpumask_clear_cpu(smp_processor_id(), &pdis_cpus);
+}
diff --git a/drivers/perf/riscv_pdis.h b/drivers/perf/riscv_pdis.h
new file mode 100644
index 000000000000..b1ffe7d16ce0
--- /dev/null
+++ b/drivers/perf/riscv_pdis.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __RISCV_PDIS_H
+#define __RISCV_PDIS_H
+
+#ifdef CONFIG_RISCV_PDIS_CSR
+void riscv_pdis_cpu_starting(void);
+void riscv_pdis_cpu_dying(void);
+#else
+static inline void riscv_pdis_cpu_starting(void) { }
+static inline void riscv_pdis_cpu_dying(void) { }
+#endif
+
+#endif /* __RISCV_PDIS_H */
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 21a2078eab98..545b8becf90a 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -27,6 +27,8 @@
 #include <asm/vendor_extensions.h>
 #include <asm/vendor_extensions/andes.h>
 
+#include "riscv_pdis.h"
+
 #define ALT_SBI_PMU_OVERFLOW(__ovl)					\
 asm volatile(ALTERNATIVE_2(						\
 	"csrr %0, " __stringify(CSR_SCOUNTOVF),				\
@@ -1204,6 +1206,8 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
 
 	if (riscv_pmu_use_irq) {
 		cpu_hw_evt->irq = riscv_pmu_irq;
+		if (riscv_pmu_irq_num == RV_IRQ_PMU)
+			riscv_pdis_cpu_starting();
 		ALT_SBI_PMU_OVF_CLEAR_PENDING(riscv_pmu_irq_mask);
 		enable_percpu_irq(riscv_pmu_irq, IRQ_TYPE_NONE);
 	}
@@ -1216,6 +1220,7 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
 
 static int pmu_sbi_dying_cpu(unsigned int cpu, struct hlist_node *node)
 {
+	riscv_pdis_cpu_dying();
 	if (riscv_pmu_use_irq) {
 		disable_percpu_irq(riscv_pmu_irq);
 	}
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
