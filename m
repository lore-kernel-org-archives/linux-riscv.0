Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D32C02187
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jan 2025 23:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j4PsgQ6pya6FDveDw7sQhymfXNqYQrf7B30RQPnbRsk=; b=qrwysZcCVGIKXz
	TOIASRt36Wf0yZmTjlaADA8X+TIY0ju9+3+rfgQ0LgEbB9Fxxj23eNwLliD9E2vDXo8ECYhFO1oMM
	oMnHcmf3jPrm6RWZ71Ao0vYlAvE7krKnl7rpihFP1lQrmwZ8q18RTwF6GNsbVX/NCb/Bmz3677bx8
	fXnqanuIC/0DQhHJAFFZFZwpss+e2CYkoHr/rPmgHclSDqh9ek3v6mUD7+R6VBsIJRKsb1lS4EMIW
	5q3rPiLUnDvjAaAcgjYXoxtYAtFR3qhTiuwIqCBVB2/jTF6XPOF3BiqjQlV8F8enjJWrjPvZ8oTsb
	TJZslsn1TDS/CNmaFjvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZ0Y-0000000GJph-3oDq;
	Thu, 16 Jan 2025 23:10:38 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZ0V-0000000GJkK-3FL7
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jan 2025 23:10:37 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-436281c8a38so9735085e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jan 2025 15:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737069034; x=1737673834; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZCF2qhQTSScochH887+09o1kiVfF8lDkMyjFmVHhR0=;
        b=NNag2+yvelGC9zVk4R0eOlO6NdMzKWLNhrsKEO/VXTNtH0/8McnSRDg2O5RRW0wC0a
         RNISVZlPJyzGHv3tXMRoSuEioMgtyPH3zzMl+eRDDwG4MV0Fqk9BHbvTbPjHF0npzFDU
         +/KrGrHcUE10AY0qRuhjuOzUy4EmvsOG11A6RzRmqbZy3lqjQwttL8cmWP8AGEBalUI0
         brS5thajuZV1H6ee7Ft6vxQhpSwp6cGPbAdPXdx+PDg72lnZLu8LAgZok3UkmN7XVPiX
         NmQami9mwTff4jn7hh+eRqAei2HOVDq+wk7fUP5cxDF/Ep1ZNkLpwBEddudevbF36zZM
         I1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737069034; x=1737673834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZCF2qhQTSScochH887+09o1kiVfF8lDkMyjFmVHhR0=;
        b=fDT+9Ds1FDxrIYhzRaBkybQxNfgbbNj/cTN8Lv6XYLaOh5MZ1eRvU45zmGlsCj+sZl
         vf1QUbINvFzSbtOx6i46Afn57gY2jy4MdkoeIzMfBimA/eQrjJL32yqLkQXgxAoMs5nC
         qhMZLKTSrHcjLywvvYcP8ywGCxpR+P8l2kCWui0hf11cY32EiuHzxJ50XcECBuANH3ef
         JA5H7W64NSZNRfAK0BNHjhpvyHPmiDMYzV9HUf6H4SZ+QsFSn1L8RP74S6pIGtpdfDDk
         LsJQ4uMgzVV7Jfvu8LC8wkCUQ/kktf8HiUk8OoiIrRo4EdgWwawixOt9jeAO5+Dk4kkV
         /6eA==
X-Forwarded-Encrypted: i=1; AJvYcCWOxs5KMnuQYbENsDhSBBo1yfNYYtZ7yfYWWii/ArjfkxalfhJa386DM+DhTRTXl41RZ0Fnyf+VRNAAqw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5Q8pfXdz66jneXnaiN4JlkhLTtIQdoHEGt1dPYPz14UgIYRg6
	macECsPmhA0xwc6i48G/Mt5Rq0uQ8kiSusMSw/Btmi6d2Nm+g6tf11NWvo077pI=
X-Gm-Gg: ASbGncvd9jUs4pOH0hF5CItnNscYD6n/3jahKCH6z/0RzsKd++OEwo9lBVDA5CSy7rC
	bWVrEtZYg7zfMTYXjn618IAo9IQbUONFibSDpfAyBbXJTsBCMs9ay62haqZGOeUtBzR5afJ2Y37
	Lvs/0YMZT2+99ugARnwpTQrqQm9I2GYgijKttRmpIW9i1M39nQn5GMMBcQzORLTvVfCLqhKVW3y
	VQxDBKPjwkyaeIDdWQu/bOFu0e81gL4qJHINoajQRkVyQkCVaTXPyHs4tnNOeM8Nax0BjFJBPfY
	A63lMVjLcafc/uzk
