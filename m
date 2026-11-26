Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367E6606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 09:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1KTLF5CX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jN9WcARj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gx8++4Qe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qfpAN6D7+s7On5HRT+lQBwLlxnLDi5CrdAtaGvx8F6k=; b=1KTLF5CXWWfVfx8Ofnvhz3yohg
	ySRRtzZslcilq530rwbbI51AC6iBblN9PuMQX2ztPR8PFXmZeYMw5RevmIGB6MPv37UDxpNSN5Jap
	jhl/dvmBpzWai3c4HEdJ0442hiyEbUp97OE9+3NGpMt0jvLycQG60v5SPtQgXEHSs3VybQ4lEgzj0
	h9RJzYa1bs5CQTJF4jMJWYatRLGHb3VTGUla8M6xq9Q0BhdoIvWCynGoDh5B+4IJrpknFJRf/pEUn
	rtZxX9eSwW5LQiI7/YuJxkdwynUqAcgxli7JhQYTVhdmspXSmFkNm5XuQD/73BxpNE+Ccl5R7yPvI
	5qZe8usA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWEl-0000000CfnC-0eGW;
	Thu, 26 Nov 2026 09:57:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWEc-0000000Cff8-3ZF3
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 09:57:54 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B7TN919515
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 09:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=agTbkmcEs6T
	rqXAuW+7FRD7KPDJYeBrOt4eTWPTpJa0=; b=jN9WcARjBcn1WcAkR79jKyT1xuQ
	/YNmSDJ+uNLNDCX2IYxOmjLxvlOmOx23WpaBrhEK5g0yTIefcsg54laM251CU+UI
	V2ua2Y4bGJN9FFXIe8cnTEZSXqahqr+FU+N4ynttO/WsfbFpRHo959dgao+2puCh
	Ju++asjdC+5GJDeXTh7xbmC5IU0zChRNrmDr12WbgqMXDEmu+Iq0N6EPe9AMUl9c
	vzJZMdhzncRCBdM54uqsC03fVD1dedFtR4EvWR0lsX/HVE0NFsfp3/tHHJA+8A8z
	kWk0LIhQh8573ckIQhHd2WhYMcY0izYm/dHaMSfejt0h8wkeoy3MxSmbCyQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y2hqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 09:57:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b191f8a9b3so7985959a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 01:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687065; x=1796291865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=agTbkmcEs6TrqXAuW+7FRD7KPDJYeBrOt4eTWPTpJa0=;
        b=Gx8++4Qes2YS+0W6qDtS74q3VFrKo5wtftVaZ1B7w29F3iPAAZElILYlTCdSfVovUH
         X6IVog4U7HHX9+KOlcj+EZoRLtOOClnH6q0vaPwEjWwf5INrN7h3u8EaPg/LyuJ/na5G
         fwRAQt0aL+9JRRJ4b46o7AebyQr9FJ/ykMDkjU31X/RY8AIRFKtpofL9QvuKO11KT0DB
         v+KzuZGQwqu63lPinLcquxnaUiSwMChG5x+22NIam11DBnB0RzzfxrnMT5EK6WM/nb1N
         ujOQ3gZzkBWnAg5dfwTlnxrQDoI4uv3IdHewu4YTeAETawgSsUz0HEjG6ZVmVyca9Qn1
         4UuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687065; x=1796291865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=agTbkmcEs6TrqXAuW+7FRD7KPDJYeBrOt4eTWPTpJa0=;
        b=ucGsF1lgBXtBl2E4Q3M0hFkTRedHUtjBNcB0NSkwNMuN2bTKUwDhtMoIZ5WYKOAapN
         WjHiZN0X3wtyckyGpHxYEh9n5KZ6u6ZJfHZU3YvRUc77kPDrohQxtVqqQfu77Oiw8Kq9
         hVzwTzpozegqJ9GJul8ZDXB7CBrHrmCIsc9ifGNcdKANlbBvN0ktm5AaaR6OOuNtxe2K
         VviFrM+3F6VRLASc4yscItzmA80ZOI/suaWBHh45qw3ze7r8wxD3jo3lcRD+HXi7jNW6
         EVKJCdTZkZf+dLfICcnwBCBnTYrOZv3cqfQFpD2dPLtuJ0Hu/je6zv/NEkaUuCAdru25
         UR2Q==
X-Forwarded-Encrypted: i=1; AL+hErE/Elpi1A17wUAFHyXD/RahAi76eEsaa9A61xrshZoaXdWYftyM0B3li/c49BWEHK/bKwWLdQ3X32vdxQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/39lotA+Uhe68VkihPGKPnNNWqB8b57iN9XdDBQW/UQ9J2HS+/
	PK2eKJW7LbhGgpsesmBu966WJEVfhhIbsZfWCw4xtGbJ8KKF8D2H0+a9ZdVErrhYo4e3qF2OPF+
	foV9OwfjPMyksReB5vN8U/5C+4Ll6KsP6cRSJ+pFh0DsszYVJrSe9V0RDQ8nvh7ImPa5Ibj4=
