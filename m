Return-Path: <SRS0=2wW0=KX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41BADC2B9F7
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 18:46:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06269613D1
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 18:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06269613D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/h6JVyC8/hlQEcDwpKQL90cGAamTLgW7LMZpMwH40HU=; b=gk6ShIvYH8iVeF
	DKkdTW59/+L56IP+MeEQbgqJEsGaeQqtMN1xX0kEjfM3jaGRHLcQ8OrDaLnLUBAaUhHIIWuP7T3ZG
	ArjXrdfcCYdn+gKFNL0dJl6KVy6l2/tJPNuGQQJWTKYcXGNcUBqloka5bFCH7LoI01h5IFTZCi8rO
	hN0M543wEgNKKPRlKSAVkj1q2ojXkJDRlOu6CXzEnWrwPWFBUulRCnq/HBLgqwcx8NLFF63Vp219X
	CpxkOjf0RRqMUZqDyhIaOwYSWMhyWzNC1mRFaIzd/DploQu4qw6BZKNPKpOkXvTiXIongaSdXaJNg
	+rijesM7Vlq43aSsyJ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmhUg-000NZV-RD; Fri, 28 May 2021 18:46:02 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmhTg-000Mr0-6G
 for linux-riscv@lists.infradead.org; Fri, 28 May 2021 18:45:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1622227499; x=1653763499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=me2oGfj9vHQVkxHpbXVCsmZCATMVO0TUMDnMzHw2SVA=;
 b=TfiDC/CxAYUXGeRLtDrkK0Zhag5xyPL74eDvJIAcauyGYSFyHAA4LC7U
 MlK2Vj9uvvpRyLMD60EGAaw+1bk+/a7rfY3xafzD3os8gIL4jB11AE80p
 Q0vGMgOz4UgVQpk3mzC0Zdfe0kWBuDQHXdTJG7oG3s5GlFhK3dUfQ+5gC
 OHIoshsPruIJQyRlgiYe8jHGxr/jAIGchviUo8IYCJvXVKOo1fpyL1kGW
 9cXYorsy2SDUNvqHT1TEO+bpRyunMiVRJ8koi0l2qsoDm1XAQoTOP4PGz
 05hRp2FHeWkDnotgViQxtkqevu9y9DnIflTWPg33eZ/aeEgNvw9Eg8WMH w==;
IronPort-SDR: xXtHBEzKOIaeVV8IgcwBOe8LU0HK79SmLgRanwsHxelJP5BXJALYPTJfbNd1C1YjdF7prhhoi4
 KY9R404IwmxdVbMcwOwMKmObu3GQusGXofFbFdGAZYOefR6QBWku0r11QyaRMIJrj7yq1vWh7h
 fcTGdkmsER1qjo6eWh66pdpkj7PcQNm/guPRLvB/U2weLZooNgLRgDBwrKWNF7JAPy1BMQdUTl
 caFh5gH6nRagmezni35hpHPlcvDscK2DybnJx7nzyvOcysGHfs1nBx9Ir6o8U0F371KM9chjZo
 mHE=
X-IronPort-AV: E=Sophos;i="5.83,230,1616428800"; d="scan'208";a="169880815"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 May 2021 02:44:56 +0800
IronPort-SDR: 4QvL+sZGRn/+u0MAHcPvlby7hvC1HbQrCfJF0WVugtQSAIpU8WInLxpSyhQyQbc8jYVf1YhB3Y
 AyEUwrzgvEDG5J6sC//6wVNFWkuLREhU/o+jinn7dPyh5EfmQUI58ne7gbeshwR8ACPhCNsFLv
 EKJ0NGyrkml6DtVjOgwdL0oQejbHGEb3ZWMTmDAPuPf9Wl+mYx0NzZQPkd3l8xE7qlxdgUlqu0
 kGjnRXFsb/EgUCnxqG4DgGm1mC1+xKPm2150HZ3MCtVYRU7uh1AzsDvCR6dWYGMuiPyHDGpq6u
 +tHIkCkEwJgc8F9VTIhrylYV
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2021 11:22:57 -0700
IronPort-SDR: J2SLvC4XQMtHQ+UBTo2csxM7L83TIjsYZN4TGuWzIlKKBUHNBXNzFg4uqsl0+nURKAXEYWpZgb
 kqcn7Gv1aO3/M46E1EH77QmbKyTi9nd/XCni/K5NehTswBgcB/byboqgiMPelm+P/kFuGwA+Fb
 lJetWn7o+X+w8EVheX56HB1nWLBl3bDyuWDOXndSsl2uRJD1ww4sjc/AFtz8flt4q7fcH9wqzT
 cX9AXdG6ClCxohJ7pDQPe+HT3VVofr9SPgOx5EKk3wqkZ/y4V4uSuZziH2JVGVpLhn2P21E6f+
 ecg=
