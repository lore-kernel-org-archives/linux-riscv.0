Return-Path: <SRS0=wr6O=IR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D335EC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 23:02:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 268896197E
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 23:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 268896197E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4kpOSlzW9ir6KhesWhPJHOwBuOagY2z8Y+JpQUviok0=; b=R7mS0effONgVYoYvYbZc8N/na
	LepK0MmfKGztLV1Fu4ZuggzT6SMj3DfJNNujzh8ZJzZvCuHJDtG/4YJTIe7X3IRE55xrwPDqAxS8N
	vrdLcJ/5IzX4AENTvUPe5ZVtziYRqlGmMfEAmRqtH+LaiwNFRp3i3nRD9TPN8RVk2jZxNlYz2qKH8
	INHq8eUmt59dT+AXxRrVgVS7RdtxJelLGYx74NO6IDjO56yxNGsvklEZEN0Q5tlasDhibxbiMY8tQ
	6+nG3TNZTuY0CS6wWQ2/dOd6sHbK1vpxr1v2NboH1eSGLNsspIU7F8betWosuVMblNtzkoD+4isxw
	tmnVJ02+g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNO7o-008IXz-2h; Fri, 19 Mar 2021 23:01:48 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNO7e-008ISd-Im
 for linux-riscv@lists.infradead.org; Fri, 19 Mar 2021 23:01:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616194899; x=1647730899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IOebBZvKkCFckooW+fYGY6X91AqDA6DhwpSLB4faeIs=;
 b=moHecMGMQgxzYhm/sQM/99+b43k/j9ZZTGyfb9KKrcILi/JAR878j29y
 WAqMI71iNIqhZLzin/SRXHiYWK3VK4GAPPcj+EEGy/1qVUPeS4MFwcFif
 HV3BppQbsoqZPekg1MkeKmt7nmoOWVmzyHLdsXKElZSdlGQ6SGIemhiW5
 L8pjOl8mL1d0fSgvrhoZi674g9qXKn3VXqDzLfKWMb/9DSKL6ZDM8rKqI
 MfP4JHacLM9cwbkJ42bgUAaklQTk6aR1EzT8nwdtFX2+86AQ3xqu8rKQf
 zHttErWnevpieKBhbLaM6JYuxHkqLczwiP0i8yLiYQ7S6IOvPUMXQ5UR9 A==;
IronPort-SDR: JrO+bFojrGqn2q55IiFEKI1Eh+27AEXr8v2I7/ATU/sav6GOh15LwIBXChNeLNuIglepUdqd3v
 ZuBVMsa2mpCO6KCbdC5lAdW+sirdmS9mImVe+GH2UrWYG91zhdg8nOYZSewk8iTJIcGkw4n8dt
 rGqpj1GhDfljIWjR25B8Lwy03Y432F8vGXTyOO0WqMtsfHx+N7FkGTky4Z8jBtL+CgMLNs3r3r
 xWYJkjWAV+LCFFmu+ARHs4R8qcZM7RbYdE2AxaVweWRFQ0vgkKiWUpAVQGUOj5lqQcHayi3ubV
 CjQ=
X-IronPort-AV: E=Sophos;i="5.81,263,1610380800"; d="scan'208";a="163715811"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2021 07:01:33 +0800
IronPort-SDR: qQYuK/ORuO6gEGVwvN9Xw+gWoIA3pGRO4HfsX0wfLvtdgrk75HK0X12Q4ebKXAtACp7dTdFEMz
 TFKZiHa6pnJaUENWr9X0Th3i4T7mx1t5tuBaVmzIUD8IvVNCsWGFD9O/mkd08LylYiIZ6rFswp
 QftO+Fj3iDJXeCwDja8VpVT3/XZuTQqrbO5QQkklPqjtH/T7b8GbhcBcA8/VD0awpVxYe8q1NO
 vfimQZsYl1V6YoGj5zNryIEZPY8KNIfs2BQgq0WCSwZOr+OdwRqZu/cuKBJf/hrPkBcllYl3gQ
 oYZFUMQJv0DnHUvVrkncktq2
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 15:42:04 -0700
IronPort-SDR: gVJWUzHFrCFBue/QX0eKoIWcQHQZlyAkYywiGPMSaCoIZQ8wmYwRpHb+ksQXw1/HtrXTmJQR+M
 oTsxfD7Bnjct/BhfflT+ghXAR9thr1dAYhgQt58zFmkDlBzM8+JUFr/ZUcBCrhH5+9vzXtug77
 QflSrZnXhY3t+iZdqFbD3oOJePjACgGTTsxMpDPywqv5Y8yNOPccS36EB4cJMvqrOrR7B/xPyU
 SC30KVXIKs9Qz5FifikRqw99OVR9aLscNpkxGe51oJG3bydTrrfJ/ws/b83P3LC7K3Sufe57/E
 2yY=
WDCIronportException: Internal
Received: from ind002560.ad.shared (HELO jedi-01.hgst.com) ([10.86.48.105])
 by uls-op-cesaip02.wdc.com with ESMTP; 19 Mar 2021 16:01:33 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>
