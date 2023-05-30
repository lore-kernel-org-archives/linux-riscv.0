Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18D3C77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 11:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nn2Yz3WuS3lwDhHQ8qDafXDB+IVP7J55rxbiqmv2L+A=; b=2mtfW+dHGtY+jE
	ahUk5F6T3C38bEMm7lkkPZ1EgZ9nerfb1Ys03F1/BasnjQ4onSZguU09tWnM8RSgxsYuF+bQm9rvt
	w3O6+tlmA/O+taZjQXBsJsPiXqaFRGOnHsM9lnTgxS68nT3SPFKUifko7vuf1ZWOzgUaKcqH1fXKp
	Sc0F6KTN4LZ4wEpdm2DC4dHI2uTv7JDoBwwlX+UFrzqOiH/d+F2WEjTfnoyNKo/004bNznx/Enj6U
	QDo6/SAguw/erx7+1Xg8kJtY+GurXETNOIlzIGxocpvD5J3b3g1JACY3xnqBRIgUGJlO1Jk8how+q
	y3ONnRapvv+5NssoThSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3x8o-00DZCH-2C;
	Tue, 30 May 2023 11:03:50 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3x8f-00DZ6t-2T
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 11:03:44 +0000
X-QQ-mid: bizesmtp67t1685444612t08p4xww
Received: from linux-lab-host.localdomain ( [119.123.130.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 May 2023 19:03:31 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: C46Rb8GPIEc160nmUqFUHiFICVb8yJ5e11pqzLjXmS2/y5C6aYAhQb0+Cg9Tj
	G3ora3iXuOFD2kdO18FYoRZpzosUJ632Ckb/qSW3VPNCJimOOJtBcHY61W3wIe1KHd8Ku/m
	SNaBXZkq2EDAvjm3Z2XXHd9yz9p9K+IWKqic4/ShSxQLPa+MhRk+KsuDEZwgII7hmu9g0Hj
	OD4MUc56yMOVYx8jF1UmiV4xnslxBAOf8TydDIQUBAo1c/pZb2cTMLZhdKOyDiqzb5R5A3t
	sM7sjtpkHDsR1PkkNnf2L64rsCpz9zPGGU8rWiCfNGmSBMcaIdRNSmIkwsJ1IDxPvn6f6Lv
	/tN5H40PTJIIHyFAN1kYgY95zls1dyh5pu+erFw4eSHkrjvLHL//EpzyhXCHPv1LNHhyht+
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17642228944967858726
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH 2/4] selftests/nolibc: add rerun support
Date: Tue, 30 May 2023 19:03:30 +0800
Message-Id: <247d4d69a5e229446fc43efa49cc4fa36ccd600a.1685443199.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685443199.git.falcon@tinylab.org>
References: <cover.1685443199.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_040342_105108_47C84E1E 
X-CRM114-Status: GOOD (  17.16  )
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

The global 'run' setting is added to allow specify the running
iterations, for example:

    NOLIBC_TEST=run:5,syscall:1

This setting allows to run the first syscall for 5 times.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 53 ++++++++++++++------
 1 file changed, 38 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index be718fa5dc86..b8fd7fcf56a6 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -956,9 +956,12 @@ int main(int argc, char **argv, char **envp)
 {
 	int min = 0;
 	int max = INT_MAX;
+	int run = 1;
+	int selected = 0;
 	int ret = 0;
 	int err;
 	int idx;
+	int i;
 	char *test;
 
 	environ = envp;
@@ -974,7 +977,7 @@ int main(int argc, char **argv, char **envp)
 	/* the definition of a series of tests comes from either argv[1] or the
 	 * "NOLIBC_TEST" environment variable. It's made of a comma-delimited
 	 * series of test names and optional ranges:
-	 *    syscall:5-15[:.*],stdlib:8-10
+	 *    run:3,syscall:5-15[:.*],stdlib:8-10
 	 */
 	test = argv[1];
 	if (!test)
@@ -992,14 +995,27 @@ int main(int argc, char **argv, char **envp)
 			if (colon)
 				*(colon++) = '\0';
 
-			for (idx = 0; test_names[idx].name; idx++) {
-				if (strcmp(test, test_names[idx].name) == 0)
+			if (strcmp(test, "run") != 0) {
+				for (idx = 0; test_names[idx].name; idx++) {
+					if (strcmp(test, test_names[idx].name) == 0)
+						break;
+				}
+			} else {
+				value = colon;
+				if (value && *value)
+					run = atoi(value);
+
+				test = comma;
+				if (test && *test)
+					continue;
+				else
 					break;
 			}
 
 			if (!test_names[idx].name) {
 				printf("Ignoring unknown test name '%s'\n", test);
 			} else {
+				selected++;
 				test_names[idx].run = 1;
 
 				/* The test was named, it will be called at least
@@ -1038,24 +1054,31 @@ int main(int argc, char **argv, char **envp)
 		} while (test && *test);
 
 		/* disable the left tests */
-		for (idx = 0; test_names[idx].name; idx++) {
-			if (test_names[idx].run != 1)
-				test_names[idx].run = 0;
+		if (selected != 0) {
+			for (idx = 0; test_names[idx].name; idx++) {
+				if (test_names[idx].run != 1)
+					test_names[idx].run = 0;
+			}
 		}
 	}
 
 	/* run everything or the test mentioned */
-	for (idx = 0; test_names[idx].name; idx++) {
-		if (test_names[idx].run != 0) {
-			printf("Running test '%s', from %d to %d\n", test_names[idx].name, test_names[idx].min, test_names[idx].max);
-			err = test_names[idx].func(test_names[idx].min, test_names[idx].max);
-			ret += err;
-			printf("Errors during this test: %d\n\n", err);
-		}
-	}
+	printf("Running iteration(s): %d\n\n", run);
+	for (i = 0; i < run; i++) {
+		printf("Current iteration: %d\n\n", i + 1);
 
+		ret = 0;
+		for (idx = 0; test_names[idx].name; idx++) {
+			if (test_names[idx].run != 0) {
+				printf("Running test '%s', from %d to %d\n", test_names[idx].name, test_names[idx].min, test_names[idx].max);
+				err = test_names[idx].func(test_names[idx].min, test_names[idx].max);
+				ret += err;
+				printf("Errors during this test: %d\n\n", err);
+			}
+		}
 
-	printf("Total number of errors: %d\n", ret);
+		printf("Total number of errors in the %d iteration(s): %d\n\n", i + 1, ret);
+	}
 
 	if (getpid() == 1) {
 		/* we're running as init, there's no other process on the
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
