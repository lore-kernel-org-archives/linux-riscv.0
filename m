Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11D2C5AD7B
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 15:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pndpeo/c1IrJNrOkqV3/BQDI+kD2cKeV2+hbYzr9pDs=; b=faZfC9QM4vVphq
	PynQHuHOrUvXxU7Kh5Akkq2qnbEk9LueOezeNM6kGrR/oVr5KoW9qQbOGhBsYwgfvxW8XXI0Ukp+F
	yuNVQnsvkrsK8WkhtHp/MKZiwE/xbF4lzTwmvZTIckhMv2XZAWceZsynA8F91sEZHk/Ni9Zdka26W
	l6IIZnws4lxFu6204YuEKJszAcBh+a4oxW2dFfiNtry/ePYyFOJOTHhXBrZz7eE3ddUl+YvZjp7XY
	vs6arq/of7jIw47Kt94ycq2RTcj+mod0XPdfahEQ522UPUuRGBUoJ6UAJvCMEq7D22PAR1DPGOQdV
	Rcuww0BxPgE+AiszSikQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRs7-0000000CFP7-3KN8;
	Mon, 10 Aug 2026 15:25:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRs5-0000000CFM7-0SVa
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 15:25:02 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACj5pL1343238
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 15:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Hk/olWcMYCC
	UGqV7YkEAh0ajnCbIBwvqXEI3sMl4tPk=; b=VeFKsovcq8oVyZZMdjRDlfKpsM4
	Gp3kPQrCzcq7847iNVdgPb3Eq8jAkVHgLmv7a8gCrnL6UVY0QREsaX/3eVzHB9Yz
	lUN/a4ZKFqVkn8rHtRDYsZPCWbMS3o7HSjI8BcEQH+WLnCU2cQH+8AOO5SZIgn6q
	9tOCwyDFZE6i3O3cS42bpwa5p7QoheDLl9O3Nn/e39YFS63sjiYDE+QjbVRnmLxP
	443NYoTPXScGX9CWpygXxGeyZqqxOMYY/Co5X3BmK26vfl42s2+ffCw5qJiBgqUD
	TJaxDUQRfTi2GyDbVKNKKV/YTa8hQhfE+jk5/9mEFxIN9up0yH0MFK3N1Ig==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v5a7f0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 15:25:00 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso2525847a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 08:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786375500; x=1786980300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hk/olWcMYCCUGqV7YkEAh0ajnCbIBwvqXEI3sMl4tPk=;
        b=Epc44y9FBkwSPDsmvVMAF63FFjNxO2EGTfR7XupfAxBTwyKCymwwHjygg3Q7i3cCbc
         Hlg1A6MrnfqJ9/JE3z3dhOWoZgFBMB+CVsjy/ieHIdTR6vnhjKlemmOR1ag5EnYHDiIZ
         l+PWDQn/sGE9lgDWZaU6WO5MZmu68xEUgj7PuFqp3F5L12NuLppPW7npZt5n8qVPCu3z
         6WT8zsjjdhtoExq94Vr0oNpeResde8KFXsezgY5wW2O8uta5zaX60rigBJxQfdYKNQkG
         jJhmxn5NpZGSl5NhzfkIKJnyuibOTKrus572QPmW5Xh4fitLK6nsLwb06suR8zQqW3N5
         e2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375500; x=1786980300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hk/olWcMYCCUGqV7YkEAh0ajnCbIBwvqXEI3sMl4tPk=;
        b=cYbL0p7heF7up+mhcicEJvjnG27ZLoEH+Qdk0MjflXP2OSo3jPesxTnGQ87eV0HBLb
         IW1u487k/N5E+uiRVko7NNYGqjNSYtEcCL5IWiMVBzEbxdjJG1Edq/6uGN0W0v6Wwmb2
         P/V516VMRV2WwNLmPm4Uf4be6sV7WEBgXpjqnj638xTIrGPon5hK4jiTqdtFoVJO4ZTv
         EOUetmU5K4dNKFsNrMy/M0fI1b7IvEgp9VzAH6l6/OboTVahS+8hQ8x8Fx/6KmxHQKH+
         58EiBvoUwnFW/xudn8lfJ3wUoRqM6q701k5HlnFmKLNjYYOs3L4mJDjP5KcTUjntzQoK
         d/UQ==
