Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA3ECA5FB3
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 05:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jdclbav0RZ9KWV1pt7EgvW8Y0MQn1SS3CxPEBd8Rrwk=; b=C/4dFLjAVJvVl1
	uGD8CGLshEAf96GM53h3iq8YKMrsIo/uvqJIFkDc6M0O5ax0GApybtVqaGP2dSj3i+0UjiO0Aj4XH
	/roHD35CO/QWYbgVIqYrY6gR4nK1cw4CidiEaplSACKdGJ9S6bSxfs/1cDbGK757WauPFP1kOZNBa
	0fUgXg8i7HVXgBl8xeLXNZLCMqVDuQoLqvfWn7LLWDzIv4dhZakzrmFMvmymEPrSPZgDAvlpc8iKJ
	uXgtdaECQGUGvCc8dWdE3fQWZ0eCYmXTrb77kYDdwHAm0yId471x9iiD8cvYrt6mgaBHKa4NSWUBH
	HL60++tybi/m/yczpLnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9IA-00000007oHg-1nXj;
	Thu, 01 Oct 2026 05:25:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9I8-00000007oE0-0OSC
	for linux-riscv@bombadil.infradead.org;
	Thu, 01 Oct 2026 05:25:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=N3NTLUpYd7ZKV17LvK4wnaZohbRNGYM6kX6pL9COets=; b=WiWhifcj3mvL7ZFr7IvfOvh1b/
	dOhvMmGQqSL4zboKJeDb7eizYqtTv3OiR46ty0vh60JW8fHwkeDSiAsU6u027hPb4OcEa3PgjNIEh
	0xJlYu4dZ1OPsTQyYfDb3NEDq2EQemcJzjgvrm/pVrGGd/wDU/I7vbHa4ZBnUAJWvP2hARb4yV45L
	aKtI1T8RSFHIpbosSMGLbZKeoXm+qQ625l747M9fmUrfGJsiAawAWd2ExIngoojMmkbXW3orYZosJ
	jBZ/IQ7j7vbZKLDEGv12/dAG45qlvL6WKxn8FvbJmrqghgR/8u6TsZoxNn85gp0JMPqArROaE4IEx
	vWoa3YzA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xC9Hr-00000004arI-3g8m
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 05:25:04 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913gWHI1914826
	for <linux-riscv@lists.infradead.org>; Thu, 1 Oct 2026 05:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N3NTLUpYd7Z
	KV17LvK4wnaZohbRNGYM6kX6pL9COets=; b=Qeq9YtvyXFGxWXutdQENY5A1iof
	atlKMPoYLRBPf9c6DvRgv5x5fN+enXGo41ELr2TH5h2CFJjPEkYdgXvDYjij2inr
	YFaiVF/6ZmkDR6OW8B43NBENvyfJ65/BUVfUujKEFH8GgabTZDFUmS3fHGq98dz7
	BLc31PCm3WUWfrd9FhTaI5QCQab3gIteBaHuz2rr4vT/FbyyA2CDncNZJAie8PZ9
	cEctemuUp4SEL/XlDAfVAN8oZSJDKYs6CRRBY0J7EaWOjlXcrFXQCIWU0BaENozI
	+uXByGvf3Elq8pe8JhwQg/PSInmOGkZYTiyFdd0XoGK4cojuaW941Zu9KkQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h14n233j2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 05:24:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2df5a65671eso6104705ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 22:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790832292; x=1791437092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N3NTLUpYd7ZKV17LvK4wnaZohbRNGYM6kX6pL9COets=;
        b=O3k1oZSsONZepPBz69RuztykE8nrKiB0PIPPM3PLRCK91hMA9ZaPmbTns76d2hQqk9
         /NSlBRrLJbcy1bhn4a+oNBlBDlAt8NPqK9PhBdrIDBiximjJ6Fz0Z28Fb3IcKPvXRMCM
         pzTwFeOKEMyM0G/HJlCUdpZtzNF4F2Q+GsOCUGeRoYj3AeCzMpVI0EZIAr85fY6pdxFp
         5LDSmCpfD6K6NjmgNxF/pW7UFgL4YCCYoWw3zPVA90y9KVjMV4jkpM2hXctG5bLwsGxY
         7acfrG7uFbUgDuJg+n2LPhtLX8D7A3OApHCBSOzNJ3HpAOmpYagiUlK8+rOYxSVXMvMt
         6IoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832292; x=1791437092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N3NTLUpYd7ZKV17LvK4wnaZohbRNGYM6kX6pL9COets=;
        b=kxDcbctwKK2zk+sEDWhaGenOM5tyEGFt8QFxfnO+03jQahFNlut/dJY0jN8a37Rl4O
         NrzFWZIfe47IE0Gc8MT0kZRcymGrQgScq0r+MTagH8bOXnddU60lfaMCqqSxjbaSl3Iy
         FdtmMQosos0s7Ibdi4wQVmGlbiVoCo1taN/igkf+uwUDcF72Z28QtkpANfOmVmDwkwaI
         LiRHmbh7r+U0d7EUCZzMmpvfBDsA/WiY1euSoNxynPenxsTHadaCSFcr1GurX2saavI6
         W0giZZ/aQlW4GV6ivX2YJMNyG2oTGXnhT3NHkfEQ6c39MODduNXBp17MxfDbUJR+CoZi
         jMBA==
