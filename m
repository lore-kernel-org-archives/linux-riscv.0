Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5722CCFA00
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Nov 2025 15:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M+HDQu4IW6p7uTmC7+HKww7o8X6cfo81y/CxWBkcmp0=; b=bTrkO2xBEd9uXp
	XasDTt0pq4jG5sxEHYLXYFgpyhNc3dtA/uhgA4LhiTI0KIA19h3l0JzL5Q3onIO+NhMSliAgA+vgE
	ePJ/xMx4llCO+3qEPUu5KaRkMbox60qPdukPCcBaYZZRsvIX6Ad0xttZUhlkabQ2Wt0yJlasLh4Hq
	F4GRMz7YmN29HM7esksH3ddJHRTmbcElH+B/NR54ylSjeob7rWqv+3HAtO8Ma3hkh25U9momqjGgN
	H2TiBFMsqtOPV3DqBswEGsazIKTQpiKAqjYPJWRJWDnmKcxxsjgwFjxRrVZTNjhkv/e8SL2+w4Xg0
	InAejMpyspHo69J54BbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFDlB-00000007sq7-45lF;
	Sat, 01 Nov 2025 15:43:21 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFDl9-00000007spf-1KtP
	for linux-riscv@lists.infradead.org;
	Sat, 01 Nov 2025 15:43:20 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2698384978dso26704965ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 01 Nov 2025 08:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1762011798; x=1762616598; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJutO7OK9RvRlu7Ga6ZLaugpxZbKoUMzueQ1pJ0IpGo=;
        b=EqakBRUYmVM5Gq1oA+WO33L9R3K7Vp3wQZ8wouN4eIjW9FXUoIvfMXMjUGnprCT5Ob
         N99Q2CQaCpKcLSSlbGxl8EmHdEuv5kvbZigqzNtkgmLecw3yywi2VMK84CfZz0K6TLDI
         0aje3PnsdVwIGRm5j8nJqiTRVzWQ20ceIVAOYIxAqklAf11cv5aUec+si2qwpIlfcyB/
         m5UkZLYw6Bw06idGiQMIoXvOmaI+fXZJk/CiTbVyKcRvfppb7lhe+bI7zQ1aSziaL/uZ
         +01vlll3z7hFO/aTchacW8+DWRQ6YOeN/715wTQJhzQDiGh6X5HT/jPU9IHDIR4u6tRt
         z3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762011798; x=1762616598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJutO7OK9RvRlu7Ga6ZLaugpxZbKoUMzueQ1pJ0IpGo=;
        b=iz+NXAjoQAzOOaujSUmA9tN/9LhgtkTUxbDNREaaVXq+26hNvDZRwWvG90+1ASYPHU
         3bobXBav1D/fsffMVUbIH+xM1tCbn10kbN4cDOFiFINxRwAgz3a+Dy7Gpgp3h+zZnPQC
         FMX1ZgOPdzs+oLR1Ax4AOp3oRy6oCWmZi6GQf10xbza8mSKGMZ9KLhFj2h2/du2P//sl
         INRYBMNH6jzKC/pqaQHJ60JZ/8Wn88VaYU99x+RsMj2HUnfv1iLSc3m6ELD6ciu7MG2S
         hAmxoPt7ko0dCqIV2d1H5Y5lW992OHtOFh+c+Zm/km1zD7WMnbEI7uEOYigtgU/7CJE+
         nxAg==
X-Forwarded-Encrypted: i=1; AJvYcCU8ZlToLSNQ9VT3p4PtiDUdOdT/kgbf8FaIofWJdYbeoUpFvWiPIQNDPKBq5xrvCPeEoUdm2+p40IaKyw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8uXpZROEVCJKMqjcdd0UlikPgEERYeU6vLymRNM70AvbuIfpr
	ayNMIFm0xEMXiZUH/LzYrp0Sue4sB/j5VrCT8khB4u2uh4Vs2K0GHJboAj9IsFb+G3Y=
X-Gm-Gg: ASbGncvi4PBifBW4PR3qedG/Nrbh1RwUD/i28LDpCPNW4Ab3s97jx8n0f84kssKr+b8
	yQr4Ri7LbRgcdmXnMFixWir01Rh6VSfPoBrpNznCdRElmXcJouD+5adGNx85XxEPhm/SPwiTbez
	ne5ZSYeuXIA8tMAeoirZnQ5IDKM002SoLkZPbpd3rMqBUAAQlKUTCo7Q4r/4SucJzACqL6j8OH3
	b9QpZKdkKel8988UGTVEDvGjY/dE+7hipJm2R9th5OAY5Iy2lL6smq81gKtrpI/ieLGz2Pt3kV9
	K9vhhnwmGwtFb4yRNvTh9/oqX6WyPAaddO0vfEIIWAFiFB98QivlgaN2yNrZrvLTJoOMNbaKVK1
	1Kl8+35jX7qzHqTVN8Vd508HQp8qLWPq0Yv6hTadLhcna1sQfgWPygxmCyS64oyIzDYclH1Fs4c
	aWI4EcXgd1lB77oBMUSDk79f3nP9d2B6k=
