Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2ACBC48BF5
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 00:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=msRelxv0RFxis+kqnmTZRCGF/dC+9C9NFyzoWbXOSEg=; b=nrxAywEN1LvsMR
	kruBAwK7aqmMHylUiSFQd83sEH6y7aHg/vNwqgLW+GhjPdy8YC25mt33qL9NnKmhkkceh5/j5xGLU
	0h3ii8YdzmZx5bjEe4oLodBWolH6LyHRGVuXPfSYAuT4ZvZnuImTBL1a6pP9/QaYbIDmwsAkSIWW6
	uzhYvoJzMpNrCflYevYPFWkrmsrkoxVLp+LHstbNe6ztjFg66MPK/GQd050R+lf6POZZhP1Yfwog4
	wg3otxPk++IatmsJ+IWa6Z16a3PIdZBw9XaiNxlLGhVBxaxNP4Jfffp67YbHUbYMgcdeY+uN92JKs
	d2IyTzTVNx5H+edcsjUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb92v-00000004Ifa-2CJc;
	Sat, 17 Feb 2024 00:59:13 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb92X-00000004ILT-3G4I
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 00:59:03 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-204235d0913so985103fac.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 16:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708131528; x=1708736328; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfeB7JYlXDGaZw65RVXErpfWL8gtCGpiY1jb8zlR4wA=;
        b=sjw4Kxludr5k1zxgGiReiM2sFnOOrSQ5zxRhV2kcHNLK7u57zSL3d7B+aAHjd73Yjr
         XmBkIAiiPKgeYYJ6OZnpaqoNtM6Il7tAUNaOS+YiqB+h0Q7erjGcmUFvXActEEJjRbFz
         8v7TlKxuYPWw/HgIXgJzMgF3BbYVQyaOxawl62b7er15w1JMpwiTPAi1E/xXvY3D0nVA
         XNNjtA4TrxB4itZwpVoBLBfhMqkwqYXx4nPhONonXp3XcJhGhhoEDPsHk00dIvBgHwko
         BAvycc3d4QHi6ovDpZ19RqriWuPgusVqjNwNh6/2eZHnDZs4xHhTMuK739DxKU35JOHh
         MWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708131528; x=1708736328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfeB7JYlXDGaZw65RVXErpfWL8gtCGpiY1jb8zlR4wA=;
        b=SaXYZ8MmrtEXs3rUG+AkbJ6DyIRpEfX9ik8drP7oAE4O98tMxcZfZg9bj+tq7g6VT8
         ZrTEPCppQcESeEYPML13qCXyXmLB4TALn+zUArJNA2eb5sDfWpHYmd17xNdZ/2w8S3yZ
         cQdLsDjIjobczBBkgWqySNPsA1WfeVwe2x6ktJQu2l/J3ayCchPfU2YAzXyqfH5taSa2
         uCHbdt8D12yy52NUs4mxfY/FhNvmGDqjthSZ+CGayMCRMSYXvP2g+ZrfQ31waga6zgIg
         fWZLPDutSE4WLGhR/QVxIAhDtZbqwMOfwUq0Qq2337Y74JB9wckjguyARtTY4V9mMXmJ
         Tkeg==
X-Forwarded-Encrypted: i=1; AJvYcCUlS8gV/ZkAzqwV9jtVAkD1mw0hA/VCj7ZrVrIoqChz0K9y8Ol5kJ/lZc7ctyYPymjR+Xq55UHpMCH19TjuMrKwZ4LzV//MDPEetigLpoFp
X-Gm-Message-State: AOJu0YyAxeMEy1Ai8kPXzfLy9jDbJCAq5kyFaUnt9L4fHv/u3od8iNLd
	Q5NVN/01/+1Bn6oNJqcnDDbGuHILiTxvHjYst9YkccwJQX2yK8maF9hQEZmc6oY=
X-Google-Smtp-Source: AGHT+IFFZ3X88HR6RYt1MMNPiWVJNj8Aa/iDSy7euok8DzEZ8WyuLJr/udPPXDrFxWGsgBos41HN4g==
X-Received: by 2002:a05:6870:d88d:b0:218:df68:87b2 with SMTP id oe13-20020a056870d88d00b00218df6887b2mr6753363oac.44.1708131528256;
        Fri, 16 Feb 2024 16:58:48 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d188-20020a6336c5000000b005dc89957e06sm487655pga.71.2024.02.16.16.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:58:47 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Atish Patra <atishp@atishpatra.org>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	devicetree@vger.kernel.org,
	Evan Green <evan@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@arm.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	John Garry <john.g.garry@oracle.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Kan Liang <kan.liang@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Weilin Wang <weilin.wang@intel.com>,
	Will Deacon <will@kernel.org>,
	kaiwenxue1@gmail.com,
	Yang Jihong <yangjihong1@huawei.com>
