Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63746CA5FB3
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 05:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HFlrLCu1PVYBh5PkMpwuO5sEvVTvzva6SKtyt67WKdY=; b=z2Xz8FdYItfxFy
	OSD4B7phXfXgNUBSF5JyPs5B1Ivhg6vH+sxxE/h5XNNTZxPt38NY0K2LNALRebLzuBwYi4ihrAneB
	S55Ugv0g5r/9VRuQYluXFIBF4VsQhPldGy+Izk43qSLGAqpx3WHcTxcPMH39PgPo7iLXURm8Xw4de
	jQYCjIkaFQYFL7RJX+8TTvOm9Jmfg3hFt0BVW7Zzclrl1XVdmsrHdnzlFv2xn+rjgc88QBDluyiYl
	REmve/suLUz9B8KnhPk7+RYWANPtkuy6+S0O8qtiSgFklXKAfeDh/qahcIuHZJi4tohIL7yeVTnMz
	/iRf+5VglbTKAZo/HPIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9I1-00000007o9k-0zYg;
	Thu, 01 Oct 2026 05:25:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9Hy-00000007o7H-19q0
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 05:25:03 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913ghEa1511630
	for <linux-riscv@lists.infradead.org>; Thu, 1 Oct 2026 05:25:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TiL1DqtELen
	bOFB6PbnT54f13FVRUjcvw/Hei+VMjvE=; b=El1A70x55BcHhMgQqE7Epri1hAI
	L4eL4Ls7YiLvXOCvFZljauItoN3n2GmGjIojeYzCbFIwtQpUzKxhW0loX6e+wtGR
	4wupONDIbOyf+a/F0zREGoQM30v+90LoiSoWLW4Gc3ZtYL7LA0hux3SqXx3AsXMh
	gOeoBZW8oJuJ1ya00Eb1K1jConcXLgbBD2YktBw5vQFLSKvKXzJ8agES5njDz2mZ
	JPsEwOEsX19vsvO85xFDST+j+B6VTX5H9Sae5PfKQ1ViOwoLxrqh705z6S/8JQSg
	OCPlchnlimQu+pXYV7pcueJ12htea6UMzIA9XOF4oU4wHhWZU2nNIA22ftQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h10bkca6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 05:25:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e2f3251e91so7770035ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 22:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790832300; x=1791437100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TiL1DqtELenbOFB6PbnT54f13FVRUjcvw/Hei+VMjvE=;
        b=EhTVO/VWYOJ6OeSMPqcMwPndMfpfB5Onfr96GdJ6uMdHEB3LVo13/uU3YPnhtaFnJG
         xi5TdVwDUveO+Nh2S5Y69beJY3bmlEMJqC3B0zkqG2rdrfZZjxfvHe38b0VwOoKW5Ch8
         WHvpfGTM8kTBP/yVzRXOuGE0JN1c6Wlhjyz+KJL5OHE/9CeOYMdAbFBoyShPmaRw1M8T
         glzXuZLubbT6bD/1F3CAgbRXiEHsNMav7BNf7GmtoppzNgMmvQe7BxIeJMsKOvxiDjIB
         XFWQvPn3oN6nn1FbMMxrXY5C2vqHtAyu1rUxDsd6XWp/bT83PNHa25cgyGDf1YgVsFXv
         /3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832300; x=1791437100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TiL1DqtELenbOFB6PbnT54f13FVRUjcvw/Hei+VMjvE=;
        b=ZMzF9nZaSh9SaHG48jI4q2ZVZRdaOP/+1hFZ5pMNLM/O9wnOKjvQD4h+ccRGd8nadY
         h+yv+xBUvCpyGnRqaEtO3PbUJpyid2xz3rn1SFGWH6YSbJlrt7QdC7763z5oBS3EBQwh
         n0RNnAmhdLDl+9yM/aoRpUtjUpuN7A1xwScyQ/A/2wBjxVxDClOMboHw8zhbDfvtcdTK
         8klypb0QanvA8BCqnX9Ls9jW7Om+WX0ivQTECloVDWtop2Gxc5QjancweZBGWqVIQT4D
         MApp7r36O2fwE7Yh/WDq3F4lpKg6YTloGzwMSHCfKtDII5XEJAf8E+MsTZ3BfSQ2Nwml
         kW1Q==
X-Forwarded-Encrypted: i=1; AKwUvByFmMa+meY5++HfYpkHbTytIFm+x7hgKsCCLbhO+rIomPcFevYyfg9q4KzEognRTeHfBj9tsjPeO/ZY9g==@lists.infradead.org
X-Gm-Message-State: AFq9FYLJp1beuSIQiqT2Iu7YUbREYWm9N59yKwHyTOFHgGSanRD6i5Cn
	3Eya8mDGgbj0HeYsh3RkM9B6IG/1s3V1Y2g+FvRGloPnzTxZ3GeL/cqdyLZguro18rzRWcCntjZ
	KD0qBpOJSmXujz2waOcDLZ9/eMD+kc3NI23/ozc2w67UWucLewXkBAXhl3zuwQuEwIW9fz8Y=