X-Gm-Gg: AZFdTZf1F2b2EDnFb4bvjlM5QSLRQDoCzERKJWzp/zOunxb++Ak3Egv0rsJGdAiqWG9
	HJCQa72/A4Zq0RjC4KN7lQKgz2ETxmStC85nirInQ/nHGqEkYrHRUBGOL69VTBjHvEt4pSNfPad
	sWZ+WeREqolkeFIORcfZwXKJk2+3D9zt2nnu7SLq60PVxmHGrdz/EUaW2ZbayGM8D6X0diaTBpz
	c11xduu5AgoIRMIgRyzO0EWqkUnXDyJMfWsj1HCq8zpk8MFSct4ptCAReycyBzgLE8WaIBvXVIq
	81XEZs99LtApLpEJSjbu6FNZELZvDHb0T+FRF5S5++GtKOcETDPgSD7CnMkAyrZ1Nl+H71WLVhw
	+GRP1WSXOrRGTD1nxfab3zU0yxTok2h0HGrxoQD9AVrzwhz7yKsg572TO2xnzH9QD+1Knoh/j/A
	kSBPtAMHJELkty1Vy6o94sRSj7aE63P/dVAo4Er5uVx5WOvJtzPDaZtJr4cWTAODnhvF2NFaIfF
	A==
X-Received: by 2002:a17:90b:39a3:b0:3a0:9c9d:eb18 with SMTP id 98e67ed59e1d1-3b41cb20e66mr22029449a91.54.1795687065263;
        Thu, 26 Nov 2026 01:57:45 -0800 (PST)
X-Received: by 2002:a17:90b:39a3:b0:3a0:9c9d:eb18 with SMTP id 98e67ed59e1d1-3b41cb20e66mr22029418a91.54.1795687064755;
        Thu, 26 Nov 2026 01:57:44 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:57:44 -0800 (PST)
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
Subject: [PATCH v7 13/14] perf tools: Initial support for gtrace decoder
Date: Thu, 26 Nov 2026 15:25:34 +0530
Message-ID: <905e9e671d6b23bd33527c828c3dee212341e246.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX67hL4ReMLqF+
 2MnKR8KItiI2qYF9JHNJvjn/6O+XiU1Vr0Yc+6kwTXChSiMtY6YMhJQQB1f41pXsbbmNHs8BnC7
 vq5ntEug7j1qcgfZ7BVERO2bR4fPJoqrFnahdgieg3BuTdyd6QpwwsIE7Vo2OrIwFHJpMwMgcDN
 zzhhNLT9YHOa9oTFML6RXu0Ks2E32TJwkoU1K/PpVUkZfyqwGLaiN0QFlwCe/Be8UZG5cCEAaZi
 ffGl2WE2uA3fs+CzPJ+JBZLpigqEC8pkM0Bkz0plZJgA4tz6UoCIDECSJJMCpHKDOpPRSrR8Vqh
 uN/LRacj3lXtN6LMOA9ECfeBUUqSmnSVtae6/qcj6JWSFpnHnNBV4ol+TGuKIQ7XeSM2gOAOV9h
 +CGv4rn3G6DG47Py4yha+Ed2xD4nJQo7d8e3OBL5UetV21qpA4jd7xtqDEDyPm1A0UOciodk2uz
 Je0gaEGGnbkJ2MXHcwA==
X-Proofpoint-GUID: uX4vjnXd1RFtGDcjr293j3w631yzbOZ8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX9VkCGyO6UMyn
 oJ/BSXaEiupjl3SWW1H7Y9YV4kpWAMdCAdLK0WFOdLsMrDZEfz5bYdMVJoYTwugPSxxyiNbBQdS
 3uUrSX3oDwhO43E9BAehJaUxJr0QGbw=
X-Proofpoint-ORIG-GUID: uX4vjnXd1RFtGDcjr293j3w631yzbOZ8
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b08029a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=QMbGdu15EjEoZvaX42IA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_015746_913871_1CCE74A2 
X-CRM114-Status: GOOD (  22.11  )
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

Add bare bones support for gtrace decoder so that the data received
from the hardware by the gtrace perf driver can be written to the
perf record output file. Actual decoding of the trace payload is not yet
implemented.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 tools/perf/util/Build            |  1 +
 tools/perf/util/auxtrace.c       |  3 +
 tools/perf/util/gtrace-decoder.c | 99 ++++++++++++++++++++++++++++++++
 tools/perf/util/gtrace.h         |  1 +
 4 files changed, 104 insertions(+)
 create mode 100644 tools/perf/util/gtrace-decoder.c

diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 2c1f880c4c47..ca22b84cb9b9 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -147,6 +147,7 @@ perf-util-y += cs-etm.o
 perf-util-y += cs-etm-decoder/
 endif
 perf-util-y += cs-etm-base.o
