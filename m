Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6107606A323
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 09:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zBUb8riy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T3KN6h1O;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cAKn4+mr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XCKsGbR/SS4L5HyxdbvbipTftXMpgYsZUPLoct/wKdk=; b=zBUb8riyo13616qFba0WeScMtK
	mhLrxMp+NEM5oera6EdE7X0uRm7WgmEhdi50bSbtEBZnJtV9hZ32lL5xYuBKWvEK726pcK/UZ4IpV
	MigV/I8ax0OIrPJOGWz73DbT5Qx5r4kfsdnFkRRU2SxjOy6P/UyKWciVGkvDpCar5nCY0eDjwhvBt
	ewH0unBd5u7dpUkyRGAWJnwwuaWezUbdmchGCcpElFISrFE34yURXba5cvmGsidmhKbp6SPmuvFJW
	kqpMbe6xIhdMy/Y2vOmrDRswBtMyEeQFgDJc7Cgz2clrRU0sJoQuCWCVzAtaterE/luCleaLrqv2c
	x3K/lkug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWEP-0000000CfQy-2hgr;
	Thu, 26 Nov 2026 09:57:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWEM-0000000CfMy-0FTp
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 09:57:32 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7Ar1X2885418
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 09:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=clIofcAE42H
	GKFzDZuAl5/Ri5+ErQ87/aP/g+SxjZFg=; b=T3KN6h1Oo9Zi4dHRqbJz98Z3yqA
	VhT4wmQKmX8JeJspJ0jdx/2wk6WZvXJ+wCRLw1oe86Mpr/7wwCC2DCoao0ArDcnB
	VPqOmBtbq/fALrAbuRPdgscU4lyQPuRIjqzt+c1ucDmHV7KJ9xPM6AtBygiqR0De
	CHX48POpAHEJvBG3CIZzr/5SvrFOfLR7cf3x1X1hX2BqjV6aAhHpXrFme2xMTWL5
	J6bvMZhTyIm5ofqo4rL5hcW9TYBIzE4REQ2FZUw0A72ks77K6P8I1VNw/hynyloT
	ox4VhSDxrSUvx3kydJF3aWNq23nS9zTYd2NuLLUbjC8WlY0oKTwrqLVWIzQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rgvmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 09:57:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b40b011aa4so8185537a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 01:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687049; x=1796291849; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=clIofcAE42HGKFzDZuAl5/Ri5+ErQ87/aP/g+SxjZFg=;
        b=cAKn4+mrn9kDF3vA0oqoRYmStINQh7dikT93T+EqWAF+YeeJAIE+AjxgOTDLEL+IiJ
         kfS9Tpth34vCC66MWW2WkOmVvFZE4ZhrtIKpoqUJj4D5zZPEZ0sJgTiqBA5Lz92yOYoQ
         iGmKsTOKrXJBzJLleOlkn+XOM4826URUY89qv5oUDQdSehQrvJQGkTtS6Da7g/DF6UOL
         QxpYhlY4kKl/m/iT54WcIzkRjBll8CvyvkeEf7+/3elNGU83+quuI14ajLa3rWfG+VFa
         YwpYJBPV6XAIoRZ/gyBvfNpSqnEbivmMWTSCUNjvyM1fLCMQ5niQM7Nxdu+pojLUiRUp
         nT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687049; x=1796291849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=clIofcAE42HGKFzDZuAl5/Ri5+ErQ87/aP/g+SxjZFg=;
        b=wjYFnQQzracOlaT44mZpKsZqB3C5JEBg9Xo8bQkR5KguA6ZhU00Ma1NMOBDoB46kJW
         B/bKeiNaso7X0udNWuHRqAJEAItfOqHaclnrdTke994gOMt3tHh56XyZb/lxZgKOAoG8
         Be8EcPzrtfEU3Cc5Hx7LCFueTSkL/b8wTAB2smtqIoxiD2OoFsfgNDMxip2vcToRANy2
         xgwIkNFoJtvxSe2BfUZnXWqd4bYgUC4XopZjSEpzccLzjBJuKbJyXk2Ib9u63XJZo0SC
         beqzkbWoQDlvzHuTDSUwfa3fKsuz/CFEp7fGKx7k+gc2D0OFq6JjJHKS2SYnQbTF2Tzn
         dnRw==
X-Forwarded-Encrypted: i=1; AL+hErGUqJa3vEZ0gnjM6D5/sYbVKgLn0pa89SK2hQi9WJXR4Rj06PP+/dlHQrtxydgXOpu6zOkyBT0MkdTLMg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/Al1nylrTtL9Z+j25Q1rpUwfg986hvqxIiXW6ipIdf3zXCmSDu
	w72IXub1gvPZ3c3MYXFSHLx7Hy7ORrw7B5TMZ0yAPX83LhwMxJ8gsXEHTdVj0Ydj+tbH24ciE71
	edddcyx3S04WygshEQ/gNTAwlkaBwonSVMkXHvWg3CcSrqm3qY12Gy9gS20HvzrZRHb57xbY=
