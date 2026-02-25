Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CE7EF5862
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 06:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NNDHKbk64cZdN9qNk/RGImUSN6vc02uv1pFnpYRrgcg=; b=oFZTCeJw8yKwb7
	qnb7HCIfP485njE3xNMS0jZvdJBILq+1R9RrRFVfqbwu55LNuHAB7++cNu+l7L1sJeE7xLoNqf1Fq
	lC49m5BNq/vmm7Ift2TWfWEgnwGu0KFffh1MJWW8N8wyouI0J+m8F9Annt0WEWT2KJTyhOfrEFOv5
	5Y4pY8cyxksei33JHDZVHXKnMLhLiFHb+6wGOg0x3juJw/YSGrhrETSctawv0YDcGyLhU8BUAQ+Yq
	ZDRglRnYlwVxVcUsDXWFeBf9GuD+plRMzlugfnFgq2mNJFjUYgtU5/N1yBTnomMJps0sNSudVYZZB
	oWUn36x+LiDWkHzUWIRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv8LF-00000003Jf9-11Mu;
	Wed, 25 Feb 2026 06:25:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv8LD-00000003JdB-2kIm
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 06:25:48 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P2TPlk583293;
	Wed, 25 Feb 2026 06:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4V8xwFf6TIw
	IWFZcVTEKulyPWH+m1hcR5fEkS8N/mO8=; b=IH8LzGqUFX6jXio7ZBhGbDpM5U3
	taTUYLLdW0nvmlaRwCoZe5psMI++yQJHO6AKUOBEvKEgqNKwGcBETcPl6h4jhZet
	IwbFiFYtCr4mzqkNLUaM39ptKg9uSO4RznztUKf1Tsn6qnAxOPWmPDtqk5JnI2nB
	RK8CHk0iz12WqH5vVs/wBr7nxZJEXhJxmcKDzYXxCpG+MSDkG6nw5mq3GCxbOyJW
	AGiXv9edPUdrc7G6I9SqncEbm/xV4ugS72aGrxDXVYUY1UOxbB0sQrxUTSUlYCnS
	79J5XYneOB3A1dKXrh4dNar0oRj2y/ZReGgMzvXArZbZJsL9p0KyX+84NJw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg2gt5b7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 06:25:00 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 61P6OMs6001164;
	Wed, 25 Feb 2026 06:24:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4cf5sm83f0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 06:24:56 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 61P6OuWg001356;
	Wed, 25 Feb 2026 06:24:56 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 61P6OtZL001305
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 06:24:56 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id D633224B4A; Wed, 25 Feb 2026 11:54:53 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Liang Kan <kan.liang@linux.intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v3 09/12] rvtrace: Add perf driver for tracing using perf tool
Date: Wed, 25 Feb 2026 11:54:45 +0530
Message-ID: <20260225062448.4027948-10-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225062448.4027948-1-anup.patel@oss.qualcomm.com>
References: <20260225062448.4027948-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iELcoQ1p8Uc2AVZNPWV_kZDEEQqEibRj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA2MSBTYWx0ZWRfX3T4gF/WaWhRi
 ohEAs3PvgkeMIqBlkf2x5OyN0cI2PoOVVNClviSFIHPDykRFUsLqjLEreYWM5iOkZIRdplj0AjH
 GNpsSUTcK9DhALtA8lXgFpRrK8KAwxy0obgufqZGgi21n3h1rZLYAsOosSA3jMRYloQwL0GEvym
 jUGFLU+QLdu6L11Vd6I87CQtUpHJghaymR/rrpPvgZjv79ibAvfYDznMsiqlFpTXnQgm3DRPJEm
 utkCX83SamryZgjb2IyaZHYY1EJy3C7mZiCzbFfaImzTDXsjXINNrBuQW6GtaCkYS6Fzj1GrSNQ
 Y7P7ynxAljHkosx/DqVTTR0ktI1rUntacIuhKC/7qyew7ce+EvBn9apVQkJra8if6v7dDl7RABD
 brKSxvoZTa/GnWJbdACxth2isHN1PngZTqy+LWmbzscATd1IfY9P/bwLjEBkGlXIo3d7yXSZHSo
 bTVMJV1u7ZuxkqzjlaA==
