Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E26CA5FA5
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 05:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lQHTw/5KapHmuK8azDYqiYwRAYaZiO47gKLFd8fInPo=; b=GwRLkuIoLADvpj
	mpqDpbs4uFB7ITIZM70XQ4JaLbQzUo+6Dop3SObVGIMM6+drKHWF0GckDaPk27VmCaCDtRK017PX2
	83w+5QHkK767w2VFSurrp/9EsNIhjgUCj61lHpepi14e8ufD2CeYOHppiF1+ZBvUHNtTOxrvgdkpA
	+l1xn3LnK1/V37q241NP4FAV70uJsi5uJPAUZfp46/ErFacQt9urdBaGeyEWWbj4xaeBpdg0Oe64G
	Pt4vH3FPxv2UtnxTjmXJTTZhwn3XyrmjFC7gaLqbkbitGstwt3D4I2mjIrGAPmgXSFR84cUGslrG/
	MZ42aFFEXAA5T7lQmRAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9IC-00000007oJc-2dlu;
	Thu, 01 Oct 2026 05:25:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9I6-00000007oCt-0Juk
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 05:25:13 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913g2Wv1509997
	for <linux-riscv@lists.infradead.org>; Thu, 1 Oct 2026 05:25:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7YB32//p3Rb
	6ZZhkIM1gj9mqbzqbA+d2U4F99K6T7xY=; b=WAlX5eIHvmri2GqG1yrmW3xQ0S3
	AIFn/D4W0gzoA8Ohw7aukh9YFfU0+8BuYaEdnOA9jsFVGj0M19VzQYuX3xMBuCVW
	cLDkBy829qvwNN/IETSfev7dMT+LrItUE66qq4XMGxFyp8plXQlf82gTkL5og2zE
	1A3UfdgdHuzbAisTYNN2sPNIn40y8a4J5a0snDXHcA1eK3fQ/r84YQKuPiWA6dzb
	+4OU1lOut7ESuSc3HMUtuc6P9QV++OHV+oMngrgBI0pypVFS3W+znNB85T9EsyVl
	KxljRlrD0IagB8qvV1I0+L8WqU7M73NssCKata1cA8ONHrzVrk3eNzwfjrw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h10bkca7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 05:25:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e2d83bb68cso15751615ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 22:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790832308; x=1791437108; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7YB32//p3Rb6ZZhkIM1gj9mqbzqbA+d2U4F99K6T7xY=;
        b=Bc0dKVTgSlfcLRrFTSLx7BgZ/UMkMPK0+37BJrGpByW6zgVyXVI8KXeS16prJ9/pn8
         U5Aa4StNPUVmspM6DZ8otHph9xUORjAosNTXhck4LHOdbKJGuTLcEhCwXNfQrR98ewNA
         QeKjCepTfPutVeWPoy1OpSe0ir3p6tT+jDPzQziLx/BQgxfV1iEc+GLdur2LzmpoMY5S
         JvJ+/sr9j1mc1K0E4Z/9NmijDzUaZawPUMYroB38O5NFZsE3uYzbmlUlS9KLvx7UZ0m1
         /AHj796zzdcQVpC3zIOfCHCvGUtze0ucCVTUDyVX4y5IBzQ2ibC5TfNTXhtwQgHnz1jw
         /Z2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832308; x=1791437108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7YB32//p3Rb6ZZhkIM1gj9mqbzqbA+d2U4F99K6T7xY=;
        b=b1TLgNqG2DZlwnv49FQ3mBsEiVYyy2+WLU6UqscAcT5w+XLkCV5iGvMEBwyqkqlclx
         YsdTvKzpd4C4DGl+8xOxVdjmSoIOPHK78HeNTm/vVWhSmnkjHS+crSMQQhJ2xQgcicnL
         bYYRAty2yAMUt7vGmUkUGjgJLEkeWQzFkvNS5nVqGssGx5jf129C4LrEeqfpYxlgKpZH
         7mEnQZJ4Y5icT+kxMOnvqNvdzrtpXT50yoOzp26WNsexSaC90ZpY0k+Go343aBtNXy+k
         z4arKMahQ5mXL0Cx3cGhF4MaKFt7MjE10d/AoiibH+ZCYNDbCxpVw4mjE2ZYDejGhmdE
         neRw==
X-Forwarded-Encrypted: i=1; AKwUvBxWFheM0AgwdjVQj8E5J+TEu0p513fV2sEPP29Ye1wHvNbMftLCHhuqPdgHYR0Hys6x+o65LeKPApD5Ew==@lists.infradead.org
X-Gm-Message-State: AFq9FYKGU5CohT1qT4aIm8yItirPfj/Ju9NRShxLK3+6Xnw0dIJCE48e
	qPvyEoT66878K1XeZLawiFy+gUakwWtwmeZjLDHargdr8u7KhX/Dk0i1N1yVgHfAN8VoWsfrwKZ
	jpQZjBj7hoP7itXdb4osyejwld6qId2LHU1A9/Er7FWZnUPXRiIExSgqqj2JlM6RY7C5fLdg=