X-Google-Smtp-Source: AGHT+IENNVt/z6/PQNOhZEjHjFyExbEVG67N2G2WBWJGwM1eJgy85tbXpBlyUecckzcRYTVjoisjXQ==
X-Received: by 2002:a05:600c:4e06:b0:434:e8cf:6390 with SMTP id 5b1f17b1804b1-438913c6856mr3992575e9.6.1737069033888;
        Thu, 16 Jan 2025 15:10:33 -0800 (PST)
Received: from rkanwal-XPS-15-9520.uk.rivosinc.com ([2a02:c7c:75ac:6300:b3f2:3a24:1767:7db0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322b337sm974991f8f.59.2025.01.16.15.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 15:10:33 -0800 (PST)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: linux-perf-users@vger.kernel.org,
	adrian.hunter@intel.com,
	alexander.shishkin@linux.intel.com,
	ajones@ventanamicro.com,
	anup@brainfault.org,
	acme@kernel.org,
	atishp@rivosinc.com,
	beeman@rivosinc.com,
	brauner@kernel.org,
	conor@kernel.org,
	heiko@sntech.de,
	irogers@google.com,
	mingo@redhat.com,
	james.clark@arm.com,
	renyu.zj@linux.alibaba.com,
	jolsa@kernel.org,
	jisheng.teoh@starfivetech.com,
	palmer@dabbelt.com,
	will@kernel.org,
	kaiwenxue1@gmail.com,
	vincent.chen@sifive.com,
	Rajnesh Kanwal <rkanwal@rivosinc.com>
Subject: [PATCH v2 6/7] riscv: pmu: Add driver for Control Transfer Records Ext.
Date: Thu, 16 Jan 2025 23:09:54 +0000
Message-Id: <20250116230955.867152-7-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250116230955.867152-1-rkanwal@rivosinc.com>
References: <20250116230955.867152-1-rkanwal@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_151035_822948_839BE775 
X-CRM114-Status: GOOD (  22.95  )
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

This adds support for CTR Ext defined in [0]. The extension
allows to records a maximum for 256 last branch records.

CTR extension depends on s[m|s]csrind and Sscofpmf extensions.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 MAINTAINERS                    |   1 +
 drivers/perf/Kconfig           |  11 +
 drivers/perf/Makefile          |   1 +
 drivers/perf/riscv_ctr.c       | 608 +++++++++++++++++++++++++++++++++
 include/linux/perf/riscv_pmu.h |  37 ++
 5 files changed, 658 insertions(+)
 create mode 100644 drivers/perf/riscv_ctr.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 2ef7ff933266..7bcd79f33811 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20177,6 +20177,7 @@ M:	Atish Patra <atishp@atishpatra.org>
 R:	Anup Patel <anup@brainfault.org>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
+F:	drivers/perf/riscv_ctr.c
 F:	drivers/perf/riscv_pmu_common.c
 F:	drivers/perf/riscv_pmu_dev.c
 F:	drivers/perf/riscv_pmu_legacy.c
diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
index b3bdff2a99a4..9107c5208bf5 100644
--- a/drivers/perf/Kconfig
+++ b/drivers/perf/Kconfig
@@ -129,6 +129,17 @@ config ANDES_CUSTOM_PMU
 
 	  If you don't know what to do here, say "Y".
 
+config RISCV_CTR
+       bool "Enable support for Control Transfer Records (CTR)"
+       depends on PERF_EVENTS && RISCV_PMU
+       default y
+       help
+         Enable support for Control Transfer Records (CTR) which
+         allows recording branches, Jumps, Calls, returns etc taken in an
+         execution path. This also supports privilege based filtering. It
+         captures additional relevant information such as cycle count,
+         branch misprediction etc.
+
 config ARM_PMU_ACPI
 	depends on ARM_PMU && ACPI
 	def_bool y
diff --git a/drivers/perf/Makefile b/drivers/perf/Makefile
index 0805d740c773..755609f184fe 100644
--- a/drivers/perf/Makefile
+++ b/drivers/perf/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_RISCV_PMU_COMMON) += riscv_pmu_common.o
 obj-$(CONFIG_RISCV_PMU_LEGACY) += riscv_pmu_legacy.o
 obj-$(CONFIG_RISCV_PMU) += riscv_pmu_dev.o
 obj-$(CONFIG_STARFIVE_STARLINK_PMU) += starfive_starlink_pmu.o
+obj-$(CONFIG_RISCV_CTR) += riscv_ctr.o
 obj-$(CONFIG_THUNDERX2_PMU) += thunderx2_pmu.o
 obj-$(CONFIG_XGENE_PMU) += xgene_pmu.o
 obj-$(CONFIG_ARM_SPE_PMU) += arm_spe_pmu.o
diff --git a/drivers/perf/riscv_ctr.c b/drivers/perf/riscv_ctr.c
new file mode 100644
index 000000000000..53419a656043
--- /dev/null
+++ b/drivers/perf/riscv_ctr.c
@@ -0,0 +1,608 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Control transfer records extension Helpers.
+ *
+ * Copyright (C) 2024 Rivos Inc.
+ *
+ * Author: Rajnesh Kanwal <rkanwal@rivosinc.com>
+ */
+
+#define pr_fmt(fmt) "CTR: " fmt
+
+#include <linux/bitfield.h>
+#include <linux/printk.h>
+#include <linux/types.h>
+#include <linux/perf_event.h>
+#include <linux/perf/riscv_pmu.h>
+#include <linux/cpufeature.h>
+#include <asm/hwcap.h>
+#include <asm/csr_ind.h>
+#include <asm/csr.h>
+
+#define CTR_BRANCH_FILTERS_INH  (CTRCTL_EXCINH       | \
+				 CTRCTL_INTRINH      | \
+				 CTRCTL_TRETINH      | \
+				 CTRCTL_TKBRINH      | \
+				 CTRCTL_INDCALL_INH  | \
+				 CTRCTL_DIRCALL_INH  | \
+				 CTRCTL_INDJUMP_INH  | \
+				 CTRCTL_DIRJUMP_INH  | \
+				 CTRCTL_CORSWAP_INH  | \
+				 CTRCTL_RET_INH      | \
+				 CTRCTL_INDOJUMP_INH | \
+				 CTRCTL_DIROJUMP_INH)
+
+#define CTR_BRANCH_ENABLE_BITS (CTRCTL_KERNEL_ENABLE | CTRCTL_U_ENABLE)
+
+/* Branch filters not-supported by CTR extension. */
+#define CTR_EXCLUDE_BRANCH_FILTERS (PERF_SAMPLE_BRANCH_ABORT_TX	        | \
+				    PERF_SAMPLE_BRANCH_IN_TX		| \
+				    PERF_SAMPLE_BRANCH_PRIV_SAVE        | \
+				    PERF_SAMPLE_BRANCH_NO_TX            | \
+				    PERF_SAMPLE_BRANCH_COUNTERS)
+
+/* Branch filters supported by CTR extension. */
+#define CTR_ALLOWED_BRANCH_FILTERS (PERF_SAMPLE_BRANCH_USER		| \
+				    PERF_SAMPLE_BRANCH_KERNEL		| \
+				    PERF_SAMPLE_BRANCH_HV		| \
+				    PERF_SAMPLE_BRANCH_ANY		| \
+				    PERF_SAMPLE_BRANCH_ANY_CALL	        | \
+				    PERF_SAMPLE_BRANCH_ANY_RETURN	| \
+				    PERF_SAMPLE_BRANCH_IND_CALL	        | \
+				    PERF_SAMPLE_BRANCH_COND		| \
+				    PERF_SAMPLE_BRANCH_IND_JUMP	        | \
+				    PERF_SAMPLE_BRANCH_HW_INDEX	        | \
+				    PERF_SAMPLE_BRANCH_NO_FLAGS	        | \
+				    PERF_SAMPLE_BRANCH_NO_CYCLES	| \
+				    PERF_SAMPLE_BRANCH_CALL_STACK       | \
+				    PERF_SAMPLE_BRANCH_CALL		| \
+				    PERF_SAMPLE_BRANCH_TYPE_SAVE)
+
+#define CTR_PERF_BRANCH_FILTERS    (CTR_ALLOWED_BRANCH_FILTERS	        | \
+				    CTR_EXCLUDE_BRANCH_FILTERS)
+
+static u64 allowed_filters __read_mostly;
+
+struct ctr_regset {
+	unsigned long src;
+	unsigned long target;
+	unsigned long ctr_data;
+};
+
+enum {
+	CTR_STATE_NONE,
+	CTR_STATE_VALID,
+};
+
+/* Head is the idx of the next available slot. The slot may be already populated
+ * by an old entry which will be lost on new writes.
+ */
+struct riscv_perf_task_context {
+	int callstack_users;
+	int stack_state;
+	unsigned int num_entries;
+	uint32_t ctr_status;
+	uint64_t ctr_control;
+	struct ctr_regset store[MAX_BRANCH_RECORDS];
+};
+
+static inline u64 get_ctr_src_reg(unsigned int ctr_idx)
+{
+	return csr_ind_read(CSR_SIREG, CTR_ENTRIES_FIRST, ctr_idx);
+}
+
+static inline void set_ctr_src_reg(unsigned int ctr_idx, u64 value)
+{
+	return csr_ind_write(CSR_SIREG, CTR_ENTRIES_FIRST, ctr_idx, value);
+}
+
+static inline u64 get_ctr_tgt_reg(unsigned int ctr_idx)
+{
+	return csr_ind_read(CSR_SIREG2, CTR_ENTRIES_FIRST, ctr_idx);
+}
+
+static inline void set_ctr_tgt_reg(unsigned int ctr_idx, u64 value)
+{
+	return csr_ind_write(CSR_SIREG2, CTR_ENTRIES_FIRST, ctr_idx, value);
+}
+
+static inline u64 get_ctr_data_reg(unsigned int ctr_idx)
+{
+	return csr_ind_read(CSR_SIREG3, CTR_ENTRIES_FIRST, ctr_idx);
+}
+
+static inline void set_ctr_data_reg(unsigned int ctr_idx, u64 value)
+{
+	return csr_ind_write(CSR_SIREG3, CTR_ENTRIES_FIRST, ctr_idx, value);
+}
+
+static inline bool ctr_record_valid(u64 ctr_src)
+{
+	return !!FIELD_GET(CTRSOURCE_VALID, ctr_src);
+}
+
+static inline int ctr_get_mispredict(u64 ctr_target)
+{
+	return FIELD_GET(CTRTARGET_MISP, ctr_target);
+}
+
+static inline unsigned int ctr_get_cycles(u64 ctr_data)
+{
+	const unsigned int cce = FIELD_GET(CTRDATA_CCE_MASK, ctr_data);
+	const unsigned int ccm = FIELD_GET(CTRDATA_CCM_MASK, ctr_data);
+
+	if (ctr_data & CTRDATA_CCV)
+		return 0;
+
+	/* Formula to calculate cycles from spec: (2^12 + CCM) << CCE-1 */
+	if (cce > 0)
+		return (4096 + ccm) << (cce - 1);
+
+	return FIELD_GET(CTRDATA_CCM_MASK, ctr_data);
+}
+
+static inline unsigned int ctr_get_type(u64 ctr_data)
+{
+	return FIELD_GET(CTRDATA_TYPE_MASK, ctr_data);
+}
+
+static inline unsigned int ctr_get_depth(u64 ctr_depth)
+{
+	/* Depth table from CTR Spec: 2.4 sctrdepth.
+	 *
+	 * sctrdepth.depth       Depth
+	 * 000			- 16
+	 * 001			- 32
+	 * 010			- 64
+	 * 011			- 128
+	 * 100			- 256
+	 *
+	 * Depth = 16 * 2 ^ (ctrdepth.depth)
+	 * or
+	 * Depth = 16 << ctrdepth.depth.
+	 */
+	return 16 << FIELD_GET(SCTRDEPTH_MASK, ctr_depth);
+}
+
+static inline struct riscv_perf_task_context *task_context(void *ctx)
+{
+	return (struct riscv_perf_task_context *)ctx;
+}
+
+/* Reads CTR entry at idx and stores it in entry struct. */
+static bool get_ctr_regset(struct ctr_regset *entry, unsigned int idx)
+{
+	entry->src = get_ctr_src_reg(idx);
+
+	if (!ctr_record_valid(entry->src))
+		return false;
+
+	entry->src = entry->src;
+	entry->target = get_ctr_tgt_reg(idx);
+	entry->ctr_data = get_ctr_data_reg(idx);
+
+	return true;
+}
+
+static void set_ctr_regset(struct ctr_regset *entry, unsigned int idx)
+{
+	set_ctr_src_reg(idx, entry->src);
+	set_ctr_tgt_reg(idx, entry->target);
+	set_ctr_data_reg(idx, entry->ctr_data);
+}
+
+static u64 branch_type_to_ctr(int branch_type)
+{
+	u64 config = CTR_BRANCH_FILTERS_INH | CTRCTL_LCOFIFRZ;
+
+	if (branch_type & PERF_SAMPLE_BRANCH_USER)
+		config |= CTRCTL_U_ENABLE;
+
+	if (branch_type & PERF_SAMPLE_BRANCH_KERNEL)
+		config |= CTRCTL_KERNEL_ENABLE;
+
+	if (branch_type & PERF_SAMPLE_BRANCH_HV) {
+		if (riscv_isa_extension_available(NULL, h))
+			config |= CTRCTL_KERNEL_ENABLE;
+	}
+
+	if (branch_type & PERF_SAMPLE_BRANCH_ANY) {
+		config &= ~CTR_BRANCH_FILTERS_INH;
+		return config;
+	}
+
+	if (branch_type & PERF_SAMPLE_BRANCH_ANY_CALL) {
+		config &= ~CTRCTL_INDCALL_INH;
+		config &= ~CTRCTL_DIRCALL_INH;
+		config &= ~CTRCTL_EXCINH;
+		config &= ~CTRCTL_INTRINH;
+	}
+
+	if (branch_type & PERF_SAMPLE_BRANCH_ANY_RETURN)
+		config &= ~(CTRCTL_RET_INH | CTRCTL_TRETINH);
+
+	if (branch_type & PERF_SAMPLE_BRANCH_IND_CALL)
+		config &= ~CTRCTL_INDCALL_INH;
+
+	if (branch_type & PERF_SAMPLE_BRANCH_COND)
+		config &= ~CTRCTL_TKBRINH;
+
+	if (branch_type & PERF_SAMPLE_BRANCH_CALL_STACK)
+		config |= CTRCTL_RASEMU;
+
+	if (branch_type & PERF_SAMPLE_BRANCH_IND_JUMP) {
+		config &= ~CTRCTL_INDJUMP_INH;
+		config &= ~CTRCTL_INDOJUMP_INH;
+	}
+
+	if (branch_type & PERF_SAMPLE_BRANCH_CALL)
+		config &= ~CTRCTL_DIRCALL_INH;
+
+	return config;
+}
+
+static const int ctr_perf_map[] = {
+	[CTRDATA_TYPE_NONE]			= PERF_BR_UNKNOWN,
+	[CTRDATA_TYPE_EXCEPTION]		= PERF_BR_SYSCALL,
+	[CTRDATA_TYPE_INTERRUPT]		= PERF_BR_IRQ,
+	[CTRDATA_TYPE_TRAP_RET]			= PERF_BR_ERET,
+	[CTRDATA_TYPE_NONTAKEN_BRANCH]		= PERF_BR_COND,
+	[CTRDATA_TYPE_TAKEN_BRANCH]		= PERF_BR_COND,
+	[CTRDATA_TYPE_RESERVED_6]		= PERF_BR_UNKNOWN,
+	[CTRDATA_TYPE_RESERVED_7]		= PERF_BR_UNKNOWN,
+	[CTRDATA_TYPE_INDIRECT_CALL]		= PERF_BR_IND_CALL,
+	[CTRDATA_TYPE_DIRECT_CALL]		= PERF_BR_CALL,
+	[CTRDATA_TYPE_INDIRECT_JUMP]		= PERF_BR_IND,
+	[CTRDATA_TYPE_DIRECT_JUMP]		= PERF_BR_UNCOND,
+	[CTRDATA_TYPE_CO_ROUTINE_SWAP]		= PERF_BR_UNKNOWN,
+	[CTRDATA_TYPE_RETURN]			= PERF_BR_RET,
+	[CTRDATA_TYPE_OTHER_INDIRECT_JUMP]	= PERF_BR_IND,
+	[CTRDATA_TYPE_OTHER_DIRECT_JUMP]	= PERF_BR_UNCOND,
+};
+
+static void ctr_set_perf_entry_type(struct perf_branch_entry *entry,
+				    u64 ctr_data)
+{
+	int ctr_type = ctr_get_type(ctr_data);
+
+	entry->type = ctr_perf_map[ctr_type];
+	if (entry->type == PERF_BR_UNKNOWN)
+		pr_warn("%d - unknown branch type captured\n", ctr_type);
+}
+
+static void capture_ctr_flags(struct perf_branch_entry *entry,
+			      struct perf_event *event, u64 ctr_data,
+			      u64 ctr_target)
+{
+	if (branch_sample_type(event))
+		ctr_set_perf_entry_type(entry, ctr_data);
+
+	if (!branch_sample_no_cycles(event))
+		entry->cycles = ctr_get_cycles(ctr_data);
+
+	if (!branch_sample_no_flags(event)) {
+		entry->abort = 0;
+		entry->mispred = ctr_get_mispredict(ctr_target);
+		entry->predicted = !entry->mispred;
+	}
+
+	if (branch_sample_priv(event))
+		entry->priv = PERF_BR_PRIV_UNKNOWN;
+}
+
+static void ctr_regset_to_branch_entry(struct cpu_hw_events *cpuc,
+				       struct perf_event *event,
+				       struct ctr_regset *regset,
+				       unsigned int idx)
+{
+	struct perf_branch_entry *entry = &cpuc->branches->branch_entries[idx];
+
+	perf_clear_branch_entry_bitfields(entry);
+	entry->from = regset->src & (~CTRSOURCE_VALID);
+	entry->to = regset->target & (~CTRTARGET_MISP);
+	capture_ctr_flags(entry, event, regset->ctr_data, regset->target);
+}
+
+static void ctr_read_entries(struct cpu_hw_events *cpuc,
+			     struct perf_event *event,
+			     unsigned int depth)
+{
+	struct ctr_regset entry = {};
+	u64 ctr_ctl;
+	int i;
+
+	ctr_ctl = csr_read_clear(CSR_CTRCTL, CTR_BRANCH_ENABLE_BITS);
+
+	for (i = 0; i < depth; i++) {
+		if (!get_ctr_regset(&entry, i))
+			break;
+
+		ctr_regset_to_branch_entry(cpuc, event, &entry, i);
+	}
+
+	csr_set(CSR_CTRCTL, ctr_ctl & CTR_BRANCH_ENABLE_BITS);
+
+	cpuc->branches->branch_stack.nr = i;
+	cpuc->branches->branch_stack.hw_idx = 0;
+}
+
+bool riscv_pmu_ctr_valid(struct perf_event *event)
+{
+	u64 branch_type = event->attr.branch_sample_type;
+
+	if (branch_type & ~allowed_filters) {
+		pr_debug_once("Requested branch filters not supported 0x%llx\n",
+				branch_type & ~allowed_filters);
+		return false;
+	}
+
+	return true;
+}
+
+void riscv_pmu_ctr_consume(struct cpu_hw_events *cpuc, struct perf_event *event)
+{
+	unsigned int depth = to_riscv_pmu(event->pmu)->ctr_depth;
+
+	ctr_read_entries(cpuc, event, depth);
+
+	/* Clear frozen bit. */
+	csr_clear(CSR_SCTRSTATUS, SCTRSTATUS_FROZEN);
+}
+
+static void riscv_pmu_ctr_reset(void)
+{
+	/* FIXME: Replace with sctrclr instruction once support is merged
+	 * into toolchain.
+	 */
+	asm volatile(".4byte 0x10400073\n" ::: "memory");
+	csr_write(CSR_SCTRSTATUS, 0);
+	csr_write(CSR_CTRCTL, 0);
+}
+
+static void __riscv_pmu_ctr_restore(void *ctx)
+{
+	struct riscv_perf_task_context *task_ctx = ctx;
+	unsigned int i;
+
+	csr_write(CSR_SCTRSTATUS, task_ctx->ctr_status);
+
+	for (i = 0; i < task_ctx->num_entries; i++)
+		set_ctr_regset(&task_ctx->store[i], i);
+}
+
+static void riscv_pmu_ctr_restore(void *ctx)
+{
+	if (task_context(ctx)->callstack_users == 0 ||
+	    task_context(ctx)->stack_state == CTR_STATE_NONE) {
+		riscv_pmu_ctr_reset();
+		return;
+	}
+
+	__riscv_pmu_ctr_restore(ctx);
+
+	task_context(ctx)->stack_state = CTR_STATE_NONE;
+}
+
+static void __riscv_pmu_ctr_save(void *ctx, unsigned int depth)
+{
+	struct riscv_perf_task_context *task_ctx = ctx;
+	struct ctr_regset *dst;
+	unsigned int i;
+
+	for (i = 0; i < depth; i++) {
+		dst = &task_ctx->store[i];
+		if (!get_ctr_regset(dst, i))
+			break;
+	}
+
+	task_ctx->num_entries = i;
+
+	task_ctx->ctr_status = csr_read(CSR_SCTRSTATUS);
+}
+
+static void riscv_pmu_ctr_save(void *ctx, unsigned int depth)
+{
+	if (task_context(ctx)->callstack_users == 0) {
+		task_context(ctx)->stack_state = CTR_STATE_NONE;
+		return;
+	}
+
+	__riscv_pmu_ctr_save(ctx, depth);
+
+	task_context(ctx)->stack_state = CTR_STATE_VALID;
+}
+
+/*
+ * On context switch in, we need to make sure no samples from previous tasks
+ * are left in the CTR.
+ *
+ * On ctxswin, sched_in = true, called after the PMU has started
+ * On ctxswout, sched_in = false, called before the PMU is stopped
+ */
+void riscv_pmu_ctr_sched_task(struct perf_event_pmu_context *pmu_ctx,
+			      bool sched_in)
+{
+	struct riscv_pmu *rvpmu = to_riscv_pmu(pmu_ctx->pmu);
+	struct cpu_hw_events *cpuc = this_cpu_ptr(rvpmu->hw_events);
+	void *task_ctx;
+
+	if (!cpuc->ctr_users)
+		return;
+
+	/* Save branch records in task_ctx on sched out */
+	task_ctx = pmu_ctx ? pmu_ctx->task_ctx_data : NULL;
+	if (task_ctx) {
+		if (sched_in)
+			riscv_pmu_ctr_restore(task_ctx);
+		else
+			riscv_pmu_ctr_save(task_ctx, rvpmu->ctr_depth);
+		return;
+	}
+
+	/* Reset branch records on sched in */
+	if (sched_in)
+		riscv_pmu_ctr_reset();
+}
+
+static inline bool branch_user_callstack(unsigned int br_type)
+{
+	return (br_type & PERF_SAMPLE_BRANCH_USER) &&
+		(br_type & PERF_SAMPLE_BRANCH_CALL_STACK);
+}
+
+void riscv_pmu_ctr_add(struct perf_event *event)
+{
+	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
+	struct cpu_hw_events *cpuc = this_cpu_ptr(rvpmu->hw_events);
+
+	if (branch_user_callstack(event->attr.branch_sample_type) &&
+			event->pmu_ctx->task_ctx_data)
+		task_context(event->pmu_ctx->task_ctx_data)->callstack_users++;
+
+	perf_sched_cb_inc(event->pmu);
+
+	if (!cpuc->ctr_users++)
+		riscv_pmu_ctr_reset();
+}
+
+void riscv_pmu_ctr_del(struct perf_event *event)
+{
+	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
+	struct cpu_hw_events *cpuc = this_cpu_ptr(rvpmu->hw_events);
+
+	if (branch_user_callstack(event->attr.branch_sample_type) &&
+			event->pmu_ctx->task_ctx_data)
+		task_context(event->pmu_ctx->task_ctx_data)->callstack_users--;
+
+	cpuc->ctr_users--;
+	WARN_ON_ONCE(cpuc->ctr_users < 0);
+
+	perf_sched_cb_dec(event->pmu);
+}
+
+void riscv_pmu_ctr_enable(struct perf_event *event)
+{
+	u64 branch_type = event->attr.branch_sample_type;
+	u64 ctr;
+
+	ctr = branch_type_to_ctr(branch_type);
+	csr_write(CSR_CTRCTL, ctr);
+}
+
+void riscv_pmu_ctr_disable(struct perf_event *event)
+{
+	/* Clear CTRCTL to disable the recording. */
+	csr_write(CSR_CTRCTL, 0);
+}
+
+/*
+ * Check for hardware supported perf filters here. To avoid missing
+ * any new added filter in perf, we do a BUILD_BUG_ON check, so make sure
+ * to update CTR_ALLOWED_BRANCH_FILTERS or CTR_EXCLUDE_BRANCH_FILTERS
+ * defines when adding support for it in below function.
+ */
+static void __init check_available_filters(void)
+{
+	u64 ctr_ctl;
+
+	/*
+	 * Ensure both perf branch filter allowed and exclude
+	 * masks are always in sync with the generic perf ABI.
+	 */
+	BUILD_BUG_ON(CTR_PERF_BRANCH_FILTERS != (PERF_SAMPLE_BRANCH_MAX - 1));
+
+	allowed_filters = PERF_SAMPLE_BRANCH_USER      |
+			  PERF_SAMPLE_BRANCH_KERNEL    |
+			  PERF_SAMPLE_BRANCH_ANY       |
+			  PERF_SAMPLE_BRANCH_HW_INDEX  |
+			  PERF_SAMPLE_BRANCH_NO_FLAGS  |
+			  PERF_SAMPLE_BRANCH_NO_CYCLES |
+			  PERF_SAMPLE_BRANCH_TYPE_SAVE;
+
+	csr_write(CSR_CTRCTL, ~0);
+	ctr_ctl = csr_read(CSR_CTRCTL);
+
+	if (riscv_isa_extension_available(NULL, h))
+		allowed_filters |= PERF_SAMPLE_BRANCH_HV;
+
+	if (ctr_ctl & (CTRCTL_INDCALL_INH | CTRCTL_DIRCALL_INH))
+		allowed_filters |= PERF_SAMPLE_BRANCH_ANY_CALL;
+
+	if (ctr_ctl & (CTRCTL_RET_INH | CTRCTL_TRETINH))
+		allowed_filters |= PERF_SAMPLE_BRANCH_ANY_RETURN;
+
+	if (ctr_ctl & CTRCTL_INDCALL_INH)
+		allowed_filters |= PERF_SAMPLE_BRANCH_IND_CALL;
+
+	if (ctr_ctl & CTRCTL_TKBRINH)
+		allowed_filters |= PERF_SAMPLE_BRANCH_COND;
+
+	if (ctr_ctl & CTRCTL_RASEMU)
+		allowed_filters |= PERF_SAMPLE_BRANCH_CALL_STACK;
+
+	if (ctr_ctl & (CTRCTL_INDOJUMP_INH | CTRCTL_INDJUMP_INH))
+		allowed_filters |= PERF_SAMPLE_BRANCH_IND_JUMP;
+
+	if (ctr_ctl & CTRCTL_DIRCALL_INH)
+		allowed_filters |= PERF_SAMPLE_BRANCH_CALL;
+}
+
+void riscv_pmu_ctr_starting_cpu(void)
+{
+	if (!riscv_isa_extension_available(NULL, SxCTR) ||
+	    !riscv_isa_extension_available(NULL, SSCOFPMF) ||
+	    !riscv_isa_extension_available(NULL, SxCSRIND))
+		return;
+
+	/* Set depth to maximum. */
+	csr_write(CSR_SCTRDEPTH, SCTRDEPTH_MASK);
+}
+
+void riscv_pmu_ctr_dying_cpu(void)
+{
+	if (!riscv_isa_extension_available(NULL, SxCTR) ||
+	    !riscv_isa_extension_available(NULL, SSCOFPMF) ||
+	    !riscv_isa_extension_available(NULL, SxCSRIND))
+		return;
+
+	/* Clear and reset CTR CSRs. */
+	csr_write(CSR_SCTRDEPTH, 0);
+	riscv_pmu_ctr_reset();
+}
+
+int riscv_pmu_ctr_init(struct riscv_pmu *riscv_pmu)
+{
+	size_t size = sizeof(struct riscv_perf_task_context);
+
+	if (!riscv_isa_extension_available(NULL, SxCTR) ||
+	    !riscv_isa_extension_available(NULL, SSCOFPMF) ||
+	    !riscv_isa_extension_available(NULL, SxCSRIND))
+		return 0;
+
+	riscv_pmu->pmu.task_ctx_cache =
+		kmem_cache_create("ctr_task_ctx", size, sizeof(u64), 0, NULL);
+	if (!riscv_pmu->pmu.task_ctx_cache)
+		return -ENOMEM;
+
+	check_available_filters();
+
+	/* Set depth to maximum. */
+	csr_write(CSR_SCTRDEPTH, SCTRDEPTH_MASK);
+	riscv_pmu->ctr_depth = ctr_get_depth(csr_read(CSR_SCTRDEPTH));
+
+	pr_info("Perf CTR available, with %d depth\n", riscv_pmu->ctr_depth);
+
+	return 0;
+}
+
+void riscv_pmu_ctr_finish(struct riscv_pmu *riscv_pmu)
+{
+	if (!riscv_pmu_ctr_supported(riscv_pmu))
+		return;
+
+	csr_write(CSR_SCTRDEPTH, 0);
+	riscv_pmu->ctr_depth = 0;
+	riscv_pmu_ctr_reset();
+
+	kmem_cache_destroy(riscv_pmu->pmu.task_ctx_cache);
+}
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 883781f12ae0..f32b6dcc3491 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -127,6 +127,43 @@ struct riscv_pmu *riscv_pmu_alloc(void);
 int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr);
 #endif
 
