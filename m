Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A380C77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 11:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ggm5R4H3HxcWy5hporyPtSbVVwFPkTlFVy4BKBViM+E=; b=WFdICjWUq+0sUL
	3l5A6HYo79pU4KMGuOHGzJ1uRWQwS0bLxNXkE4h+8EnEvNu/RA9RtIP3qDstTRN5IwBdik1cfVX+/
	RVxqH0ZB3Uq8HmLYS5+1b1r90/wjRufe7Oj1B8fiBbh6xrHuxhw2/+5aT1Y7oC5TqrsHhq3U8yve3
	47SjPFBmSLFHfwb0Kl3YQsWxCu9bclUnxGh2f2POglqcZoZ54QE4VMqiVt3fEahNwkOQCoZ4jYS5s
	TkieCsMXIPHjhYxeL9kO3dFYpG2fX8mqGhOD6VEf7OpUYAbDqtb/yrpFLZ3FV93HNY1I+/zPSUvtY
	hOHU+sMVJ7aZjHz9zX8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3xAf-00DZpV-2r;
	Tue, 30 May 2023 11:05:45 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3xAc-00DZnr-1O
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 11:05:44 +0000
X-QQ-mid: bizesmtp81t1685444733t0w0xo7y
Received: from linux-lab-host.localdomain ( [119.123.130.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 May 2023 19:05:31 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: qTKqCPEPPMCW9B1ysKllWVaS1wh2y0szvr/5UcMtnZhWY6OZeO5K63HX3I6/W
	atmSrvFCqT6B3PWqAH4eaVk9KM8ij4PXLpSQf/GawIFbw+MFWjENtkYYCm+naDAuhSnhq4o
	+atjjVW3SRGVc0dHTJSWfZkCjNxM95CxppAWnLgiyovSI3Q2XLudaYo7w/UBTy1gAkDjVuH
	FmnLv8kj/vZr2bVMhpwWuT1SvZ9BvFhk0SjKzItfPgeavl68QSlRSlZ6kr5e2b3WIC+1VD3
	4wJ6i6DNRmFbIikucPYfFvJ8S+y5NTMbkGbrrH0vFJWYwDwNgKKXZtTYdpP036OuHTi3Y5e
	E+xAC2HBsqZ+DRTj+RP7AcVM7Do3v5xQzuBIULzGLkcx+0utUD8sFgEwkcye24itOyMdb8z
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1177987213565950779
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH 3/4] selftests/nolibc: add user space efault handler
Date: Tue, 30 May 2023 19:05:29 +0800
Message-Id: <ba63fb0dd083c679249c41cb7d931437ca3598a8.1685443199.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685443199.git.falcon@tinylab.org>
References: <cover.1685443199.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_040542_773359_9E8C9A8E 
X-CRM114-Status: GOOD (  17.01  )
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

Some hooks are added to record the test case and the test context, while
traps on invalid data pointer access, try to continue next test if
possible.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 151 ++++++++++++++++++-
 1 file changed, 149 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index b8fd7fcf56a6..9f9a09529a4f 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -114,6 +114,149 @@ const char *errorname(int err)
 	}
 }
 