Subject: [PATCH RFC 13/20] RISC-V: perf: Implement supervisor counter delegation support
Date: Fri, 16 Feb 2024 16:57:31 -0800
Message-Id: <20240217005738.3744121-14-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240217005738.3744121-1-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_165850_163046_3DA171B1 
X-CRM114-Status: GOOD (  30.95  )
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

There are few new RISC-V ISA exensions (ssccfg, sscsrind, smcntrpmf) which
allows the hpmcounter/hpmevents to be programmed directly from S-mode. The
implementation detects the ISA extension at runtime and uses them if
available instead of SBI PMU extension. SBI PMU extension will still be
used for firmware counters if the user requests it.

The current linux driver relies on event encoding defined by SBI PMU
specification for standard perf events. However, there are no standard
event encoding available in the ISA. In the future, we may want to
decouple the counter delegation and SBI PMU completely. In that case,
counter delegation supported platforms must rely on the event encoding
defined in the perf json file only.

For firmware events, it will continue to use the SBI PMU encoding as
one can not support firmware event without SBI PMU.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr.h   |   1 +
 arch/riscv/include/asm/sbi.h   |   2 +-
 arch/riscv/kvm/vcpu_pmu.c      |   2 +-
 drivers/perf/riscv_pmu_dev.c   | 428 ++++++++++++++++++++++++++++-----
 include/linux/perf/riscv_pmu.h |   3 +
 5 files changed, 369 insertions(+), 67 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index e1bf1466f32e..efcd956c517a 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -239,6 +239,7 @@
 #endif
 
 #define SISELECT_SSCCFG_BASE		0x40
+#define HPMEVENT_MASK			GENMASK_ULL(63, 56)
 
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00
diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 6e68f8dff76b..ad0c8a686d6c 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -147,7 +147,7 @@ union sbi_pmu_ctr_info {
 	};
 };
 
-#define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
+#define RISCV_PMU_SBI_RAW_EVENT_MASK GENMASK_ULL(47, 0)
 #define RISCV_PMU_RAW_EVENT_IDX 0x20000
 
 /** General pmu event codes specified in SBI PMU extension */
diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 86391a5061dd..4c9502a79a54 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -125,7 +125,7 @@ static u64 kvm_pmu_get_perf_event_config(unsigned long eidx, uint64_t evt_data)
 		config = kvm_pmu_get_perf_event_cache_config(ecode);
 		break;
 	case SBI_PMU_EVENT_TYPE_RAW:
-		config = evt_data & RISCV_PMU_RAW_EVENT_MASK;
+		config = evt_data & RISCV_PMU_SBI_RAW_EVENT_MASK;
 		break;
 	case SBI_PMU_EVENT_TYPE_FW:
 		if (ecode < SBI_PMU_FW_MAX)
diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index dfc0ddee9da4..0cdad0dafb71 100644
--- a/drivers/perf/riscv_pmu_dev.c
+++ b/drivers/perf/riscv_pmu_dev.c
@@ -23,6 +23,8 @@
 #include <asm/errata_list.h>
 #include <asm/sbi.h>
 #include <asm/cpufeature.h>
+#include <asm/hwcap.h>
+#include <asm/csr_ind.h>
 
 #define SYSCTL_NO_USER_ACCESS	0
 #define SYSCTL_USER_ACCESS	1
@@ -32,7 +34,20 @@
 #define PERF_EVENT_FLAG_USER_ACCESS	BIT(SYSCTL_USER_ACCESS)
 #define PERF_EVENT_FLAG_LEGACY		BIT(SYSCTL_LEGACY)
 
-PMU_FORMAT_ATTR(event, "config:0-47");
+#define RVPMU_SBI_PMU_FORMAT_ATTR	"config:0-47"
+#define RVPMU_CDELEG_PMU_FORMAT_ATTR	"config:0-55"
+
+static ssize_t __maybe_unused rvpmu_format_show(struct device *dev,
+			struct device_attribute *attr, char *buf);
+
+#define RVPMU_ATTR_ENTRY(_name, _func, _config)	(			\
+	&((struct dev_ext_attribute[]) {				\
+		{ __ATTR(_name, 0444, _func, NULL), (void *)_config }	\
+	})[0].attr.attr)
+
+#define RVPMU_FORMAT_ATTR_ENTRY(_name, _config) \
+	RVPMU_ATTR_ENTRY(_name, rvpmu_format_show, (char *)_config)
+
 PMU_FORMAT_ATTR(firmware, "config:63");
 
 static DEFINE_STATIC_KEY_FALSE(riscv_pmu_sbi_available);