X-Gm-Gg: AZFdTZdIbzujiUQylaem8upRHTN2RSlwGtPrSJM24eOZoy18J41g5B2dhMZNKrfX/Gl
	hV3RWZdpiHts6R+l0xq+aP4Idl4dJ224hBqyaURFrnAYooIq42BEzz12z5XQC2XFrCIs0z6i00S
	QYSBKmEkuvbWiz/uGinX84BTWxZ8kVexo2nlDXzgi8lguXjlKb2VwWVs2bJHaQ4pXrTu4mMA6lq
	1YO4fj5A4q8HUEaNVeusD91Zz7aKzTWg228/2iwmxwJSLnWOM/xBx4kSiCK9gA7VdnIzLvr1DwB
	mLLmueYxy4IEbK99G2dX36TLy9XrNGpcKbeNDbO2a8zFTKE/Nl7Da13WMZ5X59VuKSjg9cpgFn3
	SyxHNcFzz40sBIZWitN5NMfJmj5krY12KOdkG3t8n5B1vHFFUJDYnVd2wKlZoJ+HRKpIEIz9dQs
	5WYRlG1YWU5pq6Ww8P32JoSPan6+4GMGkaQeznf1xk4NKycmh2BqqYLZQwm16Ddr1JMLbpoEKDo
	w==
X-Received: by 2002:a17:90b:2d06:b0:3b5:a3:4424 with SMTP id 98e67ed59e1d1-3b500a3461fmr3748052a91.38.1795687048709;
        Thu, 26 Nov 2026 01:57:28 -0800 (PST)
X-Received: by 2002:a17:90b:2d06:b0:3b5:a3:4424 with SMTP id 98e67ed59e1d1-3b500a3461fmr3748012a91.38.1795687048100;
        Thu, 26 Nov 2026 01:57:28 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:57:27 -0800 (PST)
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
Subject: [PATCH v7 11/14] gtrace: Add perf driver for tracing using perf tool
Date: Thu, 26 Nov 2026 15:25:32 +0530
Message-ID: <52d43c11157ac39610889fed1d7192c9f5a82a0c.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX9gbF3T1ziwi0
 qYCLcWJihuPdBOG/13vrw24jRrWsU7C+L5FSIsn4vXc27ozw3b23d8QHVcz9tqWcA1+WwjmnNBV
 HLR8EOLksp7QEm9LQX5qIksP21QNZxTyaQ+QTQhEBvvL0qOMdyVMhVBJOPOq1BA9+dg32LWv7sG
 bP799mupBRK7Gj0OPk4vev4RZZQD12ABd340oqv58YuYJrN91md7r5cv/zDkYCmmwov06DDl2pg
 9cM7TJ7AnZT2/Ununwptb8j07+tW4BlIkAVYSWx6E72HZWiSkh8jsibKRfNHXzACyw1IrG006uV
 cWNIG61kjVMSlIDRJhNcubmjm+TYlCCq3BAKErLz7QxT/TH7xa+LNRC+Ndm9oiDUfjJP1qUx1EQ
 XfMATKm5CbmivXmkynD6S0fYKtzzrjgy9g7jSp9Y2I/7X0ZzGidBT/Y7Sf/ht3xyXfosidZ5QSU
 Ean3CnvBzTODrSebIAw==
X-Proofpoint-GUID: Esrkowqf4dncPD1zvVJ5GcDmVlVKtaZt
X-Proofpoint-ORIG-GUID: Esrkowqf4dncPD1zvVJ5GcDmVlVKtaZt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX76QIs22q3CM9
 FdtCZqFWRL460QkLEvYqz1xp0JtZW+hjoAqlCnsI4JUNBU5+r+dlB70Oc6fL6S+K13vh95DRdqt
 gxAV8jyOffhhUfGx6dRkfp9kSy1jQhA=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b080289 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=7CQV_FE6tntwx6NKxVoA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_015730_128904_3ED3784A 