X-Authority-Analysis: v=2.4 cv=ftHRpV4f c=1 sm=1 tr=0 ts=699e95bc cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=HURrUvzjhtnrdgnosHYA:9
X-Proofpoint-GUID: iELcoQ1p8Uc2AVZNPWV_kZDEEQqEibRj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_222547_823958_302DEB9E 
X-CRM114-Status: GOOD (  33.63  )
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

From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

Add perf driver for RISC-V tracing similar to ARM Coresight and Hisilicon
PTT drivers. The driver adds 'rvtrace' event descriptor which can be used
by the perf tool to record the RISC-V trace data.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/rvtrace/Kconfig        |   1 +
 drivers/hwtracing/rvtrace/Makefile       |   2 +-
 drivers/hwtracing/rvtrace/rvtrace-core.c |   8 +
 drivers/hwtracing/rvtrace/rvtrace-perf.c | 341 +++++++++++++++++++++++
 include/linux/rvtrace.h                  |   3 +
 5 files changed, 354 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hwtracing/rvtrace/rvtrace-perf.c

diff --git a/drivers/hwtracing/rvtrace/Kconfig b/drivers/hwtracing/rvtrace/Kconfig
index 0577f9acb858..ba11acf1117d 100644
--- a/drivers/hwtracing/rvtrace/Kconfig
+++ b/drivers/hwtracing/rvtrace/Kconfig
@@ -4,6 +4,7 @@ menuconfig RVTRACE
 	tristate "RISC-V Trace Support"
 	depends on RISCV
 	depends on OF
+	select PERF_EVENTS
 	default RISCV
 	help
 	  This framework provides a kernel interface for the RISC-V trace
diff --git a/drivers/hwtracing/rvtrace/Makefile b/drivers/hwtracing/rvtrace/Makefile
index 122e575da9fb..07403f4d94e3 100644
--- a/drivers/hwtracing/rvtrace/Makefile
+++ b/drivers/hwtracing/rvtrace/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_RVTRACE) += rvtrace.o
-rvtrace-y := rvtrace-core.o rvtrace-platform.o
+rvtrace-y := rvtrace-core.o rvtrace-platform.o rvtrace-perf.o
 obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
 obj-$(CONFIG_RVTRACE_RAMSINK) += rvtrace-ramsink.o
diff --git a/drivers/hwtracing/rvtrace/rvtrace-core.c b/drivers/hwtracing/rvtrace/rvtrace-core.c
index 1a1484c1eca4..159d3df0aa41 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-core.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-core.c
@@ -766,11 +766,19 @@ static int __init rvtrace_init(void)
 		return ret;
 	}
 
+	ret = rvtrace_perf_init();
+	if (ret) {
+		platform_driver_unregister(&rvtrace_platform_driver);
+		bus_unregister(&rvtrace_bustype);
+		return ret;
+	}
+
 	return 0;
 }
 
 static void __exit rvtrace_exit(void)
 {
+	rvtrace_perf_exit();
 	platform_driver_unregister(&rvtrace_platform_driver);
 	bus_unregister(&rvtrace_bustype);
 }
