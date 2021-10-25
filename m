Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B504C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 19:54:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5C8B604DA
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 19:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E5C8B604DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=StMRPebgsYPonrLbmTRlVmtqY8g4XzvJS+nlbk0uJJg=; b=irFhMxPXsbU2xj
	9enXyG/XIHjYgEvVDwDp8Cdl4WAd/xcCxlqyj73dSWiR1XziD9ot95tZhu21iEh+x8IFTbAXxWT5A
	2J5TDjTNOUkGPh4R8uW6Vbo+qZGnoCpbyC6B49hLttMZvENh7D/uJ4/i04gxrKXM9PmFtddZAETuS
	ggxO9Z3u1/Ux5erCkQ7RTMW9Iv1GUEpEyVNaxormIEJr+Q5LRvMsSE+MRbeEdpbOXxmieDTh/tcz8
	q6cVMFvlqPFkMYWbb1g4I8K8FXtNpvcwgUscmaoyaHtOqkfOorPX/hFtrRkHdjaLONOOzBO/C2tIx
	Yavt/dMe3TYm80sagBOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf62o-00HVIB-Ns; Mon, 25 Oct 2021 19:54:06 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf62g-00HVBN-RJ
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 19:54:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635191638; x=1666727638;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EwPH8S2shtkXPtK91LcmbvBxHJQny+yb+LwDXIyqGOc=;
 b=bKVsdgCQMDNG1QDF0YKUv6f167IbRxMg/3meZXbRyAl0NDVwiAr6F/TO
 jDbBCtw7UarB5djcBbHYT9KJHo6nxtfeB5YQsfAbJw/8HPOTHeYpZOBm0
 27mLSLpS9bSP5eWn1T1IWtZVZawk5dfz7h5mSOMFRQuNJ+N8tYswXd9Si
 7WtkXJVSVCeq/PCGqx4aD4lXgjNU7EvA52Z9dppYCpcUYZoEOCC7HlxIH
 Pkz2+Bj6mEtfN8sTXmTyddcRlRtF8JySV04PyHOfCL/T6/FVB6inc9CkB
 Uv8IwgTdhT9Vgkxtdbr9vAizpn4T6e1/+Az5or+Dq4iQzDDVkiXG9yVrm g==;
X-IronPort-AV: E=Sophos;i="5.87,181,1631548800"; d="scan'208";a="287682866"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 03:53:56 +0800
IronPort-SDR: 1mSB9L2l1N+eeZoyyiWLiLMkf96jJEubV8v8DTTAz/GNRemtlG/Xo7bXyJop6MSVTsgh28I1iY
 tm5iUx8XTx5YAX7Da4/pS27WCqp4RAMJaUcym7iwG57WtFn1zDpL5TJ6IM92D719x30PRSUgCc
 PyTIHUF+6EIg0t0kANx+qjis08H58ECYEzcp2iD7rqiA/bCtl8sB5dFH7xcbqSkkqgQ90YiVzi
 luxFrA4VzLRQOuHHNKAgjerea5LqQlZJCfZkSPTaBCWpaTx6PyVfvbVGqaXIbuiTaFR0fPGE9f
 eY5nRdeJOMP0TyRokuIKicc5
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 12:29:27 -0700
IronPort-SDR: pbkaGy8cmdmYn6geMoIdcG1oPtyf8CvhCDS9M5wWCm08wRzdFcvbiTFq/v9T0zgW+FKFKgSJSm
 LCvUvVcHLRNWqc4H8/p0DKAiq7uQS0hARjjXpLC+RMDZRKnW5z8Qyybqxp4/myt3bsxN/51AZr
 hrHqe3sWrm983H5MKQh5081o+wiixdGtM3lGOTK2zG5/Ha/SEqnEKoWmmEDwVUbwGVpgnvNXOy
 zqd/kYJOGxWCqR0+lLTf+5kZdQd1KTTOncuamfRT8xyazQurdCqDK8VhKg2uMdX2GJ8fjnTvlD
 5zs=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.27])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Oct 2021 12:53:57 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 devicetree@vger.kernel.org, Greentime Hu <greentime.hu@sifive.com>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-riscv@lists.infradead.org, Nick Kossifidis <mick@ics.forth.gr>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Vincent Chen <vincent.chen@sifive.com>
