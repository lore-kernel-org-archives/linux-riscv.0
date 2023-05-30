Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4BBC77B73
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 10:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NjTgnDwB5a6aANukjFVLjqTRaXGqjXaoz2JCdEhqnlc=; b=Mjc1vBp1k9T6SL
	ns7rf6FTn4dC4ugFrv/O7Wce/E/WQYUfmQF7pG0VLFPNFCAsnxIQIOj9g3ThA6E1OULcLCPKWODIZ
	k+Ug28tvEa3bgySJwNG+m8Z7RRoT9OIjEZ3VU7s/Mt3is6ozPJyqniGNNpnqyCX3qE1KnQJYVjcR7
	OBawRHNRL13Au303uBYtQ6Gs0xvddYIz/F90YiktF9hR43LBBqZnqF3xBurfaVyzt+t+bEHRu3Bwn
	s06bv0ABKXSLVmiwA5gobVp1fGcmGyuKw2syQl4/afOPLIP+AfSpjQt/f6yIjo8H6MyMcUvIYUaPQ
	ecvYp944U4T15nJwBflA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3x1d-00DWIv-2N;
	Tue, 30 May 2023 10:56:25 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3x1b-00DWFp-1c
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 10:56:25 +0000
X-QQ-mid: bizesmtp72t1685444172tvjqxqzn
Received: from linux-lab-host.localdomain ( [119.123.130.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 May 2023 18:56:11 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: IV30oiqrgAYLeAVOtqPY/w4sV51ufOZgvH9veDK9Ln5rvQZwJVqfvQebBNkb0
	rWdg0XWxELEr+D+JJDpmJRKXEGbTrqUmljotAwMSeKgbivwAh8Yc83kjym3D0j3G2Y/rfbT
	rmDMziIaF1RHSZ0VHwappE4cH+2ibJvPOUXuZeZixvII0+kcxU/CNsIAfWDAPnGiPA/X4Ry
	uhcwpAPuHw//KlJZuq0nj2KBV/mhrO1z6IjLwWZl6tEPenU5NHMlwsxmdxFUZgT39wwGWzW
	zUWW0R3DR8s36VqJKPbbMYeeSntiCd0UAIcDVkGpuo+W1S9x5EyFdJl4W5eKH6bam/lftYQ
	9/imcDdRSqPSe6FQ4g46x2VQalG7yfX6OA+ka7s9XC8huDYjbWd2rJlVOqjkRRquGnxwI1c
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16230640011585094560
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH 1/4] selftests/nolibc: allow rerun with the same settings
Date: Tue, 30 May 2023 18:56:10 +0800
Message-Id: <32d4ec1c3cabae5c1baabf85627b81d6ede01518.1685443199.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685443199.git.falcon@tinylab.org>
References: <cover.1685443199.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_035623_844582_E69A785C 
X-CRM114-Status: GOOD (  17.58  )
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

Record the user settings from NOLIBC_TEST and allow reuse them in
another run iteration.

This allows to rerun the test cases with the same setting.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 46 ++++++++++++--------
 1 file changed, 29 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index fd7515f6b1d2..be718fa5dc86 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -46,6 +46,9 @@ char **environ;
 /* definition of a series of tests */
 struct test {
 	const char *name;              /* test name */
+	int min;
+	int max;
+	int run;
 	int (*func)(int min, int max); /* handler */
 };
 
@@ -940,12 +943,12 @@ int prepare(void)
 }
 
 /* This is the definition of known test names, with their functions */
-static const struct test test_names[] = {
+static struct test test_names[] = {
 	/* add new tests here */
-	{ .name = "syscall",    .func = run_syscall    },
-	{ .name = "stdlib",     .func = run_stdlib     },
-	{ .name = "vfprintf",   .func = run_vfprintf   },
-	{ .name = "protection", .func = run_protection },
+	{ .name = "syscall",    .min = 0, .max = INT_MAX, .run = -1, .func = run_syscall    },
+	{ .name = "stdlib",     .min = 0, .max = INT_MAX, .run = -1, .func = run_stdlib     },
+	{ .name = "vfprintf",   .min = 0, .max = INT_MAX, .run = -1, .func = run_vfprintf   },
+	{ .name = "protection", .min = 0, .max = INT_MAX, .run = -1, .func = run_protection },
 	{ 0 }
 };
 
@@ -994,7 +997,11 @@ int main(int argc, char **argv, char **envp)
 					break;
 			}
 
-			if (test_names[idx].name) {
+			if (!test_names[idx].name) {
+				printf("Ignoring unknown test name '%s'\n", test);
+			} else {
+				test_names[idx].run = 1;
+
 				/* The test was named, it will be called at least
 				 * once. We may have an optional range at <colon>
 				 * here, which defaults to the full range.
@@ -1022,27 +1029,32 @@ int main(int argc, char **argv, char **envp)
 						value = colon;
 					}
 
-					/* now's time to call the test */
-					printf("Running test '%s'\n", test_names[idx].name);
-					err = test_names[idx].func(min, max);
-					ret += err;
-					printf("Errors during this test: %d\n\n", err);
+					test_names[idx].min = min;
+					test_names[idx].max = max;
 				} while (colon && *colon);
-			} else
-				printf("Ignoring unknown test name '%s'\n", test);
+			}
 
 			test = comma;
 		} while (test && *test);
-	} else {
-		/* no test mentioned, run everything */
+
+		/* disable the left tests */
 		for (idx = 0; test_names[idx].name; idx++) {
-			printf("Running test '%s'\n", test_names[idx].name);
-			err = test_names[idx].func(min, max);
+			if (test_names[idx].run != 1)
+				test_names[idx].run = 0;
+		}
+	}
+
+	/* run everything or the test mentioned */
+	for (idx = 0; test_names[idx].name; idx++) {
+		if (test_names[idx].run != 0) {
+			printf("Running test '%s', from %d to %d\n", test_names[idx].name, test_names[idx].min, test_names[idx].max);
+			err = test_names[idx].func(test_names[idx].min, test_names[idx].max);
 			ret += err;
 			printf("Errors during this test: %d\n\n", err);
 		}
 	}
 
+
 	printf("Total number of errors: %d\n", ret);
 
 	if (getpid() == 1) {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