diff --git a/drivers/hwtracing/rvtrace/rvtrace-perf.c b/drivers/hwtracing/rvtrace/rvtrace-perf.c
new file mode 100644
index 000000000000..dca83589c419
--- /dev/null
+++ b/drivers/hwtracing/rvtrace/rvtrace-perf.c
@@ -0,0 +1,341 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ * Author: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/cpumask.h>
+#include <linux/device.h>
+#include <linux/list.h>
+#include <linux/mm.h>
+#include <linux/init.h>
+#include <linux/perf_event.h>
+#include <linux/vmalloc.h>
+#include <linux/percpu-defs.h>
+#include <linux/slab.h>
+#include <linux/stringhash.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+#include <linux/rvtrace.h>
+
+#define RVTRACE_PMU_NAME "rvtrace"
+static struct pmu rvtrace_pmu;
+static DEFINE_SPINLOCK(perf_buf_lock);
+
+/**
+ * struct rvtrace_event_data - RISC-V trace specific perf event data
+ * @work:		Handle to free allocated memory outside IRQ context.
+ * @mask:		Hold the CPU(s) this event was set for.
+ * @aux_hwid_done:	Whether a CPU has emitted the TraceID packet or not.
+ * @path:		An array of path, each slot for one CPU.
+ * @buf:		Aux buffer / pages allocated by perf framework.
+ */
+struct rvtrace_event_data {
+	struct work_struct work;
+	cpumask_t mask;
+	cpumask_t aux_hwid_done;
+	struct rvtrace_path * __percpu *path;
+	struct rvtrace_perf_auxbuf buf;
+};
+
+struct rvtrace_ctxt {
+	struct perf_output_handle handle;
+	struct rvtrace_event_data *event_data;
+};
+
+static DEFINE_PER_CPU(struct rvtrace_ctxt, rvtrace_ctxt);
+
+static void *alloc_event_data(int cpu)
+{
+	struct rvtrace_event_data *event_data;
+	cpumask_t *mask;
+
+	event_data = kzalloc(sizeof(*event_data), GFP_KERNEL);
+	if (!event_data)
+		return NULL;
+
+	/* Update mask as per selected CPUs */
+	mask = &event_data->mask;
+	if (cpu != -1)
+		cpumask_set_cpu(cpu, mask);
+	else
+		cpumask_copy(mask, cpu_present_mask);
+
+	event_data->path = alloc_percpu(struct rvtrace_path *);
+	return event_data;
+}
+
+static void rvtrace_free_aux(void *data)
+{
+	struct rvtrace_event_data *event_data = data;
+
+	schedule_work(&event_data->work);
+}
+
+static struct rvtrace_path **rvtrace_event_cpu_path_ptr(struct rvtrace_event_data *data,
+							int cpu)
+{
+	return per_cpu_ptr(data->path, cpu);
+}
+
+static void free_event_data(struct work_struct *work)
+{
+	struct rvtrace_event_data *event_data;
+	struct rvtrace_path *path;
+	cpumask_t *mask;
+	int cpu;
+
+	event_data = container_of(work, struct rvtrace_event_data, work);
+	mask = &event_data->mask;
+	for_each_cpu(cpu, mask) {
+		path = *rvtrace_event_cpu_path_ptr(event_data, cpu);
+		rvtrace_destroy_path(path);
+	}
+	free_percpu(event_data->path);
+	kfree(event_data);
+}
+
+static void *rvtrace_setup_aux(struct perf_event *event, void **pages,
+			       int nr_pages, bool overwrite)
+{
+	struct rvtrace_event_data *event_data = NULL;
+	struct page **pagelist;
+	int cpu = event->cpu, i;
+	cpumask_t *mask;
+
+	event_data = alloc_event_data(cpu);
+	if (!event_data)
+		return NULL;
+
+	INIT_WORK(&event_data->work, free_event_data);
+	mask = &event_data->mask;
+	/*
+	 * Create the path for each CPU in the mask. In case of any failure skip the CPU
+	 */
+	for_each_cpu(cpu, mask) {
+		struct rvtrace_component *src;
+		struct rvtrace_path *path;
+
+		src = rvtrace_cpu_source(cpu);
+		if (!src)
+			continue;
+
+		path = rvtrace_create_path(src, NULL, RVTRACE_COMPONENT_MODE_PERF);
+		if (!path)
+			continue;
+
+		*rvtrace_event_cpu_path_ptr(event_data, cpu) = path;
+	}
+
+	/* If we don't have any CPUs ready for tracing, abort */
+	cpu = cpumask_first(&event_data->mask);
+	if (cpu >= nr_cpu_ids)
+		goto err;
+
+	pagelist = kcalloc(nr_pages, sizeof(*pagelist), GFP_KERNEL);
+	if (!pagelist)
+		goto err;
+
+	for (i = 0; i < nr_pages; i++)
+		pagelist[i] = virt_to_page(pages[i]);
+
+	event_data->buf.base = vmap(pagelist, nr_pages, VM_MAP, PAGE_KERNEL);
+	if (!event_data->buf.base) {
+		kfree(pagelist);
+		goto err;
+	}
+
+	event_data->buf.nr_pages = nr_pages;
+	event_data->buf.length = nr_pages * PAGE_SIZE;
+	event_data->buf.pos = 0;
+	return event_data;
+err:
+	rvtrace_free_aux(event_data);
+	return NULL;
+}
+
+static void rvtrace_event_read(struct perf_event *event)
+{
+}
+
+static void rvtrace_event_destroy(struct perf_event *event)
+{
+}
+
+static int rvtrace_event_init(struct perf_event *event)
+{
+	if (event->attr.type != rvtrace_pmu.type)
+		return -EINVAL;
+
+	event->destroy = rvtrace_event_destroy;
+	return 0;
+}
+
+static void rvtrace_event_start(struct perf_event *event, int flags)
+{
+	struct rvtrace_ctxt *ctxt = this_cpu_ptr(&rvtrace_ctxt);
+	struct perf_output_handle *handle = &ctxt->handle;
+	struct rvtrace_event_data *event_data;
+	int cpu = smp_processor_id();
+	struct rvtrace_path *path;
+
+	if (WARN_ON(ctxt->event_data))
+		goto fail;
+
+	/*
+	 * Deal with the ring buffer API and get a handle on the
+	 * session's information.
+	 */
+	event_data = perf_aux_output_begin(handle, event);
+	if (!event_data)
+		goto fail;
+
+	if (!cpumask_test_cpu(cpu, &event_data->mask))
+		goto out;
+
+	event_data->buf.pos = handle->head % event_data->buf.length;
+	path = *rvtrace_event_cpu_path_ptr(event_data, cpu);
+	if (!path) {
+		pr_err("Error. Path not found\n");
+		return;
+	}
+
+	if (rvtrace_path_start(path)) {
+		pr_err("Error. Tracing not started\n");
+		return;
+	}
+
+	/*
+	 * output cpu / trace ID in perf record, once for the lifetime
+	 * of the event.
+	 */
+	if (!cpumask_test_cpu(cpu, &event_data->aux_hwid_done)) {
+		cpumask_set_cpu(cpu, &event_data->aux_hwid_done);
+		perf_report_aux_output_id(event, cpu);
+	}
+
+out:
+	/* Tell the perf core the event is alive */
+	event->hw.state = 0;
+	ctxt->event_data = event_data;
+	return;
+fail:
+	event->hw.state = PERF_HES_STOPPED;
+}
+
+static void rvtrace_event_stop(struct perf_event *event, int mode)
+{
+	struct rvtrace_ctxt *ctxt = this_cpu_ptr(&rvtrace_ctxt);
+	struct perf_output_handle *handle = &ctxt->handle;
+	struct rvtrace_event_data *event_data;
+	int ret, cpu = smp_processor_id();
+	struct rvtrace_path *path;
+	size_t size;
+
+	if (event->hw.state == PERF_HES_STOPPED)
+		return;
+
+	if (handle->event &&
+	    WARN_ON(perf_get_aux(handle) != ctxt->event_data))
+		return;
+
+	event_data = ctxt->event_data;
+	ctxt->event_data = NULL;
+
+	if (WARN_ON(!event_data))
+		return;
+
+	if (handle->event && (mode & PERF_EF_UPDATE) && !cpumask_test_cpu(cpu, &event_data->mask)) {
+		event->hw.state = PERF_HES_STOPPED;
+		perf_aux_output_end(handle, 0);
+		return;
+	}
+
+	/* stop tracing */
+	path = *rvtrace_event_cpu_path_ptr(event_data, cpu);
+	if (!path) {
+		pr_err("Error. Path not found\n");
+		return;
+	}
+
+	if (rvtrace_path_stop(path)) {
+		pr_err("Error. Tracing not stopped\n");
+		return;
+	}
+
+	event->hw.state = PERF_HES_STOPPED;
+	if (handle->event && (mode & PERF_EF_UPDATE)) {
+		if (WARN_ON_ONCE(handle->event != event))
+			return;
+		spin_lock(&perf_buf_lock);
+		ret = rvtrace_path_copyto_auxbuf(path, &event_data->buf, &size);
+		spin_unlock(&perf_buf_lock);
+		WARN_ON_ONCE(ret);
+		if (READ_ONCE(handle->event))
+			perf_aux_output_end(handle, size);
+		else
+			WARN_ON(size);
+	}
+}
+
+static int rvtrace_event_add(struct perf_event *event, int mode)
+{
+	struct hw_perf_event *hwc = &event->hw;
+	int ret = 0;
+
+	if (mode & PERF_EF_START) {
+		rvtrace_event_start(event, 0);
+		if (hwc->state & PERF_HES_STOPPED)
+			ret = -EINVAL;
+	} else {
+		hwc->state = PERF_HES_STOPPED;
+	}
+
+	return ret;
+}
+
+static void rvtrace_event_del(struct perf_event *event, int mode)
+{
+	rvtrace_event_stop(event, PERF_EF_UPDATE);
+}
+
+PMU_FORMAT_ATTR(event, "config:0-0");
+
+static struct attribute *rvtrace_pmu_formats_attr[] = {
+	&format_attr_event.attr,
+	NULL,
+};
+
+static struct attribute_group rvtrace_pmu_format_group = {
+	.name = "format",
+	.attrs = rvtrace_pmu_formats_attr,
+};
+
+static const struct attribute_group *rvtrace_pmu_attr_groups[] = {
+	&rvtrace_pmu_format_group,
+	NULL,
+};
+
+int __init rvtrace_perf_init(void)
+{
+	rvtrace_pmu.capabilities	= (PERF_PMU_CAP_EXCLUSIVE | PERF_PMU_CAP_ITRACE);
+	rvtrace_pmu.attr_groups		= rvtrace_pmu_attr_groups;
+	rvtrace_pmu.task_ctx_nr		= perf_sw_context;
+	rvtrace_pmu.read		= rvtrace_event_read;
+	rvtrace_pmu.event_init		= rvtrace_event_init;
+	rvtrace_pmu.setup_aux		= rvtrace_setup_aux;
+	rvtrace_pmu.free_aux		= rvtrace_free_aux;
+	rvtrace_pmu.start		= rvtrace_event_start;
+	rvtrace_pmu.stop		= rvtrace_event_stop;
+	rvtrace_pmu.add			= rvtrace_event_add;
+	rvtrace_pmu.del			= rvtrace_event_del;
+	rvtrace_pmu.module		= THIS_MODULE;
+
+	return perf_pmu_register(&rvtrace_pmu, RVTRACE_PMU_NAME, -1);
+}
+
+void __exit rvtrace_perf_exit(void)
+{
+	perf_pmu_unregister(&rvtrace_pmu);
+}
diff --git a/include/linux/rvtrace.h b/include/linux/rvtrace.h
index 36663c7b3e30..0cb3bd474c2b 100644
--- a/include/linux/rvtrace.h
+++ b/include/linux/rvtrace.h
@@ -346,4 +346,7 @@ static inline int rvtrace_comp_poll_empty(struct rvtrace_component *comp)
 				comp->pdata->control_poll_timeout_usecs);
 }
 
+int rvtrace_perf_init(void);
+void rvtrace_perf_exit(void);
+
 #endif
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