@@ -40,19 +55,35 @@ static DEFINE_STATIC_KEY_FALSE(riscv_pmu_cdeleg_available);
 static bool cdeleg_available;
 static bool sbi_available;
 
-static struct attribute *riscv_arch_formats_attr[] = {
-	&format_attr_event.attr,
+static struct attribute *riscv_sbi_pmu_formats_attr[] = {
+	RVPMU_FORMAT_ATTR_ENTRY(event, RVPMU_SBI_PMU_FORMAT_ATTR),
+	&format_attr_firmware.attr,
+	NULL,
+};
+
+static struct attribute_group riscv_sbi_pmu_format_group = {
+	.name = "format",
+	.attrs = riscv_sbi_pmu_formats_attr,
+};
+
+static const struct attribute_group *riscv_sbi_pmu_attr_groups[] = {
+	&riscv_sbi_pmu_format_group,
+	NULL,
+};
+
+static struct attribute *riscv_cdeleg_pmu_formats_attr[] = {
+	RVPMU_FORMAT_ATTR_ENTRY(event, RVPMU_CDELEG_PMU_FORMAT_ATTR),
 	&format_attr_firmware.attr,
 	NULL,
 };
 
-static struct attribute_group riscv_pmu_format_group = {
+static struct attribute_group riscv_cdeleg_pmu_format_group = {
 	.name = "format",
-	.attrs = riscv_arch_formats_attr,
+	.attrs = riscv_cdeleg_pmu_formats_attr,
 };
 
-static const struct attribute_group *riscv_pmu_attr_groups[] = {
-	&riscv_pmu_format_group,
+static const struct attribute_group *riscv_cdeleg_pmu_attr_groups[] = {
+	&riscv_cdeleg_pmu_format_group,
 	NULL,
 };
 
@@ -275,6 +306,14 @@ static const struct sbi_pmu_event_data pmu_cache_event_map[PERF_COUNT_HW_CACHE_M
 	},
 };
 
+static ssize_t rvpmu_format_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	struct dev_ext_attribute *eattr = container_of(attr,
+				struct dev_ext_attribute, attr);
+	return sysfs_emit(buf, "%s\n", (char *)eattr->var);
+}
+
 static int rvpmu_ctr_get_width(int idx)
 {
 	return pmu_ctr_list[idx].width;
@@ -327,6 +366,39 @@ static uint8_t rvpmu_csr_index(struct perf_event *event)
 	return pmu_ctr_list[event->hw.idx].csr - CSR_CYCLE;
 }
 
+static uint64_t get_deleg_priv_filter_bits(struct perf_event *event)
+{
+	uint64_t priv_filter_bits = 0;
+	bool guest_events = false;
+
+	if (event->attr.config1 & RISCV_PMU_CONFIG1_GUEST_EVENTS)
+		guest_events = true;
+	if (event->attr.exclude_kernel)
+		priv_filter_bits |= guest_events ? HPMEVENT_VSINH : HPMEVENT_SINH;
+	if (event->attr.exclude_user)
+		priv_filter_bits |= guest_events ? HPMEVENT_VUINH : HPMEVENT_UINH;
+	if (guest_events && event->attr.exclude_hv)
+		priv_filter_bits |= HPMEVENT_SINH;
+	if (event->attr.exclude_host)
+		priv_filter_bits |= HPMEVENT_UINH | HPMEVENT_SINH;
+	if (event->attr.exclude_guest)
+		priv_filter_bits |= HPMEVENT_VSINH | HPMEVENT_VUINH;
+
+
+	return priv_filter_bits;
+}
+
+static bool pmu_sbi_is_fw_event(struct perf_event *event)
+{
+	u32 type = event->attr.type;
+	u64 config = event->attr.config;
+
+	if ((type == PERF_TYPE_RAW) && ((config >> 63) == 1))
+		return true;
+	else
+		return false;
+}
+
 static unsigned long rvpmu_sbi_get_filter_flags(struct perf_event *event)
 {
 	unsigned long cflags = 0;
@@ -355,7 +427,8 @@ static int rvpmu_sbi_ctr_get_idx(struct perf_event *event)
 	struct cpu_hw_events *cpuc = this_cpu_ptr(rvpmu->hw_events);
 	struct sbiret ret;
 	int idx;
-	uint64_t cbase = 0, cmask = rvpmu->cmask;
+	uint64_t cbase = 0;
+	unsigned long ctr_mask = rvpmu->cmask;
 	unsigned long cflags = 0;
 
 	cflags = rvpmu_sbi_get_filter_flags(event);
@@ -368,21 +441,24 @@ static int rvpmu_sbi_ctr_get_idx(struct perf_event *event)
 	if (hwc->flags & PERF_EVENT_FLAG_LEGACY) {
 		if (event->attr.config == PERF_COUNT_HW_CPU_CYCLES) {
 			cflags |= SBI_PMU_CFG_FLAG_SKIP_MATCH;
-			cmask = 1;
+			ctr_mask = 1;
 		} else if (event->attr.config == PERF_COUNT_HW_INSTRUCTIONS) {
 			cflags |= SBI_PMU_CFG_FLAG_SKIP_MATCH;
-			cmask = 1UL << (CSR_INSTRET - CSR_CYCLE);
+			ctr_mask = 1UL << (CSR_INSTRET - CSR_CYCLE);
 		}
 	}
 
+	if (pmu_sbi_is_fw_event(event) && cdeleg_available)
+		ctr_mask = firmware_cmask;
+
 	/* retrieve the available counter index */
 #if defined(CONFIG_32BIT)
 	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase,
-			cmask, cflags, hwc->event_base, hwc->config,
+			ctr_mask, cflags, hwc->event_base, hwc->config,
 			hwc->config >> 32);
 #else
 	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase,
-			cmask, cflags, hwc->event_base, hwc->config, 0);
+			ctr_mask, cflags, hwc->event_base, hwc->config, 0);
 #endif
 	if (ret.error) {
 		pr_debug("Not able to find a counter for event %lx config %llx\n",
@@ -391,7 +467,7 @@ static int rvpmu_sbi_ctr_get_idx(struct perf_event *event)
 	}
 
 	idx = ret.value;
-	if (!test_bit(idx, &rvpmu->cmask) || !pmu_ctr_list[idx].value)
+	if (!test_bit(idx, &ctr_mask) || !pmu_ctr_list[idx].value)
 		return -ENOENT;
 
 	/* Additional sanity check for the counter id */
@@ -441,15 +517,20 @@ static int pmu_event_find_cache(u64 config)
 	return ret;
 }
 
