Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124CCC5AD55
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 15:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sNfYIblawsPM6FXVpwSjfzK43oQzW7F3nlob9oPGmh4=; b=rgJViXouIxqdWX
	eScO/Z25eR2sUrelCxbkTTgS6ErTW5wJ78KalrBKqmykdgiwkAM9CO0r0LGa11sRe+0DGFnDKOsZb
	2jWzjZ0MDUtp7r21ew6qNKt/AGUaLjKnMaVaQCMyRfcS871mVDPMKKgalnNMVzTsqwmROnROGh5UN
	4M/AoQwoQTMNkYlwSaVAVhP9BLU35Z0EHHn1AGgCVSy2idsLdVtDoBSaNRJgwO8QJKY3lsgQeRwGF
	wDUmDN8zrSomtlXC1IjjNGlZjGgqbUkvx4/QlwPpu/Juq7BrfFzWXAvpxuiUdhORqBFISFOFw7K+X
	+dUh9sIinGDhAgkfGAmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRsP-0000000CFci-3znT;
	Mon, 10 Aug 2026 15:25:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRsL-0000000CFZu-0ds4
	for linux-riscv@bombadil.infradead.org;
	Mon, 10 Aug 2026 15:25:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QfjYrKxKbfX2s3AbR0cFidaFV2bBYJPCsLbt9KgbLlk=; b=gNLB3fUCqOzrK8ys+uA4dXzz2y
	ReSwFZloDNnA+F4BweXPjp9MKf0B/ka2PfCpEVKokcug0VDqZorQdr+lR2db8yqEsBmLQ/1Miti8I
	ZKACdQwGSS0eP25fh+XDb9jtLLwfGJW8TTwcHT35LGl6ctB5UM4LO9Ou96ZBPE86T2rZe9CxK7XVG
	j5edYEYXja8sgHMrIH8LgSAQLvZqLyZchUZgQ9VGZ+Z3DOlw9ndtvnDcHvQ8GKbJQoJoegbf8Jxzt
	1L7DtXK9u3pS9+xYuPdQcaPvexBS4t0D5CWPt8ql3hCiiX3FyyjSH1IxNS3r4znrhcrrdoup7jhQu
	iN8Qz7kw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wtRsE-0000000DwCU-34ol
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 15:25:15 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACiwWt914586
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 15:25:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QfjYrKxKbfX
	2s3AbR0cFidaFV2bBYJPCsLbt9KgbLlk=; b=oJK2RHocf9Va6uS5vrKXeBBhXaw
	R4ziwHFl+UIN6W7ZhGN4q6xrVUPSUByQ4iMcttt/ob2LrATdh1vgkN/GV6MU+gMC
	aEMPAH8FsfXiwpJOO/Ev17oqkLy/kfn38Bina7uO5VnVSxIRtWeE2nLYbZjGbQha
	EVqJBgvHK1SPefmelxFlLWAoS7h1DMHfdHFBMNca8qZn6dXMFxJX369Q+zfeC46T
	GdXLngB4tr3YL7/rD9SpwpybV1LZNDDwCTXVpxvDcZCxyj7FQrNi2jUpVlYKGKl+
	ZHgxWTKlHBjgHFz9G8GHPQdGYALZXeSMvojf8Br1+fs93QsUDA5zycMO0dw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v927ad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 15:25:08 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e04598adeso1729426b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 08:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786375508; x=1786980308; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QfjYrKxKbfX2s3AbR0cFidaFV2bBYJPCsLbt9KgbLlk=;
        b=WYjBFvo4ZWNKKqEVYDhem0XbD2p40D8XlGsmo8odkrg65o1w8wm4BLFHu1m/eUvh+1
         azXtMqfCuNRK11KdTnC8gWq+6c7foWinsT06ZziGC8K4xsTUuEK27GZ7iL2EFbAa4GMB
         0mhmIzPpSb3MQ9hn7tdF0pbxPQFCTw9jDjtrXjil37ScxHWmUZ29YM8hTAnNRe7rIK1m
         fERY5JoU1PXL1iPjG4+wUEJUAw0k6zxGfr1nM9avNxcUfbz7Tv3cKZ6EKUKeSSYI2fHV
         eMXtRsIzOyDpxfQtwB8OAZu/iJU9yatnVl6uq8wXMxNzmvk87bw5SB1Z7qAeq9R58mH+
         IvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375508; x=1786980308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QfjYrKxKbfX2s3AbR0cFidaFV2bBYJPCsLbt9KgbLlk=;
        b=F8/VL8KnQDjZ0PIxpLDMy/jeIY11aTsFGk2O3bD5HZUi29qbD8a0LycZvE43DGfAlM
         nTBu7TaVdCDf+5amk+Y5E98iqPZC7qwVzFR5/QKaCnYHLViZp8Y9SKEqww5jwSJx5Vc6
         R3hvDFiLSZVNAzlrp11CAt8EjD1TUCjXYyBB6U0zI7JpUj/AH7WRxJjdWXBCHd+LvM7I
         e6YHLFKJxGFFQinlgaXiEL6Lu3iKohZWddWelECms0b3RHQMj2AjI+t7eiOqIHsznHgr
         /AACKO+UCqDETW0xYshjiT+qwDoxLLiI4HhV2REP9Au5S29yMAqWfaUK2iZHFzLYWliU
         5vkA==
