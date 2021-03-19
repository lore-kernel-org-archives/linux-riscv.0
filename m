Return-Path: <SRS0=wr6O=IR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC7ACC433E1
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 23:01:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CE4E6197E
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 23:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CE4E6197E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=topj/H21NxJN5Vv0o7tJ5q9tjf0z/uLaSuCmXC3NfD8=; b=ZU2bwtOk5YGNYWMUUSBLFgZ1h
	nINeAJG8Epn2rhazJbLWwPYeeA8a+6Sa9QUimYNpiZ4V1w+i9Pvr2vkSx8hOHF2le3ObZaKDSiKVv
	I0ioiRnjqL3PAOvkljvAlKlPQJLbWWUPHbxM1wkyR0DUUA6wSN4crfHXSfFxcXrnZ6EJu2LP8luz6
	Vj3vNu2vSVwKe7gcPi6baU06AkeI3mR+Zf/AY9qoYbKXF30QlMCpito4St35lZayuX/JRwOdBBfc1
	+Z20RyrqB+pNCGu7BTsKmVQQmpooG98tlStfisbTQidkiUi2iCFLQEpeCBPfXIbf5NHrBubcwqECa
	x333xODtw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNO7j-008IWl-M3; Fri, 19 Mar 2021 23:01:43 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNO7b-008ISn-Fx
 for linux-riscv@lists.infradead.org; Fri, 19 Mar 2021 23:01:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616194896; x=1647730896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WW4T5PmZJixjpQ7oYDcltpuHYHRByrMvxUXAAJYxp60=;
 b=PeAAARQD2ghYf3p5FuZpkFrHqEFGi9kDvxR6qJAM0jX1m16iA2wHoS6B
 4Io47s85k2VlIofAFutDj0CDyo+JBbtdZ3pJRwkziqf0HdNQTO8HShzV5
 rDN42vnGd1W8mTuenwrmnZCi1FqH0bH6AhobfxH9esYO+wh+B1PLO/g4s
 DEfylsmnrcDb1ENNRDexr/K+9gvjdI6H6TA1xpcd3xvVkL5uBuz+Zj7Os
 sw1W3fkERmWY7PaXanNJNPqPOkLJOFXrErDrLbqXUroMctZyM0xzLlhqR
 D5JXOhvzA8x5iFt83MNXlX5cKjcLunqS1RIx1MYyooFRltTOO7nFauKh/ g==;
IronPort-SDR: fng8AgOO3rZc+d6CEJC5fnLt1zhLw86r1rFuSrRCXEX2C473EgyhhAsndQEKV7A5KbsbH7j/um
 R/OBRvWK0wK8cI6HmLss7DcO0ZAyBlS0uq03KZKkgX4GtCsOSt5OtPsaotk/gjtZE43VG5pbOj
 eXY5DiTu5EpmSofVvef0j3zc7MUrvSg7i6Uty0KFE/tih6HR7Fjs9fdxQ9srkF2u9t/LTgqwC7
 7vzD6dIeZ/noh5/QLe2izsLq7SjzUjjpS1soffSeHMOGQI0zAruraVl7S4/Drm3xarKmuch235
 HRA=
X-IronPort-AV: E=Sophos;i="5.81,263,1610380800"; d="scan'208";a="163715808"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2021 07:01:32 +0800
IronPort-SDR: DUMWuPxvXr+mkD4aquJsfWrofpk6/bX/tiQcvGAFQkiyBG7m2UQyQ3WsdfMEvRB+yBS+pwjVQK
 +Hi2aM6KtCGtSWLHwRJ7ob2N81ZKGDCBCeA1caDeCCnQaoezq/Hm7ClVjJvfQOjXu3ykiPw6AW
 8T9Pi+tTrfz8Dk7wxbe9/wI4aJHQXbJvFymBx+RjaQ6UXrKnpIUVdiBpj3NaiXc7zMtXanGNG6
 SbLSesOF7YdIcyg8JxERSSiDJ0RptsFvLZnBHiONdo/fvsYnfNVwTdxvbiHAj3xJ7fv4k7gmMZ
 jmqFC/Qx0bFoHW32fYpIEcJN
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 15:42:03 -0700
IronPort-SDR: Wzxg6dTWvlXDVFwHBFpFv7KYEUgDtJqCfCVCmnILYTkcJiQm/9Vf1LeMF+hJ3DjjQ8CHLwppie
 jnEEa1dDvXCdV/vX1/30mS9/uIvplw0MOKM4R+APESG4tqRg0o/hQNpHYZAAd2Sd2NI2dR3A/w
 87bF/JfGwekVw1IKBgj1dAXpT/9e2cwXtcD2AQIlZle8PAzmcIA+5BUSyI5OE2Tu8yINOh8NNC
 HHkoJ4a2gl9vGtxCC30B8yhPTBQ62DCuNUxa4Q43P8NbmQPYQ5SYcZnoP1vMwwVpWUUV3soh31
 ycY=