Subject: [RFC 6/6] RISC-V: Add perf platform driver based on SBI PMU extension
Date: Fri, 19 Mar 2021 16:01:06 -0700
Message-Id: <20210319230106.2186694-7-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319230106.2186694-1-atish.patra@wdc.com>
References: <20210319230106.2186694-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_230139_064941_6003237D 
X-CRM114-Status: GOOD (  29.40  )
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
 drivers/perf/Kconfig           |   8 +
 drivers/perf/Makefile          |   1 +
 drivers/perf/riscv_pmu.c       |  12 +-
 drivers/perf/riscv_pmu_sbi.c   | 464 +++++++++++++++++++++++++++++++++
 include/linux/perf/riscv_pmu.h |   1 +
 5 files changed, 485 insertions(+), 1 deletion(-)
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
index 838dca2ffca8..95e4ca07dd29 100644
--- a/drivers/perf/riscv_pmu.c
+++ b/drivers/perf/riscv_pmu.c
@@ -16,6 +16,8 @@
 #include <linux/printk.h>
 #include <linux/smp.h>
 
+#include <asm/sbi.h>
+
 static unsigned long csr_read_num(int csr_num)
 {
 #define switchcase_csr_read(__csr_num, __val)		{\
@@ -350,7 +352,15 @@ static int riscv_pmu_device_probe(struct platform_device *pdev)
 	if (!pmu)
 		return -ENOMEM;
 
-	riscv_pmu_legacy_init(pmu);
+	if (sbi_major_version() == 0 &&
+	    sbi_minor_version() == 3 &&
+	    sbi_probe_extension(SBI_EXT_PMU) > 0) {
+		pr_info("SBI PMU extension detected\n");
+		riscv_pmu_sbi_init(pmu);
+	} else {
+		pr_info("Legacy PMU is in use as SBI PMU extension is not available\n");
+		riscv_pmu_legacy_init(pmu);
+	}
 
 	cpuhp_setup_state(CPUHP_AP_PERF_RISCV_STARTING,
 			  "perf/riscv/pmu:starting",
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
new file mode 100644
index 000000000000..1f27802bd0e9
--- /dev/null
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -0,0 +1,464 @@
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
+#include <linux/perf/riscv_pmu.h>
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
+static int pmu_sbi_get_ctr_width(int idx)
+{
+	return pmu_ctr_list[idx].width;
+}
+
+static int pmu_sbi_get_ctr_idx(struct perf_event *event)
+{
+	struct hw_perf_event *hwc = &event->hw;
+	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
+	struct cpu_hw_events *cpuc = this_cpu_ptr(rvpmu->hw_events);
+	struct sbiret ret;
+	int idx;
+	uint64_t cbase = 0;
+	uint64_t cmask = GENMASK_ULL(rvpmu->num_counters, 0);
+
+	/* retrieve the available counter index */
+	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase, cmask,
+			hwc->event_base, hwc->config, 0, 0);
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
+static void pmu_sbi_clear_ctr_idx(struct perf_event *event)
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
+static int pmu_map_cache_event(u64 config)
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
+static int pmu_sbi_map_event(struct perf_event *event, u64 *econfig)
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
+		ret = pmu_map_cache_event(config);
+		break;
+	case PERF_TYPE_RAW:
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
+static u64 pmu_sbi_read_ctr(struct perf_event *event)
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
+		val = riscv_pmu_read_ctr_csr(info.csr);
+		if (IS_ENABLED(CONFIG_32BIT))
+			val = ((u64)riscv_pmu_read_ctr_csr(info.csr + 0x80)) << 32 | val;
+	}
+
+	return val;
+}
+
+static void pmu_sbi_start_ctr(struct perf_event *event, u64 ival)
+{
+	struct sbiret ret;
+	struct hw_perf_event *hwc = &event->hw;
+
+	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, hwc->idx,
+			ival, 0, 0, 0, 0);
+	if (ret.error)
+		pr_err("Starting counter idx %d failed with error %d\n",
+			hwc->idx, sbi_err_map_linux_errno(ret.error));
+}
+
+static void pmu_sbi_stop_ctr(struct perf_event *event)
+{
+	struct sbiret ret;
+	struct hw_perf_event *hwc = &event->hw;
+	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
+	struct cpu_hw_events *cpuc = this_cpu_ptr(rvpmu->hw_events);
+	bool breset = false;
+
+	if (cpuc->events[hwc->idx] == NULL)
+		breset = true;
+	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, hwc->idx, breset, 0, 0, 0, 0);
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
+void riscv_pmu_sbi_init(struct riscv_pmu *pmu)
+{
+	int num_counters;
+
+	num_counters = pmu_sbi_find_num_ctrs();
+	if (num_counters < 0) {
+		pr_err("SBI PMU extension doesn't provide any counters\n");
+		return;
+	}
+
+	/* cache all the information about counters now */
+	if (pmu_sbi_get_ctrinfo(num_counters))
+		return;
+
+	pmu->num_counters = num_counters;
+	pmu->start_ctr = pmu_sbi_start_ctr;
+	pmu->stop_ctr = pmu_sbi_stop_ctr;
+	pmu->map_event = pmu_sbi_map_event;
+	pmu->get_ctr_idx = pmu_sbi_get_ctr_idx;
+	pmu->get_ctr_width = pmu_sbi_get_ctr_width;
+	pmu->clear_ctr_idx = pmu_sbi_clear_ctr_idx;
+	pmu->read_ctr = pmu_sbi_read_ctr;
+}
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 3a02b496609d..e54ba2a998c2 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -54,6 +54,7 @@ struct riscv_pmu {
 #define to_riscv_pmu(p) (container_of(p, struct riscv_pmu, pmu))
 unsigned long riscv_pmu_read_ctr_csr(unsigned long csr);
 void riscv_pmu_legacy_init(struct riscv_pmu *pmu);
+void riscv_pmu_sbi_init(struct riscv_pmu *pmu);
 
 #endif /* CONFIG_RISCV_PMU */
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