-static bool pmu_sbi_is_fw_event(struct perf_event *event)
+static int rvpmu_deleg_event_map(struct perf_event *event, u64 *econfig)
 {
-	u32 type = event->attr.type;
 	u64 config = event->attr.config;
 
-	if ((type == PERF_TYPE_RAW) && ((config >> 63) == 1))
-		return true;
-	else
-		return false;
+	/*
+	 * The Perf tool for RISC-V is expected to remap the standard perf event to platform
+	 * specific encoding if counter delegation extension is present.
+	 * Thus, the mapped value should be event encoding value specified in the userspace
+	 * There is no additional mapping/validation can be done in the driver.
+	 */
+	*econfig = config & RISCV_PMU_DELEG_RAW_EVENT_MASK;
+
+	/* event_base is not used for counter delegation config is sufficient for event encoding */
+	return 0;
 }
 
 static int rvpmu_sbi_event_map(struct perf_event *event, u64 *econfig)
@@ -476,7 +557,7 @@ static int rvpmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 		 * raw event and firmware events.
 		 */
 		bSoftware = config >> 63;
-		raw_config_val = config & RISCV_PMU_RAW_EVENT_MASK;
+		raw_config_val = config & RISCV_PMU_SBI_RAW_EVENT_MASK;
 		if (bSoftware) {
 			ret = (raw_config_val & 0xFFFF) |
 				(SBI_PMU_EVENT_TYPE_FW << 16);
@@ -493,7 +574,7 @@ static int rvpmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 	return ret;
 }
 
-static u64 rvpmu_sbi_ctr_read(struct perf_event *event)
+static u64 rvpmu_ctr_read(struct perf_event *event)
 {
 	struct hw_perf_event *hwc = &event->hw;
 	int idx = hwc->idx;
@@ -550,10 +631,6 @@ static void rvpmu_sbi_ctr_start(struct perf_event *event, u64 ival)
 	if (ret.error && (ret.error != SBI_ERR_ALREADY_STARTED))
 		pr_err("Starting counter idx %d failed with error %d\n",
 			hwc->idx, sbi_err_map_linux_errno(ret.error));
-
-	if ((hwc->flags & PERF_EVENT_FLAG_USER_ACCESS) &&
-	    (hwc->flags & PERF_EVENT_FLAG_USER_READ_CNT))
-		rvpmu_set_scounteren((void *)event);
 }
 
 static void rvpmu_sbi_ctr_stop(struct perf_event *event, unsigned long flag)