X-Forwarded-Encrypted: i=1; AHgh+RqmFEYSIxQ4vPBZuEZXmCm5hrpyl7pJYimBw83uu3G/gGJV3GGc+PLP17pBmaTZgEVhkKf3pbOGWnuJqw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDpKzDk5H795XES1fIr062Bxxb4D7M87ZMjX7xZM9BPYCiyyzF
	WAN+1BFeFIaUms+v3coBy5sd8N2/zdYApr2cXMETeTwrCiby+g41iE3vhyOUq4YOkMdjDTMGVqj
	3vAd6+6TjUzn1MMa5JLR5qafKlPHN6sZD0es0XbNwX7SGXsRimBpgWCjbt9OA2G8HzyMCF8o=
X-Gm-Gg: AR+sD11tRnHLdQRaczjVsb1CEo//Xy5i9dNhAVScbdaaN+lq7NTjpNloN8ZpwIMXhZe
	37mhi4XodxwGDqmM2TCqwSNa0mww6C517vNaOG7RvN0bviwZb6Ea+e2K4fjP1TOJMt58vtVLFt3
	O0GjoKDwyCAr389QOpo7mbg0yeXs07gIAeT7FlPbr7MJOkSSrp/mmE0CfBMyKQ0fYFk6mw0hRu6
	Uf5LIoAh9bTVB3tEdT9L5zHlTc6vZZoH6oHzotPQ2QwvlnEXZHdxqNtwX44IXhR4bJorOVYjN60
	zlx0T0uuYY7FSbAOEpxoAC/eQsGoT1XeT+1lDYQwjG/zJtfjO5DSzxs2HyRCCF5qKCmnGYCPkQh
	f/MNLLQVL+vQAw21eFw5PghfZ5tQlzkStdyH1ro45qoaHfj5gjmL/BGHrNuuu4oCr+m9v0jLdLA
	2jacbOneQyP5arKdiRPO4v6Wuv4g==
X-Received: by 2002:a05:6a20:c5a7:b0:3c8:f98f:475b with SMTP id adf61e73a8af0-3cb85e6c950mr53762711637.19.1786375499785;
        Mon, 10 Aug 2026 08:24:59 -0700 (PDT)
X-Received: by 2002:a05:6a20:c5a7:b0:3c8:f98f:475b with SMTP id adf61e73a8af0-3cb85e6c950mr53762639637.19.1786375499195;
        Mon, 10 Aug 2026 08:24:59 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm4282634a12.11.2026.08.10.08.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:24:58 -0700 (PDT)
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
        Nutty Liu <nutty.liu@hotmail.com>
Subject: [PATCH v5 12/14] perf tools: Add RISC-V trace PMU record capabilities
Date: Mon, 10 Aug 2026 20:52:14 +0530
Message-ID: <20260810152223.3946743-13-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX4WqwWXPgPAV3
 KnY4YL+9EDuMqV6b08Cc9yCJsNWmSqgLamm/X+ff/j0hs8qlv/8T3mGUcEl8V4KWk483F90PpQ0
 s5ePdfp38HDXA9CF3mpAOi1m+3kV3AY=
