Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33510CA5FA1
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 03:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KcYxrmaN/w6AKgyOqzNTyQsjVJAX+qU2mO1fVeyq5q8=; b=r5JaWaP/ToerQj
	nKQehOquy/ScaH3Es1T/AC49Tg46YG+zBc+ZIGeT+nsblfknI+U7JXbw8VwUBnTzGsBqkV3KE6seg
	4I6ZBC26rwiD7Tf3vkZA2gvOSpxrq8F2wp+fuZL+hDmjUPO2h5drPRLUa+loc5SqA1wVFGxWPSUJU
	YDoAYUolyXcej76iR7wCKuVJd4mVbCUVrfSHe5wvKQWHMjpdbcrDpU9LLkJfQS5qgkjV7C/hNwVBO
	rzprOprvkFylI0iiUEEbE6jkM7yjVltmn9xAkiHhlWPoB0n+5z+oWObCqTZ0Vpu7CGfbjTss6pvIA
	nfakbps0AUl7VV2ha4kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOj6-00000002F5Q-2o4E;
	Tue, 29 Sep 2026 03:41:56 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOit-00000002F1D-36hH;
	Tue, 29 Sep 2026 03:41:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790653301; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=fTGq35iqWxwugWo9PTY0ZSASRgU7CCPbN3hTCqx5nYQ=;
	b=gvatITDKeIOJ92ooi+X3j9hTZehMpVhgYmOhTCXqrEAODXOdkZSG3y/IjYBX19hQZeDNyUgKUN1Avz/E7fJ4ESwIVidqok2jL0gocd74hJ9HpA2TAzLYPUjPq8DT/FxFr9F27L3DChRkLy5T3YwP66nj3UsML0AvYzNVgfSQZqE=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0XBrsVA-_1790653297;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XBrsVA-_1790653297 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 29 Sep 2026 11:41:39 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: acme@kernel.org,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org
Cc: mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	leo.yan@linux.dev,
	john.g.garry@oracle.com,
	will@kernel.org,
	mike.leach@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	guoren@kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v2 1/2] perf riscv: Implement rdtsc()
Date: Tue, 29 Sep 2026 11:41:32 +0800
Message-ID: <20260929034133.2153-2-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929034133.2153-1-cp0613@linux.alibaba.com>
References: <20260929034133.2153-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_204143_952494_3CAA79C6 
X-CRM114-Status: GOOD (  12.94  )
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

Perf has no riscv implementation of rdtsc(), so it links against the weak
stub in util/tsc.c and every caller reads a constant 0 that cannot be
told apart from a counter standing still.

Implement rdtsc() over the time CSR with rdtime.  The time CSR is a TSC
equivalent on riscv: readable from user mode, constant frequency, and the
same counter riscv's arch_perf_update_userpage() builds the user page
conversion fields from, so the counter and perf time share a timebase.

Define it for RV64 only.  Reading the counter whole on RV32 takes time and
timeh in a loop, and no RV32 user in tools/perf needs it that much, so
RV32 keeps the weak stub.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
Changes in v2:
- Define rdtsc() for RV64 only.

 tools/perf/arch/riscv/util/Build |  1 +
 tools/perf/arch/riscv/util/tsc.c | 27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 tools/perf/arch/riscv/util/tsc.c

diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/util/Build
index 2328fb9a30a3..52cd6a481de8 100644
--- a/tools/perf/arch/riscv/util/Build
+++ b/tools/perf/arch/riscv/util/Build
@@ -1 +1,2 @@
 perf-util-y += header.o
+perf-util-y += tsc.o
diff --git a/tools/perf/arch/riscv/util/tsc.c b/tools/perf/arch/riscv/util/tsc.c
new file mode 100644
index 000000000000..3dd419ce9d2a
--- /dev/null
+++ b/tools/perf/arch/riscv/util/tsc.c
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/types.h>
+
+#include "../../../util/tsc.h"
+
+/*
+ * RV32 is left to the weak stub: reading the counter whole there takes time
+ * and timeh in a loop, and no RV32 user in tools/perf needs it that much.
+ */
+#if defined(__riscv) && __riscv_xlen == 64
+
+u64 rdtsc(void)
+{
+	u64 val;
+
+	/*
+	 * The time CSR ticks at a constant frequency and is the same counter
+	 * the kernel feeds into the user page conversion fields through
+	 * sched_clock(), so it is a TSC equivalent here.
+	 */
+	asm volatile("rdtime %0" : "=r" (val));
+
+	return val;
+}
+
+#endif
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