@@ -561,10 +638,6 @@ static void rvpmu_sbi_ctr_stop(struct perf_event *event, unsigned long flag)
 	struct sbiret ret;
 	struct hw_perf_event *hwc = &event->hw;
 
-	if ((hwc->flags & PERF_EVENT_FLAG_USER_ACCESS) &&
-	    (hwc->flags & PERF_EVENT_FLAG_USER_READ_CNT))
-		rvpmu_reset_scounteren((void *)event);
-
 	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, hwc->idx, 1, flag, 0, 0, 0);
 	if (ret.error && (ret.error != SBI_ERR_ALREADY_STOPPED) &&
 		flag != SBI_PMU_STOP_FLAG_RESET)
@@ -583,12 +656,6 @@ static int rvpmu_sbi_find_num_ctrs(void)
 		return sbi_err_map_linux_errno(ret.error);
 }
 
-static int rvpmu_deleg_find_ctrs(void)
-{
-	/* TODO */
-	return -1;
-}
-
 static int rvpmu_sbi_get_ctrinfo(int nsbi_ctr, int ndeleg_ctr)
 {
 	struct sbiret ret;
@@ -647,19 +714,85 @@ static inline void rvpmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
 		  cpu_hw_evt->used_hw_ctrs[0], 0, 0, 0, 0);
 }
 
+static void rvpmu_deleg_ctr_start_mask(unsigned long mask)
+{
+	unsigned long scountinhibit_val = 0;
+
+	scountinhibit_val = csr_read(CSR_SCOUNTINHIBIT);
+	scountinhibit_val &= ~mask;
+
+	csr_write(CSR_SCOUNTINHIBIT, scountinhibit_val);
+}
+
+static void rvpmu_deleg_ctr_enable_irq(struct perf_event *event)
+{
+	unsigned long hpmevent_curr;
+	unsigned long of_mask;
+	struct hw_perf_event *hwc = &event->hw;
+	int counter_idx = hwc->idx;
+	unsigned long sip_val = csr_read(CSR_SIP);
+
+	if (!is_sampling_event(event) || (sip_val & SIP_LCOFIP))
+		return;
+
+#if defined(CONFIG_32BIT)
+	hpmevent_curr = csr_ind_read(CSR_SIREG5, SISELECT_SSCCFG_BASE, counter_idx);
+	of_mask = (u32)~HPMEVENTH_OF;
+#else
+	hpmevent_curr = csr_ind_read(CSR_SIREG2, SISELECT_SSCCFG_BASE, counter_idx);
+	of_mask = ~HPMEVENT_OF;
+#endif
+
+	hpmevent_curr &= of_mask;
+#if defined(CONFIG_32BIT)
+	csr_ind_write(CSR_SIREG4, SISELECT_SSCCFG_BASE, counter_idx, hpmevent_curr);
+#else
+	csr_ind_write(CSR_SIREG2, SISELECT_SSCCFG_BASE, counter_idx, hpmevent_curr);
+#endif
+}
+
+static void rvpmu_deleg_ctr_start(struct perf_event *event, u64 ival)
+{
+	unsigned long scountinhibit_val = 0;
+	struct hw_perf_event *hwc = &event->hw;
+
+#if defined(CONFIG_32BIT)
+	csr_ind_write(CSR_SIREG, SISELECT_SSCCFG_BASE, hwc->idx, ival & 0xFFFFFFFF);
+	csr_ind_write(CSR_SIREG4, SISELECT_SSCCFG_BASE, hwc->idx, ival >> BITS_PER_LONG);
+#else
+	csr_ind_write(CSR_SIREG, SISELECT_SSCCFG_BASE, hwc->idx, ival);
+#endif
+
+	rvpmu_deleg_ctr_enable_irq(event);
+
+	scountinhibit_val = csr_read(CSR_SCOUNTINHIBIT);
+	scountinhibit_val &= ~(1 << hwc->idx);
+
+	csr_write(CSR_SCOUNTINHIBIT, scountinhibit_val);
+}
+
+static void rvpmu_deleg_ctr_stop_mask(unsigned long mask)
+{
+	unsigned long scountinhibit_val = 0;
+
+	scountinhibit_val = csr_read(CSR_SCOUNTINHIBIT);
+	scountinhibit_val |= mask;
+
+	csr_write(CSR_SCOUNTINHIBIT, scountinhibit_val);
+}
+
 /*
  * This function starts all the used counters in two step approach.
  * Any counter that did not overflow can be start in a single step
  * while the overflowed counters need to be started with updated initialization
  * value.
  */