+/* emulate EFAULT return in user space with isigaction/sigsetjmp/siglongjmp */
+#ifndef NOLIBC
+#ifndef NO_USER_SPACE_EFAULT
+#define USER_SPACE_EFAULT
+#endif
+#endif
+
+#ifdef USER_SPACE_EFAULT
+#include <setjmp.h>
+
+static int next_test = 0;
+static int test_llen = 0;
+static int test_sig = 0;
+static int expect_sig = 0;
+static int test_idx = 0;
+static int test_ret = 0;
+static int test_iteration = 0;
+static int test_iterations = 0;
+static sigjmp_buf mark;
+
+static int pad_spc(int llen, int cnt, const char *fmt, ...);
+static struct test test_names[];
+typedef int (*func_t)(int min, int max);
+static func_t test_func = NULL;
+
+#define CASE_SIG(sig) \
+	case sig: return #sig
+
+/* returns the signal name or the decimal value for less common ones. */
+const char *signame(int sig)
+{
+	switch (sig) {
+	CASE_SIG(SIGSEGV);
+	default:
+		return itoa(sig);
+	}
+}
+
+static void record_test_context(int idx, int iteration, int iterations)
+{
+	test_idx = idx;
+	test_iteration = iteration;
+	test_iterations = iterations;
+}
+
+static void record_test_case(int test, int llen, int ret, char *name)
+{
+	test_llen = llen - 1;
+	test_ret = ret;
+	next_test = test + 1;
+}
+
+static void restore_from_trap(void)
+{
+	int idx;
+	int err;
+	int i;
+	int min = 0;
+	int max = INT_MAX;
+
+	test_llen += printf(" ! %d %s ", test_sig, signame(test_sig));
+	if (test_sig == expect_sig)
+		pad_spc(test_llen, 64, "[OK]\n");
+	else {
+		test_ret++;
+		pad_spc(test_llen, 64, "[FAIL]\n");
+	}
+
+	if (next_test <= test_names[test_idx].max) {
+		test_func = test_names[test_idx].func;
+		err = test_func(next_test, test_names[test_idx].max);
+		test_ret += err;
+		printf("Errors during this test: %d\n\n", err);
+	}
+
+	for (i = test_iteration; i < test_iterations; i++) {
+		/* for current iterations */
+		if (i == test_iteration) {
+			idx = test_idx + 1;
+		} else {
+			printf("Current iteration: %d\n\n", i + 1);
+
+			/* for left iterations */
+			idx = 0;
+			test_ret = 0;
+		}
+
+		for (; test_names[idx].name; idx++) {
+			if (test_names[idx].run != 0) {
+				printf("Running test '%s'\n", test_names[idx].name);
+				record_test_context(idx, i, test_iterations);
+				err = test_names[idx].func(test_names[idx].min, test_names[idx].max);
+				test_ret += err;
+				printf("Errors during this test: %d\n\n", err);
+			}
+		}
+		printf("Total number of errors in the %d iteration(s): %d\n\n", i + 1, test_ret);
+	}
+}
+
+static void trap_handler(int sig, siginfo_t *si, void *p)
+{
+	test_sig = sig;
+	if (sig != SIGKILL)
+		siglongjmp(mark, -1);
+}
+
+static void register_expect_trap(int experr1, int experr2)
+{
+	if (experr1 == EFAULT || experr2 == EFAULT)
+		expect_sig = SIGSEGV;
+	else
+		expect_sig = 0;
+}
+
+static void register_trap_handler(void)
+{
+	int ret = 0;
+
+	struct sigaction sa = {0};
+	sa.sa_sigaction = trap_handler;
+	sa.sa_flags = SA_SIGINFO;
+	ret = sigaction(SIGSEGV, &sa, NULL);
+	if (ret == -1) {
+		perror("sigaction");
+		exit(1);
+	}
+
+	if (sigsetjmp(mark, 1) != 0) {
+		restore_from_trap();
+		exit(0);
+	}
+}
+
+#define has_user_space_efault() (1)
+#else
+#define record_test_context(idx, iteration, iterations) do { } while (0)
+#define record_test_case(test, llen, name, ret) do { } while (0)
+#define register_expect_trap(experr1, experr2) do { } while (0)
+#define register_trap_handler() do { } while (0)
+#define has_user_space_efault() (0)
+#endif
+
 static void putcharn(char c, size_t n)
 {
 	char buf[64];
@@ -304,7 +447,7 @@ static int expect_sysne(int expr, int llen, int val)
 
 
 #define EXPECT_SYSER2(cond, expr, expret, experr1, experr2)		\
-	do { if (!cond) pad_spc(llen, 64, "[SKIPPED]\n"); else ret += expect_syserr2(expr, expret, experr1, experr2, llen); } while (0)
+	do { if (!cond) pad_spc(llen, 64, "[SKIPPED]\n"); else { register_expect_trap(experr1, experr2); ret += expect_syserr2(expr, expret, experr1, experr2, llen); } } while (0)
 
 #define EXPECT_SYSER(cond, expr, expret, experr)			\
 	EXPECT_SYSER2(cond, expr, expret, experr, 0)
@@ -439,7 +582,7 @@ static int expect_strne(const char *expr, int llen, const char *cmp)
 
 /* declare tests based on line numbers. There must be exactly one test per line. */
 #define CASE_TEST(name) \
-	case __LINE__: llen += printf("%d %s", test, #name);
+	case __LINE__: llen += printf("%d %s", test, #name); record_test_case(test, llen, ret, #name);
 
 
 /* used by some syscall tests below */
@@ -974,6 +1117,9 @@ int main(int argc, char **argv, char **envp)
 	if (getpid() == 1)
 		prepare();
 
+	/* register exception restore support if enabled */
+	register_trap_handler();
+
 	/* the definition of a series of tests comes from either argv[1] or the
 	 * "NOLIBC_TEST" environment variable. It's made of a comma-delimited
 	 * series of test names and optional ranges:
@@ -1071,6 +1217,7 @@ int main(int argc, char **argv, char **envp)
 		for (idx = 0; test_names[idx].name; idx++) {
 			if (test_names[idx].run != 0) {
 				printf("Running test '%s', from %d to %d\n", test_names[idx].name, test_names[idx].min, test_names[idx].max);
+				record_test_context(idx, i, run);
 				err = test_names[idx].func(test_names[idx].min, test_names[idx].max);
 				ret += err;
 				printf("Errors during this test: %d\n\n", err);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