X-Authority-Analysis: v=2.4 cv=J6qaKgnS c=1 sm=1 tr=0 ts=6a79ed4c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=69EAbJreAAAA:8 a=QyXUC8HyAAAA:8 a=F5mInixxrWKVZ3nbcxgA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: taNvBwdVmlZmw5vwEn_ZBRDxYBbSG-D-
X-Proofpoint-ORIG-GUID: taNvBwdVmlZmw5vwEn_ZBRDxYBbSG-D-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX/XKIcV1co0SF
 tmKlj9nMohmiIa0C5batGa1m+EQMZmQsnpQTM12/OwCaHnkIWB2lF6huKoShJlXTO9zXNZDYVgm
 RwTdb0gCpZeUdR6JAbG5XRdl+HjS3ogk7L/VQ3sKRQLJefRwxi2slpx9O5jb1s7s5P7IpxpOaKS
 Q/EB5sxTKfzyxO0CgzXSARAGP3KIZEtGDPlduI03BEYnjTVkevD4FQOMW8IXcDi3P7ge6Mf2s7q
 ouWxdwmB63uNLyp/+dOItDuQgZ5Y+2Q42TJcM3fLGXP/T88PC/84nQUzM22/7D2Ilm4NukvVQuE
 LeD6f7k8XnfKrzQTqVHUgG/3Xn2aObQT+q77zJ3DJ51jr+iORcSzthWC7W9TxLYL56Agk/Y481i
 Foy3PjUL2117KBsTqT0yAmghp2e13nbj4wWkuDAmx5q2razlhOC6dAb3M25CbR/3/DOXsg6TFI7
 ia1b5cL+nzTXTGAwkVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_082501_228504_EDBE3C7F 
X-CRM114-Status: GOOD (  24.25  )
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

Introduce the required auxiliary API functions allowing the perf core
to interact with gtrace perf driver. On RISC-V systems the gtrace
PMU uses the RISC-V E-Trace components and optionally an ATB Bridge
component for connecting to ARM-side sinks, if it is present on the SoC.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
---
 tools/perf/arch/riscv/util/Build      |   1 +
 tools/perf/arch/riscv/util/auxtrace.c | 217 ++++++++++++++++++++++++++
 tools/perf/util/auxtrace.c            |   1 +
 tools/perf/util/auxtrace.h            |   1 +
 tools/perf/util/gtrace.h              |  12 ++
 5 files changed, 232 insertions(+)
 create mode 100644 tools/perf/arch/riscv/util/auxtrace.c
 create mode 100644 tools/perf/util/gtrace.h

diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/util/Build
index 2328fb9a30a3..e07d5525ece6 100644
--- a/tools/perf/arch/riscv/util/Build
+++ b/tools/perf/arch/riscv/util/Build
@@ -1 +1,2 @@
 perf-util-y += header.o