WDCIronportException: Internal
Received: from unknown (HELO jedi-01.wdc.com) ([10.225.163.91])
 by uls-op-cesaip02.wdc.com with ESMTP; 28 May 2021 11:44:51 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 bpf@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, linux-doc@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 Nick Kossifidis <mick@ics.forth.gr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alan Kao <alankao@andestech.com>,
 Nick Hu <nickhu@andestech.com>, Vincent Chen <vincent.chen@sifive.com>
Subject: [RFC v2 6/7] RISC-V: Add perf platform driver based on SBI PMU
 extension
Date: Fri, 28 May 2021 11:44:04 -0700
Message-Id: <20210528184405.1793783-7-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210528184405.1793783-1-atish.patra@wdc.com>
References: <20210528184405.1793783-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_114500_319940_D3621F83 
X-CRM114-Status: GOOD (  24.58  )
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

RISC-V SBI specification added a PMU extension that allows to configure
/start/stop any pmu counter. The RISC-V perf can use most of the generic
perf features except interrupt overflow and event filtering based on
privilege mode which will be added in future.

It also allows to monitor a handful of firmware counters that can provide
insights into firmware activity during a performance analysis.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 drivers/perf/Kconfig         |   8 +
 drivers/perf/Makefile        |   1 +
 drivers/perf/riscv_pmu.c     |   2 +
 drivers/perf/riscv_pmu_sbi.c | 537 +++++++++++++++++++++++++++++++++++
 4 files changed, 548 insertions(+)
 create mode 100644 drivers/perf/riscv_pmu_sbi.c

diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
index 1546a487d970..2acb5feaab35 100644
--- a/drivers/perf/Kconfig
+++ b/drivers/perf/Kconfig
@@ -73,6 +73,14 @@ config RISCV_PMU_LEGACY
 	  implementation on RISC-V based systems. This only allows counting
 	  of cycle/instruction counter and will be removed in future.
 
+config RISCV_PMU_SBI
+	depends on RISCV_PMU
+	bool "RISC-V PMU based on SBI PMU extension"
+	default y
+	help
+	  Say y if you want to use the CPU performance monitor
+	  using SBI PMU extension on RISC-V based systems.
+
 config ARM_PMU_ACPI
 	depends on ARM_PMU && ACPI
 	def_bool y
diff --git a/drivers/perf/Makefile b/drivers/perf/Makefile
index e8aa666a9d28..7bcac4b5a983 100644
--- a/drivers/perf/Makefile
+++ b/drivers/perf/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_QCOM_L3_PMU) += qcom_l3_pmu.o
 obj-$(CONFIG_RISCV_PMU) += riscv_pmu.o
 ifeq ($(CONFIG_RISCV_PMU), y)
 obj-$(CONFIG_RISCV_PMU_LEGACY) += riscv_pmu_legacy.o
+obj-$(CONFIG_RISCV_PMU_SBI) += riscv_pmu_sbi.o
 endif
 obj-$(CONFIG_THUNDERX2_PMU) += thunderx2_pmu.o
 obj-$(CONFIG_XGENE_PMU) += xgene_pmu.o
diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
index c184aa50134d..596af3a40948 100644
--- a/drivers/perf/riscv_pmu.c
+++ b/drivers/perf/riscv_pmu.c
@@ -15,6 +15,8 @@
 #include <linux/printk.h>
 #include <linux/smp.h>
 
