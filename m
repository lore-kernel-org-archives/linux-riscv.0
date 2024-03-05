Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277D0C54798
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 12:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nF+qui37C7vnPCQaIJH2c0LFFxtnhpKxOiWrlGzLI+k=; b=oMjPzNHNS2ta/g
	O5hKqum5dWWlSi3ZuzJPf+tY50DRcKHogaSnetWStP0M8aUvdTVa0/juMytEDqh9dI2IyWcSqFlz0
	a8bgr9TjmKIqCAhJ3jLKmeKdsmEhd0DNyQj+ZhHZq9eBaJl5B4UHD0KPU9uXb+ziVPZCvEfhd9QPR
	Zm4Wf7MqM0TEgzOIZRJiyfF1QcaapsstkCCwNqetyy2X5a+KrXlYQ48+L9EO3ngmxaW2kcriE6uOs
	LHEdMXV1bPH3L3JPebbRYhQmf7Vo66LKvlwjGWwFKOouXqi4kN3jDBLyghHajRhb3CYVDXIoOOdA9
	9SiHsMprdKN41NSQTkhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhTZ5-0000000DUhq-2w0X;
	Tue, 05 Mar 2024 12:06:35 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhTZ3-0000000DUgc-0lZ9
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 12:06:34 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 425C5fPc023278;
	Tue, 5 Mar 2024 20:05:41 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Tue, 5 Mar 2024
 20:05:37 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
        <namhyung@kernel.org>, <mark.rutland@arm.com>,
        <alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
        <irogers@google.com>, <adrian.hunter@intel.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <linux-perf-users@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: <dylan@andestech.com>, <tim609@andestech.com>,
        Ben Zong-You Xie
	<ben717@andestech.com>
Subject: [PATCH 1/2] perf daemon: Fix the warning about time_t
Date: Tue, 5 Mar 2024 20:05:00 +0800
Message-ID: <20240305120501.1785084-2-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240305120501.1785084-1-ben717@andestech.com>
References: <20240305120501.1785084-1-ben717@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.173]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 425C5fPc023278
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_040633_497271_0228E8B9 
X-CRM114-Status: UNSURE (   7.54  )
X-CRM114-Notice: Please train this message.
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

In the 32-bit platform, the size of time_t is still 64 bits. Thus, use 
PRIu64 to resolve the format problem.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 tools/perf/builtin-daemon.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/perf/builtin-daemon.c b/tools/perf/builtin-daemon.c
index 83954af36753..0b6ffd51c475 100644
--- a/tools/perf/builtin-daemon.c
+++ b/tools/perf/builtin-daemon.c
@@ -23,6 +23,7 @@
 #include <sys/signalfd.h>
 #include <sys/wait.h>
 #include <poll.h>
+#include <inttypes.h>
 #include "builtin.h"
 #include "perf.h"
 #include "debug.h"
@@ -688,7 +689,7 @@ static int cmd_session_list(struct daemon *daemon, union cmd *cmd, FILE *out)
 			/* lock */
 			csv_sep, daemon->base, "lock");
 
-		fprintf(out, "%c%lu",
+		fprintf(out, "%c%" PRIu64 "",
 			/* session up time */
 			csv_sep, (curr - daemon->start) / 60);
 
@@ -700,7 +701,7 @@ static int cmd_session_list(struct daemon *daemon, union cmd *cmd, FILE *out)
 				daemon->base, SESSION_OUTPUT);
 			fprintf(out, "  lock:    %s/lock\n",
 				daemon->base);
-			fprintf(out, "  up:      %lu minutes\n",
+			fprintf(out, "  up:      %" PRIu64 " minutes\n",
 				(curr - daemon->start) / 60);
 		}
 	}
@@ -727,7 +728,7 @@ static int cmd_session_list(struct daemon *daemon, union cmd *cmd, FILE *out)
 				/* session ack */
 				csv_sep, session->base, SESSION_ACK);
 
-			fprintf(out, "%c%lu",
+			fprintf(out, "%c%" PRIu64 "",
 				/* session up time */
 				csv_sep, (curr - session->start) / 60);
 
@@ -745,7 +746,7 @@ static int cmd_session_list(struct daemon *daemon, union cmd *cmd, FILE *out)
 				session->base, SESSION_CONTROL);
 			fprintf(out, "  ack:     %s/%s\n",
 				session->base, SESSION_ACK);
-			fprintf(out, "  up:      %lu minutes\n",
+			fprintf(out, "  up:      %" PRIu64 " minutes\n",
 				(curr - session->start) / 60);
 		}
 	}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
