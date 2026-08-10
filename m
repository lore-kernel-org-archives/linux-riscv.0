Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4494BC5AD7B
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 15:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TDxB9J/dz3EggldQSg9ERt7dR6Wc0hG7GdbF6K7elp4=; b=ZyZPjgnS0JgeoB
	TauqvZRU63Q3lf1r5iqI26ilgpgeeYoq/W75FE8h4DmXd128iYg5RFrJESpJMdgbSf/PACjiPM64Y
	0GciuoIL/8lgygI67yYyI3Ph/YY+R7JdlhmrAIQSBFsmZbaQkPMYfy6MVJcNvaOZwwcDqFmCpmT0a
	K58CG//IQoOXhiFVq51a7xc9y3Bg1N3Vfmq5wuvUM2Ohdm4ttdvIegp8bvZQAjlJPs6+8YfiL5w5B
	yui0FfDkC5yzQRkXK7PTGhIvTmDBrTtQaprwkKw1JOdKcxCGFctHnbxSyWA+e+Uy5GFOUFJ4cOVZn
	8B4okQJZmubC0MIzLbsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRqc-0000000CEMb-1Zk0;
	Mon, 10 Aug 2026 15:23:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRqZ-0000000CEKH-13lH
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 15:23:29 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACjoPD398981
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 15:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bTTnPEh7D4i
	h9EvnotZPDDWz9xg7ucFp62s5u7zxdfs=; b=I3EUiGVTjoZlzdilQFcBjiC1s98
	+c9VOYO+ROVucg3kmVai8bhdI4qxUXN/roEKO+TMlaOWHv8UVm6qnTq3VElXpXPE
	XVmdVuLcvZc2+MqEHshGiyFtYasVs4oOnaBZLe3oUSfUCIbNbI6FXO3ofOyKfm+6
	CP+7t5JDGFhUJuXlDMmYv8Q62WCJp+Uc2cZMmiGk4iIU6W0sLBoGxSYeJ+7kfqC+
	Sd0TsBBBoxAaGc3gobx5GMSIz/XvzJGDETCZyiuO4y6SAdvbocZL5LEO80OR+awD
	oABJOd9PxxcTLHdqoaju4yD+Y/0bGdobynvX7j3+JfVCXJS5DNEy9sz7irg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fycgesbec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 15:23:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8486c3411c8so2911496b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 08:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786375405; x=1786980205; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bTTnPEh7D4ih9EvnotZPDDWz9xg7ucFp62s5u7zxdfs=;
        b=UtrtlW2+oUwHGDzS0IkV/Jcpgh15934D5Bt0nO/KCbTAX4CzIeJr2ZuwFcYq5bxWWQ
         M3ZpUpiyrYKqYnTrpULWKbCY+rqKQDNeMm3mnoaau69FU+PHNbJI3QzlcCeM8aDX+A2w
         r2LGDD+4DSidIaE2TvNWZCgXVki/Y08gfYOVbgEuFJUy4FkjDjJdXm/ptzofii2glpnL
         5s1P8OgZylsifsejaqKU2d/5HbmowL3/VYPKa/HgAl1VgP//RJMyM63Zawnb8dVVdmxT
         ay9oWdy2Rodqt+Z+pLmhjhFverK8w3MkZWsYQhtVzXrRqi2GGNkQf5CKEnvLl29L48rX
         WZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375405; x=1786980205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bTTnPEh7D4ih9EvnotZPDDWz9xg7ucFp62s5u7zxdfs=;
        b=Qee/nFo5XeBs0wMtzpsH2/JjgRBvg2mRjrXvC4lZbZRjvPhX5q5bxzdBShd3PborxG
         bCTvWCg97EAxO2O/4dQghx1/3MNYv7bEdAK0fYM3ck1cO0/Y+VMe4rOV5tjtVAeW1Pjt
         yg/lMvLRAXznXBb94WQgwhQnT/Ph0VLqwV+O/Ku9A/4YdqoY9f0p5N6QXKX1NuVuATOy
         r2PothkRVKNeAGsg0lobASN7TINwedTqsS5xs6ph1htRgRvQP0D0u72WaBfFak3h4cH0
         sl+dwAqeBJFKTdMQAJhgyJUX0sjfcAKUHflgHBhqTgqBBkOpoBWMByrekc5AseYGzM+q
         Otvw==
