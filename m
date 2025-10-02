Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98A0CAC5B8
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 06:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IplW2l1/dkmRM0fpUoPCsL9qElIf7VY9tMc7Y8MBTKE=; b=yghFDtED1i6PQW
	6E/tKHDP1lym5/oeQ7e6VMqTX2F6ePgxcwNMlSq06PIQh6517CR1lIRXveOELSxKIR6c8PeaGUFZp
	KxCwVOJHu3dD4QYUWKy65gJhkgRxiovAqqw0G1frL6wksN258BYeQaiDG5A3SwkylUxmXaE741zoX
	BjnOFelzhRmbE7I5OEL1yRsBnwhob3ypovzH5uU6gawbiEVfJK3N93d6XEQa21ou+YcNP1sUsD9bh
	Exuv6d2F3R3GDgxmRZBEWSnxIZrLxprna3Tt51ZNtx4pbOTO/PgWyqM4uXDRPp5r4J2+8R0XTxjfu
	PaEnslI0+gw1JyzfMHbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4CWp-00000009iET-2F1p;
	Thu, 02 Oct 2025 06:10:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4CWo-00000009iDq-1Pxm
	for linux-riscv@bombadil.infradead.org;
	Thu, 02 Oct 2025 06:10:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=BUQPfkbJ3dZW7yGpAIpAlgM0v37IerodzZgj+qIzfvU=; b=SYs6fdq60EFw6svuBFHUn388jO
	MGSnnejkDYrOGUvekddthyshAsggGNOsSu0ujazQgZhbaN5Nyacik1kOHWhdzImrWQkOqnC6SXBR3
	Chh9Wc6PBVewKhl5igIftjf++l8CstCBTpR5viw5UFc8BOA1+xMy5Sii3EY1pficG6WzmvurtJ30z
	oZhdaWsS9fTVzohGaKTsV+JvodMnC/ZWHvf9OlT2VDjicJCTUMWN5gmke3BQCmiRIYSgyHWGB1PwB
	bDnSolKPTKSWxhYGDh45HYzr0B0CcNyqw+hs0neg91Nc1hEEG8iNehGle0X/rdz1c1hdpTsYsRubT
	DJdoatQw==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4CVC-0000000E503-38lr
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 06:10:56 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-789fb76b466so715590b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Oct 2025 23:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1759385357; x=1759990157; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUQPfkbJ3dZW7yGpAIpAlgM0v37IerodzZgj+qIzfvU=;
        b=fRq3boPtlOOO91+7/+2FnmehKdb+hUkKShlYRBHH73DVVolctnTmzhV2fG8y2Q9kcS
         BkcYAD2fX56sSffoXBpQE7Jyq1abd/eS7imCUeA39sUM/RdGv+svnjZnDfDJo8gHofZ6
         nuy+aLtk8XwFZuP+FPfKhSuSxfhKhHygOG/tWlgf9lTbbirqGrZyYIQRqB55smQb3vyG
         Fl1BY4EDMwQypPZApgrYaBFXKQqm8EAfXPSIsYDHW/uCo4QEuA+Rwpal/GxVhLzhkoqv
         nYduLZXHuc5x4pfE2LV26tRXf8xfvcZ6PJcarrulxpIUa84kb3J36tocNRypN9iYqA9H
         NnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759385357; x=1759990157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BUQPfkbJ3dZW7yGpAIpAlgM0v37IerodzZgj+qIzfvU=;
        b=CDIRLJtxrhV2ORN2mADD0zHr/nPgAJKnPrQIE8nLmbDLQp2E/EeNHx8ORa1GiBS7EH
         +mEfH3Bcc1GNBRZi5ncqZHeWy4ER+aMXZZ4KfKCZF+uk68LTwQiw6OJMhJu3AtlL39jg
         0K/Ysv7SiNh//QZ/Ld0d9dXSnAbeCaUTrEvNs1qqpqdZj3eNPIYzC3E1ejclhBH/YlVT
         tAWBfXMM/AJtXAwakGzwSKrx1M5/Fm03PNZIwtn0CM6aCpzyyymEgZifJViQ9Gv0xN9B
         do9VY1atfw5LcS3IPxot/kdaH+DJBR3FWoHzMAI6r+oH92oMyaL5HMU2CiJuEQzWuAYg
         V3DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEjf1wc98ofiWqKWyqvtYSZ20M19A7Coiy2SlN6dBq+Vy+M5SN+HvSS7wnpHDxNarP3YkgQhq+8g52cg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxE7VWaJnukaB88quPapRcBHNCvuNhg2USejPCLwH9co1wSENIM
	9C23Qysi2l0xSzG9ugI2QbRqj2xUIcWurMvrSOroafVx622ie/aRwkUNTz00umsDgmY=
