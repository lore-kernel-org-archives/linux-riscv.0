Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B796B606A331
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 09:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oBvQ06iv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lrzjKfBV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=arRHC1xk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GsT05BRNBaXQs+T3ls7FnWB7YwmBWvSCXdmhrsgh3c0=; b=oBvQ06ivfEyhujledJ75LcpmKc
	pENF8v59CJwW96LSXxQeFt/Yv0PGx1IROtVO/T0Jy48n4RIUTPbslV6tvQJo1unmkIZB71tPbaxFD
	Z4hALiAvaoaybKrKsB/3bHKuU0AWTPJc6Qj9fIL/gU93SQ3Mtjsi/EDjuPLTMwsPWyQ19WzyOFzN7
	SffrHNoaAn60IJdJceCJM2tbxbLRTzGmRStSJl3YFIBtmGPaal9G3MFzfBvrWYc7sGeMh7yp6ncpd
	Kzi1lWmLtEGBUrGW4IyBNl+V/9VHk4gzXZSKH2g4Xr4I+fPCSwdu+FB8cwJXMuWMyd/mcpvKDPNkM
	Kb9SIU6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWEY-0000000CfbX-46eV;
	Thu, 26 Nov 2026 09:57:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWEU-0000000CfX4-2DaV
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 09:57:40 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7BDkd3548533
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 09:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8z+kVMWhmg6
	y5Ud7btL82OoXtKHhPPjHjOGW3hGItws=; b=lrzjKfBV+rzPaVe9bOznNaMGvMt
	kehXmuHqrxYNORenvJza7cSpm7D37uEc86I66gT8e534XVGlEC2fErKPTlOrh8Kn
	/USEJqUXLWFtsZZ/M9WG/Xzvr4enC3RGihA4cTEuWUKTfmpGu5VlrkZ3o1J8+h0a
	LouyycqWkaJvSMP4feL1YdghVRiF17o0Q5tal1pb+Dto0ZXv6UR8+kq0R+kmanxp
	TNCRPqJ/ahntrspHWaASK7GQIu5AZFHOjhp0eKuza3O7BF66Z660bJ6OZsrCiBBH
	dogJ2wMzOkm4KTTza/7DkljxMz6KDm+a+so7+ZnOsDsmXUgJEQsK6lictxg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vaudd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 09:57:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3fa6c8d4bso6801176a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 01:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687057; x=1796291857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8z+kVMWhmg6y5Ud7btL82OoXtKHhPPjHjOGW3hGItws=;
        b=arRHC1xkhtCfx2JxWRrke72E7Z9ZfI3pduUr3Oi6JAM8PwFFXi5PkGwU7D1EVaJqzD
         KpcBxM6N+r7IXYnnn4Nf+GVxO9T1mFneiHocnkc8kWWJmh2J38axORpdjcWWKtmNIswY
         qaQpcU08APW3CPw73FTuS+mXnnJbyPYpmf1TQNXIJbg92aaI8q5Kzk9htAeKTEKu51Ld
         ecgrtzSa77VS8Hgr0TsTfIq1cPb+iRmebSZ6oOuQOeYxIZ1MyGqTx+HucGIy9uXG9ZYW
         4yqVa46syxOJtZotf9v4AreaXsVdO8Pbg0en6ejl6d0/2KHBx8VeIRrbKZ6wRMX9mrkk
         x64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687057; x=1796291857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8z+kVMWhmg6y5Ud7btL82OoXtKHhPPjHjOGW3hGItws=;
        b=rlUcfmSMZhhRn1ekjiS8taNZ65e025eLCaJlu7NaQ7jvAeqn2utczj19gfF44MDfgr
         hXj8wdxvj2N7aIOqnOa/nlGk/pwREdc6Edc4W6n2zRt23Jd//te9UwRIuBjLd99BX+gt
         iYH2OebmZJ2fkvdSjuNqhik2UlESjwyZqbUaS0SBaxDFjGaCOrWJ7rMysTgiPAqlT/eY
         Ml0AkWFS3yxlFxExVS24T2OgePgB56HJFpenj8F/1Etmh/PNiQnhJUQ0HyBctJ1M6z2z
         sMX4T+7luePyizvcs56lZ1xGx+pSjm/v2k7NlvyVXWj17ghVab3NfKP9EtaYJ7k5QiaF
         18iQ==
X-Forwarded-Encrypted: i=1; AL+hErF8049EHiM/tUSsQfySah/CYR81zlEUuowG3ieUq9MCE7OArXWJPNgHEmXnZwpmo+K1+826PyX0fVFScw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/YxOz5tADdCLu4vOOCX3XNRW0k0tClzIJPUFM6QSeEnYfkaR/Q
	/mkXTrz+qu+agxVYgiSzP8XJ4vbudDiryTzNP4NWXZZO5fbNeag6mWgNH0mBlvBursQ+cEMAC85
	Xr3dgt9xlgbkn22Xt6xU4coVVun2pCvHq86v1rqapZCLAaM7o6NLZcQOX27GuBxb0CSh1Z8Y=