+perf-util-y += gtrace-decoder.o
 
 perf-util-y += parse-branch-options.o
 perf-util-y += parse-regs-options.o
diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index f77b674dd724..742f21b268b8 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -54,6 +54,7 @@
 #include "arm-spe.h"
 #include "hisi-ptt.h"
 #include "s390-cpumsf.h"
+#include "gtrace.h"
 #include "util/mmap.h"
 #include "powerpc-vpadtl.h"
 
@@ -1433,6 +1434,8 @@ int perf_event__process_auxtrace_info(const struct perf_tool *tool __maybe_unuse
 		err = powerpc_vpadtl_process_auxtrace_info(event, session);
 		break;
 	case PERF_AUXTRACE_GTRACE:
+		err = gtrace__process_auxtrace_info(event, session);
+		break;
 	case PERF_AUXTRACE_UNKNOWN:
 	default:
 		return -EINVAL;
diff --git a/tools/perf/util/gtrace-decoder.c b/tools/perf/util/gtrace-decoder.c
new file mode 100644
index 000000000000..503fbaac12c6
--- /dev/null
+++ b/tools/perf/util/gtrace-decoder.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Generic hardware trace (gtrace) decoder
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <errno.h>
+#include <inttypes.h>
+#include <stdbool.h>
+#include <stdlib.h>
+#include <internal/lib.h>
+#include <linux/zalloc.h>
+#include "evlist.h"
+#include "session.h"
+#include "gtrace.h"
+
+struct gtrace_decoder {
+	struct auxtrace auxtrace;
+	u32 auxtrace_type;
+	struct perf_session *session;
+	struct machine *machine;
+	u32 pmu_type;
+};
+
+static int gtrace_process_event(struct perf_session *session __maybe_unused,
+				 union perf_event *event __maybe_unused,
+				 struct perf_sample *sample __maybe_unused,
+				 const struct perf_tool *tool __maybe_unused)
+{
+	return 0;
+}
+
+static int gtrace_process_auxtrace_event(struct perf_session *session __maybe_unused,
+					  union perf_event *event __maybe_unused,
+					  const struct perf_tool *tool __maybe_unused)
+{
+	return 0;
+}
+
+static int gtrace_flush(struct perf_session *session __maybe_unused,
+			 const struct perf_tool *tool __maybe_unused)
+{
+	return 0;
+}
+
+static void gtrace_free_events(struct perf_session *session __maybe_unused)
+{
+}
+
+static void gtrace_free(struct perf_session *session)
+{
+	struct gtrace_decoder *ptr = container_of(session->auxtrace, struct gtrace_decoder,
+					    auxtrace);
+
+	session->auxtrace = NULL;
+	free(ptr);
+}
+
+static bool gtrace_evsel_is_auxtrace(struct perf_session *session,
+				      struct evsel *evsel)
+{
+	struct gtrace_decoder *ptr = container_of(session->auxtrace,
+						   struct gtrace_decoder, auxtrace);
+
+	return evsel->core.attr.type == ptr->pmu_type;
+}
+
+int gtrace__process_auxtrace_info(union perf_event *event,
+				   struct perf_session *session)
+{
+	struct perf_record_auxtrace_info *auxtrace_info = &event->auxtrace_info;
+	struct gtrace_decoder *ptr;
+
+	if (auxtrace_info->header.size < GTRACE_AUXTRACE_PRIV_SIZE +
+	    sizeof(struct perf_record_auxtrace_info))
+		return -EINVAL;
+
+	if (session->auxtrace)
+		return -EINVAL;
+
+	ptr = zalloc(sizeof(*ptr));
+	if (!ptr)
+		return -ENOMEM;
+
+	ptr->session = session;
+	ptr->machine = &session->machines.host;
+	ptr->auxtrace_type = auxtrace_info->type;
+	ptr->pmu_type = auxtrace_info->priv[0];
+
+	ptr->auxtrace.process_event = gtrace_process_event;
+	ptr->auxtrace.process_auxtrace_event = gtrace_process_auxtrace_event;
+	ptr->auxtrace.flush_events = gtrace_flush;
+	ptr->auxtrace.free_events = gtrace_free_events;
+	ptr->auxtrace.free = gtrace_free;
+	ptr->auxtrace.evsel_is_auxtrace = gtrace_evsel_is_auxtrace;
+	session->auxtrace = &ptr->auxtrace;
+
+	return 0;
+}
diff --git a/tools/perf/util/gtrace.h b/tools/perf/util/gtrace.h
index 63f7560fc15f..acc25748b4ac 100644
--- a/tools/perf/util/gtrace.h
+++ b/tools/perf/util/gtrace.h
@@ -13,4 +13,5 @@ struct perf_session;
 
 #define GTRACE_AUXTRACE_PRIV_SIZE      sizeof(u64)
 
+int gtrace__process_auxtrace_info(union perf_event *event, struct perf_session *session);
 #endif
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