WDCIronportException: Internal
Received: from ind002560.ad.shared (HELO jedi-01.hgst.com) ([10.86.48.105])
 by uls-op-cesaip02.wdc.com with ESMTP; 19 Mar 2021 16:01:32 -0700
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
Subject: [RFC 4/6] RISC-V: Add a simple platform driver for RISC-V legacy perf
Date: Fri, 19 Mar 2021 16:01:04 -0700
Message-Id: <20210319230106.2186694-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319230106.2186694-1-atish.patra@wdc.com>
References: <20210319230106.2186694-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_230136_205556_160E6308 
X-CRM114-Status: GOOD (  29.10  )
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

The old RISC-V perf implementation allowed counting of only
cycle/instruction counters using perf. Restore that feature by implementing
a simple platform driver under a separate config to provide backward
compatibility. Any existing software stack will continue to work as it is.
However, it provides an easy way out in future where we can remove the
legacy driver.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 drivers/perf/Kconfig            |  9 ++++
 drivers/perf/Makefile           |  3 ++
 drivers/perf/riscv_pmu.c        |  2 +
 drivers/perf/riscv_pmu_legacy.c | 88 +++++++++++++++++++++++++++++++++
 include/linux/perf/riscv_pmu.h  |  1 +
 5 files changed, 103 insertions(+)
 create mode 100644 drivers/perf/riscv_pmu_legacy.c

diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
index fc42ab613ea0..1546a487d970 100644
--- a/drivers/perf/Kconfig
+++ b/drivers/perf/Kconfig
@@ -64,6 +64,15 @@ config RISCV_PMU
 	  Say y if you want to use CPU performance monitors on RISCV-based
 	  systems.
 
+config RISCV_PMU_LEGACY
+	depends on RISCV_PMU
+	bool "RISC-V legacy PMU implementation"
+	default y
+	help
+	  Say y if you want to use the legacy CPU performance monitor
+	  implementation on RISC-V based systems. This only allows counting
+	  of cycle/instruction counter and will be removed in future.
+
 config ARM_PMU_ACPI
 	depends on ARM_PMU && ACPI
 	def_bool y
diff --git a/drivers/perf/Makefile b/drivers/perf/Makefile
index 76e5c50e24bb..e8aa666a9d28 100644
--- a/drivers/perf/Makefile
+++ b/drivers/perf/Makefile
@@ -11,6 +11,9 @@ obj-$(CONFIG_HISI_PMU) += hisilicon/
 obj-$(CONFIG_QCOM_L2_PMU)	+= qcom_l2_pmu.o
 obj-$(CONFIG_QCOM_L3_PMU) += qcom_l3_pmu.o
 obj-$(CONFIG_RISCV_PMU) += riscv_pmu.o
+ifeq ($(CONFIG_RISCV_PMU), y)
+obj-$(CONFIG_RISCV_PMU_LEGACY) += riscv_pmu_legacy.o
+endif
 obj-$(CONFIG_THUNDERX2_PMU) += thunderx2_pmu.o
 obj-$(CONFIG_XGENE_PMU) += xgene_pmu.o
 obj-$(CONFIG_ARM_SPE_PMU) += arm_spe_pmu.o
diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
index ce9d35069ac0..838dca2ffca8 100644
--- a/drivers/perf/riscv_pmu.c
+++ b/drivers/perf/riscv_pmu.c
@@ -350,6 +350,8 @@ static int riscv_pmu_device_probe(struct platform_device *pdev)
 	if (!pmu)
 		return -ENOMEM;
 
+	riscv_pmu_legacy_init(pmu);
+
 	cpuhp_setup_state(CPUHP_AP_PERF_RISCV_STARTING,
 			  "perf/riscv/pmu:starting",
 			  riscv_perf_starting_cpu, riscv_perf_dying_cpu);
diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
new file mode 100644
index 000000000000..d75353824f4a
--- /dev/null
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RISC-V performance counter support.
+ *
+ * Copyright (C) 2021 Western Digital Corporation or its affiliates.
+ *
+ * This implementation is based on old RISC-V perf and ARM perf event code
+ * which are in turn based on sparc64 and x86 code.
+ */
+
+#include <linux/perf/riscv_pmu.h>
+
+#define RISCV_PMU_LEGACY_CYCLE		0
+#define RISCV_PMU_LEGACY_INSTRET	1
+#define RISCV_PMU_LEGACY_NUM_CTR	2
+
+static int pmu_legacy_get_ctr_idx(struct perf_event *event)
+{
+	struct perf_event_attr *attr = &event->attr;
+
+	if (event->attr.type != PERF_TYPE_HARDWARE)
+		return -EOPNOTSUPP;
+	if (attr->config == PERF_COUNT_HW_CPU_CYCLES)
+		return RISCV_PMU_LEGACY_CYCLE;
+	else if (attr->config == PERF_COUNT_HW_INSTRUCTIONS)
+		return RISCV_PMU_LEGACY_INSTRET;
+	else
+		return -EOPNOTSUPP;
+}
+
+/* For legacy config & counter index are same */
+static int pmu_legacy_map_event(struct perf_event *event, u64 *config)
+{
+	return pmu_legacy_get_ctr_idx(event);
+}
+
+static u64 pmu_legacy_read_ctr(struct perf_event *event)
+{
+	struct hw_perf_event *hwc = &event->hw;
+	int idx = hwc->idx;
+	u64 val;
+
+	if (idx == RISCV_PMU_LEGACY_CYCLE) {
+		val = riscv_pmu_read_ctr_csr(CSR_CYCLE);
+		if (IS_ENABLED(CONFIG_32BIT))
+			val = (u64)riscv_pmu_read_ctr_csr(CSR_CYCLEH) << 32 | val;
+	} else if (idx == RISCV_PMU_LEGACY_INSTRET) {
+		val = riscv_pmu_read_ctr_csr(CSR_INSTRET);
+		if (IS_ENABLED(CONFIG_32BIT))
+			val = ((u64)riscv_pmu_read_ctr_csr(CSR_INSTRETH)) << 32 | val;
+	} else
+		return 0;
+
+	return val;
+}
+
+static void pmu_legacy_start_ctr(struct perf_event *event, u64 ival)
+{
+	struct hw_perf_event *hwc = &event->hw;
+	u64 initial_val = pmu_legacy_read_ctr(event);
+
+	/**
+	 * The legacy method doesn't really have a start/stop method.
+	 * It also can not update the counter with a initial value.
+	 * But we still need to set the prev_count so that read() can compute
+	 * the delta. Just use the current counter value to set the prev_count.
+	 */
+	local64_set(&hwc->prev_count, initial_val);
+}
+
+/**
+ * This is just a simple implementation to allow legacy implementations
+ * compatible with new RISC-V PMU driver framework.
+ * This driver only allows reading two counters i.e CYCLE & INSTRET.
+ * However, it can not start or stop the counter. Thus, it is not very useful
+ * will be removed in future.
+ */
+void riscv_pmu_legacy_init(struct riscv_pmu *pmu)
+{
+	pmu->num_counters = RISCV_PMU_LEGACY_NUM_CTR;
+	pmu->start_ctr = pmu_legacy_start_ctr;
+	pmu->stop_ctr = NULL;
+	pmu->map_event = pmu_legacy_map_event;
+	pmu->get_ctr_idx = pmu_legacy_get_ctr_idx;
+	pmu->get_ctr_width = NULL;
+	pmu->clear_ctr_idx = NULL;
+	pmu->read_ctr = pmu_legacy_read_ctr;
+}
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index be7d63d075ff..3a02b496609d 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -53,6 +53,7 @@ struct riscv_pmu {
 
 #define to_riscv_pmu(p) (container_of(p, struct riscv_pmu, pmu))
 unsigned long riscv_pmu_read_ctr_csr(unsigned long csr);
+void riscv_pmu_legacy_init(struct riscv_pmu *pmu);
 
 #endif /* CONFIG_RISCV_PMU */
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