+static inline bool riscv_pmu_ctr_supported(struct riscv_pmu *pmu)
+{
+	return !!pmu->ctr_depth;
+}
+
 #endif /* CONFIG_RISCV_PMU_COMMON */
 
+#ifdef CONFIG_RISCV_CTR
+
+bool riscv_pmu_ctr_valid(struct perf_event *event);
+void riscv_pmu_ctr_consume(struct cpu_hw_events *cpuc, struct perf_event *event);
+void riscv_pmu_ctr_sched_task(struct perf_event_pmu_context *pmu_ctx, bool sched_in);
+void riscv_pmu_ctr_add(struct perf_event *event);
+void riscv_pmu_ctr_del(struct perf_event *event);
+void riscv_pmu_ctr_enable(struct perf_event *event);
+void riscv_pmu_ctr_disable(struct perf_event *event);
+void riscv_pmu_ctr_dying_cpu(void);
+void riscv_pmu_ctr_starting_cpu(void);
+int riscv_pmu_ctr_init(struct riscv_pmu *riscv_pmu);
+void riscv_pmu_ctr_finish(struct riscv_pmu *riscv_pmu);
+
+#else
+
+static inline bool riscv_pmu_ctr_valid(struct perf_event *event) { return false; }
+static inline void riscv_pmu_ctr_consume(struct cpu_hw_events *cpuc,
+				      struct perf_event *event) { }
+static inline void riscv_pmu_ctr_sched_task(struct perf_event_pmu_context *,
+					    bool sched_in) { }
+static void riscv_pmu_ctr_add(struct perf_event *event) { }
+static void riscv_pmu_ctr_del(struct perf_event *event) { }
+static inline void riscv_pmu_ctr_enable(struct perf_event *event) { }
+static inline void riscv_pmu_ctr_disable(struct perf_event *event) { }
+static inline void riscv_pmu_ctr_dying_cpu(void) { }
+static inline void riscv_pmu_ctr_starting_cpu(void) { }
+static inline int riscv_pmu_ctr_init(struct riscv_pmu *riscv_pmu) { return 0; }
+static inline void riscv_pmu_ctr_finish(struct riscv_pmu *riscv_pmu) { }
+
+#endif /* CONFIG_RISCV_CTR */
+
 #endif /* _RISCV_PMU_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