X-Forwarded-Encrypted: i=1; AHgh+Rr/6AGF7ggWAYKNLk14zZ2ybT1X7zw3Bo/SmV5dETWlZyzSbH2JRb3+jtWWWT3jqMG2ruV3htFGD0TGow==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh96FnwQEpoEt+ULWDnx9EWJxKeUxMeTrrmSGNb1UGz6H5QwAp
	971hb336VGV5O2z2MEH3eoEO/vi0NnsO634xIYHaSzCg6u/JBXlDipjRqixVOe6e+qJ7quVTfev
	yhMat4FTQ6sxb8M6R94sBPjYUC7zay/Ytc5dZO9wmFIkV07tfQirpnmbKn5ZN/kbmKxd1qIo=
X-Gm-Gg: AR+sD12C3fJt87ROuY7beotViLOh6ZKsYD1ap5m6i9QI/DGMT5Qq/K6MbKRI436A8Q0
	ZHzp0as1zHJ+jxgs//0/gdJl2gNldSDaZfbZT3Oojk7KF6FOoMckhzTyGJp9C88SVEuqGyHRPsp
	cqN0QcbqjH6XQivERTLRgxcD/O661E7ZRvMmlljrMKRz6fbaXX2TEcdq2NDJwxIVlBxkKxLg9uH
	FIVUORvR8GNKEzxS23Hasx5K18SbkjwjwefPfcU0KAFjE/B9NpyMODtluzeQHKhKVowHIEgWAOV
	Ic2L/HfYKmCGuUst/nsHxo15K0geBgUkfN8vKGPY3ga92e+UqUUic0iVNzq9lrJzpTMf7xkU3G6
	n9jXrxSNgw7ZJwp5cwkWeKeHr2SrMGvwLJE5KXpkPe57e56ayzJvSqhbz93RhcX6yLd/Rqk6f3i
	pRH3lX9dg7HmUOCeyR8owwt+OODQ==
X-Received: by 2002:a05:6a00:4c1a:b0:848:2b8f:c9d7 with SMTP id d2e1a72fcca58-84f9c965a9dmr2684681b3a.18.1786375404664;
        Mon, 10 Aug 2026 08:23:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c1a:b0:848:2b8f:c9d7 with SMTP id d2e1a72fcca58-84f9c965a9dmr2684605b3a.18.1786375403955;
        Mon, 10 Aug 2026 08:23:23 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm4282634a12.11.2026.08.10.08.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:23:23 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [PATCH v5 02/14] hwtracing: gtrace: Initial implementation of gtrace framework
Date: Mon, 10 Aug 2026 20:52:04 +0530
Message-ID: <20260810152223.3946743-3-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: SwhlKtK8F544ukySVrQq5im9DmqhX6OP
X-Authority-Analysis: v=2.4 cv=R4cz39RX c=1 sm=1 tr=0 ts=6a79ecee cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=gM5wKXem3R3DcKQ8I4kA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: SwhlKtK8F544ukySVrQq5im9DmqhX6OP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX8FdzKElPYfsT
 PeLPKJzDFbE6aKPKvVp38FGZRknA46fV5iv93Yzzr/inrt9iB2KYUbFHFtOLgVyVEv22M6sY3OH
 yl2Q/sM0axegjqUYSOwLal0rJSdkYY4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX8hHhQOCWXfZS
 N+udlAmJ2rCDzACPQW6peZINY/YOeDMFZLePf9w+8vyHeMZvsf6/KhINbXxm74eDMBAxdM3DW15
 EgZztlXodXe5AKUDLLZJHmj6VxLpKlv1VWmWl4Au7OA3jJMUJe/9l3/nPvHvWsAlozRJqw2XcwG
 lGDIts+8JCbFwLschUnfJ7/NoF80xDdUAXn+eY8O8SYBR1K7l+m6MqLarKbgxGtjKXSFsVlJpPz
 1RxAdLvXBzduHZUkRpLWBL3cSsAxpz6pz1DSklmv0RtajmSh/ylT8kA7/DPVLs6Dbfhm1P2v6Ty
 7b3gctquBPiTeBKLcGarufCAEQ6HFceSY42mXYgedn8+bxfYNFUOdmB40hR7LQ2DwQlnIgTQhQb
 TwySqXtCM59bHWogajYlOHwMqL1AJf6jVGWcStT4cBQffkxxm6n6XAU3AlLZVJXGOGsx0g6yiNk
 W2QRuAvplptuv8H/KuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_082327_492871_E5C5DB67 