+perf-util-y += auxtrace.o
diff --git a/tools/perf/arch/riscv/util/auxtrace.c b/tools/perf/arch/riscv/util/auxtrace.c
new file mode 100644
index 000000000000..39c31be9f896
--- /dev/null
+++ b/tools/perf/arch/riscv/util/auxtrace.c
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Risc-V E-Trace support
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/bitops.h>
+#include <linux/log2.h>
+#include <linux/zalloc.h>
+#include <errno.h>
+#include <time.h>
+
+#include <internal/lib.h>
+#include "../../../util/auxtrace.h"
+#include "../../../util/cpumap.h"
+#include "../../../util/debug.h"
+#include "../../../util/event.h"
+#include "../../../util/evlist.h"
+#include "../../../util/evsel.h"
+#include "../../../util/pmu.h"
+#include "../../../util/record.h"
+#include "../../../util/session.h"
+
+
+#define GTRACE_PMU_NAME	"gtrace"
+#define GTRACE_AUXTRACE_PRIV_SIZE	sizeof(u64)
+#define KiB(x)	((x) * 1024)
+#define MiB(x)	((x) * 1024 * 1024)
+
+struct rvtrace_recording {
+	struct auxtrace_record	itr;
+	struct perf_pmu *rvtrace_pmu;
+	struct evlist *evlist;
+};
+
+static size_t rvtrace_info_priv_size(struct auxtrace_record *itr __maybe_unused,
+				     struct evlist *evlist __maybe_unused)
+{
+	return GTRACE_AUXTRACE_PRIV_SIZE;
+}
+
+static int rvtrace_info_fill(struct auxtrace_record *itr,
+			     struct perf_session *session __maybe_unused,
+			     struct perf_record_auxtrace_info *auxtrace_info, size_t priv_size)
+{
+	struct rvtrace_recording *ptr = container_of(itr, struct rvtrace_recording, itr);
+	struct perf_pmu *rvtrace_pmu = ptr->rvtrace_pmu;
+
+	if (priv_size != GTRACE_AUXTRACE_PRIV_SIZE)
+		return -EINVAL;
+
+	auxtrace_info->type = PERF_AUXTRACE_GTRACE;
+	auxtrace_info->priv[0] = rvtrace_pmu->type;
+
+	return 0;
+}
+
+static int rvtrace_set_auxtrace_mmap_page(struct record_opts *opts)
+{
+	bool privileged = perf_event_paranoid_check(-1);
+
+	if (!opts->full_auxtrace)
+		return 0;
+
+	if (opts->full_auxtrace && !opts->auxtrace_mmap_pages) {
+		if (privileged) {
+			opts->auxtrace_mmap_pages = MiB(16) / page_size;
+		} else {
+			opts->auxtrace_mmap_pages = KiB(128) / page_size;
+			if (opts->mmap_pages == UINT_MAX)
+				opts->mmap_pages = KiB(256) / page_size;
+		}
+	}
+
+	/* Validate auxtrace_mmap_pages */
+	if (opts->auxtrace_mmap_pages) {
+		size_t sz = opts->auxtrace_mmap_pages * (size_t)page_size;
+		size_t min_sz = KiB(8);
+
+		if (sz < min_sz || !is_power_of_2(sz)) {
+			pr_err("Invalid mmap size : must be at least %zuKiB and a power of 2\n",
+			       min_sz / 1024);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int rvtrace_recording_options(struct auxtrace_record *itr, struct evlist *evlist,
+				     struct record_opts *opts)
+{
+	struct rvtrace_recording *ptr = container_of(itr, struct rvtrace_recording, itr);
+	struct perf_pmu *rvtrace_pmu = ptr->rvtrace_pmu;
+	struct evsel *evsel, *rvtrace_evsel = NULL;
+	struct evsel *tracking_evsel;
+	int err;
+
+	ptr->evlist = evlist;
+	evlist__for_each_entry(evlist, evsel) {
+		if (evsel->core.attr.type == rvtrace_pmu->type) {
+			if (rvtrace_evsel) {
+				pr_err("There may be only one " GTRACE_PMU_NAME " event\n");
+				return -EINVAL;
+			}
+			evsel->core.attr.freq = 0;
+			evsel->core.attr.sample_period = 1;
+			evsel->needs_auxtrace_mmap = true;
+			rvtrace_evsel = evsel;
+			opts->full_auxtrace = true;
+		}
+	}
+
+	err = rvtrace_set_auxtrace_mmap_page(opts);
+	if (err)
+		return err;
+	/*
+	 * To obtain the auxtrace buffer file descriptor, the auxtrace event
+	 * must come first.
+	 */
+	evlist__to_front(evlist, rvtrace_evsel);
+	evsel__set_sample_bit(rvtrace_evsel, TIME);
+
+	/* Add dummy event to keep tracking */
+	err = parse_event(evlist, "dummy:u");
+	if (err)
+		return err;
+
+	tracking_evsel = evlist__last(evlist);
+	evlist__set_tracking_event(evlist, tracking_evsel);
+
+	tracking_evsel->core.attr.freq = 0;
+	tracking_evsel->core.attr.sample_period = 1;
+	evsel__set_sample_bit(tracking_evsel, TIME);
+
+	return 0;
+}
+
+static u64 rvtrace_reference(struct auxtrace_record *itr __maybe_unused)
+{
+	return 0;
+}
+
+static void rvtrace_recording_free(struct auxtrace_record *itr)
+{
+	struct rvtrace_recording *ptr = container_of(itr, struct rvtrace_recording, itr);
+
+	free(ptr);
+}
+
+static struct auxtrace_record *rvtrace_recording_init(int *err, struct perf_pmu *rvtrace_pmu)
+{
+	struct rvtrace_recording *ptr;
+
+	if (!rvtrace_pmu) {
+		*err = -ENODEV;
+		return NULL;
+	}
+
+	ptr = zalloc(sizeof(*ptr));
+	if (!ptr) {
+		*err = -ENOMEM;
+		return NULL;
+	}
+
+	ptr->rvtrace_pmu = rvtrace_pmu;
+	ptr->itr.recording_options = rvtrace_recording_options;
+	ptr->itr.info_priv_size = rvtrace_info_priv_size;
+	ptr->itr.info_fill = rvtrace_info_fill;
+	ptr->itr.free = rvtrace_recording_free;
+	ptr->itr.reference = rvtrace_reference;
+	ptr->itr.read_finish = auxtrace_record__read_finish;
+	ptr->itr.alignment = 0;
+
+	*err = 0;
+	return &ptr->itr;
+}
+
+static struct perf_pmu *find_pmu_for_event(struct perf_pmu **pmus,
+					   int pmu_nr, struct evsel *evsel)
+{
+	int i;
+
+	if (!pmus)
+		return NULL;
+
+	for (i = 0; i < pmu_nr; i++) {
+		if (evsel->core.attr.type == pmus[i]->type)
+			return pmus[i];
+	}
+
+	return NULL;
+}
+
+struct auxtrace_record *auxtrace_record__init(struct evlist *evlist, int *err)
+{
+	struct perf_pmu	*rvtrace_pmu = NULL;
+	struct perf_pmu *found_pmu = NULL;
+	struct evsel *evsel;
+
+	if (!evlist)
+		return NULL;
+
+	rvtrace_pmu = perf_pmus__find(GTRACE_PMU_NAME);
+	evlist__for_each_entry(evlist, evsel) {
+		if (rvtrace_pmu && !found_pmu)
+			found_pmu = find_pmu_for_event(&rvtrace_pmu, 1, evsel);
+	}
+
+	if (found_pmu)
+		return rvtrace_recording_init(err, rvtrace_pmu);
+
+	*err = 0;
+	return NULL;
+}
diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index 4cd2caf54015..d7f27ca15b81 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -1427,6 +1427,7 @@ int perf_event__process_auxtrace_info(const struct perf_tool *tool __maybe_unuse
 	case PERF_AUXTRACE_VPA_DTL:
 		err = powerpc_vpadtl_process_auxtrace_info(event, session);
 		break;
+	case PERF_AUXTRACE_GTRACE:
 	case PERF_AUXTRACE_UNKNOWN:
 	default:
 		return -EINVAL;
diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
index 6947f3f284c0..42b1481ec894 100644
--- a/tools/perf/util/auxtrace.h
+++ b/tools/perf/util/auxtrace.h
@@ -46,6 +46,7 @@ enum auxtrace_type {
 	PERF_AUXTRACE_S390_CPUMSF,
 	PERF_AUXTRACE_HISI_PTT,
 	PERF_AUXTRACE_VPA_DTL,
+	PERF_AUXTRACE_GTRACE,
 };
 
 enum itrace_period_type {
diff --git a/tools/perf/util/gtrace.h b/tools/perf/util/gtrace.h
new file mode 100644
index 000000000000..4b87bdaf55c6
--- /dev/null
+++ b/tools/perf/util/gtrace.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#ifndef INCLUDE__UTIL_PERF_GTRACE_H__
+#define INCLUDE__UTIL_PERF_GTRACE_H__
+
+#define GTRACE_AUXTRACE_PRIV_SIZE      sizeof(u64)
+
+#endif
+
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