X-Forwarded-Encrypted: i=1; AKwUvBwuXolET8JlxUmgUAFC7hPleLFYhcoyOpUDbIk5TMEwuiD64BYwdg3l9WJbGpCJQdF8UNCTxr6j+kSomQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIxDzWFH+wvSdGelHQcpf2+W6thG2+rPHDr1h23MD/E6FKfI0XC
	PGcZ5ayicAR75o5JB+YJLY7EFIOY0NpPDbuamvCZImAf+mqVDHCmdmVeUmWY3Ju/J0+yfpQLIaE
	eiUnPXeta6Yd1ETK8Qhu/irS8Fh9wrqHHRYbf7mSAqJzRB2YubRE67TmKPY+q5YQ7dxv+0EQ=
X-Gm-Gg: AYBFou2h2o6ozsZ6j96HgT0Wo29kDcZAI7yzXs0bLZ3GNOnHsEBaJ6QixWyodybq9ry
	MH6JsoF9mKzcy08zlzZ4waDTVd/oK5RbnBejAKzJaBJgTZ9IglgvbSOnuK7OrdebFmz1v4CSq4N
	7+cNfZe0x3Sz/I99dNnGiuIS2nutP42DrlZkJPEizgsjFXqxzvlGilbAXUjatkIVw4e63ExCihK
	zIfehtL0/n5T4MEEa6/my3Wa42DczKPKf0DGz8eIh1VhvbnwQh15odN1LjJW4oEJCJW5BZq69SD
	9/c3uecA53Qkn/hVTtMYynyFL/1eM7gwyMDnp3XDlbG43pz0Nj88k+2p8Y6iWD3p1D88R1b/ESL
	CsEDf/u8eJ0gpZFN+xxThyaQiaZ1ettQ3Y7DVGASWTIv340sS5SKTaL5lpe/UGLp5U9azGkpWA7
	zS99zfYedcl/V1JPk7N4ygY/xF
X-Received: by 2002:a17:902:e94d:b0:2df:a59f:b141 with SMTP id d9443c01a7336-2e30029b5f4mr9967335ad.30.1790832291889;
        Wed, 30 Sep 2026 22:24:51 -0700 (PDT)
X-Received: by 2002:a17:902:e94d:b0:2df:a59f:b141 with SMTP id d9443c01a7336-2e30029b5f4mr9967175ad.30.1790832291356;
        Wed, 30 Sep 2026 22:24:51 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e300b851b9sm5152715ad.78.2026.09.30.22.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:24:50 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v6 11/14] gtrace: Add perf driver for tracing using perf tool