X-CRM114-Status: GOOD (  27.24  )
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

From: Anup Patel <anup.patel@oss.qualcomm.com>

Implement a generic and architecture neutral trace framework (gtrace)
in which trace components are organized in a graph-like topology. The
framework provides a bus for the trace components along with helpers to
register components, build the topology and access the hardware registers.

Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 drivers/Makefile                       |   1 +
 drivers/hwtracing/Kconfig              |   2 +
 drivers/hwtracing/gtrace/Kconfig       |  15 +
 drivers/hwtracing/gtrace/Makefile      |   4 +
 drivers/hwtracing/gtrace/gtrace-core.c | 442 +++++++++++++++++++++++++
 include/linux/gtrace.h                 | 266 +++++++++++++++
 6 files changed, 730 insertions(+)
 create mode 100644 drivers/hwtracing/gtrace/Kconfig
 create mode 100644 drivers/hwtracing/gtrace/Makefile
 create mode 100644 drivers/hwtracing/gtrace/gtrace-core.c
 create mode 100644 include/linux/gtrace.h

diff --git a/drivers/Makefile b/drivers/Makefile
index 0841ea851847..e018cc915f62 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -178,6 +178,7 @@ obj-$(CONFIG_CORESIGHT)		+= hwtracing/coresight/
 obj-y				+= hwtracing/intel_th/
 obj-$(CONFIG_STM)		+= hwtracing/stm/
 obj-$(CONFIG_HISI_PTT)		+= hwtracing/ptt/
+obj-$(CONFIG_GTRACE)		+= hwtracing/gtrace/
 obj-y				+= android/
 obj-$(CONFIG_NVMEM)		+= nvmem/
 obj-$(CONFIG_FPGA)		+= fpga/
diff --git a/drivers/hwtracing/Kconfig b/drivers/hwtracing/Kconfig
index 911ee977103c..ef53f5c8429f 100644
--- a/drivers/hwtracing/Kconfig
+++ b/drivers/hwtracing/Kconfig
@@ -7,4 +7,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
 
 source "drivers/hwtracing/ptt/Kconfig"
 
+source "drivers/hwtracing/gtrace/Kconfig"
+
 endmenu
diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
new file mode 100644
index 000000000000..bcc3b4169a76
--- /dev/null
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+menuconfig GTRACE
+	tristate "Generic Hardware Trace Support"
+	depends on OF
+	help
+	  This framework provides an architecture-neutral kernel interface
+	  for hardware trace drivers. It builds a topological view of the
+	  trace components and configures the correct series of components
+	  when trace is enabled. It is intended to be shared across RISC-V
+	  and ARM trace components so that a single trace path may span
+	  components of different architectures.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called gtrace.
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
new file mode 100644
index 000000000000..3f90fb99c514
--- /dev/null
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_GTRACE) += gtrace.o
+gtrace-y := gtrace-core.o
diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
new file mode 100644
index 000000000000..97398f2b7cbb
--- /dev/null
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -0,0 +1,442 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ *
+ */
+
+#include <linux/cpumask.h>
+#include <linux/delay.h>
+#include <linux/export.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/percpu.h>
+#include <linux/xarray.h>
+#include <linux/gtrace.h>
+
+/* Mutex to serialize component registration/unregistration */
+static DEFINE_MUTEX(gtrace_mutex);
+
+/* Per-CPU source instances */
+static DEFINE_PER_CPU(struct gtrace_component *, gtrace_cpu_source_comp);
+
+/* Component type based id generator */
+struct gtrace_type_idx {
+	/* Lock to protect the type ID generator */
+	struct mutex lock;
+	struct xarray xa;
+};
+
+/* Array of component type based id generator */
+static struct gtrace_type_idx gtrace_type_idx_array[GTRACE_COMPONENT_TYPE_MAX];
+
+static int gtrace_alloc_type_idx(struct gtrace_component *comp)
+{
+	struct gtrace_type_idx *gidx;
+	u32 idx;
+	int ret;
+
+	if (comp->id.type >= GTRACE_COMPONENT_TYPE_MAX)
+		return -EINVAL;
+
+	gidx = &gtrace_type_idx_array[comp->id.type];
+	mutex_lock(&gidx->lock);
+	ret = xa_alloc(&gidx->xa, &idx, comp, xa_limit_32b, GFP_KERNEL);
+	mutex_unlock(&gidx->lock);
+	if (ret)
+		return ret;
+
+	comp->type_idx = idx;
+	return 0;
+}
+
+static void gtrace_free_type_idx(struct gtrace_component *comp)
+{
+	struct gtrace_type_idx *gidx;
+
+	if (comp->id.type >= GTRACE_COMPONENT_TYPE_MAX)
+		return;
+
+	gidx = &gtrace_type_idx_array[comp->id.type];
+	mutex_lock(&gidx->lock);
+	xa_erase(&gidx->xa, comp->type_idx);
+	mutex_unlock(&gidx->lock);
+}
+
+static void __init gtrace_init_type_idx(void)
+{
+	struct gtrace_type_idx *gidx;
+	int i;
+
+	for (i = 0; i < GTRACE_COMPONENT_TYPE_MAX; i++) {
+		gidx = &gtrace_type_idx_array[i];
+		mutex_init(&gidx->lock);
+		xa_init_flags(&gidx->xa, XA_FLAGS_ALLOC);
+	}
+}
+
+const struct gtrace_component_id *gtrace_match_id(struct gtrace_component *comp,
+						  const struct gtrace_component_id *ids)
+{
+	const struct gtrace_component_id *id;
+
+	for (id = ids; id->version; id++) {
+		if (comp->id.type != id->type)
+			continue;
+
+		return id;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(gtrace_match_id);
+
+static int gtrace_match_device(struct device *dev, const struct device_driver *drv)
+{
+	const struct gtrace_driver *gtdrv = to_gtrace_driver(drv);
+	struct gtrace_component *comp = to_gtrace_component(dev);
+
+	return gtrace_match_id(comp, gtdrv->id_table) ? 1 : 0;
+}
+
+static int gtrace_probe(struct device *dev)
+{
+	const struct gtrace_driver *gtdrv = to_gtrace_driver(dev->driver);
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	int ret = 0;
+
+	if (gtdrv->probe)
+		ret = gtdrv->probe(comp);
+
+	if (!ret)
+		comp->ready = true;
+
+	return ret;
+}
+
+static void gtrace_remove(struct device *dev)
+{
+	const struct gtrace_driver *gtdrv = to_gtrace_driver(dev->driver);
+	struct gtrace_component *comp = to_gtrace_component(dev);
+
+	comp->ready = false;
+	if (gtdrv->remove)
+		gtdrv->remove(comp);
+}
+
+static const struct bus_type gtrace_bustype = {
+	.name	= "gtrace",
+	.match	= gtrace_match_device,
+	.probe	= gtrace_probe,
+	.remove	= gtrace_remove,
+};
+
+struct gtrace_fwnode_match_data {
+	struct fwnode_handle *fwnode;
+	struct gtrace_component *match;
+};
+
+static int gtrace_match_fwnode(struct device *dev, void *data)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct gtrace_fwnode_match_data *d = data;
+
+	if (device_match_fwnode(&comp->dev, d->fwnode)) {
+		d->match = comp;
+		return 1;
+	}
+
+	return 0;
+}
+
+struct gtrace_component *gtrace_find_by_fwnode(struct fwnode_handle *fwnode)
+{
+	struct gtrace_fwnode_match_data d = { .fwnode = fwnode, .match = NULL };
+	int ret;
+
+	ret = bus_for_each_dev(&gtrace_bustype, NULL, &d, gtrace_match_fwnode);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	return d.match;
+}
+EXPORT_SYMBOL_GPL(gtrace_find_by_fwnode);
+
+int gtrace_poll_bit(struct gtrace_platform_data *pdata, int offset,
+		    int bit, int bitval, int timeout)
+{
+	u32 val;
+
+	while (timeout--) {
+		val = gtrace_read32(pdata, offset);
+		if (((val >> bit) & 0x1) == bitval)
+			break;
+		udelay(1);
+	}
+
+	return (timeout < 0) ? -ETIMEDOUT : 0;
+}
+EXPORT_SYMBOL_GPL(gtrace_poll_bit);
+
+int gtrace_enable_component(struct gtrace_component *comp)
+{
+	const struct gtrace_hw_ops *ops = comp->pdata->hw_ops;
+
+	if (!ops || !ops->enable)
+		return -EOPNOTSUPP;
+
+	return ops->enable(comp->pdata);
+}
+EXPORT_SYMBOL_GPL(gtrace_enable_component);
+
+int gtrace_disable_component(struct gtrace_component *comp)
+{
+	const struct gtrace_hw_ops *ops = comp->pdata->hw_ops;
+
+	if (!ops || !ops->disable)
+		return -EOPNOTSUPP;
+
+	return ops->disable(comp->pdata);
+}
+EXPORT_SYMBOL_GPL(gtrace_disable_component);
+
+int gtrace_reset_component(struct gtrace_component *comp)
+{
+	const struct gtrace_hw_ops *ops = comp->pdata->hw_ops;
+
+	if (!ops || !ops->reset)
+		return -EOPNOTSUPP;
+
+	return ops->reset(comp->pdata);
+}
+EXPORT_SYMBOL_GPL(gtrace_reset_component);
+
+struct gtrace_component *gtrace_cpu_source(unsigned int cpu)
+{
+	if (!cpu_present(cpu))
+		return NULL;
+
+	return per_cpu(gtrace_cpu_source_comp, cpu);
+}
+EXPORT_SYMBOL_GPL(gtrace_cpu_source);
+
+static int gtrace_cleanup_inconn(struct device *dev, void *data)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct gtrace_connection *conn = data;
+	int i;
+
+	if (device_match_fwnode(&comp->dev, conn->dest_fwnode)) {
+		for (i = 0; i < pdata->nr_inconns; i++) {
+			if (pdata->inconns[i] != conn)
+				continue;
+			pdata->inconns[i] = NULL;
+			return 1;
+		}
+	}
+
+	return 0;
+}
+
+static void gtrace_cleanup_inconns_from_outconns(struct gtrace_component *comp)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct gtrace_connection *conn;
+	int i;
+
+	lockdep_assert_held(&gtrace_mutex);
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		bus_for_each_dev(&gtrace_bustype, NULL, conn, gtrace_cleanup_inconn);
+	}
+}
+
+static int gtrace_setup_inconn(struct device *dev, void *data)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct gtrace_connection *conn = data;
+	int i;
+
+	if (device_match_fwnode(&comp->dev, conn->dest_fwnode)) {
+		for (i = 0; i < pdata->nr_inconns; i++) {
+			if (pdata->inconns[i])
+				continue;
+			pdata->inconns[i] = conn;
+			return 1;
+		}
+	}
+
+	return 0;
+}
+
+static int gtrace_setup_inconns_from_outconns(struct gtrace_component *comp)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct gtrace_connection *conn;
+	int i, ret;
+
+	lockdep_assert_held(&gtrace_mutex);
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		ret = bus_for_each_dev(&gtrace_bustype, NULL, conn, gtrace_setup_inconn);
+		if (ret < 0) {
+			gtrace_cleanup_inconns_from_outconns(comp);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void gtrace_component_release(struct device *dev)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+
+	fwnode_handle_put(comp->dev.fwnode);
+	gtrace_free_type_idx(comp);
+	kfree(comp);
+}
+
+struct gtrace_component *gtrace_register_component(struct gtrace_component_id *id,
+						   const char *name,
+						   struct gtrace_platform_data *pdata)
+{
+	struct gtrace_connection *conn;
+	struct gtrace_component *comp;
+	int i, ret = 0;
+
+	if (!id || id->type >= GTRACE_COMPONENT_TYPE_MAX) {
+		ret = -EINVAL;
+		goto err_out;
+	}
+
+	if (!pdata || !pdata->dev) {
+		ret = -EINVAL;
+		goto err_out;
+	}
+
+	for (i = 0; i < pdata->nr_inconns; i++) {
+		if (pdata->inconns[i]) {
+			ret = -EINVAL;
+			goto err_out;
+		}
+	}
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		if (!conn || conn->src_port < 0 || conn->src_comp ||
+		    !device_match_fwnode(pdata->dev, conn->src_fwnode) ||
+		    conn->dest_port < 0 || !conn->dest_fwnode || !conn->dest_comp) {
+			ret = -EINVAL;
+			goto err_out;
+		}
+	}
+
+	if (pdata->bound_cpu >= 0 && !cpu_present(pdata->bound_cpu)) {
+		ret = -EINVAL;
+		goto err_out;
+	}
+
+	comp = kzalloc(sizeof(*comp), GFP_KERNEL);
+	if (!comp) {
+		ret = -ENOMEM;
+		goto err_out;
+	}
+	comp->pdata = pdata;
+	comp->id = *id;
+	ret = gtrace_alloc_type_idx(comp);
+	if (ret) {
+		kfree(comp);
+		goto err_out;
+	}
+
+	comp->dev.parent = pdata->dev;
+	comp->dev.coherent_dma_mask = pdata->dev->coherent_dma_mask;
+	comp->dev.release = gtrace_component_release;
+	comp->dev.bus = &gtrace_bustype;
+	comp->dev.fwnode = fwnode_handle_get(dev_fwnode(pdata->dev));
+	dev_set_name(&comp->dev, "%s-%u", name ? name : "comp", comp->type_idx);
+
+	mutex_lock(&gtrace_mutex);
+
+	ret = device_register(&comp->dev);
+	if (ret) {
+		put_device(&comp->dev);
+		goto err_out_unlock;
+	}
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		conn->src_comp = comp;
+	}
+
+	ret = gtrace_setup_inconns_from_outconns(comp);
+	if (ret < 0) {
+		device_unregister(&comp->dev);
+		goto err_out_unlock;
+	}
+
+	if (comp->pdata->bound_cpu >= 0) {
+		gtrace_get_component(comp);
+		per_cpu(gtrace_cpu_source_comp, comp->pdata->bound_cpu) = comp;
+	}
+
+	mutex_unlock(&gtrace_mutex);
+
+	return comp;
+
+err_out_unlock:
+	mutex_unlock(&gtrace_mutex);
+err_out:
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(gtrace_register_component);
+
+void gtrace_unregister_component(struct gtrace_component *comp)
+{
+	struct gtrace_component *c;
+
+	mutex_lock(&gtrace_mutex);
+
+	if (comp->pdata->bound_cpu >= 0) {
+		c = per_cpu(gtrace_cpu_source_comp, comp->pdata->bound_cpu);
+		per_cpu(gtrace_cpu_source_comp, comp->pdata->bound_cpu) = NULL;
+		gtrace_put_component(c);
+	}
+
+	gtrace_cleanup_inconns_from_outconns(comp);
+	device_unregister(&comp->dev);
+
+	mutex_unlock(&gtrace_mutex);
+}
+EXPORT_SYMBOL_GPL(gtrace_unregister_component);
+
+int __gtrace_register_driver(struct module *owner, struct gtrace_driver *gtdrv)
+{
+	gtdrv->driver.owner = owner;
+	gtdrv->driver.bus = &gtrace_bustype;
+
+	return driver_register(&gtdrv->driver);
+}
+EXPORT_SYMBOL_GPL(__gtrace_register_driver);
+
+static int __init gtrace_init(void)
+{
+	gtrace_init_type_idx();
+
+	return bus_register(&gtrace_bustype);
+}
+
+static void __exit gtrace_exit(void)
+{
+	bus_unregister(&gtrace_bustype);
+}
+
+subsys_initcall(gtrace_init);
+module_exit(gtrace_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Generic hardware trace (gtrace) framework core");
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
new file mode 100644
index 000000000000..e8ca2bd46e67
--- /dev/null
+++ b/include/linux/gtrace.h
@@ -0,0 +1,266 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#ifndef __LINUX_GTRACE_H__
+#define __LINUX_GTRACE_H__
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/limits.h>
+#include <linux/list.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/types.h>
+
+/*
+ * Global list of trace component types across all architectures. Each backend
+ * uses the entries relevant to it.
+ */
+enum gtrace_component_type {
+	GTRACE_RVTRACE_ENCODER,
+	GTRACE_RVTRACE_FUNNEL,
+	GTRACE_RVTRACE_RAMSINK,
+	GTRACE_RVTRACE_PIBSINK,
+	GTRACE_RVTRACE_ATBBRIDGE,
+	GTRACE_COMPONENT_TYPE_MAX
+};
+
+/* Supported usage modes for trace components */
+enum gtrace_component_mode {
+	GTRACE_COMPONENT_MODE_PERF,
+	GTRACE_COMPONENT_MODE_MAX
+};
+
+/**
+ * struct gtrace_connection - Physical connection between two trace components.
+ * @src_port:    A connection's source port number.
+ * @src_fwnode:  Source component's fwnode handle.
+ * @src_comp:    Source component's pointer.
+ * @dest_port:   A connection's destination port number.
+ * @dest_fwnode: Destination component's fwnode handle.
+ * @dest_comp:   Destination component's pointer.
+ */
+struct gtrace_connection {
+	int src_port;
+	struct fwnode_handle *src_fwnode;
+	int dest_port;
+	struct fwnode_handle *dest_fwnode;
+	struct gtrace_component *src_comp;
+	struct gtrace_component *dest_comp;
+};
+
+struct gtrace_platform_data;
+
+/**
+ * struct gtrace_hw_ops - Architecture-specific low level control of a component.
+ * @enable:  Enable the component's hardware block.
+ * @disable: Disable the component's hardware block.
+ * @reset:   Reset the component's hardware block.
+ *
+ * These operate on the component's platform data rather than a full
+ * gtrace_component so that they can be invoked before the component is
+ * registered with the gtrace core (e.g. to reset the hardware during probe).
+ *
+ * These abstract the register-level programming that differs between
+ * architectures (RISC-V Trace Control registers vs ARM CoreSight, etc.). The
+ * core never touches component registers directly; it invokes these ops.
+ */
+struct gtrace_hw_ops {
+	int (*enable)(struct gtrace_platform_data *pdata);
+	int (*disable)(struct gtrace_platform_data *pdata);
+	int (*reset)(struct gtrace_platform_data *pdata);
+};
+
+/**
+ * struct gtrace_platform_data - Platform-level data for a trace component
+ * discovered from DT or ACPI.
+ * @dev:         Parent device.
+ * @impid:       Opaque, architecture-specific implementation ID.
+ * @hw_ops:      Architecture-specific low level control ops.
+ * @io_mem:      Flag showing whether component registers are memory mapped.
+ * @base:        If io_mem == true then base address of the mapped registers.
+ * @read:        If io_mem == false then read register from the given offset.
+ * @write:       If io_mem == false then write register to the given offset.
+ * @bound_cpu:   CPU to which the component is bound, or -1 if unbound. For a
+ *               source component bound to a CPU this must not be -1.
+ * @control_poll_timeout_usecs: Delay in usecs when polling control bits.
+ * @nr_inconns:  Number of input connections.
+ * @inconns:     Array of pointers to input connections.
+ * @nr_outconns: Number of output connections.
+ * @outconns:    Array of pointers to output connections.
+ */
+struct gtrace_platform_data {
+	struct device *dev;
+
+	u32 impid;
+
+	const struct gtrace_hw_ops *hw_ops;
+
+	bool io_mem;
+	union {
+		void __iomem *base;
+		struct {
+			u32 (*read)(struct gtrace_platform_data *pdata,
+				    u32 offset, bool relaxed);
+			void (*write)(struct gtrace_platform_data *pdata,
+				      u32 val, u32 offset, bool relaxed);
+		};
+	};
+
+	int bound_cpu;
+
+	/* Delay in microseconds when polling control register bits */
+	int control_poll_timeout_usecs;
+
+	/*
+	 * Platform driver must only populate empty pointer array without
+	 * any actual input connections.
+	 */
+	unsigned int nr_inconns;
+	struct gtrace_connection **inconns;
+
+	/*
+	 * Platform driver must fully populate pointer array with individual
+	 * array elements pointing to actual output connections. The src_comp
+	 * of each output connection is automatically updated at the time of
+	 * registering component.
+	 */
+	unsigned int nr_outconns;
+	struct gtrace_connection **outconns;
+};
+
+static inline u32 gtrace_read32(struct gtrace_platform_data *pdata, u32 offset)
+{
+	if (likely(pdata->io_mem))
+		return readl(pdata->base + offset);
+
+	return pdata->read(pdata, offset, false);
+}
+
+static inline u32 gtrace_relaxed_read32(struct gtrace_platform_data *pdata, u32 offset)
+{
+	if (likely(pdata->io_mem))
+		return readl_relaxed(pdata->base + offset);
+
+	return pdata->read(pdata, offset, true);
+}
+
+static inline void gtrace_write32(struct gtrace_platform_data *pdata, u32 val, u32 offset)
+{
+	if (likely(pdata->io_mem))
+		writel(val, pdata->base + offset);
+	else
+		pdata->write(pdata, val, offset, false);
+}
+
+static inline void gtrace_relaxed_write32(struct gtrace_platform_data *pdata,
+					  u32 val, u32 offset)
+{
+	if (likely(pdata->io_mem))
+		writel_relaxed(val, pdata->base + offset);
+	else
+		pdata->write(pdata, val, offset, true);
+}
+
+static inline bool gtrace_is_source(struct gtrace_platform_data *pdata)
+{
+	return !pdata->nr_inconns ? true : false;
+}
+
+static inline bool gtrace_is_sink(struct gtrace_platform_data *pdata)
+{
+	return !pdata->nr_outconns ? true : false;
+}
+
+/**
+ * struct gtrace_component_id - Details to identify or match a trace component.
+ * @type:    Component type from the global gtrace_component_type list.
+ * @version: Architecture-specific version (opaque to the core).
+ * @data:    Data pointer for driver use.
+ */
+struct gtrace_component_id {
+	enum gtrace_component_type type;
+	u32 version;
+	void *data;
+};
+
+/**
+ * struct gtrace_component - Representation of a trace component.
+ * @pdata:    Pointer to underlying platform data.
+ * @id:       Details to match the component.
+ * @type_idx: Unique number based on component type.
+ * @dev:      Device instance.
+ * @ready:    Flag showing whether the driver was probed successfully.
+ */
+struct gtrace_component {
+	struct gtrace_platform_data *pdata;
+	struct gtrace_component_id id;
+	u32 type_idx;
+	struct device dev;
+	bool ready;
+};
+
+#define to_gtrace_component(__dev)	container_of_const(__dev, struct gtrace_component, dev)
+
+static inline void gtrace_get_component(struct gtrace_component *comp)
+{
+	get_device(&comp->dev);
+}
+
+static inline void gtrace_put_component(struct gtrace_component *comp)
+{
+	put_device(&comp->dev);
+}
+
+const struct gtrace_component_id *gtrace_match_id(struct gtrace_component *comp,
+						  const struct gtrace_component_id *ids);
+struct gtrace_component *gtrace_find_by_fwnode(struct fwnode_handle *fwnode);
+
+int gtrace_poll_bit(struct gtrace_platform_data *pdata, int offset,
+		    int bit, int bitval, int timeout);
+int gtrace_enable_component(struct gtrace_component *comp);
+int gtrace_disable_component(struct gtrace_component *comp);
+int gtrace_reset_component(struct gtrace_component *comp);
+
+struct gtrace_component *gtrace_cpu_source(unsigned int cpu);
+
+struct gtrace_component *gtrace_register_component(struct gtrace_component_id *id,
+						   const char *name,
+						   struct gtrace_platform_data *pdata);
+void gtrace_unregister_component(struct gtrace_component *comp);
+
+/**
+ * struct gtrace_driver - Representation of a trace driver.
+ * @id_table:      Table to match components handled by the driver.
+ * @probe:         Driver probe() function.
+ * @remove:        Driver remove() function.
+ * @get_trace_id:  Get/allocate a trace ID.
+ * @put_trace_id:  Put/free a trace ID.
+ * @driver:        Device driver instance.
+ */
+struct gtrace_driver {
+	const struct gtrace_component_id *id_table;
+	int			(*probe)(struct gtrace_component *comp);
+	void			(*remove)(struct gtrace_component *comp);
+	int			(*get_trace_id)(struct gtrace_component *comp,
+						enum gtrace_component_mode mode);
+	void			(*put_trace_id)(struct gtrace_component *comp,
+						enum gtrace_component_mode mode,
+						u32 trace_id);
+	struct device_driver	driver;
+};
+
+#define to_gtrace_driver(__drv)   \
+	((__drv) ? container_of_const((__drv), struct gtrace_driver, driver) : NULL)
+
+int __gtrace_register_driver(struct module *owner, struct gtrace_driver *gtdrv);
+#define gtrace_register_driver(driver) __gtrace_register_driver(THIS_MODULE, driver)
+static inline void gtrace_unregister_driver(struct gtrace_driver *gtdrv)
+{
+	if (gtdrv)
+		driver_unregister(&gtdrv->driver);
+}
+
+#endif /* __LINUX_GTRACE_H__ */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