Subject: [v4 04/11] RISC-V: Add a simple platform driver for RISC-V legacy perf
Date: Mon, 25 Oct 2021 12:53:43 -0700
Message-Id: <20211025195350.242914-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025195350.242914-1-atish.patra@wdc.com>
References: <20211025195350.242914-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_125359_008012_2E3244DC 
X-CRM114-Status: GOOD (  30.26  )
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
 drivers/perf/Kconfig            |   9 ++
 drivers/perf/Makefile           |   3 +
 drivers/perf/riscv_pmu_legacy.c | 143 ++++++++++++++++++++++++++++++++
 include/linux/perf/riscv_pmu.h  |   2 +
 4 files changed, 157 insertions(+)
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
diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
new file mode 100644
index 000000000000..8bb973f2d9f7
--- /dev/null
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -0,0 +1,143 @@
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
+#include <linux/mod_devicetable.h>
+#include <linux/perf/riscv_pmu.h>
+#include <linux/platform_device.h>
+
+#define RISCV_PMU_LEGACY_CYCLE		0
+#define RISCV_PMU_LEGACY_INSTRET	1
+#define RISCV_PMU_LEGACY_NUM_CTR	2
+
+bool pmu_init_done;
+
+static int pmu_legacy_ctr_get_idx(struct perf_event *event)
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
+static int pmu_legacy_event_map(struct perf_event *event, u64 *config)
+{
+	return pmu_legacy_ctr_get_idx(event);
+}
+
+static u64 pmu_legacy_read_ctr(struct perf_event *event)
+{
+	struct hw_perf_event *hwc = &event->hw;
+	int idx = hwc->idx;
+	u64 val;
+
+	if (idx == RISCV_PMU_LEGACY_CYCLE) {
+		val = riscv_pmu_ctr_read_csr(CSR_CYCLE);
+		if (IS_ENABLED(CONFIG_32BIT))
+			val = (u64)riscv_pmu_ctr_read_csr(CSR_CYCLEH) << 32 | val;
+	} else if (idx == RISCV_PMU_LEGACY_INSTRET) {
+		val = riscv_pmu_ctr_read_csr(CSR_INSTRET);
+		if (IS_ENABLED(CONFIG_32BIT))
+			val = ((u64)riscv_pmu_ctr_read_csr(CSR_INSTRETH)) << 32 | val;
+	} else
+		return 0;
+
+	return val;
+}
+
+static void pmu_legacy_ctr_start(struct perf_event *event, u64 ival)
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
+static void pmu_legacy_init(struct riscv_pmu *pmu)
+{
+	pr_info("Legacy PMU implementation is available\n");
+
+	pmu->num_counters = RISCV_PMU_LEGACY_NUM_CTR;
+	pmu->ctr_start = pmu_legacy_ctr_start;
+	pmu->ctr_stop = NULL;
+	pmu->event_map = pmu_legacy_event_map;
+	pmu->ctr_get_idx = pmu_legacy_ctr_get_idx;
+	pmu->ctr_get_width = NULL;
+	pmu->ctr_clear_idx = NULL;
+	pmu->ctr_read = pmu_legacy_read_ctr;
+
+	perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
+}
+
+static int pmu_legacy_device_probe(struct platform_device *pdev)
+{
+	struct riscv_pmu *pmu = NULL;
+
+	pmu = riscv_pmu_alloc();
+	if (!pmu)
+		return -ENOMEM;
+	pmu_legacy_init(pmu);
+
+	return 0;
+}
+
+static struct platform_driver pmu_legacy_driver = {
+	.probe		= pmu_legacy_device_probe,
+	.driver		= {
+		.name	= RISCV_PMU_LEGACY_PDEV_NAME,
+	},
+};
+
+static int __init riscv_pmu_legacy_devinit(void)
+{
+	int ret;
+	struct platform_device *pdev;
+
+	if (likely(pmu_init_done))
+		return 0;
+
+	ret = platform_driver_register(&pmu_legacy_driver);
+	if (ret)
+		return ret;
+
+	pdev = platform_device_register_simple(RISCV_PMU_LEGACY_PDEV_NAME, -1, NULL, 0);
+	if (IS_ERR(pdev)) {
+		platform_driver_unregister(&pmu_legacy_driver);
+		return PTR_ERR(pdev);
+	}
+
+	return ret;
+}
+late_initcall(riscv_pmu_legacy_devinit);
+
+void riscv_pmu_legacy_init(bool done)
+{
+	if (done)
+		pmu_init_done = true;
+}
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 564129839e19..f3bce79d8998 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -22,6 +22,7 @@
 #define RISCV_MAX_COUNTERS	64
 #define RISCV_OP_UNSUPP		(-EOPNOTSUPP)
 #define RISCV_PMU_PDEV_NAME	"riscv-pmu"
+#define RISCV_PMU_LEGACY_PDEV_NAME	"riscv-pmu-legacy"
 
 #define RISCV_PMU_STOP_FLAG_RESET 1
 
@@ -58,6 +59,7 @@ struct riscv_pmu {
 unsigned long riscv_pmu_ctr_read_csr(unsigned long csr);
 int riscv_pmu_event_set_period(struct perf_event *event, u64 *init_val);
 u64 riscv_pmu_event_update(struct perf_event *event);
+void riscv_pmu_legacy_init(bool init_done);
 struct riscv_pmu *riscv_pmu_alloc(void);
 
 #endif /* CONFIG_RISCV_PMU */
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