X-CRM114-Status: GOOD (  31.19  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add perf driver for the gtrace similar to ARM Coresight and Hisilicon
PTT drivers. The driver adds 'gtrace' event descriptor which can be used
by the perf tool to record the trace data. The actual data format depends
on type of encoder device and optionally the PMU specific trace format
type.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/Kconfig       |   3 +-
 drivers/hwtracing/gtrace/Makefile      |   2 +-
 drivers/hwtracing/gtrace/gtrace-core.c |  15 +-
 drivers/hwtracing/gtrace/gtrace-perf.c | 368 +++++++++++++++++++++++++
 include/linux/gtrace.h                 |   3 +
 5 files changed, 388 insertions(+), 3 deletions(-)
 create mode 100644 drivers/hwtracing/gtrace/gtrace-perf.c

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index de4a3b533591..659da2edfd9f 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -2,7 +2,8 @@
 
 menuconfig GTRACE
 	tristate "Generic Hardware Trace Support"
-	depends on OF
+	depends on OF && HAVE_PERF_EVENTS
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
index af282cc95b55..118bfab806e8 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -932,13 +932,26 @@ EXPORT_SYMBOL_GPL(__gtrace_register_driver);
 
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
index 000000000000..3ed0003f29e5
--- /dev/null
+++ b/drivers/hwtracing/gtrace/gtrace-perf.c
@@ -0,0 +1,368 @@
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
+#include <linux/pid.h>
+#include <linux/vmalloc.h>
+#include <linux/percpu-defs.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/stringhash.h>
+#include <linux/types.h>
+#include <linux/gtrace.h>
+
+#define GTRACE_PMU_NAME "gtrace"
+static struct pmu gtrace_pmu;
+
+/**
+ * struct gtrace_event_data - generic hardware trace perf event data
+ * @mask:		Hold the CPU(s) this event was set for.
+ * @aux_hwid_done:	Whether a CPU has emitted the TraceID packet or not.
+ * @path:		An array of path, each slot for one CPU.
+ * @buf:		Aux buffer / pages allocated by perf framework.
+ * @overwrite:		Whether this AUX buffer is used in snapshot mode.
+ */
+struct gtrace_event_data {
+	cpumask_t mask;
+	cpumask_t aux_hwid_done;
+	struct gtrace_path * __percpu *path;
+	struct gtrace_perf_auxbuf buf;
+	bool overwrite;
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
+static struct gtrace_path **gtrace_event_cpu_path_ptr(struct gtrace_event_data *data,
+							int cpu)
+{
+	return per_cpu_ptr(data->path, cpu);
+}
+
+static void gtrace_free_aux(void *data)
+{
+	struct gtrace_event_data *event_data = data;
+	struct gtrace_path *path;
+	cpumask_t *mask;
+	int cpu;
+
+	/* Perf frees the AUX pages when this callback returns. */
+	if (event_data->buf.base)
+		vunmap(event_data->buf.base);
+
+	mask = &event_data->mask;
+	for_each_cpu(cpu, mask) {
+		path = *gtrace_event_cpu_path_ptr(event_data, cpu);
+		gtrace_destroy_path(path);
+	}
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
+		gtrace_put_component(src);
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
+	event_data->overwrite = overwrite;
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
+static int gtrace_event_init(struct perf_event *event)
+{
+	if (event->attr.type != gtrace_pmu.type)
+		return -EINVAL;
+
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
+	/* Report the hardware source ID once per CPU for this AUX buffer. */
+	if (path->trace_id != GTRACE_INVALID_TRACE_ID &&
+	    !cpumask_test_cpu(cpu, &event_data->aux_hwid_done)) {
+		cpumask_set_cpu(cpu, &event_data->aux_hwid_done);
+		perf_report_aux_output_id(event, path->trace_id);
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
+	u64 aux_flags = PERF_AUX_FLAG_GTRACE_FORMAT_UNKNOWN;
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
+		size = event_data->overwrite ? event_data->buf.length : handle->size;
+		ret = gtrace_path_copyto_auxbuf(path, &event_data->buf, &size, &aux_flags);
+		WARN_ON_ONCE(ret);
+		aux_flags &= ~PERF_AUX_FLAG_PMU_FORMAT_TYPE_MASK;
+		aux_flags |= gtrace_path_aux_format(path);
+		if (READ_ONCE(handle->event)) {
+			/* Snapshot overwrites are expected; TRUNCATED would disable the event. */
+			if (event_data->overwrite) {
+				aux_flags &= ~PERF_AUX_FLAG_TRUNCATED;
+				handle->head += size;
+			}
+			/* Tag the AUX data with the source's trace format. */
+			perf_aux_output_flag(handle, aux_flags);
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
+	return perf_pmu_register(&gtrace_pmu, GTRACE_PMU_NAME, -1);
+}
+
+void __exit gtrace_perf_exit(void)
+{
+	perf_pmu_unregister(&gtrace_pmu);
+}
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index 92265efb07f2..4a3a80f0d890 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -376,4 +376,7 @@ static inline void gtrace_unregister_driver(struct gtrace_driver *gtdrv)
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
