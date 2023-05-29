Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1C2C7EE23
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 19:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DYAV5M+Wl/8YaqTS1kBXZ1Hl7nBe5CJaFHwFMmljsQ8=; b=o9jdmsYFNBMd8W
	IQ3BDrlzhbFTQjRRHcTLpGlrtyi7j99PeiXvaQa0/4p7eBvvrcqEpxKGMVhUbV143L+rQvwxQHXG2
	bigCOohYZsYK1kwoJdWKiiBf0nQqCjQzs+0Sqr4TT7eD9ZQM/Om/Enco7XYVMw5l8BfnuD5wBuWWc
	Jb6AZw4zEfDmIpVtSG5FzIgjn8tya/tpHIEcTD0xF9klsAI7Skzk44ZZe99tnpQWrZfYnCj4Rl8kZ
	LoOQs8eCxeIIaBUjnmoeFH6/alBrVoBPZkCZMl7pxX8v2CbWqMRZG1RdAOEEpEKTouLLHK2YcKlxs
	lgTxDa9eCcJqX6YwnkgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3iyo-00BZUJ-1z;
	Mon, 29 May 2023 19:56:34 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3iyl-00BZT7-0H
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 19:56:33 +0000
X-QQ-mid: bizesmtp78t1685390175tmckq6oi
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 May 2023 03:56:14 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: CRJwvrMA7Ii5QGhWTR7gAjDn/im3cUJTMJLrKCItiu9//IedHrZO8VPqve9CI
	JREbxHhECEfjcwj3iOLI7AtJRxZhcfwcuO1SA3a+CkIkUPFo9ONYVTiml7M01fxeghXu0CT
	vdthD4zOS6F9DsGvD+yFqUeF+tsLVoWmREiNsqk8v4emuWimsNWz2q3X91Rr5bTzuDeRHu1
	8SYxkOwE40helGX0uZm1e7sq9E+ub2TQrpXIWvhGbqB2tcaoNclftY75ysAHMxF/uv56ubI
	q3Ha1mhj6elqdQbHhlOWR2LgMgKeKz4aGx+iiiglqpb3OKP3Sh2pYWRiEYiiIwD3rL2aP6Z
	skaIKTfTv2vEIU7Boxl8Xp2wT5XTgRGw92F+cgkFVvRT1zRnHdRY8A885R47PP8mfLT54NQ
	3BjvdTpJLo4=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14858657345865464071
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v2 08/13] tools/nolibc: add pure 64bit time structs
Date: Tue, 30 May 2023 03:56:01 +0800
Message-Id: <c6bf754329eeb61a1ffe8f9e04ec70cb02e1a2ed.1685387484.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685387484.git.falcon@tinylab.org>
References: <cover.1685387484.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_125631_428194_C98FB3F0 
X-CRM114-Status: GOOD (  14.84  )
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

It's time to provide 64bit time structs for all platforms, for y2038 is
near.

There are still old "struct timeval" and "struct itimerval" in
include/uapi/linux/time.h, remove "#include <linux/time.h>" and add our
own pure 64bit ones.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/linux-riscv/9e4064fc-f0c5-4dd3-941f-344d2150e1cd@app.fastmail.com/
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/sys.h   |  2 --
 tools/include/nolibc/types.h | 49 +++++++++++++++++++++++++++++++++++-
 2 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index d0720af84b6d..1b3675d4c5fc 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -17,7 +17,6 @@
 #include <asm/mman.h>
 #include <linux/fs.h>
 #include <linux/loop.h>
-#include <linux/time.h>
 #include <linux/auxvec.h>
 #include <linux/fcntl.h> /* for O_* and AT_* */
 #include <linux/stat.h>  /* for statx() */
@@ -28,7 +27,6 @@
 #include "errno.h"
 #include "types.h"
 
-
 /* Functions in this file only describe syscalls. They're declared static so
  * that the compiler usually decides to inline them while still being allowed
  * to pass a pointer to one of their instances. Each syscall exists in two
diff --git a/tools/include/nolibc/types.h b/tools/include/nolibc/types.h
index 698d859fc6e2..4ff35b7ea2bb 100644
--- a/tools/include/nolibc/types.h
+++ b/tools/include/nolibc/types.h
@@ -8,10 +8,57 @@
 #define _NOLIBC_TYPES_H
 
 #include "std.h"
-#include <linux/time.h>
+#include <linux/time_types.h>
 #include <linux/stat.h>
 #include <linux/wait.h>
 
+/* based on linux/time.h but with pure 64bit time structs */
+#define timespec __kernel_timespec
+#define itimerspec __kernel_itimerspec
+
+/* timeval is only provided for users, not compatible with syscalls */
+struct timeval {
+	__kernel_time64_t tv_sec;	/* seconds */
+	__s64 tv_usec;			/* microseconds */
+};
+
+struct timezone {
+	int tz_minuteswest;		/* minutes west of Greenwich */
+	int tz_dsttime;			/* type of dst correction */
+};
+
+/* itimerval is only provided for users, not compatible with syscalls */
+struct itimerval {
+	struct timeval it_interval;	/* timer interval */
+	struct timeval it_value;	/* current value */
+};
+
+/*
+ * Names of the interval timers, and structure
+ * defining a timer setting:
+ */
+#define ITIMER_REAL			0
+#define ITIMER_VIRTUAL			1
+#define ITIMER_PROF			2
+
+/*
+ * The IDs of the various system clocks (for POSIX.1b interval timers):
+ */
+#define CLOCK_REALTIME			0
+#define CLOCK_MONOTONIC			1
+#define CLOCK_PROCESS_CPUTIME_ID	2
+#define CLOCK_THREAD_CPUTIME_ID		3
+#define CLOCK_MONOTONIC_RAW		4
+#define CLOCK_REALTIME_COARSE		5
+#define CLOCK_MONOTONIC_COARSE		6
+#define CLOCK_BOOTTIME			7
+#define CLOCK_REALTIME_ALARM		8
+#define CLOCK_BOOTTIME_ALARM		9
+
+/*
+ * The various flags for setting POSIX.1b interval timers:
+ */
+#define TIMER_ABSTIME			0x01
 
 /* Only the generic macros and types may be defined here. The arch-specific
  * ones such as the O_RDONLY and related macros used by fcntl() and open(), or
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