X-Gm-Gg: AZFdTZcDTHNzeIvXVftgKD0ZSl4EaXlzz78njtDZzCs9QV0tP/4ceJ6ahV9ITdbKH0o
	LlQ3E32L5GmRpDMK/489/7l5hCVlIqfVf2fJymeq6AVA22pAEHb1WGXUnZIHkh/9edr4FWWhY3d
	nIG8u8dGHi+fEhIKAOhM1v37eRuUe89e0IHpG47iAz7e+UpUMIg9O3fONee7JT4Gy4Dt6MeQ8S1
	sdQ2OlcoUbryoYS1kxCp7bDM6O40oiGSK5QvCWNHnp2dkoMjZ3RxdJkUO8Iuv4NZSkusUNVnEl5
	r4l5FuYcnO70Nw1RyQkBennHJ8f/czbN2a5RPywlepwy8jSZjZkGJGQ7eqJHQ/EVU7v9NoAnmk+
	Wyqo9X055yL6zj0hEGR11AIoyM1UE2vWhitscrThp9NeggQxc1cdamysiL8WbwDXsUHJ44BV04G
	2NNb8d32WZkfWDamekPrrXIq74a01HaOJALU0G06A5Tb+G0LOCulAppBOFNqcshL25SIdGP9a+4
	A==
X-Received: by 2002:a17:90b:4d0a:b0:3b3:b562:899c with SMTP id 98e67ed59e1d1-3b41c8dc9f1mr12138069a91.9.1795687057115;
        Thu, 26 Nov 2026 01:57:37 -0800 (PST)
X-Received: by 2002:a17:90b:4d0a:b0:3b3:b562:899c with SMTP id 98e67ed59e1d1-3b41c8dc9f1mr12138044a91.9.1795687056596;
        Thu, 26 Nov 2026 01:57:36 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:57:36 -0800 (PST)
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
Subject: [PATCH v7 12/14] perf tools: Add RISC-V trace PMU record capabilities
Date: Thu, 26 Nov 2026 15:25:33 +0530
Message-ID: <4755b47e4613daa764d2c50af1a1840afa2622b4.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX2g1c2P+u3/Nj
 HSYSHF9ugZKXlei4aySeJa9FCizcFGaLy0VI3EOHFebrcFOFfuD9eDoxL8UzZBLx1b8fT5HFgWR
 KKvwdfoWaXE10+2h1Xe5+bAXfl6W/Og=
X-Proofpoint-ORIG-GUID: iZ7FzTmwJK--PaPMwGmE0KxVhd_7Og-t
X-Proofpoint-GUID: iZ7FzTmwJK--PaPMwGmE0KxVhd_7Og-t
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b080291 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=69EAbJreAAAA:8 a=QyXUC8HyAAAA:8 a=61plweZImoeDEhIX1WwA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX5HUPWDPfvWxT
 WjDWIV0EBvPPI9zhzfNOi+YEblzh5S858eDpfDalojnzh3zd/VrxOAlF3XpevSdk3N8QSCbZHcL
 VQ0mCLt6lfeZXiK7JRvYzvXqgGuZ/Tv4VjS7O1y0nkbFqerBePUpcPSt1JMx2JlGR21tVIgj1Rq
 mDYtloPluy5vbijn0WhKDUVMIQ5f0yMtbZt9yqHXQLkrQ6rTeXx6qFuR9TljbCM9IceV2FnjG3M
 Pd3uRBnw2Z9pTxqCD16DEt/uL47D1V3JSf/J0umT4pgRqsWS54arDI30FulFhlcHN9N33xcKNA9
 3Y2ZEs2ommdMUYfQDGfyKgab2OGfr6troZB6bHNG1dihAvnFnzpSLjYH70ejOKDWHBvyjMu10RV
 /XHgM4sY4yNx+mmoPvsNOYi3ftJU8P29/A/fph8CNI2wV5AXNNJObawZSRboefBDk/jl3ls1KDd
 bbwiliX2sKXiNAjy/Og==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_015738_602030_E616A750 
X-CRM114-Status: GOOD (  24.54  )
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
 tools/perf/arch/riscv/util/auxtrace.c | 220 ++++++++++++++++++++++++++
 tools/perf/util/auxtrace.c            |   1 +
 tools/perf/util/auxtrace.h            |   1 +
 tools/perf/util/gtrace.h              |  16 ++
 5 files changed, 239 insertions(+)
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
index 000000000000..6331161dff7b
--- /dev/null
+++ b/tools/perf/arch/riscv/util/auxtrace.c
@@ -0,0 +1,220 @@
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
index 8bb491d389a2..f77b674dd724 100644
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
index c29a8444f08e..b837cb8085de 100644
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
index 000000000000..63f7560fc15f
--- /dev/null
+++ b/tools/perf/util/gtrace.h
@@ -0,0 +1,16 @@
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
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