-static inline void rvpmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
+static inline void rvpmu_start_overflow_mask(struct riscv_pmu *pmu,
 					       unsigned long ctr_ovf_mask)
 {
 	int idx = 0;
 	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
 	struct perf_event *event;
-	unsigned long flag = SBI_PMU_START_FLAG_SET_INIT_VALUE;
 	unsigned long ctr_start_mask = 0;
 	uint64_t max_period;
 	struct hw_perf_event *hwc;
@@ -667,9 +800,12 @@ static inline void rvpmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
 
 	ctr_start_mask = cpu_hw_evt->used_hw_ctrs[0] & ~ctr_ovf_mask;
 
-	/* Start all the counters that did not overflow in a single shot */
-	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, 0, ctr_start_mask,
-		  0, 0, 0, 0);
+	if (static_branch_likely(&riscv_pmu_cdeleg_available))
+		rvpmu_deleg_ctr_start_mask(ctr_start_mask);
+	else
+		/* Start all the counters that did not overflow in a single shot */
+		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, 0, ctr_start_mask,
+			  0, 0, 0, 0);
 
 	/* Reinitialize and start all the counter that overflowed */
 	while (ctr_ovf_mask) {
@@ -678,13 +814,10 @@ static inline void rvpmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
 			hwc = &event->hw;
 			max_period = riscv_pmu_ctr_get_width_mask(event);
 			init_val = local64_read(&hwc->prev_count) & max_period;
-#if defined(CONFIG_32BIT)
-			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx, 1,
-				  flag, init_val, init_val >> 32, 0);
-#else
-			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx, 1,
-				  flag, init_val, 0, 0);
-#endif
+			if (static_branch_likely(&riscv_pmu_cdeleg_available))
+				rvpmu_deleg_ctr_start(event, init_val);
+			else
+				rvpmu_sbi_ctr_start(event, init_val);
 			perf_event_update_userpage(event);
 		}
 		ctr_ovf_mask = ctr_ovf_mask >> 1;
@@ -723,7 +856,10 @@ static irqreturn_t rvpmu_ovf_handler(int irq, void *dev)
 	}
 
 	pmu = to_riscv_pmu(event->pmu);
-	rvpmu_sbi_stop_hw_ctrs(pmu);
+	if (static_branch_likely(&riscv_pmu_cdeleg_available))
+		rvpmu_deleg_ctr_stop_mask(cpu_hw_evt->used_hw_ctrs[0]);
+	else
+		rvpmu_sbi_stop_hw_ctrs(pmu);
 
 	/* Overflow status register should only be read after counter are stopped */
 	ALT_SBI_PMU_OVERFLOW(overflow);
@@ -779,22 +915,174 @@ static irqreturn_t rvpmu_ovf_handler(int irq, void *dev)
 		}
 	}
 
-	rvpmu_sbi_start_overflow_mask(pmu, overflowed_ctrs);
+	rvpmu_start_overflow_mask(pmu, overflowed_ctrs);
 	perf_sample_event_took(sched_clock() - start_clock);
 
 	return IRQ_HANDLED;
 }
 