+#include <asm/sbi.h>
+
 static unsigned long csr_read_num(int csr_num)
 {
 #define switchcase_csr_read(__csr_num, __val)		{\
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
new file mode 100644
index 000000000000..80dd1de428c4
--- /dev/null
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -0,0 +1,537 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RISC-V performance counter support.
+ *
+ * Copyright (C) 2021 Western Digital Corporation or its affiliates.
+ *
+ * This code is based on ARM perf event code which is in turn based on
+ * sparc64 and x86 code.
+ */
+
+#include <linux/mod_devicetable.h>
+#include <linux/perf/riscv_pmu.h>
+#include <linux/platform_device.h>
+
+#include <asm/sbi.h>
+
+union sbi_pmu_ctr_info {
+	unsigned long value;
+	struct {
+		unsigned long csr:12;
+		unsigned long width:6;
+#if __riscv_xlen == 32
+		unsigned long reserved:13;
+#else
+		unsigned long reserved:45;
+#endif
+		unsigned long type:1;
+	};
+};
+
+/**
+ * RISC-V doesn't have hetergenous harts yet. This need to be part of
+ * per_cpu in case of harts with different pmu counters
+ */
+static union sbi_pmu_ctr_info *pmu_ctr_list;
+
+struct pmu_event_data {
+	union {
+		union {
+			struct hw_gen_event {
+				uint32_t event_code:16;
+				uint32_t event_type:4;
+				uint32_t reserved:12;
+			} hw_gen_event;
+			struct hw_cache_event {
+				uint32_t result_id:1;
+				uint32_t op_id:2;
+				uint32_t cache_id:13;
+				uint32_t event_type:4;
+				uint32_t reserved:12;
+			} hw_cache_event;
+		};
+		uint32_t event_idx;
+	};
+};
+
+static const struct pmu_event_data pmu_hw_event_map[] = {
+	[PERF_COUNT_HW_CPU_CYCLES]		= {.hw_gen_event = {
+							SBI_PMU_HW_CPU_CYCLES,
+							SBI_PMU_EVENT_TYPE_HW, 0}},
+	[PERF_COUNT_HW_INSTRUCTIONS]		= {.hw_gen_event = {
+							SBI_PMU_HW_INSTRUCTIONS,
+							SBI_PMU_EVENT_TYPE_HW, 0}},
+	[PERF_COUNT_HW_CACHE_REFERENCES]	= {.hw_gen_event = {
+							SBI_PMU_HW_CACHE_REFERENCES,
+							SBI_PMU_EVENT_TYPE_HW, 0}},
+	[PERF_COUNT_HW_CACHE_MISSES]		= {.hw_gen_event = {
+							SBI_PMU_HW_CACHE_MISSES,
+							SBI_PMU_EVENT_TYPE_HW, 0}},
+	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS]	= {.hw_gen_event = {
+							SBI_PMU_HW_BRANCH_INSTRUCTIONS,
+							SBI_PMU_EVENT_TYPE_HW, 0}},
+	[PERF_COUNT_HW_BRANCH_MISSES]		= {.hw_gen_event = {
+							SBI_PMU_HW_BRANCH_MISSES,
+							SBI_PMU_EVENT_TYPE_HW, 0}},
+	[PERF_COUNT_HW_BUS_CYCLES]		= {.hw_gen_event = {
+							SBI_PMU_HW_BUS_CYCLES,
+							SBI_PMU_EVENT_TYPE_HW, 0}},
+	[PERF_COUNT_HW_STALLED_CYCLES_FRONTEND]	= {.hw_gen_event = {
+							SBI_PMU_HW_STALLED_CYCLES_FRONTEND,
+							SBI_PMU_EVENT_TYPE_HW, 0}},
+	[PERF_COUNT_HW_STALLED_CYCLES_BACKEND]	= {.hw_gen_event = {
+							SBI_PMU_HW_STALLED_CYCLES_BACKEND,
+							SBI_PMU_EVENT_TYPE_HW, 0}},
+	[PERF_COUNT_HW_REF_CPU_CYCLES]		= {.hw_gen_event = {
+							SBI_PMU_HW_REF_CPU_CYCLES,
+							SBI_PMU_EVENT_TYPE_HW, 0}},
+};
+
+#define C(x) PERF_COUNT_HW_CACHE_##x
+static const struct pmu_event_data pmu_cache_event_map[PERF_COUNT_HW_CACHE_MAX]
+[PERF_COUNT_HW_CACHE_OP_MAX]
+[PERF_COUNT_HW_CACHE_RESULT_MAX] = {
+	[C(L1D)] = {
+		[C(OP_READ)] = {
+			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
+					C(OP_READ), C(L1D), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
+					C(OP_READ), C(L1D), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+		},
+		[C(OP_WRITE)] = {
+			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
+					C(OP_WRITE), C(L1D), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
+					C(OP_WRITE), C(L1D), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+		},
+		[C(OP_PREFETCH)] = {
+			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
+					C(OP_PREFETCH), C(L1D), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
+					C(OP_PREFETCH), C(L1D), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+		},
+	},
+	[C(L1I)] = {
+		[C(OP_READ)] = {
+			[C(RESULT_ACCESS)] = {.hw_cache_event =	{C(RESULT_ACCESS),
+					C(OP_READ), C(L1I), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS), C(OP_READ),
+					C(L1I), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+		},
+		[C(OP_WRITE)] = {
+			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
+					C(OP_WRITE), C(L1I), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
+					C(OP_WRITE), C(L1I), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+		},
+		[C(OP_PREFETCH)] = {
+			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
+					C(OP_PREFETCH), C(L1I), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
+					C(OP_PREFETCH), C(L1I), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+		},
+	},
+	[C(LL)] = {
+		[C(OP_READ)] = {
+			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
+					C(OP_READ), C(LL), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
+					C(OP_READ), C(LL), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+		},
+		[C(OP_WRITE)] = {
+			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
+					C(OP_WRITE), C(LL), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
+					C(OP_WRITE), C(LL), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+		},
+		[C(OP_PREFETCH)] = {
+			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
+					C(OP_PREFETCH), C(LL), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
+					C(OP_PREFETCH), C(LL), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+		},
+	},
+	[C(DTLB)] = {
+		[C(OP_READ)] = {
+			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
+					C(OP_READ), C(DTLB), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
+					C(OP_READ), C(DTLB), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+		},
+		[C(OP_WRITE)] = {
+			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
+					C(OP_WRITE), C(DTLB), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
+					C(OP_WRITE), C(DTLB), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+		},
+		[C(OP_PREFETCH)] = {
+			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
+					C(OP_PREFETCH), C(DTLB), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
+					C(OP_PREFETCH), C(DTLB), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+		},
+	},
+	[C(ITLB)] = {
+		[C(OP_READ)] = {
+			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
+					C(OP_READ), C(ITLB), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
+					C(OP_READ), C(ITLB), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+		},
+		[C(OP_WRITE)] = {
+			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
+					C(OP_WRITE), C(ITLB), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
+					C(OP_WRITE), C(ITLB), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+		},
+		[C(OP_PREFETCH)] = {
+			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
+					C(OP_PREFETCH), C(ITLB), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
+					C(OP_PREFETCH), C(ITLB), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+		},
+	},
+	[C(BPU)] = {
+		[C(OP_READ)] = {
+			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
+					C(OP_READ), C(BPU), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
+					C(OP_READ), C(BPU), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+		},
+		[C(OP_WRITE)] = {
+			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
+					C(OP_WRITE), C(BPU), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
+					C(OP_WRITE), C(BPU), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+		},
+		[C(OP_PREFETCH)] = {
+			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
+					C(OP_PREFETCH), C(BPU), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
+					C(OP_PREFETCH), C(BPU), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+		},
+	},
+	[C(NODE)] = {
+		[C(OP_READ)] = {
+			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
+					C(OP_READ), C(NODE), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
+					C(OP_READ), C(NODE), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+		},
+		[C(OP_WRITE)] = {
+			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
+					C(OP_WRITE), C(NODE), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
+					C(OP_WRITE), C(NODE), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+		},
+		[C(OP_PREFETCH)] = {
+			[C(RESULT_ACCESS)] = {.hw_cache_event = {C(RESULT_ACCESS),
+					C(OP_PREFETCH), C(NODE), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+			[C(RESULT_MISS)] = {.hw_cache_event = {C(RESULT_MISS),
+					C(OP_PREFETCH), C(NODE), SBI_PMU_EVENT_TYPE_CACHE, 0}},
+		},
+	},
+};
+
+static int pmu_sbi_ctr_get_width(int idx)
+{
+	return pmu_ctr_list[idx].width;
+}
+
+static int pmu_sbi_ctr_get_idx(struct perf_event *event)
+{
+	struct hw_perf_event *hwc = &event->hw;
+	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
+	struct cpu_hw_events *cpuc = this_cpu_ptr(rvpmu->hw_events);
+	struct sbiret ret;
+	int idx;
+	uint64_t cbase = 0;
+	uint64_t cmask = GENMASK_ULL(rvpmu->num_counters - 1, 0);
+	unsigned long cflags = 0;
+
+	/* retrieve the available counter index */
+	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase, cmask,
+			cflags, hwc->event_base, hwc->config, 0);
+	if (ret.error) {
+		pr_debug("Not able to find a counter for event %lx config %llx\n",
+			hwc->event_base, hwc->config);
+		return sbi_err_map_linux_errno(ret.error);
+	}
+
+	idx = ret.value;
+	if (idx >= rvpmu->num_counters || !pmu_ctr_list[idx].value)
+		return -ENOENT;
+
+	/* Additional sanity check for the counter id */
+	if (!test_and_set_bit(idx, cpuc->used_event_ctrs))
+		return idx;
+	else
+		return -ENOENT;
+}
+
+static void pmu_sbi_ctr_clear_idx(struct perf_event *event)
+{
+
+	struct hw_perf_event *hwc = &event->hw;
+	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
+	struct cpu_hw_events *cpuc = this_cpu_ptr(rvpmu->hw_events);
+	int idx = hwc->idx;
+
+	clear_bit(idx, cpuc->used_event_ctrs);
+}
+
+static int pmu_event_find_cache(u64 config)
+{
+	unsigned int cache_type, cache_op, cache_result, ret;
+
+	cache_type = (config >>  0) & 0xff;
+	if (cache_type >= PERF_COUNT_HW_CACHE_MAX)
+		return -EINVAL;
+
+	cache_op = (config >>  8) & 0xff;
+	if (cache_op >= PERF_COUNT_HW_CACHE_OP_MAX)
+		return -EINVAL;
+
+	cache_result = (config >> 16) & 0xff;
+	if (cache_result >= PERF_COUNT_HW_CACHE_RESULT_MAX)
+		return -EINVAL;
+
+	ret = pmu_cache_event_map[cache_type][cache_op][cache_result].event_idx;
+
+	return ret;
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
+static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
+{
+	u32 type = event->attr.type;
+	u64 config = event->attr.config;
+	int bSoftware;
+	u64 raw_config_val;
+	int ret;
+
+	switch (type) {
+	case PERF_TYPE_HARDWARE:
+		if (config >= PERF_COUNT_HW_MAX)
+			return -EINVAL;
+		ret = pmu_hw_event_map[event->attr.config].event_idx;
+		break;
+	case PERF_TYPE_HW_CACHE:
+		ret = pmu_event_find_cache(config);
+		break;
+	case PERF_TYPE_RAW:
+		/*
+		 * As per SBI specification, the upper 7 bits must be unused for
+		 * a raw event. Use the MSB (63b) to distinguish between hardware
+		 * raw event and firmware events.
+		 */
+		bSoftware = config >> 63;
+		raw_config_val = config & RISCV_PMU_RAW_EVENT_MASK;
+		if (bSoftware) {
+			if (raw_config_val < SBI_PMU_FW_MAX)
+				ret = (raw_config_val & 0xFFFF) |
+				      (SBI_PMU_EVENT_TYPE_FW << 16);
+			else
+				return -EINVAL;
+		} else {
+			ret = RISCV_PMU_RAW_EVENT_IDX;
+			*econfig = raw_config_val;
+		}
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static u64 pmu_sbi_ctr_read(struct perf_event *event)
+{
+	struct hw_perf_event *hwc = &event->hw;
+	int idx = hwc->idx;
+	struct sbiret ret;
+	union sbi_pmu_ctr_info info;
+	u64 val = 0;
+
+	if (pmu_sbi_is_fw_event(event)) {
+		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ,
+				hwc->idx, 0, 0, 0, 0, 0);
+		if (!ret.error)
+			val = ret.value;
+	} else {
+		info = pmu_ctr_list[idx];
+		val = riscv_pmu_ctr_read_csr(info.csr);
+		if (IS_ENABLED(CONFIG_32BIT))
+			val = ((u64)riscv_pmu_ctr_read_csr(info.csr + 0x80)) << 32 | val;
+	}
+
+	return val;
+}
+
+static void pmu_sbi_ctr_start(struct perf_event *event, u64 ival)
+{
+	struct sbiret ret;
+	struct hw_perf_event *hwc = &event->hw;
+
+	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, hwc->idx,
+			1, 1, ival, 0, 0);
+	if (ret.error)
+		pr_err("Starting counter idx %d failed with error %d\n",
+			hwc->idx, sbi_err_map_linux_errno(ret.error));
+}
+
+static void pmu_sbi_ctr_stop(struct perf_event *event)
+{
+	struct sbiret ret;
+	struct hw_perf_event *hwc = &event->hw;
+	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
+	struct cpu_hw_events *cpuc = this_cpu_ptr(rvpmu->hw_events);
+	unsigned long flag = 0;
+
+	if (cpuc->events[hwc->idx] == NULL)
+		flag = SBI_PMU_STOP_FLAG_RESET;
+	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, hwc->idx, 1, flag, 0, 0, 0);
+	if (ret.error)
+		pr_err("Stopping counter idx %d failed with error %d\n",
+			hwc->idx, sbi_err_map_linux_errno(ret.error));
+}
+
+static int pmu_sbi_find_num_ctrs(void)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_NUM_COUNTERS, 0, 0, 0, 0, 0, 0);
+	if (!ret.error)
+		return ret.value;
+	else
+		return sbi_err_map_linux_errno(ret.error);
+}
+
+static int pmu_sbi_get_ctrinfo(int nctr)
+{
+	struct sbiret ret;
+	int i, num_hw_ctr = 0, num_fw_ctr = 0;
+	union sbi_pmu_ctr_info cinfo;
+
+	pmu_ctr_list = kzalloc(sizeof(*pmu_ctr_list) * nctr, GFP_KERNEL);
+	if (!pmu_ctr_list)
+		return -ENOMEM;
+
+	for (i = 0; i <= nctr; i++) {
+		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_INFO, i, 0, 0, 0, 0, 0);
+		if (ret.error)
+			/* The logical counter ids are not expected to be contiguous */
+			continue;
+		cinfo.value = ret.value;
+		if (cinfo.type == SBI_PMU_CTR_TYPE_FW)
+			num_fw_ctr++;
+		else
+			num_hw_ctr++;
+		pmu_ctr_list[i].value = cinfo.value;
+	}
+
+	pr_info("There are %d firmware & %d hardware counters available\n",
+		num_fw_ctr, num_hw_ctr);
+
+	return 0;
+}
+
+static int pmu_sbi_starting_cpu(unsigned int cpu)
+{
+	/* Enable the access for TIME csr only from the user mode now */
+	csr_write(CSR_SCOUNTEREN, 0x2);
+
+	return 0;
+}
+
+static int pmu_sbi_dying_cpu(unsigned int cpu)
+{
+	/* Disable all counters access for user mode now */
+	csr_write(CSR_SCOUNTEREN, 0x0);
+
+	return 0;
+}
+
+
+static int pmu_sbi_device_probe(struct platform_device *pdev)
+{
+	struct riscv_pmu *pmu = NULL;
+	int num_counters;
+
+	pmu = riscv_pmu_alloc();
+	if (!pmu)
+		return -ENOMEM;
+
+	if (((sbi_major_version() == 0) && (sbi_minor_version() < 3)) ||
+		sbi_probe_extension(SBI_EXT_PMU) <= 0) {
+		/* Fall back to the legacy implementation */
+		riscv_pmu_legacy_init(pmu);
+		return 0;
+	}
+
+	pr_info("SBI PMU extension is available\n");
+
+	num_counters = pmu_sbi_find_num_ctrs();
+	if (num_counters < 0) {
+		pr_err("SBI PMU extension doesn't provide any counters\n");
+		return -ENODEV;
+	}
+
+	/* cache all the information about counters now */
+	if (pmu_sbi_get_ctrinfo(num_counters))
+		return -ENODEV;
+
+	pmu->num_counters = num_counters;
+	pmu->ctr_start = pmu_sbi_ctr_start;
+	pmu->ctr_stop = pmu_sbi_ctr_stop;
+	pmu->event_map = pmu_sbi_event_map;
+	pmu->ctr_get_idx = pmu_sbi_ctr_get_idx;
+	pmu->ctr_get_width = pmu_sbi_ctr_get_width;
+	pmu->ctr_clear_idx = pmu_sbi_ctr_clear_idx;
+	pmu->ctr_read = pmu_sbi_ctr_read;
+
+	perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
+
+	cpuhp_setup_state(CPUHP_AP_PERF_RISCV_STARTING,
+			  "perf/riscv/pmu:starting",
+			  pmu_sbi_starting_cpu, pmu_sbi_dying_cpu);
+
+	return 0;
+}
+
+static struct platform_driver pmu_sbi_driver = {
+	.probe		= pmu_sbi_device_probe,
+	.driver		= {
+		.name	= RISCV_PMU_PDEV_NAME,
+	},
+};
+
+static int __init pmu_sbi_devinit(void)
+{
+	int ret;
+	struct platform_device *pdev;
+
+	ret = platform_driver_register(&pmu_sbi_driver);
+	if (ret)
+		return ret;
+
+	pdev = platform_device_register_simple(RISCV_PMU_PDEV_NAME, -1, NULL, 0);
+	if (IS_ERR(pdev)) {
+		platform_driver_unregister(&pmu_sbi_driver);
+		return PTR_ERR(pdev);
+	}
+
+	return ret;
+}
+device_initcall(pmu_sbi_devinit)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