X-Gm-Gg: ASbGncuPyBJwdmJL9DYFABv4U2W5FFxDzy1V0fRK16Taajsm35j0LSAAnrBQZnBhaGf
	vNnHZA6qJmnmA/ozDvdT+h3Ru5Hmq+gR63g65TBPzKePcnsU73lR77S3IG3q+FArMIjGOpuHuf5
	ou0U+K/LfAUa4bNcO3X/YJz1LV6I0lPFk5SoVwXOdEj8D5ZDKMtQF+mC7oLcQLGnRhJWDCRjip6
	iWm1t0Ixxc2SuANqFvjDoOpwyZpo+Q/22rfBwAYV+KtyKO9NFhqBhYC65/8bsbq7Es6OQRYfXlN
	44Z/pyIQwBuYrxLbikl6rEKwa8x8y5mTPxkXdRs7gfrboW8pm7bQk9pSyhvT9FiIkgxxmzrYRBi
	6O30HApTfIkuZDqjZ6i0KrDyVB2JWNh1RJ9BfTsyT+VrqTLD2NOqaJLeAfGLnvNLcwAlRbZbTT2
	LbXok=
X-Google-Smtp-Source: AGHT+IFJYhph88TXwzRm6wpDFKmxs7iIGvjnIRXrwoaN/aRyPB6wF1pi6B0teuXwXD5OsXwiw3KiPw==
X-Received: by 2002:a05:6a21:b8a:b0:2ea:41f1:d53a with SMTP id adf61e73a8af0-321e72b876emr7793339637.41.1759385356653;
        Wed, 01 Oct 2025 23:09:16 -0700 (PDT)
Received: from localhost.localdomain ([122.171.19.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099f594afsm1205029a12.37.2025.10.01.23.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 23:09:16 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>
Subject: [PATCH 08/11] rvtrace: Add perf driver for tracing using perf tool
Date: Thu,  2 Oct 2025 11:37:29 +0530
Message-ID: <20251002060732.100213-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251002060732.100213-1-apatel@ventanamicro.com>
References: <20251002060732.100213-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_070919_580305_A6C79F10 
X-CRM114-Status: GOOD (  32.10  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Anup Patel <anup@brainfault.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org, Mayuresh Chitale <mchitale@ventanamicro.com>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Anup Patel <apatel@ventanamicro.com>, Mayuresh Chitale <mchitale@gmail.com>, Namhyung Kim <namhyung@kernel.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, Liang Kan <kan.liang@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Mayuresh Chitale <mchitale@ventanamicro.com>

Add perf driver for RISC-V tracing similar to ARM Coresight and Hisilicon
PTT drivers. The driver adds 'rvtrace' event descriptor which can be used
by the perf tool to record the RISC-V trace data.

Co-developed-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 drivers/hwtracing/rvtrace/Kconfig        |   1 +
 drivers/hwtracing/rvtrace/Makefile       |   2 +-
 drivers/hwtracing/rvtrace/rvtrace-core.c |   8 +
 drivers/hwtracing/rvtrace/rvtrace-perf.c | 343 +++++++++++++++++++++++
 include/linux/rvtrace.h                  |   3 +
 5 files changed, 356 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hwtracing/rvtrace/rvtrace-perf.c

diff --git a/drivers/hwtracing/rvtrace/Kconfig b/drivers/hwtracing/rvtrace/Kconfig
index aef7e9989165..76379c63c5c3 100644
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
index e874899c8b43..5d4e92f22ccd 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-core.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-core.c
@@ -760,11 +760,19 @@ static int __init rvtrace_init(void)
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
index 000000000000..2d3039f8b681
--- /dev/null
+++ b/drivers/hwtracing/rvtrace/rvtrace-perf.c
@@ -0,0 +1,343 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright(C) 2025 Ventanamicro Limited. All rights reserved.
+ * Author: Mayuresh Chitale <mchitale@venanamicro.com>
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
+#define RVTRACE_BUF_LEN (4 * 1024 * 1024)
+
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
index 17d2fd9234c2..0a454707633b 100644
--- a/include/linux/rvtrace.h
+++ b/include/linux/rvtrace.h
@@ -335,4 +335,7 @@ static inline void rvtrace_unregister_driver(struct rvtrace_driver *rtdrv)
 		driver_unregister(&rtdrv->driver);
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