X-Forwarded-Encrypted: i=1; AHgh+RpFXUNGbhK3ZgK7NN1tv+tfNGCnOM0xQXKe27z6/DQ0bTOJp2ImRpNGOmhlbBBJ7xcnpkdDcE3u0E2Paw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvReob7QMRPgJJAvLLIrjvK+2N0T9OqWdkNYjI9XqHCRoRqfJv
	hS34bU0dpNIo3e/JjjInhoPcRr4ujDAWnfEdR3MdCU6OzYi8xdXoW6qWpH4RO997VhoOLJSJ8o4
	UYaLaA+ygpHXyPLT1uyWxrdVJ2em9ecgVMD6T8xjlNoDEMHL4rmSFom+s6Qj7eR7T5xQmjOE=
X-Gm-Gg: AR+sD13qrpEpZ8Sa/6y4GqhAyb9GqKYqX+aRbguS0i7e8AD+MNbS7tR1b0dTwAcn88g
	5S7Q/CFzEZYrqIjIxwk2xbocvPiIxkU++rjt/hY4G+XZk3zYBI1ay5Uxnqm+K6/Pnssry44QfKi
	0ArsWx5te69udS/1TINUja+3grffQicZ4gUD5CzUs7yQYsCNwwYgiLnW6L+U2fone/tRKnztgGT
	+uZk9QYKh5KFZWfhVzvdkXW4u1NyuDD8dA4opbRxUF0jLTJhvRCHoHa2fO5l+pEL2OjOrXYxc7C
	ggHVphp/uUhXckAUwduY4BmL/CqNlkfDABE+G2MCpaWawmxvhMxXfwidMDKF4cFolGb2epp41FV
	QHRCGNKhOpi503jA3UcV1pC+fAy6PVSFAJ8yc/z4pODAvv1ImN0/kn/v/ehXTv3MuTmb/1ZTzmv
	W4ICdNdf+UGVcsvfzS6zGvrxUt2A==
X-Received: by 2002:a05:6a00:18a1:b0:84a:29a7:f3b1 with SMTP id d2e1a72fcca58-84f4fdbfe84mr31231095b3a.16.1786375507689;
        Mon, 10 Aug 2026 08:25:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:18a1:b0:84a:29a7:f3b1 with SMTP id d2e1a72fcca58-84f4fdbfe84mr31230942b3a.16.1786375506737;
        Mon, 10 Aug 2026 08:25:06 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm4282634a12.11.2026.08.10.08.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:25:06 -0700 (PDT)
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
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v5 13/14] perf tools: Initial support for gtrace decoder
Date: Mon, 10 Aug 2026 20:52:15 +0530
Message-ID: <20260810152223.3946743-14-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX+dpvAcePFpy4
 vVpytEuCKN932NbqJIa87Z2kxJH49WJ8YZ28j17RTelUOqGNQ+u+86uZ6O3RaV2vmpcb1vJ+Mv/
 ZbXjQ6RNkndOjpfU4W4W+KcPhqvRCPY=