+static int get_deleg_hw_ctr_width(int counter_offset)
+{
+	unsigned long hpm_warl;
+	int num_bits;
+
+	if (counter_offset < 3 || counter_offset > 31)
+		return 0;
+
+	hpm_warl = csr_ind_warl(CSR_SIREG, SISELECT_SSCCFG_BASE, counter_offset, -1);
+	num_bits = __fls(hpm_warl);
+
+#if defined(CONFIG_32BIT)
+	hpm_warl = csr_ind_warl(CSR_SIREG4, SISELECT_SSCCFG_BASE, counter_offset, -1);
+	num_bits += __fls(hpm_warl);
+#endif
+	return num_bits;
+}
+
+static int rvpmu_deleg_find_ctrs(void)
+{
+	int i, num_hw_ctr = 0;
+	union sbi_pmu_ctr_info cinfo;
+	unsigned long scountinhibit_old = 0;
+
+	/* Do a WARL write/read to detect which hpmcounters have been delegated */
+	scountinhibit_old = csr_read(CSR_SCOUNTINHIBIT);
+	csr_write(CSR_SCOUNTINHIBIT, -1);
+	cmask = csr_read(CSR_SCOUNTINHIBIT);
+
+	csr_write(CSR_SCOUNTINHIBIT, scountinhibit_old);
+
+	for_each_set_bit(i, &cmask, RISCV_MAX_HW_COUNTERS) {
+		if (unlikely(i == 1))
+			continue; /* This should never happen as TM is read only */
+		cinfo.value = 0;
+		cinfo.type = SBI_PMU_CTR_TYPE_HW;
+		/*
+		 * If counter delegation is enabled, the csr stored to the cinfo will
+		 * be a virtual counter that the delegation attempts to read.
+		 */
+		cinfo.csr = CSR_CYCLE + i;
+		if (i == 0 || i == 2)
+			cinfo.width = 63;
+		else
+			cinfo.width = get_deleg_hw_ctr_width(i) - 1;
+
+		num_hw_ctr++;
+		pmu_ctr_list[i].value = cinfo.value;
+	}
+
+	return num_hw_ctr;
+}
+
+static int get_deleg_fixed_hw_idx(struct cpu_hw_events *cpuc, struct perf_event *event)
+{
+	return -EINVAL;
+}
+
+static int get_deleg_next_hpm_hw_idx(struct cpu_hw_events *cpuc, struct perf_event *event)
+{
+	unsigned long hw_ctr_mask = 0;
+
+	/*
+	 * TODO: Treat every hpmcounter can monitor every event for now.
+	 * The event to counter mapping should come from the json file.
+	 * The mapping should also tell if sampling is supported or not.
+	 */
+
+	/* Select only hpmcounters */
+	hw_ctr_mask = cmask & (~0x7);
+	hw_ctr_mask &= ~(cpuc->used_hw_ctrs[0]);
+	return __ffs(hw_ctr_mask);
+}
+
+static void update_deleg_hpmevent(int counter_idx, uint64_t event_value, uint64_t filter_bits)
+{
+	uint64_t hpmevent_value = 0;
+
+	/* OF bit should be enable during the start if sampling is requested */
+	hpmevent_value = (event_value & ~HPMEVENT_MASK) | filter_bits | HPMEVENT_OF;
+#if defined(CONFIG_32BIT)
+	csr_ind_write(CSR_SIREG2, SISELECT_SSCCFG_BASE, counter_idx, hpmevent_value & 0xFFFFFFFF);
+	if (riscv_isa_extension_available(NULL, SSCOFPMF))
+		csr_ind_write(CSR_SIREG5, SISELECT_SSCCFG_BASE, counter_idx,
+			      hpmevent_value >> BITS_PER_LONG);
+#else
+	csr_ind_write(CSR_SIREG2, SISELECT_SSCCFG_BASE, counter_idx, hpmevent_value);
+#endif
+}
+
+static int rvpmu_deleg_ctr_get_idx(struct perf_event *event)
+{
+	struct hw_perf_event *hwc = &event->hw;
+	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
+	struct cpu_hw_events *cpuc = this_cpu_ptr(rvpmu->hw_events);
+	unsigned long hw_ctr_max_id;
+	uint64_t priv_filter;
+	int idx;
+
+	/*
+	 * TODO: We should not rely on SBI Perf encoding to check if the event
+	 * is a fixed one or not.
+	 */
+	if (!is_sampling_event(event)) {
+		idx = get_deleg_fixed_hw_idx(cpuc, event);
+		if (idx == 0 || idx == 2) {
+			/* Priv mode filter bits are only available if smcntrpmf is present */
+			if (riscv_isa_extension_available(NULL, SMCNTRPMF))
+				goto found_idx;
+			else
+				goto skip_update;
+		}
+	}
+
+	hw_ctr_max_id = __fls(cmask);
+	idx = get_deleg_next_hpm_hw_idx(cpuc, event);
+	if (idx < 3 || idx > hw_ctr_max_id)
+		goto out_err;
+found_idx:
+	priv_filter = get_deleg_priv_filter_bits(event);
+	update_deleg_hpmevent(idx, hwc->config, priv_filter);
+skip_update:
+	if (!test_and_set_bit(idx, cpuc->used_hw_ctrs))
+		return idx;
+out_err:
+	return -ENOENT;
+}
+
 static void rvpmu_ctr_start(struct perf_event *event, u64 ival)
 {
-	rvpmu_sbi_ctr_start(event, ival);
-	/* TODO: Counter delegation implementation */
+	struct hw_perf_event *hwc = &event->hw;
+
+	if (static_branch_likely(&riscv_pmu_cdeleg_available) && !pmu_sbi_is_fw_event(event))
+		rvpmu_deleg_ctr_start(event, ival);
+	else
+		rvpmu_sbi_ctr_start(event, ival);
+
+
+	if ((hwc->flags & PERF_EVENT_FLAG_USER_ACCESS) &&
+	    (hwc->flags & PERF_EVENT_FLAG_USER_READ_CNT))
+		rvpmu_set_scounteren((void *)event);
 }
 
 static void rvpmu_ctr_stop(struct perf_event *event, unsigned long flag)
 {
-	rvpmu_sbi_ctr_stop(event, flag);
-	/* TODO: Counter delegation implementation */
+	struct hw_perf_event *hwc = &event->hw;
+
+	if ((hwc->flags & PERF_EVENT_FLAG_USER_ACCESS) &&
+	    (hwc->flags & PERF_EVENT_FLAG_USER_READ_CNT))
+		rvpmu_reset_scounteren((void *)event);
+
+	if (static_branch_likely(&riscv_pmu_cdeleg_available) &&
+	    !pmu_sbi_is_fw_event(event)) {
+		/*
+		 * The counter is already stopped. No need to stop again. Counter
+		 * mapping will be reset in clear_idx function.
+		 */
+		if (flag != RISCV_PMU_STOP_FLAG_RESET)
+			rvpmu_deleg_ctr_stop_mask((1 << hwc->idx));
+	} else {
+		rvpmu_sbi_ctr_stop(event, flag);
+	}
 }
 
 static int rvpmu_find_ctrs(void)