Date: Thu,  1 Oct 2026 10:52:22 +0530
Message-ID: <20261001052243.3042627-12-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=Gr3XaU1C c=1 sm=1 tr=0 ts=6abdeea5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=nFZh5ErKNFa2br0MvREA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX8tcv7n+kBoC9
 VAsqrxq1HBvMticD4+cMTEtug5IQzHD9nJ/IEJWY2fWWR5TDcIPSpkP13t/r8nnNNLxYg6Xevcb
 yiAh0CvaJWqcMFMMeo5wTCvq7pYrXXE=
X-Proofpoint-GUID: 3ncbV4LLDXMiYh6OrMiDz7pRFOyqPlja
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX2QjO8Rjwq/AQ
 J8uMpvYnDUv/LdEi79/4XKFEFvJui4gOMX3yZ+mvsxUW6t7yW6k3/w9r43J+t1dSDruBHFrs3HN
 zLstJl+jAHtF1YEXZdAk1lempdQ73Zt2yCfORQAe5DHe8z3r40K41I98QbRGs5+7+SJ252G/CbB
 EbmmwUwa5aWTuRZ7qlbLmHieDpPlub9Fs+Fi++++wIrh2/ddJRkJHeIi93bfpDhHa4iLtLN04U6
 qG+Uy33Kuv7mtzlUxgUVIl9j24zgeCONyXvblYAdeSS+Rpo8bF/Z+UbDqZZmrJuuTRsxlzrvgs7
 o8W/5gZDVQumawJeJR1PNDiEVCjezvRInKQp+n+al6GlCBalLmchPyaEijSRLIXRVGLYInC3Yat
 jED4906Cxnq6jvYK//HwJuDp7p1GHUJpmwGsnk3DSfuyhQFPJzOjfDH65sE1KP7FnJwymHgkx5E
 VhVaQJ1OTBNuzhFsBJg==
X-Proofpoint-ORIG-GUID: 3ncbV4LLDXMiYh6OrMiDz7pRFOyqPlja
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_062500_888122_DA8461A6 
X-CRM114-Status: GOOD (  32.48  )
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

Add perf driver for the gtrace similar to ARM Coresight and Hisilicon
PTT drivers. The driver adds 'gtrace' event descriptor which can be used
by the perf tool to record the trace data. The actual data format depends
on type of encoder device and optionally the PMU specific trace format
type.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/Kconfig       |   1 +
 drivers/hwtracing/gtrace/Makefile      |   2 +-
 drivers/hwtracing/gtrace/gtrace-core.c |  15 +-
 drivers/hwtracing/gtrace/gtrace-perf.c | 390 +++++++++++++++++++++++++
 include/linux/gtrace.h                 |   3 +
 5 files changed, 409 insertions(+), 2 deletions(-)
 create mode 100644 drivers/hwtracing/gtrace/gtrace-perf.c

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index de4a3b533591..e5b62d65e2fd 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -3,6 +3,7 @@
 menuconfig GTRACE
 	tristate "Generic Hardware Trace Support"
 	depends on OF
+	select PERF_EVENTS
 	help
 	  This framework provides an architecture-neutral kernel interface
 	  for hardware trace drivers. It builds a topological view of the
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index 31262cf5993d..33274a1ed0b8 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_GTRACE) += gtrace.o
-gtrace-y := gtrace-core.o
+gtrace-y := gtrace-core.o gtrace-perf.o
 gtrace-$(CONFIG_OF) += gtrace-of.o
 
 obj-$(CONFIG_RVTRACE) += rvtrace-platform.o
diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index acbeb3df2135..034987237abc 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -828,13 +828,26 @@ EXPORT_SYMBOL_GPL(__gtrace_register_driver);
 
 static int __init gtrace_init(void)
 {
+	int ret;
+
 	gtrace_init_type_idx();
 
-	return bus_register(&gtrace_bustype);
+	ret = bus_register(&gtrace_bustype);
+	if (ret)
+		return ret;
+
+	ret = gtrace_perf_init();
+	if (ret) {
+		bus_unregister(&gtrace_bustype);
+		return ret;
+	}
+
+	return 0;
 }
 
 static void __exit gtrace_exit(void)
 {
+	gtrace_perf_exit();
 	bus_unregister(&gtrace_bustype);
 }
 