X-Proofpoint-ORIG-GUID: 6ac5snf5bU4xv-lhucy_h1igR_m-UykE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX4jQpb3T8LILP
 IbNWBUd+XAAEXGhCrWVhl7naptN5esdpkr8ev+bhlVrMsaFDzblf3Mqj3idEwUeXpYYs1Nw//PK
 OVd2IWx0vPm0Mb+2mqDeIdC4asOMnkI5/wN/1nc3eIHzUk4G82UiGhzuk0w+0y+NIr4vhJ+xfFG
 vH3NJoTkat/BBJrU308ZM1RTZ/+XwZh5Ng6NLCPiLVDyhDwxVkEg5OMoGIaMwJMIJ5zt4BxTpPF
 9vF2R5Iq0gWQZgf/1tuSM/tF2e5UPhD9ZhyeyKMvJqVJf5ZvArko7AYCzmi6dvtCBqYliK7T+tf
 7OP2qOQ3+wSkrsBN7qQbMKfbuPDHLkieQa/Mf9GdL6iiI4FazyLnrBcoJt1xMx5B0FgTJjHXZbq
 uPc/SZ7PGlsYBiTdNZhPLvYvXjxZzuUqznJaSwemc4bbg6UUaqPy3WsKR7ZD8x/VNcGb+sonzA6
 jLB4XWNzbsHAVMIVPfg==
X-Authority-Analysis: v=2.4 cv=T5m8ifKQ c=1 sm=1 tr=0 ts=6a79ed54 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=pBE9Ga8SiHy0nNBnfKcA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 6ac5snf5bU4xv-lhucy_h1igR_m-UykE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_162511_920474_19BD76B4 
X-CRM114-Status: GOOD (  21.96  )
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
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
---
 tools/perf/util/Build            |  1 +
 tools/perf/util/auxtrace.c       |  3 ++
 tools/perf/util/gtrace-decoder.c | 93 ++++++++++++++++++++++++++++++++
 tools/perf/util/gtrace.h         |  1 +
 4 files changed, 98 insertions(+)
 create mode 100644 tools/perf/util/gtrace-decoder.c

diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 5e2265018826..7bd752b5ae6a 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -148,6 +148,7 @@ perf-util-y += cs-etm.o
 perf-util-y += cs-etm-decoder/
 endif
 perf-util-y += cs-etm-base.o
+perf-util-y += gtrace-decoder.o
 
 perf-util-y += parse-branch-options.o
 perf-util-y += parse-regs-options.o
diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index d7f27ca15b81..8eda626aede5 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -54,6 +54,7 @@
 #include "arm-spe.h"
 #include "hisi-ptt.h"
 #include "s390-cpumsf.h"
+#include "gtrace.h"
 #include "util/mmap.h"
 #include "powerpc-vpadtl.h"
 
@@ -1428,6 +1429,8 @@ int perf_event__process_auxtrace_info(const struct perf_tool *tool __maybe_unuse
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
index 000000000000..4a1571431edb
--- /dev/null
+++ b/tools/perf/util/gtrace-decoder.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Generic hardware trace (gtrace) decoder
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <errno.h>
+#include <inttypes.h>
+#include <internal/lib.h>
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
index 4b87bdaf55c6..3531508b1dfb 100644
--- a/tools/perf/util/gtrace.h
+++ b/tools/perf/util/gtrace.h
@@ -8,5 +8,6 @@
 
 #define GTRACE_AUXTRACE_PRIV_SIZE      sizeof(u64)
 
+int gtrace__process_auxtrace_info(union perf_event *event, struct perf_session *session);
 #endif
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