X-Gm-Gg: AYBFou1ZZhD5/AOS4cJ9RBb2xzIbFeAINEUPbHdFu248CkbOp4xlSKVY6A8TyMjNhpu
	u1lA2TxkogAyXv9hq4QejTj9NmVVcmZXf/DczQguNEnLgIZfZShAx1WSxYa2btYEbfWZuy4VU1i
	73npD1YjXmydoqBs1siite7Us1U7LF1QUo3IWFRpMEypfCNbk4I5ucUQeayXmPV2ZXgIzfDGkVT
	BclEbJqG6PHHbBpcqwYDo/MeQ0NlqGpsvAZLnVwH6t4MfjHVLk1JrMa4tmPkSttC+uWCjufa3Kr
	51sQu+VRnasq8nm8Tx+QQFD86TGMc/uzeAdiheJMfCilxC2btiKWUp0AF5os0olzivDREUqcNz5
	oOyN0tMIC1pVOJTaUZSPZWojz5d4iXRIQv8jDCS/HJBAn8vGmPH84ctU26bjtG9H6MbkfF6OmP8
	Xwu6pGyX7eE6ULepSfjavJ2ct6
X-Received: by 2002:a17:903:234a:b0:2df:90d4:7847 with SMTP id d9443c01a7336-2e2e4bb19e6mr28935515ad.35.1790832300217;
        Wed, 30 Sep 2026 22:25:00 -0700 (PDT)
X-Received: by 2002:a17:903:234a:b0:2df:90d4:7847 with SMTP id d9443c01a7336-2e2e4bb19e6mr28935255ad.35.1790832299664;
        Wed, 30 Sep 2026 22:24:59 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e300b851b9sm5152715ad.78.2026.09.30.22.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:24:59 -0700 (PDT)
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
        Nutty Liu <nutty.liu@hotmail.com>,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v6 12/14] perf tools: Add RISC-V trace PMU record capabilities
Date: Thu,  1 Oct 2026 10:52:23 +0530
Message-ID: <20261001052243.3042627-13-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: MHQ84VoSToHuCOyF6b5MgcYYDyRqMKIK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX9G1fnLCY/Drh
 Uuw2ng7gXcdCymlJC5NsRYScmNilyV/9g1ybKRuBx+COwKWZ3/OdW8HIHApikVDTdxtQ31Kt5y2
 XyNa2aPgern7rnIann27ZUH4L4kdG5iktRX5230hSWXDXqs6piLbclOxBPxuHqPElkv8O+wWdbv
 YYsRqkkmUHqAMNHjqrC82242yTxKReYVjaPjHpivwFEkhfR3P7ZIre3qF/x+vR7kR1ZyM3c5OKM
 AYKKaBw1GvEu5kNTJ1pdBMSA4ngL1Bo9vRECM2ewdalNQ0f8MkT5w0m7uS7Wgh0k0ohvb0Nuocx
 6wKZC6mzP0j5ZJEHZJeiY+RUmvpreuLVRy/3qOcIrBB/obQ3RODLqzCcSpdcWx2Qq2VpNEcoie0
 YBgr0cavdqGXxK4v/JP8XygAp8jFDbLoJ6p2OE7F+0bFwbnmJb5pPVj9HqKiStP+wdkhJLvfSmG
 r+cM8Z/2g3uAB1cL2qA==
X-Authority-Analysis: v=2.4 cv=MZn5KJ/f c=1 sm=1 tr=0 ts=6abdeead cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=69EAbJreAAAA:8 a=QyXUC8HyAAAA:8 a=NWcWjgigot-dzQyGZP4A:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX9KildEBIaBKS
 j6JH/IomZhGO4WF+Al442xShJy1UHEDAB6d+lCWEii//TMB/Hvt5L7eX1Msbxb0dgvwKol10i4b
 yhFWjRNmB4w5rstwVChRrP1iEeQhekY=
X-Proofpoint-ORIG-GUID: MHQ84VoSToHuCOyF6b5MgcYYDyRqMKIK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_222502_439230_7165EF4C 
X-CRM114-Status: GOOD (  24.88  )
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
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 tools/perf/arch/riscv/util/Build      |   1 +
 tools/perf/arch/riscv/util/auxtrace.c | 221 ++++++++++++++++++++++++++
 tools/perf/util/auxtrace.c            |   1 +
 tools/perf/util/auxtrace.h            |   1 +
 tools/perf/util/gtrace.h              |  17 ++
 5 files changed, 241 insertions(+)
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
index 000000000000..882632511d09
--- /dev/null
+++ b/tools/perf/arch/riscv/util/auxtrace.c
@@ -0,0 +1,221 @@
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
+#include <limits.h>
+#include <stdlib.h>
+#include <time.h>
+
+#include <internal/lib.h>
+#include "../../../util/auxtrace.h"
+#include "../../../util/cpumap.h"
+#include "../../../util/debug.h"
+#include "../../../util/event.h"
+#include "../../../util/evlist.h"
+#include "../../../util/evsel.h"
+#include "../../../util/gtrace.h"
+#include "../../../util/parse-events.h"
+#include "../../../util/pmu.h"
+#include "../../../util/pmus.h"
+#include "../../../util/record.h"
+#include "../../../util/session.h"
+
+
+#define GTRACE_PMU_NAME	"gtrace"
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
index aa749e1c3036..1ecdde597153 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -1432,6 +1432,7 @@ int perf_event__process_auxtrace_info(const struct perf_tool *tool __maybe_unuse
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
index 000000000000..343d2e9d4fa1
--- /dev/null
+++ b/tools/perf/util/gtrace.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#ifndef INCLUDE__UTIL_PERF_GTRACE_H__
+#define INCLUDE__UTIL_PERF_GTRACE_H__
+
+#include <linux/types.h>
+#include "util/event.h"
+
+struct perf_session;
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