@@ -828,20 +1116,18 @@ static int rvpmu_find_ctrs(void)
 
 static int rvpmu_event_map(struct perf_event *event, u64 *econfig)
 {
-	return rvpmu_sbi_event_map(event, econfig);
-	/* TODO: Counter delegation implementation */
+	if (static_branch_likely(&riscv_pmu_cdeleg_available) && !pmu_sbi_is_fw_event(event))
+		return rvpmu_deleg_event_map(event, econfig);
+	else
+		return rvpmu_sbi_event_map(event, econfig);
 }
 
 static int rvpmu_ctr_get_idx(struct perf_event *event)
 {
-	return rvpmu_sbi_ctr_get_idx(event);
-	/* TODO: Counter delegation implementation */
-}
-
-static u64 rvpmu_ctr_read(struct perf_event *event)
-{
-	return rvpmu_sbi_ctr_read(event);
-	/* TODO: Counter delegation implementation */
+	if (static_branch_likely(&riscv_pmu_cdeleg_available) && !pmu_sbi_is_fw_event(event))
+		return rvpmu_deleg_ctr_get_idx(event);
+	else
+		return rvpmu_sbi_ctr_get_idx(event);
 }
 
 static int rvpmu_starting_cpu(unsigned int cpu, struct hlist_node *node)
@@ -859,7 +1145,16 @@ static int rvpmu_starting_cpu(unsigned int cpu, struct hlist_node *node)
 		csr_write(CSR_SCOUNTEREN, 0x2);
 
 	/* Stop all the counters so that they can be enabled from perf */
-	rvpmu_sbi_stop_all(pmu);
+	if (static_branch_likely(&riscv_pmu_cdeleg_available)) {
+		rvpmu_deleg_ctr_stop_mask(cmask);
+		if (static_branch_likely(&riscv_pmu_sbi_available)) {
+			/* Stop the firmware counters as well */
+			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, 0, firmware_cmask,
+				0, 0, 0, 0);
+		}
+	} else {
+		rvpmu_sbi_stop_all(pmu);
+	}
 
 	if (riscv_pmu_use_irq) {
 		cpu_hw_evt->irq = riscv_pmu_irq;
@@ -1142,7 +1437,10 @@ static int rvpmu_device_probe(struct platform_device *pdev)
 		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
 	}
 
-	pmu->pmu.attr_groups = riscv_pmu_attr_groups;
+	if (cdeleg_available)
+		pmu->pmu.attr_groups = riscv_cdeleg_pmu_attr_groups;
+	else
+		pmu->pmu.attr_groups = riscv_sbi_pmu_attr_groups;
 	pmu->cmask = cmask;
 	pmu->ctr_start = rvpmu_ctr_start;
 	pmu->ctr_stop = rvpmu_ctr_stop;
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 3d2b1d7913f3..f878369fecc8 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -20,6 +20,7 @@
  */
 
 #define RISCV_MAX_COUNTERS	64
+#define RISCV_MAX_HW_COUNTERS	32
 #define RISCV_OP_UNSUPP		(-EOPNOTSUPP)
 #define RISCV_PMU_PDEV_NAME	"riscv-pmu"
 #define RISCV_PMU_LEGACY_PDEV_NAME	"riscv-pmu-legacy"
@@ -28,6 +29,8 @@
 
 #define RISCV_PMU_CONFIG1_GUEST_EVENTS 0x1
 
+#define RISCV_PMU_DELEG_RAW_EVENT_MASK GENMASK_ULL(55, 0)
+
 struct cpu_hw_events {
 	/* currently enabled events */
 	int			n_events;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