X-Gm-Gg: AYBFou0E7VoMbBQHPncXS9wf6/9N5cy0imocz6SlV9JXaroISwib2k4GA4L7MJP08oC
	WWo+53R9a1NJibRFBjL1sRVfG/HwOSxHRTtc65BoWQ+vo8ILmPbypaprhE0PzKA+jl3uwn6GLho
	05rtII5LvirKs024ZxncJ9SURdGZn+v8UrllUKAvsZ4rRtyLL92YQeGNfuGVYZHlGiwuTlRWTf+
	yMohPtQhW+LKw89QeX6DkdvtVTdAClIoViCX3tkQNasaHhhW9xjOUD026RVO/82Gte2sD5KRrAC
	8d19MO5o2G2kxCq2CFlYx42919ggqNHP8ERUW1pz40vycRRLAdE2KFmmQAID38LkEvR+BBCeCbq
	V1QXVPCgrTvzmp13jJedgyhabPSfe/xKTtgnQVfMrRph/+DfxyhTqbswIcpaueOEqE86ijGsMnK
	Zxj+7TgpZYwKKwZkFXmt/6JbPY
X-Received: by 2002:a17:903:b8e:b0:2d6:fd55:3a9d with SMTP id d9443c01a7336-2e2e48b8521mr28672865ad.3.1790832308101;
        Wed, 30 Sep 2026 22:25:08 -0700 (PDT)
X-Received: by 2002:a17:903:b8e:b0:2d6:fd55:3a9d with SMTP id d9443c01a7336-2e2e48b8521mr28672595ad.3.1790832307607;
        Wed, 30 Sep 2026 22:25:07 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e300b851b9sm5152715ad.78.2026.09.30.22.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:25:07 -0700 (PDT)
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
Subject: [PATCH v6 13/14] perf tools: Initial support for gtrace decoder
Date: Thu,  1 Oct 2026 10:52:24 +0530
Message-ID: <20261001052243.3042627-14-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: NVp0I6kzIV_G4F86rZZwTf1ZvhSrMhIf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfXzxtiiU1t2LH6
 U3Wp2nnj72K/Xrpbet6uH55kcBfiSU2iX7wQaqZpw/BVFowRBNPgtLCPrGUsDzYVqTuQ5NbUOXi
 nSwscGU9lW4uoGzNECNYgQGIHqWkf8p+RIPYI9aIXLaIUuZ8CVp46AMdQ1TIYJqlCc38rGMa4Fy
 RUmZss0sgdjG9/3BLhtbm1XAm+ye8iYj2cQ5FhiDeE/M2TV5p+4x7Xy8YGJXXM5mUbqAiGaKmlt
 k6cQAMYIanQ7Sqci26HssSM6zvXG4Oc4BGxtJe2WfGVMGvH8CnZXjdhbWkCjxjMwKULIyqTnu9M
 oUI5qe2pMJLp1v8kHsBt/qQPzVP1PiORIzlDB4LL4ivyY1qR1Pa8NFDC6IR+b67ytpIPxE6NmDq
 C/HXiYZwN39yDB1tD7QmxEIHuY1wdhpz51DQpAixPnvvhcOn4eEO7Gkv2KOO5d1hZV166bFlMfL
 RG0gRZmmswaFsKk9SRw==
X-Authority-Analysis: v=2.4 cv=MZn5KJ/f c=1 sm=1 tr=0 ts=6abdeeb5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=pBE9Ga8SiHy0nNBnfKcA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX1U/09TAMJH2H
 btsFUjDsATa0qhVhOmPekx/zyHuByhBHPxeyTTyjZ8MK90rzI36Nl8hPr2ZplJweSTIn3N8MG2j
 F1MCal9VLCNJ6Vy8469mo5qstqsycVY=
X-Proofpoint-ORIG-GUID: NVp0I6kzIV_G4F86rZZwTf1ZvhSrMhIf
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
X-CRM114-CacheID: sfid-20260930_222510_230355_6F7A8255 
X-CRM114-Status: GOOD (  22.09  )
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
 tools/perf/util/gtrace-decoder.c | 95 ++++++++++++++++++++++++++++++++
 tools/perf/util/gtrace.h         |  1 +
 4 files changed, 100 insertions(+)
 create mode 100644 tools/perf/util/gtrace-decoder.c

diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index b26a0b1ddfa3..d25140a0d64f 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -149,6 +149,7 @@ perf-util-y += cs-etm.o
 perf-util-y += cs-etm-decoder/
 endif
 perf-util-y += cs-etm-base.o
+perf-util-y += gtrace-decoder.o
 
 perf-util-y += parse-branch-options.o
 perf-util-y += parse-regs-options.o
diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index 1ecdde597153..ba750d089a7a 100644
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
index 000000000000..c25fbfc61928
--- /dev/null
+++ b/tools/perf/util/gtrace-decoder.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Generic hardware trace (gtrace) decoder
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <errno.h>
+#include <inttypes.h>
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
index 343d2e9d4fa1..02db4f2ff9f5 100644
--- a/tools/perf/util/gtrace.h
+++ b/tools/perf/util/gtrace.h
@@ -13,5 +13,6 @@ struct perf_session;
 
 #define GTRACE_AUXTRACE_PRIV_SIZE      sizeof(u64)
 
+int gtrace__process_auxtrace_info(union perf_event *event, struct perf_session *session);
 #endif
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
