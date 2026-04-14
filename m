Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97FFF531D0
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 03:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Ra1mQcvHLQq0WMw+TvONgGLqVgPjpNX5HEhfGhH8/A=; b=SjA+zcks4vv214
	vssVJJb6SLPcSLHp+915w4ecuz1b/Kwx0yxqm2toQOLtAJ1JQPWIMwHChky9lcID2HaTqmkWY/DM/
	FKpFxObkFBqEuksx3MPGbk/AH8SpOe/qQ835LOw6ZnNrfB5uNUqu+9ZJSLo1dofb0hpe+6Hoc0bRr
	6gUbrUULt+B3rt9JslmGZ7kLuLfedeVa5MOChdmtzwRJF11MXWgeEQ7dPL0kt3o6NS8bkwD04M4ez
	hG4w3yNSqwHYGWnOGHY9W5cW9eoEHEWTeXTJHo4m8vttNQ1nLuadskc8JZmU1B2IB/MXV1n8QdrE1
	uMBVItlHXPj+Zl3pdQvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUgb-0000000Gezv-13BS;
	Tue, 14 Apr 2026 03:43:37 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUgU-0000000GenJ-1axg
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 03:43:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1776138155;
	bh=hJlG+Wz9JKH3QRYT/KnvDDklIqbK7yJhX6cMo2Xrc5U=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Nmym9aQgmb4hTnXJtS6zhoJM+/BJyFyBHsfrPU66tCZwVDFH3z94nfVCd9yrPgg3q
	 J1gcmnHxepprnbdg9eL5Y1Lyam3/pSCSM1HQRQ9RfccFhdb9kS4gEd/ZHCZMKV0Mcl
	 41tyiIY92HBtupTAJ88/SSrJFoRG6KTYVbccJj6U=
X-QQ-mid: zesmtpsz5t1776138146t253d7502
X-QQ-Originating-IP: rnR3Nd9FAESxstt5RG9UujjCB3hlzi1zwI6uqv5e/m4=
Received: from snode5.. ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 14 Apr 2026 11:42:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1839721278540660278
EX-QQ-RecipientCnt: 26
From: Zane Leung <liangzhen@linux.spacemit.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	gregkh@linuxfoundation.org,
	alexander.shishkin@linux.intel.com,
	irogers@google.com
Cc: coresight@lists.linaro.org,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com,
	mchitale@gmail.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	andrew.jones@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	anup.patel@oss.qualcomm.com,
	mayuresh.chitale@oss.qualcomm.com,
	zhuangqiubin@linux.spacemit.com
Subject: [RFC PATCH 08/12] perf tools: riscv: making rvtrace PMU listable
Date: Tue, 14 Apr 2026 11:41:49 +0800
Message-Id: <20260414034153.3272485-9-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
References: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OdImatYx1y6xT5bTeE/xuvxDfeyIYpjwTBtI3jzzB3Q47T95OoDx+PcI
	LziPZIIcFTIPyZdsU/OXBANNIw9fRvYIBe+QZEJVZWc2b8MvJKqVl0MaJFud3svvuNtAfkZ
	GCHvkFmdvxLQUE1SMrNtITQmGMct1GxAGW1iKaHxERGoXS7dMpe4nntNroe7WFPDFieX8zt
	gvapxh4mMW0ppSfoDJYligBooBBOggMrPq2eZrbnTElVbCZ93lA0ZDMyii1+UaCtxNoB+At
	74fuWXXXjsCQpr0cKKvZjT1k5+EomjunJI9PgPHJJ9PrAtjiX7mYdfUVwartRK+UOIADO8o
	1CCUeYIIWNjNYBb3Y1gHoa6JI4RdwBDGDeA42U//jiPuY2tu/abH8ry6Z7B8zObcIq+0f5k
	khHDKv92/YJLo5FA6y6IzhWNt79eYrMMLZ1miqI13k1cAKJaz/qp+XU8p186NrNS3Qbr5v2
	TENgiOKQYjDSr4C+ee5p/VVtJRkYuUjZ8q9eDzKMfVMDdu3YklK6W2JNrlpL0pHpqmkMjHe
	z559J6ejz78RnqjNjMx4nkiI2x5ggQE8DS1+7v1Fs5jld401EL4LaFqGojroKcOzuy/sUMH
	a2ZtInGD7SD+9WmrXhv0J03TN+i7ppK5EbEoAQeDOW5v246OFQ+W/MbGYy6FomX2htYCov+
	BRON2x5YJwLGP6xGhwAfYIdaXpSbYTspRQVZTEjX1NLlX8sLi9QdazQ2tlAuHtcweH7dvKp
	4DPQ1LvGT5oZWLK6Mwg4rbid6DVaGMD9Ig8pZXWJiKjQ9LQIgxgC2XpCaZ/1wv46SF8xopW
	Ws8iRqzXf3Jga1kSe2K/cNkkd+67s2Xl2f5bjZW5ieDYf2sDLj5VLFgUja2g22BIXN+huPH
	QLjQKVepyG/Kc+KxqwudJhJQ/Aln/ctMQ2SnI4YA4dKZYiP8uk9k5q+IpyL9JJpuL1vzjR9
	x8WNlEQbmvODCo7aF7cXrdFdQJHuMHqJfnz1MNsuu2uaEeV7aZg04d8Tub0WsqFenMLAAOs
	5f5mVLDyfC++DO1rf9vxoRQCf31r0/30Bui2lsuOJK2rwALDe0SBXW3M/aoZB93ncTZiFGs
	3R953SSUe6ubMuGGZ/gry58vHZib9yaW15wvOIeNlQ33EAiglBI4bU=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_204330_881251_92FA6E29 
X-CRM114-Status: GOOD (  10.47  )
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

From: liangzhen <zhen.liang@spacemit.com>

This commit enhances the RISC-V performance tools by allowing the
rvtrace PMU to be listed and selected when auxiliary trace support
is enabled.

Signed-off-by: liangzhen <zhen.liang@spacemit.com>
---
 tools/perf/arch/riscv/util/Build |  2 ++
 tools/perf/arch/riscv/util/pmu.c | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 tools/perf/arch/riscv/util/pmu.c

diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/util/Build
index 2328fb9a30a3..748068a3a5c5 100644
--- a/tools/perf/arch/riscv/util/Build
+++ b/tools/perf/arch/riscv/util/Build
@@ -1 +1,3 @@
 perf-util-y += header.o
+
+perf-util-y += pmu.o
diff --git a/tools/perf/arch/riscv/util/pmu.c b/tools/perf/arch/riscv/util/pmu.c
new file mode 100644
index 000000000000..71ad1c8884d0
--- /dev/null
+++ b/tools/perf/arch/riscv/util/pmu.c
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright(C) 2026 Spacemit Limited. All rights reserved.
+ */
+
+#include <string.h>
+#include <linux/perf_event.h>
+
+#include "../../../util/pmu.h"
+
+#define RVTRACE_PMU_NAME "rvtrace"
+
+void perf_pmu__arch_init(struct perf_pmu *pmu)
+{
+	if (!strcmp(pmu->name, RVTRACE_PMU_NAME)) {
+		pmu->auxtrace = true;
+		pmu->selectable = true;
+	}
+}
+
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