X-Google-Smtp-Source: AGHT+IE2XueFF/NWd5tWURFURLGzGW+djmc65AMR7kYjFoOZDR5tZf/oLe7GOVs+zg5c5Ifn+DnVYg==
X-Received: by 2002:a17:902:f70e:b0:295:7453:b580 with SMTP id d9443c01a7336-2957453b734mr10911815ad.58.1762011798310;
        Sat, 01 Nov 2025 08:43:18 -0700 (PDT)
Received: from localhost.localdomain ([122.171.20.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295269bd2fesm59990105ad.105.2025.11.01.08.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 08:43:17 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>
Subject: [PATCH v2 02/12] rvtrace: Initial implementation of driver framework
Date: Sat,  1 Nov 2025 21:12:35 +0530
Message-ID: <20251101154245.162492-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251101154245.162492-1-apatel@ventanamicro.com>
References: <20251101154245.162492-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_084319_450420_FCD11068 
X-CRM114-Status: GOOD (  28.45  )
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

The RISC-V Trace Control Interface Specification [1] defines a standard
way of implementing RISC-V trace related modular components irrespective
to underlying trace format (E-trace or N-trace). These RISC-V trace
components are organized in a graph-like topology where each RISC-V
hart has its own RISC-V trace encoder component.

Implement a basic driver framework for RISC-V trace where RISC-V trace
components are instantiated by a common platform driver and a separate
RISC-V trace driver for each type of RISC-V trace component.

[1] https://github.com/riscv-non-isa/tg-nexus-trace/releases/download/1.0_Ratified/RISC-V-Trace-Control-Interface.pdf

Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/Makefile                             |   1 +
 drivers/hwtracing/Kconfig                    |   2 +
 drivers/hwtracing/rvtrace/Kconfig            |  16 +
 drivers/hwtracing/rvtrace/Makefile           |   4 +
 drivers/hwtracing/rvtrace/rvtrace-core.c     | 501 +++++++++++++++++++
 drivers/hwtracing/rvtrace/rvtrace-platform.c | 192 +++++++
 include/linux/rvtrace.h                      | 280 +++++++++++
 7 files changed, 996 insertions(+)
 create mode 100644 drivers/hwtracing/rvtrace/Kconfig
 create mode 100644 drivers/hwtracing/rvtrace/Makefile
 create mode 100644 drivers/hwtracing/rvtrace/rvtrace-core.c
 create mode 100644 drivers/hwtracing/rvtrace/rvtrace-platform.c
 create mode 100644 include/linux/rvtrace.h

diff --git a/drivers/Makefile b/drivers/Makefile
index 8e1ffa4358d5..3c0c3bd40a89 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -178,6 +178,7 @@ obj-$(CONFIG_CORESIGHT)		+= hwtracing/coresight/
 obj-y				+= hwtracing/intel_th/
 obj-$(CONFIG_STM)		+= hwtracing/stm/
 obj-$(CONFIG_HISI_PTT)		+= hwtracing/ptt/
+obj-$(CONFIG_RVTRACE)		+= hwtracing/rvtrace/
 obj-y				+= android/
 obj-$(CONFIG_NVMEM)		+= nvmem/
 obj-$(CONFIG_FPGA)		+= fpga/
diff --git a/drivers/hwtracing/Kconfig b/drivers/hwtracing/Kconfig
index 911ee977103c..daeb38fe332d 100644
--- a/drivers/hwtracing/Kconfig
+++ b/drivers/hwtracing/Kconfig
@@ -7,4 +7,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
 
 source "drivers/hwtracing/ptt/Kconfig"
 
+source "drivers/hwtracing/rvtrace/Kconfig"
+
 endmenu
diff --git a/drivers/hwtracing/rvtrace/Kconfig b/drivers/hwtracing/rvtrace/Kconfig
new file mode 100644
index 000000000000..f8f6feea1953
--- /dev/null
+++ b/drivers/hwtracing/rvtrace/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+menuconfig RVTRACE
+	tristate "RISC-V Trace Support"
+	depends on RISCV
+	depends on OF
+	default RISCV
+	help
+	  This framework provides a kernel interface for the RISC-V trace
+	  drivers (including both e-trace and n-trace). It's intended to
+	  build a topological view of the RISC-V trace components and
+	  configure the right series of components when trace is enabled
+	  on a CPU.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called rvtrace.
diff --git a/drivers/hwtracing/rvtrace/Makefile b/drivers/hwtracing/rvtrace/Makefile
new file mode 100644
index 000000000000..988525a379cf
--- /dev/null
+++ b/drivers/hwtracing/rvtrace/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_RVTRACE) += rvtrace.o
+rvtrace-y := rvtrace-core.o rvtrace-platform.o
diff --git a/drivers/hwtracing/rvtrace/rvtrace-core.c b/drivers/hwtracing/rvtrace/rvtrace-core.c
new file mode 100644
index 000000000000..32fda1647b39
--- /dev/null
+++ b/drivers/hwtracing/rvtrace/rvtrace-core.c
@@ -0,0 +1,501 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Ventana Micro Systems Inc.
+ */
+
+#include <linux/cpumask.h>
+#include <linux/delay.h>
+#include <linux/export.h>
+#include <linux/idr.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/percpu.h>
+#include <linux/rvtrace.h>
+
+/* Mutex to serialize component registration/unregistration */
+static DEFINE_MUTEX(rvtrace_mutex);
+
+/* Per-CPU encoder instances */
+static DEFINE_PER_CPU(struct rvtrace_component *, rvtrace_cpu_encoder);
+
+/* Component type based id generator */
+struct rvtrace_type_idx {
+	/* Lock to protect the type ID generator */
+	struct mutex lock;
+	struct idr idr;
+};
+
+/* Array of component type based id generator */
+static struct rvtrace_type_idx rvtrace_type_idx_array[RVTRACE_COMPONENT_TYPE_MAX];
+
+static int rvtrace_alloc_type_idx(struct rvtrace_component *comp)
+{
+	struct rvtrace_type_idx *rvidx = &rvtrace_type_idx_array[comp->id.type];
+	int idx;
+
+	mutex_lock(&rvidx->lock);
+	idx = idr_alloc(&rvidx->idr, comp, 0, 0, GFP_KERNEL);
+	mutex_unlock(&rvidx->lock);
+	if (idx < 0)
+		return idx;
+
+	comp->type_idx = idx;
+	return 0;
+}
+
+static void rvtrace_free_type_idx(struct rvtrace_component *comp)
+{
+	struct rvtrace_type_idx *rvidx = &rvtrace_type_idx_array[comp->id.type];
+
+	mutex_lock(&rvidx->lock);
+	idr_remove(&rvidx->idr, comp->type_idx);
+	mutex_unlock(&rvidx->lock);
+}
+
+static void __init rvtrace_init_type_idx(void)
+{
+	struct rvtrace_type_idx *rvidx;
+	int i;
+
+	for (i = 0; i < RVTRACE_COMPONENT_TYPE_MAX; i++) {
+		rvidx = &rvtrace_type_idx_array[i];
+		mutex_init(&rvidx->lock);
+		idr_init(&rvidx->idr);
+	}
+}
+
+const struct rvtrace_component_id *rvtrace_match_id(struct rvtrace_component *comp,
+						    const struct rvtrace_component_id *ids)
+{
+	u32 comp_maj, comp_min, id_maj, id_min;
+	const struct rvtrace_component_id *id;
+
+	for (id = ids; id->version && id->type; id++) {
+		if (comp->id.type != id->type)
+			return NULL;
+
+		id_maj = rvtrace_component_version_major(id->version);
+		id_min = rvtrace_component_version_minor(id->version);
+		comp_maj = rvtrace_component_version_major(comp->id.version);
+		comp_min = rvtrace_component_version_minor(comp->id.version);
+		if (comp_maj > id_maj)
+			continue;
+
+		/* Refer to Ch. 5 'Versioning of components of the Trace Control spec. */
+		if (comp_maj < id_maj)
+			dev_warn(&comp->dev, "Older component with major version %d\n", comp_maj);
+		if (comp_min == 15)
+			dev_warn(&comp->dev, "Experimental component\n");
+		else if (comp_min > id_min)
+			dev_warn(&comp->dev, "Newer component with minor version %d\n", comp_min);
+
+		return id;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(rvtrace_match_id);
+
+static int rvtrace_match_device(struct device *dev, const struct device_driver *drv)
+{
+	const struct rvtrace_driver *rtdrv = to_rvtrace_driver(drv);
+	struct rvtrace_component *comp = to_rvtrace_component(dev);
+
+	return rvtrace_match_id(comp, rtdrv->id_table) ? 1 : 0;
+}
+
+static int rvtrace_probe(struct device *dev)
+{
+	const struct rvtrace_driver *rtdrv = to_rvtrace_driver(dev->driver);
+	struct rvtrace_component *comp = to_rvtrace_component(dev);
+	int ret = -ENODEV;
+
+	if (!rtdrv->probe)
+		return ret;
+
+	ret = rtdrv->probe(comp);
+	if (!ret)
+		comp->ready = true;
+
+	return ret;
+}
+
+static void rvtrace_remove(struct device *dev)
+{
+	const struct rvtrace_driver *rtdrv = to_rvtrace_driver(dev->driver);
+	struct rvtrace_component *comp = to_rvtrace_component(dev);
+
+	comp->ready = false;
+	if (rtdrv->remove)
+		rtdrv->remove(comp);
+}
+
+const struct bus_type rvtrace_bustype = {
+	.name	= "rvtrace",
+	.match	= rvtrace_match_device,
+	.probe	= rvtrace_probe,
+	.remove	= rvtrace_remove,
+};
+
+struct rvtrace_fwnode_match_data {
+	struct fwnode_handle *fwnode;
+	struct rvtrace_component *match;
+};
+
+static int rvtrace_match_fwnode(struct device *dev, void *data)
+{
+	struct rvtrace_component *comp = to_rvtrace_component(dev);
+	struct rvtrace_fwnode_match_data *d = data;
+
+	if (device_match_fwnode(&comp->dev, d->fwnode)) {
+		d->match = comp;
+		return 1;
+	}
+
+	return 0;
+}
+
+struct rvtrace_component *rvtrace_find_by_fwnode(struct fwnode_handle *fwnode)
+{
+	struct rvtrace_fwnode_match_data d = { .fwnode = fwnode, .match = NULL };
+	int ret;
+
+	ret = bus_for_each_dev(&rvtrace_bustype, NULL, &d, rvtrace_match_fwnode);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	return d.match;
+}
+EXPORT_SYMBOL_GPL(rvtrace_find_by_fwnode);
+
+int rvtrace_poll_bit(struct rvtrace_platform_data *pdata, int offset,
+		     int bit, int bitval, int timeout)
+{
+	int i = 10;
+	u32 val;
+
+	while (i--) {
+		val = rvtrace_read32(pdata, offset);
+		if (((val >> bit) & 0x1) == bitval)
+			break;
+		udelay(timeout);
+	}
+
+	return (i < 0) ? -ETIMEDOUT : 0;
+}
+EXPORT_SYMBOL_GPL(rvtrace_poll_bit);
+
+int rvtrace_enable_component(struct rvtrace_component *comp)
+{
+	u32 val;
+
+	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val |= BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
+	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	return rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+				RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 1,
+				comp->pdata->control_poll_timeout_usecs);
+}
+EXPORT_SYMBOL_GPL(rvtrace_enable_component);
+
+int rvtrace_disable_component(struct rvtrace_component *comp)
+{
+	u32 val;
+
+	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
+	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	return rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+				RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 0,
+				comp->pdata->control_poll_timeout_usecs);
+}
+EXPORT_SYMBOL_GPL(rvtrace_disable_component);
+
+struct rvtrace_component *rvtrace_cpu_source(unsigned int cpu)
+{
+	if (!cpu_present(cpu))
+		return NULL;
+
+	return per_cpu(rvtrace_cpu_encoder, cpu);
+}
+EXPORT_SYMBOL_GPL(rvtrace_cpu_source);
+
+static int rvtrace_cleanup_inconn(struct device *dev, void *data)
+{
+	struct rvtrace_component *comp = to_rvtrace_component(dev);
+	struct rvtrace_platform_data *pdata = comp->pdata;
+	struct rvtrace_connection *conn = data;
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
+static void rvtrace_cleanup_inconns_from_outconns(struct rvtrace_component *comp)
+{
+	struct rvtrace_platform_data *pdata = comp->pdata;
+	struct rvtrace_connection *conn;
+	int i;
+
+	lockdep_assert_held(&rvtrace_mutex);
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		bus_for_each_dev(&rvtrace_bustype, NULL, conn, rvtrace_cleanup_inconn);
+	}
+}
+
+static int rvtrace_setup_inconn(struct device *dev, void *data)
+{
+	struct rvtrace_component *comp = to_rvtrace_component(dev);
+	struct rvtrace_platform_data *pdata = comp->pdata;
+	struct rvtrace_connection *conn = data;
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
+static int rvtrace_setup_inconns_from_outconns(struct rvtrace_component *comp)
+{
+	struct rvtrace_platform_data *pdata = comp->pdata;
+	struct rvtrace_connection *conn;
+	int i, ret;
+
+	lockdep_assert_held(&rvtrace_mutex);
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		ret = bus_for_each_dev(&rvtrace_bustype, NULL, conn, rvtrace_setup_inconn);
+		if (ret < 0) {
+			rvtrace_cleanup_inconns_from_outconns(comp);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void rvtrace_component_release(struct device *dev)
+{
+	struct rvtrace_component *comp = to_rvtrace_component(dev);
+
+	fwnode_handle_put(comp->dev.fwnode);
+	rvtrace_free_type_idx(comp);
+	kfree(comp);
+}
+
+static int rvtrace_component_reset(struct rvtrace_platform_data *pdata)
+{
+	int ret;
+
+	rvtrace_write32(pdata, 0, RVTRACE_COMPONENT_CTRL_OFFSET);
+	ret = rvtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+			       RVTRACE_COMPONENT_CTRL_ACTIVE_SHIFT, 0,
+			       pdata->control_poll_timeout_usecs);
+	if (ret)
+		return ret;
+
+	rvtrace_write32(pdata, RVTRACE_COMPONENT_CTRL_ACTIVE_MASK,
+			RVTRACE_COMPONENT_CTRL_OFFSET);
+	return rvtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+				RVTRACE_COMPONENT_CTRL_ACTIVE_SHIFT, 1,
+				pdata->control_poll_timeout_usecs);
+}
+
+struct rvtrace_component *rvtrace_register_component(struct rvtrace_platform_data *pdata)
+{
+	struct rvtrace_connection *conn;
+	struct rvtrace_component *comp;
+	u32 impl, type, major, minor;
+	int i, ret = 0;
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
+	ret = rvtrace_component_reset(pdata);
+	if (ret)
+		goto err_out;
+
+	impl = rvtrace_read32(pdata, RVTRACE_COMPONENT_IMPL_OFFSET);
+	type = (impl >> RVTRACE_COMPONENT_IMPL_TYPE_SHIFT) &
+		RVTRACE_COMPONENT_IMPL_TYPE_MASK;
+	major = (impl >> RVTRACE_COMPONENT_IMPL_VERMAJOR_SHIFT) &
+		RVTRACE_COMPONENT_IMPL_VERMAJOR_MASK;
+	minor = (impl >> RVTRACE_COMPONENT_IMPL_VERMINOR_SHIFT) &
+		RVTRACE_COMPONENT_IMPL_VERMINOR_MASK;
+
+	if (pdata->bound_cpu >= 0 && !cpu_present(pdata->bound_cpu)) {
+		ret = -EINVAL;
+		goto err_out;
+	}
+	if (type == RVTRACE_COMPONENT_TYPE_ENCODER && pdata->bound_cpu < 0) {
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
+	comp->id.type = type;
+	comp->id.version = rvtrace_component_mkversion(major, minor);
+	ret = rvtrace_alloc_type_idx(comp);
+	if (ret) {
+		kfree(comp);
+		goto err_out;
+	}
+
+	comp->dev.parent = pdata->dev;
+	comp->dev.coherent_dma_mask = pdata->dev->coherent_dma_mask;
+	comp->dev.release = rvtrace_component_release;
+	comp->dev.bus = &rvtrace_bustype;
+	comp->dev.fwnode = fwnode_handle_get(dev_fwnode(pdata->dev));
+	switch (comp->id.type) {
+	case RVTRACE_COMPONENT_TYPE_ENCODER:
+		dev_set_name(&comp->dev, "encoder-%d", comp->type_idx);
+		break;
+	case RVTRACE_COMPONENT_TYPE_FUNNEL:
+		dev_set_name(&comp->dev, "funnel-%d", comp->type_idx);
+		break;
+	case RVTRACE_COMPONENT_TYPE_RAMSINK:
+		dev_set_name(&comp->dev, "ramsink-%d", comp->type_idx);
+		break;
+	case RVTRACE_COMPONENT_TYPE_PIBSINK:
+		dev_set_name(&comp->dev, "pibsink-%d", comp->type_idx);
+		break;
+	case RVTRACE_COMPONENT_TYPE_ATBBRIDGE:
+		dev_set_name(&comp->dev, "atbbridge-%d", comp->type_idx);
+		break;
+	default:
+		dev_set_name(&comp->dev, "type%d-%d", comp->id.type, comp->type_idx);
+		break;
+	}
+
+	mutex_lock(&rvtrace_mutex);
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
+	ret = rvtrace_setup_inconns_from_outconns(comp);
+	if (ret < 0) {
+		device_unregister(&comp->dev);
+		goto err_out_unlock;
+	}
+
+	if (comp->id.type == RVTRACE_COMPONENT_TYPE_ENCODER) {
+		rvtrace_get_component(comp);
+		per_cpu(rvtrace_cpu_encoder, comp->pdata->bound_cpu) = comp;
+	}
+
+	mutex_unlock(&rvtrace_mutex);
+
+	return comp;
+
+err_out_unlock:
+	mutex_unlock(&rvtrace_mutex);
+err_out:
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(rvtrace_register_component);
+
+void rvtrace_unregister_component(struct rvtrace_component *comp)
+{
+	struct rvtrace_component *c;
+
+	mutex_lock(&rvtrace_mutex);
+
+	if (comp->id.type == RVTRACE_COMPONENT_TYPE_ENCODER) {
+		c = per_cpu(rvtrace_cpu_encoder, comp->pdata->bound_cpu);
+		per_cpu(rvtrace_cpu_encoder, comp->pdata->bound_cpu) = NULL;
+		rvtrace_put_component(c);
+	}
+
+	rvtrace_cleanup_inconns_from_outconns(comp);
+	device_unregister(&comp->dev);
+
+	mutex_unlock(&rvtrace_mutex);
+}
+EXPORT_SYMBOL_GPL(rvtrace_unregister_component);
+
+int __rvtrace_register_driver(struct module *owner, struct rvtrace_driver *rtdrv)
+{
+	rtdrv->driver.owner = owner;
+	rtdrv->driver.bus = &rvtrace_bustype;
+
+	return driver_register(&rtdrv->driver);
+}
+EXPORT_SYMBOL_GPL(__rvtrace_register_driver);
+
+static int __init rvtrace_init(void)
+{
+	int ret;
+
+	rvtrace_init_type_idx();
+
+	ret = bus_register(&rvtrace_bustype);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&rvtrace_platform_driver);
+	if (ret) {
+		bus_unregister(&rvtrace_bustype);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void __exit rvtrace_exit(void)
+{
+	platform_driver_unregister(&rvtrace_platform_driver);
+	bus_unregister(&rvtrace_bustype);
+}
+
+module_init(rvtrace_init);
+module_exit(rvtrace_exit);
diff --git a/drivers/hwtracing/rvtrace/rvtrace-platform.c b/drivers/hwtracing/rvtrace/rvtrace-platform.c
new file mode 100644
index 000000000000..6eb362880e5c
--- /dev/null
+++ b/drivers/hwtracing/rvtrace/rvtrace-platform.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Ventana Micro Systems Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/rvtrace.h>
+#include <linux/types.h>
+
+static int rvtrace_of_parse_outconns(struct rvtrace_platform_data *pdata)
+{
+	struct device_node *parent, *ep_node, *rep_node, *rdev_node;
+	struct rvtrace_connection *conn;
+	struct of_endpoint ep, rep;
+	int ret = 0, i = 0;
+
+	parent = of_get_child_by_name(dev_of_node(pdata->dev), "out-ports");
+	if (!parent)
+		return 0;
+
+	pdata->nr_outconns = of_graph_get_endpoint_count(parent);
+	pdata->outconns = devm_kcalloc(pdata->dev, pdata->nr_outconns,
+				       sizeof(*pdata->outconns), GFP_KERNEL);
+	if (!pdata->outconns) {
+		ret = -ENOMEM;
+		goto done;
+	}
+
+	for_each_endpoint_of_node(parent, ep_node) {
+		conn = devm_kzalloc(pdata->dev, sizeof(*conn), GFP_KERNEL);
+		if (!conn) {
+			of_node_put(ep_node);
+			ret = -ENOMEM;
+			break;
+		}
+
+		ret = of_graph_parse_endpoint(ep_node, &ep);
+		if (ret) {
+			of_node_put(ep_node);
+			break;
+		}
+
+		rep_node = of_graph_get_remote_endpoint(ep_node);
+		if (!rep_node) {
+			ret = -ENODEV;
+			of_node_put(ep_node);
+			break;
+		}
+		rdev_node = of_graph_get_port_parent(rep_node);
+
+		ret = of_graph_parse_endpoint(rep_node, &rep);
+		if (ret) {
+			of_node_put(ep_node);
+			break;
+		}
+
+		conn->src_port = ep.port;
+		conn->src_fwnode = dev_fwnode(pdata->dev);
+		/* The 'src_comp' is set by rvtrace_register_component() */
+		conn->src_comp = NULL;
+		conn->dest_port = rep.port;
+		conn->dest_fwnode = of_fwnode_handle(rdev_node);
+		fwnode_handle_get(conn->dest_fwnode);
+		conn->dest_comp = rvtrace_find_by_fwnode(conn->dest_fwnode);
+		if (!conn->dest_comp) {
+			ret = -EPROBE_DEFER;
+			of_node_put(ep_node);
+			break;
+		}
+
+		pdata->outconns[i] = conn;
+		i++;
+	}
+
+done:
+	if (ret) {
+		for (i = 0; i < pdata->nr_outconns; i++) {
+			conn = pdata->outconns[i];
+			if (conn && conn->dest_fwnode)
+				fwnode_handle_put(conn->dest_fwnode);
+		}
+	}
+	of_node_put(parent);
+	return ret;
+}
+
+static int rvtrace_of_parse_inconns(struct rvtrace_platform_data *pdata)
+{
+	struct device_node *parent;
+	int ret = 0;
+
+	parent = of_get_child_by_name(dev_of_node(pdata->dev), "in-ports");
+	if (!parent)
+		return 0;
+
+	pdata->nr_inconns = of_graph_get_endpoint_count(parent);
+	pdata->inconns = devm_kcalloc(pdata->dev, pdata->nr_inconns,
+				      sizeof(*pdata->inconns), GFP_KERNEL);
+	if (!pdata->inconns)
+		ret = -ENOMEM;
+
+	of_node_put(parent);
+	return ret;
+}
+
+static int rvtrace_platform_probe(struct platform_device *pdev)
+{
+	struct rvtrace_platform_data *pdata;
+	struct device *dev = &pdev->dev;
+	struct rvtrace_component *comp;
+	struct device_node *node;
+	struct resource *res;
+	int ret;
+
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+	pdata->dev = dev;
+	pdata->impid = RVTRACE_COMPONENT_IMPID_UNKNOWN;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+
+	pdata->io_mem = true;
+	pdata->base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	if (!pdata->base)
+		return dev_err_probe(dev, -ENOMEM, "failed to ioremap %pR\n", res);
+
+	pdata->bound_cpu = -1;
+	node = of_parse_phandle(dev_of_node(dev), "cpus", 0);
+	if (node) {
+		ret = of_cpu_node_to_id(node);
+		of_node_put(node);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "failed to get CPU id for %pOF\n", node);
+		pdata->bound_cpu = ret;
+	}
+
+	/* Default control poll timeout */
+	pdata->control_poll_timeout_usecs = 10;
+
+	ret = rvtrace_of_parse_outconns(pdata);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse output connections\n");
+
+	ret = rvtrace_of_parse_inconns(pdata);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse input connections\n");
+
+	comp = rvtrace_register_component(pdata);
+	if (IS_ERR(comp))
+		return PTR_ERR(comp);
+
+	platform_set_drvdata(pdev, comp);
+	return 0;
+}
+
+static void rvtrace_platform_remove(struct platform_device *pdev)
+{
+	struct rvtrace_component *comp = platform_get_drvdata(pdev);
+	struct rvtrace_platform_data *pdata = comp->pdata;
+	struct rvtrace_connection *conn;
+	int i;
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		if (conn && conn->dest_fwnode)
+			fwnode_handle_put(conn->dest_fwnode);
+	}
+
+	rvtrace_unregister_component(comp);
+}
+
+static const struct of_device_id rvtrace_platform_match[] = {
+	{ .compatible = "riscv,trace-component" },
+	{}
+};
+
+struct platform_driver rvtrace_platform_driver = {
+	.driver = {
+		.name		= "rvtrace",
+		.of_match_table	= rvtrace_platform_match,
+	},
+	.probe = rvtrace_platform_probe,
+	.remove = rvtrace_platform_remove,
+};
diff --git a/include/linux/rvtrace.h b/include/linux/rvtrace.h
new file mode 100644
index 000000000000..e8e055ad6583
--- /dev/null
+++ b/include/linux/rvtrace.h
@@ -0,0 +1,280 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Ventana Micro Systems Inc.
+ */
+
+#ifndef __LINUX_RVTRACE_H__
+#define __LINUX_RVTRACE_H__
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/types.h>
+
+/* Control register common across all RISC-V trace components */
+#define RVTRACE_COMPONENT_CTRL_OFFSET		0x000
+#define RVTRACE_COMPONENT_CTRL_ACTIVE_MASK	0x1
+#define RVTRACE_COMPONENT_CTRL_ACTIVE_SHIFT	0
+#define RVTRACE_COMPONENT_CTRL_ENABLE_MASK	0x1
+#define RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT	1
+#define RVTRACE_COMPONENT_CTRL_EMPTY_SHIFT	3
+
+/* Implementation register common across all RISC-V trace components */
+#define RVTRACE_COMPONENT_IMPL_OFFSET		0x004
+#define RVTRACE_COMPONENT_IMPL_VERMAJOR_MASK	0xf
+#define RVTRACE_COMPONENT_IMPL_VERMAJOR_SHIFT	0
+#define RVTRACE_COMPONENT_IMPL_VERMINOR_MASK	0xf
+#define RVTRACE_COMPONENT_IMPL_VERMINOR_SHIFT	4
+#define RVTRACE_COMPONENT_IMPL_TYPE_MASK	0xf
+#define RVTRACE_COMPONENT_IMPL_TYPE_SHIFT	8
+
+/* Possible component types defined by the RISC-V Trace Control Interface */
+enum rvtrace_component_type {
+	RVTRACE_COMPONENT_TYPE_RESV0,
+	RVTRACE_COMPONENT_TYPE_ENCODER, /* 0x1 */
+	RVTRACE_COMPONENT_TYPE_RESV2,
+	RVTRACE_COMPONENT_TYPE_RESV3,
+	RVTRACE_COMPONENT_TYPE_RESV4,
+	RVTRACE_COMPONENT_TYPE_RESV5,
+	RVTRACE_COMPONENT_TYPE_RESV6,
+	RVTRACE_COMPONENT_TYPE_RESV7,
+	RVTRACE_COMPONENT_TYPE_FUNNEL, /* 0x8 */
+	RVTRACE_COMPONENT_TYPE_RAMSINK, /* 0x9 */
+	RVTRACE_COMPONENT_TYPE_PIBSINK, /* 0xA */
+	RVTRACE_COMPONENT_TYPE_RESV11,
+	RVTRACE_COMPONENT_TYPE_RESV12,
+	RVTRACE_COMPONENT_TYPE_RESV13,
+	RVTRACE_COMPONENT_TYPE_ATBBRIDGE, /* 0xE */
+	RVTRACE_COMPONENT_TYPE_RESV15,
+	RVTRACE_COMPONENT_TYPE_MAX
+};
+
+/* Encoding/decoding macros for RISC-V trace component version */
+#define rvtrace_component_version_major(__version)	\
+	(((__version) >> 16) & 0xffff)
+#define rvtrace_component_version_minor(__version)	\
+	((__version) & 0xffff)
+#define rvtrace_component_mkversion(__major, __minor)	\
+	((((__major) & 0xffff) << 16) |	((__minor) & 0xffff))
+
+/*
+ * Possible component implementation IDs discovered from DT or ACPI
+ * shared across the RISC-V trace drivers to infer trace parameters,
+ * quirks, and work-arounds. These component implementation IDs are
+ * internal to Linux and must not be exposed to user-space.
+ *
+ * The component implementation ID should be named as follows:
+ *    RVTRACE_COMPONENT_IMPID_<vendor>_<part>
+ */
+enum rvtrace_component_impid {
+	RVTRACE_COMPONENT_IMPID_UNKNOWN,
+	RVTRACE_COMPONENT_IMPID_MAX
+};
+
+/**
+ * struct rvtrace_connection - Representation of a physical connection between
+ * two RISC-V trace components.
+ * @src_port:    A connection's source port number.
+ * @src_fwnode:  Source component's fwnode handle..
+ * @src_comp:    Source component's pointer.
+ * @dest_port:   A connection's destination port number.
+ * @dest_fwnode: Destination component's fwnode handle.
+ * @dest_comp:   Destination component's pointer.
+ */
+struct rvtrace_connection {
+	int src_port;
+	struct fwnode_handle *src_fwnode;
+	int dest_port;
+	struct fwnode_handle *dest_fwnode;
+	struct rvtrace_component *src_comp;
+	struct rvtrace_component *dest_comp;
+};
+
+/**
+ * struct rvtrace_platform_data - Platform-level data for a RISC-V trace component
+ * discovered from DT or ACPI.
+ * @dev:         Parent device.
+ * @impid:       Component implementation ID
+ * @io_mem:      Flag showing whether component registers are memory mapped.
+ * @base:        If io_mem == true then base address of the memory mapped registers.
+ * @read:        If io_mem == false then read register from the given "offset".
+ * @write:       If io_mem == false then write register to the given "offset".
+ * @bound_cpu:   CPU to which the component is bound. This should be -1 if
+ *               the component is not bound to any CPU. For encoder component
+ *               type this must not be -1.
+ * @nr_inconns:  Number of input connections.
+ * @inconns:     Array of pointers to input connections.
+ * @nr_outconns: Number of output connections.
+ * @outconns:    Array of pointers to output connections.
+ */
+struct rvtrace_platform_data {
+	struct device *dev;
+
+	enum rvtrace_component_impid impid;
+
+	bool io_mem;
+	union {
+		void __iomem *base;
+		struct {
+			u32 (*read)(struct rvtrace_platform_data *pdata,
+				    u32 offset, bool relaxed);
+			void (*write)(struct rvtrace_platform_data *pdata,
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
+	struct rvtrace_connection **inconns;
+
+	/*
+	 * Platform driver must fully populate pointer array with individual
+	 * array elements pointing to actual output connections. The src_comp
+	 * of each output connection is automatically updated at the time of
+	 * registering component.
+	 */
+	unsigned int nr_outconns;
+	struct rvtrace_connection **outconns;
+};
+
+static inline u32 rvtrace_read32(struct rvtrace_platform_data *pdata, u32 offset)
+{
+	if (likely(pdata->io_mem))
+		return readl(pdata->base + offset);
+
+	return pdata->read(pdata, offset, false);
+}
+
+static inline u32 rvtrace_relaxed_read32(struct rvtrace_platform_data *pdata, u32 offset)
+{
+	if (likely(pdata->io_mem))
+		return readl_relaxed(pdata->base + offset);
+
+	return pdata->read(pdata, offset, true);
+}
+
+static inline void rvtrace_write32(struct rvtrace_platform_data *pdata, u32 val, u32 offset)
+{
+	if (likely(pdata->io_mem))
+		writel(val, pdata->base + offset);
+	else
+		pdata->write(pdata, val, offset, false);
+}
+
+static inline void rvtrace_relaxed_write32(struct rvtrace_platform_data *pdata,
+					   u32 val, u32 offset)
+{
+	if (likely(pdata->io_mem))
+		writel_relaxed(val, pdata->base + offset);
+	else
+		pdata->write(pdata, val, offset, true);
+}
+
+static inline bool rvtrace_is_source(struct rvtrace_platform_data *pdata)
+{
+	return !pdata->nr_inconns ? true : false;
+}
+
+static inline bool rvtrace_is_sink(struct rvtrace_platform_data *pdata)
+{
+	return !pdata->nr_outconns ? true : false;
+}
+
+/**
+ * struct rvtrace_component_id - Details to identify or match a RISC-V trace component
+ * @type:      Type of the component
+ * @version:   Version of the component
+ * @data:      Data pointer for driver use
+ */
+struct rvtrace_component_id {
+	enum rvtrace_component_type type;
+	u32 version;
+	void *data;
+};
+
+/**
+ * struct rvtrace_component - Representation of a RISC-V trace component
+ * pdata:    Pointer to underlying platform data
+ * id:       Details to match the component
+ * type_idx: Unique number based on component type
+ * dev:      Device instance
+ * ready:    Flag showing whether RISC-V trace driver was probed successfully
+ */
+struct rvtrace_component {
+	struct rvtrace_platform_data *pdata;
+	struct rvtrace_component_id id;
+	u32 type_idx;
+	struct device dev;
+	bool ready;
+};
+
+#define to_rvtrace_component(__dev)	container_of_const(__dev, struct rvtrace_component, dev)
+
+static inline void rvtrace_get_component(struct rvtrace_component *comp)
+{
+	get_device(&comp->dev);
+}
+
+static inline void rvtrace_put_component(struct rvtrace_component *comp)
+{
+	put_device(&comp->dev);
+}
+
+const struct rvtrace_component_id *rvtrace_match_id(struct rvtrace_component *comp,
+						    const struct rvtrace_component_id *ids);
+struct rvtrace_component *rvtrace_find_by_fwnode(struct fwnode_handle *fwnode);
+
+int rvtrace_poll_bit(struct rvtrace_platform_data *pdata, int offset,
+		     int bit, int bitval, int timeout);
+int rvtrace_enable_component(struct rvtrace_component *comp);
+int rvtrace_disable_component(struct rvtrace_component *comp);
+
+struct rvtrace_component *rvtrace_cpu_source(unsigned int cpu);
+
+struct rvtrace_component *rvtrace_register_component(struct rvtrace_platform_data *pdata);
+void rvtrace_unregister_component(struct rvtrace_component *comp);
+
+/**
+ * struct rvtrace_driver - Representation of a RISC-V trace driver
+ * id_table: Table to match components handled by the driver
+ * probe:    Driver probe() function
+ * remove:   Driver remove() function
+ * driver:   Device driver instance
+ */
+struct rvtrace_driver {
+	const struct rvtrace_component_id *id_table;
+	int			(*probe)(struct rvtrace_component *comp);
+	void			(*remove)(struct rvtrace_component *comp);
+	struct device_driver	driver;
+};
+
+#define to_rvtrace_driver(__drv)   \
+	((__drv) ? container_of_const((__drv), struct rvtrace_driver, driver) : NULL)
+
+extern struct platform_driver rvtrace_platform_driver;
+
+int __rvtrace_register_driver(struct module *owner, struct rvtrace_driver *rtdrv);
+#define rvtrace_register_driver(driver) __rvtrace_register_driver(THIS_MODULE, driver)
+static inline void rvtrace_unregister_driver(struct rvtrace_driver *rtdrv)
+{
+	if (rtdrv)
+		driver_unregister(&rtdrv->driver);
+}
+
+static inline int rvtrace_comp_is_empty(struct rvtrace_component *comp)
+{
+	return rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
+				RVTRACE_COMPONENT_CTRL_EMPTY_SHIFT, 1,
+				comp->pdata->control_poll_timeout_usecs);
+}
+
+#endif
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
