Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9B9606A319
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 03:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hfz+7mOb;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=d8oBdGKt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hFmWgv59DZ/JKsN6Mb0dv3sL7iOYdJPHEXFMw84SCPg=; b=hfz+7mObSFru9D+sCoBtQo1LM7
	t0A4ydvYUR8QspNbJ2o3A4yA42uO0HdG6LMhBqja95ZZwh9o+5GQUawR7JRG5JS9lNBtNs/PErFaH
	kAqOltcxovp371duzK9I3XQa23XQxSx76bSonuS0LlRxw+TSYgvLnsjePDfUsxWoxb4umhysSgEE2
	Ihon4T+D1zoGuyz3lkyTtfiMLKgPb+Vw0s/XcYpFLOBF6kw8UQVTgAWFzUNlhfoWch2tA1nyoFolZ
	MAkeMSy6VayOaszsS//QLUPqUasOz3Gg/aaGZL5uCuNQPyp3w1c2DHAHF96Qf18Vm/ZhUS8pZ2ecu
	wGwhiXCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5nm-0000000FPq9-3q2k;
	Fri, 23 Oct 2026 03:18:42 +0000
Received: from bg2.exmail.qq.com ([114.132.123.192])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5nj-0000000FPn2-2k1r
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 03:18:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725393;
	bh=+WBQ3KUrxVlusen205hCCYNtLvRYypDOARxrViWC5DQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=d8oBdGKtmiMnZHxUM5wFQrLvP23inNM1263LR9g87qEsA1Mtz9j248eFA312xWHFL
	 3sZ8dnahcdRKxDt04COTnyNtFSXjLLCRLPESzqKfLjieFBBqdvfYKaqsphOAJk7xv1
	 sPzrkvV+O78BTD2iw+laaLBzyUo4OZB5O9Aol3FA=
X-QQ-mid: esmtpsz11t1792725389ta2bde7c4
X-QQ-Originating-IP: 46XquNWinBTzsa8GMzaLVwRLdipfJiqT94mCzdvABSc=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:16:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3631083015316415151
EX-QQ-RecipientCnt: 26
From: Zane Leung <liangzhen@linux.spacemit.com>
To: gregkh@linuxfoundation.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	alexander.shishkin@linux.intel.com,
	suzuki.poulose@arm.com,
	mchitale@gmail.com,
	anup@brainfault.org,
	irogers@google.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	alex@ghiti.fr,
	atish.patra@linux.dev,
	andrew.jones@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	liangzhen@linux.spacemit.com,
	zhuangqiubin@linux.spacemit.com,
	coresight@lists.linaro.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 21/24] perf tools: riscv: making gtrace PMU listable
Date: Fri, 23 Oct 2026 11:15:02 +0800
Message-Id: <20261023031505.2020925-22-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
References: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NYjpXBnE0/Rup0l4Twqb4LvcWX48TVzAlt0RY+oxr+Ukm98a5RZpwuVD
	o1T6aQJRkWqVvhLfVK7SnNNa4UWrBXR1By9eSVSGQStz7Bw+JRkFcWmMfRfQwn5MHzAB2Tl
	PrR88ky9CTyBy9/0udjEd29UM9LqyDBFKLWt+agMG3lPNztZQprs38WE4WBSU1vUhu/EOkF
	RvgjOcqG1gROFc/sLR03XLgeheSBJ9KRcH4snSX8uLs+e56Qo9MfIXAJ9OCpFYauAX+iwXf
	ukC6xl2qnUww9XoW4+2fdHdG1JoQleyvJ966x9ITawHHMHynqPIYxPaK5nYGPMQFrH6Qxig
	XtTHcDSf/c75MXIyrznDYZrUpjo1NHOpGe0wFGsBRqAsfMV/PvHk3j2gWWCrhdAA8Nu0vSi
	yUTPVZ/nC+Uxyn4+M0G9Gx5yT30lbgPtIibWqiyaD4a1pmMDcbi5Qc/BMQ26brEZ2Y00qL/
	0kpMB2NUieniMqkZ8io5t3/5FuuMoxzcm/KpSFaeot8gazWERVuYltlZK0BeH80ps5smvd3
	N6pT9Ujd42D1e3ZAmyai2bItqQuzf+XWIOBYlkwyYo5LZ78nfR45id9cXeGhjTny3APDCsl
	xV+08C+x2WctvfDuPnoX1V0bNm1gBrBieW/zwdXGKTMwjnDhcxx8ZLgKclnYkC+kCFvfF0F
	fx/1uEax4PM1mnEl+GK0xjz9qx62Jrbkfkowm2AagsRT3nDtI6RZn46/ZL4QPlYaoIT/myg
	eG4JlocNHxi1qncwp832Brr4MEGbKlq/bsj9mzYN8/qim53jw5AT+JZv2a8RGSycSRefMaM
	BMp2pQbv0Y1zRuXqTEnUjoE99LdEQzlp5S23KbbgPKWyUEb0KIw4kbJVClouK+U0ByrDrMl
	56T1F27XtAl615SfB1wTYjHpDZcc8CKdLOLAviAGv85jXYVSm4AhnrEbZ8sB+k2JoHoSTFH
	SDm6iRk4N+FJn3t2AJfmepb1LVJ4gV29ZGqHCA50RSVmOSIkBBP0OpibcBjr94gZDeZnBwJ
	Orhx4rU+fj7qzBjAGvaHwbEbOQiSuhuNnAybEzYhLlXRRiYvsLw7wNSE/WYy19qx4KUKlJh
	UaF2bNqdAQdwyawfcMkZPehQZZw9D78Lu2VICIBaUIz1f4DP/T/sVx6/lFvrEXw0A==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-SPAM: true
X-QQ-RECHKSPAM: 3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_201839_990713_A88FD8F4 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This commit enhances the RISC-V performance tools by allowing the
gtrace PMU to be listed and selected.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 tools/perf/arch/riscv/util/Build |  1 +
 tools/perf/arch/riscv/util/pmu.c | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 tools/perf/arch/riscv/util/pmu.c

diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/util/Build
index e07d5525ece6..57991c43e8f0 100644
--- a/tools/perf/arch/riscv/util/Build
+++ b/tools/perf/arch/riscv/util/Build
@@ -1,2 +1,3 @@
 perf-util-y += header.o
 perf-util-y += auxtrace.o
+perf-util-y += pmu.o
diff --git a/tools/perf/arch/riscv/util/pmu.c b/tools/perf/arch/riscv/util/pmu.c
new file mode 100644
index 000000000000..8cb8c82182ac
--- /dev/null
+++ b/tools/perf/arch/riscv/util/pmu.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Spacemit Technologies, Inc.
+ */
+
+#include <string.h>
+#include <linux/perf_event.h>
+
+#include "../../../util/pmu.h"
+
+#define GTRACE_PMU_NAME "gtrace"
+
+void perf_pmu__arch_init(struct perf_pmu *pmu)
+{
+	if (!strcmp(pmu->name, GTRACE_PMU_NAME)) {
+		pmu->auxtrace = true;
+		pmu->selectable = true;
+	}
+}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