diff --git a/drivers/hwtracing/gtrace/gtrace-perf.c b/drivers/hwtracing/gtrace/gtrace-perf.c
new file mode 100644
index 000000000000..928f0405c6c1
--- /dev/null
+++ b/drivers/hwtracing/gtrace/gtrace-perf.c
@@ -0,0 +1,390 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/cpumask.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/list.h>
+#include <linux/mm.h>
+#include <linux/init.h>
+#include <linux/perf_event.h>
+#include <linux/vmalloc.h>
+#include <linux/percpu-defs.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/stringhash.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+#include <linux/gtrace.h>
+
+#define GTRACE_PMU_NAME "gtrace"
+static struct pmu gtrace_pmu;
+static struct workqueue_struct *gtrace_wq;
+
+/**
+ * struct gtrace_event_data - generic hardware trace perf event data
+ * @work:		Handle to free allocated memory outside IRQ context.
+ * @mask:		Hold the CPU(s) this event was set for.
+ * @aux_hwid_done:	Whether a CPU has emitted the TraceID packet or not.
+ * @path:		An array of path, each slot for one CPU.
+ * @buf:		Aux buffer / pages allocated by perf framework.
+ */
+struct gtrace_event_data {
+	struct work_struct work;
+	cpumask_t mask;
+	cpumask_t aux_hwid_done;
+	struct gtrace_path * __percpu *path;
+	struct gtrace_perf_auxbuf buf;
+};
+
+struct gtrace_ctxt {
+	struct perf_output_handle handle;
+	struct gtrace_event_data *event_data;
+};
+
+static DEFINE_PER_CPU(struct gtrace_ctxt, gtrace_ctxt);
+
+static void *alloc_event_data(int cpu)
+{
+	struct gtrace_event_data *event_data;
+	cpumask_t *mask;
+
+	event_data = kzalloc_obj(*event_data);
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
+	event_data->path = alloc_percpu(struct gtrace_path *);
+	if (!event_data->path) {
+		kfree(event_data);
+		return NULL;
+	}
+
+	return event_data;
+}
+
+static void gtrace_free_aux(void *data)
+{
+	struct gtrace_event_data *event_data = data;
+
+	queue_work(gtrace_wq, &event_data->work);
+}
+
+static struct gtrace_path **gtrace_event_cpu_path_ptr(struct gtrace_event_data *data,
+							int cpu)
+{
+	return per_cpu_ptr(data->path, cpu);
+}
+
+static void free_event_data(struct work_struct *work)
+{
+	struct gtrace_event_data *event_data;
+	struct gtrace_path *path;
+	cpumask_t *mask;
+	int cpu;
+
+	event_data = container_of(work, struct gtrace_event_data, work);
+	mask = &event_data->mask;
+	for_each_cpu(cpu, mask) {
+		path = *gtrace_event_cpu_path_ptr(event_data, cpu);
+		gtrace_destroy_path(path);
+	}
+	if (event_data->buf.base)
+		vunmap(event_data->buf.base);
+	free_percpu(event_data->path);
+	kfree(event_data);
+}
+
+static void *gtrace_setup_aux(struct perf_event *event, void **pages,
+			       int nr_pages, bool overwrite)
+{
+	struct gtrace_event_data *event_data = NULL;
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
+		struct gtrace_component *src;
+		struct gtrace_path *path;
+
+		src = gtrace_cpu_source(cpu);
+		if (!src) {
+			cpumask_clear_cpu(cpu, mask);
+			continue;
+		}
+
+		path = gtrace_create_path(src, NULL, GTRACE_COMPONENT_MODE_PERF);
+		if (IS_ERR(path)) {
+			cpumask_clear_cpu(cpu, mask);
+			continue;
+		}
+
+		path->owner = task_pid_nr(event->owner);
+		*gtrace_event_cpu_path_ptr(event_data, cpu) = path;
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
+	kfree(pagelist);
+	if (!event_data->buf.base)
+		goto err;
+
+	event_data->buf.nr_pages = nr_pages;
+	event_data->buf.length = nr_pages * PAGE_SIZE;
+	event_data->buf.pos = 0;
+	return event_data;
+err:
+	gtrace_free_aux(event_data);
+	return NULL;
+}
+
+static u64 gtrace_path_aux_format(struct gtrace_path *path)
+{
+	struct gtrace_component *src = gtrace_path_source(path);
+
+	switch (src->pdata->format) {
+	case GTRACE_FORMAT_ETRACE:
+		return PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE;
+	case GTRACE_FORMAT_NTRACE:
+		return PERF_AUX_FLAG_GTRACE_FORMAT_NTRACE;
+	default:
+		return PERF_AUX_FLAG_GTRACE_FORMAT_UNKNOWN;
+	}
+}
+
+static void gtrace_event_read(struct perf_event *event)
+{
+}
+
+static void gtrace_event_destroy(struct perf_event *event)
+{
+}
+
+static int gtrace_event_init(struct perf_event *event)
+{
+	if (event->attr.type != gtrace_pmu.type)
+		return -EINVAL;
+
+	event->destroy = gtrace_event_destroy;
+	return 0;
+}
+
+static void gtrace_event_start(struct perf_event *event, int flags)
+{
+	struct gtrace_ctxt *ctxt = this_cpu_ptr(&gtrace_ctxt);
+	struct perf_output_handle *handle = &ctxt->handle;
+	struct gtrace_event_data *event_data;
+	int cpu = smp_processor_id();
+	struct gtrace_path *path;
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
+	path = *gtrace_event_cpu_path_ptr(event_data, cpu);
+	if (!path) {
+		dev_err_ratelimited(gtrace_pmu.dev, "Error. Path not found on cpu %d\n", cpu);
+		goto fail_end;
+	}
+
+	if (gtrace_path_start(path)) {
+		dev_err_ratelimited(gtrace_pmu.dev, "Error. Tracing not started on cpu %d\n", cpu);
+		goto fail_end;
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
+fail_end:
+	perf_aux_output_end(handle, 0);
+fail:
+	event->hw.state = PERF_HES_STOPPED;
+}
+
+static void gtrace_event_stop(struct perf_event *event, int mode)
+{
+	struct gtrace_ctxt *ctxt = this_cpu_ptr(&gtrace_ctxt);
+	struct perf_output_handle *handle = &ctxt->handle;
+	u64 format = PERF_AUX_FLAG_GTRACE_FORMAT_UNKNOWN;
+	struct gtrace_event_data *event_data;
+	int ret, cpu = smp_processor_id();
+	struct gtrace_path *path;
+	size_t size = 0;
+
+	if (event->hw.state == PERF_HES_STOPPED)
+		return;
+
+	if (handle->event && WARN_ON(perf_get_aux(handle) != ctxt->event_data))
+		return;
+
+	event_data = ctxt->event_data;
+	ctxt->event_data = NULL;
+
+	if (WARN_ON(!event_data))
+		return;
+
+	if (!cpumask_test_cpu(cpu, &event_data->mask))
+		goto out_end;
+
+	/* stop tracing */
+	path = *gtrace_event_cpu_path_ptr(event_data, cpu);
+	if (!path) {
+		dev_err_ratelimited(gtrace_pmu.dev, "Error. Path not found on cpu %d\n", cpu);
+		goto out_end;
+	}
+
+	if (gtrace_path_stop(path)) {
+		dev_err_ratelimited(gtrace_pmu.dev, "Error. Tracing not stopped on cpu %d\n", cpu);
+		goto out_end;
+	}
+
+	event->hw.state = PERF_HES_STOPPED;
+	if (handle->event && (mode & PERF_EF_UPDATE)) {
+		if (WARN_ON_ONCE(handle->event != event))
+			return;
+		ret = gtrace_path_copyto_auxbuf(path, &event_data->buf, &size, &format);
+		WARN_ON_ONCE(ret);
+		format = gtrace_path_aux_format(path);
+		if (READ_ONCE(handle->event)) {
+			/* Tag the AUX data with the source's trace format. */
+			perf_aux_output_flag(handle, format);
+			if (size > handle->size) {
+				size = handle->size;
+				perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
+			}
+			perf_aux_output_end(handle, size);
+		} else
+			WARN_ON(size);
+	}
+
+	return;
+
+out_end:
+	event->hw.state = PERF_HES_STOPPED;
+	if (handle->event && (mode & PERF_EF_UPDATE))
+		perf_aux_output_end(handle, 0);
+}
+
+static int gtrace_event_add(struct perf_event *event, int mode)
+{
+	struct hw_perf_event *hwc = &event->hw;
+	int ret = 0;
+
+	if (mode & PERF_EF_START) {
+		gtrace_event_start(event, 0);
+		if (hwc->state & PERF_HES_STOPPED)
+			ret = -EINVAL;
+	} else {
+		hwc->state = PERF_HES_STOPPED;
+	}
+
+	return ret;
+}
+
+static void gtrace_event_del(struct perf_event *event, int mode)
+{
+	gtrace_event_stop(event, PERF_EF_UPDATE);
+}
+
+PMU_FORMAT_ATTR(event, "config:0-0");
+
+static struct attribute *gtrace_pmu_formats_attr[] = {
+	&format_attr_event.attr,
+	NULL,
+};
+
+static struct attribute_group gtrace_pmu_format_group = {
+	.name = "format",
+	.attrs = gtrace_pmu_formats_attr,
+};
+
+static const struct attribute_group *gtrace_pmu_attr_groups[] = {
+	&gtrace_pmu_format_group,
+	NULL,
+};
+
+int __init gtrace_perf_init(void)
+{
+	int ret;
+
+	gtrace_pmu.capabilities	= (PERF_PMU_CAP_EXCLUSIVE | PERF_PMU_CAP_ITRACE);
+	gtrace_pmu.attr_groups		= gtrace_pmu_attr_groups;
+	gtrace_pmu.task_ctx_nr		= perf_sw_context;
+	gtrace_pmu.read		= gtrace_event_read;
+	gtrace_pmu.event_init		= gtrace_event_init;
+	gtrace_pmu.setup_aux		= gtrace_setup_aux;
+	gtrace_pmu.free_aux		= gtrace_free_aux;
+	gtrace_pmu.start		= gtrace_event_start;
+	gtrace_pmu.stop		= gtrace_event_stop;
+	gtrace_pmu.add			= gtrace_event_add;
+	gtrace_pmu.del			= gtrace_event_del;
+	gtrace_pmu.module		= THIS_MODULE;
+
+	gtrace_wq = alloc_workqueue(GTRACE_PMU_NAME, WQ_UNBOUND, 0);
+	if (!gtrace_wq)
+		return -ENOMEM;
+
+	ret = perf_pmu_register(&gtrace_pmu, GTRACE_PMU_NAME, -1);
+	if (ret)
+		destroy_workqueue(gtrace_wq);
+
+	return ret;
+}
+
+void __exit gtrace_perf_exit(void)
+{
+	perf_pmu_unregister(&gtrace_pmu);
+	/* Wait for any pending free_event_data() before the module exits. */
+	destroy_workqueue(gtrace_wq);
+}
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index ed0e751faa91..da8ba3779193 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -326,4 +326,7 @@ static inline void gtrace_unregister_driver(struct gtrace_driver *gtdrv)
 		driver_unregister(&gtdrv->driver);
 }
 
+int gtrace_perf_init(void);
+void gtrace_perf_exit(void);
+
 #endif /* __LINUX_GTRACE_H__ */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
